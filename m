Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B195C197A0
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 08:18:46 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.2631.1700122716766548097
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Nov 2023 00:18:37 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="118690662"
X-IronPort-AV: E=Sophos;i="6.03,307,1694703600"; 
   d="scan'208";a="118690662"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2023 17:18:34 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8B66AD5026
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 17:18:32 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id D6D74F968
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 17:18:31 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1B33F40E91;
	Thu, 16 Nov 2023 17:18:30 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-google-api-python-client: upgrade 2.106.0 -> 2.108.0
Date: Thu, 16 Nov 2023 16:16:56 +0800
Message-Id: <1700122616-22134-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28000.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28000.003
X-TMASE-Result: 10--0.309300-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mr+KgiyLtJrSAwS+fKi1+IroIB
	CrHXdfvc4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2emHqf6ZGvCR1vZ
	7s3YIVDJ6eUBjjG/BIC5rYfHE0OO95UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO1FwN
	IqCPogbRpDS92omiP1QvEWlakG/UZD1Wow1J/713LMKsKkVJPAfE3d1vx2uFfZJekN4xk7sTajr
	vt64KbFdjTBCeg8dAwDTi9BLGCc2fIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 08:18:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106791

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://github.com/googleapis/google-api-python-client/blob/main/CHANGELOG.md

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...t_2.106.0.bb => python3-google-api-python-client_2.108.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.106.0.bb => python3-google-api-python-client_2.108.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.106.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.108.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_2.106.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.108.0.bb
index 476adc483..f8ccc9a68 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.106.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.108.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "f6a3862be2f6e5e0536d7bd47b5af3f24ac0b9147c76c830cafb3329d71d5724"
+SRC_URI[sha256sum] = "6396efca83185fb205c0abdbc1c2ee57b40475578c6af37f6d0e30a639aade99"
 
 inherit pypi setuptools3
 
-- 
2.34.1


