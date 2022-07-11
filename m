Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84B85C43334
	for <webhook@archiver.kernel.org>; Mon, 11 Jul 2022 09:07:09 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web11.26423.1657530423835487217
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Jul 2022 02:07:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=sSgMZoN2;
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
	bh=pMSx6uvWspWxn6vKGnKiCJFy6Eb4xRKnJTYQBhvZZXU=; b=sSgMZoN2ui/WjPMH9WonQLe86S
	GrYPP4rr8Dhv1+inb3aJrSS1C5to3oNKEtXVq+S0cXiyYH0oq/gscOwTKNq7O+Zc1UR9hFVeA4Ljm
	Ew6gunZBNqREiAbLO1F9t31HihBkwlJvyjN8e5mKZubHPbdx0WS2yaHXYgZRSct26lRPIo5uTmAiA
	3PDDdd2TVb4qXlMOlyjpIMmq+b7pk5J8OVKMPWTSHRa7ulZBvXt6A9zSmE6BIkKl2KQCERgTdlUh5
	twkxVDK3DnXCmvgUmCRRUBDHSiqmakVSTOQt5hORKOoGr1hTP92etOyeqF36zSS20Y/+mFiijrnRn
	aqWKtrwg==;
Received: from lan.nucleusys.com ([92.247.61.126]:52702 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1oApP3-000Clc-3P;
	Mon, 11 Jul 2022 12:07:02 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-toolz: Upgrade 0.11.2 -> 0.12.0
Date: Mon, 11 Jul 2022 12:06:49 +0300
Message-Id: <20220711090650.2117395-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Jul 2022 09:07:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97810

Upgrade to release 0.12.0:

- Add apply
- Support newer Python versions--up to Python 3.11-alpha
- Improve warning when using toolz.compatibility
- Improve documentation
- Improve performance of merge_with
- Improve import times
- Auto-upload new releases to PyPI

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-toolz_0.11.2.bb => python3-toolz_0.12.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-toolz_0.11.2.bb => python3-toolz_0.12.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-toolz_0.11.2.bb b/meta-python/recipes-devtools/python/python3-toolz_0.12.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-toolz_0.11.2.bb
rename to meta-python/recipes-devtools/python/python3-toolz_0.12.0.bb
index a597641e5..4025fa3e0 100644
--- a/meta-python/recipes-devtools/python/python3-toolz_0.11.2.bb
+++ b/meta-python/recipes-devtools/python/python3-toolz_0.12.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ca09cab178326d18433aae982d1edf5d"
 
-SRC_URI[sha256sum] = "6b312d5e15138552f1bda8a4e66c30e236c831b612b2bf0005f8a1df10a4bc33"
+SRC_URI[sha256sum] = "88c570861c440ee3f2f6037c4654613228ff40c93a6c25e0eba70d17282c6194"
 
 inherit pypi setuptools3
 
-- 
2.30.2


