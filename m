Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 604D8C88CB9
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 01:41:03 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.3857.1686620460634530100
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jun 2023 18:41:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="99729198"
X-IronPort-AV: E=Sophos;i="6.00,238,1681138800"; 
   d="scan'208";a="99729198"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 10:40:59 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 216ECC6811
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 10:40:56 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5036D141A7
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 10:40:55 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id D1E7520074724;
	Tue, 13 Jun 2023 10:40:54 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pymisp: upgrade 2.4.171 -> 2.4.172
Date: Tue, 13 Jun 2023 09:40:16 +0800
Message-Id: <1686620422-29962-27-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1686620422-29962-1-git-send-email-wangmy@fujitsu.com>
References: <1686620422-29962-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27688.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27688.004
X-TMASE-Result: 10--1.959200-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrMCcAfUypiVi1FNn9j44/KHnK
	0ev1kiPR4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2WAN6i+va16ukWN
	Ccn0XQOLn22EcSrQBnaBl62lPHvgXFfViMFFmQDLdCok3ibXlQX0tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqtt/Pm09EvMc+6wZ8FlnC2euj190R/iHhh7WZJ+BJ5WUSmUpLaFUucyuONV
	HUULvWu3aHEDlRIP53KSL7BRD3oj43+Pj2eDw3THSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 01:41:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103245

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Update settings.default.py - tags not tag.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymisp_2.4.171.bb => python3-pymisp_2.4.172.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.171.bb => python3-pymisp_2.4.172.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.171.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.172.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.171.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.172.bb
index d2d9ed1fd..59ddac388 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.171.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.172.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
 SRC_URI = "git://github.com/MISP/PyMISP.git;protocol=https;branch=main"
-SRCREV = "5c56fccfafa9ef335b9300499d12633368889f55"
+SRCREV = "7d1d8b6f38f210b28934a206f9c1470542e9da7e"
 S = "${WORKDIR}/git"
 
 inherit python_poetry_core
-- 
2.34.1


