Return-Path: <B40527@freescale.com>
Received: from co9outboundpool.messaging.microsoft.com
	(co9ehsobe002.messaging.microsoft.com [207.46.163.25])
	by mail.openembedded.org (Postfix) with ESMTP id 24F956D092
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2013 07:06:13 +0000 (UTC)
Received: from mail189-co9-R.bigfish.com (10.236.132.245) by
	CO9EHSOBE028.bigfish.com (10.236.130.91) with Microsoft SMTP Server id
	14.1.225.22; Thu, 31 Oct 2013 07:06:14 +0000
Received: from mail189-co9 (localhost [127.0.0.1])	by
	mail189-co9-R.bigfish.com (Postfix) with ESMTP id 952D852019A	for
	<openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2013 07:06:14 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h208ch1ee6h1de0h1fdah2073h1202h1e76h1d1ah1d2ah1fc6hzz8275ch1de098h17326ah8275bh1de097h186068hz2dh2a8h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh2222h1fb3h1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1fe8h1ff5h2218h2216h1155h)
Received: from mail189-co9 (localhost.localdomain [127.0.0.1]) by mail189-co9
	(MessageSwitch) id 138320317377494_19799;
	Thu, 31 Oct 2013 07:06:13 +0000 (UTC)
Received: from CO9EHSMHS004.bigfish.com (unknown [10.236.132.247])	by
	mail189-co9.bigfish.com (Postfix) with ESMTP id 0F52550005D	for
	<openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2013 07:06:13 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO9EHSMHS004.bigfish.com
	(10.236.130.14) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Thu, 31 Oct 2013 07:06:13 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-005.039d.mgd.msft.net (10.84.1.17) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Thu, 31 Oct 2013 07:06:12 +0000
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id
	r9V76BlJ002759; Thu, 31 Oct 2013 00:06:11 -0700
From: <b40527@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 31 Oct 2013 02:06:06 -0500
Message-ID: <1383203166-32615-1-git-send-email-b40527@freescale.com>
X-Mailer: git-send-email 1.7.9.7
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Cc: Zongchun Yu <Zongchun.Yu@freescale.com>, b44149@freescale.com
Subject: [meta-oe][PATCH] tcpreplay:add recipe
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
X-List-Received-Date: Thu, 31 Oct 2013 07:06:13 -0000
Content-Type: text/plain

From: Zongchun Yu <Zongchun.Yu@freescale.com>

*tcpreplay - a suite of BSD GPLv3 licensed tools for UNIX operating
 systems which gives you the ability to use previously captured traffic
 in  libpcap format to test a variety of network devices.

Signed-off-by: Zongchun Yu <Zongchun.Yu@freescale.com>
---
 .../files/tcpreplay-3.4.4-cross-compile.patch      |   90 ++++++++++++++++++++
 .../files/tcpreplay-3.4.4-no-bfp-support.patch     |   13 +++
 .../recipes-support/tcpreplay/tcpreplay_3.4.4.bb   |   23 +++++
 3 files changed, 126 insertions(+)
 create mode 100755 meta-oe/recipes-support/tcpreplay/files/tcpreplay-3.4.4-cross-compile.patch
 create mode 100644 meta-oe/recipes-support/tcpreplay/files/tcpreplay-3.4.4-no-bfp-support.patch
 create mode 100644 meta-oe/recipes-support/tcpreplay/tcpreplay_3.4.4.bb

diff --git a/meta-oe/recipes-support/tcpreplay/files/tcpreplay-3.4.4-cross-compile.patch b/meta-oe/recipes-support/tcpreplay/files/tcpreplay-3.4.4-cross-compile.patch
new file mode 100755
index 0000000..226f97a
--- /dev/null
+++ b/meta-oe/recipes-support/tcpreplay/files/tcpreplay-3.4.4-cross-compile.patch
@@ -0,0 +1,90 @@
+Uptream-Status: Inappropriate [embedded specific]
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
diff --git a/meta-oe/recipes-support/tcpreplay/files/tcpreplay-3.4.4-no-bfp-support.patch b/meta-oe/recipes-support/tcpreplay/files/tcpreplay-3.4.4-no-bfp-support.patch
new file mode 100644
index 0000000..70fa959
--- /dev/null
+++ b/meta-oe/recipes-support/tcpreplay/files/tcpreplay-3.4.4-no-bfp-support.patch
@@ -0,0 +1,13 @@
+Uptream-Status: Inappropriate [embedded specific]
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
diff --git a/meta-oe/recipes-support/tcpreplay/tcpreplay_3.4.4.bb b/meta-oe/recipes-support/tcpreplay/tcpreplay_3.4.4.bb
new file mode 100644
index 0000000..16b2f08
--- /dev/null
+++ b/meta-oe/recipes-support/tcpreplay/tcpreplay_3.4.4.bb
@@ -0,0 +1,23 @@
+SUMMARY = "Use previously captured traffic to test network devices"
+
+HOMEPAGE = "http://tcpreplay.synfin.net/"
+SECTION = "console/network"
+
+LICENSE = "Proprietary"
+LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=c33cccf72cc1603e8a72a84811ae3ac8"
+
+PR = "r0"
+
+SRC_URI = "http://prdownloads.sourceforge.net/tcpreplay/${PV}/tcpreplay-${PV}.tar.gz \
+           file://tcpreplay-3.4.4-cross-compile.patch \
+           file://tcpreplay-3.4.4-no-bfp-support.patch \
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
-- 
1.7.9.7



