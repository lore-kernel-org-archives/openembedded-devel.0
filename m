Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 32BD3617B8
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Sep 2014 06:15:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s816FdeP022006
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 31 Aug 2014 23:15:39 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Sun, 31 Aug 2014 23:15:38 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 1 Sep 2014 14:15:47 +0800
Message-ID: <1409552147-23457-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH][meta-networking] inetutils: uprev to 1.9.2
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
X-List-Received-Date: Mon, 01 Sep 2014 06:15:43 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

1. remove unneeded patches:
 inetutils-1.9.1/disable-pre-ANSI-compilers.patch
 inetutils-1.9.1/remove-gets.patch
2. Update the version from 1.9.1 to 1.9.2 in version.patch
3. remove PR

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../disable-pre-ANSI-compilers.patch               |   16 ---------------
 .../inetutils/inetutils-1.9.1/remove-gets.patch    |   21 --------------------
 .../fix-disable-ipv6.patch                         |    0
 ...tf-parse-pull-in-features.h-for-__GLIBC__.patch |    0
 .../inetutils-1.8-0003-wchar.patch                 |    0
 .../inetutils-1.9-PATH_PROCNET_DEV.patch           |    0
 .../rexec.xinetd.inetutils                         |    0
 .../rlogin.xinetd.inetutils                        |    0
 .../rsh.xinetd.inetutils                           |    0
 .../telnet.xinetd.inetutils                        |    0
 .../tftpd.xinetd.inetutils                         |    0
 .../version.patch                                  |    2 +-
 .../{inetutils_1.9.1.bb => inetutils_1.9.2.bb}     |    7 ++-----
 13 files changed, 3 insertions(+), 43 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/disable-pre-ANSI-compilers.patch
 delete mode 100644 meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/remove-gets.patch
 rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9.1 => inetutils-1.9.2}/fix-disable-ipv6.patch (100%)
 rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9.1 => inetutils-1.9.2}/inetutils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch (100%)
 rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9.1 => inetutils-1.9.2}/inetutils-1.8-0003-wchar.patch (100%)
 rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9.1 => inetutils-1.9.2}/inetutils-1.9-PATH_PROCNET_DEV.patch (100%)
 rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9.1 => inetutils-1.9.2}/rexec.xinetd.inetutils (100%)
 rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9.1 => inetutils-1.9.2}/rlogin.xinetd.inetutils (100%)
 rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9.1 => inetutils-1.9.2}/rsh.xinetd.inetutils (100%)
 rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9.1 => inetutils-1.9.2}/telnet.xinetd.inetutils (100%)
 rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9.1 => inetutils-1.9.2}/tftpd.xinetd.inetutils (100%)
 rename meta-networking/recipes-connectivity/inetutils/{inetutils-1.9.1 => inetutils-1.9.2}/version.patch (93%)
 rename meta-networking/recipes-connectivity/inetutils/{inetutils_1.9.1.bb => inetutils_1.9.2.bb} (96%)

diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/disable-pre-ANSI-compilers.patch b/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/disable-pre-ANSI-compilers.patch
deleted file mode 100644
index a7fa61c..0000000
--- a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/disable-pre-ANSI-compilers.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Upstream-Status: Pending
-
-disable pre-ANSI compilers
-
-Signed-off-by: Chunrong Guo <b40290@freescale.com>
---- inetutils-1.9.1/configure.ac	2012-01-06 22:05:05.000000000 +0800
-+++ inetutils-1.9.1/configure.ac	2012-11-12 14:05:30.756957063 +0800
-@@ -586,7 +586,7 @@
- 		  #include <arpa/tftp.h>])
- 
- ### Checks for compiler characteristics.
--AM_C_PROTOTYPES dnl FIXME: Does inetutils even compile on pre-ANSI compilers?
-+#AM_C_PROTOTYPES dnl FIXME: Does inetutils even compile on pre-ANSI compilers?
- AC_C_CONST
- 
- dnl See if `weak refs' are possible; these make it possible (with shared
diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/remove-gets.patch b/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/remove-gets.patch
deleted file mode 100644
index 61d16e3..0000000
--- a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/remove-gets.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Uptream-Status: Pending
-
-remove gets function
-
-Signed-off-by: Chunrong Guo <b40290@freescale.com>
---- inetutils-1.9.1.org/lib/stdio.in.h	2012-01-06 22:11:13.000000000 +0800
-+++ inetutils-1.9.1/lib/stdio.in.h	2012-11-12 14:30:49.044958001 +0800
-@@ -715,9 +715,13 @@
- /* It is very rare that the developer ever has full control of stdin,
-    so any use of gets warrants an unconditional warning.  Assume it is
-    always declared, since it is required by C89.  */
-+#if defined gets
-+#undef gets
- _GL_WARN_ON_USE (gets, "gets is a security hole - use fgets instead");
- #endif
- 
-+#endif
-+
- 
- #if @GNULIB_OBSTACK_PRINTF@ || @GNULIB_OBSTACK_PRINTF_POSIX@
- struct obstack;
diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/fix-disable-ipv6.patch b/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/fix-disable-ipv6.patch
similarity index 100%
rename from meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/fix-disable-ipv6.patch
rename to meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/fix-disable-ipv6.patch
diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/inetutils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch b/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/inetutils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch
similarity index 100%
rename from meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/inetutils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch
rename to meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/inetutils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch
diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/inetutils-1.8-0003-wchar.patch b/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/inetutils-1.8-0003-wchar.patch
similarity index 100%
rename from meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/inetutils-1.8-0003-wchar.patch
rename to meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/inetutils-1.8-0003-wchar.patch
diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/inetutils-1.9-PATH_PROCNET_DEV.patch b/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/inetutils-1.9-PATH_PROCNET_DEV.patch
similarity index 100%
rename from meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/inetutils-1.9-PATH_PROCNET_DEV.patch
rename to meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/inetutils-1.9-PATH_PROCNET_DEV.patch
diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/rexec.xinetd.inetutils b/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/rexec.xinetd.inetutils
similarity index 100%
rename from meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/rexec.xinetd.inetutils
rename to meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/rexec.xinetd.inetutils
diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/rlogin.xinetd.inetutils b/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/rlogin.xinetd.inetutils
similarity index 100%
rename from meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/rlogin.xinetd.inetutils
rename to meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/rlogin.xinetd.inetutils
diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/rsh.xinetd.inetutils b/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/rsh.xinetd.inetutils
similarity index 100%
rename from meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/rsh.xinetd.inetutils
rename to meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/rsh.xinetd.inetutils
diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/telnet.xinetd.inetutils b/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/telnet.xinetd.inetutils
similarity index 100%
rename from meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/telnet.xinetd.inetutils
rename to meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/telnet.xinetd.inetutils
diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/tftpd.xinetd.inetutils b/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/tftpd.xinetd.inetutils
similarity index 100%
rename from meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/tftpd.xinetd.inetutils
rename to meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/tftpd.xinetd.inetutils
diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/version.patch b/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/version.patch
similarity index 93%
rename from meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/version.patch
rename to meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/version.patch
index ac3181d..1caa2d3 100644
--- a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/version.patch
+++ b/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/version.patch
@@ -11,7 +11,7 @@ Signed-off-by: Chunrong Guo <b40290@freescale.com>
  
 -AC_INIT([GNU inetutils],
 - m4_esyscmd([build-aux/git-version-gen .tarball-version 's/inetutils-/v/;s/_/./g']),
-+AC_INIT([GNU inetutils],[1.9.1],
++AC_INIT([GNU inetutils],[1.9.2],
   [bug-inetutils@gnu.org])
  
  AC_CONFIG_SRCDIR([src/inetd.c])
diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.2.bb
similarity index 96%
rename from meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb
rename to meta-networking/recipes-connectivity/inetutils/inetutils_1.9.2.bb
index 315e374..2bae3ee 100644
--- a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb
+++ b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.2.bb
@@ -8,11 +8,8 @@ LICENSE = "GPLv3"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=0c7051aef9219dc7237f206c5c4179a7"
 
-PR = "r1"
 SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.gz \
-           file://disable-pre-ANSI-compilers.patch \
            file://version.patch \
-           file://remove-gets.patch \
            file://inetutils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch \
            file://inetutils-1.8-0003-wchar.patch \
            file://rexec.xinetd.inetutils  \
@@ -23,8 +20,8 @@ SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.gz \
            file://inetutils-1.9-PATH_PROCNET_DEV.patch \
 "
 
-SRC_URI[md5sum] = "944f7196a2b3dba2d400e9088576000c"
-SRC_URI[sha256sum] = "02a9ebde8a198cb85f87545b9d88fb103a183958139864a85fe9e027ad79ff2b"
+SRC_URI[md5sum] = "aa1a9a132259db83e66c1f3265065ba2"
+SRC_URI[sha256sum] = "0423ea40a160cd4630f817e247df5c08ecc625378d2bb56a0509117a36a89913"
 
 inherit autotools gettext update-alternatives
 
-- 
1.7.10.4


