Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5913CA0ED8
	for <webhook@archiver.kernel.org>; Fri, 30 Aug 2024 03:58:35 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.5220.1724990313424191203
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Aug 2024 20:58:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nnF077qL;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-70b2421471aso775402a12.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Aug 2024 20:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724990313; x=1725595113; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KHnX4Sqyz1QU01Qg3VnjMWI8K3DKyfsAx0vz5aVsHEY=;
        b=nnF077qLjyFYXfLi8fgL2mnpNKZNJmNq9du60dTcm6GjH4ME/BTMH8VNpoLEAbKvBV
         guZfkBwvBOOnzYPfgPgHB4plffaIKwC67bTSxQaIHgwESew98f+XPRtNYqbor8VqgToM
         3UYESWMsdg1dEcXGkX43O11fHKjWpBpDeh8QcxfVahWba9IaOd5PsD8CxcKxf3/yOalI
         Szwyn1vWBj3Rp+Y509C5w7tGlLykIPOVyhbDF8AlwyyBANpwY91VN4jy1mKzHtJgPKmW
         Tn+BLmO7USSsmAiRzXsIDLzbP3pR7zMoZg/mfWX0IALhRQTfwn++GpT8iPSdXUDls8DL
         FkzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724990313; x=1725595113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KHnX4Sqyz1QU01Qg3VnjMWI8K3DKyfsAx0vz5aVsHEY=;
        b=ZHXxk6XTO6nPaXqZPhZGNvEtNC8k9trp0mHKDIIYFvS1g+MqfEhweVjygRC9NDr6Qc
         G/bhEOl7B9ZjBgb5mcyfu6DgHYMfdoPNKTwdZnoJTLOSsejxfhEunfUj+YZUCqQxZ/uv
         Pv7c1LSmjmBaBvTsA3pI4s8waSxFX1if1fVSyTw/L8VgIpRdJqGCRxdCsBaPGThGQpM7
         baxCiwvBO8tO2+/B2LvXU4EhUQctMVE7/sUKzQXQ8sWbN51OLZ5P2YU/Kp0zRm+qHXKj
         yRZPcTGf/GgKMDx/+CltgedEv1BLypyR8+Xv/y9Znjv3yGhe44mwDjctL0s0vZ0jSpqC
         cUzw==
X-Gm-Message-State: AOJu0YwwThQDCNCg0ATOfD8914kPWZRrGEyhZcw2G/tizqw9n/x0auSu
	VBPJ6HaUb2iSWuNN1IJuopmAq0ZjMX0AXwf+qZ8XYd7lsQBPtvrdMMsCk/Ja
X-Google-Smtp-Source: AGHT+IHiA5fpn/sfHV/+zfz4YGRFDoHc78E/9IkZKGrGEt6xW5sCYuWPC6UpGwSRe4TmL/e9AjSTww==
X-Received: by 2002:a17:903:2301:b0:201:ed48:f11c with SMTP id d9443c01a7336-2050b9c3ef1mr58196095ad.0.1724990312436;
        Thu, 29 Aug 2024 20:58:32 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:9d80:4380::2696])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2052919afb2sm2705035ad.3.2024.08.29.20.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 20:58:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 2/8] minidlna: Upgrade to 1.3.3 release
Date: Thu, 29 Aug 2024 20:58:21 -0700
Message-ID: <20240830035827.406391-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240830035827.406391-1-raj.khem@gmail.com>
References: <20240830035827.406391-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 Aug 2024 03:58:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112041

Drop unneeded patches
Add a patch to fix build with ffmpeg7

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-multimedia/minidlna/minidlna.inc  |  3 +-
 ...01-Add-compatibility-with-FFMPEG-7.0.patch | 49 +++++++++++++++++++
 .../0001-Update-Gettext-version.patch         | 32 ------------
 ...onfigure.ac-drop-non-standard-checks.patch | 37 --------------
 .../{minidlna_1.3.0.bb => minidlna_1.3.3.bb}  |  2 +-
 5 files changed, 51 insertions(+), 72 deletions(-)
 create mode 100644 meta-multimedia/recipes-multimedia/minidlna/minidlna/0001-Add-compatibility-with-FFMPEG-7.0.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/minidlna/minidlna/0001-Update-Gettext-version.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/minidlna/minidlna/0001-configure.ac-drop-non-standard-checks.patch
 rename meta-multimedia/recipes-multimedia/minidlna/{minidlna_1.3.0.bb => minidlna_1.3.3.bb} (66%)

diff --git a/meta-multimedia/recipes-multimedia/minidlna/minidlna.inc b/meta-multimedia/recipes-multimedia/minidlna/minidlna.inc
index aabf81dce0..8c9ead1489 100644
--- a/meta-multimedia/recipes-multimedia/minidlna/minidlna.inc
+++ b/meta-multimedia/recipes-multimedia/minidlna/minidlna.inc
@@ -11,9 +11,8 @@ inherit gettext autotools-brokensep update-rc.d systemd
 SRC_URI = "git://git.code.sf.net/p/minidlna/git;branch=master;module=git \
            file://minidlna-daemon.init.d \
            file://minidlna.service \
-           file://0001-Update-Gettext-version.patch \
            file://0001-configure-Check-for-clock_gettime-seprately-from-__N.patch \
-           file://0001-configure.ac-drop-non-standard-checks.patch \
+           file://0001-Add-compatibility-with-FFMPEG-7.0.patch \
            "
 
 S = "${WORKDIR}/git"
diff --git a/meta-multimedia/recipes-multimedia/minidlna/minidlna/0001-Add-compatibility-with-FFMPEG-7.0.patch b/meta-multimedia/recipes-multimedia/minidlna/minidlna/0001-Add-compatibility-with-FFMPEG-7.0.patch
new file mode 100644
index 0000000000..f9d9c694bc
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/minidlna/minidlna/0001-Add-compatibility-with-FFMPEG-7.0.patch
@@ -0,0 +1,49 @@
+From 92f8b94c697c225fb31062586f817c4fc3df8c2a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 29 Aug 2024 13:22:33 -0700
+Subject: [PATCH] Add compatibility with FFMPEG 7.0
+
+channel_layout has been replaced with ch_layout
+
+Upstream-Status: Submitted [https://sourceforge.net/p/minidlna/git/merge-requests/59/]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libav.h | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/libav.h b/libav.h
+index b69752c..a3153bd 100644
+--- a/libav.h
++++ b/libav.h
+@@ -58,6 +58,7 @@
+ #endif
+ 
+ #define USE_CODECPAR LIBAVFORMAT_VERSION_INT >= ((57<<16)+(50<<8)+100)
++#define USE_CH_LAYOUT (LIBAVUTIL_VERSION_INT >= AV_VERSION_INT(57, 28, 100))
+ 
+ #ifndef FF_PROFILE_H264_BASELINE
+ #define FF_PROFILE_H264_BASELINE 66
+@@ -174,7 +175,11 @@ lav_get_interlaced(AVStream *s)
+ #define lav_codec_tag(s) s->codecpar->codec_tag
+ #define lav_sample_rate(s) s->codecpar->sample_rate
+ #define lav_bit_rate(s) s->codecpar->bit_rate
++#if USE_CH_LAYOUT
++#define lav_channels(s) s->codecpar->ch_layout.nb_channels
++#else
+ #define lav_channels(s) s->codecpar->channels
++#endif
+ #define lav_width(s) s->codecpar->width
+ #define lav_height(s) s->codecpar->height
+ #define lav_profile(s) s->codecpar->profile
+@@ -186,7 +191,11 @@ lav_get_interlaced(AVStream *s)
+ #define lav_codec_tag(s) s->codec->codec_tag
+ #define lav_sample_rate(s) s->codec->sample_rate
+ #define lav_bit_rate(s) s->codec->bit_rate
++#if USE_CH_LAYOUT
++#define lav_channels(s) s->codec->ch_layout.nb_channels
++#else
+ #define lav_channels(s) s->codec->channels
++#endif
+ #define lav_width(s) s->codec->width
+ #define lav_height(s) s->codec->height
+ #define lav_profile(s) s->codec->profile
diff --git a/meta-multimedia/recipes-multimedia/minidlna/minidlna/0001-Update-Gettext-version.patch b/meta-multimedia/recipes-multimedia/minidlna/minidlna/0001-Update-Gettext-version.patch
deleted file mode 100644
index 6100da3581..0000000000
--- a/meta-multimedia/recipes-multimedia/minidlna/minidlna/0001-Update-Gettext-version.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From a4290bf1887f9203288858ca76bdd20b2edf337a Mon Sep 17 00:00:00 2001
-From: Baptiste Durand <baptiste.durand@gmail.com>
-Date: Sun, 9 Sep 2018 20:50:41 +0200
-Subject: [PATCH] Update Gettext version
-
-Upstream-Status: Inappropriate [oe-core specific]
-
-Signed-off-by: Baptiste Durand <baptiste.durand@gmail.com>
----
- configure.ac | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
---- a/configure.ac
-+++ b/configure.ac
-@@ -14,7 +14,7 @@
- # License along with MiniDLNA; if not, write to the Free Software
- # Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
- # USA.
--AC_INIT(MiniDLNA,1.1.3,,minidlna)
-+AC_INIT(MiniDLNA,1.2.1,,minidlna)
- #LT_INIT
- 
- AC_CANONICAL_TARGET
-@@ -28,7 +28,7 @@ m4_ifdef([AC_USE_SYSTEM_EXTENSIONS], [AC
- 
- AM_ICONV
- AM_GNU_GETTEXT([external])
--AM_GNU_GETTEXT_VERSION(0.18)
-+AM_GNU_GETTEXT_VERSION(0.20)
- 
- # Checks for programs.
- AC_PROG_AWK
diff --git a/meta-multimedia/recipes-multimedia/minidlna/minidlna/0001-configure.ac-drop-non-standard-checks.patch b/meta-multimedia/recipes-multimedia/minidlna/minidlna/0001-configure.ac-drop-non-standard-checks.patch
deleted file mode 100644
index 93334b7dab..0000000000
--- a/meta-multimedia/recipes-multimedia/minidlna/minidlna/0001-configure.ac-drop-non-standard-checks.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 83425344b2d7339e8f5b0ad230c51278d330d613 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Sat, 22 Jan 2022 11:41:50 +0100
-Subject: [PATCH] configure.ac: drop non-standard checks
-
-Not sure what upstream is trying to do here but it does not work
-with the latest autoconf.
-
-Upstream-Status: Inactive-Upstream
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- configure.ac | 5 -----
- 1 file changed, 5 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index aa7dd1c..858db52 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -418,7 +418,6 @@ for dir in "" /usr/local $SEARCH_DIR; do
-     AC_CHECK_LIB([id3tag -lz], [id3_file_open], [LIBID3TAG_LIBS="-lid3tag -lz"], [unset ac_cv_lib_id3tag_id3_file_open; LDFLAGS="$LDFLAGS_SAVE"; continue])
-     break
- done
--test x"$ac_cv_lib_id3tag__lz___id3_file_open" = x"yes" || AC_MSG_ERROR([Could not find libid3tag])
- AC_SUBST(LIBID3TAG_LIBS)
- 
- LDFLAGS_SAVE="$LDFLAGS"
-@@ -444,10 +443,6 @@ for dir in "" /usr/local $SEARCH_DIR; do
- 		  [unset ac_cv_lib_avformat_av_open_input_file; unset ac_cv_lib_avformat_avformat_open_input; LDFLAGS="$LDFLAGS_SAVE"; continue])])
-     break
- done
--if test x"$ac_cv_lib_avformat__lavcodec__lavutil__lz___av_open_input_file" != x"yes" &&
--   test x"$ac_cv_lib_avformat__lavcodec__lavutil__lz___avformat_open_input" != x"yes"; then
--   AC_MSG_ERROR([Could not find libavformat - part of ffmpeg])
--fi
- AC_SUBST(LIBAVFORMAT_LIBS)
- 
- AC_CHECK_LIB(pthread, pthread_create)
diff --git a/meta-multimedia/recipes-multimedia/minidlna/minidlna_1.3.0.bb b/meta-multimedia/recipes-multimedia/minidlna/minidlna_1.3.3.bb
similarity index 66%
rename from meta-multimedia/recipes-multimedia/minidlna/minidlna_1.3.0.bb
rename to meta-multimedia/recipes-multimedia/minidlna/minidlna_1.3.3.bb
index 4238918c97..da0d90a993 100644
--- a/meta-multimedia/recipes-multimedia/minidlna/minidlna_1.3.0.bb
+++ b/meta-multimedia/recipes-multimedia/minidlna/minidlna_1.3.3.bb
@@ -1,4 +1,4 @@
 require ${BPN}.inc
 
-SRCREV = "109d63cb11ac207c18a784556834eb054b34b00b"
+SRCREV = "1a9b32ee7a1c89e54e9f148199b73f9b33ad45ba"
 LIC_FILES_CHKSUM = "file://LICENCE.miniupnpd;md5=b0dabf9d8e0f871554e309d62ead8d2b"

