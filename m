Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38A28C36013
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 09:12:10 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.47548.1743412325638673720
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Mar 2025 02:12:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ACD6viXJ;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1743412325; x=1774948325;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=dlpBq4uLhOiowea4CSRaysHd5Z8ymRKG5v6DDeI77YM=;
  b=ACD6viXJAVrqq51/WrMtu+4E0PxVOO8y87+O1uMEOD63jI/DQoic0AjD
   CYPxZ9Rhg2OoRAu87V1o2/WQRkS8TkGXEy2NyA79B8V4HzE2BTV5+E6wX
   fDshib0khzffkZZko90hGJENRLD8a60PCPUInXbKD4B4JUn4UaqPSi7ES
   MvHBbpT84LT+u/BXL4a+iNNOQ2m7T/ZdoUFSGSlR9WK+mf2+3rNZgXFKB
   8Be0Ut5oW8NbqMm3L6H754TFEl0QOHgaFo+HfvWw4c1pK7iQccBBxAiAC
   5MIqa9Dca1m0N5zbkbw0it2eElBik2LaIb/+hSnO0nmeKWI174c15dSyo
   w==;
X-CSE-ConnectionGUID: fhAQkoYUSpeKlsEUa+bIhQ==
X-CSE-MsgGUID: yFkRkUBrQUyZSKTzpfm0oA==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="195278865"
X-IronPort-AV: E=Sophos;i="6.14,290,1736780400"; 
   d="scan'208";a="195278865"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 18:12:03 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 79F81D6EA1
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 18:12:00 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3D816D5086
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 18:12:00 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id F17ED1A009A;
	Mon, 31 Mar 2025 17:11:59 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 22/26] python3-pymisp: upgrade 2.5.8.1 -> 2.5.9
Date: Mon, 31 Mar 2025 17:11:44 +0800
Message-Id: <1743412308-21887-25-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1743412308-21887-1-git-send-email-wangmy@fujitsu.com>
References: <1743412308-21887-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 09:12:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116421

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymisp_2.5.8.1.bb => python3-pymisp_2.5.9.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.5.8.1.bb => python3-pymisp_2.5.9.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.5.8.1.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.5.9.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.5.8.1.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.5.9.bb
index b605dbb039..c9f9eba40a 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.5.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.5.9.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/MISP/PyMISP"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
-SRC_URI[sha256sum] = "253cc79c903344f722abdf1011f412e27106af7305c1a3183d5c247c25a8f41c"
+SRC_URI[sha256sum] = "975b68ad9f38e7322d0994ce327abff359aa400f9e6d62a75be33694e4b06ec1"
 
 inherit python_poetry_core pypi
 
-- 
2.43.0


