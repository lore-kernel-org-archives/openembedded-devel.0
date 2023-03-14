Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DB32C74A4B
	for <webhook@archiver.kernel.org>; Tue, 14 Mar 2023 16:15:12 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.1125.1678810505468718731
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Mar 2023 09:15:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=UG1O1IS+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2437f4244a=joe.slater@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32E8GZsT003041
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Mar 2023 16:15:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=uS+zuS9oNjdSIekNT+uVNHpMTl0F+bCZlJxjo07GpaY=;
 b=UG1O1IS+Ex2daCweLgb10L3iPGOoJRZ0H2DjdjR7YvmJh/xUOSMAS1fH9X89S6/ep9At
 gIoC0FBSnUGUF8+HBXW+3v82dujsIBQCKjaed5iG0rLOM3KPrzUxk5rFh6ie2XFkCe87
 zRAjqRZ4/nV1jsa/6/2QOvu9oFVRZR+0jcQ6QJLK6bU3RSzokcM2CIySMXgyaPSCbI49
 Bv77XykS9vUOJlR/qBhZoZTvodK7e+gLmTz2teTI7/vLpiaC62MYuPWQx5lFE3jveOHi
 qatnZdxSD9V7efBiklRglLakIGNsrWTdWDS224iKgObRwick5UNjNsl+0WkFv//v/fPq QQ== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3p8gma31nd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Mar 2023 16:15:04 +0000
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Tue, 14 Mar 2023 09:15:03 -0700
Received: from ala-jslater-lx1.corp.ad.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.18 via Frontend Transport; Tue, 14 Mar 2023 09:15:03 -0700
From: Joe Slater <joe.slater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [meta-oe][PATCH 1/1] libreport: update to version 2.17.8
Date: Tue, 14 Mar 2023 09:15:02 -0700
Message-ID: <20230314161503.2900370-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: jSGOTcS6kX2rDOaGCZU27FJs7FXgaG5Y
X-Proofpoint-ORIG-GUID: jSGOTcS6kX2rDOaGCZU27FJs7FXgaG5Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-14_09,2023-03-14_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 bulkscore=0 mlxscore=0 priorityscore=1501 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303140134
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Mar 2023 16:15:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101521

Modify patches to apply and remove unrecognized configure
option --without-python2.  Retain --with-python3 even
though it is the default.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 ...01-Makefile.am-remove-doc-and-apidoc.patch | 16 ++++++-----
 ...move-prog-test-of-xmlto-and-asciidoc.patch | 16 ++++++-----
 .../files/0003-without-build-plugins.patch    | 14 ++++++----
 ...gure.ac-remove-prog-test-of-augparse.patch | 27 +++++++++++--------
 .../libreport/libreport_2.17.8.bb             |  2 +-
 5 files changed, 46 insertions(+), 29 deletions(-)

diff --git a/meta-oe/recipes-extended/libreport/files/0001-Makefile.am-remove-doc-and-apidoc.patch b/meta-oe/recipes-extended/libreport/files/0001-Makefile.am-remove-doc-and-apidoc.patch
index 1ee0dd2f5..934dd1778 100644
--- a/meta-oe/recipes-extended/libreport/files/0001-Makefile.am-remove-doc-and-apidoc.patch
+++ b/meta-oe/recipes-extended/libreport/files/0001-Makefile.am-remove-doc-and-apidoc.patch
@@ -1,28 +1,32 @@
-From 1f7d106c7d982fe055addc8d883b161202233175 Mon Sep 17 00:00:00 2001
+From 73dc0c2cd942e30f5f7cb40cb5828895b96f0fb1 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Wed, 26 Apr 2017 03:47:58 -0400
-Subject: [PATCH 1/4] Makefile.am: remove doc and apidoc
+Subject: [PATCH] Makefile.am: remove doc and apidoc
 
 There was a failure at do_install time, so remove doc to workaround.
 
 Upstream-Status: Inappropriate [workaround]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
+Context modified to apply to v2.17.8.
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
 ---
  Makefile.am | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index 9ad827c..34364a8 100644
+index 4ff2f5c5..d4e30bc2 100644
 --- a/Makefile.am
 +++ b/Makefile.am
 @@ -1,5 +1,5 @@
  ACLOCAL_AMFLAGS = -I m4
--SUBDIRS = po src tests doc apidoc
-+SUBDIRS = po src tests
+-SUBDIRS = data po src tests doc apidoc
++SUBDIRS = data po src tests
  
  EXTRA_DIST = \
      libreport.pc.in \
 -- 
-2.7.4
+2.25.1
 
diff --git a/meta-oe/recipes-extended/libreport/files/0002-configure.ac-remove-prog-test-of-xmlto-and-asciidoc.patch b/meta-oe/recipes-extended/libreport/files/0002-configure.ac-remove-prog-test-of-xmlto-and-asciidoc.patch
index 2e691e95f..4fdf69c73 100644
--- a/meta-oe/recipes-extended/libreport/files/0002-configure.ac-remove-prog-test-of-xmlto-and-asciidoc.patch
+++ b/meta-oe/recipes-extended/libreport/files/0002-configure.ac-remove-prog-test-of-xmlto-and-asciidoc.patch
@@ -1,7 +1,7 @@
-From 9beadcdfca9198548f06bf18f3f26e1d11542e53 Mon Sep 17 00:00:00 2001
+From 276c45d0663124c9ccab0ddc8b97fb5cdc8b3867 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 31 Jul 2018 16:53:04 +0800
-Subject: [PATCH 2/4] configure.ac: remove prog test of xmlto and asciidoc
+Subject: [PATCH] configure.ac: remove prog test of xmlto and asciidoc
 
 The prog of xmlto and asciidoc were used to generate documents,
 and since the doc module has already been disabled, so we should
@@ -10,15 +10,19 @@ remove the prog test.
 Upstream-Status: Inappropriate [workaround]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
+Modify to apply to v 2.17.8.
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
 ---
  configure.ac | 18 ------------------
  1 file changed, 18 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index feafc28..aceccf4 100644
+index da8cf898..17ece200 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -56,24 +56,6 @@ IT_PROG_INTLTOOL([0.35.0])
+@@ -57,24 +57,6 @@ IT_PROG_INTLTOOL([0.35.0])
  
  dnl ****** END ****************************************
  
@@ -42,7 +46,7 @@ index feafc28..aceccf4 100644
 -
  AC_ARG_WITH(bugzilla,
  AS_HELP_STRING([--with-bugzilla],[use Bugzilla plugin (default is YES)]),
- LIBREPORT_PARSE_WITH([bugzilla]))
+ LIBREPORT_PARSE_WITH([bugzilla]),
 -- 
-2.7.4
+2.25.1
 
diff --git a/meta-oe/recipes-extended/libreport/files/0003-without-build-plugins.patch b/meta-oe/recipes-extended/libreport/files/0003-without-build-plugins.patch
index c331677d8..f6ff86040 100644
--- a/meta-oe/recipes-extended/libreport/files/0003-without-build-plugins.patch
+++ b/meta-oe/recipes-extended/libreport/files/0003-without-build-plugins.patch
@@ -1,26 +1,30 @@
-From 41bce1de2fd2a0f79c266f245ae3e3720ccaf46a Mon Sep 17 00:00:00 2001
+From f46610901dbac56d9631df012374c600db08453e Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Wed, 26 Apr 2017 03:51:03 -0400
-Subject: [PATCH 3/4] without build plugins
+Subject: [PATCH] without build plugins
 
 Upstream-Status: Inappropriate [workaround]
 
 Rebase to 2.9.1
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
+Modify to apply to v2.17.8.
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
 ---
  src/Makefile.am | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/Makefile.am b/src/Makefile.am
-index c15928c..bac02b1 100644
+index 410bfcb0..bac02b16 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
 @@ -8,4 +8,4 @@ if BUILD_NEWT
  sub_dirs += report-newt
  endif
  
--SUBDIRS = include lib plugins report-python cli client-python workflows $(sub_dirs)
+-SUBDIRS = include lib report-python cli client-python plugins workflows $(sub_dirs)
 +SUBDIRS = include lib report-python cli client-python workflows $(sub_dirs)
 -- 
-2.7.4
+2.25.1
 
diff --git a/meta-oe/recipes-extended/libreport/files/0004-configure.ac-remove-prog-test-of-augparse.patch b/meta-oe/recipes-extended/libreport/files/0004-configure.ac-remove-prog-test-of-augparse.patch
index 986e7ec41..998ae6b50 100644
--- a/meta-oe/recipes-extended/libreport/files/0004-configure.ac-remove-prog-test-of-augparse.patch
+++ b/meta-oe/recipes-extended/libreport/files/0004-configure.ac-remove-prog-test-of-augparse.patch
@@ -1,25 +1,29 @@
-From c1c301502a8f69b9889197744b301a136082f09d Mon Sep 17 00:00:00 2001
+From 62c922f43b54585d25ba89be36c10612b479270b Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Thu, 27 Apr 2017 02:15:02 -0400
-Subject: [PATCH 4/4] configure.ac: remove prog test of augparse
+Subject: [PATCH] configure.ac: remove prog test of augparse
 
 The build time does not require it.
 
 Upstream-Status: Inappropriate [workaround]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
+Modify to apply to v2.17.8.
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
 ---
- configure.ac | 8 --------
- 1 file changed, 8 deletions(-)
+ configure.ac | 9 ---------
+ 1 file changed, 9 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index aceccf4..83c101b 100644
+index 17ece200..89b463a4 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -350,14 +350,6 @@ AC_ARG_WITH(augeaslenslibdir,
-                            [Directory for librepor lens (default: /usr/share/augeas/lenses)])],
-             [], [with_augeaslenslibdir="/usr/share/augeas/lenses"])
- AC_SUBST([AUGEAS_LENS_LIB_DIR], [$with_augeaslenslibdir])
+@@ -287,15 +287,6 @@ AC_ARG_WITH(largedatatmpdir,
+             [], [with_largedatatmpdir="/var/tmp"])
+ AC_SUBST([LARGE_DATA_TMP_DIR], [$with_largedatatmpdir])
+ 
 -AC_PATH_PROG(AUGPARSE, augparse, no)
 -[if test "$AUGPARSE" = "no"]
 -[then]
@@ -28,9 +32,10 @@ index aceccf4..83c101b 100644
 -    [echo "Then run configure again before attempting to build libreport."]
 -    [exit 1]
 -[fi]
- 
+-
  AC_ARG_WITH([defaultdumpdirmode],
              AS_HELP_STRING([--with-defaultdumpdirmode=OCTAL-MODE],
+                            [Default dump dir mode (default: 0x1A0 (0640))]),
 -- 
-2.7.4
+2.25.1
 
diff --git a/meta-oe/recipes-extended/libreport/libreport_2.17.8.bb b/meta-oe/recipes-extended/libreport/libreport_2.17.8.bb
index e21161943..a8d1db65b 100644
--- a/meta-oe/recipes-extended/libreport/libreport_2.17.8.bb
+++ b/meta-oe/recipes-extended/libreport/libreport_2.17.8.bb
@@ -33,7 +33,7 @@ inherit gettext autotools python3native python3targetconfig pkgconfig
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES','x11','gtk','',d)}"
 PACKAGECONFIG[gtk] = "--with-gtk, --without-gtk, gtk+3,"
 
-EXTRA_OECONF += "--without-python2 --with-python3"
+EXTRA_OECONF += "--with-python3"
 
 RDEPENDS:python3-libreport += "${PN}"
 
-- 
2.25.1


