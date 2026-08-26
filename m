Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 880F6C61DD5
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 07:54:12 +0000 (UTC)
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7455.1787730844674875049
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Aug 2026 00:54:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=R0sux3TI;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1006; q=dns/txt;
  s=iport01; t=1787730845; x=1788940445;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=UMf6ithWP0I/nWPFGtx6TNa6r/Z5TkswHTILJtWv/lg=;
  b=R0sux3TIztnm3PqjF/w2sLg2RYwstntpnKigRDx3a9ALu1kulDjxVGhX
   U5SkNolvpb3aOSLBKjAEeydktTsme0GG5G1gjITxG5Bn0qeN0FgDSaJjt
   /m8siesceTRWrysyHONNPthwbiNiD+WI0iKMH3N1tdUkH6PtsPcfqJGBk
   YcuoAJQMv7zBa1lahxOIEZi7+kbklc3hANFxiNcQdd0OYty9gT3sthgaU
   wktqzu7ufYqgMzfGtv7HcQhOSrJVTolLqvRdxzvpyCmYDq5IovJ8AFocU
   FCrmdnSmcmO1Yy62kler4vDCmW6mPQs7FoEVKLJuzTk/6jhUfTYBerqFM
   Q==;
X-CSE-ConnectionGUID: WsumQccIThKbncafEg+Rgg==
X-CSE-MsgGUID: LQrot7EaSJOjpSsAALXzXw==
X-IPAS-Result: =?us-ascii?q?A0BCAgBqmo5q/4sQJK1RCYJZgld0XkNJk1kBoQ6Bfg8BA?=
 =?us-ascii?q?QEPNxoEAQGFBY1uAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4ThlyGXTYBGAEtMFxEgwIBgnQDvwOCLIEBgygBgVTbMAELFAEFgTOFP4gid?=
 =?us-ascii?q?oR8JxsbgXKEfoQKDXmFeASCIoEMgXiRakiBHgNZLAFVEw0KCwcFgWYDNRIqF?=
 =?us-ascii?q?W4yHYEjPheBDRsGBYEdgSiEECMZNnyBCV6BKylgARIXgQmCBwKCWoIFAgFJQ?=
 =?us-ascii?q?w4HRz4LGA1IESw3FBkEPm4HjmsfgkkBPFGWVJF6oQ8KKIN2jCKVOhozqmwum?=
 =?us-ascii?q?FqkWoRpgWg8gVlwFYMiCUoZD95cJzICPQcCBw8CkXOBfgEB?=
IronPort-Data: A9a23:aOp0i67AIPvKjSEt5Cb3aAxRtGvGchMFZxGqfqrLsTDasY5as4F+v
 jQWCj3Qa/7ZYzPyetwgOoSy8EMAsJPSx9BiT1M6qn89Zn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH2dOC98RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/qUzBHf/g2QqajJOtfrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eApYF/998CkBy9
 d8SLjsEYD2MxNi5z+fuIgVsrpxLwMjDNYcbvDRkiDreF/tjGcqFSKTR7tge1zA17ixMNa+BP
 IxCN3w2MlKZOEwn1lQ/UPrSmM+ki2f2dSZYsHqepLE85C7YywkZPL3FYIOEIoPSH5UL9qqej
 kb/5WPlXTwTD/64yyK+6VuFot/drTyuDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0KzRd9bA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO+Q+7AfIzu/f5ByUQzBeCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u3F8Vte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:ODTsTKssjGMfRIgfViO+Xu+c7skDWtV00zEX/kB9WHVpmwKj+P
 xG+85rsCMc5wxxZJhNo7290cq7MBHhHOBOgbX5VI3KNGKNhILCFu9fBOXZrwEIMheOktK1rZ
 0QEJRWOZnXEUVwi9r87U2TFtYtx8TCzYWT7N2uqEuEiWpRGthdB8ATMHf8LnFL
X-Talos-CUID: =?us-ascii?q?9a23=3AVbYVFWsX+jf3lZ+LHa6VzGCL6IsaaWDY9XzbAnO?=
 =?us-ascii?q?4KmxvQ7SbZFDTwqxrxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AtHaPxQ4bIP2x/Ejy0Gtow6OgxoxM2r6pFB8gmK4?=
 =?us-ascii?q?knMucDjdZEhOtngSoF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,244,1779148800"; 
   d="scan'208";a="819070286"
Received: from alln-l-core-02.cisco.com ([173.36.16.139])
  by alln-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 26 Aug 2026 07:53:49 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-02.cisco.com (Postfix) with ESMTPS id B834918000196;
	Wed, 26 Aug 2026 07:53:49 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id 571EACC12A6; Wed, 26 Aug 2026 00:53:49 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [meta-python][PATCH] python3-ldap: correct python-ldap CVE_PRODUCT mapping
Date: Wed, 26 Aug 2026 00:53:49 -0700
Message-Id: <20260826075349.64263-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5197.cisco.com [10.28.35.211];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.35.211, sjc-ads-5197.cisco.com
X-Outbound-Node: alln-l-core-02.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 07:54:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129487

From: Devansh Patel <devanshp@cisco.com>

The current "python-ldap" mapping generates a vendor-wildcard product
identity for the packaged Python binding.

Use "python-ldap:python-ldap" so it matches the NVD dictionary CPE and
configuration identity. The generated product identity changes, but
sbom-cve-check 1.3.3 reports no CVE delta with the pinned databases.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta-python/recipes-networking/python/python3-ldap_3.4.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-networking/python/python3-ldap_3.4.7.bb b/meta-python/recipes-networking/python/python3-ldap_3.4.7.bb
index cd7c675f27..ef681455a5 100644
--- a/meta-python/recipes-networking/python/python3-ldap_3.4.7.bb
+++ b/meta-python/recipes-networking/python/python3-ldap_3.4.7.bb
@@ -29,4 +29,4 @@ RDEPENDS:${PN} = " \
     python3-unittest \
 "
 
-CVE_PRODUCT = "python-ldap"
+CVE_PRODUCT = "python-ldap:python-ldap"
-- 
2.35.6

