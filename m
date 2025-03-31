Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC170C369A2
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 09:12:10 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.47781.1743412322115473336
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Mar 2025 02:12:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cdwM+P6Y;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1743412323; x=1774948323;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=/+8whEnm0WLjehlBjp/OEw20E02lGQ5v4t6H3slnObM=;
  b=cdwM+P6YeaxOcvdNhet8x7ysALvvD4nTkgfyorKMeUNstr/p/1n/yLo5
   6iVbJLf+yOTisxfGGVcXsSsZLaiEp6sBX89pTPUBP5522d5sV4f/O2FJZ
   8z4gzhL4Ax3+DAmGcIdCL0TM9KU9VRdl49VdEqgIB5CzaONmXI+pxMenl
   mgBGyvQtboS3WBbmKozUO5io3J9O1E2whjU5LxjpoqDnPCbYO5kWirb4a
   +hCWW/3mSyX37AoGeKYAQoBEOFbRCnBqqVZmCXuLntghHn0NoqMaIiCsA
   k2URkGfs462sIlGmudIOHvvVBZQ9F7Vzk/n5fLQIr/+Bh9nYgmzM8IJpG
   Q==;
X-CSE-ConnectionGUID: LklFMfFcTS+wH1VW02nZLQ==
X-CSE-MsgGUID: 7IxeErrdTs6/E5Rr//TIDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="194984815"
X-IronPort-AV: E=Sophos;i="6.14,290,1736780400"; 
   d="scan'208";a="194984815"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 18:12:00 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id B2D9414244
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 18:11:57 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 77F0A13EF2
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 18:11:57 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 382CA1A0078;
	Mon, 31 Mar 2025 17:11:57 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 09/26] python3-djangorestframework: upgrade 3.15.2 -> 3.16.0
Date: Mon, 31 Mar 2025 17:11:31 +0800
Message-Id: <1743412308-21887-12-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1743412308-21887-1-git-send-email-wangmy@fujitsu.com>
References: <1743412308-21887-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 09:12:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116407

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ramework_3.15.2.bb => python3-djangorestframework_3.16.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-djangorestframework_3.15.2.bb => python3-djangorestframework_3.16.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-djangorestframework_3.15.2.bb b/meta-python/recipes-devtools/python/python3-djangorestframework_3.16.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-djangorestframework_3.15.2.bb
rename to meta-python/recipes-devtools/python/python3-djangorestframework_3.16.0.bb
index 047aba137b..ed9a09c59e 100644
--- a/meta-python/recipes-devtools/python/python3-djangorestframework_3.15.2.bb
+++ b/meta-python/recipes-devtools/python/python3-djangorestframework_3.16.0.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "https://pypi.python.org/pypi/djangorestframework"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=7879a5a716147a784f7e524c9cf103c1"
 
-SRC_URI[sha256sum] = "36fe88cd2d6c6bec23dca9804bab2ba5517a8bb9d8f47ebc68981b56840107ad"
+SRC_URI[sha256sum] = "f022ff46613584de994c0c6a4aebbace5fd700555fbe9d33b865ebf173eba6c9"
 
 PYPI_PACKAGE = "djangorestframework"
 
-- 
2.43.0


