Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BEF3C433FE
	for <webhook@archiver.kernel.org>; Fri, 21 Jan 2022 13:05:53 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web12.11467.1642770352653161025
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jan 2022 05:05:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=dA+vJHxO;
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
	bh=6JJPAEjhnsR784jV/3hRbUqeMSo+v3pqVA7sHhvOMZo=; b=dA+vJHxOztQlApN5ByHcik/9gg
	+Ye62tm9EUpV7CzdPYRfQX1F7clxbllVQ7JT0y+I8Sk77dhA6ERGbcci+PFqN2HYMuh6yQEUCbRmd
	C5sZD2QDsCJNAYKfH6uJ2kJXb/Xzm7JPy8iDIEIy8hvnCg3IfFTY41Q8k05nFiZ4wiRna8iO3eb4L
	qo1z9r3eUbsnTMmppaDRd+DvruKiDjg1x6E8cGmpuyiwoxcH64/Rn43qo1VFgC+1/KnIXCsoFd9YK
	mODvvRyiBwBaHT6URYPQtOkffNzQlIi85DnGIOxwu43Pr0cJnuAZsOazzJWQyQ72zWnMiuiQv90Nh
	rFRrLx5Q==;
Received: from lan.nucleusys.com ([92.247.61.126]:50940 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1nAtc2-0003GN-O2; Fri, 21 Jan 2022 15:05:52 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-sentry-sdk: Upgrade 1.5.2 -> 1.5.3
Date: Fri, 21 Jan 2022 15:05:33 +0200
Message-Id: <20220121130533.3973579-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220121130533.3973579-1-leon.anavi@konsulko.com>
References: <20220121130533.3973579-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Jan 2022 13:05:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94970

Upgrade to release 1.5.3:

- Pick up custom urlconf set by Django middlewares from request
  if any

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-sentry-sdk_1.5.2.bb => python3-sentry-sdk_1.5.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_1.5.2.bb => python3-sentry-sdk_1.5.3.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.5.2.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.5.3.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_1.5.2.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_1.5.3.bb
index d1ea76b8a..9822b41b1 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.5.3.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341"
 
 RDEPENDS:${PN} += "python3-urllib3"
 
-SRC_URI[sha256sum] = "7bbaa32bba806ec629962f207b597e86831c7ee2c1f287c21ba7de7fea9a9c46"
+SRC_URI[sha256sum] = "141da032f0fa4c56f9af6b361fda57360af1789576285bd1944561f9c274f9c0"
 
 PYPI_PACKAGE = "sentry-sdk"
 
-- 
2.30.2


