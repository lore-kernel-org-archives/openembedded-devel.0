Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4656DC001DE
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 07:14:35 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.7470.1687850068489129204
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jun 2023 00:14:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="122377936"
X-IronPort-AV: E=Sophos;i="6.01,161,1684767600"; 
   d="scan'208";a="122377936"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 16:14:20 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 727A7C68E2
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jun 2023 16:14:17 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id B6D1ED3F13
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jun 2023 16:14:16 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id A946A88D20;
	Tue, 27 Jun 2023 16:14:15 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-google-api-python-client: upgrade 2.89.0 -> 2.90.0
Date: Tue, 27 Jun 2023 15:12:09 +0800
Message-Id: <1687849939-19941-10-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1687849939-19941-1-git-send-email-wangmy@fujitsu.com>
References: <1687849939-19941-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27716.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27716.005
X-TMASE-Result: 10-1.445100-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mr9pLnYtQ99xIwS+fKi1+IroIB
	CrHXdfvc4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat054xHfiujuTbedlNc
	WZ7137CiBkESMI05d4iiOf1NDnCI+rWL/xQJnm46eAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNaCHaLMe2Keu57XkF71+H63FsvPliSNYAiTTfkwY/Q1kIe1/cb7ecdRk32kTbuDuggar/
	GQ4X3RmHcjoV5i9yR8yYWSf3VH1cWOCjzW1o6/EU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jun 2023 07:14:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103614

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
https://github.com/googleapis/google-api-python-client/blob/main/CHANGELOG.md

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ent_2.89.0.bb => python3-google-api-python-client_2.90.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.89.0.bb => python3-google-api-python-client_2.90.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.89.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.90.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_2.89.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.90.0.bb
index a62d599137..7309431aea 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.89.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.90.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "0b0c9503df2da92692ffceee88423ca593cbf0b939d879e2c46fbdc1a39cf091"
+SRC_URI[sha256sum] = "cbcb3ba8be37c6806676a49df16ac412077e5e5dc7fa967941eff977b31fba03"
 
 inherit pypi setuptools3
 
-- 
2.34.1


