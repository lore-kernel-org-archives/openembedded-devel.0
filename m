Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13FF7C3065B
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 08:57:26 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.167232.1719305838019027754
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jun 2024 01:57:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=aIHGf+C7;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719305843; x=1750841843;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=rNQSLUowgYq305XpiRL4hMLi8zr9DJviY+M8NvB8j0Y=;
  b=aIHGf+C7WJ4vworQDLuqo9jxp9XQRui5FrmnWT5ovmmd5YAAV7cUIacW
   YWK+YuYEclkIB5joYR/HeenJDPaygV7YiOm/BrCn48cBb7sTLBGZLLZ61
   bEQOxj1NN37bKXSH919XR4fXS0GN3U/yZ1BLWEA06PpphuOBqXmt6Zok6
   xBe6uTC01rJ4HEyHnjgPeAFSDZNa+ZcjB05fjHBTjepPHZH6osoR/pbHk
   ssQ2eGCRfTuFkO0io7hDUwU63Y6Xh5sCbGfPx049kq4PH1RScSU8s5xKp
   id/LTjXDX3mz9HuTMJqoLGgVhvSi29EQHya4LHWV6+g155kIW8IuotE1y
   w==;
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="164089111"
X-IronPort-AV: E=Sophos;i="6.08,263,1712588400"; 
   d="scan'208";a="164089111"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 17:57:22 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9A81AC9440
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:19 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id DB3C2D3F03
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:18 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6EE5D2007CDC4
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:18 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1BBD91A0002;
	Tue, 25 Jun 2024 16:57:18 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 33/57] python3-huey: upgrade 2.5.0 -> 2.5.1
Date: Tue, 25 Jun 2024 16:56:06 +0800
Message-Id: <1719305790-11484-33-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
References: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28478.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28478.003
X-TMASE-Result: 10--7.658600-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrkYC3rjkUXRJ4YeSlHZYFoptX
	hf4dcLJZJ2o10m2bLBJnvY9hxB9vcwjt4l5TmF6fVyAKAMvj1ppF5qVUCGhwT5Tx+2LIqNmt0yO
	PBv1B9XYILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q25x7uAXGEprZiQDIJsDspXmyiLZetSf8mfop
	0ytGwvXiq2rl3dzGQ1ivN9ssYEZY2VuOg0jAZ4KKikBEbdv1/UnS2af1OQxnkFCUKeTC3Eow==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 08:57:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111045

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- More makework thanks to the ass-clowns running Python. Fix issue with deprecation of datetime.utcnow() in 3.12.
- Add API for customizing the TaskWrapper implementation, suitably named get_task_wrapper_class().
- Make the revoke_all(), restore_all() and is_revoked() more robust for various input types.
- Fix bug that could occur in the event of a SIGHUP followed by a SIGINT when using thread workers.
- Added new experimental contrib module for SQS queue and S3 result storage.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-huey_2.5.0.bb => python3-huey_2.5.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-huey_2.5.0.bb => python3-huey_2.5.1.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-huey_2.5.0.bb b/meta-python/recipes-devtools/python/python3-huey_2.5.1.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-huey_2.5.0.bb
rename to meta-python/recipes-devtools/python/python3-huey_2.5.1.bb
index c6e560609..471fd6cc2 100644
--- a/meta-python/recipes-devtools/python/python3-huey_2.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-huey_2.5.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5cac039fcc82f01141cc170b48f315d4"
 
 PYPI_PACKAGE = "huey"
 
-SRC_URI[sha256sum] = "2ffb52fb5c46a1b0d53c79d59df3622312b27e2ab68d81a580985a8ea4ca3480"
+SRC_URI[sha256sum] = "8a323783ab434a095a4e72b8c48c5b8f957f9031fa860474a390a0927e957112"
 
 RDEPENDS:${PN} += " \
 	python3-datetime \
-- 
2.34.1


