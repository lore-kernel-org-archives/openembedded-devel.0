Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56672C43334
	for <webhook@archiver.kernel.org>; Tue,  5 Jul 2022 14:24:19 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web09.85065.1657031052002259130
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Jul 2022 07:24:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=hG1Pgxa3;
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
	bh=XYMYWRPzt2Ly1b/EmtihmwPZNu9tD74jMgQeHdwDRoU=; b=hG1Pgxa3A7GfjKOY/hjS6AOwCR
	cLlP9J4QkDZJMEVDq3QpEC8dqmxNmFFOXG+izf0VL+MtYH5SH2phE5BP3przNpWZgvITiBqJ+l0gX
	L/i+wss/OiAnuCiY3a3VgufkDGzOOVvxG3IEWwV47JLAPg/6+u1ewwMDshAq4D/CQY7ePDTmZn2U6
	Vnzl2G9uck6ZCFLvkLl0LYJZDBhhggY8pfeBjPRQu8Bw4SbjTN9RAEXQTFqqsdaJsSM1qSeOo+x75
	FkF8Y/ecGMflyEW/hTMMdUymWnsQ7qxTfsAClTNjecRTeeeCOovUQ8mQoOCyn3efidfDSBlgd47yx
	FSCN0yVQ==;
Received: from lan.nucleusys.com ([92.247.61.126]:44750 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1o8jUE-00008J-0J;
	Tue, 05 Jul 2022 17:24:10 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-autobahn:  Upgrade 22.4.2 -> 22.5.1
Date: Tue,  5 Jul 2022 17:23:58 +0300
Message-Id: <20220705142359.1010195-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Jul 2022 14:24:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97715

Upgrade to release 22.5.1:

- new: WAMP Flatbuffers IDL and schema processing (experimental)
- new: WAMP-cryptosign trustroot (experimental)
- new: add wrapper type for CryptosignAuthextra
- fix: stricted type checking of Challenge; fix cryposign unit test
- new: more test coverage
- fix: reduce log noise
- fix: forward channel_binding selected in Component client
- new: expand ISigningKey to provide security_module/key_id
- fix: Component cryptosign test
- fix: add type hints; fix channel_binding
- new: work on federated realms and secmods
- new: rename to and work on a.w.CryptosignKey
- new: add bip44 for cryptosign test
- fix: remove all txaio.make_logger refs from generic code
- new: initial support for federated WAMP realms via
  a.x.FederatedRealm/Seeder
- new: moved utility functions and unit tests for WAMP realm name
  checking from Crossbar.io
- new: allow list of URLs for transports in a.t.component.Component
- new: add websocket_options to a.t.wamp.ApplicationRunner
- new: add stop_at_close flag in a.t.component.run
- fix: reduce log noise (regression) on ApplicationRunner Twisted
- new: allow max_retry_delay==0 for always-immediate auto-reconnect
  in ApplicationRunner on Twisted
- new: add websocket_options to WAMP ApplicationRunner on Twisted
- new: more type hints and docs

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-autobahn_22.4.2.bb => python3-autobahn_22.5.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-autobahn_22.4.2.bb => python3-autobahn_22.5.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-autobahn_22.4.2.bb b/meta-python/recipes-devtools/python/python3-autobahn_22.5.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-autobahn_22.4.2.bb
rename to meta-python/recipes-devtools/python/python3-autobahn_22.5.1.bb
index 3dc308385..956399b56 100644
--- a/meta-python/recipes-devtools/python/python3-autobahn_22.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-autobahn_22.5.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://crossbar.io/autobahn"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=97c0bda20ad1d845c6369c0e47a1cd98"
 
-SRC_URI[sha256sum] = "57b7acf228d50d83cf327372b889e2a168a869275b26e17917ed0b4cf4d823a6"
+SRC_URI[sha256sum] = "34aa5569b0b4419f8c277792c600dc2518c4930928c74e2279ef8b88d8b8a3ea"
 
 inherit pypi setuptools3
 
-- 
2.30.2


