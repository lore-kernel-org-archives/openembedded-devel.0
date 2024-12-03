Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86788E69E9F
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 00:16:59 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.8200.1733185009630796787
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Dec 2024 16:16:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cT0Sorvi;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1733185010; x=1764721010;
  h=from:to:cc:subject:date:message-id;
  bh=H9EsFzMYBgfWKo93qUXqhQ4PnR7NmddE2CLxlYaWNF8=;
  b=cT0SorvikvInRFhIKNwZKzcVR2g3IEGV8h86y5vaPDp099YIcGNxS2u1
   +1LS96FKVKtwIxwLb6Z+4gYjNYaZkALdDIWFncUBk86fre+0D00rwScPC
   ENaNkH/l943YGOIz3H3/25JPVfgTnmZEAn3ZoIfKXdASyUKxMk3wxrTkB
   n4FeRj7TmVCHVuHuKaagTudJXFcP0EYoO3UQ2Eozp9khCofmCZK2Hg4O2
   9WHYAdQOLA0IiKRzfZITJZeDLafLQGVgmUIb5QQLR1CK4bJsM0GRP0fGv
   +zV8NWvrF9V1884/KLgqxnmnqPICChSVfZA3zX9m9Qrl0TJRFLCLHdam3
   g==;
X-CSE-ConnectionGUID: wYU50wxLQwWEtlM4kNeqyg==
X-CSE-MsgGUID: ilr4/L+0TAa0rrysNxWEWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="182351502"
X-IronPort-AV: E=Sophos;i="6.12,203,1728918000"; 
   d="scan'208";a="182351502"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 09:16:48 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 1AC7BD4808
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:16:45 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id E1DABD73CD
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:16:44 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6AAF220071A06
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:16:44 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D28091A0003;
	Tue,  3 Dec 2024 08:16:43 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 01/34] adw-gtk3: upgrade 5.5 -> 5.6
Date: Tue,  3 Dec 2024 08:16:06 +0800
Message-Id: <1733184999-27041-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28834.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28834.003
X-TMASE-Result: 10--0.939500-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrMVx/3ZYby7/IgofMgahPrdwA
	ehlkrLPujDVMw6TJvuET8ltSZlOY+QDNPxu11HXjP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW6pByRBJ91zJDrmb2Z4b9ZL3PhwfmFb3pieAiCmPx4NwGmRqNBHmBveafSbrzwSjfwqtq
	5d3cxkNeIO6TEncJzHlQmjx3dEuxWXXecZd4HmphI8wP6Ln0r+OwyO/4/lK8iyK5h1ZcqFRvoyP
	6mbRVsieYW6jKM3JPwxplFLc4e+CoJXtKB2OUbbU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Dec 2024 00:16:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114143

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Remove some legacy stuff and more
- Add link to accent-color-change shell script

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../gnome-themes/{adw-gtk3_5.5.bb => adw-gtk3_5.6.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-gnome/gnome-themes/{adw-gtk3_5.5.bb => adw-gtk3_5.6.bb} (88%)

diff --git a/meta-oe/recipes-gnome/gnome-themes/adw-gtk3_5.5.bb b/meta-oe/recipes-gnome/gnome-themes/adw-gtk3_5.6.bb
similarity index 88%
rename from meta-oe/recipes-gnome/gnome-themes/adw-gtk3_5.5.bb
rename to meta-oe/recipes-gnome/gnome-themes/adw-gtk3_5.6.bb
index 2f1e80abea..c128e41561 100644
--- a/meta-oe/recipes-gnome/gnome-themes/adw-gtk3_5.5.bb
+++ b/meta-oe/recipes-gnome/gnome-themes/adw-gtk3_5.6.bb
@@ -11,6 +11,6 @@ inherit meson
 SRC_URI = "git://github.com/lassekongo83/adw-gtk3.git;protocol=https;branch=main"
 
 S = "${WORKDIR}/git"
-SRCREV = "385a900628644dc81fa4942ac848a765229be93a"
+SRCREV = "a88950d8d66308606a6cbb0cfece91376213ad2d"
 
 FILES:${PN} = "${datadir}/themes"
-- 
2.34.1


