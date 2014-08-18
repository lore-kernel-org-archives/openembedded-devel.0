Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 08EE7601A8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Aug 2014 01:24:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7I1O9rr024380
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Aug 2014 18:24:10 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Sun, 17 Aug 2014 18:24:09 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 18 Aug 2014 09:24:14 +0800
Message-ID: <1408325054-27702-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH][meta-networking][v2] tcpdump: uprev it to 4.6.1
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
X-List-Received-Date: Mon, 18 Aug 2014 01:24:16 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

1. uprev to 4.6.1
2. remove three obsolete patches
3. use PACKAGECONFIG, and the default value is ipv6 openssl

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../0001-minimal-IEEE802.15.4-allowed.patch        |   22 -----------
 .../tcpdump/tcpdump-4.5.1/ipv6-cross.patch         |   41 --------------------
 .../tcpdump-4.5.1/tcpdump_configure_no_-O2.patch   |   27 -------------
 .../configure.patch                                |    0
 .../tcpdump-configure-dlpi.patch                   |    0
 .../tcpdump-cross-getaddrinfo.patch                |    0
 .../unnecessary-to-check-libpcap.patch             |    0
 .../tcpdump/{tcpdump_4.5.1.bb => tcpdump_4.6.1.bb} |   14 +++----
 8 files changed, 6 insertions(+), 98 deletions(-)
 delete mode 100644 meta-networking/recipes-support/tcpdump/tcpdump-4.5.1/0001-minimal-IEEE802.15.4-allowed.patch
 delete mode 100644 meta-networking/recipes-support/tcpdump/tcpdump-4.5.1/ipv6-cross.patch
 delete mode 100644 meta-networking/recipes-support/tcpdump/tcpdump-4.5.1/tcpdump_configure_no_-O2.patch
 rename meta-networking/recipes-support/tcpdump/{tcpdump-4.5.1 => tcpdump-4.6.1}/configure.patch (100%)
 rename meta-networking/recipes-support/tcpdump/{tcpdump-4.5.1 => tcpdump-4.6.1}/tcpdump-configure-dlpi.patch (100%)
 rename meta-networking/recipes-support/tcpdump/{tcpdump-4.5.1 => tcpdump-4.6.1}/tcpdump-cross-getaddrinfo.patch (100%)
 rename meta-networking/recipes-support/tcpdump/{tcpdump-4.5.1 => tcpdump-4.6.1}/unnecessary-to-check-libpcap.patch (100%)
 rename meta-networking/recipes-support/tcpdump/{tcpdump_4.5.1.bb => tcpdump_4.6.1.bb} (69%)

diff --git a/meta-networking/recipes-support/tcpdump/tcpdump-4.5.1/0001-minimal-IEEE802.15.4-allowed.patch b/meta-networking/recipes-support/tcpdump/tcpdump-4.5.1/0001-minimal-IEEE802.15.4-allowed.patch
deleted file mode 100644
index 9d3d60d..0000000
--- a/meta-networking/recipes-support/tcpdump/tcpdump-4.5.1/0001-minimal-IEEE802.15.4-allowed.patch
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
diff --git a/meta-networking/recipes-support/tcpdump/tcpdump-4.5.1/ipv6-cross.patch b/meta-networking/recipes-support/tcpdump/tcpdump-4.5.1/ipv6-cross.patch
deleted file mode 100644
index 7eba2c5..0000000
--- a/meta-networking/recipes-support/tcpdump/tcpdump-4.5.1/ipv6-cross.patch
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
diff --git a/meta-networking/recipes-support/tcpdump/tcpdump-4.5.1/tcpdump_configure_no_-O2.patch b/meta-networking/recipes-support/tcpdump/tcpdump-4.5.1/tcpdump_configure_no_-O2.patch
deleted file mode 100644
index b2296bc..0000000
--- a/meta-networking/recipes-support/tcpdump/tcpdump-4.5.1/tcpdump_configure_no_-O2.patch
+++ /dev/null
@@ -1,27 +0,0 @@
----
- configure |    4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure b/configure
-index 468a517..a890728 100755
---- a/configure
-+++ b/configure
-@@ -3036,13 +3036,13 @@ if test "$ac_test_CFLAGS" = set; then
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
-+    CFLAGS=
-   else
-     CFLAGS=
-   fi
--- 
-1.7.9.5
-
diff --git a/meta-networking/recipes-support/tcpdump/tcpdump-4.5.1/configure.patch b/meta-networking/recipes-support/tcpdump/tcpdump-4.6.1/configure.patch
similarity index 100%
rename from meta-networking/recipes-support/tcpdump/tcpdump-4.5.1/configure.patch
rename to meta-networking/recipes-support/tcpdump/tcpdump-4.6.1/configure.patch
diff --git a/meta-networking/recipes-support/tcpdump/tcpdump-4.5.1/tcpdump-configure-dlpi.patch b/meta-networking/recipes-support/tcpdump/tcpdump-4.6.1/tcpdump-configure-dlpi.patch
similarity index 100%
rename from meta-networking/recipes-support/tcpdump/tcpdump-4.5.1/tcpdump-configure-dlpi.patch
rename to meta-networking/recipes-support/tcpdump/tcpdump-4.6.1/tcpdump-configure-dlpi.patch
diff --git a/meta-networking/recipes-support/tcpdump/tcpdump-4.5.1/tcpdump-cross-getaddrinfo.patch b/meta-networking/recipes-support/tcpdump/tcpdump-4.6.1/tcpdump-cross-getaddrinfo.patch
similarity index 100%
rename from meta-networking/recipes-support/tcpdump/tcpdump-4.5.1/tcpdump-cross-getaddrinfo.patch
rename to meta-networking/recipes-support/tcpdump/tcpdump-4.6.1/tcpdump-cross-getaddrinfo.patch
diff --git a/meta-networking/recipes-support/tcpdump/tcpdump-4.5.1/unnecessary-to-check-libpcap.patch b/meta-networking/recipes-support/tcpdump/tcpdump-4.6.1/unnecessary-to-check-libpcap.patch
similarity index 100%
rename from meta-networking/recipes-support/tcpdump/tcpdump-4.5.1/unnecessary-to-check-libpcap.patch
rename to meta-networking/recipes-support/tcpdump/tcpdump-4.6.1/unnecessary-to-check-libpcap.patch
diff --git a/meta-networking/recipes-support/tcpdump/tcpdump_4.5.1.bb b/meta-networking/recipes-support/tcpdump/tcpdump_4.6.1.bb
similarity index 69%
rename from meta-networking/recipes-support/tcpdump/tcpdump_4.5.1.bb
rename to meta-networking/recipes-support/tcpdump/tcpdump_4.6.1.bb
index 9ce02d6..58bcb98 100644
--- a/meta-networking/recipes-support/tcpdump/tcpdump_4.5.1.bb
+++ b/meta-networking/recipes-support/tcpdump/tcpdump_4.6.1.bb
@@ -6,24 +6,22 @@ SECTION = "console/network"
 DEPENDS = "libpcap"
 
 SRC_URI = " \
-    http://www.tcpdump.org/release/tcpdump-${PV}.tar.gz \
-    file://tcpdump_configure_no_-O2.patch \
-    file://0001-minimal-IEEE802.15.4-allowed.patch \
-    file://ipv6-cross.patch \
+    http://www.tcpdump.org/release/${BP}.tar.gz \
     file://configure.patch \
     file://unnecessary-to-check-libpcap.patch \
     file://tcpdump-configure-dlpi.patch \
     file://tcpdump-cross-getaddrinfo.patch \
 "
-SRC_URI[md5sum] = "973a2513d0076e34aa9da7e15ed98e1b"
-SRC_URI[sha256sum] = "14ab39657128f3a650aed4cf455f76c7590601087b6101c253d698f6e73f0b96"
+SRC_URI[md5sum] = "dab267ec30216a069747d10314079ec7"
+SRC_URI[sha256sum] = "4c88c2a9aeb4047074f344fc9b2b6577b219972d359e192f6d12ccf983a13fd7"
 export LIBS=" -lpcap"
 
 inherit autotools-brokensep
 CACHED_CONFIGUREVARS = "ac_cv_linux_vers=${ac_cv_linux_vers=2}"
 
-EXTRA_OECONF = "--without-crypto \
-        ${@base_contains('DISTRO_FEATURES', 'ipv6', '--enable-ipv6', '--disable-ipv6', d)}"
+PACKAGECONFIG ??= "openssl ipv6"
+PACKAGECONFIG[openssl] = "--with-crypto=yes, --without-openssl --without-crypto, openssl"
+PACKAGECONFIG[ipv6] = "--enable-ipv6, --disable-ipv6,"
 
 EXTRA_AUTORECONF += " -I m4"
 
-- 
1.7.10.4


