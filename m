Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BB11CCF9EA
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 00:15:52 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web01.958.1761696942005765977
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Oct 2025 17:15:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Kdt9XGSN;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1761696942; x=1793232942;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Npm+i5hVO99fsM5r7hzS6ANeqbOWq/oe22S+TxCPq1A=;
  b=Kdt9XGSNMe0aQV/0qoNKptYMo1RJ33vYHF0iMGTVQgh//aoulURB+un4
   RqGm6Rj2RV5JPmGSSnzt3xBO5RdA18KC0Lf/MXo2B1oH3VZlh5sisyKdE
   Vfm+MPQC9qpxbR6vqendLA+UrbIhtyUMR99cF+UCjIun6OaRx5qtJpx4u
   MkdLu1T3Y8YS+ff0dpIdCjndt0GOY+vPKlZxnIx2KBtIL1xMytj8chQAo
   qi1Ts+bK/J37BXGDqgdktsRKcsgCvMPertX1TLYMi6Z/JJZogBsRX1/WQ
   m819g6UKqJkNqdFte1Lt9SuEL5Fr/jrSY7s4QPalDwEgb+BJdZ0OW4RdC
   g==;
X-CSE-ConnectionGUID: Ui0YY+MJR7a6NfLj7A3bUg==
X-CSE-MsgGUID: xlKa09/bSlGsEhHPW2g2Og==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="217443297"
X-IronPort-AV: E=Sophos;i="6.19,262,1754924400"; 
   d="scan'208";a="217443297"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([20.61.8.234])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 09:15:41 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 7D56E1C00095
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:15:40 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 385921800EB8
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:15:40 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 8B51F826FD3;
	Wed, 29 Oct 2025 00:15:37 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 13/32] python3-cbor2: upgrade 5.7.0 -> 5.7.1
Date: Wed, 29 Oct 2025 08:14:46 +0800
Message-ID: <20251029001505.528-13-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251029001505.528-1-wangmy@fujitsu.com>
References: <20251029001505.528-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:15:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121119

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Improved performance on decoding large definite bytestrings
- Fixed a read(-1) vulnerability caused by boundary handling error

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-cbor2_5.7.0.bb => python3-cbor2_5.7.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cbor2_5.7.0.bb => python3-cbor2_5.7.1.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-cbor2_5.7.0.bb b/meta-python/recipes-devtools/python/python3-cbor2_5.7.1.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-cbor2_5.7.0.bb
rename to meta-python/recipes-devtools/python/python3-cbor2_5.7.1.bb
index 4fe60c87c9..e124207cbf 100644
--- a/meta-python/recipes-devtools/python/python3-cbor2_5.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cbor2_5.7.1.bb
@@ -3,7 +3,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a79e64179819c7ce293372c059f1dbd8"
 DEPENDS += "python3-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "3f6d843f4db4d0ec501c46453c22a4fbebb1abfb5b740e1bcab34c615cd7406b"
+SRC_URI[sha256sum] = "7a405a1d7c8230ee9acf240aad48ae947ef584e8af05f169f3c1bde8f01f8b71"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.43.0


