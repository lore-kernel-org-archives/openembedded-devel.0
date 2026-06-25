Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 561ADCDE00A
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 09:02:18 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7234.1782378129427242070
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2026 02:02:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fADuisrt;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782378131; x=1813914131;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dBiBeCEL8KZ4sxEhoHRllES/NQVo16qxGe6kvV0nHxQ=;
  b=fADuisrtNMRD617UlnvAcNCIcF1gTYXSZg3nzsDC12ZEmbIvCDo6D2Si
   zXP2idNk37WuT5SEP3NvtCAaH5/6MnJ2w43gJVlvaATCUDm0o+RaK+zZ/
   psPFXIY0sBNYFxEGYoYGq6oYrGpZF57vzJCH1rbmIINGek1Bo8nuN32tO
   oEJ3mpAiAtWgoQI4tO2MXyCH2yQkYZlnGN5oNjZQorypP0GFMaqIGJQER
   pWMzrj8W6O3pI6dicbxXRf40K/+HaZo2fv9h01AsCqGIfeXVuEg9D0Vr0
   6MSzH9xoRId36yHa/0AGsHbQyjj9wC01Kb6cpvQtuw24WoyuTlIT8qk3W
   Q==;
X-CSE-ConnectionGUID: qupXYG9eSZiBS7yFfXliuA==
X-CSE-MsgGUID: agR5cEt+R52Yqa/DSvQPOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="231468225"
X-IronPort-AV: E=Sophos;i="6.24,224,1774278000"; 
   d="scan'208";a="231468225"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 18:02:10 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 5CC5B1002B87
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:09 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (unknown [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 17EF28267B4
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:09 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 29F941017325;
	Thu, 25 Jun 2026 09:02:06 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 24/47] python3-google-auth: upgrade 2.54.0 -> 2.55.0
Date: Thu, 25 Jun 2026 17:01:04 +0800
Message-ID: <20260625090127.1563-24-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260625090127.1563-1-wangmy@fujitsu.com>
References: <20260625090127.1563-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127756

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- make RAB feature production ready
- run async background boundary refresh on detached session

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-google-auth_2.54.0.bb => python3-google-auth_2.55.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-auth_2.54.0.bb => python3-google-auth_2.55.0.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-google-auth_2.54.0.bb b/meta-python/recipes-devtools/python/python3-google-auth_2.55.0.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-google-auth_2.54.0.bb
rename to meta-python/recipes-devtools/python/python3-google-auth_2.55.0.bb
index b7b5a416a9..aa0e7fd400 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth_2.54.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth_2.55.0.bb
@@ -9,7 +9,7 @@ SRC_URI += " \
         file://0001-python3-google-auth-Skip-mTLS-tests-in-ptest-environ.patch \
         file://run-ptest \
 "
-SRC_URI[sha256sum] = "130f6fd5e3f497fdad897a23ed9489973437edf561238c4b92a4d02c435f8af9"
+SRC_URI[sha256sum] = "fcd3a130f575fa36403d38774af1c64a4fbfbca09215f0589d2372b5119697cb"
 
 PYPI_PACKAGE = "google_auth"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.43.0


