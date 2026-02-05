Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DD96E8B395
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 05:16:58 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14235.1770268611647819039
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Feb 2026 21:16:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=gpZ04qmw;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770268610; x=1801804610;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UJYXR9xMO125qjYOxgYtErsRhpEfvLOXHvf86zyp22I=;
  b=gpZ04qmw9oYKEbXzTc1yc3TVLg/sPuF04fle+xjm6Xn44c1LCERerPGr
   yvVrfbnkWIGj6V06aRIie+omnmEdqEsupgQBVMAfYwbi07nSaqAmp6MdL
   O2olve8/q0EbHTtuOQ02a9NSMIdRHR2WriLmT3gy+cZG3P9VTHdCYT/4m
   UkvMMrK4oT7LXk2xwuSBNFjrfHyL8YGitPakX12dkHAFq4NsVX5RalbwC
   QrZnZanJAFoudUom7QpciRKR4/hThvhvopcKqOPKUKBkhio13pfqseMKZ
   QDLr3emcLhMOoFq9XKhZVXRdOTD2LLAqDIIPJalj16sTP6ZfANEE2mbZI
   w==;
X-CSE-ConnectionGUID: 5dBMB1MTRwyY4owq2mOQuw==
X-CSE-MsgGUID: LRa8gAETSsapRrN7Til3Vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="228010046"
X-IronPort-AV: E=Sophos;i="6.21,274,1763391600"; 
   d="scan'208";a="228010046"
Received: from unknown (HELO mail.fujitsu.com) ([20.61.8.234])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 14:16:49 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.fujitsu.com (Postfix) with ESMTPS id 402B942A305
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Feb 2026 05:16:50 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id EBF231004151
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Feb 2026 05:16:49 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 5A2B520000C5;
	Thu,  5 Feb 2026 05:16:47 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 23/24] tree: upgrade 2.2.1 -> 2.3.1
Date: Thu,  5 Feb 2026 13:14:33 +0800
Message-ID: <20260205051435.1366-23-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260205051435.1366-1-wangmy@fujitsu.com>
References: <20260205051435.1366-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 05:16:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124175

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/tree/{tree_2.2.1.bb => tree_2.3.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/tree/{tree_2.2.1.bb => tree_2.3.1.bb} (87%)

diff --git a/meta-oe/recipes-support/tree/tree_2.2.1.bb b/meta-oe/recipes-support/tree/tree_2.3.1.bb
similarity index 87%
rename from meta-oe/recipes-support/tree/tree_2.2.1.bb
rename to meta-oe/recipes-support/tree/tree_2.3.1.bb
index df52d63fbb..b4fa0659b9 100644
--- a/meta-oe/recipes-support/tree/tree_2.2.1.bb
+++ b/meta-oe/recipes-support/tree/tree_2.3.1.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=393a5ca445f6965873eca0259a17f833"
 
 SRC_URI = "https://oldmanprogrammer.net/tar/tree/${BP}.tgz"
-SRC_URI[sha256sum] = "68ac45dc78c0c311ada06200ffc3c285e74223ba208061f8d15ffac25e44b2ec"
+SRC_URI[sha256sum] = "47ca786ed4ea4aa277cabd42b1a54635aca41b29e425e9229bd1317831f25665"
 
 # tree's default CFLAGS for Linux
 CFLAGS += "-Wall -DLINUX -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64"
-- 
2.43.0


