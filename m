Received: from [68.230.241.40] (helo=fed1rmmtao106.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1Lx3HO-0005YY-0b
	for openembedded-devel@openembedded.org; Thu, 23 Apr 2009 20:04:10 +0200
Received: from fed1rmimpo02.cox.net ([70.169.32.72]) by fed1rmmtao106.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090423175928.BPCL22254.fed1rmmtao106.cox.net@fed1rmimpo02.cox.net>
	for <openembedded-devel@openembedded.org>;
	Thu, 23 Apr 2009 13:59:28 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo02.cox.net with bizsmtp
	id j5zU1b0094dMFYL045zUSV; Thu, 23 Apr 2009 13:59:28 -0400
X-Authority-Analysis: v=1.0 c=1 a=j2xr_uPP7bMA:10 a=h1qw8TbwuK8A:10
	a=4HVRqb_MAAAA:8 a=s-HKjR4mu03Rw8QB3PcA:9 a=_HgZ4TeZuNrrvJd4X2kA:7
	a=9-cIj0lqQCJvicV16eV2xKDdyxwA:4 a=k-kO48AawpMA:10
X-CM-Score: 0.00
Date: Thu, 23 Apr 2009 10:59:28 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: OpenEmbedded Devel List <openembedded-devel@openembedded.org>
Message-ID: <20090423175928.GE12956@smtp.west.cox.net>
MIME-Version: 1.0
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: [PATCH] Teach insane.bbclass to ignore SDK packages wrt -dev and	.so check
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
X-List-Received-Date: Thu, 23 Apr 2009 18:04:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

With the change to make having libfoo.so symlinks in the main package
become fatal (along with GNU_HASH) SDK stuff is broken now.  At Richard's
suggestion, the following patch teaches insane.bbclass to not run the
-dev check on sdk||canadian-sdk recipes.

I did this by splitting the devdbg check into two separate checks
(rather than re-order the checks as we do want to pull dbg stuff out).
This also clarifies the comments to both.  As an aside, yes we bail out
if say a file named Kconfig.debug ends up in a package.

Signed-off-by: Tom Rini <trini@embeddedalley.com>

diff --git a/classes/insane.bbclass b/classes/insane.bbclass
index 584a5f1..cc881dc 100644
--- a/classes/insane.bbclass
+++ b/classes/insane.bbclass
@@ -250,21 +250,35 @@ def package_qa_check_rpath(file,name,d, elf):
 
     return sane
 
-def package_qa_check_devdbg(path, name,d, elf):
+def package_qa_check_dev(path, name,d, elf):
     """
-    Check for debug remains inside the binary or
-    non dev packages containing
+    Check for ".so" library symlinks in non-dev packages
     """
 
     import bb, os
     sane = True
 
+    # SDK packages are special.
+    for s in ['sdk', 'canadian-sdk']:
+        if bb.data.inherits_class(s, d):
+            return True
+
     if not "-dev" in name:
         if path[-3:] == ".so" and os.path.islink(path):
             error_msg = "non -dev package contains symlink .so: %s path '%s'" % \
                      (name, package_qa_clean_path(path,d))
             sane = package_qa_handle_error(0, error_msg, name, path, d)
 
+    return sane
+
+def package_qa_check_dbg(path, name,d, elf):
+    """
+    Check for ".debug" files or directories outside of the dbg package
+    """
+
+    import bb, os
+    sane = True
+
     if not "-dbg" in name:
         if '.debug' in path:
             error_msg = "non debug package contains .debug directory: %s path %s" % \
@@ -493,9 +507,10 @@ python do_package_qa () {
     if not packages:
         return
 
-    checks = [package_qa_check_rpath, package_qa_check_devdbg,
+    checks = [package_qa_check_rpath, package_qa_check_dev,
               package_qa_check_perm, package_qa_check_arch,
-              package_qa_check_desktop, package_qa_hash_style]
+              package_qa_check_desktop, package_qa_hash_style,
+              package_qa_check_dbg]
     walk_sane = True
     rdepends_sane = True
     for package in packages.split():

-- 
Tom Rini


