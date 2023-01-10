Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E98DBC46467
	for <webhook@archiver.kernel.org>; Tue, 10 Jan 2023 10:56:24 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web10.100815.1673348181102539800
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Jan 2023 02:56:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=W0Wc2KcI;
 spf=softfail (domain: konsulko.com, ip: 79.124.30.14, mailfrom: leon.anavi@konsulko.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=anavi.org;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=7kX9gSSTKpr0M489ZW/7v8PC51bh+pA6C/mxCOZUAhg=; b=W0Wc2KcI53g/uminOBCmNUHVnP
	ANKqe60unvQcSL2lCrnP9Kaj0YNyyDmGcr1jj+eRc9nF8wuPX3cfinyHuqXlNci/dzE/8HzGFa6tQ
	X/VWQVE/3PCH4jcIZ1ayp9AeV/4NBkkQjbQvPcnkN2Ety2iDOh+vRXggp7EHklYo8AMuQC3MQgZ+K
	OA7ZrZHKwXjyj9Pqe8JsYN9elx2DNoIstedZ98eh88Vy/u4AcX7eObH/JLfJbt4Bn5xin1lUmsYKY
	nMuaOL8st2te18w6Zr3PT4H9horL5u+2/yjfJh/PKNeYHy5hCFPZfmjp7L54q0FnhFgXPduGAGhtI
	Ws5wNYEQ==;
Received: from lan.nucleusys.com ([92.247.61.126]:53480 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1pFCIk-0009km-1N;
	Tue, 10 Jan 2023 12:56:19 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-traitlets: Upgrade 5.8.0 -> 5.8.1
Date: Tue, 10 Jan 2023 12:56:07 +0200
Message-Id: <20230110105609.56178-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.superhosting.bg
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.superhosting.bg: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.superhosting.bg: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jan 2023 10:56:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100517

Upgrade to release 5.8.1:

- fix: mro_trait can be unbound when the class is not in mro

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-traitlets_5.8.0.bb => python3-traitlets_5.8.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-traitlets_5.8.0.bb => python3-traitlets_5.8.1.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-traitlets_5.8.0.bb b/meta-python/recipes-devtools/python/python3-traitlets_5.8.1.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-traitlets_5.8.0.bb
rename to meta-python/recipes-devtools/python/python3-traitlets_5.8.1.bb
index d7a78254e..3f75df6f1 100644
--- a/meta-python/recipes-devtools/python/python3-traitlets_5.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-traitlets_5.8.1.bb
@@ -4,7 +4,7 @@ AUTHOR = "IPython Development Team <ipython-dev@scipy.org>"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.md;md5=f17a3ba4cd59794dd6e005c8e150aef0"
 
-SRC_URI[sha256sum] = "6cc57d6dc28c85d5365961726ffd19b538739347749e13ebe34e03323a0e8f84"
+SRC_URI[sha256sum] = "32500888f5ff7bbf3b9267ea31748fa657aaf34d56d85e60f91dda7dc7f5785b"
 
 inherit pypi python_hatchling
 
-- 
2.30.2


