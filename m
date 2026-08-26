Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 842B3C61DD2
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 08:10:05 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7656.1787731795829312531
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Aug 2026 01:09:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Da/PHPwI;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787731800; x=1819267800;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=92yzFKwNPOu8N0LjoXWbUco+OG1X7pEC5yJXp3gMOmo=;
  b=Da/PHPwI5QpL26r0e/ykjsaEX0/UWGvsGexebPoe5KY+s2UA6DJst2IX
   Q3Q4Z4/UGlgtadUN2tvh77eVNOYZ5G0GHDb3Q1/1AKzv6zl8fDw2VqcSS
   2R5mJRap4LWmjHlRzbPHOaN/plsY43Qif37GWLrP3ckcOf2Na0UB90p/w
   J1+AYG+5uiIvXyqMWUxEvQNfbsoWBh3yjQhf0wgKP9b94S9KU/vEswjXX
   l9SEjy62JTHh6rpA18pcW8Ltor4sTvBBBl5pYq1Uf0Z4HP/yWB0oRA90i
   2l9peSrDXEFroAkfqq7V0jlHTkskB1CTsFECnmkimWHg5qN5eWJvlChAo
   A==;
X-CSE-ConnectionGUID: 17BuueVwShOGhBJHuSr+DQ==
X-CSE-MsgGUID: i4fcAmygRMq+zv7aRJTDMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="231590025"
X-IronPort-AV: E=Sophos;i="6.25,244,1779116400"; 
   d="scan'208";a="231590025"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 17:09:59 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id A395C1C000E3
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 08:09:55 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (unknown [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 52FE31892C44
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 08:09:55 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 6416B14001C3;
	Wed, 26 Aug 2026 08:09:53 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 15/23] python3-httpx2: upgrade 2.10.0 -> 2.12.0
Date: Wed, 26 Aug 2026 16:09:18 +0800
Message-ID: <20260826080926.989-15-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260826080926.989-1-wangmy@fujitsu.com>
References: <20260826080926.989-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 08:10:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129507

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-httpx2_2.10.0.bb => python3-httpx2_2.12.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-httpx2_2.10.0.bb => python3-httpx2_2.12.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-httpx2_2.10.0.bb b/meta-python/recipes-devtools/python/python3-httpx2_2.12.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-httpx2_2.10.0.bb
rename to meta-python/recipes-devtools/python/python3-httpx2_2.12.0.bb
index 1be888ed00..0d16318a47 100644
--- a/meta-python/recipes-devtools/python/python3-httpx2_2.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-httpx2_2.12.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "The next generation HTTP client."
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=166cfc32dc0986f87a7e950553b52e5e"
 
-SRC_URI[sha256sum] = "8741d7329fe2c7885fc9ceb61c8217acfb87a85f75723714b89ebf7ad7196338"
+SRC_URI[sha256sum] = "7631fe9887a8a2275f4a2540e053aa670fcc50742864a9ae7c66e609fdcf12cf"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


