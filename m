Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4334C3DA70
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 09:03:05 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.33823.1721034173910166008
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jul 2024 02:03:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=sdJx9wHQ;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1721034181; x=1752570181;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=a6OLLd0u4wLj4BKgXZMlBUfLC+EjcTYYt88/bi2RkR4=;
  b=sdJx9wHQfu97kWdDE4Bjk07Z9bhRnFiWud8Pc7lSuWz/ilAlhgC5z80D
   OepOoUThGnS9PYuCOD8rApC8jfnlHiuhHcjvH4vgX3mL3YMB7PtVXnxRh
   pgoUSafvh41vAr7MDTFGHJIibVMvQf+32OTjmYOVRIU2m+1NHkTwBrTN3
   iOm6piKhNyvM5ILuF9iad5AKQrewtXw6gcDQO5+zSrd94nhLAg8Za6wXg
   419V4kSIX5aoYuviVX0ih7nhzSX366ldrkSTluq42KD+iEmloqEr5iE/+
   1aZs9Vman83H7mQAV0wnUgaVlL8StjsLV36fkb+SDi30hpeNh5EKvb5qI
   A==;
X-IronPort-AV: E=McAfee;i="6700,10204,11133"; a="146374031"
X-IronPort-AV: E=Sophos;i="6.09,209,1716217200"; 
   d="scan'208";a="146374031"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2024 18:02:59 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 79AA7D4240
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:57 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id C4CB3BF3C1
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:56 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4AB0420071A38
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:56 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 175481A000E;
	Mon, 15 Jul 2024 17:02:56 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 21/38] python3-oletools: upgrade 0.60.1 -> 0.60.2
Date: Mon, 15 Jul 2024 17:02:14 +0800
Message-Id: <1721034151-540-21-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1721034151-540-1-git-send-email-wangmy@fujitsu.com>
References: <1721034151-540-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28530.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28530.006
X-TMASE-Result: 10-1.907500-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrrOCEGIPhtwi4mfZGgSa8srqQ
	ldU8NEzpURHZXpMPIvkNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl5GUF3NhJu3ixTi
	f1XSWQbUxGTAHTmrty3dNoXv6UJm+f0iF5TZPPO+eAiCmPx4NwGmRqNBHmBvepuP9zg477pEqtq
	5d3cxkNe2VNuufHW17WQZZfeNh2a+2CUV39N7XRPEc1dWpPLRXkH34NFn1DKdSw2ZU6uZ45XrHz
	tHhEWCS0Yw4NER7ZLBrxHWXQfzRXOjgMZI4KJ30U8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 09:03:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111341

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- fixed a bug in open_slk
- fixed a bug due to new PROJECTCOMPATVERSION record in dir stream
- oleobj: fixed SyntaxError with Python 3.12
- rtfobj: fixed SyntaxError with Python 3.12
- clsid: added CLSIDs for MSI, Zed
- ftguess: added MSI, PNG and OneNote formats
- pyxswf: fixed python 3.12 compatibility
- setup/requirements: allow pyparsing 3 to solve install issues

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-oletools_0.60.1.bb => python3-oletools_0.60.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-oletools_0.60.1.bb => python3-oletools_0.60.2.bb} (56%)

diff --git a/meta-python/recipes-devtools/python/python3-oletools_0.60.1.bb b/meta-python/recipes-devtools/python/python3-oletools_0.60.2.bb
similarity index 56%
rename from meta-python/recipes-devtools/python/python3-oletools_0.60.1.bb
rename to meta-python/recipes-devtools/python/python3-oletools_0.60.2.bb
index fbb7955d6..162ebcab2 100644
--- a/meta-python/recipes-devtools/python/python3-oletools_0.60.1.bb
+++ b/meta-python/recipes-devtools/python/python3-oletools_0.60.2.bb
@@ -1,9 +1,9 @@
 SUMMARY = "Python tools to analyze security characteristics of MS Office and OLE files"
 HOMEPAGE = "https://github.com/decalage2/olefile"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=d7dd4b0d1f7153322a546e89b5a0a632"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=181754d317256f1b037529d3e994e1b4"
 
-SRC_URI[sha256sum] = "67a796da4c4b8e2feb9a6b2495bef8798a3323a75512de4e5669d9dc9d1fae31"
+SRC_URI[sha256sum] = "ad452099f4695ffd8855113f453348200d195ee9fa341a09e197d66ee7e0b2c3"
 
 inherit pypi setuptools3
 
-- 
2.34.1


