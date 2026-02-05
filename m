Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D49DFEA797B
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 05:15:47 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14221.1770268537367028812
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Feb 2026 21:15:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HSZmYrqK;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770268537; x=1801804537;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fH7IvQarMcfSdfkDPrfKGjrq5jnNXsdrXgEDOOWsrhk=;
  b=HSZmYrqKb9m+7aFeEL/YgMJC3QLlehyOcXAk4iB91u+enaGamCUaLCB5
   saRKdQmYNK6d6FUWIFI/7mRMukVe5hdYV2VeKI9xnZSs9tvjaRfbTBWo2
   BiIl4/jfcDxSR/G+MsJ80dsDnQ8mKSaRa7svg0e82MeAWvZUaEx+5F/b8
   GHtFwUsxT+3ZA0iLLvbNJEcyoO18imoa7FUELHFVtGKo/z2Ta7Ks2VeJ6
   jrB7opzWhSv4ojth0Of0VcQIUO1LKisSr1VOj03WYmXwj+X23DuxPUTEy
   uHVYVv42uOT+8C3chhjJ5YeARTb79UeYy8IAym05wU3cvnpC8QhiMDpNj
   g==;
X-CSE-ConnectionGUID: a1T/ouq9ReC0k6DOn5+osg==
X-CSE-MsgGUID: BS1+RiqDQGKBJeKVsabRuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="217208172"
X-IronPort-AV: E=Sophos;i="6.21,274,1763391600"; 
   d="scan'208";a="217208172"
Received: from unknown (HELO mail.fujitsu.com) ([20.61.8.234])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 14:15:35 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.fujitsu.com (Postfix) with ESMTPS id D10F6100036D
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Feb 2026 05:15:35 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 84346C00FEF
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Feb 2026 05:15:35 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id DFDEC20000C6;
	Thu,  5 Feb 2026 05:15:32 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 16/24] python3-cachetools: upgrade 6.2.5 -> 7.0.0
Date: Thu,  5 Feb 2026 13:14:26 +0800
Message-ID: <20260205051435.1366-16-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260205051435.1366-1-wangmy@fujitsu.com>
References: <20260205051435.1366-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 05:15:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124168

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-cachetools_6.2.5.bb => python3-cachetools_7.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cachetools_6.2.5.bb => python3-cachetools_7.0.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-cachetools_6.2.5.bb b/meta-python/recipes-devtools/python/python3-cachetools_7.0.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-cachetools_6.2.5.bb
rename to meta-python/recipes-devtools/python/python3-cachetools_7.0.0.bb
index d87b85fb89..a018bb389d 100644
--- a/meta-python/recipes-devtools/python/python3-cachetools_6.2.5.bb
+++ b/meta-python/recipes-devtools/python/python3-cachetools_7.0.0.bb
@@ -14,6 +14,6 @@ RDEPENDS:${PN} += " \
 	python3-math \
 "
 
-SRC_URI[sha256sum] = "6d8bfbba1ba94412fb9d9196c4da7a87e9d4928fffc5e93542965dca4740c77f"
+SRC_URI[sha256sum] = "a9abf18ff3b86c7d05b27ead412e235e16ae045925e531fae38d5fada5ed5b08"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


