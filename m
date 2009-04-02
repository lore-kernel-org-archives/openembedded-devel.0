Received: from [63.81.120.158] (helo=gateway-1237.mvista.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <clarson@mvista.com>) id 1LpAoR-0003JT-4u
	for openembedded-devel@openembedded.org; Thu, 02 Apr 2009 02:29:52 +0200
Received: from localhost.localdomain (rtow4.mvista.com [10.0.12.53])
	by hermes.mvista.com (Postfix) with ESMTP
	id 2D34D19388; Wed,  1 Apr 2009 17:27:19 -0700 (PDT)
From: Chris Larson <clarson@mvista.com>
To: openembedded-devel@openembedded.org
Date: Wed,  1 Apr 2009 17:27:18 -0700
Message-Id: <12386320392475-git-send-email-clarson@mvista.com>
X-Mailer: git-send-email 1.5.2.1
In-Reply-To: <12386320381719-git-send-email-clarson@mvista.com>
References: <12386320381719-git-send-email-clarson@mvista.com>
X-SA-Exim-Connect-IP: 63.81.120.158
X-SA-Exim-Mail-From: clarson@mvista.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/2] collections.inc: add support for collection archives.
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

From: Chris Larson <clarson@kergoth.com>

Adds the ability to specify an archive in COLLECTIONS.  Any archives of a
supported format (default tar.gz/tgz/tar.X, tar.bz2/tbz/tbz2, zip/jar) will be
unpacked into COLLECTIONS_UNPACKDIR and used from there.  The default value of COLLECTIONS_UNPACKDIR is ${TMPDIR}/collections.

Signed-off-by: Chris Larson <clarson@kergoth.com>
---
 conf/collections.inc |   73 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 73 insertions(+), 0 deletions(-)

diff --git a/conf/collections.inc b/conf/collections.inc
index 9355b00..e692811 100644
--- a/conf/collections.inc
+++ b/conf/collections.inc
@@ -1,8 +1,72 @@
 # Take a list of directories in COLLECTIONS, in priority order (highest to
 # lowest), and use those to populate BBFILES, BBFILE_COLLECTIONS,
 # BBFILE_PATTERN_*, and BBFILE_PRIORITY_*.
+#
+# Specifying an archive in COLLECTIONS is also supported.  Any archives of a
+# supported format will be unpacked into COLLECTIONS_UNPACKDIR and used from
+# there.
 
 COLLECTIONS = "${@' '.join(d.getVar('BBPATH', 1).split(':'))}"
+COLLECTIONS_UNPACKDIR = "${TMPDIR}/collections"
+
+def collection_unpack(collection, name, d):
+    """ Unpack a collection archive and return the path to it. """
+    import bb
+    import os
+    from md5 import md5
+
+    handlers = {
+        ("tar"): "tar x --no-same-owner -f %s",
+        ("tar.gz", "tgz", "tar.Z"): "tar xz --no-same-owner -f %s",
+        ("tar.bz2", "tbz", "tbz2"): "tar xj --no-same-owner -f %s",
+        ("zip", "jar"): "unzip -q -o %s",
+    }
+
+    outpath = os.path.join(d.getVar("COLLECTIONS_UNPACKDIR", 1), name)
+
+    try:
+        collectiondata = open(collection, "r").read()
+    except IOError:
+        bb.fatal("Unable to open %s to calculate md5 sum" % collection)
+
+    md5obj = md5()
+    md5obj.update(collectiondata)
+    md5sum = md5obj.hexdigest()
+
+    md5file = os.path.join(outpath, "md5")
+    if os.path.exists(md5file):
+        try:
+            oldmd5sum = open(md5file).read()
+        except IOError:
+            pass
+        else:
+            if oldmd5sum == md5sum:
+                bb.debug(1, "Using existing %s for collection %s" % (outpath, name))
+                return outpath
+
+        bb.note("Removing old unpacked collection at %s" % outpath)
+        os.system("rm -rf %s" % outpath)
+
+    try:
+        cmd = (cmd for (exts, cmd) in handlers.iteritems()
+                   for e in exts
+                   if collection.endswith(e)).next()
+        cmd = "cd %s && PATH=\"%s\" %s" % (outpath, d.getVar("PATH", 1), cmd)
+    except StopIteration:
+        bb.fatal("Unable to find unpack handler for %s" % collection)
+
+    if not os.path.isdir(outpath):
+        os.makedirs(outpath)
+
+    bb.note("Unpacking %s to %s/" % (collection, outpath))
+    ret = os.system(cmd % collection)
+    if ret != 0:
+        bb.fatal("Unable to unpack %s" % collection)
+
+    md5out = open(md5file, "w")
+    md5out.write(md5sum)
+    md5out.close()
+    return outpath
 
 def collections_setup(d):
     """ Populate collection and bbfiles metadata from the COLLECTIONS var. """
@@ -38,6 +102,15 @@ def collections_setup(d):
         if not name:
             bb.fatal("Unable to determine collection name for %s" % collection)
 
+        if not os.path.isdir(collection):
+            del collectionmap[collection]
+            unpacked = collection_unpack(collection, name, d)
+            if unpacked:
+                collection = unpacked
+                collectionmap[collection] = name
+            else:
+                bb.fatal("Unable to unpack collection %s" % collection)
+
         setifunset("BBFILE_PATTERN_%s" % name, "^%s/" % collection)
         setifunset("BBFILE_PRIORITY_%s" % name, str(priority))
 
-- 
1.5.2.1



