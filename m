Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96120ECAAD8
	for <webhook@archiver.kernel.org>; Fri, 16 Sep 2022 10:38:28 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web10.4563.1663324700575217293
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Sep 2022 03:38:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=HpBDJ/FB;
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
	bh=awNlIIdoAl6u/hgCoVSFrOgZy2lC0O/7Y0TDEka2AGA=; b=HpBDJ/FBbWgn2BbErAgJ7M0YSK
	cY5BJ82AAyEGMboViz6oyyi5b6GmkS3KHs39vXusPe8wOZ4DqgaqZ0u/A5KxnjAeudJFHk6tbnPFB
	GS2PCjHZv3qoD9fnA8GpUcGxA76WofyHAVdxkPaSBSPkqW2bigprm85r/KeWNxeF3ZrbrB2eb1aTX
	ZsfW5JflbCrViAWj4HJRcqKf87tZawbVn+Ozn2hG7o8tntEkP/dsC3BUleoCKUwMqfFdM8In2mccv
	94xrRPgMbeN62MvCF5e5+OEXhB1x7ujXWkhg8xVkYlvF0Z+Y3iHKjN6jp/r7vClPpMKtBZ3KfV5fK
	//d925Ug==;
Received: from lan.nucleusys.com ([92.247.61.126]:49096 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1oZ8jq-0005VH-OI;
	Fri, 16 Sep 2022 13:38:19 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/4] python3-marshmallow: Upgrade 3.17.1 ->
 3.18.0
Date: Fri, 16 Sep 2022 13:37:59 +0300
Message-Id: <20220916103800.573091-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220916103800.573091-1-leon.anavi@konsulko.com>
References: <20220916103800.573091-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Sep 2022 10:38:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98833

Upgrade to release 3.18.0:

- Add Enum field
- Fix typing in Field._serialize signature

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-marshmallow_3.17.1.bb => python3-marshmallow_3.18.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-marshmallow_3.17.1.bb => python3-marshmallow_3.18.0.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-marshmallow_3.17.1.bb b/meta-python/recipes-devtools/python/python3-marshmallow_3.18.0.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-marshmallow_3.17.1.bb
rename to meta-python/recipes-devtools/python/python3-marshmallow_3.18.0.bb
index a7f4020cf..c52ff30fd 100644
--- a/meta-python/recipes-devtools/python/python3-marshmallow_3.17.1.bb
+++ b/meta-python/recipes-devtools/python/python3-marshmallow_3.18.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "\
 
 SRC_URI = "git://github.com/marshmallow-code/marshmallow.git;protocol=https;branch=dev"
 
-SRCREV = "22e063270fea6ef6669425f53216e47eb8b04cc5"
+SRCREV = "2805f32461fc7801a5f7b6d83facf7cbb8bca278"
 
 S = "${WORKDIR}/git"
 
-- 
2.30.2


