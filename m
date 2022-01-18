Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4854FC433F5
	for <webhook@archiver.kernel.org>; Tue, 18 Jan 2022 10:04:39 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web08.10788.1642500277178946202
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Jan 2022 02:04:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=GIJCfmmz;
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
	bh=U9uIqRnReooQlHXFYyF+MLAgIXBpKnAYzj+1VArp1jI=; b=GIJCfmmzcJWcv5jqZbyzf4ppJv
	DXB4ZZdGlz5+JhDLqkJHfk3+7xVD6QHPe70dATWZq8+DiOa3qJNXsXTKstCGxIKpw1c0ht1mQg1LP
	aHMJoy1VyuUYqwG7jiojie0GhVlA8UHZ4jXcvpYPLppaR5d+1kNRuJO06Q7+T37EaAWWEh4/jS+WK
	Hf+xgzTJc4VnKFaOE6wtvw1xMfXZraWGkYsQrg0aCN0f8OvZdCoWBpP7BeEl81pNCg37M6vEIIh32
	nguXkzjCWBgcsDpo9ct6hPQ/nP8mwDbRXT+deq0KkMxslemtx/e6VV1NlEFV3UmLzgxLtPugrnlME
	rgbAHJ+g==;
Received: from lan.nucleusys.com ([92.247.61.126]:60642 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1n9lMG-00071P-GY; Tue, 18 Jan 2022 12:04:36 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-fastjsonschema: Upgrade 2.15.1 ->
 2.15.3
Date: Tue, 18 Jan 2022 12:04:22 +0200
Message-Id: <20220118100422.461016-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220118100422.461016-1-leon.anavi@konsulko.com>
References: <20220118100422.461016-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Jan 2022 10:04:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94913

Upgrade to release 2.15.3:

- Fix swapping handlers
- Fix tests
- Readablregexps in generated code

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...astjsonschema_2.15.1.bb => python3-fastjsonschema_2.15.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-fastjsonschema_2.15.1.bb => python3-fastjsonschema_2.15.3.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-fastjsonschema_2.15.1.bb b/meta-python/recipes-devtools/python/python3-fastjsonschema_2.15.3.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-fastjsonschema_2.15.1.bb
rename to meta-python/recipes-devtools/python/python3-fastjsonschema_2.15.3.bb
index a8bc0c10d..a2821c117 100644
--- a/meta-python/recipes-devtools/python/python3-fastjsonschema_2.15.1.bb
+++ b/meta-python/recipes-devtools/python/python3-fastjsonschema_2.15.3.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/seznam/python-fastjsonschema"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=18950e8362b69c0c617b42b8bd8e7532"
 
-SRCREV = "1e214911fe83dbaeea3d50dfb3a539118de8a442"
+SRCREV = "d03f3835da4899bdeb597a9d3f30a709e7c3254f"
 PYPI_SRC_URI = "git://github.com/horejsek/python-fastjsonschema;protocol=https;branch=master"
 
 SRC_URI += "file://run-ptest"
-- 
2.30.2


