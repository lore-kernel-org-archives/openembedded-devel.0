Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45261CAC5BD
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 09:42:14 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.15063.1758015732537559465
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Sep 2025 02:42:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=YSozJvRU;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1758015733; x=1789551733;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=f1fo5BDnVpMlwnZQTrPUyZltmRyFK+1bQYSVC8uabZQ=;
  b=YSozJvRUziRPgK1C7SFO5Qrd2D0Qo/zjRg8DKrIYlqML/7uH//cle1jJ
   Ehw7N5c3wUbj37/SbfO1gfmrPGmUtYW9U49TTVJMH6J9LyttLeBtIRknN
   VZKN9m2xcheNbrGXlqnZkE1EPxD72kd5+18eegqRh4diklcq+brup82Z/
   bURrWsAP02I/2IUbY0xAkKvrQXlHEQZarR21RulX0ab6Tdknz+RiZrl48
   IoomNnPABVXr4Lr7vZXN7njKF1JUSAMKGQsoiU8nfTjsO/sjbgjw+Eap3
   hZUnIGQS7RPeFhbKgbceYQcxfrMDv27ivHJ4YbELt13nGlq0f5mT081Tz
   A==;
X-CSE-ConnectionGUID: C4ORc8sqTbKqSsAaACcrng==
X-CSE-MsgGUID: 2tYUNzRGQxWHbsvotvTcjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="200927291"
X-IronPort-AV: E=Sophos;i="6.18,268,1751209200"; 
   d="scan'208";a="200927291"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 18:42:12 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 26EEE1000343
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:12 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id D4CEB180050A
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:11 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTPS id 36F2D18076C4;
	Tue, 16 Sep 2025 09:42:10 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B178B1A008D;
	Tue, 16 Sep 2025 17:42:06 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 34/42] python3-twine: upgrade 6.1.0 -> 6.2.0
Date: Tue, 16 Sep 2025 17:41:44 +0800
Message-ID: <20250916094152.1479-34-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250916094152.1479-1-wangmy@fujitsu.com>
References: <20250916094152.1479-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119457

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-twine_6.1.0.bb => python3-twine_6.2.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-twine_6.1.0.bb => python3-twine_6.2.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-twine_6.1.0.bb b/meta-python/recipes-devtools/python/python3-twine_6.2.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-twine_6.1.0.bb
rename to meta-python/recipes-devtools/python/python3-twine_6.2.0.bb
index 5f734705c0..3e4898eddc 100644
--- a/meta-python/recipes-devtools/python/python3-twine_6.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twine_6.2.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://twine.readthedocs.io/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3d1106b253a8d50dd82a4202a045b4c"
 
-SRC_URI[sha256sum] = "be324f6272eff91d07ee93f251edf232fc647935dd585ac003539b42404a8dbd"
+SRC_URI[sha256sum] = "e5ed0d2fd70c9959770dce51c8f39c8945c574e18173a7b81802dab51b4b75cf"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


