Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D96EEFCBA5
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:36:03 +0000 (UTC)
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28887.1773581759159923967
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:35:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=VFuklW0b;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1120; q=dns/txt;
  s=iport01; t=1773581759; x=1774791359;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=FuEQrg+ifsu+6Unh27QMw9lNLUYhZKd7sF8rJfKwpB4=;
  b=VFuklW0b2lJ90intm2jBCV4HfQIYFfssd2MUNPKfw30uKoTwpaWfTDkD
   aDaaW1QdVi5flU023+ghjdd+p+vCrn7ONAZKLSvAt0BvO0w7rhe2IWpLA
   QQybvY4deD3FBQ4sop8PysjFr4Gqq9RVUEMi5PFPArh54GtR5FAVkWpmw
   GUa2hvgrmZ+E2wnc3sBEMD0Tlw/1ODkQ694yt4BTmOlZNYEViT6RyodFk
   bFD0p2E1hu9eIYoCTC46yzlFupkDXUDqdOKBtW6XljoVM9hLfihosngYp
   yQQNLCLkPj6pMBz85CUdwRDUQXNpryYUpE8+OHbWzTOfAFOR0wE/lcBnG
   Q==;
X-CSE-ConnectionGUID: Vwxb03w2SR23qhe6r7kfXQ==
X-CSE-MsgGUID: gYHkA4H2SEibKkRcjy2baQ==
X-IPAS-Result: =?us-ascii?q?A0DZBQAatbZp/5T/Ja1aglmCSA9xX0JJlCqCJJ4agX8PA?=
 =?us-ascii?q?QEBDzcaBAEBhQcCjSICJjQJDgECBAEBAQEDAgMBAQEBAQEBAQEBAQsBAQUBA?=
 =?us-ascii?q?QECAQcFgQ4ThlyGWwIBAzIBGAE9IDErKxmDAgGCcwIBsX2CLIEBgygB3HkBC?=
 =?us-ascii?q?xQBgTiFPIgZdIR6JxsbgXKEB3aFEIV3BIIigQ6Bf5EtSIEeA1ksAVUTDQoLB?=
 =?us-ascii?q?wWBZgM1EioVbjIdgSM+F4ELGwcFhRoPiHJ0bYETgy0DCxgNSBEsNxQbBD5uB?=
 =?us-ascii?q?416PYIzAT1RgUdoAaYcoQ4KKIN0jB6VOhozqmuZBqRZhGiBaDyBWXAVgyIJS?=
 =?us-ascii?q?RkPjl/MfSM1AjsBAQcCBw0DC4FokX0BAQ?=
IronPort-Data: A9a23:gjgqHqjXE1UxHF1voWDL5bxoX161MBEKZh0ujC45NGQN5FlHY01je
 htvW2HXbv+PamPyfo1yPtjipElUvZTdyIQyQQRp+ygzHy1jpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FH1dOOn9SUgvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeEULOZ82QsaDxMsPve8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUm5fZ9WTpRr
 8cicmsUbh3dnb21zoKCH7wEasQLdKEHPasFsX1miDWcBvE8TNWaGuPB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWZgd/5JEWxI9EglHzfjBCoU6VooI84nPYy0p6172F3N/9JI3SHZgLzhzHz
 o7A12vIIhIzaPzF8heE+FGvvOTNjHnxUbtHQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHt5SN
 UEQ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwBuGxqyR50OSAXIJC2cYLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWna1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:34AREayzwdR4PTkWqu2PKrPwLb1zdoMgy1knxilNoHtuA6ilfq
 +V8sjzuSWYtN9VYgBCpTniAtjkfZqjz/9ICOAqVN/INjUO+lHYTr2KhrGM/9SPIUHDH5ZmtZ
 uJt8NFebvN5Z8Qt7ec3DWF
X-Talos-CUID: =?us-ascii?q?9a23=3AqnkzcWuQP1iRWsIYCqpb+5fZ6IsbbW3XlCzPeXS?=
 =?us-ascii?q?CUz1wSLDLUwCT9pNdxp8=3D?=
X-Talos-MUID: 9a23:TRPLNgi0LiGkjeJLJG6qRcMpO/ZI4I3yKBo2vJQMmMq+Pi5hYT2UtWHi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,122,1770595200"; 
   d="scan'208";a="690056827"
Received: from rcdn-l-core-11.cisco.com ([173.37.255.148])
  by alln-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 15 Mar 2026 13:35:57 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-11.cisco.com (Postfix) with ESMTPS id 36C0818000261
	for <openembedded-devel@lists.openembedded.org>; Sun, 15 Mar 2026 13:35:57 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id 545F6CC8D69; Sun, 15 Mar 2026 06:35:56 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-openembedded][master][PATCH 16/24] python3-icu: extend recipe for native/nativesdk builds
Date: Sun, 15 Mar 2026 06:34:33 -0700
Message-Id: <20260315133441.3034831-17-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260315133441.3034831-1-deeratho@cisco.com>
References: <20260315133441.3034831-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-11.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Mar 2026 13:36:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125243

From: Deepak Rathore <deeratho@cisco.com>

Some SDK dependency chains require python3-icu to be available
as host/SDK artifacts. The current metadata only partially provides this,
which can lead to dependency resolution failures when this recipe is pulled
into SDK-oriented builds.

This change does not alter target package behavior; it only enables required
native/nativesdk variants for build and SDK integration paths.

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 meta-python/recipes-devtools/python/python3-icu_2.16.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-icu_2.16.1.bb b/meta-python/recipes-devtools/python/python3-icu_2.16.1.bb
index 44d8b9a701..52a17e430c 100644
--- a/meta-python/recipes-devtools/python/python3-icu_2.16.1.bb
+++ b/meta-python/recipes-devtools/python/python3-icu_2.16.1.bb
@@ -18,3 +18,5 @@ inherit pkgconfig pypi python_setuptools_build_meta
 
 # it's lowercase pyicu instead of ${PYPI_PACKAGE} in this version
 S = "${UNPACKDIR}/pyicu-${PV}"
+
+BBCLASSEXTEND += "native nativesdk"
-- 
2.35.6


