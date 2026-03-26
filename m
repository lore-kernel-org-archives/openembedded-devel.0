Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C510210A3D63
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:57:43 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45651.1774526253795588515
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:57:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=skhDS1iI;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1774526252; x=1806062252;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=P5FydwCOWWc/ZBA5eac3qAFB402OHCVhX7hM+j3n3BU=;
  b=skhDS1iIWnlXGwHzNFwpZVSquzfPXCQKfqxv9d+5p7kPCTQ25EhesDnf
   PCGjji9n1tYUodc1YZWAh1ksWH+hUdRQkaoWonfgkK5cmK62dlHYyQ/Fw
   7/R9vhF5/ppUSZVpWw0Jwt+fPMlhkDw2oaUhzwrrjmjwTTmvM8Z1lLVHB
   4EV0RZUBsCkiK6xNAH9TCPevb8C9bA7aB/e85tJ9CwEUcTmE9/dv7RqPM
   IRRL3/M9Jk1OIEssFZj41vELlyr8ML/G6AmyfYAn1VFotwizIFsQ8Vtie
   EH8yefxTHzcigmlP8e//PE+SiAAE+AFJOFNU6WURyT+miyRydg2665cbw
   Q==;
X-CSE-ConnectionGUID: l3Q6V2agQPmOF0DVWnul9g==
X-CSE-MsgGUID: QmNdFvZOQYOmZvKmHCJl3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="222181278"
X-IronPort-AV: E=Sophos;i="6.23,142,1770562800"; 
   d="scan'208";a="222181278"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 20:57:30 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 68B9E42A313
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:32 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 1834B18009DA
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:32 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 95D7D1807162;
	Thu, 26 Mar 2026 11:57:29 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 32/63] python3-faker: upgrade 40.8.0 -> 40.11.0
Date: Thu, 26 Mar 2026 19:56:02 +0800
Message-ID: <20260326115634.1199-32-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260326115634.1199-1-wangmy@fujitsu.com>
References: <20260326115634.1199-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125687

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- Add major Swiss banks to de_CH bank provider.
- Fix: mixed-gender names in es_MX locale.
- Fix pt_PT postalcode format in address provider.
- Fix mutable default providers.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-faker_40.8.0.bb => python3-faker_40.11.0.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-faker_40.8.0.bb => python3-faker_40.11.0.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-faker_40.8.0.bb b/meta-python/recipes-devtools/python/python3-faker_40.11.0.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-faker_40.8.0.bb
rename to meta-python/recipes-devtools/python/python3-faker_40.11.0.bb
index 36c81ded0b..c163bbb16d 100644
--- a/meta-python/recipes-devtools/python/python3-faker_40.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-faker_40.11.0.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/joke2k/faker"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=53360c4126f7d03b63cb79b0dab9e9e1"
 
-SRC_URI[sha256sum] = "936a3c9be6c004433f20aa4d99095df5dec82b8c7ad07459756041f8c1728875"
+SRC_URI[sha256sum] = "7c419299103b13126bd02ec14bd2b47b946edb5a5eedf305e66a193b25f9a734"
 
 inherit pypi setuptools3 ptest-python-pytest
 
-- 
2.43.0


