Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 570CA105A573
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 10:54:08 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18782.1773312845978191937
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Mar 2026 03:54:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=dArhdlAQ;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773312844; x=1804848844;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EhScFGUWucJmlvWL1z6SgxFdCgD8lTSpUHScqyRxxFk=;
  b=dArhdlAQEuwF1nnVlXDQ1kXyU5Cj3N5RjenjQf5ibBmAfFIsBIudAffY
   0k3KXcPJNsjo8rTFeTGjHnvPSvn2a3gCdaSt69P0GzhfNICVeu8hLj43x
   oim9wTBoW2KgQ19U3NByYKkEFdzEN2zJtkf1mGzWkWG3XRDChlIj5ZjjZ
   Sx8JMWuWNycpdT695qVPayStGM/p8uUe4TGoh4fdpld3W44Z9E6hij8FT
   Mwzip27Yift9ap8Z2xZvYTEQnk5KXEOxqJ5sZ0X5BtZ9MI87zsqrFja0a
   m8wr6QDdXnCvxnqUGvt4MgvIk6miOFpd1tBb4dRdWtEdbcE8OhNUQK+z3
   g==;
X-CSE-ConnectionGUID: W3QElPR2S/StrB+azxOVyQ==
X-CSE-MsgGUID: PLjEyqAtTbqW5n70PuCcJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="221636222"
X-IronPort-AV: E=Sophos;i="6.23,116,1770562800"; 
   d="scan'208";a="221636222"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 19:54:03 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 978411000A15
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:54:04 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 473E91C10084
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:54:04 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 649F118005B4;
	Thu, 12 Mar 2026 10:54:01 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 46/64] python3-pyais: upgrade 2.15.0 -> 2.20.0
Date: Thu, 12 Mar 2026 18:52:02 +0800
Message-ID: <20260312105220.1856-46-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260312105220.1856-1-wangmy@fujitsu.com>
References: <20260312105220.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:54:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125146

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pyais_2.15.0.bb => python3-pyais_2.20.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyais_2.15.0.bb => python3-pyais_2.20.0.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-pyais_2.15.0.bb b/meta-python/recipes-devtools/python/python3-pyais_2.20.0.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-pyais_2.15.0.bb
rename to meta-python/recipes-devtools/python/python3-pyais_2.20.0.bb
index 3f124a750d..ce53d39476 100644
--- a/meta-python/recipes-devtools/python/python3-pyais_2.15.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyais_2.20.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=79d9e278b76e3e5b3358cd70b328173c"
 
 SRC_URI = "git://github.com/M0r13n/pyais;protocol=https;branch=master;tag=v${PV}"
 
-SRCREV = "7350f9db65ad715e582979bf389133bde07f5e10"
+SRCREV = "2fc03eee875dd2c54af1220bb876651725c8e559"
 
 inherit python_setuptools_build_meta ptest-python-pytest
 
-- 
2.43.0


