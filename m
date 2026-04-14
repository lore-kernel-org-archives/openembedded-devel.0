Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F43CED7BB0
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 10:40:19 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15982.1776163214916307199
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Apr 2026 03:40:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LurDhrU9;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776163217; x=1807699217;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3Lk4oDdTNC4UD6ASu0GA1JNkPRx2WQpHvuafNXBrC4Y=;
  b=LurDhrU96GmcRf6o0c631m1PCdv3D5XR2fHyfbyYNa3JSbTs8a3Zxa1/
   2qGt9OzPjU21j4QvkpwPD2mRfanI3raC8ZugCr3tHriN8O65Qs1ej1q53
   csL9lO2wFaiF7CGAAuHltaz/kvwlyEFmmW2gEqG6IF0CO7ZadQQMo6jEw
   HzPJyYc1hCGIfbdSFGHB6TmhcumWfzhx+JGjFeqVbWjTmcvWsx3fsf6yr
   jvdtWJq5OVtZ+IR0mpiQAyFnvug6L0TV1zPk1weGmRMhPJtGNKR2mfi0P
   gV74swrJBNvvRmmfxTebdWM2uHJKejkjbrUi5DtTcBUDqkm7NChbF1SnV
   Q==;
X-CSE-ConnectionGUID: IYoBLt0CSC6vyEOdlVfEfg==
X-CSE-MsgGUID: zmdVFRSBTfKAMke+vEOdfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="236851667"
X-IronPort-AV: E=Sophos;i="6.23,179,1770562800"; 
   d="scan'208";a="236851667"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 19:40:17 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 1C36E42A30D
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:40:16 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id BD3BB1000276
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:40:15 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 041FB14001D2;
	Tue, 14 Apr 2026 10:40:12 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 16/32] python3-google-auth: upgrade 2.48.0 -> 2.49.2
Date: Tue, 14 Apr 2026 18:38:29 +0800
Message-ID: <20260414103845.1728-16-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260414103845.1728-1-wangmy@fujitsu.com>
References: <20260414103845.1728-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:40:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126320

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-google-auth_2.48.0.bb => python3-google-auth_2.49.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-auth_2.48.0.bb => python3-google-auth_2.49.2.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-google-auth_2.48.0.bb b/meta-python/recipes-devtools/python/python3-google-auth_2.49.2.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-google-auth_2.48.0.bb
rename to meta-python/recipes-devtools/python/python3-google-auth_2.49.2.bb
index 4e48c62861..fc6df70f45 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth_2.48.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth_2.49.2.bb
@@ -9,7 +9,7 @@ SRC_URI += " \
         file://0001-python3-google-auth-Skip-mTLS-tests-in-ptest-environ.patch \
         file://run-ptest \
 "
-SRC_URI[sha256sum] = "4f7e706b0cd3208a3d940a19a822c37a476ddba5450156c3e6624a71f7c841ce"
+SRC_URI[sha256sum] = "c1ae38500e73065dcae57355adb6278cf8b5c8e391994ae9cbadbcb9631ab409"
 
 PYPI_PACKAGE = "google_auth"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.43.0


