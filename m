Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12CA8105A56A
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 10:54:08 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18539.1773312837597874110
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Mar 2026 03:53:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=WYISGAtl;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773312838; x=1804848838;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4xVDKmNbbRR+I6O68dQ0Ovm4/Qvi/iN4Y1slSRZY13w=;
  b=WYISGAtlBVQMzsZOtdSemTZowjOjrjuXwybasZb/ml0lIe6/938WS9Y0
   W9G/arDvHiG0ngDXMIV7ZflQJ+2K0nir1RBlzijZHEA3q0cXxsCnyhVM0
   S2oJzBPQaCVdixT1IhbA0/uPoxqDZh8nS45AGfih+nPkssPtE5CpEQWQv
   FcMxHlpkb/9CuL1U3zdnfC4REGW3J4yRcBC0cro1qjpYglqRhqehRJWzb
   w+ZXd88XuQhnV+U7n8ikF74L6rmi6L26cAQMrlcCttFMq/4lorv89TYJq
   yZcwnNgu4OFxn+JS3r4UYcY+MaqXs5gnPrkDIh7lS4XcaaU8qjJSBhQG1
   Q==;
X-CSE-ConnectionGUID: MpCsPj0mT9WdKxLeckmJGg==
X-CSE-MsgGUID: erHNl33iSSCVvt49kaIG0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="232954228"
X-IronPort-AV: E=Sophos;i="6.23,116,1770562800"; 
   d="scan'208";a="232954228"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 19:53:56 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 23F631C000B7
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:56 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id C48EB1000271
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:55 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id D93E41801925;
	Thu, 12 Mar 2026 10:53:52 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 42/64] python3-nanobind: upgrade 2.11.0 -> 2.12.0
Date: Thu, 12 Mar 2026 18:51:58 +0800
Message-ID: <20260312105220.1856-42-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260312105220.1856-1-wangmy@fujitsu.com>
References: <20260312105220.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:54:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125142

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-nanobind_2.11.0.bb => python3-nanobind_2.12.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-nanobind_2.11.0.bb => python3-nanobind_2.12.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-nanobind_2.11.0.bb b/meta-python/recipes-devtools/python/python3-nanobind_2.12.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-nanobind_2.11.0.bb
rename to meta-python/recipes-devtools/python/python3-nanobind_2.12.0.bb
index 92c4c913f1..58dbb30c84 100644
--- a/meta-python/recipes-devtools/python/python3-nanobind_2.11.0.bb
+++ b/meta-python/recipes-devtools/python/python3-nanobind_2.12.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/wjakob/nanobind"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7646f9ee25e49eaf53f89a10665c568c"
 
-SRC_URI[sha256sum] = "6d98d063c61dbbd05a2d903e59be398bfcff9d59c54fbbc9d4488960485d40d0"
+SRC_URI[sha256sum] = "0ae77c1a88f27153fa57045ee00f7b0a7b06b1cd3df942e95a34b38c5d0a5bee"
 
 inherit pypi cmake python_setuptools_build_meta
 
-- 
2.43.0


