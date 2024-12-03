Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7ED7E69EAC
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 00:16:59 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.8205.1733185017914802578
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Dec 2024 16:16:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=H0dH6waW;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1733185018; x=1764721018;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=GjrVqhiZXlOPl1ttoX3eT6bY4phx4UBGzvOlUKm+FRo=;
  b=H0dH6waWP5lBycubKh7iVzlMOuWrPTlTruLu+m7VENo1sbY5NFnpeQMi
   he59X9Z527CEaoQLy4X//oJNA3tRifucsccwUmJ42sN5FPwQusn00/HKw
   KPd8SHnRS8keI4a3H352vumdijrOwUZ0NCKNMRPH6ri48r6AqKEae58Hs
   liPIGQ0q584uF8xKIUj7FBtvTawNc7ZwMzf4E3lplb60eYGCZvv+oEWrr
   D4PDq/4VyGjvywsMkSkoOpnTNvDgDk2sKHuDmSfEKcN76ByWpc4OeN3Or
   8Fo4YO0lDxdgTeJXMjnNcUbU8IIwRO5fmOGIFXaaqS3WCOmW4N1Su4MZ+
   g==;
X-CSE-ConnectionGUID: hwu2NFXATNy6PBSbNVs+Vg==
X-CSE-MsgGUID: Rhmn9DukRxWuW0eIyCephQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="170725140"
X-IronPort-AV: E=Sophos;i="6.12,203,1728918000"; 
   d="scan'208";a="170725140"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 09:16:56 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id DAE2EC2262
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:16:53 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id B28CCD4BC2
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:16:53 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3E2A36CB26
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:16:53 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D340A1A0003;
	Tue,  3 Dec 2024 08:16:52 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-python] [PATCH 12/34] python3-aiohappyeyeballs: upgrade 2.4.3 -> 2.4.4
Date: Tue,  3 Dec 2024 08:16:17 +0800
Message-Id: <1733184999-27041-12-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1733184999-27041-1-git-send-email-wangmy@fujitsu.com>
References: <1733184999-27041-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28834.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28834.003
X-TMASE-Result: 10-1.053700-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yVVeGWZmxN2MVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJorNUVnqixiMOuce7gFxhKa2+OGVbYwYsiSdeYiTfKGnjo8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXKpYqLpyJXIM5o68nErsci8f/mIy8nfXVbRGN
	qapLP7UiLBTLPGcg55hdM6JVN3Zx9LcZCRuYaeNC1kCMXb8rmpDi/CTU4u3Pb+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Dec 2024 00:16:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114155

From: Wang Mingyu <wangmy@fujitsu.com>

Bugfix:
 Handle oserror on failure to close socket instead of raising indexerror

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...happyeyeballs_2.4.3.bb => python3-aiohappyeyeballs_2.4.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiohappyeyeballs_2.4.3.bb => python3-aiohappyeyeballs_2.4.4.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohappyeyeballs_2.4.3.bb b/meta-python/recipes-devtools/python/python3-aiohappyeyeballs_2.4.4.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-aiohappyeyeballs_2.4.3.bb
rename to meta-python/recipes-devtools/python/python3-aiohappyeyeballs_2.4.4.bb
index e06bd71789..ad48c5990c 100644
--- a/meta-python/recipes-devtools/python/python3-aiohappyeyeballs_2.4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohappyeyeballs_2.4.4.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/aio-libs/aiohappyeyeballs"
 LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fcf6b249c2641540219a727f35d8d2c2"
 
-SRC_URI[sha256sum] = "75cf88a15106a5002a8eb1dab212525c00d1f4c0fa96e551c9fbe6f09a621586"
+SRC_URI[sha256sum] = "5fdd7d87889c63183afc18ce9271f9b0a7d32c2303e394468dd45d514a757745"
 
 inherit pypi python_poetry_core
 
-- 
2.34.1


