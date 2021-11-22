Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E75FC433F5
	for <webhook@archiver.kernel.org>; Mon, 22 Nov 2021 10:32:37 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web10.4836.1637577154325665632
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Nov 2021 02:32:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=fC2KzUUa;
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
	bh=TTVDcYYXohGmoPHpWsjj0WhK3Ccx8tzUmG3VFl3f4Nc=; b=fC2KzUUaVS9Td7rXSZ8CMYGPys
	YrKoHV4kQSBx3EuZkzHE6DydapRWOlT/xvd4pKwMKLEpCf3hq7ZIKSfG81iAhSxFvkyjpGaiphjUt
	tC4uXBlGVs1UVxO/PA9kwX0GcgWBySBZKrKZwDKpXgq4PckUK807LIswUYUs2A9/G3zzwWJQYb5Sp
	G6xK8UodG0J1BQrvkkhcvZ7btmMCsDrvZrqNJCmD2kOrZZ7RVefyo9PLz8mmzYk3ApId3rlkxfJDy
	ukT4CVx+ofDAje/xqIGmK4YymBpoGx1EaJC0IcjdsqATHnH6RseZOm/GLDT+1YtgU2UeUjKitLndW
	sImDBdKg==;
Received: from lan.nucleusys.com ([92.247.61.126]:36490
 helo=lootbox.konsulko.bg)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1mp4ks-0004JH-KS; Mon, 22 Nov 2021 12:32:33 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-marshmallow: Upgrade 3.14.0 ->
 3.14.1
Date: Mon, 22 Nov 2021 12:32:21 +0200
Message-Id: <20211122103222.31758-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211122103222.31758-1-leon.anavi@konsulko.com>
References: <20211122103222.31758-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Nov 2021 10:32:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94092

Upgrade to release 3.14.1:

- Fix publishing type hints per PEP-561

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-marshmallow_3.14.0.bb => python3-marshmallow_3.14.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-marshmallow_3.14.0.bb => python3-marshmallow_3.14.1.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-marshmallow_3.14.0.bb b/meta-python/recipes-devtools/python/python3-marshmallow_3.14.1.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-marshmallow_3.14.0.bb
rename to meta-python/recipes-devtools/python/python3-marshmallow_3.14.1.bb
index 9a1e9e426..ddfe4b99c 100644
--- a/meta-python/recipes-devtools/python/python3-marshmallow_3.14.0.bb
+++ b/meta-python/recipes-devtools/python/python3-marshmallow_3.14.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "\
 
 SRC_URI = "git://github.com/marshmallow-code/marshmallow.git;protocol=https;branch=dev"
 
-SRCREV = "df4f8119111362180838d66cd7364812fa9df81d"
+SRCREV = "41afdefd93afd1b95f48f45fd284ff8add3e91b7"
 
 S = "${WORKDIR}/git"
 
-- 
2.20.1


