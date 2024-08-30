Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA9ACCA0EDA
	for <webhook@archiver.kernel.org>; Fri, 30 Aug 2024 03:58:45 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.5160.1724990320540481001
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Aug 2024 20:58:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P4FmbdF4;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2050b059357so11361665ad.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Aug 2024 20:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724990320; x=1725595120; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JvS4l4aCvgSVq+azmTpQtGxtscrtF1z6muIydSLX9cU=;
        b=P4FmbdF4wJpZx9aKi/AeHXXBHF2TyXskGyEDxu7GRwWluOp4rqdU8Y+Jt8Xzl1aZ4H
         pE6DwydRIhT5hmaX5rtV+/BvJchU6HviAF+nQozsubsn9NRYY86Ot6/UddwtE3Wrw7f1
         xNRA1MzBfiomRUiDjlXDkrmiTrReBMm+17PrtJzXjAIVxFiRtruWmQYOnOpJ6RBzCHnC
         BDZvuiLrriRCiLXE5evxAMLZyWeqw+LjujgqcD6xNgekLVdJLuZMQm8y6+PN8fmVNKKL
         Er7n5vtUTGmTW5FeC/tu/fXBCQqLs3xnIkZBlM4Ip8WcdOEhULFgrxXXGTRSUe+qhT2P
         4MUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724990320; x=1725595120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JvS4l4aCvgSVq+azmTpQtGxtscrtF1z6muIydSLX9cU=;
        b=cU//vIOa1K8qABywKWBXBBftAm/DmM1Ip0D7q7BufY8w8W7al+ABIf/2O8LKbX55X4
         R4klzgW44Oj8xaNqmO1fKEBj/qDbceCm5MmMYeUqOagho4FAc7FnLG1Y7Qel6WKJWEpV
         BgT6Le944+DB2k8Aoz/KAUjVGX9Mc+dTTXzpcV8aWLH1P8ZJknm7uYYQx4GPAK5pSZkA
         cRxgQc6Q2guLEmGdLEDMZf+QktXgOjh8cV3CF+1QG68Er21cJsNiRzkw22HjH22F4C0t
         S7EFQE8I68YUzA7FMJNmPUzA5xP8ULeQskcXiKbg0Oe7iFwwUWv8wszgxN85Tl0/sNDP
         fRHQ==
X-Gm-Message-State: AOJu0YxF03pT8fKZQWhsu72k6dG13jtqfIHs29jSB2mXB+U2YBo/jJ/D
	geiZvQyV96/cKxwSkMdiOKn0/+lfSvQ4T2h1nF+rNX17eR2vYKERM7oWphSP
X-Google-Smtp-Source: AGHT+IH69jrmy6o2gdTiQLhfMn34fe0c1Q+0wC/3immOdED9sb3mK18wa+E0MxT7l8b6W5NACXvxOw==
X-Received: by 2002:a17:902:dac5:b0:203:95eb:380 with SMTP id d9443c01a7336-2050c5255d5mr56991185ad.64.1724990319794;
        Thu, 29 Aug 2024 20:58:39 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:9d80:4380::2696])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2052919afb2sm2705035ad.3.2024.08.29.20.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 20:58:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 8/8] mpd: Upgrade to 0.23.15+git
Date: Thu, 29 Aug 2024 20:58:27 -0700
Message-ID: <20240830035827.406391-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240830035827.406391-1-raj.khem@gmail.com>
References: <20240830035827.406391-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 Aug 2024 03:58:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112047

Drop uneeded patch

ver 0.23.15 (2023/12/20)
* decoder
  - ffmpeg: fix build failure with FFmpeg 6.1
* output
  - alsa: limit buffer time to 2 seconds

Use latest master for fmt 11.x fixes

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...tch-src_decoder_plugins_FfmpegIo.cxx.patch | 26 -------------------
 .../{mpd_0.23.14.bb => mpd_0.23.15.bb}        | 11 +++++---
 2 files changed, 8 insertions(+), 29 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/musicpd/mpd/0001-patch-src_decoder_plugins_FfmpegIo.cxx.patch
 rename meta-multimedia/recipes-multimedia/musicpd/{mpd_0.23.14.bb => mpd_0.23.15.bb} (96%)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd/0001-patch-src_decoder_plugins_FfmpegIo.cxx.patch b/meta-multimedia/recipes-multimedia/musicpd/mpd/0001-patch-src_decoder_plugins_FfmpegIo.cxx.patch
deleted file mode 100644
index b2dea331ef..0000000000
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd/0001-patch-src_decoder_plugins_FfmpegIo.cxx.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From e62fd0eefe8b475e70d87a673a7216aac3bb622f Mon Sep 17 00:00:00 2001
-From: Markus Volk <f_l_k@t-online.de>
-Date: Mon, 20 Nov 2023 17:49:59 +0100
-Subject: [PATCH] patch src_decoder_plugins_FfmpegIo.cxx
-
-Signed-off-by: Markus Volk <f_l_k@t-online.de>
-Upstream-Status: Pending [https://github.com/MusicPlayerDaemon/MPD/issues/1898]
----
- src/decoder/plugins/FfmpegIo.cxx | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/decoder/plugins/FfmpegIo.cxx b/src/decoder/plugins/FfmpegIo.cxx
-index 572f1a86a..3e2347fec 100644
---- a/src/decoder/plugins/FfmpegIo.cxx
-+++ b/src/decoder/plugins/FfmpegIo.cxx
-@@ -25,6 +25,7 @@
- #include "input/InputStream.hxx"
- 
- extern "C" {
-+#include <libavutil/error.h>
- #include <libavutil/mem.h>
- }
- 
--- 
-2.42.0
-
diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.14.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.15.bb
similarity index 96%
rename from meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.14.bb
rename to meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.15.bb
index 33155da7d2..f066c405f1 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.14.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.15.bb
@@ -18,14 +18,19 @@ DEPENDS += " \
     fmt \
 "
 
+PV .= "+git"
 SRC_URI = "git://github.com/MusicPlayerDaemon/MPD;branch=master;protocol=https \
-           file://0001-patch-src_decoder_plugins_FfmpegIo.cxx.patch \
            file://mpd.conf.in \
            "
-SRCREV = "feac1a3f56591ccfb00870aba66c9ac3abac4773"
+SRCREV = "965c466e9bda262790e76edd5272e9e74b407ff3"
 S = "${WORKDIR}/git"
 
-EXTRA_OEMESON += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '-Dsystemd=enabled -Dsystemd_system_unit_dir=${systemd_system_unitdir} -Dsystemd_user_unit_dir=${systemd_system_unitdir}', '-Dsystemd=disabled', d)}"
+EXTRA_OEMESON += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '-Dsystemd=enabled -Dsystemd_system_unit_dir=${systemd_system_unitdir} -Dsystemd_user_unit_dir=${systemd_system_unitdir}', '-Dsystemd=disabled', d)} \
+    -Dadplug=disabled \
+    -Dsndio=disabled \
+    -Dshine=disabled \
+    -Dtremor=disabled \
+"
 
 PACKAGECONFIG ??= "${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "commercial", "aac", "", d)} \
                    alsa ao bzip2 daemon \

