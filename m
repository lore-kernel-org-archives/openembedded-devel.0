Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3C97E7719F
	for <webhook@archiver.kernel.org>; Thu,  9 Jan 2025 23:29:55 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.7155.1736465391091606834
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Jan 2025 15:29:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mu/qbnFc;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-21654fdd5daso23413505ad.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Jan 2025 15:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736465390; x=1737070190; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q7zhARP9rNgr/SkKZmdaj6pBNTx3l2ZuZm64Q3sn7zU=;
        b=mu/qbnFcsB4Pye0rc7XX3dLBBahKD4KZVShly82nWpe25BaYKTwp064WU6IIlKgxw8
         MKoigE+v+aiQPB5GhZxeK6un8+rntCmUGE1W99zOOPD1a+zZW66bokfEyan/rzCxRcGr
         5or9fmAdbe6fJYTXvRQvH8MIrQHeDDltjJCkU+8oKTpaaTH3WSctg+Od95TH0S2XAtGw
         Y+4og+P6A74WsBJf63P1iOignzxdQF06EamoB+qxm67GmkLmh20z/JYLmgJA8WlqLBAI
         ScWAdKFHpc82o3j8O4pTVCIKoCVwqp6LrzaRAZpENotOcUN9FWfAP7ASmLcFvN5sPrDo
         52mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736465390; x=1737070190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q7zhARP9rNgr/SkKZmdaj6pBNTx3l2ZuZm64Q3sn7zU=;
        b=iySIy0MW/NF5MTAaOSEEFOuchf2vpWmG13V9qjRCUTyJDMa74mARvwvvvONvxK0NKx
         gKYOs7L50X9Fr6opTRijSJB61YNYBck1NfCEwVkjIrPCqMzf5ryIABP0cLzot6qezgqC
         Imi5sc+TlKCRNwLJ2Pk/yV5oEaVgzHGmZ1wHPQKd5b6XeXYJLiLQlC6yfGO5mmbsYgs0
         vpdg1Ode+59x5CzBDRlhVkS7byjTml5aLD4THaYl4xJ7yOAM6Um4+wLs5ExEa6Qzcgya
         m5l7u+yznVJB/Jt3pED+uoqvlQIJ3PGuGO2NAxllC6vbO1QaHL1ponaTbfzOrNPCaJcV
         QyHg==
X-Gm-Message-State: AOJu0Yy/OsQKzCj6kWuQC1MILl28XMxV6LNa0O3My1HtJjuxVNzdLke8
	G22hwGfp/ZsB4AaePCnfh5Yt6YdAAy6x1OCkLIPYArsFg+O1wbj2sOeNtf9G
X-Gm-Gg: ASbGncuHLPOpchfGO21fYEgmBh4hliJK5bzwL0nlYCRszpKlZeC4tWBYPsrwDe1MzXe
	cLMD66KGbdcM44X0s10bGOBqgRarA51DuBrVmFkUzq6JFBzPylay1XcD9g5DkFwScEG+7Yq1iUH
	2fdGvwZg4Jgans1olRixb4Trkp9DgDOuO+k95PI7iKn53hpOHOD/3LdHNz3RW3vsalpQ6rEIR37
	ZvmGGFr2/CvtziXgRnbOLe0ImyINIH5XVLSFyFcFUUHnAnL
X-Google-Smtp-Source: AGHT+IGaNh9NTN4sFitOPkBWv7apXLh2L26LpgA2BdjYHox833vcXdmAmpC96e0zt00cTg8kdTFJcA==
X-Received: by 2002:a17:903:2806:b0:218:a43c:571e with SMTP id d9443c01a7336-21a83f69672mr104313595ad.28.1736465390014;
        Thu, 09 Jan 2025 15:29:50 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8201:fd20::1344])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a31d6a0b140sm1804500a12.60.2025.01.09.15.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 15:29:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 2/6] mpd: Upgrade mpd to 0.23.16
Date: Thu,  9 Jan 2025 15:29:42 -0800
Message-ID: <20250109232946.1556083-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250109232946.1556083-1-raj.khem@gmail.com>
References: <20250109232946.1556083-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Jan 2025 23:29:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114758

- Release Notes

* database
  - fix integer overflows with 64-bit inode numbers
* filter
  - ffmpeg: fix for filters producing no output
* support libfmt 11
* support ICU 76

- Drop ICU-76 support patch its already in this release

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...n.build-support-building-with-ICU-76.patch | 52 -------------------
 .../{mpd_0.23.15.bb => mpd_0.23.16.bb}        |  3 +-
 2 files changed, 1 insertion(+), 54 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/musicpd/mpd/0001-meson.build-support-building-with-ICU-76.patch
 rename meta-multimedia/recipes-multimedia/musicpd/{mpd_0.23.15.bb => mpd_0.23.16.bb} (97%)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd/0001-meson.build-support-building-with-ICU-76.patch b/meta-multimedia/recipes-multimedia/musicpd/mpd/0001-meson.build-support-building-with-ICU-76.patch
deleted file mode 100644
index 8b85f396ca..0000000000
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd/0001-meson.build-support-building-with-ICU-76.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 1a063fee7ec1077e248ff97ebf1f92c5c5941a67 Mon Sep 17 00:00:00 2001
-From: Michael Cho <michael@michaelcho.dev>
-Date: Sat, 26 Oct 2024 10:29:53 -0400
-Subject: [PATCH] meson.build: support building with ICU 76
-
-ICU 76 decided to reduce overlinking[^1] thus `icu-i18n` will no longer
-add `icu-uc` when linking to shared libraries. This results in failure:
-```
-src/lib/icu/libicu.a.p/Converter.cxx.o: undefined reference to symbol 'ucnv_fromUnicode_76'
-```
-
-[^1]: https://github.com/unicode-org/icu/commit/199bc827021ffdb43b6579d68e5eecf54c7f6f56
-
-Upstream-Status: Backport [https://github.com/MusicPlayerDaemon/MPD/commit/1a063fee7ec1077e248ff97ebf1f92c5c5941a67]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/lib/icu/meson.build | 11 +++++++----
- 1 file changed, 7 insertions(+), 4 deletions(-)
-
-diff --git a/src/lib/icu/meson.build b/src/lib/icu/meson.build
-index 3ecc0a517..e6cf8cdce 100644
---- a/src/lib/icu/meson.build
-+++ b/src/lib/icu/meson.build
-@@ -1,5 +1,7 @@
--icu_dep = dependency('icu-i18n', version: '>= 50', required: get_option('icu'))
--conf.set('HAVE_ICU', icu_dep.found())
-+icu_i18n_dep = dependency('icu-i18n', version: '>= 50', required: get_option('icu'))
-+icu_uc_dep = dependency('icu-uc', version: '>= 50', required: get_option('icu'))
-+have_icu = icu_i18n_dep.found() and icu_uc_dep.found()
-+conf.set('HAVE_ICU', have_icu)
- 
- icu_sources = [
-   'Canonicalize.cxx',
-@@ -13,7 +15,7 @@ if is_windows
- endif
- 
- iconv_dep = []
--if icu_dep.found()
-+if have_icu
-   icu_sources += [
-     'Init.cxx',
-     'Util.cxx',
-@@ -31,7 +33,8 @@ icu = static_library(
-   icu_sources,
-   include_directories: inc,
-   dependencies: [
--    icu_dep,
-+    icu_i18n_dep,
-+    icu_uc_dep,
-     iconv_dep,
-     fmt_dep,
-   ],
diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.15.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.16.bb
similarity index 97%
rename from meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.15.bb
rename to meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.16.bb
index 3fa4485a04..4d854d6fc5 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.15.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.16.bb
@@ -21,9 +21,8 @@ DEPENDS += " \
 PV .= "+git"
 SRC_URI = "git://github.com/MusicPlayerDaemon/MPD;branch=master;protocol=https \
            file://mpd.conf.in \
-           file://0001-meson.build-support-building-with-ICU-76.patch \
            "
-SRCREV = "965c466e9bda262790e76edd5272e9e74b407ff3"
+SRCREV = "b5bd294e5c88c062b1a9c0c4c60397fbf7f3f1c5"
 S = "${WORKDIR}/git"
 
 EXTRA_OEMESON += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '-Dsystemd=enabled -Dsystemd_system_unit_dir=${systemd_system_unitdir} -Dsystemd_user_unit_dir=${systemd_system_unitdir}', '-Dsystemd=disabled', d)} \

