Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61DDDC4332F
	for <webhook@archiver.kernel.org>; Wed, 12 Jan 2022 18:35:54 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web12.1289.1642012552621920378
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Jan 2022 10:35:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=BcU2Xgb/;
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
	bh=HNChUEKzvhtxwrhNfzZUGfY/3hTMxw9koM5Hm4UExMg=; b=BcU2Xgb/Fp2dh/qF3GUdBkEaLF
	B+MD2s+dU7c6ocN0M1K9lQAc7qc1V55VGOmizPOQhT5KgffxRrfps6xDNNF6l+DYMBbeULTr7U2/N
	od3XV0Ueo2mgfW/BihXvTR1wi6a8MtF3PMGMWPPDNMV/MEOlFgTTrpnZezQSAD4fvmCfz09RpuZO2
	P+9VliesWg9ZH1eJnEOXm+6AIBWsfU+8IisXbvSkkTTcLx0g0SXTLVSy4rKLw2MFoEc8wG1XcKVEA
	tScthOeVxgWZi7IIWxZGETQGuDZQYDOQQQHCYyjV9ndY4KoeHTR7cFnwYOXtr8Ebos3XP/vIWbDxw
	vZbCdGTQ==;
Received: from lan.nucleusys.com ([92.247.61.126]:48040 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1n7iVK-000Bc0-Aw; Wed, 12 Jan 2022 20:35:52 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-sentry-sdk: Upgrade 1.4.3 -> 1.5.2
Date: Wed, 12 Jan 2022 20:35:31 +0200
Message-Id: <20220112183531.2712341-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220112183531.2712341-1-leon.anavi@konsulko.com>
References: <20220112183531.2712341-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jan 2022 18:35:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94793

Upgrade to release 1.5.2:

- Record event_processor client reports
- Add a Quart integration
- Sanic v21.12 support
- Support Celery abstract tasks

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-sentry-sdk_1.4.3.bb => python3-sentry-sdk_1.5.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_1.4.3.bb => python3-sentry-sdk_1.5.2.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.4.3.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.5.2.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_1.4.3.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_1.5.2.bb
index c5614a381..d1ea76b8a 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.5.2.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341"
 
 RDEPENDS:${PN} += "python3-urllib3"
 
-SRC_URI[sha256sum] = "b9844751e40710e84a457c5bc29b21c383ccb2b63d76eeaad72f7f1c808c8828"
+SRC_URI[sha256sum] = "7bbaa32bba806ec629962f207b597e86831c7ee2c1f287c21ba7de7fea9a9c46"
 
 PYPI_PACKAGE = "sentry-sdk"
 
-- 
2.30.2


