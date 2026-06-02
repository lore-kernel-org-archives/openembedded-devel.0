Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7DC9CD6E4A
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 10:08:44 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21222.1780394919504055870
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jun 2026 03:08:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=sW8DIn7t;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1780394920; x=1811930920;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qQ+M9pisv9wAc5v9Hz7Vd/51s2+maeyOlMOW8lf3RQg=;
  b=sW8DIn7tQl9p3HdboCmEI0mDx4mmgXWnRrmjdVezgJg22EfS1OrvPLac
   C930RLIpFAD+xfUb09nukpzhpJfB1rLGYaz7DJA6nl1+dU5eJYJj7w8K0
   t9ohurFRVk6NqzKNcsm/+dmhxHkuStdyaPlbgY/ZP1UzY/7TN7e1R1qJf
   g5fHL4HBZ1UUUK7Rlv/OjzJEZUeXL66HUFN/4/tA7iHPm0x7Zf1i0rYAj
   6euzH0WmZNd/mmszL8UkheCZGlo3JKYdxBxA1uFYAoqRfadeBLMN1VoL+
   LSKWtNc7Kh0fLH3T2mrdoEftPjc2oWbvEZ6hzwwSfpmARHHN9OM1Pis2y
   w==;
X-CSE-ConnectionGUID: Ttu1lqQeRWKnQQhxBRa96w==
X-CSE-MsgGUID: iLC1g7OjTQ2rjCX0TUNtbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="242660652"
X-IronPort-AV: E=Sophos;i="6.24,183,1774278000"; 
   d="scan'208";a="242660652"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 19:08:38 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id EA2171C1C701
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 10:08:37 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 99966C02F37
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 10:08:37 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 9CB791800583;
	Tue,  2 Jun 2026 10:08:35 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 20/38] python3-moteus: upgrade 0.3.101 -> 1.0.0
Date: Tue,  2 Jun 2026 18:07:36 +0800
Message-ID: <20260602100755.2117-20-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260602100755.2117-1-wangmy@fujitsu.com>
References: <20260602100755.2117-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jun 2026 10:08:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127342

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- moteus_tool --calibrate for controllers configured for hall commutation now
  calibrate a fine position for each hall transition, which improves
  performance and consistency for hall based configurations
- moteus.move_to now respects the velocity_limit argument across all devices
- moteus.move_to works properly when exiting the stopped state
- Don't inject await when it isn't needed, rending some python mode definitions
  possible that previously would have triggered syntax errors
- Fix the order of D and Q axes for current mode requests

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-moteus_0.3.101.bb => python3-moteus_1.0.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-moteus_0.3.101.bb => python3-moteus_1.0.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-moteus_0.3.101.bb b/meta-python/recipes-devtools/python/python3-moteus_1.0.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-moteus_0.3.101.bb
rename to meta-python/recipes-devtools/python/python3-moteus_1.0.0.bb
index 0b7d636cd6..1f360dcfc9 100644
--- a/meta-python/recipes-devtools/python/python3-moteus_0.3.101.bb
+++ b/meta-python/recipes-devtools/python/python3-moteus_1.0.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=c2d9643b4523fdf462
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "a288796f54515a40b02f548d8bcfb47c1e846e6460748d81856798c463b35cf5"
+SRC_URI[sha256sum] = "d66b00328e8cb3f57adfb54f43c6acb6d09c2215808c242725ece530fc7f9fdf"
 
 S = "${UNPACKDIR}/moteus-${PV}"
 
-- 
2.43.0


