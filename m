Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63A33C433EF
	for <webhook@archiver.kernel.org>; Thu,  6 Jan 2022 20:56:13 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web11.14858.1641502571224466263
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jan 2022 12:56:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=MT1xvutg;
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
	bh=LWbpoYbuAlaWnnnlaK12IaClWAxIsc/sgLM1a3TGXsg=; b=MT1xvutgiC2IwFADVqsnWC9QbZ
	jJRIuEVEQ67H4FA0YkwquycSI/Sa/3opOXnxwdMx6a4N9yM7yb0Eekd+lw+hAm/xf3gYtVpAFFv2I
	06770v0AN7EzXUhb0nFtzYqV4Jt1h9PwvYaP9u0EeGioG/tLxgzXO7M2I324C5DM6PeOriK2oWD5d
	M7nSstMsTRddZ9my2gmKlph8SSmS/2WO/NFy/vPhQ7wjGhgOUPgV5ROJH85h2p484wSXIWObeQG/D
	tPv0JJrwo9JO7dguyrt8SpfqOpExwdCzn+g8ULjRiGTBLCDY9qWXCQ2WDopVtW/unNtV4UrPGevML
	Ckx9bVxg==;
Received: from lan.nucleusys.com ([92.247.61.126]:44748 helo=lootbox.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1n5ZpM-000AYs-LL; Thu, 06 Jan 2022 22:56:11 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/4] python3-paramiko: Upgrade 2.8.0 -> 2.9.1
Date: Thu,  6 Jan 2022 22:55:57 +0200
Message-Id: <20220106205600.3147781-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
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
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Jan 2022 20:56:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94672

Upgrade to release 2.9.1:

- Add support for SHA-2 variants of RSA key
- Client verification of server host key during key exchange will
  now prefer rsa-sha2-512, rsa-sha2-256, and legacy ssh-rsa
  algorithms, in that order, instead of just ssh-rsa.
- Server mode will now offer all 3 RSA algorithms for host key
  verification during key exchange, similar to client mode, if it
  has been configured with an RSA host key.
- Client mode key exchange now sends the ext-info-c flag signaling
  support for MSG_EXT_INFO, and support for parsing the latter has
  been added.
- SSH agent support grew the ability to specify algorithm flags
  when requesting private key signatures; this is now used to
  forward SHA2 algorithms when appropriate.
- Server mode is now capable of pubkey auth involving SHA-2
  signatures from clients, provided one's server
  implementation actually provides for doing so.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-paramiko_2.8.0.bb => python3-paramiko_2.9.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-paramiko_2.8.0.bb => python3-paramiko_2.9.1.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-paramiko_2.8.0.bb b/meta-python/recipes-devtools/python/python3-paramiko_2.9.1.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-paramiko_2.8.0.bb
rename to meta-python/recipes-devtools/python/python3-paramiko_2.9.1.bb
index 1942a1d6c..8cf004aa3 100644
--- a/meta-python/recipes-devtools/python/python3-paramiko_2.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-paramiko_2.9.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/paramiko/paramiko/"
 LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fd0120fc2e9f841c73ac707a30389af5"
 
-SRC_URI[sha256sum] = "e673b10ee0f1c80d46182d3af7751d033d9b573dd7054d2d0aa46be186c3c1d2"
+SRC_URI[sha256sum] = "a1fdded3b55f61d23389e4fe52d9ae428960ac958d2edf50373faa5d8926edd0"
 
 PYPI_PACKAGE = "paramiko"
 
-- 
2.30.2


