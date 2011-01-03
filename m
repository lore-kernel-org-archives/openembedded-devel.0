Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1PZrWk-0007E0-88
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Jan 2011 22:01:14 +0100
Received: by fxm17 with SMTP id 17so12777775fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Jan 2011 13:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:subject
	:message-id:mime-version:content-type:content-disposition:user-agent;
	bh=r3rP1DIxi6t94T6J/HOx06rq5mFwdITvrO5tj+NC8DI=;
	b=cKfmqmj3S7xY7No+eF0T3fm+2eaBF7L1YVZAxzAmWBbJptmp0ZAAQO1TBw/bbN/6vr
	L4R5Um3wYU/iUiBV3VV+wvYf36MeD/d9ZFvTSWQocFXnAwPz9itRfTaW9JVqOR7+lOVX
	m3pz6gZvxT2AaDaPo103c/nViIy3cWlsbYcDg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	b=I2f6XLymmD775WVxfzsgZf3kUcU+rfh7W/ACuk5EKet2V51mUS5ZJHSKqvziGdgFMu
	23XhQGNoGMnma9SDdu18b6BfiqVLDtMxVMIqebEX3On8jbAWZB4TyC3UlHZQMXiQVZRD
	aiqpntZBiZ9MUkal3Zl0lUvtTIQfxlIF3aesc=
Received: by 10.223.89.143 with SMTP id e15mr8523869fam.100.1294088441838;
	Mon, 03 Jan 2011 13:00:41 -0800 (PST)
Received: from s42.loc (85-127-155-31.dynamic.xdsl-line.inode.at
	[85.127.155.31])
	by mx.google.com with ESMTPS id o17sm4899425fal.1.2011.01.03.13.00.39
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 03 Jan 2011 13:00:40 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1PZrWA-000178-7C; Mon, 03 Jan 2011 22:00:38 +0100
Date: Mon, 3 Jan 2011 22:00:38 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110103210038.GD25803@mx.loc>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: .opk packages and rootfs?
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
X-List-Received-Date: Mon, 03 Jan 2011 21:01:14 -0000
X-Groupsio-MsgNum: 27676
Content-Type: multipart/mixed; boundary="9jxsPFA5p3P2qPhR"
Content-Disposition: inline

--9jxsPFA5p3P2qPhR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

As ipkg-utils doesn't download for me anymore i was wondering
about the status of packaged-staging and how to use it (must be
documented somewhere, i must be blind or something as i can't seem to
find it).

Are there any plans to move to opkg?

For reference, i'm attaching an initial idea (*NOT* a patch) for using
opkg to package staging and for use as online-package manager for the
roofs. It is heavily based on the existing ipkg classes, as you can see.
I'm aware that the dependecy-handling in both base and the opkg-utils
recipe would need major fixing (help on that would be very welcome).

$ diffstat -up1 not-an-opkg.opk-patch.diff
 classes/base.bbclass                                    |   14 
 classes/package_opk.bbclass                             |  317 ++++++++++++++++
 classes/packaged-staging.bbclass                        |   38 +
 classes/rootfs_opk.bbclass                              |   95 ++++
 conf/bitbake.conf                                       |    2 
 conf/distro/include/sane-feed-opk.inc                   |    4 
 conf/distro/micro-uclibc.conf                           |    1 
 conf/distro/micro.conf                                  |    2 
 recipes/opkg-utils/opkg-utils_svn.bb                    |   27 +
 recipes/opkg/opkg.inc                                   |    2 
 recipes/stage-manager/stagemanager-ipkg-native_0.0.1.bb |   11 
 recipes/stage-manager/stagemanager-native.inc           |   19 
 recipes/stage-manager/stagemanager-native_0.0.1.bb      |   27 -
 13 files changed, 515 insertions(+), 44 deletions(-)


--9jxsPFA5p3P2qPhR
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="not-an-opkg.opk-patch.diff"

diff --git a/classes/base.bbclass b/classes/base.bbclass
index c76b77d..644a707 100644
--- a/classes/base.bbclass
+++ b/classes/base.bbclass
@@ -63,8 +63,11 @@ def base_deps(d):
 	# that case though.
 	#
 	deps = "coreutils-native"
-	if bb.data.getVar('PN', d, True) in ("shasum-native", "stagemanager-native",
-	                                     "coreutils-native"):
+	pn = bb.data.getVar('PN', d, True)
+	if pn in ("shasum-native", "stagemanager-native",
+                                         "stagemanager-ipkg-native",
+                                         "opkg-utils-native", "opkg-utils",
+                                         "coreutils-native"):
 		deps = ""
 
 	# INHIBIT_DEFAULT_DEPS doesn't apply to the patch command.  Whether or  not
@@ -75,10 +78,13 @@ def base_deps(d):
 	     	    bb.data.getVar('BUILD_SYS', d, 1)):
 			deps += " virtual/${TARGET_PREFIX}gcc virtual/libc "
 		elif bb.data.inherits_class('native', d) and \
-				bb.data.getVar('PN', d, True) not in \
+				pn not in \
 				("linux-libc-headers-native", "quilt-native",
 				 "unifdef-native", "shasum-native",
-				 "stagemanager-native", "coreutils-native"):
+				 "stagemanager-native",
+				 "stagemanager-ipkg-native",
+				 "opkg-utils-native", "opkg-utils",
+				 "coreutils-native"):
 			deps += " linux-libc-headers-native"
 	return deps
 
diff --git a/classes/package_opk.bbclass b/classes/package_opk.bbclass
new file mode 100644
index 0000000..e32f10c
--- /dev/null
+++ b/classes/package_opk.bbclass
@@ -0,0 +1,317 @@
+inherit package
+
+BOOTSTRAP_EXTRA_RDEPENDS += "opkg-collateral opkg"
+IMAGE_PKGTYPE ?= "opk"
+
+OPKGCONF_TARGET = "${STAGING_ETCDIR_NATIVE}/opkg.conf"
+OPKGCONF_SDK =  "${STAGING_ETCDIR_NATIVE}/opkg-sdk.conf"
+
+python package_opk_fn () {
+	from bb import data
+	bb.data.setVar('PKGFN', bb.data.getVar('PKG',d), d)
+}
+
+python package_opk_install () {
+	#
+	# Warning - this function is not multimachine safe (see stagingdir reference)!
+	#
+
+	pkg = bb.data.getVar('PKG', d, 1)
+	pkgfn = bb.data.getVar('PKGFN', d, 1)
+	rootfs = bb.data.getVar('IMAGE_ROOTFS', d, 1)
+	opkdir = bb.data.getVar('DEPLOY_DIR_OPK', d, 1)
+	stagingdir = bb.data.getVar('STAGING_DIR', d, 1)
+	tmpdir = bb.data.getVar('TMPDIR', d, 1)
+
+	if None in (pkg,pkgfn,rootfs):
+		raise bb.build.FuncFailed("missing variables (one or more of PKG, PKGFN, IMAGEROOTFS)")
+	try:
+		bb.mkdirhier(rootfs)
+		os.chdir(rootfs)
+	except OSError:
+		import sys
+		(type, value, traceback) = sys.exc_info()
+		print value
+		raise bb.build.FuncFailed
+
+	# Generate opkg.conf if it or the stamp doesnt exist
+	conffile = os.path.join(stagingdir,"opkg.conf")
+	if not os.access(conffile, os.R_OK):
+		opkg_archs = bb.data.getVar('PACKAGE_ARCHS',d)
+		if opkg_archs is None:
+			bb.error("PACKAGE_ARCHS missing")
+			raise FuncFailed
+		opkg_archs = opkg_archs.split()
+		arch_priority = 1
+
+		f = open(conffile,"w")
+		for arch in opkg_archs:
+			f.write("arch %s %s\n" % ( arch, arch_priority ))
+			arch_priority += 1
+		f.write("src local file:%s" % opkdir)
+		f.close()
+
+
+	if (not os.access(os.path.join(opkdir,"Packages"), os.R_OK) or
+		not os.access(os.path.join(tmpdir, "stamps", "OPK_PACKAGE_INDEX_CLEAN"),os.R_OK):
+		ret = os.system('opkg-make-index -p %s %s ' % (os.path.join(opkdir, "Packages"), opkdir))
+		if (ret != 0 ):
+			raise bb.build.FuncFailed
+		f = open(os.path.join(tmpdir, "stamps", "OPK_PACKAGE_INDEX_CLEAN"),"w")
+		f.close()
+
+	ret = os.system('opkg-cl  -o %s -f %s update' % (rootfs, conffile))
+	ret = os.system('opkg-cl  -o %s -f %s install %s' % (rootfs, conffile, pkgfn))
+	if (ret != 0 ):
+		raise bb.build.FuncFailed
+}
+
+do_package_update_index_opk[lockfiles] = "${DEPLOY_DIR_OPK}.lock"
+do_package_update_index_opk[nostamp] = "1"
+do_package_update_index_opk[recrdeptask] += "do_package_write_opk"
+do_package_update_index_opk[depends] += "opkg-utils-native:do_populate_sysroot"
+
+#
+# Update the Packages index files in ${DEPLOY_DIR_OPK}
+#
+do_package_update_index_opk () {
+	set -x
+
+	opkgarchs="${PACKAGE_ARCHS}"
+
+	if [ ! -z "${DEPLOY_KEEP_PACKAGES}" ]; then
+		return
+	fi
+
+	mkdir -p ${DEPLOY_DIR_OPK}
+	touch ${DEPLOY_DIR_OPK}/Packages
+	opkg-make-index -r ${DEPLOY_DIR_OPK}/Packages -p ${DEPLOY_DIR_OPK}/Packages -l ${DEPLOY_DIR_OPK}/Packages.filelist -m ${DEPLOY_DIR_OPK}
+
+	for arch in $opkgarchs; do
+		if [ -e ${DEPLOY_DIR_OPK}/$arch/ ] ; then
+			touch ${DEPLOY_DIR_OPK}/$arch/Packages
+			opkg-make-index -r ${DEPLOY_DIR_OPK}/$arch/Packages -p ${DEPLOY_DIR_OPK}/$arch/Packages -l ${DEPLOY_DIR_OPK}/$arch/Packages.filelist -m ${DEPLOY_DIR_OPK}/$arch/
+		fi
+		if [ -e ${DEPLOY_DIR_OPK}/${BUILD_ARCH}-$arch-sdk/ ] ; then
+			touch ${DEPLOY_DIR_OPK}/${BUILD_ARCH}-$arch-sdk/Packages
+			opkg-make-index -r ${DEPLOY_DIR_OPK}/${BUILD_ARCH}-$arch-sdk/Packages -p ${DEPLOY_DIR_OPK}/${BUILD_ARCH}-$arch-sdk/Packages -l ${DEPLOY_DIR_OPK}/${BUILD_ARCH}-$arch-sdk/Packages.filelist -m ${DEPLOY_DIR_OPK}/${BUILD_ARCH}-$arch-sdk/
+		fi
+	done
+}
+
+#
+# Generate an opkg conf file ${OPKGCONF_TARGET} suitable for use against
+# the target system and an opkg conf file ${OPKGCONF_SDK} suitable for
+# use against the host system in sdk builds
+#
+package_generate_opkg_conf () {
+	mkdir -p ${STAGING_ETCDIR_NATIVE}/
+	echo "src oe file:${DEPLOY_DIR_OPK}" > ${OPKGCONF_TARGET}
+	echo "src oe file:${DEPLOY_DIR_OPK}" > ${OPKGCONF_SDK}
+	opkgarchs="${PACKAGE_ARCHS}"
+	priority=1
+	for arch in $opkgarchs; do
+		echo "arch $arch $priority" >> ${OPKGCONF_TARGET}
+		echo "arch ${BUILD_ARCH}-$arch-sdk $priority" >> ${OPKGCONF_SDK}
+		priority=$(expr $priority + 5)
+		if [ -e ${DEPLOY_DIR_OPK}/$arch/Packages ] ; then
+		        echo "src oe-$arch file:${DEPLOY_DIR_OPK}/$arch" >> ${OPKGCONF_TARGET}
+		fi
+		if [ -e ${DEPLOY_DIR_OPK}/${BUILD_ARCH}-$arch-sdk/Packages ] ; then
+		        echo "src oe-${BUILD_ARCH}-$arch-sdk file:${DEPLOY_DIR_OPK}/${BUILD_ARCH}-$arch-sdk" >> ${OPKGCONF_SDK}
+		fi
+	done
+}
+
+python do_package_opk () {
+	workdir = bb.data.getVar('WORKDIR', d, 1)
+	if not workdir:
+		bb.error("WORKDIR not defined, unable to package")
+		return
+
+	import os # path manipulations
+	outdir = bb.data.getVar('DEPLOY_DIR_OPK', d, 1)
+	if not outdir:
+		bb.error("DEPLOY_DIR_OPK not defined, unable to package")
+		return
+
+	dvar = bb.data.getVar('D', d, 1)
+	if not dvar:
+		bb.error("D not defined, unable to package")
+		return
+	bb.mkdirhier(dvar)
+
+	tmpdir = bb.data.getVar('TMPDIR', d, 1)
+
+	if os.access(os.path.join(tmpdir, "stamps", "OPK_PACKAGE_INDEX_CLEAN"), os.R_OK):
+		os.unlink(os.path.join(tmpdir, "stamps", "OPK_PACKAGE_INDEX_CLEAN"))
+
+	pkgdest = bb.data.getVar('PKGDEST', d, 1)
+	packages = bb.data.getVar('PACKAGES', d, True)
+	for pkg in packages.split():
+		localdata = bb.data.createCopy(d)
+		root = os.path.join(pkgdest, pkg)
+		bb.mkdirhier(root)
+
+		lf = bb.utils.lockfile(root + ".lock")
+
+		bb.data.setVar('ROOT', '', localdata)
+		bb.data.setVar('ROOT_%s' % pkg, root, localdata)
+		pkgname = bb.data.getVar('PKG_%s' % pkg, localdata, 1)
+		if not pkgname:
+			pkgname = pkg
+		bb.data.setVar('PKG', pkgname, localdata)
+
+		overrides = bb.data.getVar('OVERRIDES', localdata, True)
+		if not overrides:
+			raise bb.build.FuncFailed('OVERRIDES not defined')
+		bb.data.setVar('OVERRIDES', overrides + ':' + pkg, localdata)
+
+		bb.data.update_data(localdata)
+		basedir = os.path.dirname(root)
+		arch = bb.data.getVar('PACKAGE_ARCH', localdata, 1)
+		pkgoutdir = os.path.join(outdir, arch)
+		bb.mkdirhier(pkgoutdir)
+		os.chdir(root)
+		from glob import glob
+		g = glob('*')
+		try:
+			del g[g.index('CONTROL')]
+			del g[g.index('./CONTROL')]
+		except ValueError:
+			pass
+		if not g and bb.data.getVar('ALLOW_EMPTY', localdata) != "1":
+			bb.note("Not creating empty archive for %s-%s" % (pkg, bb.data.expand('${PV}-${PR}${DISTRO_PR}', localdata)))
+			bb.utils.unlockfile(lf)
+			continue
+
+		controldir = os.path.join(root, 'CONTROL')
+		bb.mkdirhier(controldir)
+		try:
+			ctrlfile = file(os.path.join(controldir, 'control'), 'w')
+		except OSError:
+			bb.utils.unlockfile(lf)
+			raise bb.build.FuncFailed("unable to open control file for writing.")
+
+		fields = []
+		pe = bb.data.getVar('PE', d, 1)
+		if pe and int(pe) > 0:
+			fields.append(["Version: %s:%s-%s\n", ['PE', 'PKGV', 'PKGR']])
+		else:
+			fields.append(["Version: %s-%s\n", ['PKGV', 'PKGR']])
+		fields.append(["Description: %s\n", ['DESCRIPTION']])
+		fields.append(["Section: %s\n", ['SECTION']])
+		fields.append(["Priority: %s\n", ['PRIORITY']])
+		fields.append(["Maintainer: %s\n", ['MAINTAINER']])
+		fields.append(["License: %s\n", ['LICENSE']])
+		fields.append(["Architecture: %s\n", ['PACKAGE_ARCH']])
+		fields.append(["OE: %s\n", ['PN']])
+		fields.append(["Homepage: %s\n", ['HOMEPAGE']])
+
+		def pullData(l, d):
+			l2 = []
+			for i in l:
+				l2.append(bb.data.getVar(i, d, 1))
+			return l2
+
+		ctrlfile.write("Package: %s\n" % pkgname)
+		# check for required fields
+		try:
+			for (c, fs) in fields:
+				for f in fs:
+					if bb.data.getVar(f, localdata) is None:
+						raise KeyError(f)
+				ctrlfile.write(c % tuple(pullData(fs, localdata)))
+		except KeyError:
+			import sys
+			(type, value, traceback) = sys.exc_info()
+			ctrlfile.close()
+			bb.utils.unlockfile(lf)
+			raise bb.build.FuncFailed("Missing field for opk generation: %s" % value)
+		# more fields
+
+		bb.build.exec_func("mapping_rename_hook", localdata)
+
+		rdepends = explode_deps(bb.data.getVar("RDEPENDS", localdata, 1) or "")
+		rrecommends = explode_deps(bb.data.getVar("RRECOMMENDS", localdata, 1) or "")
+		rsuggests = (bb.data.getVar("RSUGGESTS", localdata, 1) or "").split()
+		rprovides = (bb.data.getVar("RPROVIDES", localdata, 1) or "").split()
+		rreplaces = (bb.data.getVar("RREPLACES", localdata, 1) or "").split()
+		rconflicts = (bb.data.getVar("RCONFLICTS", localdata, 1) or "").split()
+		tags = (bb.data.getVar("PKG_TAGS", localdata, 1) or "").split()
+		if rdepends:
+			ctrlfile.write("Depends: %s\n" % ", ".join(rdepends))
+		if rsuggests:
+			ctrlfile.write("Suggests: %s\n" % ", ".join(rsuggests))
+		if rrecommends:
+			ctrlfile.write("Recommends: %s\n" % ", ".join(rrecommends))
+		if rprovides:
+			ctrlfile.write("Provides: %s\n" % ", ".join(rprovides))
+		if rreplaces:
+			ctrlfile.write("Replaces: %s\n" % ", ".join(rreplaces))
+		if rconflicts:
+			ctrlfile.write("Conflicts: %s\n" % ", ".join(rconflicts))
+		if tags:
+			ctrlfile.write("Tags: %s\n" % ", ".join(tags))
+		src_uri = bb.data.getVar("SRC_URI", localdata, 1) or d.getVar("FILE", True)
+		if src_uri:
+			import re
+			src_uri = re.sub("\s+", " ", src_uri)
+			ctrlfile.write("Source: %s\n" % " ".join(src_uri.split()))
+		ctrlfile.close()
+
+		for script in ["preinst", "postinst", "prerm", "postrm"]:
+			scriptvar = bb.data.getVar('pkg_%s' % script, localdata, 1)
+			if not scriptvar:
+				continue
+			try:
+				scriptfile = file(os.path.join(controldir, script), 'w')
+			except OSError:
+				bb.utils.unlockfile(lf)
+				raise bb.build.FuncFailed("unable to open %s script file for writing." % script)
+			scriptfile.write(scriptvar)
+			scriptfile.close()
+			os.chmod(os.path.join(controldir, script), 0755)
+
+		conffiles_str = bb.data.getVar("CONFFILES", localdata, 1)
+		if conffiles_str:
+			try:
+				conffiles = file(os.path.join(controldir, 'conffiles'), 'w')
+			except OSError:
+				bb.utils.unlockfile(lf)
+				raise bb.build.FuncFailed("unable to open conffiles for writing.")
+			for f in conffiles_str.split():
+				conffiles.write('%s\n' % f)
+			conffiles.close()
+
+		os.chdir(basedir)
+		ret = os.system("PATH=\"%s\" %s %s %s" % (bb.data.getVar("PATH", localdata, 1), 
+                                                          bb.data.getVar("OPKGBUILDCMD",d,1), pkg, pkgoutdir))
+		if ret != 0:
+			bb.utils.unlockfile(lf)
+			raise bb.build.FuncFailed("opkg-build execution failed")
+
+		bb.utils.prunedir(controldir)
+		bb.utils.unlockfile(lf)
+}
+
+python () {
+    if bb.data.getVar('PACKAGES', d, True) != '':
+        deps = (bb.data.getVarFlag('do_package_write_opk', 'depends', d) or "").split()
+        deps.append('opkg-utils-native:do_populate_sysroot')
+        deps.append('fakeroot-native:do_populate_sysroot')
+        bb.data.setVarFlag('do_package_write_opk', 'depends', " ".join(deps), d)
+}
+
+python do_package_write_opk () {
+	packages = bb.data.getVar('PACKAGES', d, True)
+	if not packages:
+		bb.debug(1, "No PACKAGES defined, nothing to package")
+		return
+
+	bb.build.exec_func("read_subpackage_metadata", d)
+	bb.build.exec_func("do_package_opk", d)
+}
+do_package_write_opk[dirs] = "${D}"
+addtask package_write_opk before do_package_write after do_package
+addtask package_update_index_opk before do_rootfs
diff --git a/classes/packaged-staging.bbclass b/classes/packaged-staging.bbclass
index 4eb7a91..6fe0311 100644
--- a/classes/packaged-staging.bbclass
+++ b/classes/packaged-staging.bbclass
@@ -16,7 +16,9 @@ PSTAGE_PKGARCH    = "${PACKAGE_ARCH}-${HOST_OS}"
 PSTAGE_EXTRAPATH  ?= "/${OELAYOUT_ABI}/${DISTRO_PR}/"
 PSTAGE_PKGPATH    = "${DISTRO}${PSTAGE_EXTRAPATH}"
 PSTAGE_PKGPN      = "${@bb.data.expand('staging-${PN}-${MULTIMACH_ARCH}${TARGET_VENDOR}-${TARGET_OS}', d).replace('_', '-')}"
-PSTAGE_PKGNAME    = "${PSTAGE_PKGPN}_${PSTAGE_PKGVERSION}_${PSTAGE_PKGARCH}.ipk"
+PSTAGE_PKGTYPE    = "${@['ipk', 'opk'][bb.data.inherits_class('package_opk', d)]}"
+PSTAGE_PKGTOOL    = "${PSTAGE_PKGTYPE}g"
+PSTAGE_PKGNAME    = "${PSTAGE_PKGPN}_${PSTAGE_PKGVERSION}_${PSTAGE_PKGARCH}.${PSTAGE_PKGTYPE}"
 PSTAGE_PKG        = "${PSTAGE_DIR}/${PSTAGE_PKGPATH}/${PSTAGE_PKGNAME}"
 PSTAGE_WORKDIR   = "${TMPDIR}/pstage"
 PSTAGE_SCAN_CMD ?= "find ${PSTAGE_TMPDIR_STAGE} \( -name "*.la" -o -name "*-config" \) -type f"
@@ -25,6 +27,7 @@ PSTAGE_NATIVEDEPENDS = "\
     shasum-native \
     stagemanager-native \
     "
+PSTAGE_NATIVEDEPENDS += "${@['stagemanager-ipkg-native', 'opkg-utils-native'][bb.data.inherits_class('package_opk', d)]}"
 
 BB_STAMP_WHITELIST = "${PSTAGE_NATIVEDEPENDS}"
 
@@ -80,7 +83,7 @@ python __anonymous() {
         bb.data.setVarFlag('do_setscene', 'depends', deps, d)
 
         policy = bb.data.getVar("BB_STAMP_POLICY", d, True)
-        if policy == "whitelist" or policy == "full":
+        if policy in ["whitelist", "full"]:
            deps = bb.data.getVarFlag('do_setscene', 'recrdeptask', d) or ""
            deps += " do_setscene"
            bb.data.setVarFlag('do_setscene', 'recrdeptask', deps, d)
@@ -92,9 +95,7 @@ python __anonymous() {
 
 PSTAGE_MACHCONFIG   = "${PSTAGE_WORKDIR}/opkg.conf"
 
-PSTAGE_PKGMANAGER = "stage-manager-ipkg"
-
-PSTAGE_BUILD_CMD        = "stage-manager-ipkg-build -o 0 -g 0"
+PSTAGE_BUILD_CMD = "${@['stage-manager-ipkg-build -o 0 -g 0', 'opkg-build -o 0 -g 0 -O'][bb.data.inherits_class('package_opk', d)]}"
 PSTAGE_INSTALL_CMD      = "${PSTAGE_PKGMANAGER} -f ${PSTAGE_MACHCONFIG} -force-depends -o ${TMPDIR} install"
 PSTAGE_UPDATE_CMD       = "${PSTAGE_PKGMANAGER} -f ${PSTAGE_MACHCONFIG} -o ${TMPDIR} update"
 PSTAGE_REMOVE_CMD       = "${PSTAGE_PKGMANAGER} -f ${PSTAGE_MACHCONFIG} -force-depends -o ${TMPDIR} remove"
@@ -115,14 +116,21 @@ def pstage_manualclean(srcname, destvarname, d):
 			filepath = os.path.join(walkroot, file).replace(src, dest)
 			oe.path.remove(filepath)
 
-def pstage_set_pkgmanager(d):
+def pstage_set_pkgmanager_XXXX(d):
     path = bb.data.getVar("PATH", d, 1)
-    pkgmanager = bb.which(path, 'opkg-cl')
-    if pkgmanager == "":
+    pkg_type = bb.data.getVar("PSTAGE_PKGTYPE", d, True)
+    pkgmanager = ""
+    if pkg_type == "opk":
+        pkgmanager = bb.which(path, 'opkg-cl')
+    elif pkg_type == "ipk":
         pkgmanager = bb.which(path, 'ipkg-cl')
     if pkgmanager != "":
         bb.data.setVar("PSTAGE_PKGMANAGER", pkgmanager, d)
 
+def pstage_set_pkgmanager(d):
+    pkg_type = bb.data.getVar("PSTAGE_PKGTYPE", d, True)
+    if pkg_type in ("opk", "ipk"):
+        bb.data.setVar("PSTAGE_PKGMANAGER", pkg_type + "g-cl", d)
 
 def pstage_cleanpackage(pkgname, d):
     pstage_set_pkgmanager(d)
@@ -176,7 +184,7 @@ staging_helper () {
 	if [ ! -e ${TMPDIR}${libdir_native}/opkg/info/ ]; then
 		mkdir -p ${TMPDIR}${libdir_native}/opkg/info/
 	fi
- 	if [ ! -e ${TMPDIR}${libdir_native}/ipkg/ ]; then
+ 	if [ "${PSTAGE_PKGTOOL}" != "opkg" ] && [ ! -e ${TMPDIR}${libdir_native}/ipkg/ ]; then
 		ln -sf opkg/ ${TMPDIR}${libdir_native}/ipkg || true
 	fi
 }
@@ -202,7 +210,7 @@ def staging_fetch(stagepkg, d):
         except:
             return
 
-PSTAGE_TASKS_COVERED = "fetch unpack munge patch configure qa_configure rig_locales compile sizecheck install deploy package populate_sysroot package_write_deb package_write_ipk package_write package_stage qa_staging"
+PSTAGE_TASKS_COVERED = "fetch unpack munge patch configure qa_configure rig_locales compile sizecheck install deploy package populate_sysroot package_write_deb package_write_${PSTAGE_PKGTYPE} package_write package_stage qa_staging"
 
 SCENEFUNCS += "packagestage_scenefunc"
 
@@ -437,6 +445,8 @@ python do_package_stage () {
     tmpdir = bb.data.getVar("TMPDIR", d, True)
     packages = (bb.data.getVar('PACKAGES', d, 1) or "").split()
     if len(packages) > 0:
+        if bb.data.inherits_class('package_opk', d):
+            opkpath = bb.data.getVar('DEPLOY_DIR_OPK', d, True).replace(tmpdir, stagepath)
         if bb.data.inherits_class('package_ipk', d):
             ipkpath = bb.data.getVar('DEPLOY_DIR_IPK', d, True).replace(tmpdir, stagepath)
         if bb.data.inherits_class('package_deb', d):
@@ -456,6 +466,14 @@ python do_package_stage () {
                 pr = bb.data.getVar('PR', d, 1)
             if not oe.packagedata.packaged(pkg, d):
                 continue
+            if bb.data.inherits_class('package_opk', d):
+                srcname = bb.data.expand(pkgname + "_${PKGV}-" + pr + "${DISTRO_PR}" + "_" + arch + ".opk", d)
+                srcfile = bb.data.expand("${DEPLOY_DIR_OPK}/" + arch + "/" + srcname, d)
+                if os.path.exists(srcfile):
+                    destpath = opkpath + "/" + arch + "/"
+                    bb.mkdirhier(destpath)
+                    bb.copyfile(srcfile, destpath + srcname)
+
             if bb.data.inherits_class('package_ipk', d):
                 srcname = bb.data.expand(pkgname + "_${PKGV}-" + pr + "${DISTRO_PR}" + "_" + arch + ".ipk", d)
                 srcfile = bb.data.expand("${DEPLOY_DIR_IPK}/" + arch + "/" + srcname, d)
diff --git a/classes/rootfs_opk.bbclass b/classes/rootfs_opk.bbclass
new file mode 100644
index 0000000..343416f
--- /dev/null
+++ b/classes/rootfs_opk.bbclass
@@ -0,0 +1,95 @@
+#
+# Creates a root filesystem out of OPKs
+#
+# This rootfs can be mounted via root-nfs or it can be put into an cramfs/jffs etc.
+# See image.bbclass for a usage of this.
+#
+
+do_rootfs[depends] += "opkg-native:do_populate_sysroot opkg-utils-native:do_populate_sysroot"
+do_rootfs[recrdeptask] += "do_package_write_opk"
+
+OPKG_ARGS = "-force-defaults -f ${OPKGCONF_TARGET} -o ${IMAGE_ROOTFS} ${@base_conditional("PACKAGE_INSTALL_NO_DEPS", "1", "-nodeps", "", d)}"
+
+DISTRO_EXTRA_RDEPENDS += " opkg opkg-collateral "
+PACKAGE_INSTALL_NO_DEPS ?= "0"
+
+fakeroot rootfs_opk_do_rootfs () {
+	set -x
+
+	do_package_update_index_opk
+	package_generate_opkg_conf
+
+	mkdir -p ${T}
+	mkdir -p ${IMAGE_ROOTFS}${libdir}/opkg/
+	opkg-cl ${OPKG_ARGS} update
+
+	# Uclibc builds don't provide this stuff...
+	if [ x${TARGET_OS} = "xlinux" ] || [ x${TARGET_OS} = "xlinux-gnueabi" ] ; then
+		if [ ! -z "${LINGUAS_INSTALL}" ]; then
+			opkg-cl ${OPKG_ARGS} install glibc-localedata-i18n
+			for i in ${LINGUAS_INSTALL}; do
+				opkg-cl ${OPKG_ARGS} install $i
+			done
+		fi
+	fi
+	if [ ! -z "${PACKAGE_INSTALL}" ]; then
+		opkg-cl ${OPKG_ARGS} install ${PACKAGE_INSTALL}
+	fi
+
+	export D=${IMAGE_ROOTFS}
+	export OFFLINE_ROOT=${IMAGE_ROOTFS}
+	export OPKG_OFFLINE_ROOT=${IMAGE_ROOTFS}
+	export OPKG_OFFLINE_ROOT=${OPKG_OFFLINE_ROOT}
+
+	mkdir -p ${IMAGE_ROOTFS}${sysconfdir}/opkg/
+	grep "^arch" ${OPKGCONF_TARGET} >${IMAGE_ROOTFS}${sysconfdir}/opkg/arch.conf
+
+	for i in ${IMAGE_ROOTFS}${libdir}/opkg/info/*.preinst; do
+		if [ -f $i ] && ! sh $i; then
+			opkg-cl ${OPKG_ARGS} flag unpacked `basename $i .preinst`
+		fi
+	done
+	for i in ${IMAGE_ROOTFS}${libdir}/opkg/info/*.postinst; do
+		if [ -f $i ] && ! sh $i configure; then
+			opkg-cl ${OPKG_ARGS} flag unpacked `basename $i .postinst`
+		fi
+	done
+
+	install -d ${IMAGE_ROOTFS}/${sysconfdir}
+	echo ${BUILDNAME} > ${IMAGE_ROOTFS}/${sysconfdir}/version
+
+	rm -f ${IMAGE_ROOTFS}${libdir}/opkg/lists/*
+
+	# Keep these lines until package manager selection is implemented
+	if [ "${PSTAGE_PKGTOOL}" != "opkg" ]; then
+		ln -s opkg ${IMAGE_ROOTFS}${sysconfdir}/ipkg
+		ln -s opkg ${IMAGE_ROOTFS}${libdir}/ipkg
+	fi
+	${ROOTFS_POSTPROCESS_COMMAND}
+
+	log_check rootfs
+}
+
+rootfs_opk_log_check() {
+	target="$1"
+        lf_path="$2"
+
+	lf_txt="`cat $lf_path`"
+	for keyword_die in "Cannot find package" "exit 1" ERR Fail
+	do
+		if (echo "$lf_txt" | grep -v log_check | grep "$keyword_die") >/dev/null 2>&1
+		then
+			echo "log_check: There were error messages in the logfile"
+			printf "log_check: Matched keyword: [$keyword_die]\n"
+			echo "$lf_txt" | grep -v log_check | grep -i "$keyword_die" -C1
+			echo ""
+			do_exit=1
+		fi
+	done
+	test "$do_exit" = 1 && exit 1
+	true
+}
+
+remove_packaging_data_files() {
+	rm -rf ${IMAGE_ROOTFS}${libdir}/opkg/
+}
diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index 17b9b28..12019b0 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -342,6 +342,7 @@ STAGING_DIR_SDK = "${STAGING_DIR}/${SDK_SYS}"
 DEPLOY_DIR ?= "${TMPDIR}/deploy"
 DEPLOY_DIR_TAR = "${DEPLOY_DIR}/tar"
 DEPLOY_DIR_IPK = "${DEPLOY_DIR}/ipk"
+DEPLOY_DIR_OPK = "${DEPLOY_DIR}/opk"
 DEPLOY_DIR_RPM = "${DEPLOY_DIR}/rpm"
 DEPLOY_DIR_DEB = "${DEPLOY_DIR}/deb"
 DEPLOY_DIR_IMAGE = "${DEPLOY_DIR}/images"
@@ -657,6 +658,7 @@ export PATCH_GET="0"
 # Program to be used to build ipkg packages
 
 IPKGBUILDCMD = "ipkg-build -o 0 -g 0"
+OPKGBUILDCMD = "opkg-build -o 0 -g 0 -O"
 
 ##################################################################
 # Not sure about the rest of this yet.
diff --git a/conf/distro/include/sane-feed-opk.inc b/conf/distro/include/sane-feed-opk.inc
new file mode 100644
index 0000000..90b276b
--- /dev/null
+++ b/conf/distro/include/sane-feed-opk.inc
@@ -0,0 +1,4 @@
+INHERIT += "package_opk"
+
+PREFERRED_PROVIDER_virtual/update-alternatives-native ?= "opkg-native"
+PREFERRED_PROVIDER_virtual/update-alternatives ?= ${PREFERRED_PROVIDER_opkg}
diff --git a/conf/distro/micro-uclibc.conf b/conf/distro/micro-uclibc.conf
index 85ea9b3..14ba506 100644
--- a/conf/distro/micro-uclibc.conf
+++ b/conf/distro/micro-uclibc.conf
@@ -12,6 +12,7 @@
 #############################################################################
 
 DISTRO_NAME = "micro-uclibc"
+PREFERRED_PKG_FORMAT = "opk"
 
 #############################################################################
 # TOOLCHAIN
diff --git a/conf/distro/micro.conf b/conf/distro/micro.conf
index 102afa1..f12b436 100644
--- a/conf/distro/micro.conf
+++ b/conf/distro/micro.conf
@@ -31,7 +31,7 @@ INHERIT += "debian"
 # PACKAGING & FEEDS
 #############################################################################
 # Select packaging system
-PREFERRED_PKG_FORMAT = "ipk"
+PREFERRED_PKG_FORMAT ?= "ipk"
 IPKG_VARIANT = "opkg"
 
 require conf/distro/include/sane-feed.inc
diff --git a/recipes/opkg-utils/opkg-utils_svn.bb b/recipes/opkg-utils/opkg-utils_svn.bb
index 4634690..6804dac 100644
--- a/recipes/opkg-utils/opkg-utils_svn.bb
+++ b/recipes/opkg-utils/opkg-utils_svn.bb
@@ -2,11 +2,21 @@ DESCRIPTION = "OPKG Package Manager Utilities"
 SECTION = "base"
 PRIORITY = "optional"
 LICENSE = "GPL"
-RDEPENDS_${PN} = "python"
-RDEPENDS_virtclass-native = ""
-SRCREV = "4595"
+#trips loop :( INHIBIT_DEFAULT_DEPS_virtclass-native = "1"
+#trips loop :( INHIBIT_AUTOTOOLS_DEPS_virtclass-native = "1"
+INHIBIT_DEFAULT_DEPS = "1"
+INHIBIT_AUTOTOOLS_DEPS = "1"
+
+#INHIBIT_DEFAULT_DEPS_virtclass-native = "1"
+#INHIBIT_AUTOTOOLS_DEPS_virtclass-native = "1"
+
+#PATCHDEPENDENCY_virtclass-native = ""
+#PSTAGING_DISABLED_virtclass-native = "1"
+#DEPENDS_virtclass-native = ""
+
+SRCREV = "5997"
 PV = "0.0+svnr${SRCPV}"
-PR = "r5"
+PR = "r8"
 
 BBCLASSEXTEND = "native"
 
@@ -15,4 +25,11 @@ SRC_URI = "svn://svn.openmoko.org/trunk/src/host/;module=opkg-utils;proto=http"
 TARGET_CC_ARCH += "${LDFLAGS}"
 S = "${WORKDIR}/opkg-utils"
 
-inherit autotools
+do_install() {
+  oe_runmake PREFIX= DESTDIR="${D}" install
+}
+#inherit autotools
+
+PACKAGES =+ "opkg-utils-arfile"
+FILES_opkg-utils-arfile = "${base_bindir}/arfile.py"
+RDEPENDS_opkg-utils-arfile = "python"
diff --git a/recipes/opkg/opkg.inc b/recipes/opkg/opkg.inc
index cdfbef8..89fa51e 100644
--- a/recipes/opkg/opkg.inc
+++ b/recipes/opkg/opkg.inc
@@ -5,7 +5,7 @@ LICENSE = "GPLv2"
 SRCREV = "596"
 PV = "0.1.8+svnr${SRCPV}"
 CONFLICTS = "ipkg"
-INC_PR = "r3"
+INC_PR = "r4"
 
 SRC_URI = "svn://opkg.googlecode.com/svn;module=trunk;proto=http \
 	   file://configure \
diff --git a/recipes/stage-manager/stagemanager-ipkg-native_0.0.1.bb b/recipes/stage-manager/stagemanager-ipkg-native_0.0.1.bb
new file mode 100644
index 0000000..2281513
--- /dev/null
+++ b/recipes/stage-manager/stagemanager-ipkg-native_0.0.1.bb
@@ -0,0 +1,11 @@
+require stagemanager-native.inc
+PR = "${INC_PR}.0"
+
+SRC_URI_append = "file://stage-manager-ipkg \
+                  file://stage-manager-ipkg-build "
+
+do_install_append() {
+	install -D ${STAGING_BINDIR}
+	install -m 0755 ${WORKDIR}/stage-manager-ipkg \
+			${WORKDIR}/stage-manager-ipkg-build ${STAGING_BINDIR}
+}
diff --git a/recipes/stage-manager/stagemanager-native.inc b/recipes/stage-manager/stagemanager-native.inc
new file mode 100644
index 0000000..0720e08
--- /dev/null
+++ b/recipes/stage-manager/stagemanager-native.inc
@@ -0,0 +1,19 @@
+DESCRIPTION = "Helper script for packaged-staging.bbclass"
+INC_PR = "r16"
+
+SRC_URI = "file://stage-manager "
+LICENSE = "GPLv2"
+
+PACKAGE_ARCH = "all"
+
+inherit native
+
+DEPENDS = ""
+PACKAGE_DEPENDS = ""
+PATCHDEPENDENCY = ""
+INHIBIT_DEFAULT_DEPS = "1"
+
+PSTAGING_DISABLED = "1"
+
+NATIVE_INSTALL_WORKS = "1"
+
diff --git a/recipes/stage-manager/stagemanager-native_0.0.1.bb b/recipes/stage-manager/stagemanager-native_0.0.1.bb
index 9577749..ae52d79 100644
--- a/recipes/stage-manager/stagemanager-native_0.0.1.bb
+++ b/recipes/stage-manager/stagemanager-native_0.0.1.bb
@@ -1,26 +1,7 @@
-DESCRIPTION = "Helper script for packaged-staging.bbclass"
-PR = "r15"
+require stagemanager-native.inc
+PR = "${INC_PR}"
+DEPENDS += "${@['stagemanager-ipkg-native', 'opkg-utils-native'][bb.data.inherits_class('package_opk', d)]}"
 
-SRC_URI = "file://stage-manager \
-           file://stage-manager-ipkg \
-           file://stage-manager-ipkg-build "
-LICENSE = "GPLv2"
-
-PACKAGE_ARCH = "all"
-
-inherit native
-
-DEPENDS = " "
-PACKAGE_DEPENDS = " "
-PATCHDEPENDENCY = ""
-INHIBIT_DEFAULT_DEPS = "1"
-
-PSTAGING_DISABLED = "1"
-
-NATIVE_INSTALL_WORKS = "1"
 do_install() {
-	install -d ${STAGING_BINDIR}
-	install -m 0755 ${WORKDIR}/stage-manager ${STAGING_BINDIR}
-	install -m 0755 ${WORKDIR}/stage-manager-ipkg ${STAGING_BINDIR}
-	install -m 0755 ${WORKDIR}/stage-manager-ipkg-build ${STAGING_BINDIR}
+	install -D -m 0755 ${WORKDIR}/stage-manager ${STAGING_BINDIR}/stage-manager
 }

--9jxsPFA5p3P2qPhR--
