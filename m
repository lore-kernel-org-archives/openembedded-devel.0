Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A61DC369CA
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 09:02:43 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.14613.1744794152284666272
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Apr 2025 02:02:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QLgRW5fe;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744794153; x=1776330153;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=kAONChcDAbYva5OnnmBrMcK8P4tQFGI3dBvXCQ1v+0U=;
  b=QLgRW5feVKkbdtlKPmryCmQSsaaeMHJpKz3B9tIB/GZWzC1FaySwFTVV
   ueUlW0+gSKvNHgWtG8OiXdd5MDTsWTvvLSIIDu3Zj1XDOZIBbdKRWl36Q
   UD+WUywh/kjIzfMxCz8BABtCuUKthCeRIjjh8WeUZQxHBtHSiO6/EUzZS
   OAy01FuVA6QQPDC5gdWwgPGhH4vdn7Ba2wuXpOaZ40gmYK6ILoFqPsmQC
   PNnrLOQFLxiaKw8zVD6MoHB/Bm75YxsouiBbs0g+VDct0KYFLndC95jmp
   lYDmoL6qQQ4cMDPIZevWt3VPIOWSx0FzUzFaJjgj0AtI9KwdTzJxviPZ/
   w==;
X-CSE-ConnectionGUID: l1s+5ZXWQKieoPvhE9+Jcg==
X-CSE-MsgGUID: tvMXvVVYQ4SV8ibq80lJvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="196966144"
X-IronPort-AV: E=Sophos;i="6.15,215,1739804400"; 
   d="scan'208";a="196966144"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 18:02:30 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 65297D4C2B
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 18:02:28 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 25239D6FE5
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 18:02:28 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id AD0B71A0078;
	Wed, 16 Apr 2025 17:02:27 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 12/31] nlohmann-json: upgrade 3.11.3 -> 3.12.0
Date: Wed, 16 Apr 2025 17:01:57 +0800
Message-Id: <1744794136-908-12-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1744794136-908-1-git-send-email-wangmy@fujitsu.com>
References: <1744794136-908-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 09:02:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116884

From: Wang Mingyu <wangmy@fujitsu.com>

License-Updata: Copyright year updated to 2025

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{nlohmann-json_3.11.3.bb => nlohmann-json_3.12.0.bb}  | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-devtools/nlohmann-json/{nlohmann-json_3.11.3.bb => nlohmann-json_3.12.0.bb} (84%)

diff --git a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.11.3.bb b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.12.0.bb
similarity index 84%
rename from meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.11.3.bb
rename to meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.12.0.bb
index 194e80546e..340b314925 100644
--- a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.11.3.bb
+++ b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.12.0.bb
@@ -2,16 +2,16 @@ SUMMARY = "JSON for modern C++"
 HOMEPAGE = "https://nlohmann.github.io/json/"
 SECTION = "libs"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.MIT;md5=f969127d7b7ed0a8a63c2bbeae002588"
+LIC_FILES_CHKSUM = "file://LICENSE.MIT;md5=3b489645de9825cca5beeb9a7e18b6eb"
 
 CVE_PRODUCT = "json-for-modern-cpp"
 
-SRC_URI = "git://github.com/nlohmann/json.git;branch=develop;protocol=https \
+SRC_URI = "git://github.com/nlohmann/json.git;branch=master;protocol=https;tag=v${PV} \
            git://github.com/nlohmann/json_test_data.git;destsuffix=git/json_test_data;name=json-test-data;branch=master;protocol=https \
            file://run-ptest \
-"
+           "
 
-SRCREV = "9cca280a4d0ccf0c08f47a99aa71d1b0e52f8d03"
+SRCREV = "55f93686c01528224f448c19128836e7df245f72"
 SRCREV_json-test-data = "a1375cea09d27cc1c4cadb8d00470375b421ac37"
 
 SRCREV_FORMAT .= "_json-test-data"
-- 
2.43.0


