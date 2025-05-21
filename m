Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B775C5B54E
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 09:00:06 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.6742.1747817999114261553
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 May 2025 01:59:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rCpRg8Gs;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747817998; x=1779353998;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=xLP2OX38W5da8dzec8morSb+0m492LDryNx9yGIrtRg=;
  b=rCpRg8Gs9j6p70abIgEbQtc9HRj9jhEz9JstwDpvsvq06wkXqHy9UpLE
   Zngl/6cxgx4X+TsSbdO2QFRoAtg3gcJm0v6vGRV7mD4tSNGTgjpn0/J4N
   /bVpOW0DMde/6vVjM1Gsm4F4965agwXgVKjcFGMuSFc9KbeNd7UkP35mW
   8One9N0I3vmOFjqdei+xWkbL+DKwTose2zM6RM933GMfBBkHJJ/elGBxT
   IUAAFANHOl4AbOwdV8pVT/h8iyMwzshJ4o7utAJQU2UPRguhBqpR4JX/b
   V8/mrzjS4/Vz7ELdGRFeWMBmw0STTX67/fqHgoX822jTpmwXWKsR+2LHH
   g==;
X-CSE-ConnectionGUID: BbzqJABwQ7yAkhJu1WWsEw==
X-CSE-MsgGUID: 1zM3OW2gRuWaGLM+pQou2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="200574178"
X-IronPort-AV: E=Sophos;i="6.15,303,1739804400"; 
   d="scan'208";a="200574178"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 17:59:56 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7F869D500B
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 17:59:54 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3317BD50A3
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 17:59:54 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B3DBA1A00A0;
	Wed, 21 May 2025 16:59:53 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 13/43] python3-greenlet: upgrade 3.2.1 -> 3.2.2
Date: Wed, 21 May 2025 16:59:02 +0800
Message-Id: <1747817972-28874-13-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
References: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 09:00:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117543

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Make greenlet build and run on Python 3.14 beta 1. It will not run on earlier versions of 3.14; it should run on subsequent versions.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-greenlet_3.2.1.bb => python3-greenlet_3.2.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-greenlet_3.2.1.bb => python3-greenlet_3.2.2.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-greenlet_3.2.1.bb b/meta-python/recipes-devtools/python/python3-greenlet_3.2.2.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-greenlet_3.2.1.bb
rename to meta-python/recipes-devtools/python/python3-greenlet_3.2.2.bb
index 4f5f39e4fc..995f91e1df 100644
--- a/meta-python/recipes-devtools/python/python3-greenlet_3.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-greenlet_3.2.2.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT & PSF-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e95668d68e4329085c7ab3535e6a7aee \
                     file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a"
 
-SRC_URI[sha256sum] = "9f4dd4b4946b14bb3bf038f81e1d2e535b7d94f1b2a59fdba1293cd9c1a0a4d7"
+SRC_URI[sha256sum] = "ad053d34421a2debba45aa3cc39acf454acbcd025b3fc1a9f8a0dee237abd485"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


