Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.ott.cti.com>) id 1Md81q-0001uU-Ib
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Aug 2009 21:38:02 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 7620C4F5F46;
	Mon, 17 Aug 2009 15:21:03 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 21576-05; Mon, 17 Aug 2009 15:21:03 -0400 (EDT)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id 4DE6D5150D2; Mon, 17 Aug 2009 15:21:03 -0400 (EDT)
X-Spam-Score: 
X-Spam-Checker-Version: SpamAssassin 3.1.8 (2007-02-13) on sid.cbnco.com
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=7.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.1.8
Received: from sles10-64.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id DD5A74E99CF;
	Mon, 17 Aug 2009 15:21:01 -0400 (EDT)
Received: by sles10-64.ott.cti.com (Postfix, from userid 1000)
	id C7F9CA0C0D6; Mon, 17 Aug 2009 15:21:01 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Aug 2009 15:21:00 -0400
Message-Id: <1250536860-9140-1-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.6.3
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: [PATCH] package_deb: create md5sums control files
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
X-List-Received-Date: Mon, 17 Aug 2009 19:38:03 -0000

These are created with the package and get installed in
/var/dpkg/info. Afterward it's a great way to find modified files
for backup with a little shell script magic.

It feels a bit weird to still use MD5, but that seems to be the
convention in the Debian world.

Signed-off-by: Michael Smith <msmith@cbnco.com>
---
 classes/package.bbclass     |   45 +++++++++++++++++++++++++++++++++++++++++++
 classes/package_deb.bbclass |    7 ++++++
 2 files changed, 52 insertions(+), 0 deletions(-)

diff --git a/classes/package.bbclass b/classes/package.bbclass
index f6bd7c5..e3f55b5 100644
--- a/classes/package.bbclass
+++ b/classes/package.bbclass
@@ -202,6 +202,51 @@ def runstrip(file, d):
 
     return 1
 
+def write_package_md5sums (root, outfile, ignorepaths):
+    # For each regular file under root, writes an md5sum to outfile.
+    # With thanks to patch.bbclass.
+    import bb, os
+
+    try:
+        # Python 2.5+
+        import hashlib
+        ctor = hashlib.md5
+    except ImportError:
+        import md5
+        ctor = md5.new
+
+    outf = file(outfile, 'w')
+
+    # Each output line looks like: "<hex...>  <filename without leading slash>"
+    striplen = len(root)
+    if not root.endswith('/'):
+        striplen += 1
+
+    for walkroot, dirs, files in os.walk(root):
+        # Skip e.g. the DEBIAN directory
+        if walkroot[striplen:] in ignorepaths:
+            dirs[:] = []
+            continue
+
+        for name in files:
+            fullpath = os.path.join(walkroot, name)
+            if os.path.islink(fullpath) or (not os.path.isfile(fullpath)):
+                continue
+
+            m = ctor()
+            f = file(fullpath, 'rb')
+            while True:
+                d = f.read(8192)
+                if not d:
+                    break
+                m.update(d)
+            f.close()
+
+            print >> outf, "%s  %s" % (m.hexdigest(), fullpath[striplen:])
+            
+    outf.close()
+
+
 #
 # Package data handling routines
 #
diff --git a/classes/package_deb.bbclass b/classes/package_deb.bbclass
index e5339a9..4a17010 100644
--- a/classes/package_deb.bbclass
+++ b/classes/package_deb.bbclass
@@ -243,6 +243,13 @@ python do_package_deb () {
                 conffiles.write('%s\n' % f)
             conffiles.close()
 
+        try:
+            write_package_md5sums(root, os.path.join(controldir, 'md5sums'),
+                                  ['DEBIAN'])
+        except:
+            bb.utils.unlockfile(lf)
+            raise
+
         os.chdir(basedir)
         ret = os.system("PATH=\"%s\" fakeroot dpkg-deb -b %s %s" % (bb.data.getVar("PATH", localdata, 1), root, pkgoutdir))
         if ret != 0:
-- 
1.6.3



