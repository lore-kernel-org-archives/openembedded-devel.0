Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61F5FC55172
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 05:18:25 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10303.1785820698409550567
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2026 22:18:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=C2Zx2FsK;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785820703; x=1817356703;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4x3CFq2t4kkCiHuR03/EqDVj9I4F8Fj7rRzqajf0x7c=;
  b=C2Zx2FsKMC3zczb6nth6UxLE5jnjOduhdXbPCGzt00GWV5/aqh/0NG8Z
   wpCm9uXM8gj4/YFoqCimskKmpZZx3hvk8hDoMjSrvVmYD+ppSqXHh6PhG
   y0ZIBl0SLdrc8ammobUsodAcSNpNYwNSpT0KSIR1zzAMnNBYHUuBjHDBv
   NZWOLsqatsiW0kcwIq3SY6rTLAeLXmyBl1FcUap3HW0eqa6rQLsXt+5yu
   RBA+pDtO9o8GWYdDHoQ333TJZAT6fjKxar2L+KXdmfI9Ebqj8mJe1hjPr
   HxoK9k01sMSLeiPOoo8LlfrvuhSSOboXxHzjTg1DH8JHHQKxN7ui//J6m
   Q==;
X-CSE-ConnectionGUID: xvq3OWNtRtaak1u3LREgTw==
X-CSE-MsgGUID: 6nTpmHZAQsCUw8xAUQzUlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="253203150"
X-IronPort-AV: E=Sophos;i="6.25,203,1779116400"; 
   d="scan'208";a="253203150"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 14:18:22 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 48FC88204D2
	for <openembedded-devel@lists.openembedded.org>; Tue,  4 Aug 2026 05:18:19 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id EF1AE140063C
	for <openembedded-devel@lists.openembedded.org>; Tue,  4 Aug 2026 05:18:18 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id EAF8E1800131;
	Tue,  4 Aug 2026 05:18:16 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 13/28] python3-dunamai: upgrade 1.26.1 -> 1.26.2
Date: Tue,  4 Aug 2026 13:17:11 +0800
Message-ID: <20260804051726.1489-13-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260804051726.1489-1-wangmy@fujitsu.com>
References: <20260804051726.1489-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 05:18:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128718

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-dunamai_1.26.1.bb => python3-dunamai_1.26.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-dunamai_1.26.1.bb => python3-dunamai_1.26.2.bb} (69%)

diff --git a/meta-python/recipes-devtools/python/python3-dunamai_1.26.1.bb b/meta-python/recipes-devtools/python/python3-dunamai_1.26.2.bb
similarity index 69%
rename from meta-python/recipes-devtools/python/python3-dunamai_1.26.1.bb
rename to meta-python/recipes-devtools/python/python3-dunamai_1.26.2.bb
index a94120c740..3059f65b8c 100644
--- a/meta-python/recipes-devtools/python/python3-dunamai_1.26.1.bb
+++ b/meta-python/recipes-devtools/python/python3-dunamai_1.26.2.bb
@@ -2,7 +2,7 @@ SUMMARY = "Dynamic version generation"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=059eed55dbfd3fea022510ea62c95dc1"
 
-SRC_URI[sha256sum] = "3b46007bd65b00b4824ead0a1aee365fd22d0ec2b9c219497d4fd48f52860c8b"
+SRC_URI[sha256sum] = "84ea45eddf9bb4b40df7610b1b22a03137365e6257dbf9d7b72128fdccca564c"
 
 inherit pypi python_poetry_core
 
-- 
2.43.0


