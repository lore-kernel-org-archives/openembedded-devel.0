Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDC73C3ABAA
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 08:49:43 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.35428.1745311775512011294
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Apr 2025 01:49:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=gP4YedSH;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1745311775; x=1776847775;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=tIQemGlTzgm8Q/WS+1sCG4GSS8f0SRNkwj/16aNDid8=;
  b=gP4YedSHpxtlun1dFSnqoSUsnJXM11IBdMTnWvLfbB6tHusjjDsV1bYr
   LB0TKqbrItimmvqTfoW27Bmkrn6HMdw979RZU41R4xPnonT3uIXBQ4EM/
   Xo+KxbRH4I2Sju8qatvdiSjYP7yMxQvpKGBWBzu53vyRL1jj1whdWqWjf
   28iXLprfNDYPBenIpGV5jz2lmHXxbU1m99A2qbHzJ5tLfNVAmm9cFJsrm
   0fHBND243XoBanHbE/F2zPnpM+nn0Huv5jB4R7D079F7MtZEOZl67DrFn
   Qe+EcDPkEqdQqq9vU5e/aav87pPdXOHOOTFQJKNB/fSnU7f3ZWsjm8gwH
   A==;
X-CSE-ConnectionGUID: eE0uJ0AwSs6VEprTvc36tQ==
X-CSE-MsgGUID: Z5375B3XSQSVmhceAi9zzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="185691851"
X-IronPort-AV: E=Sophos;i="6.15,230,1739804400"; 
   d="scan'208";a="185691851"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 17:49:32 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2CCF2E428A
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 17:49:31 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id DDD39D50B9
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 17:49:30 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 73DD61A0078;
	Tue, 22 Apr 2025 16:49:30 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 12/30] python3-beautifulsoup4: upgrade 4.13.3 -> 4.13.4
Date: Tue, 22 Apr 2025 16:49:03 +0800
Message-Id: <1745311761-1912-12-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1745311761-1912-1-git-send-email-wangmy@fujitsu.com>
References: <1745311761-1912-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 08:49:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117029

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* If you pass a function as the first argument to a find* method, the
  function will only ever be called once per tag, with the Tag object
  as the argument.
* Added a passthrough implementation for NavigableString.__getitem__ which gives a
  more helpful exception if the user tries to treat it as a Tag and
  access its HTML attributes.
* Fixed a bug that caused an exception when unpickling the result of
  parsing certain invalid markup with lxml as the tree builder.
* Converted the AUTHORS file to UTF-8 for PEP8 compliance.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...eautifulsoup4_4.13.3.bb => python3-beautifulsoup4_4.13.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-beautifulsoup4_4.13.3.bb => python3-beautifulsoup4_4.13.4.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.13.3.bb b/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.13.4.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-beautifulsoup4_4.13.3.bb
rename to meta-python/recipes-devtools/python/python3-beautifulsoup4_4.13.4.bb
index a36c22e6f1..ba75b06396 100644
--- a/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.13.3.bb
+++ b/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.13.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = " https://www.crummy.com/software/BeautifulSoup/bs4"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=96e0034f7c9443910c486773aa1ed9ac"
 
-SRC_URI[sha256sum] = "1bd32405dacc920b42b83ba01644747ed77456a65760e285fbc47633ceddaf8b"
+SRC_URI[sha256sum] = "dbb3c4e1ceae6aefebdaf2423247260cd062430a410e38c66f2baa50a8437195"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


