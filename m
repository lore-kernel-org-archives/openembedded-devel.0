Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21A3FC5DF85
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 09:35:40 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3257.1787132132015575533
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 02:35:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hNmue9R4;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787132132; x=1818668132;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wh/11a3UXmxOjqubfev08N0guZttOCWbqUH3AW8k9No=;
  b=hNmue9R4+osO0C2nf4fLY/17HUzuaRklZQQmJhF5J0q+GWOM29/2DiJf
   sbnOLZVxltlAIdmNgBkMEzu9p6DuD1LjElTMm6/diWdI0Wq2tZxKaNEpj
   otWOXxc/YYBJd/34BEkS/M59uDigpsY68tElgOoPeUlKi6vuecLieOOBS
   agX1FAQw4NEM5+pU/GKAR2lQeVgJ0C9vM+W+GWlK+epElcT3I4Ws1xzyg
   t7m/dkZWcnLBMlW4LJwmQICo7MjGaps6b9+vtbiVST6FejziMQw34oFlg
   AyRQ0ou5UhxftY4a2KKDJysU+XDMTDSJNefX3zDnYDwIIfI9dTpIOLUeK
   Q==;
X-CSE-ConnectionGUID: iY0LEtcWS3iVhIX7Ivt6Lg==
X-CSE-MsgGUID: 5QmBf7g8SG6oaenYRlZbvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="239835265"
X-IronPort-AV: E=Sophos;i="6.25,231,1779116400"; 
   d="scan'208";a="239835265"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 18:35:30 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 52B9B1C000EA
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:35:30 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 0137A1C00953
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:35:30 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id EB7EA1801C0A;
	Wed, 19 Aug 2026 09:35:27 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 06/70] expected-lite: upgrade 0.8.0 -> 0.10.0
Date: Wed, 19 Aug 2026 17:34:10 +0800
Message-ID: <20260819093514.1101-6-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260819093514.1101-1-wangmy@fujitsu.com>
References: <20260819093514.1101-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:35:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129276

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{expected-lite_0.8.0.bb => expected-lite_0.10.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/expected-lite/{expected-lite_0.8.0.bb => expected-lite_0.10.0.bb} (92%)

diff --git a/meta-oe/recipes-support/expected-lite/expected-lite_0.8.0.bb b/meta-oe/recipes-support/expected-lite/expected-lite_0.10.0.bb
similarity index 92%
rename from meta-oe/recipes-support/expected-lite/expected-lite_0.8.0.bb
rename to meta-oe/recipes-support/expected-lite/expected-lite_0.10.0.bb
index f63d5dde2e..3fccb35f5c 100644
--- a/meta-oe/recipes-support/expected-lite/expected-lite_0.8.0.bb
+++ b/meta-oe/recipes-support/expected-lite/expected-lite_0.10.0.bb
@@ -9,7 +9,7 @@ LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 
 SRC_URI = "git://github.com/martinmoene/expected-lite.git;protocol=https;branch=master;tag=v${PV}"
-SRCREV = "182165b584dad130afaf4bcd25b8629799baea38"
+SRCREV = "3583e95bad46f5af7d8a826632bc68a6f7281551"
 
 inherit cmake
 
-- 
2.43.0


