Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35E59FD7F63
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 10:14:10 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.92731.1772187248032151110
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Feb 2026 02:14:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=eAVU0ndr;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772187248; x=1803723248;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VeQxlPzV8gNk7FtTppx249euCCc+CHljOl91LId8xwo=;
  b=eAVU0ndr/RC+rbKeY020pnEWzPT4YJDz7LFQzsI/ohXuSQd2XIui0OyG
   lBQU6Q4MEDpKJ6eay1AYiZN4CF+QwZiumxHtJImfty+L9pWqp5OVg4yxB
   qIFhcYozQ1zSsmKFPg+KIzrI5mVjS+YDlnumBtGC9KjolelRMRRfBQGjh
   n++hEibuLpOfAwl75FKw1SN39ktH3CIkC4lH6lEVhNzkO/AJi6vQdkgre
   jEci1yVrv9EOdNdBYU1uA3Di11SsmuRDK+pGmgj6y7ExcsCUnkKePzWX7
   JHEcz9dOUeo0zn+7MZgryCaFD4X61ozZpjCAj0n43Y4dSwecPoZxkevWT
   Q==;
X-CSE-ConnectionGUID: qBnEacQWSmym6ohxb9Hsjw==
X-CSE-MsgGUID: X8cxJK4tRKW5jKVPGI72og==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="231987885"
X-IronPort-AV: E=Sophos;i="6.21,313,1763391600"; 
   d="scan'208";a="231987885"
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 9913B1C000B1
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:14:06 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 501B61009E15
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:14:06 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 789FF18005A1;
	Fri, 27 Feb 2026 10:14:03 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 13/52] python3-google-auth: upgrade 2.47.0 -> 2.48.0
Date: Fri, 27 Feb 2026 18:12:48 +0800
Message-ID: <20260227101327.1432-13-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260227101327.1432-1-wangmy@fujitsu.com>
References: <20260227101327.1432-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:14:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124713

From: Wang Mingyu <wangmy@fujitsu.com>

Features
----------
- honor NO_GCE_CHECK environment variable
- add configurable GCE Metadata Server retries
- add cryptography as required dependency
- Support the mTLS IAM domain for Certificate based Access

Bug Fixes
----------
- resolve circular imports
- Use user_verification=preferred for ReAuth WebAuthn challenge
- removes content-header from AWS IMDS get request
- detect correct auth when ADC env var is set but empty
- replace deprecated utcfromtimestamp

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-google-auth_2.47.0.bb => python3-google-auth_2.48.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-auth_2.47.0.bb => python3-google-auth_2.48.0.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-google-auth_2.47.0.bb b/meta-python/recipes-devtools/python/python3-google-auth_2.48.0.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-google-auth_2.47.0.bb
rename to meta-python/recipes-devtools/python/python3-google-auth_2.48.0.bb
index 3b141006a5..4e48c62861 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth_2.47.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth_2.48.0.bb
@@ -9,7 +9,7 @@ SRC_URI += " \
         file://0001-python3-google-auth-Skip-mTLS-tests-in-ptest-environ.patch \
         file://run-ptest \
 "
-SRC_URI[sha256sum] = "833229070a9dfee1a353ae9877dcd2dec069a8281a4e72e72f77d4a70ff945da"
+SRC_URI[sha256sum] = "4f7e706b0cd3208a3d940a19a822c37a476ddba5450156c3e6624a71f7c841ce"
 
 PYPI_PACKAGE = "google_auth"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.43.0


