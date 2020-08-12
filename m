Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.293.1597264898713402394
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Aug 2020 13:41:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SkZD4Qr+;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id k18so1607784pfp.7
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Aug 2020 13:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xIztNWjSceu0dRHeCGWtlVNIif93hgemqWFRuWBlC+Y=;
        b=SkZD4Qr+T4uXlnJT9AEGZN4ae0bDKpTEU213R/dZOhCJNxjz0hP1cVDR/1VJjMYC2A
         qLEUYrSEKb+zXSrovxB4YYXKZYmeb42URwx6s0D5+P6hyAaiGFW7jCtHi+1jOb5lLMWn
         /Nqp3FJRLXtCZM9Fx6DVgXbvgk9lWe9FTtz99XlVSQjX9CorrEV7n1IPxFT6902XflFt
         nMQdp0NjcYJfZ7iEDXJO67IFblnwcBvAYYn4+a4tgbX3qIvUil5UymKre+ZFHZtbtl63
         nCHX/7425ECcggzHxKrAqTefRV/8S+8R5z5rHBRtPaxawpSo4iKrXU9M44RDkfILZKJE
         DK6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xIztNWjSceu0dRHeCGWtlVNIif93hgemqWFRuWBlC+Y=;
        b=b6c5Kg8IoIbaIrmGs42+Bykaja/IPw5pk/5anbog9ITITJpsILqJ2eT65uw95ir4bI
         RTFY1V6aopx+ynd1LkfYCgUHPfftfoG7UWwO6U3V5dAmrsOG9e4rziReZO5W/uvz+nrZ
         rhEvEG8hqjKnub1QdfZtSlu5d2dXiEzYBdSpupgSMU7Ai1tbGGr8idKr8yiqwSQqcMf7
         M7OXTmMfl7+HWjrPI02gjd544+mXDPnXv7OiLD33r7jjys1KU8hq7RxhAhpKO+ru2T6R
         +7jwCfwOga636VuVM1QsXc17X/kWCl8wjenClVim02Oazdzf1txtIxRDNwO/D3O1U2uh
         Om+w==
X-Gm-Message-State: AOAM532pVVZcGUETUObvkRdjxCrnvLwCyJYsaAZCEA9FbPSjVvtsKmnC
	iqTP1WmDRP9R8C1EnJbKCZcGzgRTLjU=
X-Google-Smtp-Source: ABdhPJyWEi5SGFfk/HnOSS1xnAybqstzexj+wOSJgOY8adXwNNW7u3s5mVL9O6ICxUYHCZGGomg7vw==
X-Received: by 2002:a65:4bc7:: with SMTP id p7mr827039pgr.440.1597264897726;
        Wed, 12 Aug 2020 13:41:37 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id l22sm2984287pjy.31.2020.08.12.13.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 13:41:37 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][ 07/18] ncftp: Fix build with -fno-common
Date: Wed, 12 Aug 2020 13:41:19 -0700
Message-Id: <20200812204130.1012160-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200812204130.1012160-1-raj.khem@gmail.com>
References: <20200812204130.1012160-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../ncftp/ncftp/ncftp-3.2.5-gcc10.patch       | 83 +++++++++++++++++++
 .../recipes-daemons/ncftp/ncftp_3.2.6.bb      |  1 +
 2 files changed, 84 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/ncftp/ncftp/ncftp-3.2.5-gcc10.patch

diff --git a/meta-networking/recipes-daemons/ncftp/ncftp/ncftp-3.2.5-gcc10.patch b/meta-networking/recipes-daemons/ncftp/ncftp/ncftp-3.2.5-gcc10.patch
new file mode 100644
index 0000000000..5dee824d7a
--- /dev/null
+++ b/meta-networking/recipes-daemons/ncftp/ncftp/ncftp-3.2.5-gcc10.patch
@@ -0,0 +1,83 @@
+Fix build with -fno-common
+
+Patch from https://src.fedoraproject.org/rpms/ncftp/raw/master/f/ncftp-3.2.5-gcc10.patch
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+--- a/ncftp/bookmark.h
++++ b/ncftp/bookmark.h
+@@ -29,6 +29,8 @@ typedef struct Bookmark {
+     int             reserved;
+ } Bookmark;
+ 
++extern Bookmark gBm;
++
+ #define kBookmarkVersion		8
+ #define kBookmarkMinVersion		3
+ #if (defined(WIN32) || defined(_WINDOWS)) && !defined(__CYGWIN__)
+--- a/ncftp/cmds.c
++++ b/ncftp/cmds.c
+@@ -98,7 +98,7 @@ extern char gPager[], gHome[], gShell[];
+ extern char gOS[];
+ extern int gAutoResume;
+ extern int gAutoSaveChangesToExistingBookmarks;
+-extern Bookmark gBm;
++//extern Bookmark gBm;
+ extern int gLoadedBm, gConfirmClose, gSavePasswords, gScreenColumns;
+ extern char gLocalCWD[512], gPrevLocalCWD[512];
+ extern int gMayCancelJmp;
+--- a/ncftp/main.c
++++ b/ncftp/main.c
+@@ -38,7 +38,7 @@ extern int gUnprocessedJobs;
+ char gLocalCWD[512], gPrevLocalCWD[512];
+ 
+ extern char gRemoteCWD[512], gPrevRemoteCWD[512];
+-extern Bookmark gBm;
++//extern Bookmark gBm;
+ extern int gLoadedBm;
+ extern int gFirewallType;
+ extern char gAutoAscii[];
+--- a/sh_util/gpshare.c
++++ b/sh_util/gpshare.c
+@@ -28,7 +28,7 @@
+ 
+ static int gIsAtty1 = 1, gIsAtty2 = 1;
+ extern int gLoadedBm, gBookmarkMatchMode;
+-Bookmark gBm;
++//Bookmark gBm;
+ 
+ double
+ FileSize(double size, const char **uStr0, double *uMult0)
+--- a/sh_util/ncftpget.c
++++ b/sh_util/ncftpget.c
+@@ -40,7 +40,7 @@ extern unsigned int gFirewallPort;
+ extern char gFirewallExceptionList[256];
+ extern int gFwDataPortMode;
+ extern const char gOS[], gVersion[];
+-extern Bookmark gBm;
++//extern Bookmark gBm;
+ 
+ static void
+ #if (defined(__GNUC__)) && (__GNUC__ >= 2)
+--- a/sh_util/ncftpls.c
++++ b/sh_util/ncftpls.c
+@@ -39,7 +39,7 @@ extern unsigned int gFirewallPort;
+ extern char gFirewallExceptionList[256];
+ extern int gFwDataPortMode;
+ extern const char gOS[], gVersion[];
+-extern Bookmark gBm;
++//extern Bookmark gBm;
+ 
+ static int FTPRemoteRecursiveMList(FTPCIPtr cip, const char *const rdir, /* FTPFileInfoListPtr files, */ FTPLineListPtr lines);
+ 
+--- a/sh_util/ncftpput.c
++++ b/sh_util/ncftpput.c
+@@ -41,7 +41,6 @@ extern unsigned int gFirewallPort;
+ extern char gFirewallExceptionList[256];
+ extern int gFwDataPortMode;
+ extern const char gOS[], gVersion[];
+-extern Bookmark gBm;
+ extern int gSendfileInProgress;
+ 
+ static void
diff --git a/meta-networking/recipes-daemons/ncftp/ncftp_3.2.6.bb b/meta-networking/recipes-daemons/ncftp/ncftp_3.2.6.bb
index 5f92f27fdf..ee6da5737f 100644
--- a/meta-networking/recipes-daemons/ncftp/ncftp_3.2.6.bb
+++ b/meta-networking/recipes-daemons/ncftp/ncftp_3.2.6.bb
@@ -8,6 +8,7 @@ DEPENDS = "ncurses"
 SRC_URI = "ftp://ftp.ncftp.com/${BPN}/${BP}-src.tar.xz \
            file://ncftp-configure-use-BUILD_CC-for-ccdv.patch \
            file://unistd.patch \
+           file://ncftp-3.2.5-gcc10.patch \
 "
 SRC_URI[md5sum] = "42d0f896d69a4d603ec097546444245f"
 SRC_URI[sha256sum] = "5f200687c05d0807690d9fb770327b226f02dd86155b49e750853fce4e31098d"
-- 
2.28.0

