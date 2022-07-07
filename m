Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D35B4C43334
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 09:47:13 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web08.3700.1657187223587232248
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Jul 2022 02:47:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=nY7p6uWn;
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
	bh=cg4yaV28IE1SYOKqxPuiermunk5SpG0aIjAaktQuBD0=; b=nY7p6uWnk3NXtE3kaeII8SMtL+
	Ha7HYJ3Uov7A2np20xJLvj0mY+u/w5TzvTD65HJW1PkI8vTnXNZfYq9gkalcDbE1pheRRfAFIIHtr
	AEk8CfvIkj99mGAIwBtjhazmZYwOhm7RQ9fOAMPZABbFf0ddpImdPcfAs+zL2CfPk6FhViJ51rsI/
	VNr786X0ROnNYrWL+KbL83TTafYuhZPSnEnNgjv/LL1qW50PTQKS7TtUtrmSYvFWfXvtnLcYdavFD
	W2J2ay/QyRtE/PpPAu3EZWJlUKU5lD+dfcEYfG1LrsA4DtkDSRQ/5v761xHIsKaOZF4H4diOVF3iK
	QYkcgagA==;
Received: from lan.nucleusys.com ([92.247.61.126]:48688 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1o9O7G-0004Fc-Q0;
	Thu, 07 Jul 2022 12:47:01 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-autobahn: Upgrade 22.5.1 -> 22.6.1
Date: Thu,  7 Jul 2022 12:46:47 +0300
Message-Id: <20220707094651.1716295-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Jul 2022 09:47:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97769

Upgrade to release 22.6.1:

- new: add SecurityModuleMemory.from_config and
  SecurityModuleMemory.from_keyfile
- new: moved UserKey from crossbar to autobahn
- fix: more WAMP-Cryptosign unit tests
- new: experimental WAMP API catalog support
- new: regenerate FlatBuffers WAMP messages
- fix: allow tests to pass without XBR dependencies
- new: Flatbuffers IDL based WAMP payload validation
- fix: restore autobahn.twisted.testing to distribution

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-autobahn_22.5.1.bb => python3-autobahn_22.6.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-autobahn_22.5.1.bb => python3-autobahn_22.6.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-autobahn_22.5.1.bb b/meta-python/recipes-devtools/python/python3-autobahn_22.6.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-autobahn_22.5.1.bb
rename to meta-python/recipes-devtools/python/python3-autobahn_22.6.1.bb
index 956399b56..71da18f81 100644
--- a/meta-python/recipes-devtools/python/python3-autobahn_22.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-autobahn_22.6.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://crossbar.io/autobahn"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=97c0bda20ad1d845c6369c0e47a1cd98"
 
-SRC_URI[sha256sum] = "34aa5569b0b4419f8c277792c600dc2518c4930928c74e2279ef8b88d8b8a3ea"
+SRC_URI[sha256sum] = "fb63e946d5c2dd0df680851e84e65624a494ce87c999f2a4944e4f2d81bf4498"
 
 inherit pypi setuptools3
 
-- 
2.30.2


