Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 435EFC61DB4
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 10:51:04 +0000 (UTC)
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14019.1787568658783296705
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Aug 2026 03:50:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=ARKoc611;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1189; q=dns/txt;
  s=iport01; t=1787568658; x=1788778258;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=r96SIucT/qNKn8V3v7rZLNoZ6aIa1D2piPl6cSpeNRY=;
  b=ARKoc611wrSNf6lu7xt6JQbvxsyeyQrPbb2iKaFG9wzbIVdzh/QM0DM3
   X7G4PHSl7AoqXVHlKZJp3J3TjlCFKMIOg8MWmdvmGgjTvyp+BF5iQm1/Q
   Q0b4V4iDBcSoz+QQ6tYREh5AecjJzEqWHhtcUJhUg2+5PJJ08BcfyFH6b
   U7xLPGIqXL/ZCRSTT8Vvm5wvkG+slRb1sV+sv8MWYyw1VwHgjqU/B9QvF
   0TvWg1LBIv7/0n42+P+PDVkdWe47usmwfFR92sQh/02Dix8o9kBalr36S
   z4HYfCwTy49821o4ybi41GzBw725d12NfGLJ+3vBe9ATyiGl/3wnIr5ST
   Q==;
X-CSE-ConnectionGUID: gzHFF44jRqWsgsT0eUd56g==
X-CSE-MsgGUID: L5GZJgxTQQqSenJzTlpg0A==
X-IPAS-Result: =?us-ascii?q?A0D3AgC0IIxq/5EQJK1RCYJZgld0XkNJk1kBgnCeHoF+D?=
 =?us-ascii?q?wEBAQ83GgQBAYUFjW4CJjYHDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGXIZdNgEYAS0wXESDAgGCdAPDY4IsgQGDKAGBVNswAQsUAQWBM4U/i?=
 =?us-ascii?q?CJ2hHwnGxuBcoR+hAoNeYV4BIIigQyBeJFiSIEeA1ksAVUTDQoLBwWBZgM1E?=
 =?us-ascii?q?ioVbjIdgSM+F4ENGwYFgR2BKIQQIxk2fIEJXoErKWQBEheBCYIHAoJaggUCA?=
 =?us-ascii?q?UlDDgdHIgsYDUgRLDcUGQQ+bgeOXh+CRwE8UZZUkXqhDwoog3aMIpU6GjOqb?=
 =?us-ascii?q?C6YWqRahGmBbwUwRoETcBWDIglKGQ/eXCcyAj0HAgcPApFzgX4BAQ?=
IronPort-Data: A9a23:C9bBG64YPef3fQNbm8H0NQxRtGnGchMFZxGqfqrLsTDasY5as4F+v
 mNOUW+BafqPZWaketB3aYu29UhS6pWBmoBgTlE/+Sg9Zn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH2dOC98RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/qUzBHf/g2QqajJOt/rawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eMp841MgrXWN07
 MMDJysxNh2+i7/oz+fuIgVsrpxLwMjDNYcbvDRkiDreF/tjGcCFSKTR7tge1zA17ixMNa+BP
 IxCN3w2MlKZP0An1lQ/UPrSmM+ki2f2dSZYsHqepLE85C7YywkZPL3FYIOLKoTQHpUK9qqej
 kab0FbbDQEmDeWG8jeD0GCQgvfAxQquDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0KzRd9bA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO+Q+7AfIzu/f5ByUQzBUCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u78Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:emIB/a3Sb1ocO5fHnTpNqgqjBJ4kLtp133Aq2lEZdPWaSKOlfq
 eV7ZEmPHDP6Qr5NEtMpTniAtjjfZqjz/5ICOAqVN/INjUO01HHEGgN1+ffKhTbaknDH5ZmpM
 RdWpk7LsHsBl5nisu/ygy5H9E8hOSjysmT9IDjJ7MHd3ASV0mmhD0JbDqmLg==
X-Talos-CUID: =?us-ascii?q?9a23=3A8S9kZGiWvu+FRdEFRcMi9nc9vTJufW/94lmMf02?=
 =?us-ascii?q?CEFlyR6apEVKt9P46nJ87?=
X-Talos-MUID: =?us-ascii?q?9a23=3ASh3CVA/Rc9WOgGfQJfMK6C2Qf+M1zJaMB1AxqKw?=
 =?us-ascii?q?fgMSCFz5MPy+S1B3iFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,240,1779148800"; 
   d="scan'208";a="816802387"
Received: from alln-l-core-08.cisco.com ([173.36.16.145])
  by alln-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Aug 2026 10:50:57 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-08.cisco.com (Postfix) with ESMTPS id A3C1E18000443;
	Mon, 24 Aug 2026 10:50:57 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id 3BE80CC12A6; Mon, 24 Aug 2026 03:50:57 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [meta-python][PATCH] python3-twitter: correct Tweepy CVE_PRODUCT mapping
Date: Mon, 24 Aug 2026 03:50:57 -0700
Message-Id: <20260824105057.64542-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5197.cisco.com [10.28.35.211];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.35.211, sjc-ads-5197.cisco.com
X-Outbound-Node: alln-l-core-08.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Aug 2026 10:51:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129458

From: Devansh Patel <devanshp@cisco.com>

The product-only "tweepy" value emits a wildcard-vendor identity and
hides the distinct NVD identities assigned to the packaged Tweepy source.

Use "josh_roesslein:tweepy" for its NVD dictionary CPE and
"tweepy:tweepy" for the NVD configuration-only identity. With
sbom-cve-check 1.3.3 and the pinned database snapshots, the generated
product identity changes; the current CVE report is unchanged.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta-python/recipes-devtools/python/python3-twitter_4.17.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-twitter_4.17.0.bb b/meta-python/recipes-devtools/python/python3-twitter_4.17.0.bb
index 5386e90d42..6f9c886c35 100644
--- a/meta-python/recipes-devtools/python/python3-twitter_4.17.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twitter_4.17.0.bb
@@ -18,5 +18,5 @@ RDEPENDS:${PN} += "\
     python3-six \
 "
 
-CVE_PRODUCT = "tweepy"
+CVE_PRODUCT = "josh_roesslein:tweepy tweepy:tweepy"
 CVE_STATUS[CVE-2012-5825] = "fixed-version: The vulnerability has been fixed since v3.1.0"
-- 
2.35.6

