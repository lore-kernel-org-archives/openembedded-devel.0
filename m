Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97122C61DD6
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 10:30:00 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9394.1788344986592877400
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2026 03:30:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rzn0KaJg;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1788344999; x=1819880999;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kKHHxm4HgtmuvAVYl0iXDUBViHiwrrI43Sg+PQRAv1s=;
  b=rzn0KaJgMHiBMPTQ5ZseUI1GWIZnpzIONPL9zQXC7lw8iWWCB2/xz2YT
   9YTr7VEbxA10KE91Z/TU3qAKX/oniIdUtX3koa0Ib3Qx26GQUdMFLzUiH
   kuGLwZOSGZvTAU+a8cRKNvnqxwnMgYfr478ntKmAUJ38Zi1MAuLAVkLaA
   Z37A0ztwxv3kqwRGzN66/IlEUv2Lux6eNPpCN1GMueLYQUqqIVamG0tPS
   Z79Gyuh6GurfBKiwAQ3Abgya5orB/dRogison1useMrIMNjD12bWABfnf
   7VJ9K0ppToz+ayH5TVx9UFvUXFwkjFG5APan1LeL5LK6XqsYfjnQnAHuj
   w==;
X-CSE-ConnectionGUID: sYf0toipQcOqB3QqTGewoA==
X-CSE-MsgGUID: 8oufLKXDT1Sr0c8hei2veA==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="241545575"
X-IronPort-AV: E=Sophos;i="6.25,257,1779116400"; 
   d="scan'208";a="241545575"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 19:29:59 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 46BA71C1C725
	for <openembedded-devel@lists.openembedded.org>; Wed,  2 Sep 2026 10:29:59 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (unknown [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id F10FA140038A
	for <openembedded-devel@lists.openembedded.org>; Wed,  2 Sep 2026 10:29:58 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id EFAF2200076B;
	Wed,  2 Sep 2026 10:29:56 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 29/34] python3-wrapt: upgrade 2.3.0 -> 2.4.0
Date: Wed,  2 Sep 2026 18:28:55 +0800
Message-ID: <20260902102900.1296-29-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260902102900.1296-1-wangmy@fujitsu.com>
References: <20260902102900.1296-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 10:30:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129688

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-wrapt_2.3.0.bb => python3-wrapt_2.4.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-wrapt_2.3.0.bb => python3-wrapt_2.4.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-wrapt_2.3.0.bb b/meta-python/recipes-devtools/python/python3-wrapt_2.4.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-wrapt_2.3.0.bb
rename to meta-python/recipes-devtools/python/python3-wrapt_2.4.0.bb
index b61717391a..18d533f6e1 100644
--- a/meta-python/recipes-devtools/python/python3-wrapt_2.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-wrapt_2.4.0.bb
@@ -8,7 +8,7 @@ inherit pypi python_setuptools_build_meta ptest-python-pytest
 
 DEPENDS += "python3-wheel-native"
 
-SRC_URI[sha256sum] = "681a2d0eefd721998f90642762b8e75c2159ec531b20ad5e437245ea7b06a107"
+SRC_URI[sha256sum] = "7082fc1f94b020ac275870c4af71b09cff22876fe6e9c4c0ad01ea21d217b288"
 
 # python3-misc for 'this' module, python3-image for colorsys (test_deferred_patching)
 RDEPENDS:${PN}-ptest += " \
-- 
2.43.0


