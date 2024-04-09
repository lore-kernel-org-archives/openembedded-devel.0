Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFFCFCD128A
	for <webhook@archiver.kernel.org>; Tue,  9 Apr 2024 20:25:33 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.149406.1712694333007854174
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Apr 2024 13:25:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=hbTFzldb;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=482968419c=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4394dGxU000614
	for <openembedded-devel@lists.openembedded.org>; Tue, 9 Apr 2024 13:25:32 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=m3FihUx91G5IDwh/7FBHPEoeCnu0DstKndIt9AZY43U=; b=
	hbTFzldbbV/LFFFqou8CuJcYy87bDaS4NPFCYRmGLC7S0yUnN3W9S/bhNeOk+Scx
	h5A5shMWJSc4CKis2LvQK0nseMRu5LVnE8k5Kw+esnERAsTQ76Ps8Hb5E28hOzfC
	xQAZpyjrQcuL79FMBV2Hed7LrXfse5K45Fd1iy6Fr4p7BHzG7fcak1QtxvXkIP0I
	JuI6zGIWPa1ysfrUYXT3U5aPIUDyoB2IXRLPqArpck9UI9M1ZyDOQMfHW245PLU/
	EImt+TUf1QKRAcCuCmwyBntvruILsgMN4920C0AKnTg/XaAKzflREbMG3hl6Wc1D
	eXLaFoKlPwneISZNa9ydUw==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xb5wgjtp7-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 09 Apr 2024 13:25:32 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Tue, 9 Apr 2024 13:25:31 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.37 via Frontend Transport; Tue, 9 Apr 2024 13:25:31 -0700
From: <Randy.MacLeod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH 1/5] ncftp: Upgrade to 3.2.7
Date: Tue, 9 Apr 2024 13:25:27 -0700
Message-ID: <20240409202531.1050101-2-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240409202531.1050101-1-Randy.MacLeod@windriver.com>
References: <20240409202531.1050101-1-Randy.MacLeod@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: Qap2wkFQ__hk7XLc0BnwcFP-aaWF91A8
X-Proofpoint-ORIG-GUID: Qap2wkFQ__hk7XLc0BnwcFP-aaWF91A8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-09_12,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 clxscore=1011 mlxscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404090137
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Apr 2024 20:25:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109881

From: Randy MacLeod <Randy.MacLeod@windriver.com>

Switch the SRC_URI from "ftp:" to "https:". Drop the obsolete SRC_URI[md5sum].
Drop ncftp-3.2.5-gcc10.patch since we're using gcc13 and upstream has fixed the build
to work by adding an extern to sh_util/gpshare.c for example.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../ncftp/ncftp/ncftp-3.2.5-gcc10.patch       | 83 -------------------
 .../ncftp/{ncftp_3.2.6.bb => ncftp_3.2.7.bb}  |  6 +-
 2 files changed, 2 insertions(+), 87 deletions(-)
 delete mode 100644 meta-networking/recipes-daemons/ncftp/ncftp/ncftp-3.2.5-gcc10.patch
 rename meta-networking/recipes-daemons/ncftp/{ncftp_3.2.6.bb => ncftp_3.2.7.bb} (79%)

diff --git a/meta-networking/recipes-daemons/ncftp/ncftp/ncftp-3.2.5-gcc10.patch b/meta-networking/recipes-daemons/ncftp/ncftp/ncftp-3.2.5-gcc10.patch
deleted file mode 100644
index 5dee824d7..000000000
--- a/meta-networking/recipes-daemons/ncftp/ncftp/ncftp-3.2.5-gcc10.patch
+++ /dev/null
@@ -1,83 +0,0 @@
-Fix build with -fno-common
-
-Patch from https://src.fedoraproject.org/rpms/ncftp/raw/master/f/ncftp-3.2.5-gcc10.patch
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
---- a/ncftp/bookmark.h
-+++ b/ncftp/bookmark.h
-@@ -29,6 +29,8 @@ typedef struct Bookmark {
-     int             reserved;
- } Bookmark;
- 
-+extern Bookmark gBm;
-+
- #define kBookmarkVersion		8
- #define kBookmarkMinVersion		3
- #if (defined(WIN32) || defined(_WINDOWS)) && !defined(__CYGWIN__)
---- a/ncftp/cmds.c
-+++ b/ncftp/cmds.c
-@@ -98,7 +98,7 @@ extern char gPager[], gHome[], gShell[];
- extern char gOS[];
- extern int gAutoResume;
- extern int gAutoSaveChangesToExistingBookmarks;
--extern Bookmark gBm;
-+//extern Bookmark gBm;
- extern int gLoadedBm, gConfirmClose, gSavePasswords, gScreenColumns;
- extern char gLocalCWD[512], gPrevLocalCWD[512];
- extern int gMayCancelJmp;
---- a/ncftp/main.c
-+++ b/ncftp/main.c
-@@ -38,7 +38,7 @@ extern int gUnprocessedJobs;
- char gLocalCWD[512], gPrevLocalCWD[512];
- 
- extern char gRemoteCWD[512], gPrevRemoteCWD[512];
--extern Bookmark gBm;
-+//extern Bookmark gBm;
- extern int gLoadedBm;
- extern int gFirewallType;
- extern char gAutoAscii[];
---- a/sh_util/gpshare.c
-+++ b/sh_util/gpshare.c
-@@ -28,7 +28,7 @@
- 
- static int gIsAtty1 = 1, gIsAtty2 = 1;
- extern int gLoadedBm, gBookmarkMatchMode;
--Bookmark gBm;
-+//Bookmark gBm;
- 
- double
- FileSize(double size, const char **uStr0, double *uMult0)
---- a/sh_util/ncftpget.c
-+++ b/sh_util/ncftpget.c
-@@ -40,7 +40,7 @@ extern unsigned int gFirewallPort;
- extern char gFirewallExceptionList[256];
- extern int gFwDataPortMode;
- extern const char gOS[], gVersion[];
--extern Bookmark gBm;
-+//extern Bookmark gBm;
- 
- static void
- #if (defined(__GNUC__)) && (__GNUC__ >= 2)
---- a/sh_util/ncftpls.c
-+++ b/sh_util/ncftpls.c
-@@ -39,7 +39,7 @@ extern unsigned int gFirewallPort;
- extern char gFirewallExceptionList[256];
- extern int gFwDataPortMode;
- extern const char gOS[], gVersion[];
--extern Bookmark gBm;
-+//extern Bookmark gBm;
- 
- static int FTPRemoteRecursiveMList(FTPCIPtr cip, const char *const rdir, /* FTPFileInfoListPtr files, */ FTPLineListPtr lines);
- 
---- a/sh_util/ncftpput.c
-+++ b/sh_util/ncftpput.c
-@@ -41,7 +41,6 @@ extern unsigned int gFirewallPort;
- extern char gFirewallExceptionList[256];
- extern int gFwDataPortMode;
- extern const char gOS[], gVersion[];
--extern Bookmark gBm;
- extern int gSendfileInProgress;
- 
- static void
diff --git a/meta-networking/recipes-daemons/ncftp/ncftp_3.2.6.bb b/meta-networking/recipes-daemons/ncftp/ncftp_3.2.7.bb
similarity index 79%
rename from meta-networking/recipes-daemons/ncftp/ncftp_3.2.6.bb
rename to meta-networking/recipes-daemons/ncftp/ncftp_3.2.7.bb
index e66325c83..15bb00a3a 100644
--- a/meta-networking/recipes-daemons/ncftp/ncftp_3.2.6.bb
+++ b/meta-networking/recipes-daemons/ncftp/ncftp_3.2.7.bb
@@ -5,14 +5,12 @@ LICENSE = "ClArtistic"
 LIC_FILES_CHKSUM = "file://ncftp/cmds.c;beginline=3;endline=4;md5=9c2390809f71465aa7ff76e03dc14d91"
 DEPENDS = "ncurses"
 
-SRC_URI = "ftp://ftp.ncftp.com/${BPN}/${BP}-src.tar.xz \
+SRC_URI = "https://www.ncftp.com/public_ftp/ncftp/${BP}-src.tar.xz \
            file://ncftp-configure-use-BUILD_CC-for-ccdv.patch \
            file://unistd.patch \
-           file://ncftp-3.2.5-gcc10.patch \
            file://0001-Forward-port-defining-PREFIX_BINDIR-to-use-new-autoc.patch \
            "
-SRC_URI[md5sum] = "42d0f896d69a4d603ec097546444245f"
-SRC_URI[sha256sum] = "5f200687c05d0807690d9fb770327b226f02dd86155b49e750853fce4e31098d"
+SRC_URI[sha256sum] = "d41c5c4d6614a8eae2ed4e4d7ada6b6d3afcc9fb65a4ed9b8711344bef24f7e8"
 
 inherit autotools-brokensep pkgconfig
 
-- 
2.43.0


