Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58151C3DA62
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 09:03:05 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.33834.1721034182437917523
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jul 2024 02:03:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hbOCT/GR;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1721034182; x=1752570182;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=odroB5j/pG/BPa52YggFtNtMxybvWHL2fMD9x7Wuq8c=;
  b=hbOCT/GRi1PtVy9+zhn8tVvI2jeH072oW4Uq+Kbn2JKoYoKWlkEzn2qq
   DCgnmq3m3QorS3wfp92MYFVvhzoZHPOJEWSz1nPiyG0PTCPf8o77oXlQ8
   ksxvHfWZOCLFlWJyKbfvSASrO42EhX393votorbHLrfURpPlAXnZQiyBg
   MjsLkcsEEQrmhJKJK9MZNs9Apr9swV3MTxLDb9UCK4nh7IFDHuurJSCMc
   HxjGW19xELHcxumqjQ4uavzwCFitceS181xhiaWsy4df3MGEfwrfUzus5
   ns2PR+BV59xzhZnm2yiSfZ6ezs9aGV4ycAU0N9s7Oe/B2qrYSJ+1iZslQ
   A==;
X-IronPort-AV: E=McAfee;i="6700,10204,11133"; a="167046019"
X-IronPort-AV: E=Sophos;i="6.09,209,1716217200"; 
   d="scan'208";a="167046019"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2024 18:02:59 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id CD162CD6DE
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:57 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 22532CFB6D
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:57 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9AF7220071A38
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:56 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4AEE01A000D;
	Mon, 15 Jul 2024 17:02:56 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 22/38] python3-pdm-backend: upgrade 2.3.1 -> 2.3.2
Date: Mon, 15 Jul 2024 17:02:15 +0800
Message-Id: <1721034151-540-22-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1721034151-540-1-git-send-email-wangmy@fujitsu.com>
References: <1721034151-540-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28530.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28530.006
X-TMASE-Result: 10--1.178600-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mr0uu9IYFQ6w7fUZT83lbkECeD
	TrBKyoxE+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74Cu2GmdldmiUGAN6i+va16uaRF
	wDs8G7THi8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFAQn3SUpA4spUsb/UcGiQgF6GT
	+B0YFNoCbF6jprUE3/uyTvaUguztc/N2Tayt/lOHH35E0YIA61vWXxy0pj25Vg/+S1KIKbCOx9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 09:03:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111349

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Detect src layout only if it exists and included by build config
- Use compatible is_relative_to for Python 3.8

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-pdm-backend_2.3.1.bb => python3-pdm-backend_2.3.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pdm-backend_2.3.1.bb => python3-pdm-backend_2.3.2.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-pdm-backend_2.3.1.bb b/meta-python/recipes-devtools/python/python3-pdm-backend_2.3.2.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-pdm-backend_2.3.1.bb
rename to meta-python/recipes-devtools/python/python3-pdm-backend_2.3.2.bb
index 554b6e8c9..bdc9384f6 100644
--- a/meta-python/recipes-devtools/python/python3-pdm-backend_2.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pdm-backend_2.3.2.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4a564297b3c5b629a528b92fd8ff61ea"
 
-SRC_URI[sha256sum] = "c03cfb3a803325c049b57ba2502b409479ebb22b6a4ee3746c1f688b939764e8"
+SRC_URI[sha256sum] = "b0c47e6a5f6bd7b0e2263eede0e6b2cf164a83ade81b7e73dc10f8254f60b828"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


