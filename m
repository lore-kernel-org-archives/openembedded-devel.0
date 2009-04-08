Received: from [65.200.49.156] (helo=Seeker.local)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@Seeker.local>) id 1Lrb3y-0007fu-DV
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Apr 2009 18:55:50 +0200
Received: by Seeker.local (Postfix, from userid 502)
	id C210DB4007C; Wed,  8 Apr 2009 09:52:36 -0700 (MST)
From: Chris Larson <clarson@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Apr 2009 09:52:35 -0700
Message-Id: <1239209556-847-1-git-send-email-clarson@mvista.com>
X-Mailer: git-send-email 1.6.0.2
X-SA-Exim-Connect-IP: 65.200.49.156
X-SA-Exim-Mail-From: kergoth@Seeker.local
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=BAYES_00,NO_DNS_FOR_FROM,
	RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] First pass of cleanup of messages outputted to the user.
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

OpenEmbedded outputs a lot of messages that the user is likely to never
care about.  We should only output something when it reflects upon their
recipe (i.e. unpacking their sources, applying their patches), or is quite
significant or unusual.

Signed-off-by: Chris Larson <clarson@mvista.com>
---
 classes/base.bbclass             |   17 +++--------------
 classes/insane.bbclass           |   14 +++++++-------
 classes/package.bbclass          |    4 ++--
 classes/packaged-staging.bbclass |    6 +++---
 4 files changed, 15 insertions(+), 26 deletions(-)

diff --git a/classes/base.bbclass b/classes/base.bbclass
index 9ec705b..7cfebf2 100644
--- a/classes/base.bbclass
+++ b/classes/base.bbclass
@@ -890,22 +890,11 @@ python base_eventhandler() {
 	from bb.event import Handled, NotHandled, getName
 	import os
 
-	messages = {}
-	messages["Completed"] = "completed"
-	messages["Succeeded"] = "completed"
-	messages["Started"] = "started"
-	messages["Failed"] = "failed"
-
 	name = getName(e)
-	msg = ""
-	if name.startswith("Task"):
-		msg += "package %s: task %s: " % (data.getVar("PF", e.data, 1), e.task)
-		msg += messages.get(name[4:]) or name[4:]
-	elif name.startswith("Build"):
-		msg += "build %s: " % e.name
-		msg += messages.get(name[5:]) or name[5:]
+	if name == "TaskCompleted":
+		msg = "package %s: task %s is complete." % (data.getVar("PF", e.data, 1), e.task)
 	elif name == "UnsatisfiedDep":
-		msg += "package %s: dependency %s %s" % (e.pkg, e.dep, name[:-3].lower())
+		msg = "package %s: dependency %s %s" % (e.pkg, e.dep, name[:-3].lower())
 	else:
 		return NotHandled
 
diff --git a/classes/insane.bbclass b/classes/insane.bbclass
index 48964af..4496e15 100644
--- a/classes/insane.bbclass
+++ b/classes/insane.bbclass
@@ -215,7 +215,7 @@ def package_qa_write_error(error_class, name, path, d):
 
 def package_qa_handle_error(error_class, error_msg, name, path, d):
     import bb
-    bb.error("QA Issue: %s" % error_msg)
+    bb.error("QA Issue with %s: %s" % (name, error_msg))
     package_qa_write_error(error_class, name, path, d)
     return not package_qa_make_fatal_error(error_class, name, path, d)
 
@@ -481,7 +481,7 @@ def package_qa_check_rdepends(pkg, workdir, d):
 # The PACKAGE FUNC to scan each package
 python do_package_qa () {
     import bb
-    bb.note("DO PACKAGE QA")
+    bb.debug(2, "DO PACKAGE QA")
     workdir = bb.data.getVar('WORKDIR', d, True)
     packages = bb.data.getVar('PACKAGES',d, True)
 
@@ -496,10 +496,10 @@ python do_package_qa () {
     rdepends_sane = True
     for package in packages.split():
         if bb.data.getVar('INSANE_SKIP_' + package, d, True):
-            bb.note("Package: %s (skipped)" % package)
+            bb.note("package %s skipped" % package)
             continue
 
-        bb.note("Checking Package: %s" % package)
+        bb.debug(1, "Checking Package: %s" % package)
         path = "%s/install/%s" % (workdir, package)
         if not package_qa_walk(path, checks, package, d):
             walk_sane  = False
@@ -508,14 +508,14 @@ python do_package_qa () {
 
     if not walk_sane or not rdepends_sane:
         bb.fatal("QA run found fatal errors. Please consider fixing them.")
-    bb.note("DONE with PACKAGE QA")
+    bb.debug(2, "DONE with PACKAGE QA")
 }
 
 
 # The Staging Func, to check all staging
 addtask qa_staging after do_populate_staging before do_build
 python do_qa_staging() {
-    bb.note("QA checking staging")
+    bb.debug(2, "QA checking staging")
 
     if not package_qa_check_staged(bb.data.getVar('STAGING_LIBDIR',d,True), d):
         bb.fatal("QA staging was broken by the package built above")
@@ -524,7 +524,7 @@ python do_qa_staging() {
 # Check broken config.log files
 addtask qa_configure after do_configure before do_compile
 python do_qa_configure() {
-    bb.note("Checking sanity of the config.log file")
+    bb.debug(1, "Checking sanity of the config.log file")
     import os
     for root, dirs, files in os.walk(bb.data.getVar('WORKDIR', d, True)):
         statement = "grep 'CROSS COMPILE Badness:' %s > /dev/null" % \
diff --git a/classes/package.bbclass b/classes/package.bbclass
index 7a61c5a..3a30d38 100644
--- a/classes/package.bbclass
+++ b/classes/package.bbclass
@@ -166,7 +166,7 @@ def runstrip(file, d):
     # If the file is in a .debug directory it was already stripped,
     # don't do it again...
     if os.path.dirname(file).endswith(".debug"):
-        bb.note("Already ran strip")
+        bb.debug(2, "Already ran strip on %s" % file)
         return 0
 
     strip = bb.data.getVar("STRIP", d, 1)
@@ -560,7 +560,7 @@ python package_do_shlibs() {
 
 	exclude_shlibs = bb.data.getVar('EXCLUDE_FROM_SHLIBS', d, 0)
 	if exclude_shlibs:
-		bb.note("not generating shlibs")
+		bb.debug(1, "not generating shlibs")
 		return
 		
 	lib_re = re.compile("^lib.*\.so")
diff --git a/classes/packaged-staging.bbclass b/classes/packaged-staging.bbclass
index 849f60c..82c1a0d 100644
--- a/classes/packaged-staging.bbclass
+++ b/classes/packaged-staging.bbclass
@@ -109,17 +109,17 @@ def pstage_cleanpackage(pkgname, d):
 	pstage_set_pkgmanager(d)
 	list_cmd = bb.data.getVar("PSTAGE_LIST_CMD", d, True)
 
-	bb.note("Checking if staging package installed")
+	bb.debug(2, "Checking if staging package installed")
 	lf = bb.utils.lockfile(bb.data.expand("${STAGING_DIR}/staging.lock", d))
 	ret = os.system("PATH=\"%s\" %s | grep %s" % (path, list_cmd, pkgname))
 	if ret == 0:
-		bb.note("Yes. Uninstalling package from staging...")
+		bb.debug(1, "Uninstalling package from staging...")
 		removecmd = bb.data.getVar("PSTAGE_REMOVE_CMD", d, 1)
 		ret = os.system("PATH=\"%s\" %s %s" % (path, removecmd, pkgname))
 		if ret != 0:
 			bb.note("Failure removing staging package")
 	else:
-		bb.note("No. Manually removing any installed files")
+		bb.debug(1, "Manually removing any installed files from staging...")
 		pstage_manualclean("staging", "STAGING_DIR", d)
 		pstage_manualclean("cross", "CROSS_DIR", d)
 		pstage_manualclean("deploy", "DEPLOY_DIR", d)
-- 
1.6.0.2



