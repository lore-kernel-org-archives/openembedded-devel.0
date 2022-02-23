Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 293A4C433F5
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 13:17:40 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web08.7333.1645622258658494857
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Feb 2022 05:17:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=TFkhfNvr;
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
	bh=Hhp2bfH9EeqSYldZvfHDobEqbkVZd/dm8SIqYXLYuso=; b=TFkhfNvrPtK1XolL4C4PSUXeaV
	bTPcfkenKObHbcRmamVTABduPSrD6wLELUUB838XxSf3l96W3MTR4n3WLCbOO82UHCNXUc3b7lI+t
	hQcxL0ZGhPT7CBAD+p5xLh8L7matTh/PjoQ59ut053lcRlfujYdRsnKtTb8wd//6ekhbjWRnvGxwe
	fixdh3XfHeDNctN1BcJRDATbyCvwkspHA+Jg8bbIP1LAbqPjo1FNHe9/2HMqLDQ+LZZgSm4F0kN8K
	mF95fxiZ98qxj1jg/fhLe41xGVWC2/ngdtKop2g/BgFyMBZXF4OavTZlbRia/daje4d3oJS5b7Ubl
	vcyIJK8g==;
Received: from lan.nucleusys.com ([92.247.61.126]:51954 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1nMrYw-000Bp1-TP; Wed, 23 Feb 2022 15:17:38 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-unidiff: Upgrade 0.7.0 -> 0.7.3
Date: Wed, 23 Feb 2022 15:17:20 +0200
Message-Id: <20220223131721.1683054-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220223131721.1683054-1-leon.anavi@konsulko.com>
References: <20220223131721.1683054-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OutGoing-Spam-Status: No, score=-0.5
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
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Feb 2022 13:17:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95480

Upgrade to release 0.7.3:

- Fixed RE_BINARY_DIFF regex to make it a raw string
- Fixed issue when parsing git diff header generated with
  --no-prefix
- Improved git added/deleted file detection
- Added newline optional param when parsing from_filename

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-unidiff_0.7.0.bb => python3-unidiff_0.7.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-unidiff_0.7.0.bb => python3-unidiff_0.7.3.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-unidiff_0.7.0.bb b/meta-python/recipes-devtools/python/python3-unidiff_0.7.3.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-unidiff_0.7.0.bb
rename to meta-python/recipes-devtools/python/python3-unidiff_0.7.3.bb
index b3013180d..dd5b0c3eb 100644
--- a/meta-python/recipes-devtools/python/python3-unidiff_0.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-unidiff_0.7.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://github.com/matiasb/python-unidiff"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4c434b08ef42fea235bb019b5e5a97b3"
 
-SRC_URI[sha256sum] = "91bb13b4969514a400679d9ae5e29a6ffad85346087677f8b5e2e036af817447"
+SRC_URI[sha256sum] = "d5f2e53a9a00db3224a8c36349b5380e0e22d1aec6c694b14fb9483ee93c6205"
 
 inherit pypi setuptools3 ptest
 
-- 
2.30.2


