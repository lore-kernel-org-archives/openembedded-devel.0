Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5FABC433EF
	for <webhook@archiver.kernel.org>; Fri, 19 Nov 2021 10:28:04 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web08.7032.1637317682036048572
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Nov 2021 02:28:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=Aho59Nop;
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
	bh=19y1Jls36RQE8eJB+do2ZguKj4hg4XX5pyjzbqU5DXQ=; b=Aho59NopBaUPEmCQGcXQ/Qldos
	PyI0RU3lJ7WLX5Id7iXtgrNuvLf/FAc+/Q7oHFMJSEpMbEG45YzhnpHFoDfZgLxQpTcnL68PsZSpp
	J5dPWz30NrfuxA3928w6FFxxIVHcLPUqAtgww1CzptGtsD3y79IM9h5ckovUrUH3oanOfZQi53ngw
	ooUc7QpXGnFVDfftYMN58aW/18UBqqngfrx5+ncIqKZX1o/rfZPXzTn5m60HS5hAk8gJbeZNSCDeN
	/m9/W7Gu0yBdEBAAnBhmh/InGnT8gsUm6dajfuIlZzdZ8dclf5FRrevnqiQjZsftKT2TTsPIYMveC
	kFNKRg1A==;
Received: from lan.nucleusys.com ([92.247.61.126]:34090
 helo=lootbox.konsulko.bg)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1mnzFS-0008o5-GV; Fri, 19 Nov 2021 12:27:50 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-imageio: Upgrade 2.10.5 -> 2.11.0
Date: Fri, 19 Nov 2021 12:27:37 +0200
Message-Id: <20211119102740.2676-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211119102740.2676-1-leon.anavi@konsulko.com>
References: <20211119102740.2676-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Nov 2021 10:28:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94061

Upgrade to release 2.11.0:

- Choose plugin based on extension and plugin lazy-import

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-imageio_2.10.5.bb => python3-imageio_2.11.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-imageio_2.10.5.bb => python3-imageio_2.11.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-imageio_2.10.5.bb b/meta-python/recipes-devtools/python/python3-imageio_2.11.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-imageio_2.10.5.bb
rename to meta-python/recipes-devtools/python/python3-imageio_2.11.0.bb
index a724cfd83..6bdceb8b5 100644
--- a/meta-python/recipes-devtools/python/python3-imageio_2.10.5.bb
+++ b/meta-python/recipes-devtools/python/python3-imageio_2.11.0.bb
@@ -6,7 +6,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7b9bbbb543b6af3e6b53f9b7fb68f71d"
 
 
-SRC_URI[sha256sum] = "f3f6e9a73d62f12348f098364219f4fc64462760bc07abfe16d14db0e4974845"
+SRC_URI[sha256sum] = "f3c4904a963eb578f14fa356213e49cc25495d017974ad946bb5dcfebf10f117"
 
 inherit pypi setuptools3
 
-- 
2.20.1


