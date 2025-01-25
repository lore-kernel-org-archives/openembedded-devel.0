Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8084C02191
	for <webhook@archiver.kernel.org>; Sat, 25 Jan 2025 18:03:17 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.14806.1737828192651219951
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Jan 2025 10:03:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YVwy42wK;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21680814d42so51621215ad.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 25 Jan 2025 10:03:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737828192; x=1738432992; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=80MrsSXpCK81Tq5Y/64j/7bQney7MLozQL0dypAHJYc=;
        b=YVwy42wKnhSH4e0zYhq8Yiql6gR1Fj9wdDifHNllLPQLGUM1X9b3dIiv4KR3BimCMQ
         JcQaZkifCDImgaKtrR67lRXOdngV6vXhDdR4pcZ7QoHAQJTw7w8vgJqVMsYANiYVqo2p
         gSPcKl9jkha9Zv0rmZokVGEKU99P59Gey26OskOq+OOolMlbGfE0znQEj9JpGPZVYu8s
         vsX8nj+WoCHRkDTWRliiPRPHKTy6Nafz+8CfJFjx0Kj74bBlISJsxUJI5X9v2i5MVSou
         Ky86JCLiCOSidDg4AIBpA34lBinCfiqWZeQDDv55FJvuAi1SgIEGSDA5GN8k0WCJwogm
         WCUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737828192; x=1738432992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=80MrsSXpCK81Tq5Y/64j/7bQney7MLozQL0dypAHJYc=;
        b=WeIbISUiAXlH/h8P1yhXDukAIAOFCcYqDlIpDAn0dltQSN3v15SS/ucqZaIUozY523
         ZEStRv7LpJMZ9AdDXyNaP97asqKhHcQNYK0TewvCipZrtv7Nj4ma4DEt4wo0CZSTudm4
         D2q0ZVDPnlIoScgz9dRZVDVj0djPmTd0XlF5GOF6LvxT76USCGE3puWAYYhJ+Oa87ibt
         iCq+jgIJlF1NB07yDP+o4FtuZkU2F8VOhmBErD1gmcRnqSrM/aMIFhnCbZXHzfoE9zAx
         Ob4vKyYgBaQI4XGOVlZ0Vga8hDhSzjVYXhbKq3QFuMFupV5VOS5Z0AktrL7yDuyyp9VN
         SWng==
X-Gm-Message-State: AOJu0YyK+XKOygt7lQNj3wBmFb3Nshvc5BhlALWSsOWPB/2AlaRcj2/P
	TVdCpGb+W26Fj1WGQCyCy1bnnMe/KC8h24YEDEWn8yjz2WFXIPtJqrwUvA==
X-Gm-Gg: ASbGncsarVr4Vjd4C06ZTLW/Hujf6kDH6u/Adv10XFch7VG65XZNhk1lKE3wcmLNx2j
	+3SMnjZehCV6Wfi2na3jO6Nezxmw05c57CHDqMi9shKHY8JjTxDreF3KGsNtvHr29Dxv+8rB3xH
	kXDX2d5TVdH8kWFutRBQny7nbHoP4w0nXonN3sSvg7EsYz8NXmHhxVsHFKOcqA2tvnC6ZYIMBqU
	6eN1ArNk94gA5TRLBDZMfv8HW0YDnwlkDnGd8cvYer3eFUsthtn/Fdzfr5PUJjx9qifmeZcxkn1
	nwYBEOKwa0/v0OvmfAkbQ5+DHYM=
X-Google-Smtp-Source: AGHT+IHEDRVVf38BqBj6Pmur6sv61rUZqNnY+ImbNDRpm7dUr+Cy/z1dzQZw6Yw0hNc0QmbVFO41Ww==
X-Received: by 2002:a05:6a21:81a3:b0:1e8:bff6:8356 with SMTP id adf61e73a8af0-1eb214cb158mr40140591637.20.1737828191782;
        Sat, 25 Jan 2025 10:03:11 -0800 (PST)
Received: from keaua.hsd1.ca.comcast.net ([2601:646:8182:b790:f137:fcfb:97fc:71bd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a6b51e7sm4108906b3a.69.2025.01.25.10.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jan 2025 10:03:11 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 02/14] mpd: Upgrade mpd to 0.23.16
Date: Sat, 25 Jan 2025 10:02:56 -0800
Message-ID: <20250125180308.7856-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250125180308.7856-1-akuster808@gmail.com>
References: <20250125180308.7856-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Jan 2025 18:03:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115085

From: Khem Raj <raj.khem@gmail.com>

- Release Notes

* database
  - fix integer overflows with 64-bit inode numbers
* filter
  - ffmpeg: fix for filters producing no output
* support libfmt 11
* support ICU 76

- Drop ICU-76 support patch its already in this release

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e7ca3cedb0ada5363db24d1ba7256544732173d7)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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
-- 
2.43.0


