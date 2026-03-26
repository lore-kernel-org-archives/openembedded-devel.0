Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D374B10A3D7C
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:58:04 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46433.1774526283721514317
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:58:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=E+dkVq/y;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1774526283; x=1806062283;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BhwzR7Qu/TFfHZ3sHZDslubEpudBgoKKs58MuVOGjV8=;
  b=E+dkVq/y9YUC0W3ywh76sVKlUk8iUmY3PPBvK4S5cNd3EK5Z/CpTmCeB
   A3SWIo44IWRlHX2V5mracD/9FT2zXHCSfCn/bqDFr4Er5SYCTCCs4BJIe
   zokEAhNThrR6e5piFL+xgVTarmb4pjU7XP043zpSf/R3ZymKHrY385uxn
   csJTEXjXhYqKjPwR4ZBa8FK0Yz9n1iO6xEemuv2pBqM5GmtuYXgUAVmZ1
   3le9Z/T9oUeCJmIe0YRaETHqqxGbvM+qDFI4OMQUFqZ2Csp+wsVZLp73T
   d1NoBG1LimSA6kF70++DL5m628Rs4hWnm1SJtRgjdGQBMXAGgf55u5WgO
   Q==;
X-CSE-ConnectionGUID: pjgX5e0NSxey6S6mBvz7ug==
X-CSE-MsgGUID: 5VvGFA4RSqCUgwWcuJ6tCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="235420914"
X-IronPort-AV: E=Sophos;i="6.23,142,1770562800"; 
   d="scan'208";a="235420914"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 20:58:02 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 4447A1002B82
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:58:02 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id F356814003CC
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:58:01 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 9DE14180715C;
	Thu, 26 Mar 2026 11:57:59 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 51/63] python3-simpleeval: upgrade 1.0.3 -> 1.0.7
Date: Thu, 26 Mar 2026 19:56:21 +0800
Message-ID: <20260326115634.1199-51-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260326115634.1199-1-wangmy@fujitsu.com>
References: <20260326115634.1199-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:58:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125706

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2026

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-simpleeval_1.0.3.bb => python3-simpleeval_1.0.7.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-simpleeval_1.0.3.bb => python3-simpleeval_1.0.7.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python3-simpleeval_1.0.3.bb b/meta-python/recipes-devtools/python/python3-simpleeval_1.0.7.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python3-simpleeval_1.0.3.bb
rename to meta-python/recipes-devtools/python/python3-simpleeval_1.0.7.bb
index 39178d3efd..5fb968edd5 100644
--- a/meta-python/recipes-devtools/python/python3-simpleeval_1.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-simpleeval_1.0.7.bb
@@ -1,9 +1,9 @@
 SUMMARY = "A simple, safe single expression evaluator library"
 HOMEPAGE = "https://pypi.org/project/simpleeval/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=83843c8f0f3beb18af2f282faecbdebe"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=aed013161b2a0bfa75e69eeb4e8a89e7"
 
-SRC_URI[sha256sum] = "67bbf246040ac3b57c29cf048657b9cf31d4e7b9d6659684daa08ca8f1e45829"
+SRC_URI[sha256sum] = "1e10e5f9fec597814444e20c0892ed15162fa214c8a88f434b5b077cf2fef85b"
 
 inherit pypi python_hatchling ptest-python-pytest
 
-- 
2.43.0


