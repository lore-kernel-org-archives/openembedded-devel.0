Received: from [80.246.246.162] (helo=office.altell.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1Lu4Q7-0008HS-Cr
	for openembedded-devel@openembedded.org; Wed, 15 Apr 2009 14:41:25 +0200
Received: from localhost.localdomain (unknown [192.168.1.115])
	by mail.altell.local (Postfix) with ESMTP id F0BE9683D3;
	Wed, 15 Apr 2009 16:36:00 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@openembedded.org
Date: Wed, 15 Apr 2009 16:35:59 +0400
Message-Id: <1239798960-3586-10-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.2.1
In-Reply-To: <1239798960-3586-9-git-send-email-khimov@altell.ru>
References: <200904151633.49146.khimov@altell.ru>
	<1239798960-3586-1-git-send-email-khimov@altell.ru>
	<1239798960-3586-2-git-send-email-khimov@altell.ru>
	<1239798960-3586-3-git-send-email-khimov@altell.ru>
	<1239798960-3586-4-git-send-email-khimov@altell.ru>
	<1239798960-3586-5-git-send-email-khimov@altell.ru>
	<1239798960-3586-6-git-send-email-khimov@altell.ru>
	<1239798960-3586-7-git-send-email-khimov@altell.ru>
	<1239798960-3586-8-git-send-email-khimov@altell.ru>
	<1239798960-3586-9-git-send-email-khimov@altell.ru>
MIME-Version: 1.0
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: khimov@altell.ru
X-SA-Exim-Connect-IP: 80.246.246.162
X-SA-Exim-Mail-From: khimov@altell.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=AWL,BAYES_40,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 10/11] glibc: add multilib glibc
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
X-List-Received-Date: Wed, 15 Apr 2009 12:41:48 -0000

---
 recipes/glibc/glibc-multilib_2.6.1.bb        |  165 ++++++++++++++++++++++++++
 recipes/glibc/glibc-package-multilib.bbclass |   79 ++++++++++++
 recipes/glibc/glibc.inc                      |    5 +-
 recipes/glibc/glibc_2.6.1.bb                 |    2 +
 4 files changed, 249 insertions(+), 2 deletions(-)
 create mode 100644 recipes/glibc/glibc-multilib_2.6.1.bb
 create mode 100644 recipes/glibc/glibc-package-multilib.bbclass

diff --git a/recipes/glibc/glibc-multilib_2.6.1.bb b/recipes/glibc/glibc-multilib_2.6.1.bb
new file mode 100644
index 0000000..0f36339
--- /dev/null
+++ b/recipes/glibc/glibc-multilib_2.6.1.bb
@@ -0,0 +1,165 @@
+require glibc.inc
+require glibc-multilib.inc
+
+PROVIDES = "virtual/${GLIBC_PREFIX}libc-for-gcc"
+PACKAGES_DYNAMIC = "libc6-${ARCH_MULTILIB}*"
+RPROVIDES_${PN}-dev = "libc6-${ARCH_MULTILIB}-dev virtual-libc-${ARCH_MULTILIB}-dev"
+
+# the -isystem in bitbake.conf screws up glibc do_stage
+BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
+TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${layout_includedir}"
+
+FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/glibc-2.4"
+
+GLIBC_ADDONS ?= "ports,nptl,libidn"
+
+GLIBC_BROKEN_LOCALES = " _ER _ET so_ET yn_ER sid_ET tr_TR mn_MN gez_ET gez_ER bn_BD te_IN"
+
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
+    uc_os = (re.match('.*uclibc$', bb.data.getVar('TARGET_OS', d, 1)) != None)
+    if uc_os:
+	raise bb.parse.SkipPackage("incompatible with target %s" %
+				   bb.data.getVar('TARGET_OS', d, 1))
+}
+
+RDEPENDS_${PN}-dev = "linux-libc-headers-dev"
+
+SRC_URI = "\
+  ftp://ftp.gnu.org/pub/gnu/glibc/glibc-${PV}.tar.bz2 \
+  ftp://ftp.gnu.org/pub/gnu/glibc/glibc-ports-${PV}.tar.bz2 \
+  ftp://ftp.gnu.org/pub/gnu/glibc/glibc-libidn-${PV}.tar.bz2 \
+  file://arm-memcpy.patch;patch=1 \
+  file://arm-longlong.patch;patch=1 \
+  file://fhs-linux-paths.patch;patch=1 \
+  file://dl-cache-libcmp.patch;patch=1 \
+  file://ldsocache-varrun.patch;patch=1 \
+  file://nptl-crosscompile.patch;patch=1 \
+  file://glibc-2.5-local-dynamic-resolvconf.patch;patch=1;pnum=0 \
+  file://glibc-check_pf.patch;patch=1;pnum=0 \
+  file://zecke-sane-readelf.patch;patch=1 \
+  file://ldd-unbash.patch;patch=1 \
+  file://generic-bits_select.h \
+  file://generic-bits_types.h \
+  file://generic-bits_typesizes.h \
+  file://generic-bits_time.h \
+  file://etc/ld.so.conf \
+  file://generate-supported.mk \
+  file://glibc-2.6.1-RTLD_SINGLE_THREAD_P-1.patch;patch=1 \
+  file://glibc-2.6.1-use-short-for-fnstsw.patch;patch=1 \
+  file://glibc-use-isystem-include-fixed.patch;patch=1 \
+  file://glibc-arm-no-asm-page.patch;patch=1 \
+  file://armv4t-interworking.patch;patch=1 \
+  file://march-i686.patch;patch=1;pnum=0 \
+"
+
+# Build fails on sh3 and sh4 without additional patches
+SRC_URI_append_sh3 = " file://no-z-defs.patch;patch=1"
+SRC_URI_append_sh4 = " file://no-z-defs.patch;patch=1"
+
+# PowerPC Patches to add support for soft-float
+SRC_URI_append_powerpc = "\
+  file://powerpc-sqrt-hack.diff;patch=1 \
+  file://glibc-2.6.1-powerpc-nofpu.patch;patch=1 \
+"
+
+S = "${WORKDIR}/glibc-${PV}"
+B = "${WORKDIR}/build-${TARGET_SYS}"
+
+EXTRA_OECONF = "\
+  --enable-kernel=${OLDEST_KERNEL} \
+  --without-cvs --disable-profile --disable-debug --without-gd \
+  --enable-clocale=gnu \
+  --enable-add-ons=${GLIBC_ADDONS} \
+  --with-headers=${STAGING_INCDIR} \
+  --without-selinux \
+  ${GLIBC_EXTRA_OECONF} \
+"
+
+EXTRA_OEMAKE += "asm-CPPFLAGS="${CFLAGS_MULTILIB}""
+
+EXTRA_OECONF += "${@get_glibc_fpu_setting(bb, d)}"
+
+do_munge() {
+	# Integrate ports and libidn into tree
+	mv ${WORKDIR}/glibc-ports-${PV} ${S}/ports
+	mv ${WORKDIR}/glibc-libidn-${PV} ${S}/libidn
+
+	# Ports isn't really working... Fix it
+	# Some of this is rather dirty, but it seems to be the only
+	# quick way to get this cruft to compile
+	rm -rf ${S}/ports/sysdeps/unix/sysv/linux/arm/linuxthreads
+	ln -s nptl ${S}/ports/sysdeps/unix/sysv/linux/arm/linuxthreads
+	cp ${S}/nptl/sysdeps/pthread/bits/sigthread.h ${S}/ports/sysdeps/unix/sysv/linux/arm/bits/
+	cp ${S}/sysdeps/unix/sysv/linux/i386/bits/wchar.h ${S}/ports/sysdeps/unix/sysv/linux/arm/bits/
+	cp ${S}/sysdeps/wordsize-32/bits/wordsize.h ${S}/ports/sysdeps/unix/sysv/linux/arm/bits/
+	cp ${WORKDIR}/generic-bits_select.h ${S}/ports/sysdeps/unix/sysv/linux/arm/bits/select.h
+	cp ${WORKDIR}/generic-bits_types.h ${S}/ports/sysdeps/unix/sysv/linux/arm/bits/types.h
+	cp ${WORKDIR}/generic-bits_typesizes.h ${S}/ports/sysdeps/unix/sysv/linux/arm/bits/typesizes.h
+	cp ${WORKDIR}/generic-bits_time.h ${S}/ports/sysdeps/unix/sysv/linux/arm/bits/time.h
+	# Copy in generic stuff for not yet implemented headers
+	for i in ${S}/bits/*.h; do
+		F=`basename $i`
+		[ "$F" = "local_lim.h" ] && continue
+		[ "$F" = "errno.h" ] && continue
+		test -e ${S}/ports/sysdeps/unix/sysv/linux/arm/bits/$F || test -e ${S}/ports/sysdeps/arm/bits/$F || test -e ${S}/sysdeps/unix/sysv/linux/bits/$F || test -e ${S}/sysdeps/ieee754/bits/$F || cp $i ${S}/ports/sysdeps/unix/sysv/linux/arm/bits/
+	done
+	# This is harmful; we need to get the one from nptl/sysdeps/pthreads
+	rm -f ${S}/ports/sysdeps/unix/sysv/linux/arm/bits/libc-lock.h
+	# Obsoleted by sysdeps/arm/{fpu,eabi}/bits/fenv.h
+	rm -f ${S}/ports/sysdeps/unix/sysv/linux/arm/bits/fenv.h
+	# Obsoleted by sysdeps/gnu/bits/utmp.h
+	rm -f ${S}/ports/sysdeps/unix/sysv/linux/arm/bits/utmp.h
+}
+
+addtask munge before do_patch after do_unpack
+
+
+do_configure () {
+# override this function to avoid the autoconf/automake/aclocal/autoheader
+# calls for now
+# don't pass CPPFLAGS into configure, since it upsets the kernel-headers
+# version check and doesn't really help with anything
+	if [ -z "`which rpcgen`" ]; then
+		echo "rpcgen not found.  Install glibc-devel."
+		exit 1
+	fi
+	(cd ${S} && gnu-configize) || die "failure in running gnu-configize"
+	export libc_cv_slibdir=${layout_base_libdir}
+	export libc_cv_forced_unwind=yes
+	export libc_cv_c_cleanup=yes
+	export libc_cv_gnu99_inline=yes
+	CPPFLAGS="" oe_runconf
+}
+
+rpcsvc = "bootparam_prot.x nlm_prot.x rstat.x \
+	  yppasswd.x klm_prot.x rex.x sm_inter.x mount.x \
+	  rusers.x spray.x nfs_prot.x rquota.x key_prot.x"
+
+do_compile () {
+	# -Wl,-rpath-link <staging>/lib in LDFLAGS can cause breakage if another glibc is in staging
+	unset LDFLAGS
+	export libc_cv_slibdir=${layout_base_libdir}
+	export libc_cv_forced_unwind=yes
+	export libc_cv_c_cleanup=yes
+	export libc_cv_gnu99_inline=yes
+	base_do_compile
+	(
+		cd ${S}/sunrpc/rpcsvc
+		for r in ${rpcsvc}; do
+			h=`echo $r|sed -e's,\.x$,.h,'`
+			rpcgen -h $r -o $h || oewarn "unable to generate header for $r"
+		done
+	)
+}
+
+require glibc-stage.inc
+require glibc-package-multilib.bbclass
diff --git a/recipes/glibc/glibc-package-multilib.bbclass b/recipes/glibc/glibc-package-multilib.bbclass
new file mode 100644
index 0000000..bf25b92
--- /dev/null
+++ b/recipes/glibc/glibc-package-multilib.bbclass
@@ -0,0 +1,79 @@
+#
+# For now, we will skip building of a gcc package if it is a uclibc one
+# and our build is not a uclibc one, and we skip a glibc one if our build
+# is a uclibc build.
+#
+# See the note in gcc/gcc_3.4.0.oe
+#
+
+PACKAGES = " \
+	glibc-${ARCH_MULTILIB}-dbg glibc-${ARCH_MULTILIB} glibc-${ARCH_MULTILIB}-dev \
+	libsegfault-${ARCH_MULTILIB} \
+	glibc-${ARCH_MULTILIB}-extra-nss glibc-${ARCH_MULTILIB}-thread-db \
+	glibc-${ARCH_MULTILIB}-pcprofile \
+	"
+PACKAGES_DYNAMIC = "glibc-${ARCH_MULTILIB}-gconv-*"
+
+libc_baselibs = "${layout_base_libdir}/libc* ${layout_base_libdir}/libm* ${layout_base_libdir}/ld* ${layout_base_libdir}/libpthread* ${layout_base_libdir}/libresolv* ${layout_base_libdir}/librt* ${layout_base_libdir}/libutil* ${layout_base_libdir}/libnsl* ${layout_base_libdir}/libnss_files* ${layout_base_libdir}/libnss_compat* ${layout_base_libdir}/libnss_dns* ${layout_base_libdir}/libdl* ${layout_base_libdir}/libanl* ${layout_base_libdir}/libBrokenLocale*"
+
+FILES_glibc-${ARCH_MULTILIB} = "${libc_baselibs} ${libdir}/pt_chown ${libdir}/getconf/* ${datadir}/zoneinfo"
+FILES_libsegfault-${ARCH_MULTILIB} = "${layout_base_libdir}/libSegFault*"
+FILES_glibc-${ARCH_MULTILIB}-extra-nss = "${layout_base_libdir}/libnss*"
+FILES_glibc-${ARCH_MULTILIB}-dev_append = " ${libdir}/*.o ${includedir} ${libdir}/*.so ${libdir}/*.a"
+FILES_glibc-${ARCH_MULTILIB}-pcprofile = "${layout_base_libdir}/libpcprofile.so"
+FILES_glibc-${ARCH_MULTILIB}-thread-db = "${layout_base_libdir}/libthread_db*"
+RPROVIDES_glibc-${ARCH_MULTILIB}-dev += "libc-${ARCH_MULTILIB}-dev"
+FILES_glibc-${ARCH_MULTILIB}-gconv = "${libdir}/gconv/*"
+FILES_glibc-${ARCH_MULTILIB}-dbg += " ${libdir}/*/.debug ${layout_base_libdir}/.debug"
+
+DESCRIPTION_glibc-extra-nss = "glibc: nis, nisplus and hesiod search services"
+
+EXTRA_OECONF += "${@get_glibc_fpu_setting(bb, d)}"
+
+OVERRIDES_append = ":${TARGET_ARCH}-${TARGET_OS}"
+
+do_install() {
+	oe_runmake install_root=${D} install
+	for r in ${rpcsvc}; do
+		h=`echo $r|sed -e's,\.x$,.h,'`
+		install -m 0644 ${S}/sunrpc/rpcsvc/$h ${D}/${includedir}/rpcsvc/
+	done
+	rm -f ${D}/etc/rpc
+}
+
+python package_do_split_gconvs () {
+	import os, re
+	if (bb.data.getVar('PACKAGE_NO_GCONV', d, 1) == '1'):
+		bb.note("package requested not splitting gconvs")
+		return
+
+	if not bb.data.getVar('PACKAGES', d, 1):
+		return
+
+	libdir = bb.data.getVar('layout_libdir', d, 1)
+	if not libdir:
+		bb.error("libdir not defined")
+		return
+	arch = bb.data.getVar('ARCH_MULTILIB', d, 1)
+	if not arch:
+		bb.error("Multilib packaging requested, but no ARCH_MULTILIB defined")
+		return
+
+	gconv_libdir = base_path_join(libdir, "gconv")
+
+	do_split_packages(d, gconv_libdir, file_regex='^(.*)\.so$', output_pattern='glibc-'+arch+'-gconv-%s', description='gconv module for character set %s', extra_depends='glibc-gconv')
+}
+
+# We want to do this indirection so that we can safely 'return'
+# from the called function even though we're prepending
+python populate_packages_prepend () {
+	if bb.data.getVar('DEBIAN_NAMES', d, 1):
+		arch = bb.data.getVar('ARCH_MULTILIB', d, 1)
+		if not arch:
+			bb.error("Multilib packaging requested, but no ARCH_MULTILIB defined")
+			return
+		bb.data.setVar('PKG_glibc-'+arch, 'libc6-'+arch, d)
+		bb.data.setVar('PKG_glibc-'+arch+'-dev', 'libc6-'+arch+'-dev', d)
+	bb.build.exec_func('package_do_split_gconvs', d)
+	bb.data.setVar('PACKAGES', bb.data.getVar('PACKAGES', d) + ' glibc-${ARCH_MULTILIB}-gconv', d)
+}
diff --git a/recipes/glibc/glibc.inc b/recipes/glibc/glibc.inc
index 1bdd62b..ab19f0a 100644
--- a/recipes/glibc/glibc.inc
+++ b/recipes/glibc/glibc.inc
@@ -3,11 +3,12 @@ HOMEPAGE = "http://www.gnu.org/software/libc/libc.html"
 SECTION = "libs"
 PRIORITY = "required"
 LICENSE = "LGPL"
+GLIBC_PREFIX ?= "${TARGET_PREFIX}"
 # nptl needs unwind support in gcc, which can't be built without glibc.
-DEPENDS = "virtual/${TARGET_PREFIX}gcc-intermediate linux-libc-headers"
+DEPENDS = "virtual/${GLIBC_PREFIX}gcc-intermediate linux-libc-headers"
 #this leads to circular deps, so lets not add it yet
 #RDEPENDS_ldd += " bash"
-PROVIDES = "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc"
+PROVIDES = "virtual/libc virtual/${GLIBC_PREFIX}libc-for-gcc"
 PROVIDES += "virtual/libintl virtual/libiconv"
 
 inherit autotools
diff --git a/recipes/glibc/glibc_2.6.1.bb b/recipes/glibc/glibc_2.6.1.bb
index c1a9598..9a13e84 100644
--- a/recipes/glibc/glibc_2.6.1.bb
+++ b/recipes/glibc/glibc_2.6.1.bb
@@ -132,6 +132,7 @@ do_configure () {
 		exit 1
 	fi
 	(cd ${S} && gnu-configize) || die "failure in running gnu-configize"
+	export libc_cv_slibdir=${layout_base_libdir}
 	CPPFLAGS="" oe_runconf
 }
 
@@ -142,6 +143,7 @@ rpcsvc = "bootparam_prot.x nlm_prot.x rstat.x \
 do_compile () {
 	# -Wl,-rpath-link <staging>/lib in LDFLAGS can cause breakage if another glibc is in staging
 	unset LDFLAGS
+	export libc_cv_slibdir=${layout_base_libdir}
 	base_do_compile
 	(
 		cd ${S}/sunrpc/rpcsvc
-- 
1.6.2.1


-- 
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.



