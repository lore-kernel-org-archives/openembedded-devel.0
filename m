Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 725CBC433FE
	for <webhook@archiver.kernel.org>; Wed, 12 Jan 2022 18:35:47 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web09.1291.1642012546197156307
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Jan 2022 10:35:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=gPaTw4M8;
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
	bh=a6pPOYwsIOM/eVGKe0OdTgUXPaIZvn3dF5q8udMCN2I=; b=gPaTw4M8GRtzjBNjtWtz/X10Ri
	R5fpVfiNS0TSlbgSmBeEW3C76q604hj3ZtWcpKllvIrg/OqOSIAy2vtg3OrG0+4TAQ039NQbLnjOj
	II1+3LYjSV97HgTgvfn6RHUtzEPs2m9+serlwrJyT0xWC8zYdocf5A1bFUyoA0iBXIKM9StfrXFei
	gIJTmtXsdi9rb2DaXuN8+9lbkfhPDL643CZw+Dm4Yw4sW94JE7Mr/6IjwgUgYONzEuqCE3zgXk7EK
	bVYKR+lpIOde6lixRtIpZe2Oo9FpJKa4FeKEs3MT9bSkUCsGMq13TOMo4HQ+j/itzZb87mkmTse3t
	J3cQpM4g==;
Received: from lan.nucleusys.com ([92.247.61.126]:48040 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1n7iVD-000Bc0-KE; Wed, 12 Jan 2022 20:35:46 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-aiohue: Upgrade 3.0.1 -> 3.0.11
Date: Wed, 12 Jan 2022 20:35:28 +0200
Message-Id: <20220112183531.2712341-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220112183531.2712341-1-leon.anavi@konsulko.com>
References: <20220112183531.2712341-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jan 2022 18:35:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94790

Upgrade to release 3.0.11:

- Add workaround for FOH switches
- Fix short and long flash for lights
- Fix reconnect last event id

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-aiohue_3.0.1.bb => python3-aiohue_3.0.11.bb} | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-aiohue_3.0.1.bb => python3-aiohue_3.0.11.bb} (56%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohue_3.0.1.bb b/meta-python/recipes-devtools/python/python3-aiohue_3.0.11.bb
similarity index 56%
rename from meta-python/recipes-devtools/python/python3-aiohue_3.0.1.bb
rename to meta-python/recipes-devtools/python/python3-aiohue_3.0.11.bb
index 757ab96c3..47d9964b0 100644
--- a/meta-python/recipes-devtools/python/python3-aiohue_3.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohue_3.0.11.bb
@@ -4,8 +4,12 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dab31a1d28183826937f4b152143a33f"
 
-SRC_URI[sha256sum] = "f4933b8583d093da4c2772c40c59d262892539c7053996cea5b964a2cceaa386"
+SRC_URI[sha256sum] = "31c0b90d7dc2b62f5e1a93e78b2c0d6360ef6c0a87485c217a4f394c937fce7d"
 
 inherit pypi setuptools3
 
-RDEPENDS:${PN} += "${PYTHON_PN}-aiohttp"
+RDEPENDS:${PN} += " \
+	${PYTHON_PN}-aiohttp \
+	${PYTHON_PN}-asyncio-throttle \
+	${PYTHON_PN}-profile \
+"
-- 
2.30.2


