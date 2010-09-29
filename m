Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P0ry1-00005C-FN
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Sep 2010 10:24:49 +0200
Received: by pxi11 with SMTP id 11so111020pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Sep 2010 01:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=EkGIkl/IRREYPS+Lnly7diYVF/3zibVGL/4xoE8Ye78=;
	b=HD+WmTLqSNcFjgZfbdYM/OjOjW901o5Lr+ZqfkwFzJ5uXS+/W5ea0ucau6G8rtmHL6
	lMD05bQTmdOkAAAsVRoRqwTcKIhap2UMMSu6rtKvfX4FDpEeUUSbgh3uyHCScb29GjAM
	6/BdiYJtZsAeHL1E0l1WiCVkSFxUYuq46dT2A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=l6ivlDl72zXj3IUtFkeFpGCMIgKDJO5acDksFc6CkBCwYUQaQca45NzhCVV29q5tBr
	mRxvBWqXDzrVb359sHJTIIBmD+Mcp3plxXK+VMw+y+5IwDTxvjXjeaybnymbQVdWzuF2
	U7AKV6m77hQFiDvnPA5RqJxYs495/KoncPJHU=
Received: by 10.114.79.10 with SMTP id c10mr1410001wab.220.1285748655728;
	Wed, 29 Sep 2010 01:24:15 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id c10sm14095041wam.13.2010.09.29.01.24.13
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 29 Sep 2010 01:24:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Sep 2010 01:24:08 -0700
Message-Id: <1285748648-23559-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] eglibc: Fix eglibc-dev aliases and locales
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
X-List-Received-Date: Wed, 29 Sep 2010 08:24:49 -0000

packages which had glibc-dev in their RDEPENDS
caused glibc to be pulled along with eglibc.
eglibc-dev was not properly providing glibc-dev

Refresh the locale generation changes with glibc(poky)

Add missing eglibc-static to PACKAGES

Use bitbake variables in FILES instead of hardcoded paths

Move common code to eglibc.inc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/eglibc/eglibc-package.bbclass |  178 ++++++++++++++++++++++-----------
 recipes/eglibc/eglibc.inc             |    5 +-
 recipes/eglibc/eglibc_2.10.bb         |    4 -
 recipes/eglibc/eglibc_2.11.bb         |    4 -
 recipes/eglibc/eglibc_2.12.bb         |    4 -
 recipes/eglibc/eglibc_2.9.bb          |    4 -
 recipes/eglibc/eglibc_svn.bb          |    4 -
 7 files changed, 123 insertions(+), 80 deletions(-)

diff --git a/recipes/eglibc/eglibc-package.bbclass b/recipes/eglibc/eglibc-package.bbclass
index 9727747..06d91be 100644
--- a/recipes/eglibc/eglibc-package.bbclass
+++ b/recipes/eglibc/eglibc-package.bbclass
@@ -15,7 +15,16 @@ python __anonymous () {
         raise bb.parse.SkipPackage("incompatible with target %s" %
                                    bb.data.getVar('TARGET_OS', d, 1))
 }
+#
+# This class knows how to package up glibc. Its shared since prebuild binary toolchains
+# may need packaging and its pointless to duplicate this code.
+#
+# Caller should set GLIBC_INTERNAL_USE_BINARY_LOCALE to one of:
+#  "compile" - Use QEMU to generate the binary locale files
+#  "precompiled" - The binary locale files are pregenerated and already present
+#  "ondevice" - The device will build the locale files upon first boot through the postinst
 
+GLIBC_INTERNAL_USE_BINARY_LOCALE ?= "ondevice"
 
 # Binary locales are generated at build time if ENABLE_BINARY_LOCALE_GENERATION
 # is set. The idea is to avoid running localedef on the target (at first boot)
@@ -31,41 +40,61 @@ BINARY_LOCALE_ARCHES ?= "arm.* i[3-6]86 x86_64 powerpc"
 # Set this to zero if you don't want ldconfig in the output package
 USE_LDCONFIG ?= "1"
 
-PACKAGES = "eglibc-dbg eglibc catchsegv sln nscd ldd localedef eglibc-utils eglibc-pic eglibc-dev eglibc-doc eglibc-locale libcidn libmemusage libsegfault eglibc-extra-nss eglibc-thread-db eglibc-pcprofile"
+PACKAGES = "eglibc-dbg eglibc catchsegv sln nscd ldd localedef eglibc-utils eglibc-pic eglibc-dev eglibc-static eglibc-doc eglibc-locale libcidn libmemusage libsegfault eglibc-extra-nss eglibc-thread-db eglibc-pcprofile"
 PACKAGES_DYNAMIC = "glibc-gconv-* glibc-charmap-* glibc-localedata-* glibc-binary-localedata-* eglibc-gconv-* eglibc-charmap-* eglibc-localedata-* eglibc-binary-localedata-* locale-base-*"
 
+INSANE_SKIP_eglibc-dbg = True
+
+RPROVIDES_eglibc-dbg = "glibc-dbg"
 RPROVIDES_eglibc = "glibc"
 RPROVIDES_eglibc-utils = "glibc-utils"
 RPROVIDES_eglibc-pic = "glibc-pic"
 RPROVIDES_eglibc-dev = "glibc-dev"
+RPROVIDES_eglibc-static = "glibc-static"
 RPROVIDES_eglibc-doc = "glibc-doc"
 RPROVIDES_eglibc-locale = "glibc-locale"
 RPROVIDES_eglibc-extra-nss = "glibc-extra-nss"
 RPROVIDES_eglibc-thread-db = "glibc-thread-db"
 RPROVIDES_eglibc-pcprofile = "glibc-pcprofile"
-RPROVIDES_eglibc-dbg = "glibc-dbg"
-libc_baselibs = "${base_libdir}/libcrypt*.so.* ${base_libdir}/libcrypt-*.so ${base_libdir}/libc*.so.* ${base_libdir}/libc*.so ${base_libdir}/libm*.so.* ${base_libdir}/libm-*.so ${base_libdir}/ld*.so.* ${base_libdir}/ld-*.so ${base_libdir}/libpthread*.so.* ${base_libdir}/libpthread-*.so ${base_libdir}/libresolv*.so.* ${base_libdir}/libresolv-*.so ${base_libdir}/librt*.so.* ${base_libdir}/librt-*.so ${base_libdir}/libutil*.so.* ${base_libdir}/libutil-*.so ${base_libdir}/libnsl*.so.* ${base_libdir}/libnsl-*.so ${base_libdir}/libnss_files*.so.* ${base_libdir}/libnss_files-*.so ${base_libdir}/libnss_compat*.so.* ${base_libdir}/libnss_compat-*.so ${base_libdir}/libnss_dns*.so.* ${base_libdir}/libnss_dns-*.so ${base_libdir}/libdl*.so.* ${base_libdir}/libdl-*.so ${base_libdir}/libanl*.so.* ${base_libdir}/libanl-*.so ${base_libdir}/libBrokenLocale*.so.* ${base_libdir}/libBrokenLocale-*.so"
 
-FILES_${PN} = "${libc_baselibs} ${libexecdir}/* ${@base_conditional('USE_LDCONFIG', '1', '${base_sbindir}/ldconfig', '', d)}"
+libc_baselibs = "${base_libdir}/libcrypt*.so.* ${base_libdir}/libcrypt-*.so ${base_libdir}/libc*.so.* ${base_libdir}/libc-*.so ${base_libdir}/libm*.so.* ${base_libdir}/libm-*.so ${base_libdir}/ld*.so.* ${base_libdir}/ld-*.so ${base_libdir}/libpthread*.so.* ${base_libdir}/libpthread-*.so ${base_libdir}/libresolv*.so.* ${base_libdir}/libresolv-*.so ${base_libdir}/librt*.so.* ${base_libdir}/librt-*.so ${base_libdir}/libutil*.so.* ${base_libdir}/libutil-*.so ${base_libdir}/libnsl*.so.* ${base_libdir}/libnsl-*.so ${base_libdir}/libnss_files*.so.* ${base_libdir}/libnss_files-*.so ${base_libdir}/libnss_compat*.so.* ${base_libdir}/libnss_compat-*.so ${base_libdir}/libnss_dns*.so.* ${base_libdir}/libnss_dns-*.so ${base_libdir}/libdl*.so.* ${base_libdir}/libdl-*.so ${base_libdir}/libanl*.so.* ${base_libdir}/libanl-*.so ${base_libdir}/libBrokenLocale*.so.* ${base_libdir}/libBrokenLocale-*.so"
+
+# The problem is that if PN = "glibc", FILES_${PN} will overwrite FILES_glibc
+# Solution: Make them both the same thing, then it doesn't matter
+
+eglibcfiles = "${libc_baselibs} ${libexecdir}/* ${datadir}/zoneinfo ${@base_conditional('USE_LDCONFIG', '1', '${base_sbindir}/ldconfig', '', d)}"
+eglibcdbgfiles = "${bindir}/.debug ${sbindir}/.debug ${libdir}/.debug \
+                  ${base_bindir}/.debug ${base_sbindir}/.debug ${base_libdir}/.debug \
+                  ${libdir}/gconv/.debug ${libexecdir}/*/.debug"
+eglibcpicfiles = "${libdir}/*_pic.a ${libdir}/*_pic.map ${libdir}/libc_pic/"
+eglibcdevfiles = "${bindir}/rpcgen ${includedir} ${libdir}/lib*${SOLIBSDEV} ${libdir}/*.la \
+                ${libdir}/*.a ${libdir}/*.o ${libdir}/pkgconfig ${libdir}/*nonshared.a \
+                ${base_libdir}/*.a ${base_libdir}/*.o ${datadir}/aclocal"
+
+FILES_eglibc = "${eglibcfiles}"
+FILES_${PN} = "${eglibcfiles}"
 FILES_ldd = "${bindir}/ldd"
 FILES_libsegfault = "${base_libdir}/libSegFault*"
 FILES_libcidn = "${base_libdir}/libcidn*.so"
 FILES_libmemusage = "${base_libdir}/libmemusage.so"
 FILES_eglibc-extra-nss = "${base_libdir}/libnss*"
-FILES_sln = "/sbin/sln"
-FILES_eglibc-pic = "${libdir}/*_pic.a ${libdir}/*_pic.map ${libdir}/libc_pic/"
-FILES_eglibc-dev_append += "${bindir}/rpcgen ${libdir}/*.a \
-	${base_libdir}/*.a ${base_libdir}/*.o ${datadir}/aclocal"
-FILES_nscd = "${sbindir}/nscd*"
+FILES_sln = "${base_sbindir}/sln"
+FILES_eglibc-pic = "${eglibcpicfiles}"
+FILES_${PN}-pic = "${eglibcpicfiles}"
+FILES_eglibc-dev = "${eglibcdevfiles}"
+FILES_${PN}-dev = "${eglibcdevfiles}"
+FILES_eglibc-dbg = "${eglibcdbgfiles}"
+FILES_${PN}-dbg = "${eglibcdbgfiles}"
+FILES_nscd = "${sbindir}/nscd* ${sysconfdir}/nscd* ${sysconfdir}/init.d/nscd*"
 FILES_eglibc-utils = "${bindir}/* ${sbindir}/*"
 FILES_eglibc-gconv = "${libdir}/gconv/*"
-FILES_${PN}-dbg += "${libexecdir}/*/.debug ${libdir}/gconv/.debug"
 FILES_catchsegv = "${bindir}/catchsegv"
 RDEPENDS_catchsegv = "libsegfault"
 FILES_eglibc-pcprofile = "${base_libdir}/libpcprofile.so"
 FILES_eglibc-thread-db = "${base_libdir}/libthread_db*"
 FILES_localedef = "${bindir}/localedef"
-RPROVIDES_eglibc-dev += "libc-dev"
+
+RPROVIDES_eglibc-dev += "libc-dev libc6-dev virtual-libc-dev"
 
 DESCRIPTION_sln = "eglibc: create symbolic links between files"
 DESCRIPTION_nscd = "eglibc: name service cache daemon for passwd, group, and hosts"
@@ -74,12 +103,18 @@ DESCRIPTION_ldd = "eglibc: print shared library dependencies"
 DESCRIPTION_localedef = "eglibc: compile locale definition files"
 DESCRIPTION_eglibc-utils = "eglibc: misc utilities like iconf, local, gencat, tzselect, rpcinfo, ..."
 
+INITSCRIPT_NAME = "nscd"
+INITSCRIPT_PACKAGES = "nscd"
+INITSCRIPT_PARAMS = "start 40 S . stop 40 0 6 1 ."
+inherit update-rc.d
+
 def get_eglibc_fpu_setting(bb, d):
     if bb.data.getVar('TARGET_FPU', d, 1) in [ 'soft' ]:
         return "--without-fp"
     return ""
 
 EXTRA_OECONF += "${@get_eglibc_fpu_setting(bb, d)}"
+EXTRA_OEMAKE += "rootsbindir=${base_sbindir}"
 
 OVERRIDES_append = ":${TARGET_ARCH}-${TARGET_OS}"
 
@@ -107,6 +142,9 @@ do_install() {
 	rm -f ${D}/etc/rpc
 	rm -rf ${D}${datadir}/zoneinfo
 	rm -rf ${D}${libexecdir}/getconf
+	install -d ${D}${sysconfdir}/init.d
+	install -m 0644 ${S}/nscd/nscd.conf ${D}${sysconfdir}/
+	install ${S}/nscd/nscd.init ${D}${sysconfdir}/init.d/nscd
 }
 
 TMP_LOCALE="/tmp/locale${libdir}/locale"
@@ -158,7 +196,7 @@ python __anonymous () {
                 depends = bb.data.getVar("DEPENDS", d, 1)
                 depends = "%s qemu-native" % depends
                 bb.data.setVar("DEPENDS", depends, d)
-                bb.data.setVar("GLIBC_INTERNAL_USE_BINARY_LOCALE", "1", d)
+                bb.data.setVar("GLIBC_INTERNAL_USE_BINARY_LOCALE", "compile", d)
                 break
 }
 
@@ -262,23 +300,37 @@ python package_do_split_gconvs () {
 
 	do_split_packages(d, locales_dir, file_regex='(.*)', output_pattern='eglibc-localedata-%s', description='locale definition for %s', hook=calc_locale_deps, extra_depends='')
 	bb.data.setVar('PACKAGES', bb.data.getVar('PACKAGES', d) + ' eglibc-gconv', d)
-
-	supported = bb.data.getVar('GLIBC_GENERATE_LOCALES', d, 1)
-	if not supported or supported == "all":
-	    f = open(base_path_join(bb.data.getVar('WORKDIR', d, 1), "SUPPORTED"), "r")
-	    supported = f.readlines()
-	    f.close()
-	else:
-	    supported = supported.split()
-	    supported = map(lambda s:s.replace(".", " ") + "\n", supported)
-
+	use_bin = bb.data.getVar("GLIBC_INTERNAL_USE_BINARY_LOCALE", d, 1)
 	dot_re = re.compile("(.*)\.(.*)")
 
+	if use_bin != "precompiled":
+	    supported = bb.data.getVar('GLIBC_GENERATE_LOCALES', d, 1)
+	    if not supported or supported == "all":
+		f = open(base_path_join(bb.data.getVar('WORKDIR', d, 1), "SUPPORTED"), "r")
+		supported = f.readlines()
+		f.close()
+	    else:
+		supported = supported.split()
+		supported = map(lambda s:s.replace(".", " ") + "\n", supported)
+
+        else:
+	   supported = []
+	   full_bin_path = bb.data.getVar('PKGD', d, True) + binary_locales_dir
+	   for dir in os.listdir(full_bin_path):
+		dbase = dir.split(".")
+		d2 = "  "
+		if len(dbase) > 1:
+		    d2 = "." + dbase[1].upper() + "  "
+		supported.append(dbase[0] + d2)
+
 	# Collate the locales by base and encoding
+	utf8_only = int(bb.data.getVar('LOCALE_UTF8_ONLY', d, 1) or 0)
 	encodings = {}
 	for l in supported:
 		l = l[:-1]
 		(locale, charset) = l.split(" ")
+		if utf8_only and charset != 'UTF-8':
+		    continue
 		m = dot_re.match(locale)
 		if m:
 			locale = m.group(1)
@@ -286,40 +338,34 @@ python package_do_split_gconvs () {
 			encodings[locale] = []
 		encodings[locale].append(charset)
 
-	def output_locale_source(name, locale, encoding):
-		pkgname = 'locale-base-' + legitimize_package_name(name)
-
+	def output_locale_source(name, pkgname, locale, encoding):
 		bb.data.setVar('RDEPENDS_%s' % pkgname, 'localedef eglibc-localedata-%s eglibc-charmap-%s' % (legitimize_package_name(locale), legitimize_package_name(encoding)), d)
-		rprovides = 'virtual-locale-%s' % legitimize_package_name(name)
-		m = re.match("(.*)_(.*)", name)
-		if m:
-			rprovides += ' virtual-locale-%s' % m.group(1)
-		bb.data.setVar('RPROVIDES_%s' % pkgname, rprovides, d)
-		bb.data.setVar('PACKAGES', '%s %s' % (pkgname, bb.data.getVar('PACKAGES', d, 1)), d)
-		bb.data.setVar('ALLOW_EMPTY_%s' % pkgname, '1', d)
+		
 		bb.data.setVar('pkg_postinst_%s' % pkgname, bb.data.getVar('locale_base_postinst', d, 1) % (locale, encoding, locale), d)
 		bb.data.setVar('pkg_postrm_%s' % pkgname, bb.data.getVar('locale_base_postrm', d, 1) % (locale, encoding, locale), d)
 
-	def output_locale_binary(name, locale, encoding):
+	def output_locale_binary_rdepends(name, pkgname, locale, encoding):
+		m = re.match("(.*)\.(.*)", name)
+		if m:
+		    glibc_name = "%s.%s" % (m.group(1), m.group(2).lower().replace("-",""))
+		else:
+		    glibc_name = name
+		bb.data.setVar('RDEPENDS_%s' % pkgname, legitimize_package_name('eglibc-binary-localedata-%s' % glibc_name), d)
+		bb.data.setVar('RPROVIDES_%s' % pkgname, 'glibc-binary-localedata-%s' % glibc_name, d)
+
+	def output_locale_binary(name, pkgname, locale, encoding):
+		# This is a hack till linux-libc-headers gets patched for the missing arm syscalls and all arm device kernels as well
+		if bb.data.getVar("DISTRO_NAME", d, 1) == "Angstrom":
+			kernel_ver = "2.6.24"
+		elif bb.data.getVar("DISTRO_NAME", d, 1) == "KaeilOS":
+			kernel_ver = "2.6.24"
+		else:
+			kernel_ver = bb.data.getVar("OLDEST_KERNEL", d, 1)
+
 		qemu = qemu_target_binary(d) + " -s 1048576"
-		kernel_ver = bb.data.getVar("OLDEST_KERNEL", d, 1)
 		if kernel_ver:
 			qemu += " -r %s" % (kernel_ver)
 		pkgname = 'locale-base-' + legitimize_package_name(name)
-		m = re.match("(.*)\.(.*)", name)
-		if m:
-			eglibc_name = "%s.%s" % (m.group(1), m.group(2).lower().replace("-",""))
-		else:
-			eglibc_name = name
-		bb.data.setVar('RDEPENDS_%s' % pkgname, legitimize_package_name('eglibc-binary-localedata-%s' % eglibc_name), d)
-		bb.data.setVar('RPROVIDES_%s' % pkgname, 'glibc-binary-localedata-%s' % eglibc_name, d)
-		rprovides = 'virtual-locale-%s' % legitimize_package_name(name)
-		m = re.match("(.*)_(.*)", name)
-		if m:
-			rprovides += ' virtual-locale-%s' % m.group(1)
-		bb.data.setVar('RPROVIDES_%s' % pkgname, rprovides, d)
-		bb.data.setVar('ALLOW_EMPTY_%s' % pkgname, '1', d)
-		bb.data.setVar('PACKAGES', '%s %s' % (pkgname, bb.data.getVar('PACKAGES', d, 1)), d)
 
 		treedir = base_path_join(bb.data.getVar("WORKDIR", d, 1), "locale-tree")
 		ldlibdir = "%s/lib" % treedir
@@ -327,20 +373,35 @@ python package_do_split_gconvs () {
 		i18npath = base_path_join(treedir, datadir, "i18n")
 
 		localedef_opts = "--force --old-style --no-archive --prefix=%s --inputfile=%s/i18n/locales/%s --charmap=%s %s" % (treedir, datadir, locale, encoding, name)
-		cmd = "PATH=\"%s\" I18NPATH=\"%s\" %s -L %s -E LD_LIBRARY_PATH=%s %s/bin/localedef %s" % (path, i18npath, qemu, treedir, ldlibdir, treedir, localedef_opts)
+
+		qemu_options = bb.data.getVar("QEMU_OPTIONS_%s" % bb.data.getVar('PACKAGE_ARCH', d, 1), d, 1)
+		if not qemu_options:
+			qemu_options = bb.data.getVar('QEMU_OPTIONS', d, 1)
+		
+		cmd = "PATH=\"%s\" I18NPATH=\"%s\" %s -L %s -E LD_LIBRARY_PATH=%s %s %s/bin/localedef %s" % (path, i18npath, qemu, treedir, ldlibdir, qemu_options, treedir, localedef_opts)
 		bb.note("generating locale %s (%s)" % (locale, encoding))
 		if os.system(cmd):
 			raise bb.build.FuncFailed("localedef returned an error (command was %s)." % cmd)
 
 	def output_locale(name, locale, encoding):
-		use_bin = bb.data.getVar("GLIBC_INTERNAL_USE_BINARY_LOCALE", d, 1)
-		if use_bin:
-			output_locale_binary(name, locale, encoding)
+
+		pkgname = 'locale-base-' + legitimize_package_name(name)
+		bb.data.setVar('ALLOW_EMPTY_%s' % pkgname, '1', d)
+		bb.data.setVar('PACKAGES', '%s %s' % (pkgname, bb.data.getVar('PACKAGES', d, 1)), d)
+		rprovides = 'virtual-locale-%s' % legitimize_package_name(name)
+		m = re.match("(.*)_(.*)", name)
+		if m:
+			rprovides += ' virtual-locale-%s' % m.group(1)
+		bb.data.setVar('RPROVIDES_%s' % pkgname, rprovides, d)
+		if use_bin == "compile":
+			output_locale_binary_rdepends(name, pkgname, locale, encoding)
+			output_locale_binary(name, pkgname, locale, encoding)
+		elif use_bin == "precompiled":
+			output_locale_binary_rdepends(name, pkgname, locale, encoding)
 		else:
-			output_locale_source(name, locale, encoding)
+			output_locale_source(name, pkgname, locale, encoding)
 
-	use_bin = bb.data.getVar("GLIBC_INTERNAL_USE_BINARY_LOCALE", d, 1)
-	if use_bin:
+	if use_bin == "compile":
 		bb.note("preparing tree for binary locale generation")
 		bb.build.exec_func("do_prep_locale_tree", d)
 
@@ -360,15 +421,16 @@ python package_do_split_gconvs () {
 			for e in encodings[l]:
 				output_locale('%s.%s' % (l, e), l, e)
 
-	if non_utf8 != []:
+	if non_utf8 != [] and use_bin != "precompiled":
 		bb.note("the following locales are supported only in legacy encodings:")
 		bb.note("  " + " ".join(non_utf8))
 
-	use_bin = bb.data.getVar("GLIBC_INTERNAL_USE_BINARY_LOCALE", d, 1)
-	if use_bin:
+	if use_bin == "compile":
 		bb.note("collecting binary locales from locale tree")
 		bb.build.exec_func("do_collect_bins_from_locale_tree", d)
 		do_split_packages(d, binary_locales_dir, file_regex='(.*)', output_pattern='eglibc-binary-localedata-%s', description='binary locale definition for %s', extra_depends='', allow_dirs=True)
+	elif use_bin == "precompiled":
+		do_split_packages(d, binary_locales_dir, file_regex='(.*)', output_pattern='eglibc-binary-localedata-%s', description='binary locale definition for %s', extra_depends='', allow_dirs=True)
 	else:
 		bb.note("generation of binary locales disabled. this may break i18n!")
 
diff --git a/recipes/eglibc/eglibc.inc b/recipes/eglibc/eglibc.inc
index d6487d1..2e215c5 100644
--- a/recipes/eglibc/eglibc.inc
+++ b/recipes/eglibc/eglibc.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.eglibc.org/home"
 SECTION = "libs"
 PRIORITY = "required"
 LICENSE = "LGPL"
-INC_PR = "r12"
+INC_PR = "r13"
 # nptl needs unwind support in gcc, which can't be built without glibc.
 DEPENDS = "virtual/${TARGET_PREFIX}gcc-intermediate linux-libc-headers"
 #this leads to circular deps, so lets not add it yet
@@ -24,4 +24,5 @@ ARM_INSTRUCTION_SET = "arm"
 # PARALLEL_MAKE into PARALLELMFLAGS and empty out PARALLEL_MAKE
 EXTRA_OEMAKE := "PARALLELMFLAGS="${PARALLEL_MAKE}""
 PARALLEL_MAKE = ""
-PACKAGES = "glibc catchsegv sln nscd ldd localedef glibc-utils glibc-dev glibc-doc glibc-locale libsegfault glibc-extra-nss glibc-thread-db glibc-pcprofile"
+
+PACKAGES_DYNAMIC = "libc6*"
diff --git a/recipes/eglibc/eglibc_2.10.bb b/recipes/eglibc/eglibc_2.10.bb
index eba3e36..1eab7eb 100644
--- a/recipes/eglibc/eglibc_2.10.bb
+++ b/recipes/eglibc/eglibc_2.10.bb
@@ -19,10 +19,6 @@ SRC_URI = "svn://svn.eglibc.org/branches;module=${EGLIBC_BRANCH};proto=svn \
 S = "${WORKDIR}/${EGLIBC_BRANCH}/libc"
 B = "${WORKDIR}/build-${TARGET_SYS}"
 
-PACKAGES_DYNAMIC = "libc6*"
-RPROVIDES_${PN}-dev = "libc6-dev virtual-libc-dev"
-PROVIDES_${PN}-dbg = "glibc-dbg"
-
 # the -isystem in bitbake.conf screws up glibc do_stage
 BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
 TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${layout_includedir}"
diff --git a/recipes/eglibc/eglibc_2.11.bb b/recipes/eglibc/eglibc_2.11.bb
index b56a8ce..3763124 100644
--- a/recipes/eglibc/eglibc_2.11.bb
+++ b/recipes/eglibc/eglibc_2.11.bb
@@ -19,10 +19,6 @@ SRC_URI = "svn://svn.eglibc.org/branches;module=${EGLIBC_BRANCH};proto=svn \
 S = "${WORKDIR}/${EGLIBC_BRANCH}/libc"
 B = "${WORKDIR}/build-${TARGET_SYS}"
 
-PACKAGES_DYNAMIC = "libc6*"
-RPROVIDES_${PN}-dev = "libc6-dev virtual-libc-dev"
-PROVIDES_${PN}-dbg = "glibc-dbg"
-
 # the -isystem in bitbake.conf screws up glibc do_stage
 BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
 TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${layout_includedir}"
diff --git a/recipes/eglibc/eglibc_2.12.bb b/recipes/eglibc/eglibc_2.12.bb
index aff8aa3..c0949c4 100644
--- a/recipes/eglibc/eglibc_2.12.bb
+++ b/recipes/eglibc/eglibc_2.12.bb
@@ -20,10 +20,6 @@ SRC_URI = "svn://svn.eglibc.org/branches;module=${EGLIBC_BRANCH};proto=svn \
 S = "${WORKDIR}/${EGLIBC_BRANCH}/libc"
 B = "${WORKDIR}/build-${TARGET_SYS}"
 
-PACKAGES_DYNAMIC = "libc6*"
-RPROVIDES_${PN}-dev = "libc6-dev virtual-libc-dev"
-PROVIDES_${PN}-dbg = "glibc-dbg"
-
 # the -isystem in bitbake.conf screws up glibc do_stage
 BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
 TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${layout_includedir}"
diff --git a/recipes/eglibc/eglibc_2.9.bb b/recipes/eglibc/eglibc_2.9.bb
index fff4fc9..c06345e 100644
--- a/recipes/eglibc/eglibc_2.9.bb
+++ b/recipes/eglibc/eglibc_2.9.bb
@@ -19,10 +19,6 @@ SRC_URI = "svn://svn.eglibc.org/branches;module=${EGLIBC_BRANCH};proto=svn \
 S = "${WORKDIR}/${EGLIBC_BRANCH}/libc"
 B = "${WORKDIR}/build-${TARGET_SYS}"
 
-PACKAGES_DYNAMIC = "libc6*"
-RPROVIDES_${PN}-dev = "libc6-dev virtual-libc-dev"
-PROVIDES_${PN}-dbg = "glibc-dbg"
-
 # the -isystem in bitbake.conf screws up glibc do_stage
 BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
 TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${layout_includedir}"
diff --git a/recipes/eglibc/eglibc_svn.bb b/recipes/eglibc/eglibc_svn.bb
index 32679a0..c5a4990 100644
--- a/recipes/eglibc/eglibc_svn.bb
+++ b/recipes/eglibc/eglibc_svn.bb
@@ -17,10 +17,6 @@ SRC_URI = "svn://svn.eglibc.org;module=${EGLIBC_BRANCH} \
 S = "${WORKDIR}/${EGLIBC_BRANCH}/libc"
 B = "${WORKDIR}/build-${TARGET_SYS}"
 
-PACKAGES_DYNAMIC = "libc6*"
-RPROVIDES_${PN}-dev = "libc6-dev virtual-libc-dev"
-PROVIDES_${PN}-dbg = "glibc-dbg"
-
 # the -isystem in bitbake.conf screws up glibc do_stage
 BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
 TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${layout_includedir}"
-- 
1.7.1



