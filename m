Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACABCC27C78
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 09:07:00 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.9820.1717664811634325247
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jun 2024 02:06:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=USl89Vti;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1717664812; x=1749200812;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=pnuwQXMbIOZ/2eSrYcZomeqUEnofhhliDPC1UQakCLI=;
  b=USl89Vti1D5G1GXJc41xSZOSPiykNQ25pNltJB0MyKAoi2rvjEebEDQB
   XSC+kdXGRwT1AgVNtHxalKv4TkbuLILOx/OhGUsvdFDuqcJUl9YC4SfXh
   M4LDfE1XXxsrsehHacVUjIbUzb0cILLdMnR3fulVFbxidpI5tuh/D3ra2
   Nycp2R8u4qQ0LtCue0yMZFCYj6ePjERutrcXU+mdeNERiq+/SWwVoThaH
   DSLshBV03xL7FCdZiG3HkbeKXvosn+1KSll0iWYNPRAjQEi+a+K+4ScGY
   nFfhE4+dkXhxGJmkrTCdXzTMNEMFaqUwFA4hvkx/FQNhRUVx10SfEkhQf
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="150462568"
X-IronPort-AV: E=Sophos;i="6.08,218,1712588400"; 
   d="scan'208";a="150462568"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 18:06:50 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id E258BD63CC
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:06:48 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 304E2BF3D9
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:06:48 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id C04F520081323
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:06:47 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6DA311A000A;
	Thu,  6 Jun 2024 17:06:47 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 05/36] colord-native: upgrade 1.4.6 -> 1.4.7
Date: Thu,  6 Jun 2024 17:06:04 +0800
Message-Id: <1717664795-13902-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1717664795-13902-1-git-send-email-wangmy@fujitsu.com>
References: <1717664795-13902-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28434.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28434.006
X-TMASE-Result: 10--0.356500-10.000000
X-TMASE-MatchedRID: sujxEcxUy52jz0nOeth/yW03YawHJvPCnJdsOLB4zv4H4DTIEE89jFYU
	+1qwrZwQaUuJ07rkUQzmqbB2SfYgTUWNbZfbxvwGfCwgB7jBwkZh0Eb5uGGI1Lqln+jYe7Zh1r3
	Qk8f2AHaOlK3viUq7Ewkqgl/CBaHN5YVOgBQqdGnWX4GMszyWymo8zUxTJUAjqgN67rC7tupbvu
	5n+BQlRUd3JVSHt+1Yedu/gVuQyeBaQiLka9EcSk7nLUqYrlslFIuBIWrdOeO1eX0jEQ9c6o052
	PiV2j/nHH8BkCG8K5B3TaF7+lCZvhHyFkyp0mb56nHbeBu5Lnl9LQinZ4QefPcjNeVeWlqY+gtH
	j7OwNO2I3adjBtsMrDcBlXQKEp+qZBjRm4a5kX7Z6YvvF081+32hCppIWTnQ0gU4tVabZLlcheG
	sQGVgPfyKHgMOaCCgNTlYfPhKkTPuYksegv8lXfIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uAB
	Di47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Jun 2024 09:07:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110711

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Move-the-function-cd_icc_create_from_edid-to-avoid-u.patch
refreshed for 1.4.7

Changelog:
===========
- Add various hardenings to the systemd service
- Always close the ICC profile when loading fails
- Avoid destructing LCMS plugin twice with lcms 2.14
- Do not make state files executable in tmpfiles.d/colord.conf
- Fix a double free spotted by Coverity
- Fix an error check when parsing the DTP94 data
- Fix a -Wincompatible-pointer-types warning
- Fix potential crash when reading from broken Huey hardware
- Set FILE_OFFSET_BITS explicitly
- Use a 64-bit time_t
- Use thread context for Gamut Alarm codes

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...the-function-cd_icc_create_from_edid-to-avoid-u.patch | 9 +++------
 meta-oe/recipes-support/colord/colord.inc                | 4 ++--
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/meta-oe/recipes-support/colord/colord-native/0001-Move-the-function-cd_icc_create_from_edid-to-avoid-u.patch b/meta-oe/recipes-support/colord/colord-native/0001-Move-the-function-cd_icc_create_from_edid-to-avoid-u.patch
index aae2be8c1..a120b7311 100644
--- a/meta-oe/recipes-support/colord/colord-native/0001-Move-the-function-cd_icc_create_from_edid-to-avoid-u.patch
+++ b/meta-oe/recipes-support/colord/colord-native/0001-Move-the-function-cd_icc_create_from_edid-to-avoid-u.patch
@@ -1,4 +1,4 @@
-From cbb8f5c05fce1d56ae2e5fa9f57fc49c47bed5ab Mon Sep 17 00:00:00 2001
+From d16aed3118bee1e0a7d0bc9e0f34c427a405a6d8 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
 Date: Sun, 12 May 2019 21:58:02 +0200
 Subject: [PATCH] Move the function cd_icc_create_from_edid to avoid udev
@@ -89,10 +89,10 @@ index a5e2328..dec509a 100644
 +}
 +
 diff --git a/lib/colord/cd-icc.c b/lib/colord/cd-icc.c
-index 8beec43..398ff7a 100644
+index 3937d8a..daf6f4d 100644
 --- a/lib/colord/cd-icc.c
 +++ b/lib/colord/cd-icc.c
-@@ -3114,68 +3114,6 @@ cd_icc_create_default (CdIcc *icc, GError **error)
+@@ -3117,68 +3117,6 @@ cd_icc_create_default (CdIcc *icc, GError **error)
  	return cd_icc_create_default_full (icc, CD_ICC_LOAD_FLAGS_NONE, error);
  }
  
@@ -161,6 +161,3 @@ index 8beec43..398ff7a 100644
  /**
   * cd_icc_create_from_edid:
   * @icc: A valid #CdIcc
--- 
-2.20.1
-
diff --git a/meta-oe/recipes-support/colord/colord.inc b/meta-oe/recipes-support/colord/colord.inc
index 0ae1a30fe..cafbaaa69 100644
--- a/meta-oe/recipes-support/colord/colord.inc
+++ b/meta-oe/recipes-support/colord/colord.inc
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = " \
     file://meson.build;beginline=3;endline=3;md5=f42198707d793be58b274d34fd5238c3 \
 "
 
-PV = "1.4.6"
+PV = "1.4.7"
 SRC_URI = "https://www.freedesktop.org/software/colord/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "7407631a27bfe5d1b672e7ae42777001c105d860b7b7392283c8c6300de88e6f"
+SRC_URI[sha256sum] = "de02d9910634ae159547585cec414e450f711c27235453b4f9b38a9f2361a653"
 
-- 
2.34.1


