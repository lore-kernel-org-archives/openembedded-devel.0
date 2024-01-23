Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4C0AC46CD2
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 01:02:44 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.503.1705971762307737223
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jan 2024 17:02:42 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="126330482"
X-IronPort-AV: E=Sophos;i="6.05,212,1701097200"; 
   d="scan'208";a="126330482"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 10:02:40 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id C62D850978
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:02:37 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id DB1DDD8ADE
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:02:36 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6F5C3228842
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:02:36 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id EAE3F1A006A;
	Tue, 23 Jan 2024 09:02:34 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libvpx: upgrade 1.13.1 -> 1.14.0
Date: Tue, 23 Jan 2024 09:01:20 +0800
Message-Id: <1705971680-24604-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28136.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28136.003
X-TMASE-Result: 10--1.093400-10.000000
X-TMASE-MatchedRID: vQr1bp/0ccWjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyuGKb+4D/nz9ZgU
	Ly4zAbFBZZ1LvVb67BUKVHmngcHCMIZR1P7T3ayizYK5U+QI3O5VxJia/7DuCB//bz4/xYKAAu0
	C/xvh/Si1h3Ci3ttLrSYncnepQiU+onNjsGlUfuZURfNbW2avkNG3Y6ijqBt345VTlAPU31c2a9
	PYsG8JkIPKDFjgHKqOsF1Xtx7p+0Y6f5uXwWArBjiEPRj9j9rvH4pppXAAbjeur1HD2qZWmBv/r
	jinePEHoZPdZvRT/MeKMFGuL/CzIRYIZmHJt4vkA9lly13c/gHVBDonH99+VmAN6i+va16u0yOP
	Bv1B9XYILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q0rT6V6InEuVxtPDNiPbNC6tE8mz+ry/JT4e/Z
	QnTz3TpF+zAANQJy4Lmth8cTQ473lRxm3A2wKuhRFJJyf5BJe3QfwsVk0UbvqwGfCk7KUs6HAkF
	T34d/rOY3XPdukcH5vbiUNf8WFih0bnVQLLcYzg43ZeuPhGBfD1D2/L+fM7Pb8m76HgVrbIyDTv
	Zx/lkZP4PeEfLJFw4geppQyntVe0v8srR3gjfRl7+AkHjVJOxuqkzsKv5+9ftwZ3X11IV0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 01:02:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108385

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
  Fix to missing prototypes from the rtcd header.
  Fix to segfault when total size is enlarged but width is smaller.
  Fix to the build for arm64ec using MSVC.
  Fix to copy BLOCK_8X8's mi to PICK_MODE_CONTEXT::mic.
  Fix to -Wshadow warnings.
  Fix to heap overflow in vpx_get4x4sse_cs_neon.
  Fix to buffer overrun in highbd Neon subpel variance filters.
  Added bitexact encode test script.
  Fix to -Wl,-z,defs with Clang's sanitizers.
  Fix to decoder stability after error & continued decoding.
  Fix to mismatch of VP9 encode with NEON intrinsics with C only version.
  Fix to Arm64 MSVC compile vpx_highbd_fdct4x4_neon.
  Fix to fragments count before use.
  Fix to a case where target bandwidth is 0 for SVC.
  Fix mask in vp9_quantize_avx2,highbd_get_max_lane_eob.
  Fix to int overflow in vp9_calc_pframe_target_size_one_pass_cbr.
  Fix to integer overflow in vp8,ratectrl.c.
  Fix to integer overflow in vp9 svc.
  Fix to avg_frame_bandwidth overflow.
  Fix to per frame qp for temporal layers.
  Fix to unsigned integer overflow in sse computation.
  Fix to uninitialized mesh feature for BEST mode.
  Fix to overflow in highbd temporal_filter.
  Fix to unaligned loads w/w==4 in vpx_convolve_copy_neon.
  Skip arm64_neon.h workaround w/VS >= 2019.
  Fix to c vs avx mismatch of diamond_search_sad().
  Fix to c vs intrinsic mismatch of vpx_hadamard_32x32() function.
  Fix to a bug in vpx_hadamard_32x32_neon().
  Fix to Clang -Wunreachable-code-aggressive warnings.
  Fix to a bug in vpx_highbd_hadamard_32x32_neon().
  Fix to -Wunreachable-code in mfqe_partition.
  Force mode search on 64x64 if no mode is selected.
  Fix to ubsan failure caused by left shift of negative.
  Fix to integer overflow in calc_pframe_target_size.
  Fix to float-cast-overflow in vp8_change_config().
  Fix to a null ptr before use.
  Conditionally skip using inter frames in speed features.
  Remove invalid reference frames.
  Disable intra mode search speed features conditionally.
  Set nonrd keyframe under dynamic change of deadline for rtc.
  Fix to scaled reference offsets.
  Set skip_recode=0 in nonrd_pick_sb_modes.
  Fix to an edge case when downsizing to one.
  Fix to a bug in frame scaling.
  Fix to pred buffer stride.
  Fix to a bug in simple motion search.
  Update frame size in actual encoding.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libvpx/libvpx-configure-support-blank-prefix.patch | 10 ++++------
 .../webm/{libvpx_1.13.1.bb => libvpx_1.14.0.bb}        |  2 +-
 2 files changed, 5 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-multimedia/webm/{libvpx_1.13.1.bb => libvpx_1.14.0.bb} (96%)

diff --git a/meta-oe/recipes-multimedia/webm/libvpx/libvpx-configure-support-blank-prefix.patch b/meta-oe/recipes-multimedia/webm/libvpx/libvpx-configure-support-blank-prefix.patch
index e0fd4fea1..3a1d6832c 100644
--- a/meta-oe/recipes-multimedia/webm/libvpx/libvpx-configure-support-blank-prefix.patch
+++ b/meta-oe/recipes-multimedia/webm/libvpx/libvpx-configure-support-blank-prefix.patch
@@ -1,4 +1,4 @@
-From dc0a5c3d2dd4e79d12a150a246a95c4dc88326f1 Mon Sep 17 00:00:00 2001
+From 2829e6998b7595dd2108c1497fdd02485ef99e2c Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Tue, 16 Aug 2011 16:04:35 +0200
 Subject: [PATCH] Upstream: not yet
@@ -6,16 +6,14 @@ Subject: [PATCH] Upstream: not yet
 Fix configure to accept "--prefix=" (a blank prefix).
 
 ---
-Upstream-Status: Pending
-
  build/make/configure.sh | 20 ++++++++++++++++----
  1 file changed, 16 insertions(+), 4 deletions(-)
 
 diff --git a/build/make/configure.sh b/build/make/configure.sh
-index 007e020..04d5cbf 100644
+index b645a666f..0b99a8b38 100644
 --- a/build/make/configure.sh
 +++ b/build/make/configure.sh
-@@ -581,6 +581,8 @@ process_common_cmdline() {
+@@ -658,6 +658,8 @@ process_common_cmdline() {
          ;;
        --prefix=*)
          prefix="${optval}"
@@ -24,7 +22,7 @@ index 007e020..04d5cbf 100644
          ;;
        --libdir=*)
          libdir="${optval}"
-@@ -614,13 +616,23 @@ process_cmdline() {
+@@ -687,13 +689,23 @@ process_cmdline() {
  }
  
  post_process_common_cmdline() {
diff --git a/meta-oe/recipes-multimedia/webm/libvpx_1.13.1.bb b/meta-oe/recipes-multimedia/webm/libvpx_1.14.0.bb
similarity index 96%
rename from meta-oe/recipes-multimedia/webm/libvpx_1.13.1.bb
rename to meta-oe/recipes-multimedia/webm/libvpx_1.14.0.bb
index 1354e2eb9..b4d49842e 100644
--- a/meta-oe/recipes-multimedia/webm/libvpx_1.13.1.bb
+++ b/meta-oe/recipes-multimedia/webm/libvpx_1.14.0.bb
@@ -7,7 +7,7 @@ LICENSE = "BSD-3-Clause"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d5b04755015be901744a78cc30d390d4"
 
-SRCREV = "10b9492dcf05b652e2e4b370e205bd605d421972"
+SRCREV = "602e2e8979d111b02c959470da5322797dd96a19"
 SRC_URI += "git://chromium.googlesource.com/webm/libvpx;protocol=https;branch=main \
            file://libvpx-configure-support-blank-prefix.patch \
            "
-- 
2.34.1


