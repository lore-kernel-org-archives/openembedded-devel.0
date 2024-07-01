Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F646C3065D
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 06:44:33 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.13840.1719816258167615010
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Jun 2024 23:44:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=T4QOlgP8;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719816264; x=1751352264;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=KSUVePyK8vmoPovc5EKOu+X/0u96NDr4/0hzJJ91GJE=;
  b=T4QOlgP858fdiTQzLO7I6ERkmx9sZc1ixxvwmN2zb1pXJVFVHxdCCZj3
   qIZjxln1ftK4kFwWUDqGrnROTVPuHTB4Ti55FubNhfB1esvXz8Bf/P/mc
   D/01NUnjq9Q1qgItSRU3iPK3w8HNfhsGaJlLCebjqm1lLidP2GKv48cBE
   ITSwiwWMRbEkh3+KOXvb5C3plkevnwI32V1QqAYRCGuR3b1GxFIpA22nl
   olXpyBGq4uJJ3XoG3MmRJiArVJcLp6Zmj0qaGoE9yooiyvwaFL8gM3DJk
   dJz7PW8C/vKcCrP+MVttyXKTbXwPmg4DB8+c2vfv8B8CgDzSughUNzADo
   Q==;
X-IronPort-AV: E=McAfee;i="6700,10204,11119"; a="165494079"
X-IronPort-AV: E=Sophos;i="6.09,175,1716217200"; 
   d="scan'208";a="165494079"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2024 15:44:23 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id A1EC3C68E5
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Jul 2024 15:44:20 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id D7686CF7D2
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Jul 2024 15:44:19 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6F96120071A33
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Jul 2024 15:44:19 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 208321A000C;
	Mon,  1 Jul 2024 14:44:19 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 21/25] python3-rapidjson: upgrade 1.17 -> 1.18
Date: Mon,  1 Jul 2024 14:43:58 +0800
Message-Id: <1719816242-11839-21-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719816242-11839-1-git-send-email-wangmy@fujitsu.com>
References: <1719816242-11839-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28494.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28494.005
X-TMASE-Result: 10--3.830300-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrkYC3rjkUXRKc2kGz0N2bplfW
	IQC27i4v4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat054xHfiujuTbed1vZ
	7s3YIVDI6NmtdFz2VVLkiP4bPM1nkr78SC5iivxwURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO36CZ
	XLlV1mSZniAASJ56C54LPpMdDlzasAa1+2qklpDHh0kkSABH0fFRo7NRQ4Cm359p8/cgvxkfczS
	Vfj91lBxCQ2cJzCOICoxkKoCrlZLfIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Jul 2024 06:44:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111188

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Expose PEP-484 typing stubs, thanks to Rodion Kosianenko and GoodWasHere

License-Update: Copyright year updated to 1.18

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-rapidjson_1.17.bb => python3-rapidjson_1.18.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-rapidjson_1.17.bb => python3-rapidjson_1.18.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-rapidjson_1.17.bb b/meta-python/recipes-devtools/python/python3-rapidjson_1.18.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-rapidjson_1.17.bb
rename to meta-python/recipes-devtools/python/python3-rapidjson_1.18.bb
index d7a56b051..9ca1e826d 100644
--- a/meta-python/recipes-devtools/python/python3-rapidjson_1.17.bb
+++ b/meta-python/recipes-devtools/python/python3-rapidjson_1.18.bb
@@ -2,9 +2,9 @@ SUMMARY = "Python wrapper around rapidjson"
 HOMEPAGE = "https://github.com/python-rapidjson/python-rapidjson"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=4daf3929156304df67003c33274a98bd"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6fe0b2465366662d7cfa6793ccbab563"
 
-SRC_URI[sha256sum] = "95a111da29d996af8549f8b32ec701dab3af2ab7c6cd9c79540391ecb05f20c8"
+SRC_URI[sha256sum] = "09a5c362e2fec2a41b53e79e88bd8f0704447cb67c1c89a59e3092ccb4a30355"
 
 # Inheriting ptest provides functionality for packaging and installing runtime tests for this recipe
 inherit setuptools3 pypi ptest
-- 
2.34.1


