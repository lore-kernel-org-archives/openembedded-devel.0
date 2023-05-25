Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56D97C83005
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 06:56:37 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.6189.1684997791271623627
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 23:56:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="117813321"
X-IronPort-AV: E=Sophos;i="6.00,190,1681138800"; 
   d="scan'208";a="117813321"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2023 15:56:31 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 66E37C68E1
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 15:56:29 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id A36DED5E89
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 15:56:28 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1F92A2007CA80;
	Thu, 25 May 2023 15:56:28 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] mailcap: upgrade 2.1.53 -> 2.1.54
Date: Thu, 25 May 2023 14:56:15 +0800
Message-Id: <1684997777-2061-12-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1684997777-2061-1-git-send-email-wangmy@fujitsu.com>
References: <1684997777-2061-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27648.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27648.005
X-TMASE-Result: 10-0.104100-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrHlg673CD1YatJHvZvqDptP44
	pYPD16CL4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2WAN6i+va16u0p9
	DaZRzoN3J7QyCkL9GiIDYPhAGqvQ55UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO19R4
	Ss0oUmJzVVVIzEVTS+iJanM49B6cpZob+FnCI5V4LipUPt24ylCV/FPbWakPdCQFEYGUtH+TJ/T
	vL5StXm71AVtRE7YnPqxFwR5HZg9fIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 06:56:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102811

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- mime.types: Sync with IANA as of 2023-05-22
- typediff.py: remove unnecessary import

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../mailcap/{mailcap_2.1.53.bb => mailcap_2.1.54.bb}           | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-support/mailcap/{mailcap_2.1.53.bb => mailcap_2.1.54.bb} (89%)

diff --git a/meta-oe/recipes-support/mailcap/mailcap_2.1.53.bb b/meta-oe/recipes-support/mailcap/mailcap_2.1.54.bb
similarity index 89%
rename from meta-oe/recipes-support/mailcap/mailcap_2.1.53.bb
rename to meta-oe/recipes-support/mailcap/mailcap_2.1.54.bb
index 34588380a..8385b6354 100644
--- a/meta-oe/recipes-support/mailcap/mailcap_2.1.53.bb
+++ b/meta-oe/recipes-support/mailcap/mailcap_2.1.54.bb
@@ -18,8 +18,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8dce08227d135cfda1f19d4c0c6689de"
 
 SRC_URI = "https://releases.pagure.org/${BPN}/${BP}.tar.xz"
 
-SRC_URI[md5sum] = "ee02da867389d290923cc138487176f9"
-SRC_URI[sha256sum] = "5eea2ef17b304977ba3ecb87afad4319fa0440f825e4f6fba6e8fa2ffeb88785"
+SRC_URI[sha256sum] = "9a4032202fc0d2b0858f41b167389a9cfe52ac24ec282e6479b90765319de113"
 
 inherit update-alternatives
 
-- 
2.34.1


