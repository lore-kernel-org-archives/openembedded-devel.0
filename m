Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02347C87FD5
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 09:55:20 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.31368.1753869304803074049
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Jul 2025 02:55:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HALiryuw;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1753869310; x=1785405310;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1MualjT31elFeZkVcSuVf/a0wKbAOT97QcjUuYYyf6E=;
  b=HALiryuwBMd+KlKqgq8vN/8hDMBvGG1V6kMqxVI5NpXsDYH5qgyvr0vn
   Ir1VJPSBqTNjlDv13yU3H/DUqVSikFI33+kGGM3SkuKji/ti/q0uWQWdX
   T2rnVyQpees5VlCgodzaGoq8lLb/S0fqueYMNR+5QbLlkzfNAOI3xJyox
   yD7Sig/PAoiVP0DY9yVy2HNh4P6UDWLDhwZ4D0ZItKlWi70Wcra6eVIK7
   TQA7mdRTue7MAo0YnmHst87qATjKdqBEa4BLHCUyNAbPNHxEzUC2Ipb/j
   dcgOS/v2cilodUbp/POsEs/CJwt46Z4qlsq2bcfaRXilQyYCWTMUC1cng
   Q==;
X-CSE-ConnectionGUID: ni9N1qs7REesecCChaqHDw==
X-CSE-MsgGUID: K95s9s8lSmO5XJQFvpz9KA==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="196380918"
X-IronPort-AV: E=Sophos;i="6.16,350,1744038000"; 
   d="scan'208";a="196380918"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.19])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 18:55:09 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 76176C000BE
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 09:55:09 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id DE5AD83D96D
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 09:55:08 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 99F1A1A008F;
	Wed, 30 Jul 2025 17:55:05 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 20/40] pcsc-tools: upgrade 1.7.2 -> 1.7.3
Date: Wed, 30 Jul 2025 17:54:36 +0800
Message-ID: <20250730095456.695-20-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250730095456.695-1-wangmy@fujitsu.com>
References: <20250730095456.695-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 09:55:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118785

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- Expired domains link to unwanted websites
- Unify expressions for the Japanese eID card

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../pcsc-tools/{pcsc-tools_1.7.2.bb => pcsc-tools_1.7.3.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/pcsc-tools/{pcsc-tools_1.7.2.bb => pcsc-tools_1.7.3.bb} (88%)

diff --git a/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.7.2.bb b/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.7.3.bb
similarity index 88%
rename from meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.7.2.bb
rename to meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.7.3.bb
index 14ffab6128..5aecc2df89 100644
--- a/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.7.2.bb
+++ b/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.7.3.bb
@@ -3,9 +3,9 @@ HOMEPAGE = "http://ludovic.rousseau.free.fr/softwares/pcsc-tools"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-SRC_URI = "git://github.com/LudovicRousseau/pcsc-tools;protocol=https;branch=master"
+SRC_URI = "git://github.com/LudovicRousseau/pcsc-tools;protocol=https;branch=master;tag=${PV}"
 
-SRCREV = "778da3d86a59f5166443118c158e11ba4da9a5f1"
+SRCREV = "12f62c67650e1bfb491c18242a75fa61993c4cb8"
 
 inherit autotools pkgconfig
 
-- 
2.43.0


