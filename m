Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FD07D3B7EA
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 05:56:39 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.861.1765259792085495471
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Dec 2025 21:56:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=KTOFW9js;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1765259792; x=1796795792;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=m2Sre4K1s34oeIXT/Epel040UxrUaxX5/2pSzwmFRsg=;
  b=KTOFW9js5Gb2nqp5tCQnbyFNZ4Mp66jmaxYiP9+QEx9DJ2sSj4iLorFb
   NHRJF0bCExKdjy35i0IX8h2CFPQhvkY9XHmyBskwkK/Wwo4y9F7YrN96I
   IR3PFBV6sifFDd7z1Uzfukh7h58wpVgihnpUNbhIxJYeowGxnY1OwGKFD
   136szz8538SFtNpaFOkRAijurMbx3/EShzIZtO7l+PQsgZPKzde3Ya7ux
   kuVdpWxW+dllpJRNhf+ZzLY0ehJtIXWGugyBcRq9jL9LHZ+84bH95BR4h
   X3Z8wvjYS5rfKycfguVGGfyVXtzBeXklCp91nAaiQQYS4DNneoM3NoEln
   A==;
X-CSE-ConnectionGUID: cI7QhrjhSEmttVBPePoOhQ==
X-CSE-MsgGUID: LPgNFZmtTeSQn353h4QaGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="200918194"
X-IronPort-AV: E=Sophos;i="6.20,260,1758553200"; 
   d="scan'208";a="200918194"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.19])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 14:56:30 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 5AAEFC015A9
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 05:56:30 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 0F4C4C02F10
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 05:56:30 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id BE7C9180053E
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 05:56:27 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][PATCH 4/5] python3-protobuf: upgrade 6.33.1 -> 6.33.2
Date: Tue,  9 Dec 2025 13:56:24 +0800
Message-ID: <20251209055624.22354-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 05:56:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122397

Change log:
https://github.com/protocolbuffers/protobuf/releases/tag/v33.2

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../{python3-protobuf_6.33.1.bb => python3-protobuf_6.33.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-protobuf_6.33.1.bb => python3-protobuf_6.33.2.bb} (95%)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_6.33.1.bb b/meta-python/recipes-devtools/python/python3-protobuf_6.33.2.bb
similarity index 95%
rename from meta-python/recipes-devtools/python/python3-protobuf_6.33.1.bb
rename to meta-python/recipes-devtools/python/python3-protobuf_6.33.2.bb
index fcf53cb9a0..d0ef7753b0 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_6.33.1.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_6.33.2.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = " \
 "
 
 inherit pypi setuptools3
-SRC_URI[sha256sum] = "97f65757e8d09870de6fd973aeddb92f85435607235d20b2dfed93405d00c85b"
+SRC_URI[sha256sum] = "56dc370c91fbb8ac85bc13582c9e373569668a290aa2e66a590c2a0d35ddb9e4"
 
 CVE_PRODUCT += "google:protobuf protobuf:protobuf google-protobuf protobuf-python"
 
-- 
2.43.0


