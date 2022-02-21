Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9856C433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 19:23:14 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web11.3255.1645471393424458593
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Feb 2022 11:23:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=mKR+7sSY;
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
	bh=VpjEhRp+JVfUEPoxGtzt4PCuAtqM+IBU1lbtPa2ePLs=; b=mKR+7sSYhrsOi6XTpmMTTUSyWM
	ajaHx1bBcRaJxUK4ZhGHrg4kjxOt3/sd3B1ly3qHpZO1R1N5HRup/sKJDSg3fBYIwOdIcHv7dpzcx
	84AfegjLFv00oP9eYrv4pI/B5L98o+JO494ojG3NP7TSLisWg1D47oUPilzfnGknSvExS1tapIGsP
	YEaBtA6yCXz2cQP3nchspgl+7Hf5SKHHGd1ZtL8G3P+UOHcnRfAnpyndhc+ObrPiL+GZSuoOayyOJ
	bRMCeJPr65UgNvORV57M5Z1CKc30socYw/+eBYFsbW790nL3f2rI+Djgout3N+cK/HzFDT7AGtV2O
	4h4nrvzA==;
Received: from lan.nucleusys.com ([92.247.61.126]:47766 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1nMEJU-0006M5-EX; Mon, 21 Feb 2022 21:23:13 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-croniter: Upgrade 1.2.0 -> 1.3.4
Date: Mon, 21 Feb 2022 21:22:56 +0200
Message-Id: <20220221192256.3347297-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220221192256.3347297-1-leon.anavi@konsulko.com>
References: <20220221192256.3347297-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Feb 2022 19:23:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95426

Upgrade to release 1.3.4:

- Add a way to make next() easier to use
- Restore compat with python2
- Fix regressions with set_current
- Fix compat for tests under py27

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-croniter_1.2.0.bb => python3-croniter_1.3.4.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-croniter_1.2.0.bb => python3-croniter_1.3.4.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-croniter_1.2.0.bb b/meta-python/recipes-devtools/python/python3-croniter_1.3.4.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-croniter_1.2.0.bb
rename to meta-python/recipes-devtools/python/python3-croniter_1.3.4.bb
index 13dbf155c..4158dbe7c 100644
--- a/meta-python/recipes-devtools/python/python3-croniter_1.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-croniter_1.3.4.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=b8ee59850b882cbf623188489ea748e2"
 
 PYPI_PACKAGE = "croniter"
 
-SRC_URI[sha256sum] = "094422f6aeb9ed646714393503fa388afe4f846e110e1997fea5794e2085c2d7"
+SRC_URI[sha256sum] = "3169365916834be654c2cac57ea14d710e742f8eb8a5fce804f6ce548da80bf2"
 
 inherit pypi setuptools3
 
-- 
2.30.2


