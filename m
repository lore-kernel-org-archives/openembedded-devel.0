Received: from [80.246.246.162] (helo=office.altell.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1LzRaZ-0007h6-0G
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Apr 2009 10:25:51 +0200
Received: from localhost.localdomain (unknown [192.168.1.115])
	by mail.altell.local (Postfix) with ESMTP id A499668429;
	Thu, 30 Apr 2009 12:20:09 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 30 Apr 2009 12:20:06 +0400
Message-Id: <1241079609-5912-1-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.2.4
In-Reply-To: <be7a9f3d0904270832j4832bc6fqcf058fdfc3d8479@mail.gmail.com>
References: <be7a9f3d0904270832j4832bc6fqcf058fdfc3d8479@mail.gmail.com>
MIME-Version: 1.0
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: khimov@altell.ru
X-Spam-Status: No
Subject: [PATCH 1/4] coreutils: add version 7.2
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
X-List-Received-Date: Thu, 30 Apr 2009 08:25:51 -0000

---
 conf/checksums.ini                                 |    4 +
 .../coreutils/coreutils-7.2/automake-version.patch |   13 +++
 recipes/coreutils/coreutils-7.2/man.patch          |   47 +++++++++++
 recipes/coreutils/coreutils-7.2/onceonly.m4        |   63 ++++++++++++++
 recipes/coreutils/coreutils-native_7.2.bb          |    5 +
 recipes/coreutils/coreutils_7.2.bb                 |   88 ++++++++++++++++++++
 6 files changed, 220 insertions(+), 0 deletions(-)
 create mode 100644 recipes/coreutils/coreutils-7.2/automake-version.patch
 create mode 100644 recipes/coreutils/coreutils-7.2/man.patch
 create mode 100644 recipes/coreutils/coreutils-7.2/onceonly.m4
 create mode 100644 recipes/coreutils/coreutils-native_7.2.bb
 create mode 100644 recipes/coreutils/coreutils_7.2.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index ffc84c6..9a2c473 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -3990,6 +3990,10 @@ sha256=efa27532ec6dc12a21f703ad4a0f612e613e9cc2575147685db81cc701952ac9
 md5=cbb2b3d1718ee1237b808e00b5c11b1e
 sha256=813cb19fa19a885f342664109c7c5810f0081b624ff317bba8d1b6ccd83c2a05
 
+[ftp://ftp.gnu.org/gnu/coreutils/coreutils-7.2.tar.gz]
+md5=427c2914d3eab956f317c9ec6a45e62a
+sha256=dd77bfec92e5a3ad48abd8a5bda3f8d40149c4e24744e4173abc3cc6a731fdb2
+
 [http://www.rpsys.net/openzaurus/patches/archive/corgi_rearrange_lcd-r0.patch]
 md5=c1bec44c92f5da5abad97137c73b1365
 sha256=d4dc8f0583e616e74ea41b103d5f6a29b6d079ce37eaf9f362825514c7082490
diff --git a/recipes/coreutils/coreutils-7.2/automake-version.patch b/recipes/coreutils/coreutils-7.2/automake-version.patch
new file mode 100644
index 0000000..497ef15
--- /dev/null
+++ b/recipes/coreutils/coreutils-7.2/automake-version.patch
@@ -0,0 +1,13 @@
+Index: coreutils-7.1/configure.ac
+===================================================================
+--- coreutils-7.1.orig/configure.ac
++++ coreutils-7.1/configure.ac
+@@ -32,7 +32,7 @@
+ AC_CONFIG_AUX_DIR([build-aux])
+ AC_CONFIG_HEADERS([lib/config.h:lib/config.hin])
+ 
+-AM_INIT_AUTOMAKE([1.10a dist-xz])
++AM_INIT_AUTOMAKE([1.10.2])
+ 
+ AC_PROG_CC_STDC
+ AM_PROG_CC_C_O
diff --git a/recipes/coreutils/coreutils-7.2/man.patch b/recipes/coreutils/coreutils-7.2/man.patch
new file mode 100644
index 0000000..3de7c01
--- /dev/null
+++ b/recipes/coreutils/coreutils-7.2/man.patch
@@ -0,0 +1,47 @@
+
+#
+# Patch managed by http://www.holgerschurig.de/patcher.html
+#
+
+Index: coreutils-7.1/configure.ac
+===================================================================
+--- coreutils-7.1.orig/configure.ac
++++ coreutils-7.1/configure.ac
+@@ -373,6 +373,20 @@
+ # For a test of uniq: it uses the $LOCALE_FR envvar.
+ gt_LOCALE_FR
+ 
++AC_MSG_CHECKING([whether to build man pages])
++AC_ARG_WITH(manpages, 
++	AS_HELP_STRING([--with-manpages],
++		[Enable building of manpages (default=yes)]),
++	[cu_cv_build_manpages=$enableval],
++	[cu_cv_build_manpages=yes])
++# help2man doesn't work when crosscompiling, as it needs to run the
++# binary that was built.
++if test x"$cross_compiling" = x"yes"; then
++  cu_cv_build_manpages=no
++fi
++AC_MSG_RESULT($cu_cv_build_manpages)
++AM_CONDITIONAL(ENABLE_MANPAGES, test x"$cu_cv_build_manpages" = x"yes")
++
+ AC_CONFIG_FILES(
+   Makefile
+   doc/Makefile
+Index: coreutils-7.1/Makefile.am
+===================================================================
+--- coreutils-7.1.orig/Makefile.am
++++ coreutils-7.1/Makefile.am
+@@ -15,7 +15,12 @@
+ # You should have received a copy of the GNU General Public License
+ # along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ 
++if ENABLE_MANPAGES
+ SUBDIRS = lib src doc man po tests gnulib-tests
++else
++SUBDIRS = lib src doc po tests gnulib-tests
++endif
++
+ EXTRA_DIST = cfg.mk maint.mk \
+   .prev-version THANKS-to-translators THANKStt.in \
+   .version \
diff --git a/recipes/coreutils/coreutils-7.2/onceonly.m4 b/recipes/coreutils/coreutils-7.2/onceonly.m4
new file mode 100644
index 0000000..f6fec37
--- /dev/null
+++ b/recipes/coreutils/coreutils-7.2/onceonly.m4
@@ -0,0 +1,63 @@
+# onceonly.m4 serial 3
+dnl Copyright (C) 2002, 2003 Free Software Foundation, Inc.
+dnl This file is free software, distributed under the terms of the GNU
+dnl General Public License.  As a special exception to the GNU General
+dnl Public License, this file may be distributed as part of a program
+dnl that contains a configuration script generated by Autoconf, under
+dnl the same distribution terms as the rest of that program.
+
+dnl This file defines some "once only" variants of standard autoconf macros.
+dnl   AC_CHECK_HEADERS_ONCE         like  AC_CHECK_HEADERS
+dnl   AC_CHECK_FUNCS_ONCE           like  AC_CHECK_FUNCS
+dnl   AC_CHECK_DECLS_ONCE           like  AC_CHECK_DECLS
+dnl   AC_REQUIRE([AC_HEADER_STDC])  like  AC_HEADER_STDC
+dnl The advantage is that the check for each of the headers/functions/decls
+dnl will be put only once into the 'configure' file. It keeps the size of
+dnl the 'configure' file down, and avoids redundant output when 'configure'
+dnl is run.
+dnl The drawback is that the checks cannot be conditionalized. If you write
+dnl   if some_condition; then gl_CHECK_HEADERS(stdlib.h); fi
+dnl inside an AC_DEFUNed function, the gl_CHECK_HEADERS macro call expands to
+dnl empty, and the check will be inserted before the body of the AC_DEFUNed
+dnl function.
+
+dnl Autoconf version 2.57 or newer is recommended.
+AC_PREREQ(2.54)
+
+# AC_CHECK_HEADERS_ONCE(HEADER1 HEADER2 ...) is a once-only variant of
+# AC_CHECK_HEADERS(HEADER1 HEADER2 ...).
+AC_DEFUN([AC_CHECK_HEADERS_ONCE], [
+  :
+  AC_FOREACH([gl_HEADER_NAME], [$1], [
+    AC_DEFUN([gl_CHECK_HEADER_]m4_quote(translit(defn([gl_HEADER_NAME]),
+                                                 [-./], [___])), [
+      AC_CHECK_HEADERS(gl_HEADER_NAME)
+    ])
+    AC_REQUIRE([gl_CHECK_HEADER_]m4_quote(translit(gl_HEADER_NAME,
+                                                   [-./], [___])))
+  ])
+])
+
+# AC_CHECK_FUNCS_ONCE(FUNC1 FUNC2 ...) is a once-only variant of
+# AC_CHECK_FUNCS(FUNC1 FUNC2 ...).
+AC_DEFUN([AC_CHECK_FUNCS_ONCE], [
+  :
+  AC_FOREACH([gl_FUNC_NAME], [$1], [
+    AC_DEFUN([gl_CHECK_FUNC_]defn([gl_FUNC_NAME]), [
+      AC_CHECK_FUNCS(defn([gl_FUNC_NAME]))
+    ])
+    AC_REQUIRE([gl_CHECK_FUNC_]defn([gl_FUNC_NAME]))
+  ])
+])
+
+# AC_CHECK_DECLS_ONCE(DECL1 DECL2 ...) is a once-only variant of
+# AC_CHECK_DECLS(DECL1, DECL2, ...).
+AC_DEFUN([AC_CHECK_DECLS_ONCE], [
+  :
+  AC_FOREACH([gl_DECL_NAME], [$1], [
+    AC_DEFUN([gl_CHECK_DECL_]defn([gl_DECL_NAME]), [
+      AC_CHECK_DECLS(defn([gl_DECL_NAME]))
+    ])
+    AC_REQUIRE([gl_CHECK_DECL_]defn([gl_DECL_NAME]))
+  ])
+])
diff --git a/recipes/coreutils/coreutils-native_7.2.bb b/recipes/coreutils/coreutils-native_7.2.bb
new file mode 100644
index 0000000..057dfa6
--- /dev/null
+++ b/recipes/coreutils/coreutils-native_7.2.bb
@@ -0,0 +1,5 @@
+FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/coreutils-${PV}"
+S = "${WORKDIR}/coreutils-${PV}"
+
+require coreutils_${PV}.bb
+inherit native
diff --git a/recipes/coreutils/coreutils_7.2.bb b/recipes/coreutils/coreutils_7.2.bb
new file mode 100644
index 0000000..0e13400
--- /dev/null
+++ b/recipes/coreutils/coreutils_7.2.bb
@@ -0,0 +1,88 @@
+require coreutils.inc
+
+SRC_URI = "\
+  ftp://ftp.gnu.org/gnu/coreutils/coreutils-${PV}.tar.gz \
+  file://automake-version.patch;patch=1 \
+  file://man.patch;patch=1 \
+  file://onceonly.m4 \
+"
+
+# [ gets a special treatment and is not included in this
+bindir_progs = "basename cksum comm csplit cut df dir dircolors dirname du \
+		env expand expr factor fmt fold groups head hostid id install \
+		join link logname md5sum mkfifo nice nl nohup od paste pathchk \
+		pinky pr printenv printf ptx readlink seq sha1sum shred sort \
+		split stat sum tac tail tee test tr tsort tty unexpand uniq \
+		unlink users vdir wc who whoami yes \
+		"
+
+# hostname gets a special treatment and is not included in this
+base_bindir_progs = "cat chgrp chmod chown cp date dd echo false kill \
+		     ln ls mkdir mknod mv pwd rm rmdir sleep stty sync touch \
+		     true uname \
+		     "
+
+sbindir_progs= "chroot"
+
+do_configure_prepend() {
+	install -m 0644 ${WORKDIR}/onceonly.m4 ${S}/m4
+}
+
+do_install () {
+	autotools_do_install
+
+	# Renaming the utilities that should go in /usr/bin
+	for i in ${bindir_progs}; do mv ${D}${bindir}/$i ${D}${bindir}/$i.${PN}; done
+
+	# Renaming and moving the utilities that should go in /bin (FHS)
+	install -d ${D}${base_bindir}
+	for i in ${base_bindir_progs}; do mv ${D}${bindir}/$i ${D}${base_bindir}/$i.${PN}; done
+
+	# Renaming and moving the utilities that should go in /usr/sbin (FHS)
+	install -d ${D}${sbindir}
+	for i in ${sbindir_progs}; do mv ${D}${bindir}/$i ${D}${sbindir}/$i.${PN}; done
+
+	# [ requires special handling because [.coreutils will cause the sed stuff
+	# in update-alternatives to fail, therefore use lbracket - the name used
+	# for the actual source file.
+	mv ${D}${bindir}/[ ${D}${bindir}/lbracket.${PN}
+	# hostname and uptime separated. busybox's versions are preferred
+	if [ -e ${D}${bindir}/hostname ]; then
+		mv ${D}${bindir}/hostname ${D}${base_bindir}/hostname.${PN}
+	fi
+	if [ -e ${D}${bindir}/uptime ]; then
+		mv ${D}${bindir}/uptime ${D}${bindir}/uptime.${PN}
+	fi
+}
+
+pkg_postinst_${PN} () {
+	# The utilities in /usr/bin
+	for i in ${bindir_progs}; do update-alternatives --install ${bindir}/$i $i $i.${PN} 100; done
+
+	# The utilities in /bin
+	for i in ${base_bindir_progs}; do update-alternatives --install ${base_bindir}/$i $i $i.${PN} 100; done
+
+	# The utilities in /usr/sbin
+	for i in ${sbindir_progs}; do update-alternatives --install ${sbindir}/$i $i $i.${PN} 100; done
+
+	# Special cases. uptime and hostname is broken, prefer busybox's version. [ needs to be treated separately.
+	update-alternatives --install ${bindir}/uptime uptime uptime.${PN} 10
+	update-alternatives --install ${base_bindir}/hostname hostname hostname.${PN} 10
+	update-alternatives --install '${bindir}/[' '[' 'lbracket.${PN}' 100
+}
+
+pkg_prerm_${PN} () {
+	# The utilities in /usr/bin
+	for i in ${bindir_progs}; do update-alternatives --remove $i $i.${PN}; done
+
+	# The utilities in /bin
+	for i in ${base_bindir_progs}; do update-alternatives --remove $i $i.${PN}; done
+
+	# The utilities in /usr/sbin
+	for i in ${sbindir_progs}; do update-alternatives --remove $i $i.${PN}; done
+
+	# The special cases
+	update-alternatives --remove hostname hostname.${PN}
+	update-alternatives --remove uptime uptime.${PN}
+	update-alternatives --remove '[' 'lbracket.${PN}'
+}
-- 
1.6.2.4


-- 
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.



