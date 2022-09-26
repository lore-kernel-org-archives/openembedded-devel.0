Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD9F5C32771
	for <webhook@archiver.kernel.org>; Mon, 26 Sep 2022 08:00:35 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web12.26183.1664179233546608229
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Sep 2022 01:00:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=HGvqpO/N;
 spf=permerror,
 err=parse error for token &{10 18 spf.securedserverspace.com}: parse error
 for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded
 (domain: konsulko.com, ip: 79.124.30.14, mailfrom: leon.anavi@konsulko.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=anavi.org;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=XI6IBAL4W68N89AFkWty68s2tGebQEjR/6WXzLAIW6s=; b=HGvqpO/NhDaLcsnDXJ5otK1XVz
	LIFWV3S166qlBS4VjJOjvfBsPz5Srf318Mi/+21JqaZ6PrU6OOK9OXgGzPCKNYgx6dvi8IgIQw8B9
	34qqNbETvoXH08KqmRzarC1j1PvB5F74fj2NO0OjViEE11guSsJOPUXfvU3E2IObk/Ysy7m/R72a0
	i3+z5W6GQPtEblX5v0C9rBZKAiv1/e3/EMXm3Rg6tIZYgyOGnSfDdecTcRNDOkcixPzWO075/BfCi
	ZjJ3WYj8UwFZ30TKh6C+Nz4ZMK6rDYXfYQzcy05+NX/L9WRC2XV5/UYQ3igIZBtJMSyTPJEvscfRL
	wh2JqedA==;
Received: from lan.nucleusys.com ([92.247.61.126]:60258 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1ocj3L-000BCB-BK;
	Mon, 26 Sep 2022 11:00:31 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH] python3-aiohttp: Upgrade 3.8.1 -> 3.8.3
Date: Mon, 26 Sep 2022 11:00:24 +0300
Message-Id: <20220926080024.1903521-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
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
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Sep 2022 08:00:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98950

Upgrade to release 3.8.3:

- Increased the upper boundary of the multidict dependency to
  allow for the version 6

License-Update: Update copyright year from 2020 to 2022

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-aiohttp_3.8.1.bb => python3-aiohttp_3.8.3.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-aiohttp_3.8.1.bb => python3-aiohttp_3.8.3.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.8.1.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.8.3.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-aiohttp_3.8.1.bb
rename to meta-python/recipes-devtools/python/python3-aiohttp_3.8.3.bb
index f2b8d52a7..b233b3ac9 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.8.3.bb
@@ -2,9 +2,9 @@ SUMMARY = "Async http client/server framework"
 DESCRIPTION = "Asynchronous HTTP client/server framework for asyncio and Python"
 HOMEPAGE = "https://github.com/aio-libs/aiohttp"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=8074d6c6e217873b2a018a4522243ea3"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=748073912af33aa59430d3702aa32d41"
 
-SRC_URI[sha256sum] = "fc5471e1a54de15ef71c1bc6ebe80d4dc681ea600e68bfd1cbce40427f0b7578"
+SRC_URI[sha256sum] = "3828fb41b7203176b82fe5d699e0d845435f2374750a44b480ea6b930f6be269"
 
 PYPI_PACKAGE = "aiohttp"
 inherit python_setuptools_build_meta pypi
-- 
2.30.2


