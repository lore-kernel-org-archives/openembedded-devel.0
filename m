Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 607BDC433F5
	for <webhook@archiver.kernel.org>; Wed,  5 Oct 2022 10:16:24 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web08.21871.1664964981980191126
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Oct 2022 03:16:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=CpcACPkB;
 spf=permerror,
 err=parse error for token &{10 18 spf.securedserverspace.com}: parse error
 for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded
 (domain: konsulko.com, ip: 79.124.30.14, mailfrom: leon.anavi@konsulko.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=anavi.org;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=5QLJNqY7R0oi8lXAB1m56BNv0OMyTFv5B75eEgoq4mk=; b=CpcACPkBQ5YnVExbhnBoOjqB79
	PT3te6M+w7gDg0hg3QC3alq1fiD9fLdLNwJAqjLVl/LLVBZ4qcrf0uGpcoov230HTXgeJvwsXV8b6
	LdwQqS6+UUYxaY/M21IAenq4nOWERmFhRQ0IM0rnuwm2t3PTUsrM54In9uqwauqZe361A9w+wZwcm
	m+sae4UYmL/puWfW4OpB9VbwRMS0NTPuNF+Z8FLXXcbzGAyoci7L3WQ3EBwMD3ANe0oERXwPhSTO9
	tPAEGRsqUH7FftL1BVSO8wz4Dl7ta+VVuChM9/b/JgSaXV3Am+zOXVq5noEOGQRH2f2HyKg9D2Uci
	oiZz8feQ==;
Received: from lan.nucleusys.com ([92.247.61.126]:56146 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1og1Ru-000BY3-L6;
	Wed, 05 Oct 2022 13:16:20 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-coverage: Upgrade 6.4.4 -> 6.5.0
Date: Wed,  5 Oct 2022 13:16:08 +0300
Message-Id: <20221005101609.3571273-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221005101609.3571273-1-leon.anavi@konsulko.com>
References: <20221005101609.3571273-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.superhosting.bg
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.superhosting.bg: authenticated_id:
 leon@anavi.org
X-Authenticated-Sender: voyager.superhosting.bg: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Oct 2022 10:16:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99070

Upgrade to release 6.5.0:

- The JSON report now includes details of which branches were
  taken, and which are missing for each file.
- Starting with coverage.py 6.2, class statements were marked as a
  branch. This wasn't right, and has been reverted. Note this will
  very slightly reduce your coverage total if you are measuring
  branch coverage.
- Packaging is now compliant with PEP 517.
- A new debug option --debug=pathmap shows details of the remapping
  of paths that happens during combine due to the [paths] setting.
- Fix an internal problem with caching of invalid Python parsing.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-coverage_6.4.4.bb => python3-coverage_6.5.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_6.4.4.bb => python3-coverage_6.5.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_6.4.4.bb b/meta-python/recipes-devtools/python/python3-coverage_6.5.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-coverage_6.4.4.bb
rename to meta-python/recipes-devtools/python/python3-coverage_6.5.0.bb
index 5bff96901..dfa374d87 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_6.4.4.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_6.5.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://coverage.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "e16c45b726acb780e1e6f88b286d3c10b3914ab03438f32117c4aa52d7f30d58"
+SRC_URI[sha256sum] = "f642e90754ee3e06b0e7e51bce3379590e76b7f76b708e1a71ff043f87025c84"
 
 inherit pypi setuptools3
 
-- 
2.30.2


