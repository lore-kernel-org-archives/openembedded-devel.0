Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10E53CAC5B7
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 09:42:14 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.15061.1758015728104745413
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Sep 2025 02:42:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=flPqZWSg;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1758015728; x=1789551728;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ynCMTXVN82qPWRuNNMipuYbejfIjuy8p+vJ6AMOznUs=;
  b=flPqZWSgA2O2osNAR/nTErO9PRh6u/ucmar0oVU7NUXFc4mNimRawfQH
   IB0QHqHrQCJcrYAKOrjJbZZHi1w37Ii/93jCH2YiitxfJdQmqDyoGKAXG
   nEjd6FPJim1bJddGqsygLDaHaQLzE8gcQ/JBNwaUbFtbIO9Mvjg3QSoXJ
   PzMJkEIuS4idJRjMqjBS2SGE2nO3ZlkABggHvfYKnKh9sQQ2YWjsw7ac6
   scYSvw1vC1ziNPwYzY96IoZ7n7HZ8YBu+9Ya65WBo9LRbduIzmuYuACeT
   U3cD7C4FgS0jFpRdH04IbQFcyfry5upIIKz7SIMB6bYSXgEf+WSLBSegO
   g==;
X-CSE-ConnectionGUID: Qo6DElQSTFq3uQ4T5fst4g==
X-CSE-MsgGUID: GOiOY1l0T4SqQaG1j3xVDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="200927280"
X-IronPort-AV: E=Sophos;i="6.18,268,1751209200"; 
   d="scan'208";a="200927280"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 18:42:06 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 74C5C1000347
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:06 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 33996100038E
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:06 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTPS id 8F5701806DB9;
	Tue, 16 Sep 2025 09:42:04 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 15F4C1A0071;
	Tue, 16 Sep 2025 17:42:01 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 18/42] python3-arpeggio: upgrade 2.0.2 -> 2.0.3
Date: Tue, 16 Sep 2025 17:41:28 +0800
Message-ID: <20250916094152.1479-18-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250916094152.1479-1-wangmy@fujitsu.com>
References: <20250916094152.1479-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119441

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-arpeggio_2.0.2.bb => python3-arpeggio_2.0.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-arpeggio_2.0.2.bb => python3-arpeggio_2.0.3.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-arpeggio_2.0.2.bb b/meta-python/recipes-devtools/python/python3-arpeggio_2.0.3.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-arpeggio_2.0.2.bb
rename to meta-python/recipes-devtools/python/python3-arpeggio_2.0.3.bb
index 85bb066be5..4d4982dd37 100644
--- a/meta-python/recipes-devtools/python/python3-arpeggio_2.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-arpeggio_2.0.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/Arpeggio/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=33b8d1ba459a2fa4d801acfd1d1b7ceb"
 
-SRC_URI[sha256sum] = "c790b2b06e226d2dd468e4fbfb5b7f506cec66416031fde1441cf1de2a0ba700"
+SRC_URI[sha256sum] = "9e85ad35cfc6c938676817c7ae9a1000a7c72a34c71db0c687136c460d12b85e"
 
 PYPI_PACKAGE = "Arpeggio"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.43.0


