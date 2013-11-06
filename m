Return-Path: <B40527@freescale.com>
Received: from co1outboundpool.messaging.microsoft.com
	(co1ehsobe003.messaging.microsoft.com [216.32.180.186])
	by mail.openembedded.org (Postfix) with ESMTP id DE8396D419
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Nov 2013 05:40:37 +0000 (UTC)
Received: from mail56-co1-R.bigfish.com (10.243.78.236) by
	CO1EHSOBE027.bigfish.com (10.243.66.90) with Microsoft SMTP Server id
	14.1.225.22; Wed, 6 Nov 2013 05:40:39 +0000
Received: from mail56-co1 (localhost [127.0.0.1])	by mail56-co1-R.bigfish.com
	(Postfix) with ESMTP id 5F6FA1C0198;
	Wed,  6 Nov 2013 05:40:39 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 6
X-BigFish: VS6(z37d5kz853kzz1f42h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h1d1ah1d2ah1fc6hzz8275ch1de098h17326ah8275bh8275dh1de097h186068hz2dh2a8h839he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh2222h224fh1fb3h1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1fe8h1ff5h2218h2216h1155h)
Received: from mail56-co1 (localhost.localdomain [127.0.0.1]) by mail56-co1
	(MessageSwitch) id 138371643648491_6953; Wed,  6 Nov 2013 05:40:36 +0000
	(UTC)
Received: from CO1EHSMHS022.bigfish.com (unknown [10.243.78.237])	by
	mail56-co1.bigfish.com (Postfix) with ESMTP id 08D1870004B;
	Wed,  6 Nov 2013 05:40:36 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS022.bigfish.com
	(10.243.66.32) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Wed, 6 Nov 2013 05:40:35 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-005.039d.mgd.msft.net (10.84.1.17) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Wed, 6 Nov 2013 05:40:34 +0000
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	rA65eXJX011734; Tue, 5 Nov 2013 22:40:34 -0700
From: <Zongchun.Yu@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 5 Nov 2013 23:40:30 -0600
Message-ID: <1383716430-18050-1-git-send-email-Zongchun.Yu@freescale.com>
X-Mailer: git-send-email 1.7.9.7
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Cc: Zongchun Yu <Zongchun.Yu@freescale.com>
Subject: [meta-networking][PATCH] tcpdump, tcpreplay:relocate tcpdump and add tcpreplay recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Nov 2013 05:40:39 -0000
Content-Type: text/plain

From: Zongchun Yu <Zongchun.Yu@freescale.com>

*mv tcpdump from meta-oe to meta-networking
*add tcpreplay - a suite of GPLv3 licensed tools for UNIX operating
systems which gives you the ability to use previously captured traffic
in libpcap format to test a variety of network devices.

Signed-off-by: Zongchun Yu <Zongchun.Yu@freescale.com>
---
 .../0001-minimal-IEEE802.15.4-allowed.patch        |   22 +++++
 .../tcpdump/tcpdump-4.3.0/configure.patch          |   29 ++++++
 .../tcpdump/tcpdump-4.3.0/ipv6-cross.patch         |   41 +++++++++
 .../tcpdump-4.3.0/tcpdump_configure_no_-O2.patch   |   42 +++++++++
 .../recipes-support/tcpdump/tcpdump_4.3.0.bb       |   43 +++++++++
 .../files/tcpreplay-3.4.4-cross-compile.patch      |   92 ++++++++++++++++++++
 ...ay-3.4.4-fix-unable-to-link-libpcap-issue.patch |   17 ++++
 .../files/tcpreplay-3.4.4-no-bfp-support.patch     |   15 ++++
 .../recipes-support/tcpreplay/tcpreplay_3.4.4.bb   |   22 +++++
 .../packagegroups/packagegroup-cli-tools.bb        |    1 -
 .../0001-minimal-IEEE802.15.4-allowed.patch        |   22 -----
 .../tcpdump/tcpdump-4.3.0/configure.patch          |   29 ------
 .../tcpdump/tcpdump-4.3.0/ipv6-cross.patch         |   41 ---------
 .../tcpdump-4.3.0/tcpdump_configure_no_-O2.patch   |   42 ---------
 meta-oe/recipes-support/tcpdump/tcpdump_4.3.0.bb   |   43 ---------
 15 files changed, 323 insertions(+), 178 deletions(-)
 create mode 100644 meta-networking/recipes-support/tcpdump/tcpdump-4.3.0/0001-minimal-IEEE802.15.4-allowed.patch
 create mode 100644 meta-networking/recipes-support/tcpdump/tcpdump-4.3.0/configure.patch
 create mode 100644 meta-networking/recipes-support/tcpdump/tcpdump-4.3.0/ipv6-cross.patch
 create mode 100644 meta-networking/recipes-support/tcpdump/tcpdump-4.3.0/tcpdump_configure_no_-O2.patch
 create mode 100644 meta-networking/recipes-support/tcpdump/tcpdump_4.3.0.bb
 create mode 100755 meta-networking/recipes-support/tcpreplay/files/tcpreplay-3.4.4-cross-compile.patch
 create mode 100644 meta-networking/recipes-support/tcpreplay/files/tcpreplay-3.4.4-fix-unable-to-link-libpcap-issue.patch
 create mode 100644 meta-networking/recipes-support/tcpreplay/files/tcpreplay-3.4.4-no-bfp-support.patch
 create mode 100644 meta-networking/recipes-support/tcpreplay/tcpreplay_3.4.4.bb
 delete mode 100644 meta-oe/recipes-support/tcpdump/tcpdump-4.3.0/0001-minimal-IEEE802.15.4-allowed.patch
 delete mode 100644 meta-oe/recipes-support/tcpdump/tcpdump-4.3.0/configure.patch
 delete mode 100644 meta-oe/recipes-support/tcpdump/tcpdump-4.3.0/ipv6-cross.patch
 delete mode 100644 meta-oe/recipes-support/tcpdump/tcpdump-4.3.0/tcpdump_configure_no_-O2.patch
 delete mode 100644 meta-oe/recipes-support/tcpdump/tcpdump_4.3.0.bb

diff --git a/meta-networking/recipes-support/tcpdump/tcpdump-4.3.0/0001-minimal-IEEE802.15.4-allowed.patch b/meta-networking/recipes-support/tcpdump/tcpdump-4.3.0/0001-minimal-IEEE802.15.4-allowed.patch
new file mode 100644
index 0000000..9d3d60d
--- /dev/null
+++ b/meta-networking/recipes-support/tcpdump/tcpdump-4.3.0/0001-minimal-IEEE802.15.4-allowed.patch
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
diff --git a/meta-networking/recipes-support/tcpdump/tcpdump-4.3.0/configure.patch b/meta-networking/recipes-support/tcpdump/tcpdump-4.3.0/configure.patch
new file mode 100644
index 0000000..3697420
--- /dev/null
+++ b/meta-networking/recipes-support/tcpdump/tcpdump-4.3.0/configure.patch
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
diff --git a/meta-networking/recipes-support/tcpdump/tcpdump-4.3.0/ipv6-cross.patch b/meta-networking/recipes-support/tcpdump/tcpdump-4.3.0/ipv6-cross.patch
new file mode 100644
index 0000000..7eba2c5
--- /dev/null
+++ b/meta-networking/recipes-support/tcpdump/tcpdump-4.3.0/ipv6-cross.patch
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
diff --git a/meta-networking/recipes-support/tcpdump/tcpdump-4.3.0/tcpdump_configure_no_-O2.patch b/meta-networking/recipes-support/tcpdump/tcpdump-4.3.0/tcpdump_configure_no_-O2.patch
new file mode 100644
index 0000000..7929da5
--- /dev/null
+++ b/meta-networking/recipes-support/tcpdump/tcpdump-4.3.0/tcpdump_configure_no_-O2.patch
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
diff --git a/meta-networking/recipes-support/tcpdump/tcpdump_4.3.0.bb b/meta-networking/recipes-support/tcpdump/tcpdump_4.3.0.bb
new file mode 100644
index 0000000..1da8194
--- /dev/null
+++ b/meta-networking/recipes-support/tcpdump/tcpdump_4.3.0.bb
@@ -0,0 +1,43 @@
+DESCRIPTION = "A sophisticated network protocol analyzer"
+HOMEPAGE = "http://www.tcpdump.org/"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1d4b0366557951c84a94fabe3529f867"
+SECTION = "console/network"
+DEPENDS = "libpcap"
+
+SRC_URI = " \
+    http://www.tcpdump.org/release/tcpdump-${PV}.tar.gz \
+    file://tcpdump_configure_no_-O2.patch \
+    file://0001-minimal-IEEE802.15.4-allowed.patch \
+    file://ipv6-cross.patch \
+    file://configure.patch \
+"
+SRC_URI[md5sum] = "a3fe4d30ac85ff5467c889ff46b7e1e8"
+SRC_URI[sha256sum] = "efd08b610210d39977ec3175fa82dad9fbd33587930081be2a905a712dba4286"
+
+inherit autotools
+CACHED_CONFIGUREVARS = "ac_cv_linux_vers=${ac_cv_linux_vers=2}"
+
+EXTRA_OECONF = "--without-crypto --disable-rpath \
+        ${@base_contains('DISTRO_FEATURES', 'ipv6', '--enable-ipv6', '--disable-ipv6', d)}"
+
+EXTRA_AUTORECONF += " -I m4"
+
+do_configure_prepend() {
+    mkdir -p ${S}/m4
+    if [ -f aclocal.m4 ]; then
+        mv aclocal.m4 ${S}/m4
+    fi
+    # AC_CHECK_LIB(dlpi.. was looking to host /lib
+    sed -i 's:-L/lib::g' ./configure.in
+}
+do_configure_append() {
+    sed -i 's:-L/usr/lib::' ./Makefile
+    sed -i 's:-Wl,-rpath,${STAGING_LIBDIR}::' ./Makefile
+    sed -i 's:-I/usr/include::' ./Makefile
+}
+
+do_install_append() {
+    # tcpdump 4.0.0 installs a copy to /usr/sbin/tcpdump.4.0.0
+    rm -f ${D}${sbindir}/tcpdump.${PV}
+}
diff --git a/meta-networking/recipes-support/tcpreplay/files/tcpreplay-3.4.4-cross-compile.patch b/meta-networking/recipes-support/tcpreplay/files/tcpreplay-3.4.4-cross-compile.patch
new file mode 100755
index 0000000..a856b18
--- /dev/null
+++ b/meta-networking/recipes-support/tcpreplay/files/tcpreplay-3.4.4-cross-compile.patch
@@ -0,0 +1,92 @@
+Uptream-Status: Pending
+
+Signed-off-by: Zongchun Yu <Zongchun.Yu@freescale.com>
+
+--- a/configure.ac
++++ b/configure.ac
+@@ -402,7 +402,6 @@
+ 
+ dnl 0.9.6 (which is still thinks it is 0.9.5 due to a bug) introduces an important
+ dnl fix for OSX.  See: http://tcpreplay.synfin.net/trac/ticket/167
+-libpcap_version_096=no
+ AC_RUN_IFELSE(AC_LANG_PROGRAM([[
+ #include <string.h>
+ #include <stdlib.h>
+@@ -419,11 +418,12 @@
+             exit(0);
+ 
+     exit(1);
+-]]), [
+-    libpcap_version_096=yes
+-])
++]]),
++ [libpcap_version_096=yes],
++ [libpcap_version_096=no],
++ [libpcap_version_096=yes]
++)
+ 
+-libpcap_ver8=no
+ AC_RUN_IFELSE(AC_LANG_PROGRAM([[
+ #include <string.h>
+ #include <stdlib.h>
+@@ -444,13 +444,12 @@
+         exit(0);
+ 
+     exit(1);
+-]]), [
+-    libpcap_ver8=yes
+-], [
+-    libpcap_ver8=no
+-])
++]]),
++ [libpcap_ver8=yes],
++ [libpcap_ver8=no],
++ [libpcap_ver8=yes]
++)
+ 
+-libpcap_ver7=no
+ AC_RUN_IFELSE(AC_LANG_PROGRAM([[
+ #include <string.h>
+ #include <stdlib.h>
+@@ -469,11 +468,11 @@
+             exit(0);
+ 
+     exit(1);
+-]]), [
+-    libpcap_ver7=yes
+-], [
+-    libpcap_ver7=no
+-])
++]]),
++ [libpcap_ver7=yes],
++ [libpcap_ver7=no],
++ [libpcap_ver7=yes]
++)
+ 
+ if test x$libpcap_ver8 = xyes ; then
+     AC_MSG_RESULT(>= 0.8.0)
+@@ -761,8 +760,8 @@
+ 
+ have_bpf=no
+ dnl Check for BSD's BPF
+-AC_MSG_CHECKING(for BPF device sending support)
+-AC_TRY_RUN([
++AC_CACHE_CHECK([for BPF device sending support], ac_cv_have_bpf,
++[AC_TRY_RUN([
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <sys/types.h>
+@@ -796,8 +795,11 @@
+             [Do we have BPF device support?])
+     AC_MSG_RESULT(yes)
+     have_bpf=yes
+-],[
+-    AC_MSG_RESULT(no)
++],
++[AC_MSG_RESULT(no)],
++[AC_MSG_ERROR([cross-compiling,
++  presetting ac_cv_have_bpf=(yes|no) will help])]
++)
+ ])
+ 
+ 
diff --git a/meta-networking/recipes-support/tcpreplay/files/tcpreplay-3.4.4-fix-unable-to-link-libpcap-issue.patch b/meta-networking/recipes-support/tcpreplay/files/tcpreplay-3.4.4-fix-unable-to-link-libpcap-issue.patch
new file mode 100644
index 0000000..5f36c68
--- /dev/null
+++ b/meta-networking/recipes-support/tcpreplay/files/tcpreplay-3.4.4-fix-unable-to-link-libpcap-issue.patch
@@ -0,0 +1,17 @@
+Uptream-Status: Pending
+
+Signed-off-by: Zongchun Yu <Zongchun.Yu@freescale.com>
+
+Index: tcpreplay-3.4.4/configure.ac
+===================================================================
+--- tcpreplay-3.4.4.orig/configure.ac
++++ tcpreplay-3.4.4/configure.ac
+@@ -389,7 +389,7 @@ CFLAGS="$CFLAGS -I$LPCAPINCDIR"
+ AC_SEARCH_LIBS([pcap_close], [pcap],
+     LPCAPLIB="$LIBS",
+     AC_ERROR([Unable to link libpcap in ${foundpcap}]),
+-    -lnl)
++    -lnl-3)
+ 
+ AC_SUBST(LPCAPINC)
+ AC_SUBST(LPCAPLIB)
diff --git a/meta-networking/recipes-support/tcpreplay/files/tcpreplay-3.4.4-no-bfp-support.patch b/meta-networking/recipes-support/tcpreplay/files/tcpreplay-3.4.4-no-bfp-support.patch
new file mode 100644
index 0000000..3c11c92
--- /dev/null
+++ b/meta-networking/recipes-support/tcpreplay/files/tcpreplay-3.4.4-no-bfp-support.patch
@@ -0,0 +1,15 @@
+Uptream-Status: Pending
+
+Signed-off-by: Zongchun Yu <Zongchun.Yu@freescale.com>
+
+--- a/configure.ac
++++ b/configure.ac
+@@ -758,6 +758,8 @@
+     AC_MSG_RESULT(no)
+ ])
+ 
++ac_cv_have_bpf=no
++
+ have_bpf=no
+ dnl Check for BSD's BPF
+ AC_CACHE_CHECK([for BPF device sending support], ac_cv_have_bpf,
diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay_3.4.4.bb b/meta-networking/recipes-support/tcpreplay/tcpreplay_3.4.4.bb
new file mode 100644
index 0000000..d211888
--- /dev/null
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay_3.4.4.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Use previously captured traffic to test network devices"
+
+HOMEPAGE = "http://tcpreplay.synfin.net/"
+SECTION = "console/network"
+
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=c33cccf72cc1603e8a72a84811ae3ac8"
+
+SRC_URI = "http://prdownloads.sourceforge.net/tcpreplay/${PV}/tcpreplay-${PV}.tar.gz \
+           file://tcpreplay-3.4.4-cross-compile.patch \
+           file://tcpreplay-3.4.4-no-bfp-support.patch \
+           file://tcpreplay-3.4.4-fix-unable-to-link-libpcap-issue.patch \
+           "
+SRC_URI[md5sum] = "22725feb9b2590809f9350308ec65180"
+SRC_URI[sha256sum] = "7a809c58ddec86407fd6e5597ac883d7874a19bea81d716bb2b1c6e3b0e7b58f"
+
+DEPENDS = "libpcap"
+
+EXTRA_OECONF += "--with-libpcap=${STAGING_DIR_HOST}/usr"
+
+inherit siteinfo autotools
+
diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb b/meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb
index fa53a67..8807fd1 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb
@@ -45,7 +45,6 @@ RDEPENDS_${PN}-debug = "\
     s3c64xx-gpio \
     serial-forward \
     strace \
-    tcpdump \
 "
 
 RRECOMMENDS_${PN}-debug = "\
diff --git a/meta-oe/recipes-support/tcpdump/tcpdump-4.3.0/0001-minimal-IEEE802.15.4-allowed.patch b/meta-oe/recipes-support/tcpdump/tcpdump-4.3.0/0001-minimal-IEEE802.15.4-allowed.patch
deleted file mode 100644
index 9d3d60d..0000000
--- a/meta-oe/recipes-support/tcpdump/tcpdump-4.3.0/0001-minimal-IEEE802.15.4-allowed.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-From: Sergey Lapin <slapin@slind.org>
-Date: Wed, 28 Jan 2009 16:34:15 +0300
-Subject: [PATCH] minimal IEEE802.15.4 allowed
-
----
- tcpdump.c |    3 +++
- 1 files changed, 3 insertions(+), 0 deletions(-)
-
-diff --git a/tcpdump.c b/tcpdump.c
-index 06683af..fbc944c 100644
---- a/tcpdump.c
-+++ b/tcpdump.c
-@@ -282,6 +282,9 @@ static struct printer printers[] = {
- #ifdef DLT_MFR
- 	{ mfr_if_print,		DLT_MFR },
- #endif
-+#ifdef DLT_IEEE802_15_4
-+	{ raw_if_print, DLT_IEEE802_15_4 },
-+#endif
- #if defined(DLT_BLUETOOTH_HCI_H4_WITH_PHDR) && defined(HAVE_PCAP_BLUETOOTH_H)
- 	{ bt_if_print,		DLT_BLUETOOTH_HCI_H4_WITH_PHDR},
- #endif
diff --git a/meta-oe/recipes-support/tcpdump/tcpdump-4.3.0/configure.patch b/meta-oe/recipes-support/tcpdump/tcpdump-4.3.0/configure.patch
deleted file mode 100644
index 3697420..0000000
--- a/meta-oe/recipes-support/tcpdump/tcpdump-4.3.0/configure.patch
+++ /dev/null
@@ -1,29 +0,0 @@
----
- aclocal.m4   |    1 -
- configure.in |    1 +
- 2 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/aclocal.m4 b/aclocal.m4
-index 40b5866..0c662b0 100644
---- a/aclocal.m4
-+++ b/aclocal.m4
-@@ -40,7 +40,6 @@ dnl
- AC_DEFUN(AC_LBL_C_INIT_BEFORE_CC,
-     [AC_PREREQ(2.50)
-     AC_BEFORE([$0], [AC_LBL_C_INIT])
--    AC_BEFORE([$0], [AC_PROG_CC])
-     AC_BEFORE([$0], [AC_LBL_FIXINCLUDES])
-     AC_BEFORE([$0], [AC_LBL_DEVEL])
-     AC_ARG_WITH(gcc, [  --without-gcc           don't use gcc])
-diff --git a/configure.in b/configure.in
-index 11257c9..7f9591c 100644
---- a/configure.in
-+++ b/configure.in
-@@ -19,6 +19,7 @@ AC_REVISION($Revision: 1.204 $)
- AC_PREREQ(2.50)
- AC_INIT(tcpdump.c)
- 
-+AC_PROG_CC
- AC_CANONICAL_HOST
- 
- AC_LBL_C_INIT_BEFORE_CC(V_CCOPT, V_INCLS)
diff --git a/meta-oe/recipes-support/tcpdump/tcpdump-4.3.0/ipv6-cross.patch b/meta-oe/recipes-support/tcpdump/tcpdump-4.3.0/ipv6-cross.patch
deleted file mode 100644
index 7eba2c5..0000000
--- a/meta-oe/recipes-support/tcpdump/tcpdump-4.3.0/ipv6-cross.patch
+++ /dev/null
@@ -1,41 +0,0 @@
----
- configure.in |   12 ++++++++----
- 1 files changed, 8 insertions(+), 4 deletions(-)
-
-diff --git a/configure.in b/configure.in
-index eb3e5e8..11257c9 100644
---- a/configure.in
-+++ b/configure.in
-@@ -181,8 +181,9 @@ yes)   AC_MSG_RESULT(yes)
-        ipv6=no
-        ;;
-   esac ],
--
--  AC_TRY_RUN([ /* AF_INET6 available check */
-+[
-+  if test x"$cross_compiling" != "xyes"; then
-+    AC_TRY_RUN([ /* AF_INET6 avalable check */
- #include <sys/types.h>
- #include <sys/socket.h>
- main()
-@@ -201,7 +202,10 @@ main()
-   ipv6=no],
- [ AC_MSG_RESULT(no)
-   ipv6=no]
--))
-+  )
-+else
-+  AC_MSG_FAILURE([Unable to check for ipv6 when crosscompiling, please specify.])
-+fi])
- 
- ipv6type=unknown
- ipv6lib=none
-@@ -316,7 +320,7 @@ if test "$ipv6" = "yes" -a "$ipv6lib" != "none"; then
- fi
- 
- 
--if test "$ipv6" = "yes"; then
-+if test x"$cross_compiling" != "xyes" -a "$ipv6" = "yes"; then
- 	#
- 	# XXX - on Tru64 UNIX 5.1, there is no "getaddrinfo()"
- 	# function in libc; there are "ngetaddrinfo()" and
diff --git a/meta-oe/recipes-support/tcpdump/tcpdump-4.3.0/tcpdump_configure_no_-O2.patch b/meta-oe/recipes-support/tcpdump/tcpdump-4.3.0/tcpdump_configure_no_-O2.patch
deleted file mode 100644
index 7929da5..0000000
--- a/meta-oe/recipes-support/tcpdump/tcpdump-4.3.0/tcpdump_configure_no_-O2.patch
+++ /dev/null
@@ -1,42 +0,0 @@
----
- configure |    8 ++++----
- 1 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/configure b/configure
-index cb51d19..73d51af 100755
---- a/configure
-+++ b/configure
-@@ -2691,13 +2691,13 @@ if test "$ac_test_CFLAGS" = set; then
-   CFLAGS=$ac_save_CFLAGS
- elif test $ac_cv_prog_cc_g = yes; then
-   if test "$GCC" = yes; then
--    CFLAGS="-g -O2"
-+    CFLAGS="-g"
-   else
-     CFLAGS="-g"
-   fi
- else
-   if test "$GCC" = yes; then
--    CFLAGS="-O2"
-+    CFLAGS=""
-   else
-     CFLAGS=
-   fi
-@@ -2830,7 +2830,7 @@ ac_compiler_gnu=$ac_cv_c_compiler_gnu
-     if test "$GCC" = yes ; then
- 	    if test "$SHLICC2" = yes ; then
- 		    ac_cv_lbl_gcc_vers=2
--		    V_CCOPT="-O2"
-+		    V_CCOPT=""
- 	    else
- 		    { echo "$as_me:$LINENO: checking gcc version" >&5
- echo $ECHO_N "checking gcc version... $ECHO_C" >&6; }
-@@ -2847,7 +2847,7 @@ fi
- 		    { echo "$as_me:$LINENO: result: $ac_cv_lbl_gcc_vers" >&5
- echo "${ECHO_T}$ac_cv_lbl_gcc_vers" >&6; }
- 		    if test $ac_cv_lbl_gcc_vers -gt 1 ; then
--			    V_CCOPT="-O2"
-+			    V_CCOPT=""
- 		    fi
- 	    fi
-     else
diff --git a/meta-oe/recipes-support/tcpdump/tcpdump_4.3.0.bb b/meta-oe/recipes-support/tcpdump/tcpdump_4.3.0.bb
deleted file mode 100644
index 1da8194..0000000
--- a/meta-oe/recipes-support/tcpdump/tcpdump_4.3.0.bb
+++ /dev/null
@@ -1,43 +0,0 @@
-DESCRIPTION = "A sophisticated network protocol analyzer"
-HOMEPAGE = "http://www.tcpdump.org/"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1d4b0366557951c84a94fabe3529f867"
-SECTION = "console/network"
-DEPENDS = "libpcap"
-
-SRC_URI = " \
-    http://www.tcpdump.org/release/tcpdump-${PV}.tar.gz \
-    file://tcpdump_configure_no_-O2.patch \
-    file://0001-minimal-IEEE802.15.4-allowed.patch \
-    file://ipv6-cross.patch \
-    file://configure.patch \
-"
-SRC_URI[md5sum] = "a3fe4d30ac85ff5467c889ff46b7e1e8"
-SRC_URI[sha256sum] = "efd08b610210d39977ec3175fa82dad9fbd33587930081be2a905a712dba4286"
-
-inherit autotools
-CACHED_CONFIGUREVARS = "ac_cv_linux_vers=${ac_cv_linux_vers=2}"
-
-EXTRA_OECONF = "--without-crypto --disable-rpath \
-        ${@base_contains('DISTRO_FEATURES', 'ipv6', '--enable-ipv6', '--disable-ipv6', d)}"
-
-EXTRA_AUTORECONF += " -I m4"
-
-do_configure_prepend() {
-    mkdir -p ${S}/m4
-    if [ -f aclocal.m4 ]; then
-        mv aclocal.m4 ${S}/m4
-    fi
-    # AC_CHECK_LIB(dlpi.. was looking to host /lib
-    sed -i 's:-L/lib::g' ./configure.in
-}
-do_configure_append() {
-    sed -i 's:-L/usr/lib::' ./Makefile
-    sed -i 's:-Wl,-rpath,${STAGING_LIBDIR}::' ./Makefile
-    sed -i 's:-I/usr/include::' ./Makefile
-}
-
-do_install_append() {
-    # tcpdump 4.0.0 installs a copy to /usr/sbin/tcpdump.4.0.0
-    rm -f ${D}${sbindir}/tcpdump.${PV}
-}
-- 
1.7.9.7



