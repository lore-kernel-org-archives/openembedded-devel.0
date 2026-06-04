Return-Path: <sudumbha@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B86DCD6E78
	for <webhook@archiver.kernel.org>; Thu,  4 Jun 2026 14:41:34 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13229.1780584087846696698
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Jun 2026 07:41:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=XlZEcXux;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: sudumbha@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1454; q=dns/txt;
  s=iport01; t=1780584087; x=1781793687;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=EJlcH0C7f3DT3Da40B5/qenTu+SmdZe33VdgpJ4zeWU=;
  b=XlZEcXux7toX/ng1eYU8GXpWBcAhKIE+gfB8IIjcKu5Mq1s9pReRyWeV
   METJG0a2zn+vCqnhUO+JcAoHFKNxTEVtfNldwwKjV0OfbwvxpbJx1ru66
   ZCa2/B1N5LKnME1duFD8NAIG7/S3kitfX3neXfFPTFOpbyQfies15JHki
   uAk87QCxQHljCFtALnHBYBoh/h8WGUwc+KFuVaePRXhy8Mp90J36tri+r
   yFfOe/j2izcrn7QBfKwp+ScH9ZZyvCdHZ3Oth1Zi6HjGhbBR7KtWoIgvd
   JRYt8M9e/pwvIw5DDZ1N5S1U04siUIlcLWa80Zeu8L+bel0PUGR0+KCI/
   g==;
X-CSE-ConnectionGUID: 7dJkcrxURF6BFzvXyxST0Q==
X-CSE-MsgGUID: YUvvcCl/QG+TN4T7Qp5fpw==
X-IPAS-Result: =?us-ascii?q?A0DGAgACjSFq/4z/Ja1aglmCV3RfQkmUKoIknhuBfg8BA?=
 =?us-ascii?q?QEPRA0EAQGFBgKNMwImNQgOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDYZbAgEDMgEYAT0gMSsrGYMCAYJzAgERshuCLIEBgygBPwJDUNsqA?=
 =?us-ascii?q?QsUAYE4hT+IHXMBhHsnGxuBcoR9gQWBXAEBgUhlhXcEgiKBDJBVSIEeA1ksA?=
 =?us-ascii?q?VUTDQoLBwWBZgM1EioVbjIdgSM+F4ELGwcFgUqBSWqBAoUSIx8DOYEXgXyBK?=
 =?us-ascii?q?GlpFTFFAwsYDUgRLDcUGwQ+bgeMKBcPgjcxXSyoIqEOCiiDdIwhlToaM6prC?=
 =?us-ascii?q?5h7jgmVZmmEaIFqAzeBRwsHcBWDIglKGQ+OOCeDRIF/xTEkNQIJMgEBBwIHD?=
 =?us-ascii?q?gMLgWiRfQEB?=
IronPort-Data: A9a23:UkENZKjKZ4nm7ZyszSXKbx9dX161MBEKZh0ujC45NGQN5FlHY01je
 htvDzyEP6uLN2b2L410Poiz9koP78OEmoVgS1A/rXg1RCJjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FH1dOOn9SUgvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeDULOZ82QsaDxMtfrf8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqVH9sR0Cntey
 MY2dhojfA6zlvKN/OqCH7wEasQLdKEHPasFsX1miDWcBvE8TNWbGOPB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWZg9/5JEWxI9EglHkbjFFrViVrII84nPYy0p6172F3N/9JozbFZgPzxbJz
 o7A11XEHA8RH9jY8BXGzlTwurD2hX71QJ1HQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHt5SN
 UEQ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwBuGxqyR50OSAXIJC2YaLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWra1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:k+7u/6iwfxnaMO2VmueaXispAHBQXvYji2hC6mlwRA09TyX+rb
 HLoB1173HJYVoqNU3I3OrwW5VoIkmskKKdn7NxAV7KZmCP0wGVxcNZnOnfKlbbdBEWmNQw6U
 4ZSchDIey1K0RmhsDn5wT9OdMhzN6btJ2Mv47lvhBQpcUAUdAY0++/YTzrdHFLeA==
X-Talos-CUID: 9a23:Oe5YcmMCURirVe5DByVF90UOCv0fXCP34mXOE16oMloxcejA
X-Talos-MUID: =?us-ascii?q?9a23=3AdIIjUQ0ZTK2qRc/iZ2D12pGxdjUj0pmwFksmldI?=
 =?us-ascii?q?/lIq4E3BMZA6F0TqvXdpy?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,187,1774310400"; 
   d="scan'208";a="489852989"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 04 Jun 2026 14:41:27 +0000
Received: from sjc-ads-12007.cisco.com (sjc-ads-12007.cisco.com [171.70.97.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id E5B6E18000617
	for <openembedded-devel@lists.openembedded.org>; Thu,  4 Jun 2026 14:41:26 +0000 (GMT)
Received: by sjc-ads-12007.cisco.com (Postfix, from userid 1840713)
	id 936B5CB6A93; Thu,  4 Jun 2026 07:41:26 -0700 (PDT)
From: "Sudhir Dumbhare -X (sudumbha - E INFOCHIPS PRIVATE LIMITED at Cisco)" <sudumbha@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][scarthgap][PATCH 3/3] python3-grpcio-tools: set status for CVE-2024-11407
Date: Thu,  4 Jun 2026 07:39:09 -0700
Message-Id: <20260604143907.2864663-3-sudumbha@cisco.com>
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
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Jun 2026 14:41:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127401

From: Sudhir Dumbhare <sudumbha@cisco.com>

Analysis:
- CVE-2024-11407 [1] affects gRPC-C++ servers with transmit zero copy enabled.
- The upstream fix modifies gRPC core runtime source
  src/core/lib/event_engine/posix_engine/posix_endpoint.cc [2].
- python3-grpcio-tools does not include or compile this runtime source.
- Hence CVE-2024-11407 is not applicable to python3-grpcio-tools.

[1] https://nvd.nist.gov/vuln/detail/CVE-2024-11407
[2] https://github.com/grpc/grpc/commit/e9046b2bbebc0cb7f5dc42008f807f6c7e98e791

Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
---
 .../recipes-devtools/python/python3-grpcio-tools_1.62.2.bb       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.62.2.bb b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.62.2.bb
index 63abf6e3cf..71cabf0d01 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.62.2.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.62.2.bb
@@ -26,3 +26,4 @@ CVE_PRODUCT += "grpc:grpc"
 
 CVE_STATUS[CVE-2026-33186] = "cpe-incorrect: this CVE is for golang version of grpc"
 CVE_STATUS[CVE-2024-7246] = "not-applicable-config: the vulnerable gRPC C-core HPACK parser code is not present in grpcio-tools"
+CVE_STATUS[CVE-2024-11407] = "not-applicable-config: CVE affects gRPC C++ server zero-copy transport code, which is not present in grpcio-tools"
-- 
2.35.6


