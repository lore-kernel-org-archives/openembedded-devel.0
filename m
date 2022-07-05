Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C08EC433EF
	for <webhook@archiver.kernel.org>; Tue,  5 Jul 2022 14:24:19 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web08.84659.1657031053232822736
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Jul 2022 07:24:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=tlxU+nQq;
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
	bh=HEFkyGnjweC8ynQJI4IBNvNqzYeBKawNXqGvorHzEuo=; b=tlxU+nQqSaSLCYQ2vqV35xERQ5
	uZ2R1nJvJvb+p5SIHFF80hLVtAxmiUdtJWSmkwqjYiZTto7eacLCcPEJ0kQjIY4aAbyiUpFlahvH6
	sy23CypQlSuvY2hEA6NJrO4CxDZACSzhyqHjCns1NSCG3Gp+T3zTQ76E7DMGlWLGf3z7hpaM7QhDF
	GiwKtlnVzBG+MT4pXshlHPBvA/gjC9YwfX+pd5SIPPGb/v8znG7iHcqDNVfuNckh0W0WhTcC2MILX
	Gl3efdYbm9O+9fpcWGp3f43fip8g7y8FE/iaQigpgDkBHnBuGEq2u7cONxjf6EMReR8V8ouEtwTXL
	+mKCa+6Q==;
Received: from lan.nucleusys.com ([92.247.61.126]:44750 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1o8jUG-00008J-PX;
	Tue, 05 Jul 2022 17:24:13 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-elementpath: Upgrade 2.5.0 -> 2.5.3
Date: Tue,  5 Jul 2022 17:23:59 +0300
Message-Id: <20220705142359.1010195-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220705142359.1010195-1-leon.anavi@konsulko.com>
References: <20220705142359.1010195-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Jul 2022 14:24:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97716

Upgrade to release 2.5.3:

- Fix unary path step operator
- Fix sphinx warnings 'reference target not found'

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-elementpath_2.5.0.bb => python3-elementpath_2.5.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-elementpath_2.5.0.bb => python3-elementpath_2.5.3.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-elementpath_2.5.0.bb b/meta-python/recipes-devtools/python/python3-elementpath_2.5.3.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-elementpath_2.5.0.bb
rename to meta-python/recipes-devtools/python/python3-elementpath_2.5.3.bb
index e882952ac..22f5aa099 100644
--- a/meta-python/recipes-devtools/python/python3-elementpath_2.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-elementpath_2.5.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/sissaschool/elementpath"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5dbb7fb7d72da3921202dd7b995d3ecf"
 
-SRC_URI[sha256sum] = "3a27aaf3399929fccda013899cb76d3ff111734abf4281e5f9d3721ba0b9ffa3"
+SRC_URI[sha256sum] = "b8aeb6f27dddc10fb9201b62090628a846cbae8577f3544cb1075fa38d0817f6"
 
 PYPI_PACKAGE = "elementpath"
 inherit pypi setuptools3
-- 
2.30.2


