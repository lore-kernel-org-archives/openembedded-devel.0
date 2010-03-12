Received: from mail-bw0-f220.google.com ([209.85.218.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1Nq8qj-0001ks-Au
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Mar 2010 18:40:54 +0100
Received: by bwz20 with SMTP id 20so1240696bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Mar 2010 09:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer:in-reply-to:references;
	bh=ehPmiGsNPn94aFh44snxoDlgfDKHKcwAgqWk50yL19c=;
	b=chd9qn5q/0ykZGeBdcB8g2ADqDiC1klpkg7flZ75lpUnnJAG2gmg+nsA6anyjO+TL4
	1gMLibO7zBVwf/mA9gCZwdLDgrqGOVnqCBiTV4usj4NWaWqpdp34XHAUq4pHOpYEdejf
	Hzp6e8ctTGQXQiltB4dNnQeHTCG7odv2xjB4Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=criZiyVWhbhyqrKAmVdO9sHn4vKE3lf4Q2CP0a7V8Aa9D0/qamLH3O5mb5I9jRVPza
	NU/Ns7xHu0D0DLWwzdvFr4HwVZhkeFiGqfeiGwbFFKCClj+nrlS1I5SgkXPJK+tmigfm
	UqafQ5hNGOjfgEjbu8A6HRyQ9qiLmfwx23K18=
Received: by 10.204.135.153 with SMTP id n25mr894855bkt.156.1268415456543;
	Fri, 12 Mar 2010 09:37:36 -0800 (PST)
Received: from s42.loc (85-127-85-230.dynamic.xdsl-line.inode.at
	[85.127.85.230])
	by mx.google.com with ESMTPS id 15sm946607bwz.4.2010.03.12.09.37.34
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 12 Mar 2010 09:37:35 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1Nq8wb-00056p-I4; Fri, 12 Mar 2010 18:46:41 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Mar 2010 18:46:30 +0100
Message-Id: <1268415992-19603-2-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.0
In-Reply-To: <19c1b8a91002212154y766540d9vb091badff1198e0e@mail.gmail.com>
References: <19c1b8a91002212154y766540d9vb091badff1198e0e@mail.gmail.com>
X-SA-Exim-Connect-IP: 209.85.218.220
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/3] uClibc: rename include file of old releases
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
X-List-Received-Date: Fri, 12 Mar 2010 17:40:55 -0000

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 recipes/uclibc/bfin-uclibc_svn.bb |    2 +-
 recipes/uclibc/uclibc-old.inc     |  186 +++++++++++++++++++++++++++++++++++++
 recipes/uclibc/uclibc.inc         |  186 -------------------------------------
 recipes/uclibc/uclibc_0.9.28.bb   |    2 +-
 recipes/uclibc/uclibc_0.9.29.bb   |    2 +-
 recipes/uclibc/uclibc_0.9.30.1.bb |    2 +-
 recipes/uclibc/uclibc_0.9.30.2.bb |    2 +-
 recipes/uclibc/uclibc_0.9.30.bb   |    2 +-
 recipes/uclibc/uclibc_git.bb      |    2 +-
 recipes/uclibc/uclibc_nptl.bb     |    2 +-
 10 files changed, 194 insertions(+), 194 deletions(-)
 create mode 100644 recipes/uclibc/uclibc-old.inc
 delete mode 100644 recipes/uclibc/uclibc.inc

diff --git a/recipes/uclibc/bfin-uclibc_svn.bb b/recipes/uclibc/bfin-uclibc_svn.bb
index 80efd26..2d5c90a 100644
--- a/recipes/uclibc/bfin-uclibc_svn.bb
+++ b/recipes/uclibc/bfin-uclibc_svn.bb
@@ -9,7 +9,7 @@
 UCLIBC_BASE ?= "0.9.29"
 PV = "${UCLIBC_BASE}+svnr${SRCPV}"
 
-require uclibc.inc
+require uclibc-old.inc
 PR = "${INC_PR}.0"
 PROVIDES_append_bfin = " virtual/${TARGET_PREFIX}libc-for-gcc "
 
diff --git a/recipes/uclibc/uclibc-old.inc b/recipes/uclibc/uclibc-old.inc
new file mode 100644
index 0000000..a2332e9
--- /dev/null
+++ b/recipes/uclibc/uclibc-old.inc
@@ -0,0 +1,186 @@
+DESCRIPTION = "C library for embedded systems"
+LICENSE = "LGPL"
+SECTION = "libs"
+PRIORITY = "required"
+INC_PR = "r33"
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
deleted file mode 100644
index a2332e9..0000000
--- a/recipes/uclibc/uclibc.inc
+++ /dev/null
@@ -1,186 +0,0 @@
-DESCRIPTION = "C library for embedded systems"
-LICENSE = "LGPL"
-SECTION = "libs"
-PRIORITY = "required"
-INC_PR = "r33"
-#
-# For now, we will skip building of a gcc package if it is a uclibc one
-# and our build is not a uclibc one, and we skip a glibc one if our build
-# is a uclibc build.
-#
-# See the note in gcc/gcc_3.4.0.oe
-#
-
-python __anonymous () {
-    import bb, re
-    uc_os = (re.match('.*uclibc*', bb.data.getVar('TARGET_OS', d, 1)) != None)
-    if not uc_os:
-        raise bb.parse.SkipPackage("incompatible with target %s" %
-                                   bb.data.getVar('TARGET_OS', d, 1))
-}
-
-PROVIDES += "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc"
-PROVIDES += "${@['virtual/libiconv', ''][bb.data.getVar('USE_NLS', d, 1) != 'yes']}"
-DEPENDS = "virtual/${TARGET_PREFIX}binutils \
-	   virtual/${TARGET_PREFIX}gcc-intermediate linux-libc-headers ncurses-native pax-utils-native"
-RDEPENDS_${PN}-dev = "linux-libc-headers-dev"
-
-# Blackfin needs a wrapper around ld
-#DEPENDS_append_bfin = " elf2flt "
-
-INHIBIT_DEFAULT_DEPS = "1"
-PARALLEL_MAKE = ""
-
-PACKAGES =+ "ldd uclibc-utils-dbg uclibc-utils uclibc-gconv uclibc-thread-db"
-
-LEAD_SONAME = "libc.so"
-
-# The last line (gdb and lib1) is for uclinux-uclibc builds 
-uclibc_baselibs = "${base_libdir}/libcrypt*.so.* ${base_libdir}/libcrypt-*.so \
-		   ${base_libdir}/libintl*.so.* ${base_libdir}/libintl-*.so \
-		   ${base_libdir}/libnsl*.so.* ${base_libdir}/libnsl-*.so \
-		   ${base_libdir}/libresolv*.so.* ${base_libdir}/libresolv-*.so \
-                   ${base_libdir}/ld*.so.* ${base_libdir}/ld-*.so \
-		   ${base_libdir}/libc*.so.* ${base_libdir}/libuClibc-*.so \
-                   ${base_libdir}/libdl*.so.* ${base_libdir}/libdl-*.so \
-		   ${base_libdir}/libm*.so.* ${base_libdir}/libm-*.so \
-                   ${base_libdir}/libutil*.so.* ${base_libdir}/libutil-*.so \
-		   ${base_libdir}/libpthread*.so.* ${base_libdir}/libpthread-*.so \
-                   ${base_libdir}/librt*.so.* ${base_libdir}/librt-*.so \
-                   ${libdir}/libc.gdb ${libdir}/libc ${base_libdir}/lib1.so \
-                   "
-FILES_${PN} = "${sysconfdir} ${uclibc_baselibs} /sbin/ldconfig \
-	       ${libexecdir} ${datadir}/zoneinfo ${libdir}/locale"
-FILES_ldd = "${bindir}/ldd"
-FILES_uclibc-dev_append = " ${libdir}/*.o ${libdir}/*_nonshared.a"
-FILES_uclibc-utils = "${bindir} ${sbindir}"
-FILES_uclibc-utils-dbg += "${bindir}/.debug ${sbindir}/.debug"
-FILES_uclibc-gconv = "${libdir}/gconv"
-FILES_uclibc-thread-db = "/lib/libthread_db*"
-RPROVIDES_uclibc-dev += "libc-dev virtual-libc-dev"
-
-#
-# This locale file gets copied into uClibc-${PV}/extra/locale/ prior to
-# build, it does not need to be unpacked, but we can't inhibit the unpacking
-# in the current build system.
-#
-UCLIBC_LOCALE_FILE = "uClibc-locale-030818.tgz"
-UCLIBC_LOCALE_FILE_arm = "uClibc-locale-030818.arm.tgz"
-UCLIBC_LOCALE_URI = "http://www.uclibc.org/downloads/${UCLIBC_LOCALE_FILE}"
-UCLIBC_LOCALE_URI_arm = "http://wiki.openembedded.net/dl/uclibc-locale/${UCLIBC_LOCALE_FILE}"
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
-
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
-
-CFLAGS := "${@oe_filter_out('-I\S+', '${CFLAGS}', d)}"
-
-python () {
-	if bb.data.getVar('TARGET_FPU', d, 1) in [ 'soft' ]:
-		bb.data.setVar('configmangle_append', ' s,^HAS_FPU=y,# HAS_FPU is not set,;', d)
-}
-
-uclibcbuild_do_patch() {
-	ln -sf ${STAGING_INCDIR}/linux ${S}/include/linux
-	ln -sf ${STAGING_INCDIR}/asm ${S}/include/asm
-	
-	${@['cp %s/%s extra/locale' % (bb.data.getVar('DL_DIR', d, 1) or '', bb.data.getVar('UCLIBC_LOCALE_FILE', d, 1) or ''), ''][bb.data.getVar('USE_NLS', d, 1) != 'yes']}
-}
-
-python do_patch () {
-	bb.build.exec_func('base_do_patch', d)
-	bb.build.exec_func('uclibcbuild_do_patch', d)
-}
-
-do_configure() {
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
-}
-
-do_install() {
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
-}
-
-get_monotonic_srcrev () {
-    	(cd ${S}; eval `git rev-list HEAD|wc -l`)
-}
diff --git a/recipes/uclibc/uclibc_0.9.28.bb b/recipes/uclibc/uclibc_0.9.28.bb
index 2e90939..a6cb491 100644
--- a/recipes/uclibc/uclibc_0.9.28.bb
+++ b/recipes/uclibc/uclibc_0.9.28.bb
@@ -1,4 +1,4 @@
-require uclibc.inc
+require uclibc-old.inc
 PR = "${INC_PR}.0"
 
 # This is the correct KERNEL_SOURCE location, if the uClibc
diff --git a/recipes/uclibc/uclibc_0.9.29.bb b/recipes/uclibc/uclibc_0.9.29.bb
index 1679ada..c1d7ee0 100644
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
index 47b44cd..73346fd 100644
--- a/recipes/uclibc/uclibc_0.9.30.1.bb
+++ b/recipes/uclibc/uclibc_0.9.30.1.bb
@@ -8,7 +8,7 @@
 #
 UCLIBC_BASE ?= "0.9.30.1"
 
-require uclibc.inc
+require uclibc-old.inc
 PR = "${INC_PR}.4"
 
 PROVIDES += "virtual/${TARGET_PREFIX}libc-for-gcc"
diff --git a/recipes/uclibc/uclibc_0.9.30.2.bb b/recipes/uclibc/uclibc_0.9.30.2.bb
index 703b5cd..a772e2a 100644
--- a/recipes/uclibc/uclibc_0.9.30.2.bb
+++ b/recipes/uclibc/uclibc_0.9.30.2.bb
@@ -8,7 +8,7 @@
 #
 UCLIBC_BASE ?= "0.9.30.2"
 
-require uclibc.inc
+require uclibc-old.inc
 PR = "${INC_PR}.0"
 
 PROVIDES += "virtual/${TARGET_PREFIX}libc-for-gcc"
diff --git a/recipes/uclibc/uclibc_0.9.30.bb b/recipes/uclibc/uclibc_0.9.30.bb
index 9278299..15e8675 100644
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
index 4ac1b89..26339f5 100644
--- a/recipes/uclibc/uclibc_git.bb
+++ b/recipes/uclibc/uclibc_git.bb
@@ -13,7 +13,7 @@ DEFAULT_PREFERENCE = "-1"
 #DEFAULT_PREFERENCE is 0 (empty), releases have a preference of 1 so take
 # precedence.
 
-require uclibc.inc
+require uclibc-old.inc
 PR = "${INC_PR}.0"
 PROVIDES += "virtual/${TARGET_PREFIX}libc-for-gcc"
 
diff --git a/recipes/uclibc/uclibc_nptl.bb b/recipes/uclibc/uclibc_nptl.bb
index cd67c6a..c7cbd00 100644
--- a/recipes/uclibc/uclibc_nptl.bb
+++ b/recipes/uclibc/uclibc_nptl.bb
@@ -13,7 +13,7 @@ DEFAULT_PREFERENCE = "-1"
 #DEFAULT_PREFERENCE is 0 (empty), releases have a preference of 1 so take
 # precedence.
 
-require uclibc.inc
+require uclibc-old.inc
 PR = "${INC_PR}.0"
 
 PROVIDES += "virtual/${TARGET_PREFIX}libc-for-gcc"
-- 
1.7.0



