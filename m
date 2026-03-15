Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6DD6EFCBB3
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:36:04 +0000 (UTC)
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28711.1773581757548694864
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:35:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=AcKohsNI;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1112; q=dns/txt;
  s=iport01; t=1773581757; x=1774791357;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=TTTzDL9AfhxbMI2pZmAsjhz6XfmNCRgnFJKYgGm6VYs=;
  b=AcKohsNI+++mxYXGr6VOim9e3Sj5wriUZLU/0XGIiDEYBqXWTtaSjSXd
   0G8OntOvHg9KC5KrRGhQOMg+NVqM7eVzt3RRTPhsJXFw3BEhwBTxsa3wH
   smPub9blDXTtRFrvOd1MiFoGdMYO7n5i+0u/wmzmtmqjF9A4x5XR65pwa
   Y+TpI1ojgUA+LkulCcbmr6b0CAdQUg0ItDs34zxqG8REkRvbE+ffI5jKe
   fcNawZIRFwltrQdPqd4+U/HC3EwRPMg0nEUVKgp9/2o8FNFdhvrI28gGn
   HGgTqLTbUGWxjX6dDYJmJH/l0SavGX4ZLuOe5xD96JH/BFjzHBIVTSCGX
   w==;
X-CSE-ConnectionGUID: MPl5w5ZGTMWDmTRdHJTy/g==
X-CSE-MsgGUID: dUnG4cXNTKqG4w6fnMhEJg==
X-IPAS-Result: =?us-ascii?q?A0DaBQAatbZp/5T/Ja1aglmCSA9xX0JJlCqCIQOeGoF/D?=
 =?us-ascii?q?wEBAQ83GgQBAYUHAo0iAiY0CQ4BAgQBAQEBAwIDAQEBAQEBAQEBAQELAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZchlsCAQMyARgBPSAxKysZgwIBgnMCAbF9giyBAYMoAYFT2?=
 =?us-ascii?q?yYBCxQBgTiFPIgZdIR6JxsbgXKEB3aECoEGhXcEgiKBDpMsSIEeA1ksAVUTD?=
 =?us-ascii?q?QoLBwWBZgM1EioVbjIdgSM+F4ELGwcFhRoPiHJ0bUpJgy0DCxgNSBEsNxQbB?=
 =?us-ascii?q?D5uB416PYIzAT1RgUdoAaYcoQ4KKIN0jB6VOhozqmuZBqRZhGiBaDyBWXAVg?=
 =?us-ascii?q?yIJSRkPjl/MfSM1AjsBAQcCBw0DC4FokACBfQEB?=
IronPort-Data: A9a23:++Nzu6gISeKFf5nAno0IzFRmX161MBEKZh0ujC45NGQN5FlHY01je
 htvUTjUPauPZzehLdl0adyz/B8P7JbUxtA1HAU6/3g1QXtjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FH1dOOn9SUgvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeEULOZ82QsaDxMsPve8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqU9wuIqHjx82
 sA9FxwIUiqPp8CK0fW0H7wEasQLdKEHPasFsX1miDWcBvE8TNWaGuPB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWZgd/5JEWxI9EglHzfjBCoU6VooI84nPYy0p6172F3N/9JI3SFZgIxhfBz
 o7A12jEBD5GP+y59Rmc3S6z2OHJuCPWeo1HQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHt5SN
 UEQ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwBuGxqyR50OSAXIJC2cYLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWra1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:sVngQ6p7VBT1XqPhFa0cqHAaV5oqeYIsimQD101hICG9Ffbo8/
 xG88506faZslsssTQb6LO90cq7MBbhHOBOgLX5VI3KNGKNhILrFvAB0WKI+VLd8kPFmtK1rZ
 0BT0C7Y+eAa2STSq3BkW6FL+o=
X-Talos-CUID: 9a23:h4VGEWOtsOvE6e5DfRFjqVFJKO8ZV0LxyUvqL2+aNXcuR+jA
X-Talos-MUID: 9a23:qPBzewhoufcxXSpSzc8DnMMpOPpuzPilOGYxsowp59baOypVOxq/g2Hi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,122,1770595200"; 
   d="scan'208";a="690855091"
Received: from rcdn-l-core-11.cisco.com ([173.37.255.148])
  by alln-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 15 Mar 2026 13:35:57 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-11.cisco.com (Postfix) with ESMTPS id E499A18000269
	for <openembedded-devel@lists.openembedded.org>; Sun, 15 Mar 2026 13:35:56 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id 5096DCC8D68; Sun, 15 Mar 2026 06:35:56 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-openembedded][master][PATCH 15/24] python3-future: extend recipe for nativesdk builds
Date: Sun, 15 Mar 2026 06:34:32 -0700
Message-Id: <20260315133441.3034831-16-deeratho@cisco.com>
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
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Mar 2026 13:36:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125229

From: Deepak Rathore <deeratho@cisco.com>

Some SDK dependency chains require python3-future to be available
as SDK artifacts. The current metadata only partially provides this,
which can lead to dependency resolution failures when this recipe is pulled
into SDK-oriented builds.

This change does not alter target package behavior; it only enables required
nativesdk variant for build and SDK integration paths.

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 meta-python/recipes-devtools/python/python3-future_1.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-future_1.0.0.bb b/meta-python/recipes-devtools/python/python3-future_1.0.0.bb
index eb66a7d33c..d11b560644 100644
--- a/meta-python/recipes-devtools/python/python3-future_1.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-future_1.0.0.bb
@@ -9,4 +9,4 @@ PYPI_PACKAGE_HASH = "99abde815842bc6e97d5a7806ad51236630da14ca2f3b1fce94c0bb94d3
 
 inherit pypi setuptools3
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.35.6


