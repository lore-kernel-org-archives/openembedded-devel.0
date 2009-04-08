Received: from [65.200.49.156] (helo=Seeker.local)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@Seeker.local>) id 1Lrb3z-0007fv-NA
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Apr 2009 18:55:50 +0200
Received: by Seeker.local (Postfix, from userid 502)
	id CCB93B4007D; Wed,  8 Apr 2009 09:52:36 -0700 (MST)
From: Chris Larson <clarson@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Apr 2009 09:52:36 -0700
Message-Id: <1239209556-847-2-git-send-email-clarson@mvista.com>
X-Mailer: git-send-email 1.6.0.2
In-Reply-To: <1239209556-847-1-git-send-email-clarson@mvista.com>
References: <1239209556-847-1-git-send-email-clarson@mvista.com>
X-SA-Exim-Connect-IP: 65.200.49.156
X-SA-Exim-Mail-From: kergoth@Seeker.local
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=BAYES_00,NO_DNS_FOR_FROM,
	RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] Shorten some full paths printed to the user.
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
X-List-Received-Date: Wed, 08 Apr 2009 16:55:50 -0000

Adds a base_path_out convenience function, which prepares a full path for
display to the user.  The initial implementation just makes it relative to
${TOPDIR}.  This function is then used for some messages outputted to the
user (packaged-staging, patch application, clean, unpack tasks).

Signed-off-by: Chris Larson <clarson@mvista.com>
---
 classes/base.bbclass             |   17 +++++++++++++----
 classes/packaged-staging.bbclass |    2 +-
 classes/patch.bbclass            |    2 +-
 3 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/classes/base.bbclass b/classes/base.bbclass
index 7cfebf2..500e39a 100644
--- a/classes/base.bbclass
+++ b/classes/base.bbclass
@@ -39,6 +39,14 @@ def base_path_relative(src, dest):
 
     return sep.join(relpath)
 
+def base_path_out(path, d):
+    """ Prepare a path for display to the user. """
+    rel = base_path_relative(d.getVar("TOPDIR", 1), path)
+    if len(rel) > len(path):
+        return path
+    else:
+        return rel
+
 # for MD5/SHA handling
 def base_chk_load_parser(config_path):
     import ConfigParser, os, bb
@@ -70,6 +78,7 @@ def base_chk_file(parser, pn, pv, src_uri, localpath, data):
 
     # md5 and sha256 should be valid now
     if not os.path.exists(localpath):
+        localpath = base_path_out(localpath, data)
         bb.note("The localpath does not exist '%s'" % localpath)
         raise Exception("The path does not exist '%s'" % localpath)
 
@@ -496,11 +505,11 @@ python base_do_clean() {
 	"""clear the build and temp directories"""
 	dir = bb.data.expand("${WORKDIR}", d)
 	if dir == '//': raise bb.build.FuncFailed("wrong DATADIR")
-	bb.note("removing " + dir)
+	bb.note("removing " + base_path_out(dir, d))
 	os.system('rm -rf ' + dir)
 
 	dir = "%s.*" % bb.data.expand(bb.data.getVar('STAMP', d), d)
-	bb.note("removing " + dir)
+	bb.note("removing " + base_path_out(dir, d))
 	os.system('rm -f '+ dir)
 }
 
@@ -555,7 +564,7 @@ python base_do_distclean() {
 		except bb.MalformedUrl, e:
 			bb.debug(1, 'Unable to generate local path for malformed uri: %s' % e)
 		else:
-			bb.note("removing %s" % local)
+			bb.note("removing %s" % base_path_out(local, d))
 			try:
 				if os.path.exists(local + ".md5"):
 					os.remove(local + ".md5")
@@ -771,7 +780,7 @@ def oe_unpack_file(file, data, url = None):
 		os.chdir(newdir)
 
 	cmd = "PATH=\"%s\" %s" % (bb.data.getVar('PATH', data, 1), cmd)
-	bb.note("Unpacking %s to %s/" % (file, os.getcwd()))
+	bb.note("Unpacking %s to %s/" % (base_path_out(file, data), base_path_out(os.getcwd(), data)))
 	ret = os.system(cmd)
 
 	os.chdir(save_cwd)
diff --git a/classes/packaged-staging.bbclass b/classes/packaged-staging.bbclass
index 82c1a0d..bd7b9ea 100644
--- a/classes/packaged-staging.bbclass
+++ b/classes/packaged-staging.bbclass
@@ -135,7 +135,7 @@ do_clean_prepend() {
 	pstage_cleanpackage(removepkg, d)
 
 	stagepkg = bb.data.expand("${PSTAGE_PKG}", d)
-	bb.note("Removing staging package %s" % stagepkg)
+	bb.note("Removing staging package %s" % base_path_out(stagepkg, d))
 	os.system('rm -rf ' + stagepkg)
 }
 
diff --git a/classes/patch.bbclass b/classes/patch.bbclass
index 075e826..cce8289 100644
--- a/classes/patch.bbclass
+++ b/classes/patch.bbclass
@@ -519,7 +519,7 @@ python patch_do_patch() {
 				bb.note("Patch '%s' applies to earlier revisions" % pname)
 				continue
 
-		bb.note("Applying patch '%s' (%s)" % (pname, unpacked))
+		bb.note("Applying patch '%s' (%s)" % (pname, base_path_out(unpacked, d)))
 		try:
 			patchset.Import({"file":unpacked, "remote":url, "strippath": pnum}, True)
 		except:
-- 
1.6.0.2



