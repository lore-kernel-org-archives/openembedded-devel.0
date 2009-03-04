Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hrw@juszkiewicz.com.pl>) id 1LetaV-0005Zf-2h
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 17:04:59 +0100
Received: (qmail 27331 invoked by uid 813007); 4 Mar 2009 15:53:58 -0000
X-clamdmail: clamdmail 0.18a
Received: from 89.78.173.235 (HELO localhost)
	(smtp?user@juszkiewicz.com.pl@89.78.173.235)
	by 195.149.226.213 with ESMTPA; 4 Mar 2009 15:53:58 -0000
Received: from hrw by localhost with local (Exim 4.69)
	(envelope-from <hrw@hrw.one.pl>)
	id 1LetPr-0001ED-1I; Wed, 04 Mar 2009 16:53:51 +0100
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Mar 2009 16:52:47 +0100
Message-Id: <1236182004-4523-33-git-send-email-openembedded@haerwu.biz>
X-Mailer: git-send-email 1.6.1.3
In-Reply-To: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
References: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
Cc: Richard Purdie <richard@openedhand.com>
Subject: [PATCH 32/70] package_rpm.bbclass: Update against recent packaging changes and start to implement dependency handling. (from Poky)
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
X-List-Received-Date: Wed, 04 Mar 2009 16:05:07 -0000

From: Richard Purdie <richard@openedhand.com>

git-svn-id: https://svn.o-hand.com/repos/poky@5067 311d38ba-8fff-0310-9ca6-ca027cbcb966
---
 classes/package_rpm.bbclass |   76 ++++++++++++++++++++++++++++++------------
 1 files changed, 54 insertions(+), 22 deletions(-)

diff --git a/classes/package_rpm.bbclass b/classes/package_rpm.bbclass
index f0055a1..7c69063 100644
--- a/classes/package_rpm.bbclass
+++ b/classes/package_rpm.bbclass
@@ -1,9 +1,14 @@
 inherit package
-inherit rpm_core
 
 RPMBUILD="rpmbuild --short-circuit ${RPMOPTS}"
 IMAGE_PKGTYPE ?= "rpm"
 
+RPMBUILDPATH="${WORKDIR}/rpm"
+
+RPMOPTS="--rcfile=${WORKDIR}/rpmrc"
+RPMOPTS="--rcfile=${WORKDIR}/rpmrc --target ${TARGET_SYS}"
+RPM="rpm ${RPMOPTS}"
+
 python write_specfile() {
 	from bb import data, build
 	import sys
@@ -56,7 +61,13 @@ python write_specfile() {
 	for var in out_vartranslate.keys():
 		if out_vartranslate[var][0] == "%":
 			continue
-		fd.write("%s\t: %s\n" % (out_vartranslate[var], bb.data.getVar(var, d)))
+		val = bb.data.getVar(var, d, 1)
+		if var == "RDEPENDS":
+			val = val.split()[0]
+		fd.write("%s\t: %s\n" % (out_vartranslate[var], val))
+	rdepends = " ".join(bb.utils.explode_deps(bb.data.getVar('RDEPENDS', d, True)))
+	if rdepends:
+		fd.write("Requires: %s\n" % rdepends)
         fd.write("Release\t: %s\n" % bb.data.expand('${PR}${DISTRO_PR}', d, True)
 	fd.write("Summary\t: .\n")
 
@@ -74,6 +85,8 @@ python write_specfile() {
 
 	# call out rpm -bb on the .spec, thereby creating an rpm
 
+	bb.note(bb.data.expand("${RPMBUILD} -bb ${OUTSPECFILE}", d))
+
 	bb.data.setVar('BUILDSPEC', "${RPMBUILD} -bb ${OUTSPECFILE}\n", d)
 	bb.data.setVarFlag('BUILDSPEC', 'func', '1', d)
 	bb.build.exec_func('BUILDSPEC', d)
@@ -84,51 +97,69 @@ python write_specfile() {
 	bb.movefile(rpm, outrpm)
 }
 
+rpm_prep() {
+	if [ ! -e ${WORKDIR}/rpmrc ]; then
+		mkdir -p ${RPMBUILDPATH}/{SPECS,RPMS/{i386,i586,i686,noarch,ppc,mips,mipsel,arm},SRPMS,SOURCES,BUILD}
+		echo 'macrofiles:/usr/lib/rpm/macros:${WORKDIR}/macros' > ${WORKDIR}/rpmrc
+		echo '%_topdir ${RPMBUILDPATH}' > ${WORKDIR}/macros
+		echo '%_repackage_dir ${WORKDIR}' >> ${WORKDIR}/macros
+	fi
+}
+
 python do_package_rpm () {
-	workdir = bb.data.getVar('WORKDIR', d)
+	workdir = bb.data.getVar('WORKDIR', d, 1)
 	if not workdir:
-		raise bb.build.FuncFailed("WORKDIR not defined")
-	workdir = bb.data.expand(workdir, d)
+		bb.error("WORKDIR not defined, unable to package")
+		return
 
 	import os # path manipulations
-	outdir = bb.data.getVar('DEPLOY_DIR_RPM', d)
+	outdir = bb.data.getVar('DEPLOY_DIR_RPM', d, 1)
 	if not outdir:
-		raise bb.build.FuncFailed("DEPLOY_DIR_RPM not defined")
-	outdir = bb.data.expand(outdir, d)
+		bb.error("DEPLOY_DIR_RPM not defined, unable to package")
+		return
 	bb.mkdirhier(outdir)
 
-	packages = bb.data.getVar('PACKAGES', d)
+	packages = bb.data.getVar('PACKAGES', d, 1)
 	if not packages:
-		packages = "${PN}"
-		bb.data.setVar('FILES', '', d)
-		ddir = bb.data.expand(bb.data.getVar('D', d), d)
-		bb.mkdirhier(ddir)
-		bb.data.setVar(bb.data.expand('FILES_${PN}', d), ''.join([ "./%s" % x for x in os.listdir(ddir)]), d)
-	packages = bb.data.expand(packages, d)
+		bb.debug(1, "PACKAGES not defined, nothing to package")
+		return
+
+	if packages == []:
+		bb.debug(1, "No packages; nothing to do")
+		return
+
+	# If "rpm" comes into overrides the presence of this function causes problems.
+	# Since we don't need it, remove it for now - hacky.
+	bb.data.delVar("do_package_write_rpm", d)
 
 	for pkg in packages.split():
 		localdata = bb.data.createCopy(d)
-		root = "%s/install/%s" % (workdir, pkg)
+		pkgdest = bb.data.getVar('PKGDEST', d, 1)
+		root = "%s/%s" % (pkgdest, pkg)
+
+		lf = bb.utils.lockfile(root + ".lock")
 
 		bb.data.setVar('ROOT', '', localdata)
 		bb.data.setVar('ROOT_%s' % pkg, root, localdata)
-		bb.data.setVar('PKG', pkg, localdata)
+		pkgname = bb.data.getVar('PKG_%s' % pkg, localdata, 1)
+		if not pkgname:
+			pkgname = pkg
+		bb.data.setVar('PKG', pkgname, localdata)
 
 		overrides = bb.data.getVar('OVERRIDES', localdata)
 		if not overrides:
 			raise bb.build.FuncFailed('OVERRIDES not defined')
 		overrides = bb.data.expand(overrides, localdata)
-		bb.data.setVar('OVERRIDES', '%s:%s' % (overrides, pkg), localdata)
+		bb.data.setVar('OVERRIDES', overrides + ':' + pkg, localdata)
 
 		bb.data.update_data(localdata)
 
-		root = bb.data.getVar('ROOT', localdata)
-		basedir = os.path.dirname(root)
+		basedir = os.path.join(os.path.dirname(root))
 		pkgoutdir = outdir
 		bb.mkdirhier(pkgoutdir)
 		bb.data.setVar('OUTSPECFILE', os.path.join(workdir, "%s.spec" % pkg), localdata)
 		bb.build.exec_func('write_specfile', localdata)
-		del localdata
+		bb.utils.unlockfile(lf)
 }
 
 python () {
@@ -143,7 +174,8 @@ python () {
 
 python do_package_write_rpm () {
 	bb.build.exec_func("read_subpackage_metadata", d)
+	bb.build.exec_func("rpm_prep", d)
 	bb.build.exec_func("do_package_rpm", d)
 }
 do_package_write_rpm[dirs] = "${D}"
-addtask package_write_rpm before do_build after do_package
+addtask package_write_rpm before do_package_write after do_package
-- 
1.6.1.3





