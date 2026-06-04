Return-Path: <sudumbha@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC540CD6E6D
	for <webhook@archiver.kernel.org>; Thu,  4 Jun 2026 14:40:14 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13211.1780584013338227250
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Jun 2026 07:40:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Xc8WuM8z;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: sudumbha@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=991; q=dns/txt;
  s=iport01; t=1780584013; x=1781793613;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Vnu+fyjf9BLl1lH3Vv/ntQpanqhqpVVHjPqtLFehH+0=;
  b=Xc8WuM8zHp76bZLwfW2e4B9BXO0GsKc8+int+uHAr4wN8P5i93AOyS/9
   UnZPKFAihpSkoWuKSvhyy2NQWciPC0N8SqTvPN+59v6HAdXLMFFi0MTBE
   d9Isa4CwEUFAjBAZVWws/Xm82qrrdse8bWGwSAzZ4J6eXIZUeQJdImJtD
   5dgfGHe7qpkif/fd1Yrcqqpn2mJQ85KeB0l21M/S/6xWH9F09YXZr/n4O
   Hr44gQ38tUHEw1EB8/ErRAFUVu7v5C1h+3RFiMCKAv7mcraqgTuNaLMye
   Ts1HaBQrX6cpud1P+Vy06lU1z+B+tpcjhcKDQ0es1s/BWVCAD6uBDLj6P
   A==;
X-CSE-ConnectionGUID: +bF70zP8S9qpA6wKxbuMcQ==
X-CSE-MsgGUID: p+CNt2tRS3iLw0S97MLojg==
X-IPAS-Result: =?us-ascii?q?A0BAAgACjSFq/4r/Ja1aglmCV3RfQkmUKqA/gX4PAQEBD?=
 =?us-ascii?q?z0UBAEBkjsCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBDhOGT?=
 =?us-ascii?q?w2HEwEYAV1cRIMCAYJzAgERshuCLIEBgygBPwJDUNsqAQsUAYE4hT+IHXMBh?=
 =?us-ascii?q?HsnGxuBcoEVg2iBBYFcAQGCLYV3BIIigQyQVUiBHgNZLAFVEw0KCwcFgWYDN?=
 =?us-ascii?q?RIqFW4yHYEjPheBCxsHBYFKgUlqgQKFEiMfAzmBF4F8gShpaRUxRQMLGA1IE?=
 =?us-ascii?q?Sw3FBsEPm4HjCgXD4I3gQ4sBKgeoQ4KKIN0jCGVOhozqmsLmHuOCZVmaYRog?=
 =?us-ascii?q?Wg8gUcLB3AVgyIJShkPjjgng0SBf8UxJDUCOwEBBwIHDgMLgWiRfQEB?=
IronPort-Data: A9a23:TZBdpauOMtLGCCnzFTmyKcy16+fnVAZfMUV32f8akzHdYApBsoF/q
 tZmKWyEPqmKZGCnfYsnao239EICsJLcmtZlQQBkr3w2RXkXgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav666yEgiclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZDdJ5xYuajhKs/zb9Es21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIwuexZXjlcz
 awjeSkVR06cpPK83Zewc7w57igjBJGD0II3oHpsy3TdSP0hW52GG/yM7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwxHYH49tL/Aan3XaCBUtVefpaMf6GnIxws327/oWDbQUoDbHZ8NwxzD+
 goq+UzhQTo8KIaD8wHe81az3tSewgbfX4AdQejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dTJ
 lIZ/gIqrLMu7wqsVtT7UhiyrXKIsxJaXMBfe9DW8ymXwabSpgLcDW8eQ3sZMZottdQ9Qnoh0
 Vrhc87VOAGDeYa9ERq1nop4ZxvrUcTJBQfuvRM5cDY=
IronPort-HdrOrdr: A9a23:xvIuzqAfnIliUVDlHemc55DYdb4zR+YMi2TDsHoBKyC9Hfb3qy
 nDppkmPHzP+VUssQ8b+OxoUZPoKRi3yXcf2+Ys1NmZMDUOwFHJEKhSqa3/3jbnByryssRZ1a
 tmbuxCLeeYNykesS4/izPIdOrJB7K8gcSVuds=
X-Talos-CUID: 9a23:/D1b1mCsyUitV0v6E2pt2hFMCPh1SSzE1F6OPGyoA3tMQ4TAHA==
X-Talos-MUID: 9a23:CUdp5gWPqTYkOkLq/Cevrxd+bttS2P+vLF9VqsRZnu2DNyMlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,187,1774310400"; 
   d="scan'208";a="490205234"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 04 Jun 2026 14:40:12 +0000
Received: from sjc-ads-12007.cisco.com (sjc-ads-12007.cisco.com [171.70.97.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id 75F19180001C7
	for <openembedded-devel@lists.openembedded.org>; Thu,  4 Jun 2026 14:40:12 +0000 (GMT)
Received: by sjc-ads-12007.cisco.com (Postfix, from userid 1840713)
	id 1E143CB6A93; Thu,  4 Jun 2026 07:40:12 -0700 (PDT)
From: "Sudhir Dumbhare -X (sudumbha - E INFOCHIPS PRIVATE LIMITED at Cisco)" <sudumbha@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][scarthgap][PATCH 1/3] python3-grpcio-tools: set status for CVE-2026-33186
Date: Thu,  4 Jun 2026 07:39:05 -0700
Message-Id: <20260604143907.2864663-1-sudumbha@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-12007.cisco.com [171.70.97.7];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.97.7, sjc-ads-12007.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Jun 2026 14:40:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127399

From: Sudhir Dumbhare <sudumbha@cisco.com>

The vulnerability only affects the Go implementation of the library,
not the Python one. Ignore this CVE due to this.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-33186
https://github.com/advisories/GHSA-p77j-4mvh-x3m3

Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
---
 .../recipes-devtools/python/python3-grpcio-tools_1.62.2.bb      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.62.2.bb b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.62.2.bb
index 7f842c01a9..9f14d2e4b5 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.62.2.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.62.2.bb
@@ -23,3 +23,5 @@ do_compile:prepend() {
 BBCLASSEXTEND = "native nativesdk"
 
 CVE_PRODUCT += "grpc:grpc"
+
+CVE_STATUS[CVE-2026-33186] = "cpe-incorrect: this CVE is for golang version of grpc"
-- 
2.35.6


