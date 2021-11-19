Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1610C433F5
	for <webhook@archiver.kernel.org>; Fri, 19 Nov 2021 10:28:04 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web08.7033.1637317683158809564
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Nov 2021 02:28:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=joMhri0P;
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
	bh=HBZu+yrQyFhHamVlt9m2jt0BG5LZcNMa31fB7o0kwJY=; b=joMhri0PQwyWJc0t6TETKtUNzw
	dsk/GvDxVDUQj/PJNytoerSw47ei3kemjG7vzc1fKYlBRSfYLNB8/Ro266rDbQ1hmI5mZZrIHmvjj
	cbXVhdTgQo74Svx3n0PKNPWt/ZKnn4Ix16Sv/Qmtr91x6hSQ4aR3iUQ0Bdb6WnvIitJifh9oR2vVW
	pHaUqgwx8A1nEzdRnVY1RZpE5uGn0RIKNuf+BY/s6hdK2pU3qYUnMr5rHsw3XI8Wv78vLZsLT8T2F
	ULDWGR8fJb7PtC0dD0T3ELuiDNIDpsbvc8LtkgDjtlm3kdGSGvkSFv0vvQWzEeaw67I7gMtt/6IbK
	O8Zbdrfw==;
Received: from lan.nucleusys.com ([92.247.61.126]:34090
 helo=lootbox.konsulko.bg)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1mnzFY-0008o5-0J; Fri, 19 Nov 2021 12:27:55 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-simplejson: Upgrade 3.17.5 -> 3.17.6
Date: Fri, 19 Nov 2021 12:27:39 +0200
Message-Id: <20211119102740.2676-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211119102740.2676-1-leon.anavi@konsulko.com>
References: <20211119102740.2676-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Nov 2021 10:28:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94062

Upgrade to release 3.17.6:

- Declare support for Python 3.10 and add wheels

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-simplejson_3.17.5.bb => python3-simplejson_3.17.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-simplejson_3.17.5.bb => python3-simplejson_3.17.6.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-simplejson_3.17.5.bb b/meta-python/recipes-devtools/python/python3-simplejson_3.17.6.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-simplejson_3.17.5.bb
rename to meta-python/recipes-devtools/python/python3-simplejson_3.17.6.bb
index 7c92761c4..b836f97fe 100644
--- a/meta-python/recipes-devtools/python/python3-simplejson_3.17.5.bb
+++ b/meta-python/recipes-devtools/python/python3-simplejson_3.17.6.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://cheeseshop.python.org/pypi/simplejson"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c6338d7abd321c0b50a2a547e441c52e"
 
-SRC_URI[sha256sum] = "91cfb43fb91ff6d1e4258be04eee84b51a4ef40a28d899679b9ea2556322fb50"
+SRC_URI[sha256sum] = "cf98038d2abf63a1ada5730e91e84c642ba6c225b0198c3684151b1f80c5f8a6"
 
 inherit pypi setuptools3
 
-- 
2.20.1


