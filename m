Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 851E4D4400C
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 09:30:16 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.37263.1731922210075530382
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Nov 2024 01:30:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=FEpkYpgZ;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1731922211; x=1763458211;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ns1a3kVDaCTya3soM8Dy6uNLt3iUgW42tiaLCGP+vOQ=;
  b=FEpkYpgZv+FNuH90J3bdGemiYm49sCWmR/MiY2tPVSPM9MxeTfRmDVnU
   SqpbO698q+Itqg5cWiU9k0GQRTLMxSmhNFpuNsUtvqm8Ky5AEpAADV1jR
   EhFhNRn8iNlOg4te9rEWg2dBm/37GCM3suXxCIoq8ZvNjB76h+oo376eC
   GFGiYqrdYsVkN5V09FiIb4u0p1Cg2Vwmm8Vs1E804QyoS2j31BNMZDN2q
   i9yZFG0DzBa6APRLoymYgwFBaQjw9eGZ/CUw9mjv4rCirmrszW0R4w79n
   fz7diWIu4gABiKCv9wEuLkqVG84MyhB8Cvb3m1vPokHqvpfXf478eokBU
   g==;
X-CSE-ConnectionGUID: 12USIb8GRYeqYeqT8ZJf9Q==
X-CSE-MsgGUID: pv/A9NsfTDqHQ9XaCtZsbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="183056063"
X-IronPort-AV: E=Sophos;i="6.12,163,1728918000"; 
   d="scan'208";a="183056063"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 18:30:08 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2E886DBB89
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:06 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id BE63FBDC8F
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:05 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 58B7321FD4B
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:05 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 08DC71A000B;
	Mon, 18 Nov 2024 17:30:04 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 06/32] lvm2: upgrade 2.03.27 -> 2.03.28
Date: Mon, 18 Nov 2024 17:29:29 +0800
Message-Id: <1731922195-5266-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1731922195-5266-1-git-send-email-wangmy@fujitsu.com>
References: <1731922195-5266-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28804.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28804.006
X-TMASE-Result: 10-1.382700-10.000000
X-TMASE-MatchedRID: QR1SVCCbVGSjz0nOeth/yUIIxwDaU5mr2+EDPw+8xreu9yzHHu0ZibpY
	cE2YBNVCv9puliu25mAR/FE0Q+BiT2s0SgWtnXgnupDIC9422DrYUDvAr2Y/11gLks93sG9t0ox
	ZFJOWTqSIi0Yt2qmJZYYP06URIjNd0iM+Nv6ic2v8dMpK2wMYwkc1DwKoQo7YwLkNMQzGl5B+Kr
	WCPbERP+CvRZnq77Klc6n4reyclFYR3RjJbq0tuZ4CIKY/Hg3AaZGo0EeYG96m4/3ODjvukSq2r
	l3dzGQ1DBbGvtcMofwi/Qg5auswbgtjmyN2dk7lgvx1OFL0IzPVSaqmtJvC15Yb3rBEA68A5qkj
	H/1LVGiENIxUVd6wh+TsYLI1qQ1BCxwv6sMPs0odJuEZuYbKVcUkrvIudlEZl07dDrsiYvyCLhF
	TP3QRDAbYwClu/qh3
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 09:30:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113872

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Use radix_tree to lookup for UUID within committed metadata.
- Use radix_tree to lookup LV list entry within VG struct.
- Introduce setting config/validate_metadata = full | none.
- Restore fs resize call for lvresize -r on the same size LV (2.03.17).
- Correct off-by-one devicesfile backup counting.
- Replace use of dm_hash with radix_tree for lv names and uuids.
- Refactor vg_validate with uniq_insert and better use of CPU caches.
- Add radix_tree_uniq_insert.
- Update DM cache when taking next VG lock instead of dropping it.
- Generate json string id only for json reporting.
- For vgsummary use new API call dm_config_parse_only_section().
- Use radix_tree for PV names mapping.
- Split check_lv_segment into separate _in/complete_vg variant.
- Use find_lv instead of find_lv_in_vg when possible.
- Do a mirror fixup only when mirrors with logs are imported.
- Add faster crc32 calculation from zlib code for x86_64.
- Fall back to direct zeroing if BLKZEROOUT fails during new LV initialization.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/lvm2/lvm2.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index b46ef2570..0fab88f39 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -18,9 +18,9 @@ SRC_URI = "git://sourceware.org/git/lvm2.git;branch=main \
            file://0001-include-libgen.h-for-basename.patch \
            "
 
-SRCREV = "207990a8770208151b2f39b51526580a9dca24c4"
+SRCREV = "f87a6ad6d6f7cde0170fd479a45ee5b0a1c63d52"
 S = "${WORKDIR}/git"
-PV = "2.03.27"
+PV = "2.03.28"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\_\d+)+)"
 
-- 
2.34.1


