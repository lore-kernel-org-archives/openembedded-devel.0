Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE6AECDE011
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 09:02:18 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7017.1782378137495220289
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2026 02:02:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Kcs/kv8U;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782378138; x=1813914138;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=A8dAYshydxJ6luusgpCgrcSknJUjNowPd7atCehBkYI=;
  b=Kcs/kv8U/C+DcgndltSQ5QQ63O42JQtA+Ua57e7Y8TNrMegy3Ot0Htv2
   S25wkmDtZuAtiIRQDsrAKpB2MrUcbJKjf9FO/2NXk/egdubbranwb/3Z4
   3DQeHJNBj1RlpwbVhiFDuDL1l1ZSVjnu6OQG30vMoyqIUt5lIA4Ka81GI
   l8Kp/UKn6IgNcuiGUaDx6z195HG29kcCvIK23tK0ViUlzOXxOc20U6qX3
   q2+2kT6xrOCImPAkerKYI2WRft1t1kRcyGTntaPezQffBKTdLZfWpNaXX
   vjvN8P8P6XNBjIOMvj+aAiT9bpu1i9wEm23Rw0Nmhby3YY9aUjlHHHrEe
   Q==;
X-CSE-ConnectionGUID: 8R1xvoxwREisYPQ1PxaGsQ==
X-CSE-MsgGUID: XosIbpz9T5qfhbWmFw3Frg==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="245233724"
X-IronPort-AV: E=Sophos;i="6.24,224,1774278000"; 
   d="scan'208";a="245233724"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 18:02:16 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id CAA691002B87
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:15 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (unknown [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 832091400123
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:15 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 869051017329;
	Thu, 25 Jun 2026 09:02:13 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 28/47] python3-nanobind: upgrade 2.12.0 -> 2.13.0
Date: Thu, 25 Jun 2026 17:01:08 +0800
Message-ID: <20260625090127.1563-28-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260625090127.1563-1-wangmy@fujitsu.com>
References: <20260625090127.1563-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127760

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-nanobind_2.12.0.bb => python3-nanobind_2.13.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-nanobind_2.12.0.bb => python3-nanobind_2.13.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-nanobind_2.12.0.bb b/meta-python/recipes-devtools/python/python3-nanobind_2.13.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-nanobind_2.12.0.bb
rename to meta-python/recipes-devtools/python/python3-nanobind_2.13.0.bb
index 58dbb30c84..f903641e93 100644
--- a/meta-python/recipes-devtools/python/python3-nanobind_2.12.0.bb
+++ b/meta-python/recipes-devtools/python/python3-nanobind_2.13.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/wjakob/nanobind"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7646f9ee25e49eaf53f89a10665c568c"
 
-SRC_URI[sha256sum] = "0ae77c1a88f27153fa57045ee00f7b0a7b06b1cd3df942e95a34b38c5d0a5bee"
+SRC_URI[sha256sum] = "c7b04d6a6a4cd57985571e605539399b51331ae455d7fce576a5e2fcb89b1dcf"
 
 inherit pypi cmake python_setuptools_build_meta
 
-- 
2.43.0


