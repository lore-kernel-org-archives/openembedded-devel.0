Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21D04C83F20
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 09:07:28 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.56133.1751879234076487371
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jul 2025 02:07:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=uLXfJnTr;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751879238; x=1783415238;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IxibmbphcUsW6ftpWtb9o66Yv6kgQNUSrMdHcQoV9RE=;
  b=uLXfJnTrV/bCCokJSxKKCk3gqZNjvELS8pb+Ko26PTxWP5wCF2gHoBcR
   wFz2cua94TNOY5NoipNkvvCtK/DL1M25C2PRNku0n4sYyAVrSwOhvRj2f
   BoFrEBrAEYvgmQJR695KC4D2dfdQybZTS7nBto0CIXxuxfe8IpNn2fO+a
   4Ma4LipeQ8CT6a3zAZKhMninMk13PonYEGNNsFYnqTGuXz6maZwvJ02xL
   2+TwyWy9CrtRHyfJRROsc3scJDRyEoJZlqpdIWo+3bSXAagQwAllkpplC
   PpHIPJTF7+cyYLHy/gpitpPbf7xUgPgVDO6qgWxcg/3A6k9ugNpFo3pyY
   w==;
X-CSE-ConnectionGUID: Nf0DEunYQnCkGfKfQbSuHA==
X-CSE-MsgGUID: Hm469KPpSWS5LVooSHrgzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="193950582"
X-IronPort-AV: E=Sophos;i="6.16,293,1744038000"; 
   d="scan'208";a="193950582"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([51.138.80.169])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 18:07:18 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id C819342A301
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 09:07:17 +0000 (UTC)
Received: from oym-m1.gw.nic.fujitsu.com (oym-m1.gw.nic.fujitsu.com [10.85.9.161])
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTP id 4631B180051C
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 09:07:17 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 99E0FD4F40
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 18:07:16 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id DAE041A000B;
	Mon,  7 Jul 2025 17:07:15 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 22/35] python3-eventlet: upgrade 0.40.0 -> 0.40.1
Date: Mon,  7 Jul 2025 17:06:42 +0800
Message-ID: <20250707090656.1216-22-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250707090656.1216-1-wangmy@fujitsu.com>
References: <20250707090656.1216-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Jul 2025 09:07:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118264

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===============
* "Fix" fork() so it "works" on Python 3.13, and "works" better on older Python versions
* Fix patching of removed URLopener class in Python 3.14
* ReferenceError except while count rlock
* Replace deprecated datetime.utcfromtimestamp
* Remove duplicate steps
* Replace deprecated datetime.datetime.utcnow

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-eventlet_0.40.0.bb => python3-eventlet_0.40.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-eventlet_0.40.0.bb => python3-eventlet_0.40.1.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-eventlet_0.40.0.bb b/meta-python/recipes-devtools/python/python3-eventlet_0.40.1.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-eventlet_0.40.0.bb
rename to meta-python/recipes-devtools/python/python3-eventlet_0.40.1.bb
index 88c3d06967..f851f277e2 100644
--- a/meta-python/recipes-devtools/python/python3-eventlet_0.40.0.bb
+++ b/meta-python/recipes-devtools/python/python3-eventlet_0.40.1.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=56472ad6de4caf50e05332a34b66e778"
 
 SRC_URI += "file://d19ad6cc086684ee74db250f5fd35227c98e678a.patch"
-SRC_URI[sha256sum] = "f659d735e06795a26167b666008798c7a203fcd8119b08b84036e41076432ff1"
+SRC_URI[sha256sum] = "aee74de74ac6634a1dac1ed58dc93b5dc2abaef3c7b5e76fd7f195f1662f25ef"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


