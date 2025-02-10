Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEE1DC021BC
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 09:02:07 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.46626.1739178120512085675
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 01:02:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nTjJzzXE;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739178127; x=1770714127;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=wGbn/VoU90GCDFoquCvBoLHUXSwcJale1Avb9PS+1Nw=;
  b=nTjJzzXExlcWP5U64c+RvAq+coDf0/UPxTw17iD/B3pO5n7b8V7DIkSE
   ngDYraylhraGmXJerLuKOsSRc0SGO0+NypCFbJ1p4qxkIpRpCWKEk+6g6
   y5Is40yL7PQUMvte3oTJafqIrxpcswcIvTRc8ZYVz2mAIxUG+9SN49Rq8
   UEPwhpwjJhXhFbs8o6VY5jy925ZGZAfnKlt6PkFzIA9+OfhVzPU8yZZU6
   wLsStF6yp6ThpffoZnZNp9eC0+pezq3xyYvMbQ0bycRc/3TTZ791fvHkq
   jDvuSpzemSm+ZrvEULnS4ipcUNqVc7je8W/QGX2twf+ALGzoSfaTIzkvQ
   w==;
X-CSE-ConnectionGUID: XaNmv8fVQDKkTNUeyWUG2A==
X-CSE-MsgGUID: pHDHVHdnTdqQOxLTgmlmng==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="177444537"
X-IronPort-AV: E=Sophos;i="6.13,274,1732546800"; 
   d="scan'208";a="177444537"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 18:02:05 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id E22C0D480B
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:02:03 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id AB4EBBF4A8
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:02:03 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4DD191A000B;
	Mon, 10 Feb 2025 17:02:03 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 48/66] python3-marshmallow: upgrade 3.26.0 -> 3.26.1
Date: Mon, 10 Feb 2025 17:01:17 +0800
Message-Id: <1739178095-26432-48-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
References: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 09:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115374

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Typing: Fix type annotations for class Meta options
- Remove default value for the data param of Nested._deserialize

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-marshmallow_3.26.0.bb => python3-marshmallow_3.26.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-marshmallow_3.26.0.bb => python3-marshmallow_3.26.1.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-marshmallow_3.26.0.bb b/meta-python/recipes-devtools/python/python3-marshmallow_3.26.1.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-marshmallow_3.26.0.bb
rename to meta-python/recipes-devtools/python/python3-marshmallow_3.26.1.bb
index bde3819379..4790695129 100644
--- a/meta-python/recipes-devtools/python/python3-marshmallow_3.26.0.bb
+++ b/meta-python/recipes-devtools/python/python3-marshmallow_3.26.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "\
                     file://LICENSE;md5=27586b20700d7544c06933afe56f7df4 \
                     file://docs/license.rst;md5=13da439ad060419fb7cf364523017cfb"
 
-SRC_URI[sha256sum] = "eb36762a1cc76d7abf831e18a3a1b26d3d481bbc74581b8e532a3d3a8115e1cb"
+SRC_URI[sha256sum] = "e6d8affb6cb61d39d26402096dc0aee12d5a26d490a121f118d2e81dc0719dc6"
 
 inherit python_flit_core pypi ptest-python-pytest
 
-- 
2.43.0


