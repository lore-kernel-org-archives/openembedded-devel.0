Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1OWD5R-0005YD-SX
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Jul 2010 20:41:45 +0200
Received: by bwz10 with SMTP id 10so3406356bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Jul 2010 11:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer;
	bh=Hm98DwveMIsP/6XURuUdqs1YZatQguMOtebU5B5x4JU=;
	b=wVbUHtDdeUgVUKU/n3NoyIZBD32qhFxVb686ZWI0Cc4nlU7P513/hj/ENNK6PcXuM5
	Vo5qo9I21nfewNcmFQZC+chnhlqdul/WDUW4rRsea2BhU9ZNlffwpbKIJ/xTFA8RElJe
	7g1fPnHO23WZSoRgkl4Kkq38Pk7ihq7gyuu4Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=a/FCSMhH5ZhLtOtmpDzKdhPO/vZ1Xzkg+EK1U50UY+guxXlp2NcLyxd6rJAltmkzVx
	hGJpYsfbwN3dZbo1rXoYeYos5x6qi1eplD/Wr1vnhP9lakIoIABwRX8/jsNEN2S/3Z7j
	xlZ2fBFiQSTezbJopQi+6KjZI1Ml/tbouhD7U=
Received: by 10.204.120.130 with SMTP id d2mr4091344bkr.9.1278441413032;
	Tue, 06 Jul 2010 11:36:53 -0700 (PDT)
Received: from s42.loc (85-127-92-50.dynamic.xdsl-line.inode.at [85.127.92.50])
	by mx.google.com with ESMTPS id
	bq20sm23439098bkb.16.2010.07.06.11.36.50
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 06 Jul 2010 11:36:51 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1OWD0d-0000u0-Cj; Tue, 06 Jul 2010 20:36:43 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: Phil Blundell <philb@gnu.org>
Date: Tue,  6 Jul 2010 20:36:34 +0200
Message-Id: <1278441397-3361-1-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH][v2 1/4] uClibc: redo configuration
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
X-List-Received-Date: Tue, 06 Jul 2010 18:41:45 -0000

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 conf/distro/include/sane-toolchain-uclibc.inc |    7 +
 conf/distro/include/sane-toolchain.inc        |    3 +-
 conf/distro/include/uclibc.inc                |    8 +
 recipes/uclibc/bfin-uclibc_svn.bb             |    2 +-
 recipes/uclibc/uclibc-config.inc              |  110 +++++++++++
 recipes/uclibc/uclibc-initial_0.9.30.2.bb     |   12 +-
 recipes/uclibc/uclibc-initial_0.9.30.bb       |    5 +-
 recipes/uclibc/uclibc-initial_git.bb          |    6 +-
 recipes/uclibc/uclibc-old.inc                 |  186 +++++++++++++++++++
 recipes/uclibc/uclibc.inc                     |  246 ++++++++++++-------------
 recipes/uclibc/uclibc_0.9.28.bb               |    2 +-
 recipes/uclibc/uclibc_0.9.29.bb               |    2 +-
 recipes/uclibc/uclibc_0.9.30.1.bb             |    2 +-
 recipes/uclibc/uclibc_0.9.30.bb               |    2 +-
 recipes/uclibc/uclibc_git.bb                  |    1 -
 15 files changed, 444 insertions(+), 150 deletions(-)
 create mode 100644 recipes/uclibc/uclibc-config.inc
 create mode 100644 recipes/uclibc/uclibc-old.inc

diff --git a/conf/distro/include/sane-toolchain-uclibc.inc b/conf/distro/include/sane-toolchain-uclibc.inc
index 314340a..9f515a0 100644
--- a/conf/distro/include/sane-toolchain-uclibc.inc
+++ b/conf/distro/include/sane-toolchain-uclibc.inc
@@ -14,6 +14,13 @@ USE_NLS ?= "no"
 USE_NLS_glib-2.0-native = "yes"
 USE_NLS_gcc-cross = "no"
 
+PREFERRED_VERSION_uclibc                    ?= "${PREFERRED_UCLIBC_VERSION}"
+PREFERRED_VERSION_uclibc-initial            ?= "${PREFERRED_UCLIBC_VERSION}"
+PREFERRED_VERSION_uclibc-cross              ?= "${PREFERRED_UCLIBC_VERSION}"
+PREFERRED_VERSION_uclibc-cross-sdk          ?= "${PREFERRED_UCLIBC_VERSION}"
+PREFERRED_VERSION_uclibc-cross-initial      ?= "${PREFERRED_UCLIBC_VERSION}"
+PREFERRED_VERSION_uclibc-cross-intermediate ?= "${PREFERRED_UCLIBC_VERSION}"
+
 #mess with compiler flags to use -Os instead of -O2
 #Please see http://free-electrons.com/doc/embedded_linux_optimizations/img47.html for some more info
 FULL_OPTIMIZATION = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os"
diff --git a/conf/distro/include/sane-toolchain.inc b/conf/distro/include/sane-toolchain.inc
index 00ba0f9..6b6b170 100644
--- a/conf/distro/include/sane-toolchain.inc
+++ b/conf/distro/include/sane-toolchain.inc
@@ -13,8 +13,7 @@ PREFERRED_VERSION_glibc             ?= "2.10.1"
 PREFERRED_VERSION_glibc-initial     ?= "2.10.1"
 PREFERRED_VERSION_eglibc             ?= "2.11"
 PREFERRED_VERSION_eglibc-initial     ?= "2.11"
-PREFERRED_VERSION_uclibc            ?= "0.9.30.1"
-PREFERRED_VERSION_uclibc-initial    ?= "0.9.30.1"
+PREFERRED_UCLIBC_VERSION            ?= "0.9.31"
 
 # Some systems need a special gcc version
 PREFERRED_GCC_VERSION_486sx          ?= "4.3.2"
diff --git a/conf/distro/include/uclibc.inc b/conf/distro/include/uclibc.inc
index ee18fc8..b40fbf5 100644
--- a/conf/distro/include/uclibc.inc
+++ b/conf/distro/include/uclibc.inc
@@ -9,3 +9,11 @@ PREFERRED_PROVIDER_virtual/libintl_avr32 = "proxy-libintl"
 PREFERRED_PROVIDER_virtual/libc = "uclibc"
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-initial = "uclibc-initial"
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc = "uclibc"
+
+# libc settings
+DISTRO_FEATURES += "${@['', ' nls'][bb.data.getVar('ENABLE_BINARY_LOCALE_GENERATION', d, 1) == '1']}"
+MACHINE_FEATURES += "${@['', ' bx'][bb.data.getVar('ARM_INSTRUCTION_SET', d, 1) == 'thumb']}"
+# FIXME: We enable IPv4 per default to avoid alot of breakage.
+# FIXME: Figure out an acceptable way to negotiate either
+# FIXME: desired features or hard requirements, either top-down or bottom-up.
+DISTRO_FEATURES += " ipv4"
diff --git a/recipes/uclibc/bfin-uclibc_svn.bb b/recipes/uclibc/bfin-uclibc_svn.bb
index e8cb63e..2757fc2 100644
--- a/recipes/uclibc/bfin-uclibc_svn.bb
+++ b/recipes/uclibc/bfin-uclibc_svn.bb
@@ -9,7 +9,7 @@
 UCLIBC_BASE ?= "0.9.29"
 PV = "${UCLIBC_BASE}+svnr${SRCPV}"
 
-require uclibc.inc
+require uclibc-old.inc
 PR = "${INC_PR}.0"
 SRCREV = "1857"
 PROVIDES_append_bfin = " virtual/${TARGET_PREFIX}libc-for-gcc "
diff --git a/recipes/uclibc/uclibc-config.inc b/recipes/uclibc/uclibc-config.inc
new file mode 100644
index 0000000..624f596
--- /dev/null
+++ b/recipes/uclibc/uclibc-config.inc
@@ -0,0 +1,110 @@
+#
+# Set the ARCH environment variable for uClibc compilation.
+# Return value must match one of the architectures known to uClibc:
+# libc/sysdeps/*/*
+#
+
+valid_archs = "\
+alpha \
+arm \
+avr32 \
+bfin \
+cris \
+e1 \
+frv \
+h8300 \
+hppa \
+i386 \
+i960 \
+ia64 \
+m68k \
+microblaze \
+mips \
+nios \
+nios2 \
+powerpc \
+sh \
+sh64 \
+sparc \
+v850 \
+vax \
+x86_64 \
+xtensa \
+"
+def map_uclibc_arch(a, d):
+	"""Return the uClibc architecture for the given TARGET_ARCH."""
+	import re
+
+	valid_archs = bb.data.getVar('valid_archs', d, 1).split()
+
+	if   re.match('^(arm|sa110).*', a):	return 'arm'
+	elif re.match('^(i.86|athlon)$', a):	return 'i386'
+	elif re.match('^mips.*', a):		return 'mips'
+	elif re.match('^parisc.*', a):		return 'hppa'
+	elif re.match('^ppc.*', a):		return 'powerpc'
+	elif re.match('^s390.*', a):		return 's390'
+	elif re.match('^sh.*', a):		return 'sh'
+	elif re.match('^(sun|sparc).*', a):	return 'sparc'
+	elif re.match('^xtensa.*', a):		return 'xtensa'
+        elif a in valid_archs:			return a
+	else:
+		bb.error("cannot map '%s' to a uClibc architecture" % a)
+
+export UCLIBC_ARCH = "${@map_uclibc_arch(bb.data.getVar('TARGET_ARCH', d, 1), d)}"
+
+def map_uclibc_abi(o, d):
+	"""Return the uClibc ABI for the given TARGET_OS."""
+	import re
+
+	arch = bb.data.getVar('TARGET_ARCH', d, 1)
+	if   map_uclibc_arch(bb.data.getVar('TARGET_ARCH', d, 1), d) == "arm":
+		if re.match('.*eabi$', o): return 'ARM_EABI'
+		else:                    return 'ARM_OABI'
+	# FIXME: This is inaccurate! Handle o32, n32, n64
+	elif re.match('^mips.*64$', arch):  return 'MIPS_N64_ABI'
+	elif re.match('^mips.*', arch):    return 'MIPS_N32_ABI'
+	return ""
+
+export UCLIBC_ABI = "${@map_uclibc_abi(bb.data.getVar('TARGET_OS', d, 1), d)}"
+
+def map_uclibc_endian(a, d):
+	"""Return the uClibc endianess for the given TARGET_ARCH."""
+	import re
+
+	# Always BE
+	if re.match('^(avr32|e1|frv|(parisc|hppa)|m68k|microblaze|powerpc.*|(sparc|sun).*)$', a):
+		return 'BIG'
+	# Possibly BE
+	elif re.match('^((arm|sa110|arm.*eb)|h8300.*eb|(parisc|hppa).*eb|mips|sh.*eb|xtensa.*eb)$', a):
+		return 'BIG'
+	return 'LITTLE'
+
+export UCLIBC_ENDIAN = "${@map_uclibc_endian(bb.data.getVar('TARGET_ARCH', d, 1), d)}"
+
+# internal helper
+def uclibc_cfg(feature, features, tokens, cnf, rem):
+	if type(tokens) == type(""):
+		tokens = [tokens]
+	rem.extend(['/^[# ]*' + token + '[ =]/d' for token in tokens])
+	if type(features) == type([]) and feature in features:
+		cnf.extend([token + '=y' for token in tokens])
+	else:
+		cnf.extend(['# ' + token + ' is not set' for token in tokens])
+# Map distro and machine features to config settings
+def features_to_uclibc_settings(d):
+	cnf, rem = ([], [])
+	distro_features = bb.data.getVar('DISTRO_FEATURES', d).split()
+	machine_features = bb.data.getVar('MACHINE_FEATURES', d).split()
+	uclibc_cfg('ipv4', distro_features, 'UCLIBC_HAS_IPV4', cnf, rem)
+	uclibc_cfg('ipv6', distro_features, 'UCLIBC_HAS_IPV6', cnf, rem)
+	uclibc_cfg('nls',  distro_features, 'UCLIBC_HAS_LOCALE', cnf, rem)
+	uclibc_cfg('bx',   machine_features, 'USE_BX', cnf, rem)
+	return "\n".join(cnf), "\n".join(rem)
+# X, Y = ${@features_to_uclibc_settings(d)}
+# unfortunately doesn't seem to work with bitbake, workaround:
+def features_to_uclibc_conf(d):
+	cnf, rem = features_to_uclibc_settings(d)
+	return cnf
+def features_to_uclibc_del(d):
+	cnf, rem = features_to_uclibc_settings(d)
+	return rem
diff --git a/recipes/uclibc/uclibc-initial_0.9.30.2.bb b/recipes/uclibc/uclibc-initial_0.9.30.2.bb
index a9fa146..d00cb38 100644
--- a/recipes/uclibc/uclibc-initial_0.9.30.2.bb
+++ b/recipes/uclibc/uclibc-initial_0.9.30.2.bb
@@ -7,19 +7,15 @@ PACKAGES = ""
 
 do_install() {
 	# Install initial headers into the cross dir
-	make V=1 CC="${CC}" PREFIX=${D} DEVEL_PREFIX=${prefix}/ RUNTIME_PREFIX=/ \
-		install_headers
+	make PREFIX=${D} install_headers
 	#ln -sf include ${CROSS_DIR}/${TARGET_SYS}/sys-include
 
-	# This conflicts with the c++ version of this header
-	rm -f ${D}${includedir}/bits/atomicity.h
-	install -d ${D}${libdir}/
-	install -m 644 lib/crt[1in].o ${D}${libdir}/
-	install -m 644 lib/libc.so ${D}${libdir}/
+	install -d ${D}${layout_libdir}/
+	install -m 644 lib/crt[1in].o lib/libc.so ${D}${layout_libdir}/
 }
 
 do_compile () {
-	make V=1 CC="${CC}" PREFIX=${D} DEVEL_PREFIX=${prefix}/ RUNTIME_PREFIX=/ \
+	make PREFIX=${D} \
 		lib/crt1.o lib/crti.o lib/crtn.o
 	${CC} -nostdlib -nostartfiles -shared -x c /dev/null \
 		-o lib/libc.so
diff --git a/recipes/uclibc/uclibc-initial_0.9.30.bb b/recipes/uclibc/uclibc-initial_0.9.30.bb
index 84c35c8..9391a8c 100644
--- a/recipes/uclibc/uclibc-initial_0.9.30.bb
+++ b/recipes/uclibc/uclibc-initial_0.9.30.bb
@@ -12,11 +12,8 @@ do_install() {
 
 	#ln -sf include ${CROSS_DIR}/${TARGET_SYS}/sys-include
 
-	# This conflicts with the c++ version of this header
-	rm -f ${D}${includedir}/bits/atomicity.h
 	install -d ${D}${libdir}/
-	install -m 644 lib/crt[1in].o ${D}${libdir}/
-	install -m 644 lib/libc.so ${D}${libdir}/
+	install -m 644 lib/crt[1in].o lib/libc.so ${D}${libdir}/
 }
 
 do_compile () {
diff --git a/recipes/uclibc/uclibc-initial_git.bb b/recipes/uclibc/uclibc-initial_git.bb
index 8c582e0..dd69dc0 100644
--- a/recipes/uclibc/uclibc-initial_git.bb
+++ b/recipes/uclibc/uclibc-initial_git.bb
@@ -7,19 +7,17 @@ PACKAGES = ""
 
 do_install() {
 	# Install initial headers into the cross dir
-	make V=1 CC="${CC}" PREFIX=${D} DEVEL_PREFIX=${prefix}/ RUNTIME_PREFIX=/ \
+	make PREFIX=${D} DEVEL_PREFIX=${prefix}/ RUNTIME_PREFIX=/ \
 		install_headers
 	#ln -sf include ${CROSS_DIR}/${TARGET_SYS}/sys-include
 
-	# This conflicts with the c++ version of this header
-	rm -f ${D}${includedir}/bits/atomicity.h
 	install -d ${D}${libdir}/
 	install -m 644 lib/crt[1in].o ${D}${libdir}/
 	install -m 755 lib/lib[cm].so ${D}${libdir}/
 }
 
 do_compile () {
-	make V=1 CC="${CC}" PREFIX=${D} DEVEL_PREFIX=${prefix}/ RUNTIME_PREFIX=/ \
+	make PREFIX=${D} DEVEL_PREFIX=${prefix}/ RUNTIME_PREFIX=/ \
 		lib/crt1.o lib/crti.o lib/crtn.o
 	${CC} -nostdlib -nostartfiles -shared -x c /dev/null \
 		-o lib/libc.so
diff --git a/recipes/uclibc/uclibc-old.inc b/recipes/uclibc/uclibc-old.inc
new file mode 100644
index 0000000..7198c44
--- /dev/null
+++ b/recipes/uclibc/uclibc-old.inc
@@ -0,0 +1,186 @@
+DESCRIPTION = "C library for embedded systems"
+LICENSE = "LGPL"
+SECTION = "libs"
+PRIORITY = "required"
+INC_PR = "r35"
+#
+# For now, we will skip building of a gcc package if it is a uclibc one
+# and our build is not a uclibc one, and we skip a glibc one if our build
+# is a uclibc build.
+#
+# See the note in gcc/gcc_3.4.0.oe
+#
+
+python __anonymous () {
+    import bb, re
+    uc_os = (re.match('.*uclibc*', bb.data.getVar('TARGET_OS', d, 1)) != None)
+    if not uc_os:
+        raise bb.parse.SkipPackage("incompatible with target %s" %
+                                   bb.data.getVar('TARGET_OS', d, 1))
+}
+
+PROVIDES += "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc"
+PROVIDES += "${@['virtual/libiconv', ''][bb.data.getVar('USE_NLS', d, 1) != 'yes']}"
+DEPENDS = "virtual/${TARGET_PREFIX}binutils \
+	   virtual/${TARGET_PREFIX}gcc-intermediate linux-libc-headers ncurses-native pax-utils-native"
+RDEPENDS_${PN}-dev = "linux-libc-headers-dev"
+
+# Blackfin needs a wrapper around ld
+#DEPENDS_append_bfin = " elf2flt "
+
+INHIBIT_DEFAULT_DEPS = "1"
+PARALLEL_MAKE = ""
+
+PACKAGES =+ "ldd uclibc-utils-dbg uclibc-utils uclibc-gconv uclibc-thread-db"
+
+LEAD_SONAME = "libc.so"
+
+# The last line (gdb and lib1) is for uclinux-uclibc builds 
+uclibc_baselibs = "${base_libdir}/libcrypt*.so.* ${base_libdir}/libcrypt-*.so \
+		   ${base_libdir}/libintl*.so.* ${base_libdir}/libintl-*.so \
+		   ${base_libdir}/libnsl*.so.* ${base_libdir}/libnsl-*.so \
+		   ${base_libdir}/libresolv*.so.* ${base_libdir}/libresolv-*.so \
+                   ${base_libdir}/ld*.so.* ${base_libdir}/ld-*.so \
+		   ${base_libdir}/libc*.so.* ${base_libdir}/libuClibc-*.so \
+                   ${base_libdir}/libdl*.so.* ${base_libdir}/libdl-*.so \
+		   ${base_libdir}/libm*.so.* ${base_libdir}/libm-*.so \
+                   ${base_libdir}/libutil*.so.* ${base_libdir}/libutil-*.so \
+		   ${base_libdir}/libpthread*.so.* ${base_libdir}/libpthread-*.so \
+                   ${base_libdir}/librt*.so.* ${base_libdir}/librt-*.so \
+                   ${libdir}/libc.gdb ${libdir}/libc ${base_libdir}/lib1.so \
+                   "
+FILES_${PN} = "${sysconfdir} ${uclibc_baselibs} /sbin/ldconfig \
+	       ${libexecdir} ${datadir}/zoneinfo ${libdir}/locale"
+FILES_ldd = "${bindir}/ldd"
+FILES_uclibc-dev_append = " ${libdir}/*.o ${libdir}/*_nonshared.a"
+FILES_uclibc-utils = "${bindir} ${sbindir}"
+FILES_uclibc-utils-dbg += "${bindir}/.debug ${sbindir}/.debug"
+FILES_uclibc-gconv = "${libdir}/gconv"
+FILES_uclibc-thread-db = "/lib/libthread_db*"
+RPROVIDES_uclibc-dev += "libc-dev virtual-libc-dev"
+
+#
+# This locale file gets copied into uClibc-${PV}/extra/locale/ prior to
+# build, it does not need to be unpacked, but we can't inhibit the unpacking
+# in the current build system.
+#
+UCLIBC_LOCALE_FILE = "uClibc-locale-030818.tgz"
+UCLIBC_LOCALE_FILE_arm = "uClibc-locale-030818.arm.tgz"
+UCLIBC_LOCALE_URI = "http://www.uclibc.org/downloads/${UCLIBC_LOCALE_FILE}"
+UCLIBC_LOCALE_URI_arm = "http://wiki.openembedded.net/dl/uclibc-locale/${UCLIBC_LOCALE_FILE}"
+
+SRC_URI = "${@['${UCLIBC_LOCALE_URI}', ''][bb.data.getVar('USE_NLS', d, 1) != 'yes']} \
+	   file://uClibc.config \
+           http://www.uclibc.org/downloads/uClibc-${PV}.tar.bz2;name=uClibc-${PV} \
+          "
+
+# do_stage barfs on a CC with whitepspace, therefore put the 'HOST_CC_ARCH' in
+# the CFLAGS (for when building the utils).
+OEMAKE_NO_CC = "'STRIPTOOL=true' 'LD=${LD}' \
+		'LOCALE_DATA_FILENAME=${UCLIBC_LOCALE_FILE}'"
+EXTRA_OEMAKE = "${OEMAKE_NO_CC} 'CC=${CC}' \
+		'HOSTCFLAGS=-I${STAGING_INCDIR_NATIVE}' \
+		ARCH=`grep TARGET_ARCH ${S}/.config|sed -e 's/TARGET_ARCH=//g'`"
+EXTRA_OEMAKE_task_do_package = "${OEMAKE_NO_CC}"
+
+KERNEL_SOURCE = "${STAGING_INCDIR}"
+KERNEL_HEADERS = "${STAGING_INCDIR}"
+
+# Lets munge this via siteinfo.bbclass as well:
+# ARCH_BIG_ENDIAN=y
+# ARCH_WANTS_BIG_ENDIAN=y
+# ARCH_WANTS_LITTLE_ENDIAN is not set
+
+# How to enable verbose logs:
+#export VERBOSE="1"
+
+configmangle = 's,^KERNEL_SOURCE=.*,KERNEL_SOURCE="${KERNEL_SOURCE}",g; \
+		s,^KERNEL_HEADERS=.*,KERNEL_HEADERS="${KERNEL_HEADERS}",g; \
+		s,^RUNTIME_PREFIX=.*,RUNTIME_PREFIX="/",g; \
+		s,^DEVEL_PREFIX=.*,DEVEL_PREFIX="/${prefix}",g; \
+		s,^SHARED_LIB_LOADER_PATH=.*,SHARED_LIB_LOADER_PATH="/lib",; \
+		s,^SHARED_LIB_LOADER_PREFIX=.*,SHARED_LIB_LOADER_PREFIX="/lib",; \
+		s,.*UCLIBC_HAS_WCHAR.*,UCLIBC_HAS_WCHAR=y,g; \
+		${@["","s,.*UCLIBC_HAS_LOCALE.*,UCLIBC_HAS_LOCALE=y,;"][bb.data.getVar("USE_NLS", d, 1) == "yes"]} \
+		${@["","s,.*LDSO_GNU_HASH_SUPPORT.*,# LDSO_GNU_HASH_SUPPORT is not set,;"][bb.data.getVar("TARGET_ARCH", d, 1) in ['mips', 'mipsel', 'avr32']]} \
+               '
+
+CFLAGS := "${@oe_filter_out('-I\S+', '${CFLAGS}', d)}"
+
+python () {
+	if bb.data.getVar('TARGET_FPU', d, 1) in [ 'soft' ]:
+		bb.data.setVar('configmangle_append', ' s,^HAS_FPU=y,# HAS_FPU is not set,;', d)
+}
+
+uclibcbuild_do_patch() {
+	ln -sf ${STAGING_INCDIR}/linux ${S}/include/linux
+	ln -sf ${STAGING_INCDIR}/asm ${S}/include/asm
+	
+	${@['cp %s/%s extra/locale' % (bb.data.getVar('DL_DIR', d, 1) or '', bb.data.getVar('UCLIBC_LOCALE_FILE', d, 1) or ''), ''][bb.data.getVar('USE_NLS', d, 1) != 'yes']}
+}
+
+python do_patch () {
+	bb.build.exec_func('base_do_patch', d)
+	bb.build.exec_func('uclibcbuild_do_patch', d)
+}
+
+do_configure() {
+	rm -f ${S}/.config
+
+	# For uClibc 0.9.29, OpenEmbedded splits the uClibc.config in two parts:
+	# uClibc.machine and uClibc.distro. So, if they exist use them, otherwise
+	# use a uClibc.config
+	if [ -f ${WORKDIR}/uClibc.machine -a -f ${WORKDIR}/uClibc.distro ]; then
+		echo "### uClibc.machine ###" >${S}/merged.config
+		cat ${WORKDIR}/uClibc.machine >>${S}/merged.config
+		echo "### uClibc.distro ###" >>${S}/merged.config
+		cat ${WORKDIR}/uClibc.distro >>${S}/merged.config
+	else
+		echo "### uClibc.config ###" >${S}/merged.config
+		cat ${WORKDIR}/uClibc.config >>${S}/merged.config
+	fi
+	cp ${S}/merged.config ${S}/.config	
+
+	# Mangle the resulting .config depending on OE variables
+	perl -i -p -e 's,^CROSS=.*,TARGET_ARCH=${TARGET_ARCH}\nCROSS=${TARGET_PREFIX},g' ${S}/Rules.mak
+	sed -i -e s:'$(CROSS)strip':true: ${S}/Rules.mak	
+	perl -i -p -e '${configmangle}' ${S}/.config
+
+   	sed -i -e '/CONFIG_ARM_EABI/d' ${S}/.config
+
+	if [ `echo ${TARGET_ARCH} | grep -e '^arm'` ]; then
+		if [ `echo ${TARGET_OS} | grep -e 'eabi$'` ]; then
+       			echo "CONFIG_ARM_EABI=y"                >> ${S}/.config
+		else
+			echo "# CONFIG_ARM_EABI is not set"     >> ${S}/.config
+		fi
+	fi
+	yes '' | oe_runmake oldconfig
+}
+
+do_install() {
+	oe_runmake PREFIX=${D} DEVEL_PREFIX=${prefix}/ RUNTIME_PREFIX=/ \
+		install_dev install_runtime 
+
+	# Need to overwrite the version from -initial
+	#if [ ! -e ${D}${libdir}/libc.so ]; then
+	#	ln -s ../../lib/libc.so.0 ${D}${libdir}/libc.so
+	#fi
+
+	# We don't really need this in ${includedir}
+	rm -f ${D}${prefix}/include/.cvsignore
+
+	# This conflicts with the c++ version of this header
+	rm -f ${D}${prefix}/include/bits/atomicity.h
+
+        oe_runmake "SSP_ALL_CFLAGS=${TARGET_LINK_HASH_STYLE}" utils
+        oe_runmake STRIPTOOL=true PREFIX=${D} DEVEL_PREFIX=${prefix}/ RUNTIME_PREFIX=/ \
+                install_utils
+	
+	# oe_runstrip needs +x on files	
+	chmod +x ${D}/${base_libdir}/*
+}
+
+get_monotonic_srcrev () {
+    	(cd ${S}; eval `git rev-list HEAD|wc -l`)
+}
diff --git a/recipes/uclibc/uclibc.inc b/recipes/uclibc/uclibc.inc
index 4686d34..4ae79db 100644
--- a/recipes/uclibc/uclibc.inc
+++ b/recipes/uclibc/uclibc.inc
@@ -3,6 +3,7 @@ LICENSE = "LGPL"
 SECTION = "libs"
 PRIORITY = "required"
 INC_PR = "r34"
+require uclibc-config.inc
 #
 # For now, we will skip building of a gcc package if it is a uclibc one
 # and our build is not a uclibc one, and we skip a glibc one if our build
@@ -20,172 +21,165 @@ python __anonymous () {
 }
 
 PROVIDES += "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc"
-PROVIDES += "${@['virtual/libiconv', ''][bb.data.getVar('USE_NLS', d, 1) != 'yes']}"
 DEPENDS = "virtual/${TARGET_PREFIX}binutils \
-	   virtual/${TARGET_PREFIX}gcc-intermediate linux-libc-headers ncurses-native pax-utils-native"
+           virtual/${TARGET_PREFIX}gcc-intermediate \
+           linux-libc-headers ncurses-native"
 RDEPENDS_${PN}-dev = "linux-libc-headers-dev"
 
-# Blackfin needs a wrapper around ld
-#DEPENDS_append_bfin = " elf2flt "
-
 INHIBIT_DEFAULT_DEPS = "1"
-PARALLEL_MAKE = ""
 
 PACKAGES =+ "ldd uclibc-utils-dbg uclibc-utils uclibc-gconv uclibc-thread-db"
 
 LEAD_SONAME = "libc.so"
 
-# The last line (gdb and lib1) is for uclinux-uclibc builds 
+# The last line (gdb and lib1) is for uclinux-uclibc builds
 uclibc_baselibs = "${base_libdir}/libcrypt*.so.* ${base_libdir}/libcrypt-*.so \
-		   ${base_libdir}/libintl*.so.* ${base_libdir}/libintl-*.so \
-		   ${base_libdir}/libnsl*.so.* ${base_libdir}/libnsl-*.so \
-		   ${base_libdir}/libresolv*.so.* ${base_libdir}/libresolv-*.so \
+                   ${base_libdir}/libintl*.so.* ${base_libdir}/libintl-*.so \
+                   ${base_libdir}/libnsl*.so.* ${base_libdir}/libnsl-*.so \
+                   ${base_libdir}/libresolv*.so.* ${base_libdir}/libresolv-*.so \
                    ${base_libdir}/ld*.so.* ${base_libdir}/ld-*.so \
-		   ${base_libdir}/libc*.so.* ${base_libdir}/libuClibc-*.so \
+                   ${base_libdir}/libc*.so.* ${base_libdir}/libuClibc-*.so \
                    ${base_libdir}/libdl*.so.* ${base_libdir}/libdl-*.so \
-		   ${base_libdir}/libm*.so.* ${base_libdir}/libm-*.so \
+                   ${base_libdir}/libm*.so.* ${base_libdir}/libm-*.so \
                    ${base_libdir}/libutil*.so.* ${base_libdir}/libutil-*.so \
-		   ${base_libdir}/libpthread*.so.* ${base_libdir}/libpthread-*.so \
+                   ${base_libdir}/libpthread*.so.* ${base_libdir}/libpthread-*.so \
                    ${base_libdir}/librt*.so.* ${base_libdir}/librt-*.so \
                    ${libdir}/libc.gdb ${libdir}/libc ${base_libdir}/lib1.so \
-                   "
+                  "
 FILES_${PN} = "${sysconfdir} ${uclibc_baselibs} /sbin/ldconfig \
-	       ${libexecdir} ${datadir}/zoneinfo ${libdir}/locale"
+               ${libexecdir} ${datadir}/zoneinfo ${libdir}/locale"
 FILES_ldd = "${bindir}/ldd"
-FILES_uclibc-dev_append = " ${libdir}/*.o ${libdir}/*_nonshared.a"
+FILES_uclibc-dev_append = "\
+        ${libdir}/lib*.so \
+        ${libdir}/*_nonshared.a \
+        ${libdir}/[S]*crt[1in].o \
+        ${libdir}/lib*.a \
+        ${includedir}/*.h ${includedir}/*/*.h \
+       "
 FILES_uclibc-utils = "${bindir} ${sbindir}"
 FILES_uclibc-utils-dbg += "${bindir}/.debug ${sbindir}/.debug"
 FILES_uclibc-gconv = "${libdir}/gconv"
 FILES_uclibc-thread-db = "/lib/libthread_db*"
 RPROVIDES_uclibc-dev += "libc-dev virtual-libc-dev"
 
-#
-# This locale file gets copied into uClibc-${PV}/extra/locale/ prior to
-# build, it does not need to be unpacked, but we can't inhibit the unpacking
-# in the current build system.
-#
-UCLIBC_LOCALE_FILE = "uClibc-locale-030818.tgz"
-UCLIBC_LOCALE_FILE_arm = "uClibc-locale-030818.arm.tgz"
-UCLIBC_LOCALE_URI = "http://www.uclibc.org/downloads/${UCLIBC_LOCALE_FILE};name=locale"
-UCLIBC_LOCALE_URI_arm = "http://wiki.openembedded.net/dl/uclibc-locale/${UCLIBC_LOCALE_FILE};name=localearm"
-
-SRC_URI[locale.md5sum] = "d75b2239b4e27c3c9cbed1c8f6eabba6"
-SRC_URI[locale.sha256sum] = "c4362be318a38f18d98dccf462d22d95bab92f05548bb93f65298fe9afaebd57"
-SRC_URI[localearm.md5sum] = "fc0b6113f2b333564d3558e241059db8"
-SRC_URI[localearm.sha256sum] = "6765f08499079207ba8c4da999d602ca75c384ff5812aa973f27b6a501b3438e"
-
-SRC_URI = "${@['${UCLIBC_LOCALE_URI}', ''][bb.data.getVar('USE_NLS', d, 1) != 'yes']} \
-	   file://uClibc.config \
-           http://www.uclibc.org/downloads/uClibc-${PV}.tar.bz2;name=uClibc-${PV} \
-          "
-
-# do_stage barfs on a CC with whitepspace, therefore put the 'HOST_CC_ARCH' in
-# the CFLAGS (for when building the utils).
-OEMAKE_NO_CC = "'STRIPTOOL=true' 'LD=${LD}' \
-		'LOCALE_DATA_FILENAME=${UCLIBC_LOCALE_FILE}'"
-EXTRA_OEMAKE = "${OEMAKE_NO_CC} 'CC=${CC}' \
-		'HOSTCFLAGS=-I${STAGING_INCDIR_NATIVE}' \
-		ARCH=`grep TARGET_ARCH ${S}/.config|sed -e 's/TARGET_ARCH=//g'`"
-EXTRA_OEMAKE_task_do_package = "${OEMAKE_NO_CC}"
+SRC_URI = "\
+        file://uClibc.config \
+        http://www.uclibc.org/downloads/uClibc-${PV}.tar.bz2;name=uClibc-${PV} \
+        "
 
-KERNEL_SOURCE = "${STAGING_INCDIR}"
-KERNEL_HEADERS = "${STAGING_INCDIR}"
-
-# Lets munge this via siteinfo.bbclass as well:
-# ARCH_BIG_ENDIAN=y
-# ARCH_WANTS_BIG_ENDIAN=y
-# ARCH_WANTS_LITTLE_ENDIAN is not set
-
-# How to enable verbose logs:
-#export VERBOSE="1"
-
-configmangle = 's,^KERNEL_SOURCE=.*,KERNEL_SOURCE="${KERNEL_SOURCE}",g; \
-		s,^KERNEL_HEADERS=.*,KERNEL_HEADERS="${KERNEL_HEADERS}",g; \
-		s,^RUNTIME_PREFIX=.*,RUNTIME_PREFIX="/",g; \
-		s,^DEVEL_PREFIX=.*,DEVEL_PREFIX="/${prefix}",g; \
-		s,^SHARED_LIB_LOADER_PATH=.*,SHARED_LIB_LOADER_PATH="/lib",; \
-		s,^SHARED_LIB_LOADER_PREFIX=.*,SHARED_LIB_LOADER_PREFIX="/lib",; \
-		s,.*UCLIBC_HAS_WCHAR.*,UCLIBC_HAS_WCHAR=y,g; \
-		${@["","s,.*UCLIBC_HAS_LOCALE.*,UCLIBC_HAS_LOCALE=y,;"][bb.data.getVar("USE_NLS", d, 1) == "yes"]} \
-		${@["","s,.*LDSO_GNU_HASH_SUPPORT.*,# LDSO_GNU_HASH_SUPPORT is not set,;"][bb.data.getVar("TARGET_ARCH", d, 1) in ['mips', 'mipsel', 'avr32']]} \
-               '
+# do_stage barfs on a CC with whitespace, therefore put the 'HOST_CC_ARCH' in
+# the CFLAGS (when building the utils).
+OEMAKE_NO_CC = "'STRIPTOOL=true' 'LD=${LD}'"
+EXTRA_OEMAKE = "${OEMAKE_NO_CC} \
+                'HOSTCC=${BUILD_CC}' \
+                'BUILD_CFLAGS=${BUILD_CFLAGS}' \
+                'CC=${CC}' \
+                ARCH=${UCLIBC_ARCH}"
 
-CFLAGS := "${@oe_filter_out('-I\S+', '${CFLAGS}', d)}"
+EXTRA_OEMAKE_task_do_package = "${OEMAKE_NO_CC}"
 
+# enable verbose output:
+export V="1"
+
+UCLIBC_EXTRA_CFLAGS := "${@oe_filter_out('(-I\S+|-i\S+)', '${CFLAGS}', d)}"
+CFLAGS :=#
+
+configmangle = '/^KERNEL_HEADERS/d; \
+                /^RUNTIME_PREFIX/d; \
+                /^DEVEL_PREFIX/d; \
+                /^SHARED_LIB_LOADER_PREFIX/d; \
+                /^UCLIBC_EXTRA_CFLAGS/d; \
+                s,.*UCLIBC_HAS_WCHAR.*,UCLIBC_HAS_WCHAR=y,g; \
+                ${@["","s,.*UCLIBC_HAS_LOCALE.*,UCLIBC_HAS_LOCALE=y,;"][bb.data.getVar("USE_NLS", d, 1) == "yes"]} \
+                ${@["","s,.*LDSO_GNU_HASH_SUPPORT.*,# LDSO_GNU_HASH_SUPPORT is not set,;"][bb.data.getVar("TARGET_ARCH", d, 1) in ['mips', 'mipsel', 'avr32']]} \
+                /^CROSS/d; \
+                /^TARGET_ARCH=/d; \
+                /^TARGET_/s,^\([^=]*\).*,# \1 is not set,g; \
+                s,^DOSTRIP.*,# DOSTRIP is not set,g; \
+                /_[EO]*ABI/d; \
+                /HAS_FPU/d; \
+               '
+OE_FEATURES := "${@features_to_uclibc_conf(d)}"
+OE_DEL      := "${@features_to_uclibc_del(d)}"
 python () {
-	if bb.data.getVar('TARGET_FPU', d, 1) in [ 'soft' ]:
-		bb.data.setVar('configmangle_append', ' s,^HAS_FPU=y,# HAS_FPU is not set,;', d)
+  if "${OE_DEL}":
+    bb.data.setVar('configmangle_append', "${OE_DEL}" + "\n", d)
+  if "${OE_FEATURES}":
+    bb.data.setVar('configmangle_append',
+                   "/^### DISTRO FEATURES$/a\\\n%s\n\n" %
+                   ("\\n".join((bb.data.expand("${OE_FEATURES}", d).split("\n")))),
+                   d)
+  bb.data.setVar('configmangle_append',
+                 "/^### CROSS$/a\\\n%s\n" %
+                  ("\\n".join(["CROSS_COMPILER_PREFIX=\"${TARGET_PREFIX}\"",
+                        "UCLIBC_EXTRA_CFLAGS=\"${UCLIBC_EXTRA_CFLAGS}\"",
+                         "KERNEL_HEADERS=\"${STAGING_INCDIR}\"",
+                         "RUNTIME_PREFIX=\"/\"",
+                         "DEVEL_PREFIX=\"/${prefix}\"",
+                         "SHARED_LIB_LOADER_PREFIX=\"/lib\"",
+                        ])
+                  ),
+                 d)
+  bb.data.setVar('configmangle_append',
+                 "/^### TGT$/a\\\nTARGET_ARCH=\"%s\"\\nTARGET_%s=y\n" %
+                        ("${UCLIBC_ARCH}", "${UCLIBC_ARCH}"),
+                 d)
+  bb.data.setVar('configmangle_append',
+    "/^### FPU$/a\\\n%s\n\n" % (["UCLIBC_HAS_FPU=y","# UCLIBC_HAS_FPU is not set"][bb.data.getVar('TARGET_FPU', d, 1) in [ 'soft' ]]), d)
+  if "${UCLIBC_ENDIAN}":
+    bb.data.setVar('configmangle_append',
+                   "/^### ABI$/a\\\nARCH_%s_ENDIAN=y\n\n" % ("${UCLIBC_ENDIAN}"),
+                   d)
+  if "${UCLIBC_ABI}":
+    bb.data.setVar('configmangle_append',
+                   "/^### ABI$/a\\\nCONFIG_%s=y\n\n" % ("${UCLIBC_ABI}"),
+                   d)
 }
 
 uclibcbuild_do_patch() {
-	ln -sf ${STAGING_INCDIR}/linux ${S}/include/linux
-	ln -sf ${STAGING_INCDIR}/asm ${S}/include/asm
-	
-	${@['cp %s/%s extra/locale' % (bb.data.getVar('DL_DIR', d, 1) or '', bb.data.getVar('UCLIBC_LOCALE_FILE', d, 1) or ''), ''][bb.data.getVar('USE_NLS', d, 1) != 'yes']}
+        ln -sf ${STAGING_INCDIR}/linux ${S}/include/linux
+        ln -sf ${STAGING_INCDIR}/asm ${S}/include/asm
 }
 
 python do_patch () {
-	bb.build.exec_func('base_do_patch', d)
-	bb.build.exec_func('uclibcbuild_do_patch', d)
+        bb.build.exec_func('base_do_patch', d)
+        bb.build.exec_func('uclibcbuild_do_patch', d)
 }
 
 do_configure() {
-	rm -f ${S}/.config
-
-	# For uClibc 0.9.29, OpenEmbedded splits the uClibc.config in two parts:
-	# uClibc.machine and uClibc.distro. So, if they exist use them, otherwise
-	# use a uClibc.config
-	if [ -f ${WORKDIR}/uClibc.machine -a -f ${WORKDIR}/uClibc.distro ]; then
-		echo "### uClibc.machine ###" >${S}/merged.config
-		cat ${WORKDIR}/uClibc.machine >>${S}/merged.config
-		echo "### uClibc.distro ###" >>${S}/merged.config
-		cat ${WORKDIR}/uClibc.distro >>${S}/merged.config
-	else
-		echo "### uClibc.config ###" >${S}/merged.config
-		cat ${WORKDIR}/uClibc.config >>${S}/merged.config
-	fi
-	cp ${S}/merged.config ${S}/.config	
-
-	# Mangle the resulting .config depending on OE variables
-	perl -i -p -e 's,^CROSS=.*,TARGET_ARCH=${TARGET_ARCH}\nCROSS=${TARGET_PREFIX},g' ${S}/Rules.mak
-	sed -i -e s:'$(CROSS)strip':true: ${S}/Rules.mak	
-	perl -i -p -e '${configmangle}' ${S}/.config
-
-   	sed -i -e '/CONFIG_ARM_EABI/d' ${S}/.config
-
-	if [ `echo ${TARGET_ARCH} | grep -e '^arm'` ]; then
-		if [ `echo ${TARGET_OS} | grep -e 'eabi$'` ]; then
-       			echo "CONFIG_ARM_EABI=y"                >> ${S}/.config
-		else
-			echo "# CONFIG_ARM_EABI is not set"     >> ${S}/.config
-		fi
-	fi
-	yes '' | oe_runmake oldconfig
+        rm -f ${S}/.config
+
+        # OpenEmbedded splits the uClibc.config in two parts:
+        # uClibc.machine, uClibc.distro
+        # So, if they exist use them, otherwise use a uClibc.config
+        if [ -f ${WORKDIR}/uClibc.machine -a -f ${WORKDIR}/uClibc.distro ]; then
+                echo "### uClibc.machine ###" >${S}/merged.config
+                cat ${WORKDIR}/uClibc.machine >>${S}/merged.config
+                echo "### uClibc.distro ###" >>${S}/merged.config
+                cat ${WORKDIR}/uClibc.distro >>${S}/merged.config
+        else
+                echo "### uClibc.config ###" >${S}/merged.config
+                cat ${WORKDIR}/uClibc.config >>${S}/merged.config
+        fi
+        echo "### CROSS" >>${S}/merged.config
+        echo "### TGT" >>${S}/merged.config
+        echo "### MMU" >>${S}/merged.config
+        echo "### FPU" >>${S}/merged.config
+        echo "### ABI" >>${S}/merged.config
+        echo "### DISTRO FEATURES" >>${S}/merged.config
+        cp ${S}/merged.config ${S}/.config
+
+        # Mangle the resulting .config depending on OE variables
+        sed -i -e '${configmangle}' ${S}/.config
+
+        oe_runmake oldconfig
 }
 
 do_install() {
-	oe_runmake PREFIX=${D} DEVEL_PREFIX=${prefix}/ RUNTIME_PREFIX=/ \
-		install_dev install_runtime 
-
-	# Need to overwrite the version from -initial
-	#if [ ! -e ${D}${libdir}/libc.so ]; then
-	#	ln -s ../../lib/libc.so.0 ${D}${libdir}/libc.so
-	#fi
-
-	# We don't really need this in ${includedir}
-	rm -f ${D}${prefix}/include/.cvsignore
-
-	# This conflicts with the c++ version of this header
-	rm -f ${D}${prefix}/include/bits/atomicity.h
-
-        oe_runmake "SSP_ALL_CFLAGS=${TARGET_LINK_HASH_STYLE}" utils
-        oe_runmake STRIPTOOL=true PREFIX=${D} DEVEL_PREFIX=${prefix}/ RUNTIME_PREFIX=/ \
-                install_utils
-	
-	# oe_runstrip needs +x on files	
-	chmod +x ${D}/${base_libdir}/*
+        oe_runmake PREFIX=${D} install
+        oe_runmake PREFIX=${D} install_utils
 }
 
 get_monotonic_srcrev () {
-    	(cd ${S}; eval `git rev-list HEAD|wc -l`)
+        (cd ${S}; eval `git rev-list HEAD|wc -l`)
 }
diff --git a/recipes/uclibc/uclibc_0.9.28.bb b/recipes/uclibc/uclibc_0.9.28.bb
index a43d5ed..7da53f9 100644
--- a/recipes/uclibc/uclibc_0.9.28.bb
+++ b/recipes/uclibc/uclibc_0.9.28.bb
@@ -1,4 +1,4 @@
-require uclibc.inc
+require uclibc-old.inc
 PR = "${INC_PR}.0"
 
 # This is the correct KERNEL_SOURCE location, if the uClibc
diff --git a/recipes/uclibc/uclibc_0.9.29.bb b/recipes/uclibc/uclibc_0.9.29.bb
index b83cd2e..829777b 100644
--- a/recipes/uclibc/uclibc_0.9.29.bb
+++ b/recipes/uclibc/uclibc_0.9.29.bb
@@ -8,7 +8,7 @@
 #
 UCLIBC_BASE ?= "0.9.29"
 
-require uclibc.inc
+require uclibc-old.inc
 PR = "${INC_PR}.0"
 
 PROVIDES += "virtual/${TARGET_PREFIX}libc-for-gcc"
diff --git a/recipes/uclibc/uclibc_0.9.30.1.bb b/recipes/uclibc/uclibc_0.9.30.1.bb
index ea69249..d3d5c58 100644
--- a/recipes/uclibc/uclibc_0.9.30.1.bb
+++ b/recipes/uclibc/uclibc_0.9.30.1.bb
@@ -8,7 +8,7 @@
 #
 UCLIBC_BASE ?= "0.9.30.1"
 
-require uclibc.inc
+require uclibc-old.inc
 PR = "${INC_PR}.4"
 
 PROVIDES += "virtual/${TARGET_PREFIX}libc-for-gcc"
diff --git a/recipes/uclibc/uclibc_0.9.30.bb b/recipes/uclibc/uclibc_0.9.30.bb
index 5d267b5..36e9de3 100644
--- a/recipes/uclibc/uclibc_0.9.30.bb
+++ b/recipes/uclibc/uclibc_0.9.30.bb
@@ -8,7 +8,7 @@
 #
 UCLIBC_BASE ?= "0.9.30"
 
-require uclibc.inc
+require uclibc-old.inc
 PR = "${INC_PR}.1"
 
 PROVIDES += "virtual/${TARGET_PREFIX}libc-for-gcc"
diff --git a/recipes/uclibc/uclibc_git.bb b/recipes/uclibc/uclibc_git.bb
index 9640ef2..e68135e 100644
--- a/recipes/uclibc/uclibc_git.bb
+++ b/recipes/uclibc/uclibc_git.bb
@@ -26,7 +26,6 @@ FILESPATHPKG =. "uclibc-git:uclibc-${UCLIBC_BASE}:"
 KERNEL_SOURCE = "${CROSS_DIR}/${TARGET_SYS}"
 
 SRC_URI = "git://uclibc.org/uClibc.git;branch=master;protocol=git \
-	${@['${UCLIBC_LOCALE_URI}', ''][bb.data.getVar('USE_NLS', d, 1) != 'yes']} \
 	file://uClibc.config \
 	file://uClibc.machine \
 	file://uClibc.distro \
-- 
1.7.1



