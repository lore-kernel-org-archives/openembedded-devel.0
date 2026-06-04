Return-Path: <sudumbha@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88A55CD6E4A
	for <webhook@archiver.kernel.org>; Thu,  4 Jun 2026 14:41:04 +0000 (UTC)
Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13228.1780584063772843336
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Jun 2026 07:41:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=dhJxY9Xa;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: sudumbha@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1554; q=dns/txt;
  s=iport01; t=1780584063; x=1781793663;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=ogeyxYtyHnktIahoU7a7F3ENSw/1ilKQzVv/Ep21DWc=;
  b=dhJxY9Xabtk/lBio8mJdk6xBdcwEImAr3CmvIVYEecmw5VGUXJl3BbQa
   TND960/pwhPtAKWql1P9H3biqYdzBg8YEF+0JW8v2wk0tpWxSQlaoQecK
   rz6kOrlbjbmIbOY3h+ymjmVjaRFBJ2Nbvz0tjUqdKxmOEO+rY+YtbKsQP
   jgsZnQrVfdKzHl803kREP2JiDe8u8YOh0T7Y956PdBxVbkjIr76qPyxgJ
   kvjrsPwZzfu+of5pAV2/VZs4CRmco6aT12Krek+0bN0qvnkPpAalTDHaz
   NnhDpBcQyXgVHYqyCKG/Xid3SmNaETxjyvyFUnL4huJtD6fj/d+aCqZd0
   g==;
X-CSE-ConnectionGUID: znVeGVlERZOsUflYmoFKXg==
X-CSE-MsgGUID: UwAriXXKT8aKJe+2saEC3w==
X-IPAS-Result: =?us-ascii?q?A0D6AgB/jSFq/4z/Ja1aglmCV3RfQkmUKoIknhuBfg8BA?=
 =?us-ascii?q?QEPRA0EAQGFBgKNMwImNgcOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDYZbAgEDMgEYAT0gMSsrGYMCAYJzAgERsh6CLIEBgygBMQUJAkNQ2?=
 =?us-ascii?q?yoBCxQBgTiFP4gdcwGEeycbG4FyhH2BBYFcAQECGIIThXcEgiKBDJBVSIEeA?=
 =?us-ascii?q?1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4ELGwcFgUqBSWqBAoUSIx8DOYEXg?=
 =?us-ascii?q?XyBKGlpFTFFAwsYDUgRLDcUGwQ+bgeMKBcPgjd7EyyBGKcKoQ4KKIN0jCGVO?=
 =?us-ascii?q?hozqmuZBo4JlWZphGiBbwUwgUcLB3AVgyIJShkPjjgng0SBf8UxJDUCCTIBA?=
 =?us-ascii?q?QcCBw4DC4FokX0BAQ?=
IronPort-Data: A9a23:WVzmSarIKALyxWeI2SnOO55INQ9eBmJIZBIvgKrLsJaIsI4StFCzt
 garIBmAOauIN2P9KIwlO4i/904Bu5Pcm4VgHlBp+CAyFiMa8+PIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOCn9j8kif3gqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgPNNwJcaDpOtfrd8E835ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0vRxP2xhy
 /g1EgIqdS2Ng9Ozx5yYeuY506zPLOGzVG8ekmtrwTecCbMtRorOBv2Ro9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5LUPrSn8/w7pX7WyZFpE+Qr6o+y2PS1wd2lrPqNbI5f/TWFZUExxbI/
 jyuE2LRPw4zLt2v+Rm5onuPpOKMxzjydalJC+jtnhJtqBjJroAJMzURTVa9rPyzh0KyVt4aJ
 0EK9y4Gqakp6FftScHwWRC9qnOIshMQHd1KHIUHBBql0KHY5UOdQ2MDVDMEMIdgv84tTjts3
 ViM9z/0OQFSXHSuYSr13t+pQfmaYED58Udqifc4cDY4
IronPort-HdrOrdr: A9a23:gh2sHKCenfVYXy3lHemA55DYdb4zR+YMi2TDsHoBLSC9Hfb3qy
 nDppkmPFrP+VUssRIb6LW90de7IE80nKQdieJ6AV7hZniFhILCFu5fBOXZrwEIYxefysdtkY
 F9bqN5FNr8SXJ+jcr8/U2ENuxI+qjhzEht7t2utkuEimpRGsdd0zs=
X-Talos-CUID: =?us-ascii?q?9a23=3At1U9FWpAfb3cc4kQ+lFfAOLmUdIjTHDy8nP9GX2?=
 =?us-ascii?q?fEltnTIyQTnGzyKwxxg=3D=3D?=
X-Talos-MUID: 9a23:+ugYIQgsVw4RRK78nC3VgMMpCdhB+aWeOGMxwZwlmcTHbzd5FhzGk2Hi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,187,1774310400"; 
   d="scan'208";a="488918806"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 04 Jun 2026 14:41:02 +0000
Received: from sjc-ads-12007.cisco.com (sjc-ads-12007.cisco.com [171.70.97.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id C5FB01800063A
	for <openembedded-devel@lists.openembedded.org>; Thu,  4 Jun 2026 14:41:02 +0000 (GMT)
Received: by sjc-ads-12007.cisco.com (Postfix, from userid 1840713)
	id 73C65CB6A93; Thu,  4 Jun 2026 07:41:02 -0700 (PDT)
From: "Sudhir Dumbhare -X (sudumbha - E INFOCHIPS PRIVATE LIMITED at Cisco)" <sudumbha@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][scarthgap][PATCH 2/3] python3-grpcio-tools: set status for CVE-2024-7246
Date: Thu,  4 Jun 2026 07:39:07 -0700
Message-Id: <20260604143907.2864663-2-sudumbha@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260604143907.2864663-1-sudumbha@cisco.com>
References: <20260604143907.2864663-1-sudumbha@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-12007.cisco.com [171.70.97.7];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.97.7, sjc-ads-12007.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Jun 2026 14:41:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127400

From: Sudhir Dumbhare <sudumbha@cisco.com>

Analysis:
- CVE-2024-7246 [4] affects gRPC-C++ CHTTP2 HPACK parser error handling.
- The upstream fix from v1.62.3 [1] modifies gRPC core runtime source
  src/core/ext/transport/chttp2/transport/hpack_parser.cc.
  aligned with the original fix in v1.60.2 [2] as referenced in [3].
- python3-grpcio-tools does not include or compile this runtime source.
- Hence CVE-2024-7246 is not applicable to python3-grpcio-tools.

[1] https://github.com/grpc/grpc/commit/1d172cfca56440889ca32ae516b8c2767321f5b5
[2] https://github.com/grpc/grpc/commit/88b1244fd43e81860baa60cc7fb3945a2cca0d11
[3] https://bugzilla.suse.com/show_bug.cgi?id=1228919
[4] https://nvd.nist.gov/vuln/detail/CVE-2024-7246

Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
---
 .../recipes-devtools/python/python3-grpcio-tools_1.62.2.bb       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.62.2.bb b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.62.2.bb
index 9f14d2e4b5..63abf6e3cf 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.62.2.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.62.2.bb
@@ -25,3 +25,4 @@ BBCLASSEXTEND = "native nativesdk"
 CVE_PRODUCT += "grpc:grpc"
 
 CVE_STATUS[CVE-2026-33186] = "cpe-incorrect: this CVE is for golang version of grpc"
+CVE_STATUS[CVE-2024-7246] = "not-applicable-config: the vulnerable gRPC C-core HPACK parser code is not present in grpcio-tools"
-- 
2.35.6


