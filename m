Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4DEEC27C5E
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 09:07:10 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.9835.1717664827128735766
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jun 2024 02:07:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=XEHxSKVy;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1717664827; x=1749200827;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=4i4/sbZDhLfr3KOEJeCr6S4bfmVecVrpOO6nfaDZoW0=;
  b=XEHxSKVyqO0GHeznljRQ6sesZZ6c0N6YUzodemp+ie0+L73OU4unMo6b
   u0QSUidk1SN+1FaFiDZIaku/wjFyJIqiCxPXgsJVLn6eD9+gMCk43xYW7
   p+ffHF7CfVEoKAfn+9YKcyyPv2a0vHXWpbHrX1/lUQHTkIXTigKSJ3ETQ
   8KSNWY7EU7HgQUbmvGkMs3uWYJRAa+7pnS0u/tBY57gnDUfJQb+N3bbQA
   O1CRy8Pn7KN2+XvacIDYwEiNRJhGW8votiMour+YvCjsKQON8zyvis5d4
   T14duteDbz5752OzfOTawY0f9UOL1RcNA+Erd7pqRutWORXh30hgGeSaF
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="162286276"
X-IronPort-AV: E=Sophos;i="6.08,218,1712588400"; 
   d="scan'208";a="162286276"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 18:07:04 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 609C4E42B0
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:07:02 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id A827ED3F03
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:07:01 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 403C2401D8
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:07:01 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E21231A000A;
	Thu,  6 Jun 2024 17:07:00 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 26/36] libvpx: upgrade 1.14.0 -> 1.14.1
Date: Thu,  6 Jun 2024 17:06:25 +0800
Message-Id: <1717664795-13902-26-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1717664795-13902-1-git-send-email-wangmy@fujitsu.com>
References: <1717664795-13902-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28434.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28434.006
X-TMASE-Result: 10--0.884500-10.000000
X-TMASE-MatchedRID: 19A9OAtP7iyjz0nOeth/yTo39wOA02LhpxAd6mi1Ga0lsQ9ktMX8f0aO
	P3/pkGG5b9Z0OmlAjEBrIfmKRz/YV2UqiBgJ+bf4KsurITpSv+ODnmblFLAswnsNrn7uTerKVBX
	EQns166k1aREYH6JAQJ78yzkQuqgQtK3ZODZ7+OsotYKdGcWqirob/eFhenJpfM6NDJOUwM71CT
	e/iI7r7oHA6IBd3vQsEFXw6GcXWc9oyFDbu56kFQPZZctd3P4BEITY2UGMiNwH8UzOewTxw+79D
	JRUi35pTQ0JkPG287/mn3xyPJAJorvUM1lvDMQ6lVHM/F6YkvSYkAyCbA7KV50C6WJNXTpiezJ3
	Mv1/YUvi8zVgXoAltsIJ+4gwXrEt33fj+sMArfOUZ3IP5ATaH9mvy1n0PCrJVaOVt7i5c9W4ci2
	/b8bkiuiYcz6RlurV3XwYNWQ1bSVOhTEnxRmQz8OZyhaYZKHeNYmpR5HNe8OberSr1tJbdv6/2/
	nZkihaOgB/fz3EXdcVKT0eFRmfDs4YhafCzgujIdY9jOi4lTI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Jun 2024 09:07:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110734

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
---
 .../libvpx/libvpx-configure-support-blank-prefix.patch    | 8 ++++----
 .../webm/{libvpx_1.14.0.bb => libvpx_1.14.1.bb}           | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-multimedia/webm/{libvpx_1.14.0.bb => libvpx_1.14.1.bb} (96%)

diff --git a/meta-oe/recipes-multimedia/webm/libvpx/libvpx-configure-support-blank-prefix.patch b/meta-oe/recipes-multimedia/webm/libvpx/libvpx-configure-support-blank-prefix.patch
index 463651aa4..bd3d69788 100644
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
index b4d49842e..f32c7842c 100644
--- a/meta-oe/recipes-multimedia/webm/libvpx_1.14.0.bb
+++ b/meta-oe/recipes-multimedia/webm/libvpx_1.14.1.bb
@@ -7,7 +7,7 @@ LICENSE = "BSD-3-Clause"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d5b04755015be901744a78cc30d390d4"
 
-SRCREV = "602e2e8979d111b02c959470da5322797dd96a19"
+SRCREV = "12f3a2ac603e8f10742105519e0cd03c3b8f71dd"
 SRC_URI += "git://chromium.googlesource.com/webm/libvpx;protocol=https;branch=main \
            file://libvpx-configure-support-blank-prefix.patch \
            "
-- 
2.34.1


