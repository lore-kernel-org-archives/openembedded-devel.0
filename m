Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QQo2g-00039A-PU
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 May 2011 00:01:02 +0200
Received: by mail-fx0-f47.google.com with SMTP id 19so2550305fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 May 2011 14:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=oH5QVAZ7Gwelngh6HzIfJt5zqNoU1aGkfRtalEYzp3U=;
	b=nM6jzQ911G3X1ZD33InvQHpQMbEILvYT7tifaRapHo4SKnk0rwZ2VK7wBcf1/gQo1/
	pgk12o+zJkmLHVeV5wV/bFX3Gv5e2arXI72dJhhn71eS95rTrw+uxURvlqzo3nVgw5bk
	HSygDqZqJHyGdHd2ltkYbilzVRpzFUMpsOhbQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=qP9dYGdK8myaSxBVeJHZxJuKhnqQB7QhpaSmGiBkWr3fLrIORR+LIM3aBncecKlub0
	EfeDhRvt1Avdp9md58uP4iN3OUS2a1TLGZG/hz2+Q2gYFkiqoPsmNFKR6mw3DkZgJ8e9
	GL8CgfbdMZ5hKrO5OFDPnkbO3AxfhaR/TyEaM=
Received: by 10.223.40.85 with SMTP id j21mr4852069fae.22.1306706277517;
	Sun, 29 May 2011 14:57:57 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id q14sm526507faa.27.2011.05.29.14.57.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 May 2011 14:57:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 May 2011 23:56:39 +0200
Message-Id: <7c152332af7df3a4f6ddc991740c2c4fb8e7e375.1306706130.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc3
In-Reply-To: <355a220b55867ef7a2fd485fbc1fcb76c06ef5d1.1306706130.git.Martin.Jansa@gmail.com>
References: <355a220b55867ef7a2fd485fbc1fcb76c06ef5d1.1306706130.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1306706130.git.Martin.Jansa@gmail.com>
References: <cover.1306706130.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 14/14] tcpdump: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
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
X-List-Received-Date: Sun, 29 May 2011 22:01:46 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../0001-minimal-IEEE802.15.4-allowed.patch        |   22 ++++++++++
 .../tcpdump/tcpdump-4.1.1/configure.patch          |   29 +++++++++++++
 .../tcpdump/tcpdump-4.1.1/ipv6-cross.patch         |   41 +++++++++++++++++++
 .../tcpdump-4.1.1/tcpdump_configure_no_-O2.patch   |   42 ++++++++++++++++++++
 meta-oe/recipes-support/tcpdump/tcpdump_4.1.1.bb   |   42 ++++++++++++++++++++
 5 files changed, 176 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/tcpdump/tcpdump-4.1.1/0001-minimal-IEEE802.15.4-allowed.patch
 create mode 100644 meta-oe/recipes-support/tcpdump/tcpdump-4.1.1/configure.patch
 create mode 100644 meta-oe/recipes-support/tcpdump/tcpdump-4.1.1/ipv6-cross.patch
 create mode 100644 meta-oe/recipes-support/tcpdump/tcpdump-4.1.1/tcpdump_configure_no_-O2.patch
 create mode 100644 meta-oe/recipes-support/tcpdump/tcpdump_4.1.1.bb

diff --git a/meta-oe/recipes-support/tcpdump/tcpdump-4.1.1/0001-minimal-IEEE802.15.4-allowed.patch b/meta-oe/recipes-support/tcpdump/tcpdump-4.1.1/0001-minimal-IEEE802.15.4-allowed.patch
new file mode 100644
index 0000000..9d3d60d
--- /dev/null
+++ b/meta-oe/recipes-support/tcpdump/tcpdump-4.1.1/0001-minimal-IEEE802.15.4-allowed.patch
@@ -0,0 +1,22 @@
+From: Sergey Lapin <slapin@slind.org>
+Date: Wed, 28 Jan 2009 16:34:15 +0300
+Subject: [PATCH] minimal IEEE802.15.4 allowed
+
+---
+ tcpdump.c |    3 +++
+ 1 files changed, 3 insertions(+), 0 deletions(-)
+
+diff --git a/tcpdump.c b/tcpdump.c
+index 06683af..fbc944c 100644
+--- a/tcpdump.c
++++ b/tcpdump.c
+@@ -282,6 +282,9 @@ static struct printer printers[] = {
+ #ifdef DLT_MFR
+ 	{ mfr_if_print,		DLT_MFR },
+ #endif
++#ifdef DLT_IEEE802_15_4
++	{ raw_if_print, DLT_IEEE802_15_4 },
++#endif
+ #if defined(DLT_BLUETOOTH_HCI_H4_WITH_PHDR) && defined(HAVE_PCAP_BLUETOOTH_H)
+ 	{ bt_if_print,		DLT_BLUETOOTH_HCI_H4_WITH_PHDR},
+ #endif
diff --git a/meta-oe/recipes-support/tcpdump/tcpdump-4.1.1/configure.patch b/meta-oe/recipes-support/tcpdump/tcpdump-4.1.1/configure.patch
new file mode 100644
index 0000000..3697420
--- /dev/null
+++ b/meta-oe/recipes-support/tcpdump/tcpdump-4.1.1/configure.patch
@@ -0,0 +1,29 @@
+---
+ aclocal.m4   |    1 -
+ configure.in |    1 +
+ 2 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/aclocal.m4 b/aclocal.m4
+index 40b5866..0c662b0 100644
+--- a/aclocal.m4
++++ b/aclocal.m4
+@@ -40,7 +40,6 @@ dnl
+ AC_DEFUN(AC_LBL_C_INIT_BEFORE_CC,
+     [AC_PREREQ(2.50)
+     AC_BEFORE([$0], [AC_LBL_C_INIT])
+-    AC_BEFORE([$0], [AC_PROG_CC])
+     AC_BEFORE([$0], [AC_LBL_FIXINCLUDES])
+     AC_BEFORE([$0], [AC_LBL_DEVEL])
+     AC_ARG_WITH(gcc, [  --without-gcc           don't use gcc])
+diff --git a/configure.in b/configure.in
+index 11257c9..7f9591c 100644
+--- a/configure.in
++++ b/configure.in
+@@ -19,6 +19,7 @@ AC_REVISION($Revision: 1.204 $)
+ AC_PREREQ(2.50)
+ AC_INIT(tcpdump.c)
+ 
++AC_PROG_CC
+ AC_CANONICAL_HOST
+ 
+ AC_LBL_C_INIT_BEFORE_CC(V_CCOPT, V_INCLS)
diff --git a/meta-oe/recipes-support/tcpdump/tcpdump-4.1.1/ipv6-cross.patch b/meta-oe/recipes-support/tcpdump/tcpdump-4.1.1/ipv6-cross.patch
new file mode 100644
index 0000000..7eba2c5
--- /dev/null
+++ b/meta-oe/recipes-support/tcpdump/tcpdump-4.1.1/ipv6-cross.patch
@@ -0,0 +1,41 @@
+---
+ configure.in |   12 ++++++++----
+ 1 files changed, 8 insertions(+), 4 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index eb3e5e8..11257c9 100644
+--- a/configure.in
++++ b/configure.in
+@@ -181,8 +181,9 @@ yes)   AC_MSG_RESULT(yes)
+        ipv6=no
+        ;;
+   esac ],
+-
+-  AC_TRY_RUN([ /* AF_INET6 available check */
++[
++  if test x"$cross_compiling" != "xyes"; then
++    AC_TRY_RUN([ /* AF_INET6 avalable check */
+ #include <sys/types.h>
+ #include <sys/socket.h>
+ main()
+@@ -201,7 +202,10 @@ main()
+   ipv6=no],
+ [ AC_MSG_RESULT(no)
+   ipv6=no]
+-))
++  )
++else
++  AC_MSG_FAILURE([Unable to check for ipv6 when crosscompiling, please specify.])
++fi])
+ 
+ ipv6type=unknown
+ ipv6lib=none
+@@ -316,7 +320,7 @@ if test "$ipv6" = "yes" -a "$ipv6lib" != "none"; then
+ fi
+ 
+ 
+-if test "$ipv6" = "yes"; then
++if test x"$cross_compiling" != "xyes" -a "$ipv6" = "yes"; then
+ 	#
+ 	# XXX - on Tru64 UNIX 5.1, there is no "getaddrinfo()"
+ 	# function in libc; there are "ngetaddrinfo()" and
diff --git a/meta-oe/recipes-support/tcpdump/tcpdump-4.1.1/tcpdump_configure_no_-O2.patch b/meta-oe/recipes-support/tcpdump/tcpdump-4.1.1/tcpdump_configure_no_-O2.patch
new file mode 100644
index 0000000..7929da5
--- /dev/null
+++ b/meta-oe/recipes-support/tcpdump/tcpdump-4.1.1/tcpdump_configure_no_-O2.patch
@@ -0,0 +1,42 @@
+---
+ configure |    8 ++++----
+ 1 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/configure b/configure
+index cb51d19..73d51af 100755
+--- a/configure
++++ b/configure
+@@ -2691,13 +2691,13 @@ if test "$ac_test_CFLAGS" = set; then
+   CFLAGS=$ac_save_CFLAGS
+ elif test $ac_cv_prog_cc_g = yes; then
+   if test "$GCC" = yes; then
+-    CFLAGS="-g -O2"
++    CFLAGS="-g"
+   else
+     CFLAGS="-g"
+   fi
+ else
+   if test "$GCC" = yes; then
+-    CFLAGS="-O2"
++    CFLAGS=""
+   else
+     CFLAGS=
+   fi
+@@ -2830,7 +2830,7 @@ ac_compiler_gnu=$ac_cv_c_compiler_gnu
+     if test "$GCC" = yes ; then
+ 	    if test "$SHLICC2" = yes ; then
+ 		    ac_cv_lbl_gcc_vers=2
+-		    V_CCOPT="-O2"
++		    V_CCOPT=""
+ 	    else
+ 		    { echo "$as_me:$LINENO: checking gcc version" >&5
+ echo $ECHO_N "checking gcc version... $ECHO_C" >&6; }
+@@ -2847,7 +2847,7 @@ fi
+ 		    { echo "$as_me:$LINENO: result: $ac_cv_lbl_gcc_vers" >&5
+ echo "${ECHO_T}$ac_cv_lbl_gcc_vers" >&6; }
+ 		    if test $ac_cv_lbl_gcc_vers -gt 1 ; then
+-			    V_CCOPT="-O2"
++			    V_CCOPT=""
+ 		    fi
+ 	    fi
+     else
diff --git a/meta-oe/recipes-support/tcpdump/tcpdump_4.1.1.bb b/meta-oe/recipes-support/tcpdump/tcpdump_4.1.1.bb
new file mode 100644
index 0000000..109bc77
--- /dev/null
+++ b/meta-oe/recipes-support/tcpdump/tcpdump_4.1.1.bb
@@ -0,0 +1,42 @@
+DESCRIPTION = "A sophisticated network protocol analyzer"
+HOMEPAGE = "http://www.tcpdump.org/"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1d4b0366557951c84a94fabe3529f867"
+SECTION = "console/network"
+PRIORITY = "optional"
+DEPENDS = "libpcap"
+PR = "r1"
+
+SRC_URI = " \
+	http://www.tcpdump.org/release/tcpdump-${PV}.tar.gz \
+	file://tcpdump_configure_no_-O2.patch \
+	file://0001-minimal-IEEE802.15.4-allowed.patch \
+	file://ipv6-cross.patch \
+	file://configure.patch \
+"
+
+inherit autotools
+# ac_cv_linux_vers=${ac_cv_linux_vers=2}
+
+EXTRA_OECONF = "--without-crypto \
+		${@base_contains('DISTRO_FEATURES', 'ipv6', '--enable-ipv6', '--disable-ipv6', d)}"
+
+do_configure() {
+	# AC_CHECK_LIB(dlpi.. was looking to host /lib
+	sed -i 's:-L/lib:-L${STAGING_LIBDIR}:g' ./configure.in
+        
+	gnu-configize
+	autoconf
+	oe_runconf
+	sed -i 's:/usr/lib:${STAGING_LIBDIR}:' ./Makefile
+	sed -i 's:/usr/include:${STAGING_INCDIR}:' ./Makefile
+}
+
+do_install_append() {
+	# tcpdump 4.0.0 installs a copy to /usr/sbin/tcpdump.4.0.0
+	rm -f ${D}${sbindir}/tcpdump.${PV}
+}
+
+SRC_URI[md5sum] = "d0dd58bbd6cd36795e05c6f1f74420b0"
+SRC_URI[sha256sum] = "e6cd4bbd61ec7adbb61ba8352c4b4734f67b8caaa845d88cb826bc0b9f1e7f0a"
+
-- 
1.7.5.rc3



