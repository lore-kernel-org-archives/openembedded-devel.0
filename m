Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64D87C433EF
	for <webhook@archiver.kernel.org>; Thu, 10 Feb 2022 11:35:09 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web11.9067.1644492907438805916
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Feb 2022 03:35:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=E6wqfidQ;
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
	bh=cYAS0RJm0/EL6BDB3pWxeJau6BD5rCu58mbng5/PXdE=; b=E6wqfidQNiC9wzbKXsoLE5Tbri
	2vOctBMpwUfcPBRn3phzrODgfdkmBcDWQRUBuZb3rBns5miAw2wCwchOeuQddCT866xiY98YqiiPf
	kZALwdowXh9rNsunB725CZWGHwyqTONjIyT6/zNg1EhDEE6HpX8t1SrNUMAI7wPsz3/hLn6LOKI6c
	Pavsm+GJOtrR8mTIsuleA5hSyi7uCrpGWIJsrQJRSmJecLCYzN30BWi04s5pNvGwsmKWc8AaVoPvZ
	55VHmjIK9dgoK9xlNmkx4vlaypZE+O6LhQb01w4nEmEdPY7ZQNlmKiHLoalUSFZJ7E5UQm38tBRko
	UuapuEaA==;
Received: from lan.nucleusys.com ([92.247.61.126]:42712 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1nI7kd-000CVK-3q; Thu, 10 Feb 2022 13:35:05 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-humanize: Upgrade 3.13.1 -> 3.14.0
Date: Thu, 10 Feb 2022 13:34:53 +0200
Message-Id: <20220210113454.2022446-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220210113454.2022446-1-leon.anavi@konsulko.com>
References: <20220210113454.2022446-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Feb 2022 11:35:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95285

Upgrade to release 3.14.0:

- Don't deprecate time.Unit enumeration
- Use humanize.intcomma to format years in time module

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-humanize_3.13.1.bb => python3-humanize_3.14.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-humanize_3.13.1.bb => python3-humanize_3.14.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-humanize_3.13.1.bb b/meta-python/recipes-devtools/python/python3-humanize_3.14.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-humanize_3.13.1.bb
rename to meta-python/recipes-devtools/python/python3-humanize_3.14.0.bb
index 2c601b5de..6b2fd3ad6 100644
--- a/meta-python/recipes-devtools/python/python3-humanize_3.13.1.bb
+++ b/meta-python/recipes-devtools/python/python3-humanize_3.14.0.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=4ecc42519e84f6f3e23529464df7bd1d"
 
-SRC_URI[sha256sum] = "12f113f2e369dac7f35d3823f49262934f4a22a53a6d3d4c86b736f50db88c7b"
+SRC_URI[sha256sum] = "60dd8c952b1df1ad83f0903844dec50a34ba7a04eea22a6b14204ffb62dbb0a4"
 
 inherit pypi setuptools3
 
-- 
2.30.2


