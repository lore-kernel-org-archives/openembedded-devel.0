Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9A0EEFCBAB
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:36:03 +0000 (UTC)
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28883.1773581757440479503
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:35:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=fiycXE1f;
 spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1033; q=dns/txt;
  s=iport01; t=1773581757; x=1774791357;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=10EdQPUoQZr+l24rujjWKGT5992MGGKN2jiwFKoEB5g=;
  b=fiycXE1f1n/e2ODg62nDy01hCfyvpM4dHWteRWCvYUmw4LGKMeevhmo2
   Vz9BVkyh/Pde8HGKNloDiG82XqeNjGnrtH2gR2mqRKG9AfwyE3unssuN5
   LCuRz55SnLDiYe8/PMS+BMg5B+snNDC0DryQG5NYsbj8YTXrKF0Oioiwt
   Hel5Yec3sQWz5lqb02jPbYiu5TPXaeOmNTSfDlJxayBM9eX4BVqq+qwks
   Wq76QIe0U1A4M2I3neQ1LcrU0Q6U0k44qy/dO5E7wW1bAgRB4YDiJkERL
   LooxgOgkGVedUs9/coTEZfP2Id5sopvw8opj5/Cm2W0YDcMax8ckRwDeQ
   Q==;
X-CSE-ConnectionGUID: Q8lPNyyyR5GiaSyPR5jOrQ==
X-CSE-MsgGUID: vpP8i8jCSsCnOM4lRyWirg==
X-IPAS-Result: =?us-ascii?q?A0DcBQCAtLZp/4//Ja1agjQQGoJED3FfQkmUKoIknhqBf?=
 =?us-ascii?q?w8BAQEPNxoEAQGFBwKNIgImNAkOAQIEAQEBAQMCAwEBAQEBAQEBAQEBAQoBA?=
 =?us-ascii?q?QUBAQECAQcFgQ4ThlyGWwIBAzIBGAE9IDErKxmDAgGCcwIBtUaCLIEBgygBt?=
 =?us-ascii?q?lsBCxQBgTiFPIgZdIR6JxsbgXKEB3aFEIV3BIIigQ6Bf5EtSIEeA1ksAVUTD?=
 =?us-ascii?q?QoLBwWBZgM1EioVbjIdgSM+F4ELGwcFhRoPiHJ0bYETgy0DCxgNSBEsNxQbB?=
 =?us-ascii?q?D5uB416PYIzAT1RgUdoAaYcoQ4KKIN0jB6VOhozqmuZBqRZhGiBaDyBWXAVg?=
 =?us-ascii?q?yIJSRkPjl/KAiM1AjsBAQcCBw0DC4FokX0BAQ?=
IronPort-Data: A9a23:psx1+6Id55bYXuVkFE+RlpQlxSXFcZb7ZxGr2PjKsXjdYENShj0Pz
 mFLX2iCaarcMzOmeo1yaN/jp08HscTcx4I1Sgcd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZpCCea/Un3WlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnW0
 T/Oi5eHYgH9gGcpajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKmWDNrfnL
 wpr5OjRElLxp3/BOPv8+lrIWhFirorpAOS7oiE+t55OLfR1jndaPq4TbJLwYKrM4tmDt4gZJ
 N5l7fRcReq1V0HBsLx1bvVWL81xFZQW/IfhMGmui5G8zkT9YkPWnvdJFnhjaOX0+s4vaY1P3
 eYTJDZIalWIgPi7herlDOJtnc8kasLsOevzuFk5kmqfVqlgG82eBfyWvre03x9o7ixKNfrTa
 tAQdTpoRB/BeBZIfFwQDfrSmc/33iavI20H+AL9Sawf/XDrnA0h0pPWK/HTXfnWQf9EoUeCq
 TeTl4j+KlRAXDCF8hKC6n+qi+rFkC/3VY5XGLCm+/pChFyI2ndVDwUbU1a+q/S1hkOyHdVFJ
 CQpFjEGt6M+8gmvC9L6RRD9+CDCtR8HUN0WGOo/gO2Q9pfpD8+iLjBsZlZ8hBYO7afamRRCO
 oe1ou7U
IronPort-HdrOrdr: A9a23:A4vkeayrit1P/3aM69VLKrPwLb1zdoMgy1knxilNoHtuA6ilfq
 +V8sjzuSWYtN9VYgBCpTniAtjkfZqjz/9ICOAqVN/INjUO+lHYTr2KhrGM/9SPIUHDH5ZmtZ
 uJt8NFebvN5Z8Qt7ec3DWF
X-Talos-CUID: =?us-ascii?q?9a23=3A6T3CTWlY1AODiqnbpg/1QL6aqk/XOUSNyE/2Ml6?=
 =?us-ascii?q?pMztGSbSuWGeqpaFDifM7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3A3jxuQg/J694tPPk9oPc/aOSQf9lw2/SvWEImqo4?=
 =?us-ascii?q?tve6haShKKgicljviFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,122,1770595200"; 
   d="scan'208";a="707888788"
Received: from rcdn-l-core-06.cisco.com ([173.37.255.143])
  by alln-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 15 Mar 2026 13:35:57 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-06.cisco.com (Postfix) with ESMTPS id DF92B1800026C
	for <openembedded-devel@lists.openembedded.org>; Sun, 15 Mar 2026 13:35:56 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id 4799CCC8D5B; Sun, 15 Mar 2026 06:35:56 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-openembedded][master][PATCH 13/24] python3-arrow: extend recipe for native/nativesdk builds
Date: Sun, 15 Mar 2026 06:34:30 -0700
Message-Id: <20260315133441.3034831-14-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260315133441.3034831-1-deeratho@cisco.com>
References: <20260315133441.3034831-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-06.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Mar 2026 13:36:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125224

From: Deepak Rathore <deeratho@cisco.com>

Some SDK dependency chains require python3-arrow to be available
as host/SDK artifacts. The current metadata only partially provides this,
which can lead to dependency resolution failures when this recipe is pulled
into SDK-oriented builds.

This change does not alter target package behavior; it only enables required
native/nativesdk variants for build and SDK integration paths.

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 meta-python/recipes-devtools/python/python3-arrow_1.4.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-arrow_1.4.0.bb b/meta-python/recipes-devtools/python/python3-arrow_1.4.0.bb
index a967f9e429..2c96704426 100644
--- a/meta-python/recipes-devtools/python/python3-arrow_1.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-arrow_1.4.0.bb
@@ -26,3 +26,4 @@ RDEPENDS:${PN} += " \
     python3-dateutil \
     python3-tzdata \
 "
+BBCLASSEXTEND += "native nativesdk"
-- 
2.35.6


