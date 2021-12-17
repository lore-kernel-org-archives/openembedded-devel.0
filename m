Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF6D0C433FE
	for <webhook@archiver.kernel.org>; Fri, 17 Dec 2021 15:51:57 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web08.7777.1639756315591421864
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Dec 2021 07:51:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=n5YKjU03;
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
	bh=MroqntPHCIBofH2Mxpg2GL9Gb5faYp3ww/GlFAgd7fw=; b=n5YKjU03m5sHI3AWLkqgsPDR4x
	3Z8jNvnfDXPEVHYR3TPqAj+LdTIgT3MbIy6OQXCsPRPNe6hrSkuvpU+YCESpCYWSd1Ecfhi7cJ6V0
	itpNeXqENSAxPTNc5BuR7TylDiEISkyI1Memrc/wKKXOLh6i67w7O5g0ozuogfgOk6UbKm+MW89K7
	s8EV1a2H4XQa2pR6+Ujd5OO5NBQYtKwb11arRW4FQDR6g4hyl3qUf1V6Fb/e0gr9C4qqK10b41D8d
	VBbvqAlzoFGBt61MuTDZPUyiMHXZZkNU69udo9a3Ve+aduQrgVuTk1Njiu3ldqRDz/+7PcOp6nFm/
	HIXexJXQ==;
Received: from lan.nucleusys.com ([92.247.61.126]:52916
 helo=lootbox.konsulko.bg)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1myFWT-0004X8-QF; Fri, 17 Dec 2021 17:51:55 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-cachecontrol: Upgrade 0.12.9 ->
 0.12.10
Date: Fri, 17 Dec 2021 17:51:43 +0200
Message-Id: <20211217155144.22827-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211217155144.22827-1-leon.anavi@konsulko.com>
References: <20211217155144.22827-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Dec 2021 15:51:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94424

Upgrade to release 0.12.10:

- Add .venv and web_cache to gitignore
- Allow redis to set expires with an int arg

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...3-cachecontrol_0.12.9.bb => python3-cachecontrol_0.12.10.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cachecontrol_0.12.9.bb => python3-cachecontrol_0.12.10.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-cachecontrol_0.12.9.bb b/meta-python/recipes-devtools/python/python3-cachecontrol_0.12.10.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-cachecontrol_0.12.9.bb
rename to meta-python/recipes-devtools/python/python3-cachecontrol_0.12.10.bb
index 2b2b72d55..58c157bb3 100644
--- a/meta-python/recipes-devtools/python/python3-cachecontrol_0.12.9.bb
+++ b/meta-python/recipes-devtools/python/python3-cachecontrol_0.12.10.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=12;endline=12;md5=62d6ee40749ec0b7
 # override PYPI_PACKAGE so fetch succeeds.
 PYPI_PACKAGE = "CacheControl"
 
-SRC_URI[sha256sum] = "b5d0c98f7ee9f02e2d5a85af98b9a76c0a2c73c972c142291f823a0ed2eb7a78"
+SRC_URI[sha256sum] = "d8aca75b82eec92d84b5d6eb8c8f66ea16f09d2adb09dbca27fe2d5fc8d3732d"
 
 inherit pypi setuptools3
 
-- 
2.20.1


