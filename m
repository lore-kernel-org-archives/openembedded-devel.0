Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5C2CC54F2E
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 09:00:05 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.6738.1747817995896623808
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 May 2025 02:00:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=BSi08eSw;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747818003; x=1779354003;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=reuA4+0d8RVJIzWrz36wc4zyZLJoiRpBxNf1fPqz1do=;
  b=BSi08eSwxfCEC4XdhECtvGw+DjpV3/Qmi5mdMyu9CEf0LxoilhxPYPup
   jlKO5tpsO23rH6a6qfqvGy6+QSjUCvIIbVQa8fveNgm9G9jynAUXh1yO1
   vW0oO+vlYJWuMIVgJzLXUarmXFbDf9j4NL3SjQVoUJ05EMnI8f2LXO0JY
   ONt2PR8bgqAbIFLJwKmq55YW+YUQw3qKU7jawi2WAbomJvK4YwkpB40gp
   8dmvHuBCMt8J2j1NKg+SmAksi6nRfJypeyf0TpkgG/51qkeBZ5CvmL6F3
   TCVdbfZbYT7MaMpS+Sq0NXQYBNb3LOM/45cgefvWvTp217IA+w3nSjd+u
   A==;
X-CSE-ConnectionGUID: gCZvLbbKQ6CeXmKY5ghReg==
X-CSE-MsgGUID: KqAyIZp6TWqU+lRZz/GFYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="200152538"
X-IronPort-AV: E=Sophos;i="6.15,303,1739804400"; 
   d="scan'208";a="200152538"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 18:00:01 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 685EBD9432
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 17:59:59 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 2200ED50A3
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 17:59:59 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A34EF1A009A;
	Wed, 21 May 2025 16:59:58 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 31/43] python3-qrcode: upgrade 8.1 -> 8.2
Date: Wed, 21 May 2025 16:59:20 +0800
Message-Id: <1747817972-28874-31-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
References: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 09:00:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117556

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- Optimize QRColorMask apply_mask method for enhanced performance
- Fix typos on StyledPilImage embeded_* parameters.
  The old parameters with the typos are still accepted for backward compatibility.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-qrcode_8.1.bb => python3-qrcode_8.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-qrcode_8.1.bb => python3-qrcode_8.2.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-qrcode_8.1.bb b/meta-python/recipes-devtools/python/python3-qrcode_8.2.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-qrcode_8.1.bb
rename to meta-python/recipes-devtools/python/python3-qrcode_8.2.bb
index e37c6bcdea..1671864c1f 100644
--- a/meta-python/recipes-devtools/python/python3-qrcode_8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-qrcode_8.2.bb
@@ -3,7 +3,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4b802d2a65df4626623c79757f486af9"
 
-SRC_URI[sha256sum] = "e8df73caf72c3bace3e93d9fa0af5aa78267d4f3f5bc7ab1b208f271605a5e48"
+SRC_URI[sha256sum] = "35c3f2a4172b33136ab9f6b3ef1c00260dd2f66f858f24d88418a015f446506c"
 
 inherit pypi python_poetry_core
 
-- 
2.43.0


