Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AD38C7EE45
	for <webhook@archiver.kernel.org>; Mon,  5 Jun 2023 07:53:31 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.2110.1685951605228143629
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Jun 2023 00:53:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="119509700"
X-IronPort-AV: E=Sophos;i="6.00,217,1681138800"; 
   d="scan'208";a="119509700"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 16:53:29 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 4E3BAD29E1
	for <openembedded-devel@lists.openembedded.org>; Mon,  5 Jun 2023 16:53:26 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7D5A2BF3C7
	for <openembedded-devel@lists.openembedded.org>; Mon,  5 Jun 2023 16:53:25 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 962D32FC85E5;
	Mon,  5 Jun 2023 16:53:24 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-cachecontrol: upgrade 0.12.12 -> 0.13.0
Date: Mon,  5 Jun 2023 15:53:02 +0800
Message-Id: <1685951589-29920-11-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1685951589-29920-1-git-send-email-wangmy@fujitsu.com>
References: <1685951589-29920-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27672.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27672.004
X-TMASE-Result: 10-3.215900-10.000000
X-TMASE-MatchedRID: jrsYt7uzg+ujz0nOeth/yUIIxwDaU5mrTfK5j0EZbyv+a1TrNm8OEaB8
	tGwEqygaYUa+SrEsUW8VRtiR7ShXyLBAQLqGlKivP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW6vBQc3bCgEsO8j2/Qpcz485gZGm/RVVHG5x7uAXGEprcEXY503qgABUJ52LFhfM6sEpx
	CpEUSzUtoivA+ZaB6pLmth8cTQ473lRxm3A2wKuhRFJJyf5BJe3QfwsVk0Ubv+efAnnZBiL6nKA
	IYoU8L4GpSqmHnDzGRmZoq8Wz/YXeDOIM3vH0ZAk7Sd7N3gVddziy9nnP5kiNqrbcjEoh/xo2ST
	Qjxwanv5UhUvdJOK8q5jtrIRvwOJ67VfbWhBF/vyDBYNCJzj6s+YAJ5mo7zlOKgonZY9TFMtLgA
	Q4uO3AA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Jun 2023 07:53:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103117

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
    Fix #292: disuse HTTPResponse.strict
    fix: double reading error on urllib3 2.0
    Packaging the tests, or not
    Add type annotations
    Use Python's unittest mock
    feat: remove compat module
    tests: Support python 3.11
    fix: use pytest native method name
    Remove use of utcnow
    Release 0.13.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...cachecontrol_0.12.12.bb => python3-cachecontrol_0.13.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cachecontrol_0.12.12.bb => python3-cachecontrol_0.13.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-cachecontrol_0.12.12.bb b/meta-python/recipes-devtools/python/python3-cachecontrol_0.13.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-cachecontrol_0.12.12.bb
rename to meta-python/recipes-devtools/python/python3-cachecontrol_0.13.0.bb
index 8f7185b8f5..e4e3c49988 100644
--- a/meta-python/recipes-devtools/python/python3-cachecontrol_0.12.12.bb
+++ b/meta-python/recipes-devtools/python/python3-cachecontrol_0.13.0.bb
@@ -1,13 +1,13 @@
 SUMMARY = "httplib2 caching for requests"
 HOMEPAGE = "https://pypi.org/project/CacheControl/"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=12;endline=12;md5=942a721dac34d073453642ffe5fcf546"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=12;endline=12;md5=e2fd6ddcf506e08972d5ba4b93c0022e"
 
 # On PyPi, this is "CacheControl", rather than "cachecontrol", so we need to
 # override PYPI_PACKAGE so fetch succeeds.
 PYPI_PACKAGE = "CacheControl"
 
-SRC_URI[sha256sum] = "9c2e5208ea76ebd9921176569743ddf6d7f3bb4188dbf61806f0f8fc48ecad38"
+SRC_URI[sha256sum] = "fd3fd2cb0ca66b9a6c1d56cc9709e7e49c63dbd19b1b1bcbd8d3f94cedfe8ce5"
 
 inherit pypi setuptools3
 
-- 
2.34.1


