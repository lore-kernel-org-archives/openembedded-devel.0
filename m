Return-Path: <hjadon@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BE07CD98E6
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 04:13:38 +0000 (UTC)
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35923.1781842416082164364
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Jun 2026 21:13:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=L/RlwQ52;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: hjadon@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1364; q=dns/txt;
  s=iport01; t=1781842416; x=1783052016;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=cr2bW5DNlp3WiL/7/gm+4Lb7JUKcaCjIiNV/RG/j8BA=;
  b=L/RlwQ52vuZ4joUxHR5pWfyYljCd4tRiuNtPuLfNTR2XM+TCcD/SMnoG
   ICQRc0uPa7Qk6l7W+vlGHtUXThhVh9P/6bqZ7eOp1dc8mIYjpKr9eekfj
   wvEtY+tlP9H2/FjhDLF8uKTssZ9oA7CVbyjoyEn8/yaL+xVcylux6ApTj
   vD3Q5LPXXqJBBhqQFIM9525WH5k0a4TFDqVfXR3vRVUn9Yvq8J7z6uwQY
   a7tlGhOAWzH/D9COSMW6kEit/vuxjjrAijG9TrJ32UNzbkFSspMd5SKky
   tzFa48PCXYjFr6Xu/t6r9rcnZIYEIqjtfHFEe/AV1nTC6naES5R00hqMJ
   A==;
X-CSE-ConnectionGUID: OGZxAIkKRtG+O/qR6zd9sQ==
X-CSE-MsgGUID: Riiw5O2MRHirV7hQNLodtA==
X-IPAS-Result: =?us-ascii?q?A0BCAgBhwTRq/5D/Ja1aglmCV3ReQ0mTWgGhDoF+DwEBA?=
 =?us-ascii?q?Q89FAQBAYUGjUoCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBD?=
 =?us-ascii?q?hOGTw2GXSsLARgBLTBcRIMCAYJzAxGyeIF5M4EBgygBgVTbLAELFAGBOIU/i?=
 =?us-ascii?q?B9zAYR8JxsbgXKEfoQKKlyFeASCInoSgXiPMEiBHgNZLAFVEw0KCwcFgWYDN?=
 =?us-ascii?q?RIqFW4yHYEjPheBDBsHBYEegXuBAoUDIx8DOX+BaIElZ2YVMDWBAQERHwqBJ?=
 =?us-ascii?q?AMLGA1IESw3FBsEPm4HjHcXD4I9gQ4sgj0Hk2KRfKEPCiiDdYwhlToaM4QEp?=
 =?us-ascii?q?miZCIJZogGEaIFoPIFZcBWDIglKGQ+XNr9/JzICOwIHAgcOAwuRaAImgVUBA?=
 =?us-ascii?q?Q?=
IronPort-Data: A9a23:snKMkK7YJgCTz3OGKrWczQxRtG7GchMFZxGqfqrLsTDasY5as4F+v
 mUXXm7UOPrZNjH0eIpyaoq09B4Pv5aAyt5nGlRv+C02Zn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH2dOC98RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/6UzBHf/g2QqajxNu/rfwP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eGqIq6s9WAkJ06
 dNbD3cUVE6Ri7Ot+efuIgVsrpxLwMjDJogTvDRkiDreF/tjGc+FSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkETUrsUIMpWcOOAhnv2fzpegFmUvqEwpWPUyWSd1ZCxYYSMKoDXH509ckCwn
 GPH4DneWDQgFN2F92WFy1SIgePTtHauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8hkOgVtZ3L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4CeY27kSJj6HT+QvcXjdCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1r994cRva1fApEFI/
IronPort-HdrOrdr: A9a23:n4BzC6PFMRJPNMBcTvejsMiBIKoaSvp037Dk7S9MoHtuA6mlfq
 +V/cjzuSWYtN9zYgBDpTn/Asm9qBrnnPYfi7X5Vo3NYOCJggeVxflZnOjf6gylPTHi/ehA0q
 olWa1/BNrsSWVet6/BkW2F+xJK+qjgzEhu7t2uqEtQcQ==
X-Talos-CUID: =?us-ascii?q?9a23=3AMaF/6mtfScRKlm8MZCwU7eiX6IsCXU/N5VbTAHW?=
 =?us-ascii?q?kJiVOD6SvF02cqbhdxp8=3D?=
X-Talos-MUID: 9a23:fSPBhgTErn1TD/ToRXTWhTB9aeAyxp6OCVozzpU/ne2DOTBZbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,212,1774310400"; 
   d="scan'208";a="496184520"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Jun 2026 04:13:35 +0000
Received: from sjc-ads-21441.cisco.com (sjc-ads-21441.cisco.com [10.128.164.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id 30240180003F4;
	Fri, 19 Jun 2026 04:13:35 +0000 (GMT)
Received: by sjc-ads-21441.cisco.com (Postfix, from userid 1879343)
	id C04CECC1611; Thu, 18 Jun 2026 21:13:34 -0700 (PDT)
From: "Himanshu Jadon -X (hjadon - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hjadon@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: vchavda@cisco.com
Subject: [meta-networking][scarthgap][PATCH 1/4] libtalloc: upgrade 2.4.2 -> 2.4.3
Date: Thu, 18 Jun 2026 21:13:31 -0700
Message-Id: <20260619041331.2601352-1-hjadon@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-21441.cisco.com [10.128.164.182];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.128.164.182, sjc-ads-21441.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Jun 2026 04:13:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127674

From: Himanshu Jadon <hjadon@cisco.com>

Update talloc to the version used with newer Samba releases
in upstream meta-openembedded.

This is a prerequisite for upgrading Samba to 4.22.10 on
Scarthgap.

Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
---
 .../libtalloc/{libtalloc_2.4.2.bb => libtalloc_2.4.3.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/libtalloc/{libtalloc_2.4.2.bb => libtalloc_2.4.3.bb} (96%)

diff --git a/meta-networking/recipes-support/libtalloc/libtalloc_2.4.2.bb b/meta-networking/recipes-support/libtalloc/libtalloc_2.4.3.bb
similarity index 96%
rename from meta-networking/recipes-support/libtalloc/libtalloc_2.4.2.bb
rename to meta-networking/recipes-support/libtalloc/libtalloc_2.4.3.bb
index b617f097cf..e20a6a4b14 100644
--- a/meta-networking/recipes-support/libtalloc/libtalloc_2.4.2.bb
+++ b/meta-networking/recipes-support/libtalloc/libtalloc_2.4.3.bb
@@ -14,7 +14,7 @@ SRC_URI = "https://www.samba.org/ftp/talloc/talloc-${PV}.tar.gz \
            file://0002-Fix-pyext_PATTERN-for-cross-compilation.patch \
            file://run-ptest \
 "
-SRC_URI[sha256sum] = "85ecf9e465e20f98f9950a52e9a411e14320bc555fa257d87697b7e7a9b1d8a6"
+SRC_URI[sha256sum] = "dc46c40b9f46bb34dd97fe41f548b0e8b247b77a918576733c528e83abd854dd"
 
 inherit waf-samba pkgconfig ptest
 
-- 
2.35.6


