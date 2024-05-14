Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B344FC25B75
	for <webhook@archiver.kernel.org>; Tue, 14 May 2024 09:10:30 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.10783.1715677828800285236
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 May 2024 02:10:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=JMKaMkE3;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1715677829; x=1747213829;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=fzeNZ/zTkk/nPvhlMq6Kil6nvo9RrDuIa/V+ZF90EzA=;
  b=JMKaMkE3S965G1aqLIE/VZTOBgBLWBFpq62u/Z+wvvF5nUQVK9lgzuv5
   UAjMGiL+jCbyyoyiko3wt7r4n6jt36UyK3WNLid7ZEWP9SC5Q5lULmOJ0
   ccglnNGNvUwQDGpk5YjYQvo9J0xLx28ND4PT7pLXdHmVVJGLyS6JbPBEG
   qCDD9qEq0OJKRQw+1C3V91xB9jg/1YICyKkbOO9HWMYPtBW2gTukL1W3X
   G2ZIsniGFRQScG+howFwd+TfeNJD3scqBpGS4ltMKFVsrqcRVuxrQ8HXu
   cGix582pGFUSua3VrD1Lig1fiGAHCO6BWw5Ee3T/UgKKxE1zK+SFHQF8L
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="137077596"
X-IronPort-AV: E=Sophos;i="6.08,159,1712588400"; 
   d="scan'208";a="137077596"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 18:10:26 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 7E931DAE0A
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:24 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id AEE6DD968F
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:23 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 424C26BB7B
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:23 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E3BF91A000B;
	Tue, 14 May 2024 17:10:22 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 02/44] gnome-text-editor: upgrade 46.1 -> 46.3
Date: Tue, 14 May 2024 17:09:35 +0800
Message-Id: <1715677817-2223-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
References: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28384.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28384.006
X-TMASE-Result: 10-1.830400-10.000000
X-TMASE-MatchedRID: jrsYt7uzg+ujz0nOeth/yUIIxwDaU5mrTfK5j0EZbyv+Aw16GgqpOzNV
	+wj8Pzk/1QaUQIYsyVSMO9cHfks3t1mO/CNDCF8+JBa5/AMngr3UxCm0TmLrkN9RlPzeVuQQB4/
	DeyYgo7T7tBxFpWhrycYoh/qEF/tVoYY7KoErjW8ReM8i8p3vgHcF/0kiqyh4v8GEB7T13LobJA
	HWhH3kCq3IgbKqIDYDiExNx1Upv4Wo4n6H6zl8pp4CIKY/Hg3AaZGo0EeYG95UMLUJu4leYyq2r
	l3dzGQ1l6MT1L0fBiYp2Fq95NCcRub6E+yPZ4tjiAfmxP4Pdp7sUL7tUu0Ge2kDzKZSt5sAwLcm
	aa0MeTJ36l3hGagRLS187sh37B0FYltngPZ0gyBTyZ1y9sjWHZLqPOO5dObQxMzMgJrM/hR6Fi1
	pV3LGbw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 09:10:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110349

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fix a trivial build error when -Werror=implicit-function-declaration is
- specified.
- Fix an issue with cancellation of closing a page
- Try harder to ensure a buffer disposes associated resources when
  the page is closed.
- Translation updates

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{gnome-text-editor_46.1.bb => gnome-text-editor_46.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-text-editor/{gnome-text-editor_46.1.bb => gnome-text-editor_46.3.bb} (83%)

diff --git a/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_46.1.bb b/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_46.3.bb
similarity index 83%
rename from meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_46.1.bb
rename to meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_46.3.bb
index f37eb7195..1e3268238 100644
--- a/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_46.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_46.3.bb
@@ -18,7 +18,7 @@ inherit gnomebase gtk-icon-cache itstool gnome-help mime-xdg features_check
 
 REQUIRED_DISTRO_FEATURES = "opengl"
 
-SRC_URI[archive.sha256sum] = "8ebfa0bea12e75f5efeacc721be3b8ae65027b024aa81db9ecab8c312257a2eb"
+SRC_URI[archive.sha256sum] = "005b48104a909be66ae07448d2bc5706c7d113781057a24ff6da55bdf324c73d"
 
 FILES:${PN} += " \
     ${datadir}/metainfo \
-- 
2.34.1


