Received: from [63.81.120.158] (helo=gateway-1237.mvista.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <clarson@mvista.com>) id 1LpAoQ-0003JS-Vf
	for openembedded-devel@openembedded.org; Thu, 02 Apr 2009 02:29:51 +0200
Received: from localhost.localdomain (rtow4.mvista.com [10.0.12.53])
	by hermes.mvista.com (Postfix) with ESMTP
	id 95D8C18EB8; Wed,  1 Apr 2009 17:27:18 -0700 (PDT)
From: Chris Larson <clarson@mvista.com>
To: openembedded-devel@openembedded.org
Date: Wed,  1 Apr 2009 17:27:17 -0700
Message-Id: <12386320381719-git-send-email-clarson@mvista.com>
X-Mailer: git-send-email 1.5.2.1
X-SA-Exim-Connect-IP: 63.81.120.158
X-SA-Exim-Mail-From: clarson@mvista.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/2] bitbake.conf, collections.inc: Add COLLECTIONS mechanism w/ a sane default.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Apr 2009 00:29:52 -0000

Added code which takes a list of directories in COLLECTIONS, in priority
order (highest to lowest), and uses those to populate BBFILES,
BBFILE_COLLECTIONS, BBFILE_PATTERN_*, and BBFILE_PRIORITY_*.

The default COLLECTIONS is based on BBPATH, so you can now specify a sane
BBPATH, not bother setting up the collections variables or BBFILES, and
still likely be able to do a build.

Signed-off-by: Chris Larson <clarson@mvista.com>
---
 conf/bitbake.conf    |    1 +
 conf/collections.inc |   55 ++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 56 insertions(+), 0 deletions(-)
 create mode 100644 conf/collections.inc

diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index 7c159af..134525a 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -620,6 +620,7 @@ OVERRIDES = "local:${MACHINE}:${DISTRO}:${TARGET_OS}:${TARGET_ARCH}:build-${BUIL
 # Include the rest of the config files.
 ##################################################################
 
+require conf/collections.inc
 include conf/site.conf
 include conf/auto.conf
 include conf/local.conf
diff --git a/conf/collections.inc b/conf/collections.inc
new file mode 100644
index 0000000..9355b00
--- /dev/null
+++ b/conf/collections.inc
@@ -0,0 +1,55 @@
+# Take a list of directories in COLLECTIONS, in priority order (highest to
+# lowest), and use those to populate BBFILES, BBFILE_COLLECTIONS,
+# BBFILE_PATTERN_*, and BBFILE_PRIORITY_*.
+
+COLLECTIONS = "${@' '.join(d.getVar('BBPATH', 1).split(':'))}"
+
+def collections_setup(d):
+    """ Populate collection and bbfiles metadata from the COLLECTIONS var. """
+    import bb
+    import os
+    from itertools import izip, chain
+    from glob import glob
+
+    def setifunset(k, v):
+        if d.getVar(k, 0) is None:
+            d.setVar(k, v)
+
+    collections = d.getVar("COLLECTIONS", 1)
+    if not collections:
+        return
+    globbed = (glob(path) for path in collections.split())
+    collections = list(chain(*globbed))
+
+    collectionmap = {}
+    namemap = {}
+    for collection in collections:
+        basename = os.path.basename(collection).split(os.path.extsep)[0]
+        if namemap.get(basename):
+            basename = "%s-%s" % (basename, hash(collection))
+        namemap[basename] = collection
+        collectionmap[collection] = basename
+
+    for (collection, priority) in izip(collections, xrange(len(collections), 0, -1)):
+        if not os.path.exists(collection):
+            bb.fatal("Collection %s does not exist" % collection)
+
+        name = collectionmap[collection]
+        if not name:
+            bb.fatal("Unable to determine collection name for %s" % collection)
+
+        setifunset("BBFILE_PATTERN_%s" % name, "^%s/" % collection)
+        setifunset("BBFILE_PRIORITY_%s" % name, str(priority))
+
+    setifunset("BBFILE_COLLECTIONS", " ".join(collectionmap.values()))
+    setifunset("BBFILES", " ".join(collectionmap.keys()))
+
+addhandler collections_eh
+python collections_eh () {
+    from bb.event import getName
+
+    if getName(e) == "ConfigParsed":
+        collections_setup(e.data)
+
+    return NotHandled
+}
-- 
1.5.2.1



