Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D35E2CCA479
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 09:47:13 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web09.3652.1657187225658103411
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Jul 2022 02:47:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=F7C9kHNj;
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
	bh=2xAo30GFFZ+Yq7z58O2vxcUizDIwfENZ6dIGZKJN3gY=; b=F7C9kHNjGb00nbEiCZ1nNiWAhC
	ICiwQTVURT9b54TBiEUlr4qrXXwzELjMM22Pqz77meJ2yswOcLhJyOH89wFVhquOrAGX8l9+8P6dv
	p9513/KTTPc2UFj0cWlFx/8WCBePKmY/IGd5/YxaLXh1eYowHNzNJ26Ed2onn2DUoo0xuEZcnRWqy
	J60kOw7nQWcjCcdmyKJibhC7NZN5poXeZ109tPwZPZQkTux7gr+XN5R4DYzISmQQb1QH3Z+wKpuEU
	YXpMf3l9V7vJBRG7Ax64LAZNLHIQLLxxLQw/rrCQkFAbv6UyHR2rg1Sw5wujUNvFHa9+D2m2ASLam
	JrelDx8g==;
Received: from lan.nucleusys.com ([92.247.61.126]:48688 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1o9O7J-0004Fc-Jh;
	Thu, 07 Jul 2022 12:47:04 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-awesomeversion: Upgrade 22.5.2 ->
 22.6.0
Date: Thu,  7 Jul 2022 12:46:48 +0300
Message-Id: <20220707094651.1716295-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220707094651.1716295-1-leon.anavi@konsulko.com>
References: <20220707094651.1716295-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Jul 2022 09:47:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97770

Upgrade to release 22.6.0:

- Handle ValueError for possible blank values when casting to int
- Remove deprecated method AwesomeVersion.ensure_strategy

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...wesomeversion_22.5.2.bb => python3-awesomeversion_22.6.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-awesomeversion_22.5.2.bb => python3-awesomeversion_22.6.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-awesomeversion_22.5.2.bb b/meta-python/recipes-devtools/python/python3-awesomeversion_22.6.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-awesomeversion_22.5.2.bb
rename to meta-python/recipes-devtools/python/python3-awesomeversion_22.6.0.bb
index c43f9ee54..cadb6f502 100644
--- a/meta-python/recipes-devtools/python/python3-awesomeversion_22.5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-awesomeversion_22.6.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE.md;md5=92622b5a8e216099be741d78328bae5d"
 
-SRC_URI[sha256sum] = "051f89efd8ba0b157fb516bda5e1dad4d63f87e8f9c0c148930023d984fce62f"
+SRC_URI[sha256sum] = "38f580bfacf1c06b674bcd0f68e0c445ebb03fcd3700c6a2c588fb9313308e0f"
 
 RDEPENDS:${PN} += "python3-profile python3-logging"
 
-- 
2.30.2


