Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4E8CCAC5B9
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 14:19:52 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.18554.1758896382890541449
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 07:19:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mgPrb4SX;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-62fc686dc41so2252342a12.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 07:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758896381; x=1759501181; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RyrTTlaPBqunxd3ohtgu0/gZq/edvEL3/Ub+zqSXJl0=;
        b=mgPrb4SXZh/vkSc81NjQ1pyen8EqLKrvRE6MTf+mHEEZOVN7TvYx5/7TiUo3/tyiv5
         rvwxT9MfXoFfkGltzsFSx3DNoORRj+DlzTpSn03szU5bvmzWZ7JY7H/uvRWIT4PwwSrV
         mO1/r3TGCe6IB494lDxJFtxMrAy4l1cBxFoj+1Dc5ikzr84yW7FSoe011TfZqiPDxnNw
         J2Ym/8hy5QO8tC09YNVPBCww8LulNuBpsIRxxxfCxP/J3Fv10yNeJIVd7oGMPsrwxfbz
         AsabNmQoyT0HrSSQ5K5JrTKza5qdzR2Q7dUMWi7ydHRjlDuVZwNp/ZJzCVI/77MKFCHt
         WLBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758896381; x=1759501181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RyrTTlaPBqunxd3ohtgu0/gZq/edvEL3/Ub+zqSXJl0=;
        b=sUeHlF//hN1zsO3uxEyGvHIJibGibCYcXErDzlykpQmwpXp/zviETIeDqXXAiqK19o
         IJ42octraFWppQ027RlLt5mAl+HdLDkhAPDzbmyueu8ilayd937z9fv1nmoE+SfW5hnP
         RRN6H5ZY3Lkrv/xjbWLJcniDCw8heKHTd6S6tTXPh+6G1ZMxdg/h5Y8kPsK3el8yFDus
         HFC9q4cd3d1YrCRW4KbTT7VIR7GqC3RJzdvoGPD2fNSO2TSJRE/rMJzLWvOfaNFKg8cI
         hh+kZMFMAe4we248HVvD1GKZscxtgLwjfchZzAovHQn83RXGZtFXaw+l/QRYlq8f5mik
         sdLg==
X-Gm-Message-State: AOJu0YwTI1myn3KnNIGcktdcTRRldMaywA68S5/sIBVYXKZS02sHouSR
	kPO7kKRTIn4XJvl+WX3akYga97u/o69E421FtEVRnmtPLxiCIDxVAhiJi+Zpnw==
X-Gm-Gg: ASbGncsidvxDjfNfpeI8frIBg50RfzpmiD70lb8tvHHgjgVpqElxplMn2+g79VEfzQ3
	2dPPfF1F+7agFpT3SSPiBLBOno49gsoOXqDVuNKFyzGqt1/+RugaR0Jba2eMRTOCr/9sPIj1AQx
	r8SoUCEzNO6v+GbJtz/QzRbPdnwkG56sViKsDEeoy6Am95zjeOhzu6+PvALkMNWKqWVpTFiLfaw
	m8lFIaWqnU8uqS/QxtyaHXYc24ePXUoZOF7zoLnfFG3rXT9e8/IC5qYwVUPugbUYpEDrcCQzGL/
	QF9U6M0Ei5NAnYUrbWB4KbIP742y2UvaYFezWsTkTeRAuRZiqEVrWTcIb9HfTZf6vmg6pNk3WN2
	XFkRBy0OsPUDTTOSoQrTO
X-Google-Smtp-Source: AGHT+IHG0Ha9ajznoNh9O0J9lZw2lJKGttxwxPKJ0RaoPkwRiH/Hik1m88YCAp4HQ6lGRo4CTAHcBw==
X-Received: by 2002:aa7:ca56:0:b0:62f:7968:e1de with SMTP id 4fb4d7f45d1cf-6349fa86818mr5310545a12.28.1758896380909;
        Fri, 26 Sep 2025 07:19:40 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3ae321csm3001028a12.24.2025.09.26.07.19.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 07:19:40 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 20/20] ncftp: Upgrade to 3.2.7
Date: Fri, 26 Sep 2025 16:19:19 +0200
Message-ID: <20250926141919.2010846-21-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250926141919.2010846-1-skandigraun@gmail.com>
References: <20250926141919.2010846-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 14:19:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119929

From: Randy MacLeod <Randy.MacLeod@windriver.com>

Switch the SRC_URI from "ftp:" to "https:". Drop the obsolete SRC_URI[md5sum].
Drop ncftp-3.2.5-gcc10.patch since we're using gcc13 and upstream has fixed the build
to work by adding an extern to sh_util/gpshare.c for example.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 9dbf1b42bbbd71f8492117bf5a16137faf5f9fc9)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../ncftp/ncftp/ncftp-3.2.5-gcc10.patch       | 83 -------------------
 .../ncftp/{ncftp_3.2.6.bb => ncftp_3.2.7.bb}  |  8 +-
 2 files changed, 3 insertions(+), 88 deletions(-)
 delete mode 100644 meta-networking/recipes-daemons/ncftp/ncftp/ncftp-3.2.5-gcc10.patch
 rename meta-networking/recipes-daemons/ncftp/{ncftp_3.2.6.bb => ncftp_3.2.7.bb} (80%)

diff --git a/meta-networking/recipes-daemons/ncftp/ncftp/ncftp-3.2.5-gcc10.patch b/meta-networking/recipes-daemons/ncftp/ncftp/ncftp-3.2.5-gcc10.patch
deleted file mode 100644
index 5dee824d7a..0000000000
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
similarity index 80%
rename from meta-networking/recipes-daemons/ncftp/ncftp_3.2.6.bb
rename to meta-networking/recipes-daemons/ncftp/ncftp_3.2.7.bb
index 592f98f9d3..ac7355f525 100644
--- a/meta-networking/recipes-daemons/ncftp/ncftp_3.2.6.bb
+++ b/meta-networking/recipes-daemons/ncftp/ncftp_3.2.7.bb
@@ -5,13 +5,11 @@ LICENSE = "ClArtistic"
 LIC_FILES_CHKSUM = "file://ncftp/cmds.c;beginline=3;endline=4;md5=9c2390809f71465aa7ff76e03dc14d91"
 DEPENDS = "ncurses"
 
-SRC_URI = "ftp://ftp.ncftp.com/${BPN}/${BP}-src.tar.xz \
+SRC_URI = "https://www.ncftp.com/public_ftp/ncftp/older_versions/${BP}-src.tar.xz \
            file://ncftp-configure-use-BUILD_CC-for-ccdv.patch \
            file://unistd.patch \
-           file://ncftp-3.2.5-gcc10.patch \
-"
-SRC_URI[md5sum] = "42d0f896d69a4d603ec097546444245f"
-SRC_URI[sha256sum] = "5f200687c05d0807690d9fb770327b226f02dd86155b49e750853fce4e31098d"
+           "
+SRC_URI[sha256sum] = "d41c5c4d6614a8eae2ed4e4d7ada6b6d3afcc9fb65a4ed9b8711344bef24f7e8"
 
 inherit autotools-brokensep pkgconfig
 

