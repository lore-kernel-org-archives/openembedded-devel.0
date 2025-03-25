Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90929C369A7
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 09:02:30 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.61529.1742893337675740995
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Mar 2025 02:02:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=s2CsPctM;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1742893340; x=1774429340;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=4fveazwLZAuP1m6xRPHGMz7Dod5CoqgqlKn47+AJFxk=;
  b=s2CsPctMmjsVbB7Tkn8TD5uWn61L0yRXqpC9WaAvvsLuaetxAlRvR7gr
   qUlCcIi8J5DwgDvaH+cWaAHwIQqQEhSRWDvfEWUgeBAKOnc/0OpEYQuZI
   ndDbGX7KWd8nVZghLHcg8Zjt4ZyF197JG+hHNoxT+ov7IqM9knVH2uQo2
   F9Ggq+I2+u4fmEO1ZnKW5BKaVmdZ2iPq7QRNT1X57V/VLYoeKAX8lMM1g
   o30ii2iOm0l2BTH8Pn3/QVPeR/vgK9m7UGf0iypRLYCSw29ympgbldtMd
   qeGnPSZ69cZ8MyIogNNnHdqNlhq1FO/PYMVj+f27AtWQBER17WWN6afS0
   w==;
X-CSE-ConnectionGUID: hJ5Ahb8wSj6bet3SZhvfzQ==
X-CSE-MsgGUID: DUtQhjnBSDiHFS3kGP2lFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="194223145"
X-IronPort-AV: E=Sophos;i="6.14,274,1736780400"; 
   d="scan'208";a="194223145"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 18:02:19 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 628AC194E6
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:16 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 1C798D50E2
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:16 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 552BE1A009B;
	Tue, 25 Mar 2025 17:02:14 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 16/45] libspelling: upgrade 0.4.6 -> 0.4.7
Date: Tue, 25 Mar 2025 17:01:23 +0800
Message-Id: <1742893312-3809-16-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
References: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 09:02:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116244

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Fix a potential assertion failure in B+Tree item removal
- Translation updates
- Improve detection of asynchronous fragment cancellation to break out
  of long-running spellchecking.
- Fix Rust example and documentation links.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libspelling/{libspelling_0.4.6.bb => libspelling_0.4.7.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/libspelling/{libspelling_0.4.6.bb => libspelling_0.4.7.bb} (85%)

diff --git a/meta-gnome/recipes-gnome/libspelling/libspelling_0.4.6.bb b/meta-gnome/recipes-gnome/libspelling/libspelling_0.4.7.bb
similarity index 85%
rename from meta-gnome/recipes-gnome/libspelling/libspelling_0.4.6.bb
rename to meta-gnome/recipes-gnome/libspelling/libspelling_0.4.7.bb
index b19c5f51e0..38476a6787 100644
--- a/meta-gnome/recipes-gnome/libspelling/libspelling_0.4.6.bb
+++ b/meta-gnome/recipes-gnome/libspelling/libspelling_0.4.7.bb
@@ -16,4 +16,4 @@ GIDOCGEN_MESON_OPTION = 'docs'
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[sysprof] = "-Dsysprof=true,-Dsysprof=false,sysprof"
 
-SRC_URI[archive.sha256sum] = "3248a9b5336ea2f727d2db912d2f0083accc0505ce707679b3d9b8266c0101f5"
+SRC_URI[archive.sha256sum] = "42f130f295f5addb6e9e8e74ccfbb709794bd2dfd021293e2875b9481bbd4e88"
-- 
2.43.0


