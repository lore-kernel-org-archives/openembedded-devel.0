Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B521ED25030
	for <webhook@archiver.kernel.org>; Sun, 11 Jan 2026 07:36:24 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6658.1768116980258333242
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Jan 2026 23:36:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lHqBY1m+;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-81e98a1f55eso855522b3a.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 10 Jan 2026 23:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768116979; x=1768721779; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lHw58w5cTfOtN1zbrc2cIWlvO2aKZUVuesPDNMzpU0A=;
        b=lHqBY1m+0678YvV28yNV5r/BXKoJO84kT4mJ3Wf8Pdtno47O3n1CVBssl7JjVU5qOa
         5ixnNKFWMVxHecnaAlT5T4DZ3Q1z7jkYF+zMsFVT8smbYM7bXmwS8cOeJNQR7d5QAbap
         A7p/tpDC9ZFRPAINM5CJHxSv+zuX4zgDcZDb1JOpoGxi6HOPyvXDENu/hpq1l9OVSV65
         rz4Jib9BvmkSshi4ydLNBTsqgoiXIgctfuW+j/s7xDMkU46MXimHbDvp3CIShrrQE8i0
         9bW5RmN4ustbPsnAgRZHgtkn2YvLMLUNMBJUo1FSqti4BTD+qL/27TQW1Vk9j5hbhyvo
         6EJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768116979; x=1768721779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lHw58w5cTfOtN1zbrc2cIWlvO2aKZUVuesPDNMzpU0A=;
        b=eSZNsYkAgkd50HF1N9sQriMydJyar/OSelrIP5M4VGKCN+yc/CYCZ/MiSO4QkVwATj
         RPB42adbNosX49SRvQIcvkmY93KJcri8ufEnC0Y3krtOVKvWrEnr4H3gsasMeqwfcKQJ
         DLov9eB/GCJxhfrmJMCa0MqmYOf9sA1hqtwj4bbre45LIMWPE5coKWMY3VDZhvrSYf5b
         JZ7c3I3y53l1G8iFqu4JsCuEPRJsg5vZxwQgmdPl99FQWh17+c1+Uj7MQrwBWs5/ks5m
         vPwpJUy7vn6IzMjU+Wv4991CuAOFkYM1aFZlZccbe+6a30U1F0qKymY3RpbhjzxXGbiV
         mEMg==
X-Gm-Message-State: AOJu0Yx2T5FHX53eQyEMKIvUVELRzjWaIgjbEBnifDTVlblp/FEmc6PX
	sBXumfBchgm6j5TgpdxRar4pPzuhDralgkDLFi+5eAQn9dKluopVdZB5NnDjEA==
X-Gm-Gg: AY/fxX5WH2gOAngtOrRcMtqLmvlAv9WaOIlqn7dEhJe39rtVGMxvVfSfAMxWFciKmP7
	km/dTgQhzBYE6X0tRg2qr1pCZd004onYEnWS29PiaH9DK6FWkdX+w8FJ45n5SIJ6Ak0stX+hjYk
	smCTN2gHO3nAw8mStuMZtxmFXjackeFzeMOikNAHANgdqsu+uZtE7zi4dw/eiQJizbG7Wj1+dxn
	MWud/zFR4Ab9Q0YWBXIVlj7KXIM7m5QvKEbMU3B5sJ8wUo4gIyeEt6RK+ppVVdzwniHuX7O9LUe
	VLk4rLoCTWk4pv+bnpyVXKe6+2Wbj5UTECxagrAHvRTOfFqve2xBjzw8KC4T60d/OecnSfml60v
	h6uF2KAjcEb75CUa7caU637jdjiGVpR3ED9ham8iOm5yuHw7e2qiJqdY2W+MHMgYTPNe6zvtcfl
	mK4KpTplLx8zcmXvjbT82XEd8=
X-Google-Smtp-Source: AGHT+IGpxH4gOCW9QBzW/hHvPUXvF8UQIzxU/P7WNBgCFnc/NWPSrlJjC9Dnf7R51viNgV/VZ71hkw==
X-Received: by 2002:a05:6a20:3d86:b0:366:1a31:a70a with SMTP id adf61e73a8af0-3898f888af4mr13493436637.10.1768116979379;
        Sat, 10 Jan 2026 23:36:19 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.10])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cbfd27953sm14259545a12.11.2026.01.10.23.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jan 2026 23:36:19 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 2/3] libvpx: upgrade 1.14.0 -> 1.14.1
Date: Sun, 11 Jan 2026 20:36:06 +1300
Message-ID: <20260111073607.524248-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260111073607.524248-1-ankur.tyagi85@gmail.com>
References: <20260111073607.524248-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 11 Jan 2026 07:36:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123341

From: Wang Mingyu <wangmy@fujitsu.com>

libvpx-configure-support-blank-prefix.patch
refreshed for 1.14.1

Changelog:
============
- Improved the detection of compiler support for AArch64 extensions,
  particularly SVE.
- Added vpx_codec_get_global_headers() support for VP9.
- Added buffer bounds checks to vpx_writer and vpx_write_bit_buffer.
- Fix to GetSegmentationData() crash in aq_mode=0 for RTC rate control.
- Fix to alloc for row_base_thresh_freq_fac.
- Free row mt memory before freeing cpi->tile_data.
- Fix to buffer alloc for vp9_bitstream_worker_data.
- Fix to VP8 race issue for multi-thread with pnsr_calc.
- Fix to uv width/height in vp9_scale_and_extend_frame_ssse3.
- Fix to integer division by zero and overflow in calc_pframe_target_size().
- Fix to integer overflow in vpx_img_alloc() & vpx_img_wrap()(CVE-2024-5197).
- Fix to UBSan error in vp9_rc_update_framerate().
- Fix to UBSan errors in vp8_new_framerate().
- Fix to integer overflow in vp8 encodeframe.c.
- Handle EINTR from sem_wait().

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 911023b521bebcd7e4ee4bcb2eb97745c2349752)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libvpx/libvpx-configure-support-blank-prefix.patch    | 8 ++++----
 .../webm/{libvpx_1.14.0.bb => libvpx_1.14.1.bb}           | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-multimedia/webm/{libvpx_1.14.0.bb => libvpx_1.14.1.bb} (96%)

diff --git a/meta-oe/recipes-multimedia/webm/libvpx/libvpx-configure-support-blank-prefix.patch b/meta-oe/recipes-multimedia/webm/libvpx/libvpx-configure-support-blank-prefix.patch
index 463651aa4a..bd3d697885 100644
--- a/meta-oe/recipes-multimedia/webm/libvpx/libvpx-configure-support-blank-prefix.patch
+++ b/meta-oe/recipes-multimedia/webm/libvpx/libvpx-configure-support-blank-prefix.patch
@@ -1,4 +1,4 @@
-From 2829e6998b7595dd2108c1497fdd02485ef99e2c Mon Sep 17 00:00:00 2001
+From 1bbbf27a23c91dcc271b773a97153063461b986d Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Tue, 16 Aug 2011 16:04:35 +0200
 Subject: [PATCH] Upstream: not yet
@@ -11,10 +11,10 @@ Upstream-Status: Pending
  1 file changed, 16 insertions(+), 4 deletions(-)
 
 diff --git a/build/make/configure.sh b/build/make/configure.sh
-index b645a666f..0b99a8b38 100644
+index 93643f3de..e84198200 100644
 --- a/build/make/configure.sh
 +++ b/build/make/configure.sh
-@@ -658,6 +658,8 @@ process_common_cmdline() {
+@@ -692,6 +692,8 @@ process_common_cmdline() {
          ;;
        --prefix=*)
          prefix="${optval}"
@@ -23,7 +23,7 @@ index b645a666f..0b99a8b38 100644
          ;;
        --libdir=*)
          libdir="${optval}"
-@@ -687,13 +689,23 @@ process_cmdline() {
+@@ -721,13 +723,23 @@ process_cmdline() {
  }
  
  post_process_common_cmdline() {
diff --git a/meta-oe/recipes-multimedia/webm/libvpx_1.14.0.bb b/meta-oe/recipes-multimedia/webm/libvpx_1.14.1.bb
similarity index 96%
rename from meta-oe/recipes-multimedia/webm/libvpx_1.14.0.bb
rename to meta-oe/recipes-multimedia/webm/libvpx_1.14.1.bb
index b4d49842ea..f32c7842c3 100644
--- a/meta-oe/recipes-multimedia/webm/libvpx_1.14.0.bb
+++ b/meta-oe/recipes-multimedia/webm/libvpx_1.14.1.bb
@@ -7,7 +7,7 @@ LICENSE = "BSD-3-Clause"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d5b04755015be901744a78cc30d390d4"
 
-SRCREV = "602e2e8979d111b02c959470da5322797dd96a19"
+SRCREV = "12f3a2ac603e8f10742105519e0cd03c3b8f71dd"
 SRC_URI += "git://chromium.googlesource.com/webm/libvpx;protocol=https;branch=main \
            file://libvpx-configure-support-blank-prefix.patch \
            "

