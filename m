Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ABE7FD7F6C
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 10:14:40 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.92735.1772187271719562979
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Feb 2026 02:14:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=t9e3mDyI;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772187270; x=1803723270;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iz7sv5UaxI/2RubR+7vkDPUQ3BuYngTb58MxFgrR12M=;
  b=t9e3mDyIebfXlwT/ErZ4nGbJChern6voHfaKx1QPR9+bE7Kp1QazBtmM
   SPMiV4OPnFJkMjWRU5Uz1m18ACrDqff6+alrZSgZHndokJCEp3bWTy4MJ
   aZsWsSaSM8gZiBJq1vLopysjpoeVe5B7AGjLaTHVz1m7LCRj8gO8a9h3/
   3F/MXM1q2UEghPBEedztYnbom2FNgmpHIiJrIvAa/BAA3q15WKdzZpAqi
   ok/RqK8qQRwD45E1UsufETgl5hQ0lqLYH09BIeGBjLyZi14CuAo7500By
   GXjB9cOoDRDkDQwHWohj/msDo2SQfztNqDGesNqG4xOwPRMOQqsZI384c
   Q==;
X-CSE-ConnectionGUID: sFFsjWRLQ1+Ff7rUYkM1zw==
X-CSE-MsgGUID: TNwA86UsTB2Aq7gAr2E71Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="231325494"
X-IronPort-AV: E=Sophos;i="6.21,313,1763391600"; 
   d="scan'208";a="231325494"
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.fujitsu.com (Postfix) with ESMTPS id 311191C1C716
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:14:30 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id DDC64C060B5
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:14:29 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id F310D180059F;
	Fri, 27 Feb 2026 10:14:26 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 20/52] python3-pandas: upgrade 3.0.0 -> 3.0.1
Date: Fri, 27 Feb 2026 18:12:55 +0800
Message-ID: <20260227101327.1432-20-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260227101327.1432-1-wangmy@fujitsu.com>
References: <20260227101327.1432-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:14:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124720

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pandas_3.0.0.bb => python3-pandas_3.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pandas_3.0.0.bb => python3-pandas_3.0.1.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-pandas_3.0.0.bb b/meta-python/recipes-devtools/python/python3-pandas_3.0.1.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-pandas_3.0.0.bb
rename to meta-python/recipes-devtools/python/python3-pandas_3.0.1.bb
index 01f57b9aa9..a25b367130 100644
--- a/meta-python/recipes-devtools/python/python3-pandas_3.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pandas_3.0.1.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e98642e1210ade884e5254ab18d55b7d"
 
 SRC_URI:append:class-target = " file://0001-BLD-add-option-to-specify-numpy-header-location.patch "
 
-SRC_URI[sha256sum] = "0facf7e87d38f721f0af46fe70d97373a37701b1c09f7ed7aeeb292ade5c050f"
+SRC_URI[sha256sum] = "4186a699674af418f655dbd420ed87f50d56b4cd6603784279d9eef6627823c8"
 
 CVE_PRODUCT = "pandas"
 
-- 
2.43.0


