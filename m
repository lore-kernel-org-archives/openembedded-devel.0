Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB53FC05052
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 01:41:38 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.2757.1713318095802492978
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Apr 2024 18:41:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fBkd+3G2;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713318095; x=1744854095;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=LsQtDUudN+UgCqrhacNJQE5OFFroPXRpg4/1+Dr+pvU=;
  b=fBkd+3G2f0h/EgHMI+jTW4iavi1WCU+nHdvuy+vWy/iVccPnx+xE6Bz+
   yamisy60Sh3r/H7pDLkgG0RcizA7XbspDiyj92GM1xh2XkTj1w1Mk1jTp
   BKI/CXlccTxTZTmRYtmY+imgDSJJMexHqFCxllDPgfadZK8i24ssyytV2
   bdLuiRay+4WBp+ApzMVpsSiZciu5YHhsQ/pNrGYfzcGnWNZHsSd3MA1kh
   Ev3MGsNJrqxKsnpgQ7kDIl1piesTbKtg3c/tOYL9YldZQi5mEGn356gQY
   EK4/EJzWGyfLHMEVON5FBRCmgs0clIpMd8lNcecUNT35dGc+D//p1qrjy
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="143393393"
X-IronPort-AV: E=Sophos;i="6.07,207,1708354800"; 
   d="scan'208";a="143393393"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 10:41:33 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 78346E9604
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:31 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id B368943FE5
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:30 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id E9A05200932D3
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:29 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 958641A0002;
	Wed, 17 Apr 2024 09:41:29 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 24/49] python3-google-api-python-client: upgrade 2.124.0 -> 2.125.0
Date: Wed, 17 Apr 2024 09:40:36 +0800
Message-Id: <1713318061-17128-24-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
References: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28326.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28326.004
X-TMASE-Result: 10--1.526300-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mr+KgiyLtJrSCTxayZGvX2Dr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74BuTKBinxl/umAN6i+va16uBqd
	FRjHdIbhbJcQH3furV3k48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w7qJ/
	nMQpL2rE0dkgiSw/17BWhpjTJtZ0IFVY3jD7kI8FoSedi1ABoLM8CLPJFCVDRDb9S/zxGxkpesH
	D91sB7jcV8qdAiU+1aCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 01:41:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110011

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://github.com/googleapis/google-api-python-client/releases/tag/v2.125.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...t_2.124.0.bb => python3-google-api-python-client_2.125.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.124.0.bb => python3-google-api-python-client_2.125.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.124.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.125.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_2.124.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.125.0.bb
index 99b07d3e8..8abe4699e 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.124.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.125.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "f6d3258420f7c76b0f5266b5e402e6f804e30351b018a10083f4a46c3ec33773"
+SRC_URI[sha256sum] = "51a0385cff65ec135106e8be60ee7112557396dde5f44113ae23912baddda143"
 
 inherit pypi setuptools3
 
-- 
2.34.1


