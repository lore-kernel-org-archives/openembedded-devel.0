Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72E35C55180
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 21:45:56 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13605.1785620751338620488
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Aug 2026 14:45:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Y60/XdfT;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38e69bdb0fcso1510369a91.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 14:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785620751; x=1786225551; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JciVVQLH3CxwDVi9QyZYITPHrN+Pgd9yENDoCkd5N/c=;
        b=Y60/XdfTohGgsYISCZ0Jo3O9Hf5/FtF43R/M1ikAk3cbzuMZxJaH4d3xa86tZX+Ome
         sygN8MDckxcxNGUqrwbb05eJloECb7r44r30gNWUFjl2zXH0VwC/MSGoPtuOSadb5g1N
         WEPipzNoQkrxMxrnHCttDfViqUAZDn/VU4WNOWKjOSV8xHWxkzVqwbiql5rQXx4p06gk
         2jLOcyTT7yGpAR4pefsj7QtvJvizf5mYY+HjH4mK6GSYMzUumylJ1YRVIpnJbec/cK95
         K/PyasWlv166x+IdsRK1X+Xj4+OghLlr4xhDh84hoJjq0KuTS8H5es56ev3c4p9hqfHf
         nBKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785620751; x=1786225551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JciVVQLH3CxwDVi9QyZYITPHrN+Pgd9yENDoCkd5N/c=;
        b=h2C7zlhLec2LLzgPaEFs+9RwYaZlfleHkJvpeRjhTvo+P0RfIQZm8PvmEGcg3Jj67B
         wag97wSG+Jfh/6eCF1OCvAj6eVQTPHZOvH/q8Nzd1sA2AWrbJTw3Q24YjxyWRBnkc7g8
         ljMC8NhYlXH9vTRmho1hX95k5Sr8jnZEam3s8JlPF8a2yUraeMWcOd6bFVkGuxUmjsxS
         GKJuU9ffe7i67ggThGXPuyRbAS9xt0BsXvTYCHP+iOt7NlTGMSOFSvfn9DvCn16ZVvEl
         du5ED+iWnMDcwNkj53gQW7tB3jnSd3QQWvS3RmU+IgzG3NSzCk9J62ZAyxRe5jFXbVfS
         RnHA==
X-Gm-Message-State: AOJu0YxQm0cPwlIdV2kbdIKzBd0UFBUrxMux0SVhwGhH2bcVduFke0Pf
	xOuFaopMOW9atXAZEeI/NpW4lzJA7FadJO/vbocaKAduwa5k9Xy27KyeAcDrHg==
X-Gm-Gg: AR+sD117RoNjuTfo/ry1hAfcNt7a5U5mJ+R11t5PvV/iH+E/jDgr5DUicshj7CxDPYq
	4tr5f5jNqYaNwFQrVgX0YdUI5vAhakqv4b/f/qvM3ABvE8imYwUUBHKyydqwf9kUnr6ic9sn+gq
	MP+MMdEp3Je8alb0pSjx8z7e0O0Wak7zY7u2YOXNMXXYWNMNpaXTkhnCr00wN8nKr1nQ4DZzMHi
	RF792Dxk7dQoLoTMAsbLsIrxYq55NZ93cE447FQPR3QSacGfi1XS2//fpHcnVkiCdHi7WXyLzAS
	cZ9c2HaKnvbDkOsVg2XhWGaRc63rPoLXRQrp9z4CuhNhj/TqRKkjMNOoi6br6z7RIEh6zHoZslv
	+B3N71GkmJs6tCxo9YSPwpOjjiP1nX6XjVA7C2AS1LBBDdcJuux8TMH6V5+6I2saLLs+QqxgytQ
	XTpSote54JBY1flobMYH4BtDNbUpoh/emYeycZ5K6qsvG/9g7sTJcvUUN3He5IBXhSHrgQBKzpc
	wXRaQrhN5u+NGSzoQGjMk03k3J7FJUlyKkFP6OzYSIUS3UqmTMud8IQemKgn1Wh1QeX3cFaZlEU
	tUkNIPvDDefVfEWnTHDz8gMf7c/kpgacT3zTqoMj5fIM7aBTlvFSmWSQGh8CtxeA+np1FyifK0S
	zsWILe30N7J2a
X-Received: by 2002:a17:90b:384f:b0:38c:a59b:5189 with SMTP id 98e67ed59e1d1-38fbc48f0d7mr4436219a91.15.1785620750607;
        Sat, 01 Aug 2026 14:45:50 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e5b0sm19105102eec.1.2026.08.01.14.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 14:45:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 22/31] tinycompress: upgrade 1.2.13 -> 1.2.16
Date: Sat,  1 Aug 2026 14:45:17 -0700
Message-ID: <20260801214526.788343-22-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260801214526.788343-1-khem.raj@oss.qualcomm.com>
References: <20260801214526.788343-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 21:45:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128639

Upstream changes (git log v1.2.13..v1.2.16):
 * 64-bit timestamp/hpointer support: compress_get_hpointer64,
   get_tstamp64 via SNDRV_COMPRESS_AVAIL64, clamp samples to UINT_MAX and
   return -ERANGE on overflow; update sound header to v0.4.0.
 * compress plugin ("mops") support: magic + compress_plugin_mops symbol
   lookup, improved hw-plugin protocol version check.
 * fcplay: decode the AAC header to set the correct codec format and fix
   next_track sequencing for gapless playback; misc fixes (include
   errno.h, avoid NULL string to printf).
 * include: install compress_ops.h as a public header.

Drop 0001-include-install-compress_ops.h-as-public-header.patch: that
change (moving compress_ops.h to nobase_include_HEADERS) was merged
upstream and is present in 1.2.16.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...tall-compress_ops.h-as-public-header.patch | 32 -------------------
 ...press_1.2.13.bb => tinycompress_1.2.16.bb} |  5 ++-
 2 files changed, 2 insertions(+), 35 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/tinycompress/tinycompress/0001-include-install-compress_ops.h-as-public-header.patch
 rename meta-multimedia/recipes-multimedia/tinycompress/{tinycompress_1.2.13.bb => tinycompress_1.2.16.bb} (69%)

diff --git a/meta-multimedia/recipes-multimedia/tinycompress/tinycompress/0001-include-install-compress_ops.h-as-public-header.patch b/meta-multimedia/recipes-multimedia/tinycompress/tinycompress/0001-include-install-compress_ops.h-as-public-header.patch
deleted file mode 100644
index 0bd70fa4d5..0000000000
--- a/meta-multimedia/recipes-multimedia/tinycompress/tinycompress/0001-include-install-compress_ops.h-as-public-header.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 2db4ee4ed5e12a48b1d195dab0f57b7106ff37c4 Mon Sep 17 00:00:00 2001
-From: Pratyush Meduri <mpratyus@qti.qualcomm.com>
-Date: Tue, 20 Jan 2026 14:47:27 +0530
-Subject: [PATCH] include: install compress_ops.h as public header
-
-Move tinycompress/compress_ops.h from noinst_HEADERS to
-nobase_include_HEADERS so it gets installed for users.
-
-Signed-off-by: Pratyush Meduri <mpratyus@qti.qualcomm.com>
-Upstream-Status: Submitted [https://github.com/alsa-project/tinycompress/pull/30]
----
- include/Makefile.am | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/include/Makefile.am b/include/Makefile.am
-index b12c2c5..15058a9 100644
---- a/include/Makefile.am
-+++ b/include/Makefile.am
-@@ -1,8 +1,8 @@
--nobase_include_HEADERS = tinycompress/tinycompress.h
-+nobase_include_HEADERS = tinycompress/tinycompress.h \
-+                         tinycompress/compress_ops.h
- 
- noinst_HEADERS = sound/compress_offload.h \
- 		 sound/compress_params.h \
- 		 tinycompress/version.h \
--		 tinycompress/compress_ops.h \
- 		 tinycompress/tinymp3.h \
- 		 tinycompress/tinywave.h
--- 
-2.34.1
-
diff --git a/meta-multimedia/recipes-multimedia/tinycompress/tinycompress_1.2.13.bb b/meta-multimedia/recipes-multimedia/tinycompress/tinycompress_1.2.16.bb
similarity index 69%
rename from meta-multimedia/recipes-multimedia/tinycompress/tinycompress_1.2.13.bb
rename to meta-multimedia/recipes-multimedia/tinycompress/tinycompress_1.2.16.bb
index b46f72f9da..50ebdd67ee 100644
--- a/meta-multimedia/recipes-multimedia/tinycompress/tinycompress_1.2.13.bb
+++ b/meta-multimedia/recipes-multimedia/tinycompress/tinycompress_1.2.16.bb
@@ -5,8 +5,7 @@ HOMEPAGE = "https://github.com/alsa-project/tinycompress"
 LICENSE = "BSD-3-Clause OR LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cf9105c1a2d4405cbe04bbe3367373a0"
 
-SRCREV = "ea5c7245beb0b6aec1565cfae0454d6ba374dfdd"
-SRC_URI = "git://github.com/alsa-project/tinycompress.git;branch=master;protocol=https;tag=v${PV} \
-           file://0001-include-install-compress_ops.h-as-public-header.patch"
+SRCREV = "6b064c5b614bde950560a345ca0702e76668bdab"
+SRC_URI = "git://github.com/alsa-project/tinycompress.git;branch=master;protocol=https;tag=v${PV}"
 
 inherit autotools pkgconfig

