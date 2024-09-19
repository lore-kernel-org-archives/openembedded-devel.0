Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F9A8CE8D4C
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 03:32:49 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.11431.1726716761383500340
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Sep 2024 20:32:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=oXU+D2V7;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1726716764; x=1758252764;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Yq0tBAzU8yvqtuRhtTAp2Amn96OQC85PZtHT/TuU6Uw=;
  b=oXU+D2V77kTo8zikmX2adeTswmmPkx2SuCUtI0bGj7CGTb25UyVxbECJ
   UUgLmS76ELBIoNqEJv9i5Sq+/26f0GFtnyKL6Jmdl3v9hbvOkCMyiDHEu
   gDLUrCVbHfm4n/zpm8EvVt0A0j2TgE9s0ZX0Frvclh5mkTR4dvjPfA6qg
   Zjgjw6fuHyhju5w4k5OSjQvzkZSR9DKmNYpT2fFGqcoh/c7u1s9l2Xn/7
   bwNJDKmuSf/wD0lTgdkSyytHKg+46co9EDCQE64Ghh0GzaPc1NnicWJa4
   4ZlqwOCEkD7nuQ919HXroMCNMOGN4EOTa4T5OKuRaq34/d6vglYzYsvEp
   A==;
X-CSE-ConnectionGUID: OGZ4T0wlRR2hj3T4uZ7X3w==
X-CSE-MsgGUID: XqhkJZAWSe+Ck5UrjfLntQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="174102963"
X-IronPort-AV: E=Sophos;i="6.10,240,1719846000"; 
   d="scan'208";a="174102963"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2024 12:32:42 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id D0766D4250
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:39 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2075FD7758
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:39 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id AEB2B2288D9
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:38 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5AE861A000A;
	Thu, 19 Sep 2024 11:32:38 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 27/28] tecla: upgrade 46.0 -> 47.0
Date: Thu, 19 Sep 2024 11:32:12 +0800
Message-Id: <1726716733-14548-27-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1726716733-14548-1-git-send-email-wangmy@fujitsu.com>
References: <1726716733-14548-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28672.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28672.004
X-TMASE-Result: 10--0.509700-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqzG5dXdQTj2OP/U
	w0uMxJP8G0Ejn/+VwCYyNJAGB7SC9AEukluQ8igG/HTKStsDGMJO5O4rW32RvJoeN8xuX4liIUt
	KH5AJM9ki+t+0AiFaYvL3NxFKQpq1/SgGb2/NGYdIcJTn2HkqsV1K32THEhCemyiLZetSf8nyb6
	HMFK1qe8gz2YRMI7vTJ0RPnyOnrZLL9rEn3SATnxscwThmqFzBe4tCi5kod6jx4Kz/Ogivqp64M
	YjXhqom+zH3CdOI1rM2onVnJLdVdHMzeM8VixN24RZBT4tZfr5Lv5Eyr/YIrqsDhztRXZ9Cm+LY
	9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 03:32:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112384

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Add --parent-handle command line option to integrate
  as a "modal dialog".
- Translation updates
- Set window icon

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-gnome/recipes-gnome/tecla/{tecla_46.0.bb => tecla_47.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/tecla/{tecla_46.0.bb => tecla_47.0.bb} (80%)

diff --git a/meta-gnome/recipes-gnome/tecla/tecla_46.0.bb b/meta-gnome/recipes-gnome/tecla/tecla_47.0.bb
similarity index 80%
rename from meta-gnome/recipes-gnome/tecla/tecla_46.0.bb
rename to meta-gnome/recipes-gnome/tecla/tecla_47.0.bb
index 62b3aa3e3..e430b167d 100644
--- a/meta-gnome/recipes-gnome/tecla/tecla_46.0.bb
+++ b/meta-gnome/recipes-gnome/tecla/tecla_47.0.bb
@@ -13,4 +13,4 @@ REQUIRED_DISTRO_FEATURES = "wayland"
 
 inherit gnomebase pkgconfig  features_check
 
-SRC_URI[archive.sha256sum] = "4a081eab867a5a8b09758991cad7645920f323aabca954408290fb6f44591b0f"
+SRC_URI[archive.sha256sum] = "0790b99ec29137a54b546c510661a99aa6f039c8d75f10c08e928682c0804fe5"
-- 
2.34.1


