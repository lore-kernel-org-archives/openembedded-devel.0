Received: from mail-bw0-f220.google.com ([209.85.218.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1Nq8qj-0001l0-E7
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Mar 2010 18:40:45 +0100
Received: by bwz20 with SMTP id 20so1240730bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Mar 2010 09:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer:in-reply-to:references;
	bh=JSdzK25/KSF4tYb5uvvt2XRc8lSYjFBp6G7bWI1Ada0=;
	b=bts1FqsUHFczSrD1ydq5WJ6WpuvlH+EbQpBpcFVi+sF24iC2iOT/9H0vcdTQPh1wM7
	163laQ9Cyh9HmTBp1EwGiCa2eWzsN5EHEpTXx8lxYZgWdkgx8wBKVaZ0v1Du1EMY8N5s
	XzT38fk+3zCyI1JH9KvXgiEsz0WAptHPLvyZA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=EpCtOLZ9XpBII/z/EPcfxyx+FeJEJU5m5g67ewY6JxJdy8i9+PxyRvantvs1WMxSFK
	SDNlC7VSoxFsL1N+l88RJaA0QSXomV9Izsnf/o6RcmP6lAAfSb2d0LVKyH/glpPi9hC5
	TpQJKyCJDHcDUocU5MP+hy6LIhW8bQplPfWXs=
Received: by 10.204.25.197 with SMTP id a5mr1614813bkc.70.1268415456228;
	Fri, 12 Mar 2010 09:37:36 -0800 (PST)
Received: from s42.loc (85-127-85-230.dynamic.xdsl-line.inode.at
	[85.127.85.230])
	by mx.google.com with ESMTPS id 16sm948190bwz.5.2010.03.12.09.37.34
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 12 Mar 2010 09:37:35 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1Nq8wb-00056t-JO; Fri, 12 Mar 2010 18:46:41 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Mar 2010 18:46:32 +0100
Message-Id: <1268415992-19603-4-git-send-email-rep.dot.nop@gmail.com>
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
Subject: [PATCH 3/3] uClibc: redo configuration
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
X-List-Received-Date: Fri, 12 Mar 2010 17:40:45 -0000

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 classes/uclibc-arch.bbclass               |  109 +++++++++++++++++
 recipes/uclibc/uclibc-initial_0.9.30.2.bb |   12 +--
 recipes/uclibc/uclibc-initial_git.bb      |    9 +-
 recipes/uclibc/uclibc-initial_nptl.bb     |    9 +-
 recipes/uclibc/uclibc.inc                 |  184 +++++++++++++++++++++++++++++
 recipes/uclibc/uclibc_0.9.30.2.bb         |    2 +-
 recipes/uclibc/uclibc_git.bb              |    3 +-
 recipes/uclibc/uclibc_nptl.bb             |    3 +-
 8 files changed, 306 insertions(+), 25 deletions(-)
 create mode 100644 classes/uclibc-arch.bbclass
 create mode 100644 recipes/uclibc/uclibc.inc

diff --git a/classes/uclibc-arch.bbclass b/classes/uclibc-arch.bbclass
new file mode 100644
index 0000000..f097ff6
--- /dev/null
+++ b/classes/uclibc-arch.bbclass
@@ -0,0 +1,109 @@
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
+	features = bb.data.getVar('DISTRO_FEATURES', d).split()
+	uclibc_cfg('ipv4', features, 'UCLIBC_HAS_IPV4', cnf, rem)
+	uclibc_cfg('ipv6', features, 'UCLIBC_HAS_IPV6', cnf, rem)
+	uclibc_cfg('nls',  features, 'UCLIBC_HAS_LOCALE', cnf, rem)
+	uclibc_cfg('bx',   features, 'USE_BX', cnf, rem)
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
diff --git a/recipes/uclibc/uclibc-initial_git.bb b/recipes/uclibc/uclibc-initial_git.bb
index 00330e2..3a33bd8 100644
--- a/recipes/uclibc/uclibc-initial_git.bb
+++ b/recipes/uclibc/uclibc-initial_git.bb
@@ -7,19 +7,16 @@ PACKAGES = ""
 
 do_install() {
 	# Install initial headers into the cross dir
-	make V=1 CC="${CC}" PREFIX=${D} DEVEL_PREFIX=${prefix}/ RUNTIME_PREFIX=/ \
+	make PREFIX=${D} DEVEL_PREFIX=${prefix}/ RUNTIME_PREFIX=/ \
 		install_headers
 	#ln -sf include ${CROSS_DIR}/${TARGET_SYS}/sys-include
 
-	# This conflicts with the c++ version of this header
-	rm -f ${D}${includedir}/bits/atomicity.h
 	install -d ${D}${libdir}/
-	install -m 644 lib/crt[1in].o ${D}${libdir}/
-	install -m 644 lib/libc.so ${D}${libdir}/
+	install -m 644 lib/crt[1in].o lib/libc.so ${D}${libdir}/
 }
 
 do_compile () {
-	make V=1 CC="${CC}" PREFIX=${D} DEVEL_PREFIX=${prefix}/ RUNTIME_PREFIX=/ \
+	make PREFIX=${D} DEVEL_PREFIX=${prefix}/ RUNTIME_PREFIX=/ \
 		lib/crt1.o lib/crti.o lib/crtn.o
 	${CC} -nostdlib -nostartfiles -shared -x c /dev/null \
 		-o lib/libc.so
diff --git a/recipes/uclibc/uclibc-initial_nptl.bb b/recipes/uclibc/uclibc-initial_nptl.bb
index a7c079b..a2af017 100644
--- a/recipes/uclibc/uclibc-initial_nptl.bb
+++ b/recipes/uclibc/uclibc-initial_nptl.bb
@@ -7,19 +7,16 @@ PACKAGES = ""
 
 do_install() {
 	# Install initial headers into the cross dir
-	make V=1 PREFIX=${D} DEVEL_PREFIX=${prefix}/ RUNTIME_PREFIX=/ \
+	make PREFIX=${D} DEVEL_PREFIX=${prefix}/ RUNTIME_PREFIX=/ \
 		install_headers
 	#ln -sf include ${CROSS_DIR}/${TARGET_SYS}/sys-include
 
-	# This conflicts with the c++ version of this header
-	rm -f ${D}${includedir}/bits/atomicity.h
 	install -d ${D}${libdir}/
-	install -m 644 lib/crt[1in].o ${D}${libdir}/
-	install -m 644 lib/libc.so ${D}${libdir}/
+	install -m 644 lib/crt[1in].o lib/libc.so ${D}${libdir}/
 }
 
 do_compile () {
-	make V=1 PREFIX=${D} DEVEL_PREFIX=${prefix}/ RUNTIME_PREFIX=/ \
+	make PREFIX=${D} DEVEL_PREFIX=${prefix}/ RUNTIME_PREFIX=/ \
 		lib/crt1.o lib/crti.o lib/crtn.o
 	${CC} -nostdlib -nostartfiles -shared -x c /dev/null \
 		-o lib/libc.so
diff --git a/recipes/uclibc/uclibc.inc b/recipes/uclibc/uclibc.inc
new file mode 100644
index 0000000..721629d
--- /dev/null
+++ b/recipes/uclibc/uclibc.inc
@@ -0,0 +1,184 @@
+DESCRIPTION = "C library for embedded systems"
+LICENSE = "LGPL"
+SECTION = "libs"
+PRIORITY = "required"
+INC_PR = "r33"
+inherit uclibc-arch
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
+DEPENDS = "virtual/${TARGET_PREFIX}binutils \
+           virtual/${TARGET_PREFIX}gcc-intermediate \
+           linux-libc-headers ncurses-native"
+RDEPENDS_${PN}-dev = "linux-libc-headers-dev"
+
+INHIBIT_DEFAULT_DEPS = "1"
+
+PACKAGES =+ "ldd uclibc-utils-dbg uclibc-utils uclibc-gconv uclibc-thread-db"
+
+LEAD_SONAME = "libc.so"
+
+# The last line (gdb and lib1) is for uclinux-uclibc builds
+uclibc_baselibs = "${base_libdir}/libcrypt*.so.* ${base_libdir}/libcrypt-*.so \
+                   ${base_libdir}/libintl*.so.* ${base_libdir}/libintl-*.so \
+                   ${base_libdir}/libnsl*.so.* ${base_libdir}/libnsl-*.so \
+                   ${base_libdir}/libresolv*.so.* ${base_libdir}/libresolv-*.so \
+                   ${base_libdir}/ld*.so.* ${base_libdir}/ld-*.so \
+                   ${base_libdir}/libc*.so.* ${base_libdir}/libuClibc-*.so \
+                   ${base_libdir}/libdl*.so.* ${base_libdir}/libdl-*.so \
+                   ${base_libdir}/libm*.so.* ${base_libdir}/libm-*.so \
+                   ${base_libdir}/libutil*.so.* ${base_libdir}/libutil-*.so \
+                   ${base_libdir}/libpthread*.so.* ${base_libdir}/libpthread-*.so \
+                   ${base_libdir}/librt*.so.* ${base_libdir}/librt-*.so \
+                   ${libdir}/libc.gdb ${libdir}/libc ${base_libdir}/lib1.so \
+                  "
+FILES_${PN} = "${sysconfdir} ${uclibc_baselibs} /sbin/ldconfig \
+               ${libexecdir} ${datadir}/zoneinfo ${libdir}/locale"
+FILES_ldd = "${bindir}/ldd"
+FILES_uclibc-dev_append = "\
+        ${libdir}/lib*.so \
+        ${libdir}/*_nonshared.a \
+        ${libdir}/[S]*crt[1in].o \
+        ${libdir}/lib*.a \
+        ${includedir}/*.h ${includedir}/*/*.h \
+       "
+FILES_uclibc-utils = "${bindir} ${sbindir}"
+FILES_uclibc-utils-dbg += "${bindir}/.debug ${sbindir}/.debug"
+FILES_uclibc-gconv = "${libdir}/gconv"
+FILES_uclibc-thread-db = "/lib/libthread_db*"
+RPROVIDES_uclibc-dev += "libc-dev virtual-libc-dev"
+
+SRC_URI = "\
+        file://uClibc.config \
+        http://www.uclibc.org/downloads/uClibc-${PV}.tar.bz2;name=uClibc-${PV} \
+        "
+
+# do_stage barfs on a CC with whitespace, therefore put the 'HOST_CC_ARCH' in
+# the CFLAGS (when building the utils).
+OEMAKE_NO_CC = "'STRIPTOOL=true' 'LD=${LD}'"
+EXTRA_OEMAKE = "${OEMAKE_NO_CC} \
+                'HOSTCC=${BUILD_CC}' \
+                'BUILD_CFLAGS=${BUILD_CFLAGS}' \
+                'CC=${CC}' \
+                ARCH=${UCLIBC_ARCH}"
+EXTRA_OEMAKE_task_do_package = "${OEMAKE_NO_CC}"
+
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
+python () {
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
+}
+
+uclibcbuild_do_patch() {
+        ln -sf ${STAGING_INCDIR}/linux ${S}/include/linux
+        ln -sf ${STAGING_INCDIR}/asm ${S}/include/asm
+}
+
+python do_patch () {
+        bb.build.exec_func('base_do_patch', d)
+        bb.build.exec_func('uclibcbuild_do_patch', d)
+}
+
+do_configure() {
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
+}
+
+do_install() {
+        oe_runmake PREFIX=${D} install
+        oe_runmake PREFIX=${D} install_utils
+}
+
+get_monotonic_srcrev () {
+        (cd ${S}; eval `git rev-list HEAD|wc -l`)
+}
diff --git a/recipes/uclibc/uclibc_0.9.30.2.bb b/recipes/uclibc/uclibc_0.9.30.2.bb
index a772e2a..703b5cd 100644
--- a/recipes/uclibc/uclibc_0.9.30.2.bb
+++ b/recipes/uclibc/uclibc_0.9.30.2.bb
@@ -8,7 +8,7 @@
 #
 UCLIBC_BASE ?= "0.9.30.2"
 
-require uclibc-old.inc
+require uclibc.inc
 PR = "${INC_PR}.0"
 
 PROVIDES += "virtual/${TARGET_PREFIX}libc-for-gcc"
diff --git a/recipes/uclibc/uclibc_git.bb b/recipes/uclibc/uclibc_git.bb
index 26339f5..1ee4c75 100644
--- a/recipes/uclibc/uclibc_git.bb
+++ b/recipes/uclibc/uclibc_git.bb
@@ -13,7 +13,7 @@ DEFAULT_PREFERENCE = "-1"
 #DEFAULT_PREFERENCE is 0 (empty), releases have a preference of 1 so take
 # precedence.
 
-require uclibc-old.inc
+require uclibc.inc
 PR = "${INC_PR}.0"
 PROVIDES += "virtual/${TARGET_PREFIX}libc-for-gcc"
 
@@ -26,7 +26,6 @@ FILESPATHPKG =. "uclibc-git:uclibc-${UCLIBC_BASE}:"
 KERNEL_SOURCE = "${CROSS_DIR}/${TARGET_SYS}"
 
 SRC_URI = "git://uclibc.org/uClibc.git;branch=master;protocol=git \
-	${@['${UCLIBC_LOCALE_URI}', ''][bb.data.getVar('USE_NLS', d, 1) != 'yes']} \
 	file://uClibc.config \
 	file://uClibc.machine \
 	file://uClibc.distro \
diff --git a/recipes/uclibc/uclibc_nptl.bb b/recipes/uclibc/uclibc_nptl.bb
index c7cbd00..b283953 100644
--- a/recipes/uclibc/uclibc_nptl.bb
+++ b/recipes/uclibc/uclibc_nptl.bb
@@ -13,7 +13,7 @@ DEFAULT_PREFERENCE = "-1"
 #DEFAULT_PREFERENCE is 0 (empty), releases have a preference of 1 so take
 # precedence.
 
-require uclibc-old.inc
+require uclibc.inc
 PR = "${INC_PR}.0"
 
 PROVIDES += "virtual/${TARGET_PREFIX}libc-for-gcc"
@@ -27,7 +27,6 @@ FILESPATHPKG =. "uclibc-nptl:uclibc-${UCLIBC_BASE}:"
 KERNEL_SOURCE = "${CROSS_DIR}/${TARGET_SYS}"
 
 SRC_URI = "git://uclibc.org/uClibc.git;protocol=git;branch=nptl \
-	${@['${UCLIBC_LOCALE_URI}', ''][bb.data.getVar('USE_NLS', d, 1) != 'yes']} \
 	file://uClibc.config \
 	file://uClibc.machine \
 	file://uClibc.distro \
-- 
1.7.0



