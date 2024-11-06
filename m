Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE90DD29F98
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 06:31:23 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.40026.1730874675772138845
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 22:31:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MxyDFvvy;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1730874676; x=1762410676;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=48KWaaMo/0FvueTZEr0Y1TpVatJB8jT5CluLEltTndc=;
  b=MxyDFvvyIPC/TlIyAob/h6YriaBo3soxSd+OG3ipDRGZdSPWQkYaJU9F
   m/95RNKVNIqMzTYyF1W8eMudOgQF40+67KKUd9zzInALJJr/d5S3Lzrq3
   Nyo/tqoBXB1EdUeM3KpUujvx7tijaAfkOmpmKwZrJjD/NYYcBphbSbabH
   w+/qB1olQ4sWUMGGn4go/MXKtexXZBbMryC/DxXjts/j2aIDlF0UcSeKI
   R/y1RydJwJvldQyAfLVfE0s9t2XXBWT4caBrdQKVXtaf40ciIkHb3WKKW
   tXvLWPQFp9e++M0C/tR0hGNiOYMMzBIm9NL/4oSfSXbJmrnT32LmlYAJR
   g==;
X-CSE-ConnectionGUID: X+Cu1RUDQVGjHkh6p4/Miw==
X-CSE-MsgGUID: zjyx8s0NQdW4TRj/0gGDoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="179274340"
X-IronPort-AV: E=Sophos;i="6.11,262,1725289200"; 
   d="scan'208";a="179274340"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 15:31:14 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 5D43FDF23F
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:11 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 94BEAD5B3A
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:10 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1EF586B5E9
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:10 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C1E941A000A;
	Wed,  6 Nov 2024 14:31:09 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 10/46] libvpx: upgrade 1.14.1 -> 1.15.0
Date: Wed,  6 Nov 2024 14:30:24 +0800
Message-Id: <1730874660-2364-10-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
References: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28778.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28778.005
X-TMASE-Result: 10-2.560400-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yTo39wOA02LhTJDl9FKHbrlgDeovr2tertMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNK0+leiJxLlcbTwzYj2zQurRPJs/q8vyU+Hv
	2UJ08907/5j56PnN5eoAy6p60ZV62fJ5/bZ6npdjiRhduhvElsm3DH6nl/Hrn+S+QppG/d8m/Be
	s0Q9oDkNLcEjhMQHJbvvuRwJxFjR9wMUTQb5GOJpJ0LWZSqoSt5w7zIrx5CvTJkvqldOd4LZz99
	QqaCT7q7H2fVekOqwmYL1KImKhq1ZuOe7yPCBvAf2OJxbAVgHQ+kK598Yf3Mg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Nov 2024 06:31:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113695

From: Wang Mingyu <wangmy@fujitsu.com>

libvpx-configure-support-blank-prefix.patch
refreshed for 1.15.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libvpx/libvpx-configure-support-blank-prefix.patch    | 8 ++++----
 .../webm/{libvpx_1.14.1.bb => libvpx_1.15.0.bb}           | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-multimedia/webm/{libvpx_1.14.1.bb => libvpx_1.15.0.bb} (96%)

diff --git a/meta-oe/recipes-multimedia/webm/libvpx/libvpx-configure-support-blank-prefix.patch b/meta-oe/recipes-multimedia/webm/libvpx/libvpx-configure-support-blank-prefix.patch
index bd3d69788..04c4804c0 100644
--- a/meta-oe/recipes-multimedia/webm/libvpx/libvpx-configure-support-blank-prefix.patch
+++ b/meta-oe/recipes-multimedia/webm/libvpx/libvpx-configure-support-blank-prefix.patch
@@ -1,4 +1,4 @@
-From 1bbbf27a23c91dcc271b773a97153063461b986d Mon Sep 17 00:00:00 2001
+From c71898649e300d7e5700cd247d7ae994c7faa406 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Tue, 16 Aug 2011 16:04:35 +0200
 Subject: [PATCH] Upstream: not yet
@@ -11,10 +11,10 @@ Upstream-Status: Pending
  1 file changed, 16 insertions(+), 4 deletions(-)
 
 diff --git a/build/make/configure.sh b/build/make/configure.sh
-index 93643f3de..e84198200 100644
+index 8220d5cbe..923daf8bc 100644
 --- a/build/make/configure.sh
 +++ b/build/make/configure.sh
-@@ -692,6 +692,8 @@ process_common_cmdline() {
+@@ -699,6 +699,8 @@ process_common_cmdline() {
          ;;
        --prefix=*)
          prefix="${optval}"
@@ -23,7 +23,7 @@ index 93643f3de..e84198200 100644
          ;;
        --libdir=*)
          libdir="${optval}"
-@@ -721,13 +723,23 @@ process_cmdline() {
+@@ -728,13 +730,23 @@ process_cmdline() {
  }
  
  post_process_common_cmdline() {
diff --git a/meta-oe/recipes-multimedia/webm/libvpx_1.14.1.bb b/meta-oe/recipes-multimedia/webm/libvpx_1.15.0.bb
similarity index 96%
rename from meta-oe/recipes-multimedia/webm/libvpx_1.14.1.bb
rename to meta-oe/recipes-multimedia/webm/libvpx_1.15.0.bb
index f32c7842c..b336a70da 100644
--- a/meta-oe/recipes-multimedia/webm/libvpx_1.14.1.bb
+++ b/meta-oe/recipes-multimedia/webm/libvpx_1.15.0.bb
@@ -7,7 +7,7 @@ LICENSE = "BSD-3-Clause"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d5b04755015be901744a78cc30d390d4"
 
-SRCREV = "12f3a2ac603e8f10742105519e0cd03c3b8f71dd"
+SRCREV = "9f9b7e9ba2eb9d01640a9e69a3d655866265cf7f"
 SRC_URI += "git://chromium.googlesource.com/webm/libvpx;protocol=https;branch=main \
            file://libvpx-configure-support-blank-prefix.patch \
            "
-- 
2.34.1


