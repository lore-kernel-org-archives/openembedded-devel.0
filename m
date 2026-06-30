Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5724C44502
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 09:23:11 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16874.1782811380585679927
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2026 02:23:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=SAz8+Ikr;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782811382; x=1814347382;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Q5hSHvlktkZJOnSWOSwGU4KxeP7b/7/eW05Q68iIfI4=;
  b=SAz8+IkrBFER6fMwk4uzOMP1OmoryGyVT1bAB8b9YJrvpvnVuJO9MMaR
   e18kfp3SVzYeJ9Ng68ZY8gvf40JdnVTST+cnm2QUy0Wn/Fig/8K4lv922
   Eix77Y5yBh5/W5n/L1N4b190PgZkmoK9ZfjiZvjckNHbe3JZOjFx4E7Hs
   tevREOOmZlx9jMBR1toLfcj/NwDYuo1CrlI5rzTmTUb9VawG3Yq/sM6s/
   FmNHNAxYNnHd743UF1L6tHioZMof7J20ptcjr7A/TBRCiWFlgqwaHy13s
   jKXsFLlGU+JwS/2Nc2foMvrWVvkMhrB2A+X1fy+3BGo541FcKxzzMRuWy
   Q==;
X-CSE-ConnectionGUID: xIcZKYs4S52XngldYlOnLA==
X-CSE-MsgGUID: B5pvq3OMQPeWqoNe1Fv4QA==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="245262375"
X-IronPort-AV: E=Sophos;i="6.24,233,1774278000"; 
   d="scan'208";a="245262375"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 18:23:02 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 35F23A3B4
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:23:02 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id E1F0E101B158
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:23:01 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 127BB82DDC4;
	Tue, 30 Jun 2026 09:22:59 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 33/37] smarty: upgrade 5.8.0 -> 5.8.3
Date: Tue, 30 Jun 2026 17:22:01 +0800
Message-ID: <20260630092206.322-33-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260630092206.322-1-wangmy@fujitsu.com>
References: <20260630092206.322-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:23:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127975

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/smarty/{smarty_5.8.0.bb => smarty_5.8.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/smarty/{smarty_5.8.0.bb => smarty_5.8.3.bb} (95%)

diff --git a/meta-oe/recipes-support/smarty/smarty_5.8.0.bb b/meta-oe/recipes-support/smarty/smarty_5.8.3.bb
similarity index 95%
rename from meta-oe/recipes-support/smarty/smarty_5.8.0.bb
rename to meta-oe/recipes-support/smarty/smarty_5.8.3.bb
index 89fe828ab5..f0779efb7e 100644
--- a/meta-oe/recipes-support/smarty/smarty_5.8.0.bb
+++ b/meta-oe/recipes-support/smarty/smarty_5.8.3.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2c0f216b2120ffc367e20f2b56df51b3"
 
 SRC_URI = "git://github.com/smarty-php/smarty.git;protocol=https;branch=master;tag=v${PV}"
 
-SRCREV = "78d259d3b971c59a0cd719c270cc5cbb740c36a7"
+SRCREV = "042dff64a912c272e7692a442590880a3388c4b9"
 
 
 INHIBIT_DEFAULT_DEPS = "1"
-- 
2.43.0


