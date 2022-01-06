Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36EBFC433FE
	for <webhook@archiver.kernel.org>; Thu,  6 Jan 2022 20:56:15 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web10.14734.1641502572798918467
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jan 2022 12:56:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=Kcv9ns5f;
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
	bh=S2OgQ++zSuiB0qpPJDOAwhuxcWK5y3N2JtpmmlqsbE8=; b=Kcv9ns5fvNW4AegQwwtbtXoyMh
	1n/odupg9bYb7r/e1NNVok1F8jq3ezLF0Q0vmsoxlGrMX4m52FXo6zDw2qQz7XgP548YLboVau61K
	RPi3dHabEiA0cYQpskr0ynBxP5H4/SLxmsJpwwMXOtrqSv+iJqpmbZ93D0oWNFgEBupM6dvZkcUUG
	1weqjeItZe29AswW/ZFCenu1hUuYV3u+9AefaYRgChYp+pKm7X4a3A6RSJr+L3xrFoh/+D6cOhod8
	JuwPbIXP3oR/NzfYLeSOfgRH9QMyXfcm6zAQlQldscvDwAQeepzHv5CeliPYvsJmxhbjJGdV9Gh7U
	V7dEfS3g==;
Received: from lan.nucleusys.com ([92.247.61.126]:44748 helo=lootbox.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1n5ZpP-000AYs-Dx; Thu, 06 Jan 2022 22:56:13 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/4] python3-isodate: Upgrade 0.6.0 -> 0.6.1
Date: Thu,  6 Jan 2022 22:55:58 +0200
Message-Id: <20220106205600.3147781-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220106205600.3147781-1-leon.anavi@konsulko.com>
References: <20220106205600.3147781-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Jan 2022 20:56:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94673

Upgrade to release 0.6.1:

- support python 3.10
- last version to support py 2.7

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-isodate_0.6.0.bb => python3-isodate_0.6.1.bb}     | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-isodate_0.6.0.bb => python3-isodate_0.6.1.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-isodate_0.6.0.bb b/meta-python/recipes-devtools/python/python3-isodate_0.6.1.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-isodate_0.6.0.bb
rename to meta-python/recipes-devtools/python/python3-isodate_0.6.1.bb
index dd3954172..2a5dcfca3 100644
--- a/meta-python/recipes-devtools/python/python3-isodate_0.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-isodate_0.6.1.bb
@@ -2,8 +2,7 @@ SUMMARY = "ISO 8601 date/time parser"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e910b35b0ef4e1f665b9a75d6afb7709"
 
-SRC_URI[md5sum] = "0e1203fce27ce65e2d01c5f21c4d428f"
-SRC_URI[sha256sum] = "2e364a3d5759479cdb2d37cce6b9376ea504db2ff90252a2e5b7cc89cc9ff2d8"
+SRC_URI[sha256sum] = "48c5881de7e8b0a0d648cb024c8062dc84e7b840ed81e864c7614fd3c127bde9"
 
 inherit pypi setuptools3
 
-- 
2.30.2


