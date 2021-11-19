Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A539AC433FE
	for <webhook@archiver.kernel.org>; Fri, 19 Nov 2021 10:28:01 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web12.7173.1637317679911335300
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Nov 2021 02:28:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=WLMo1XDP;
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
	bh=V45RwnGbd/M+lKz4ByCfhcPsczaBVaWGXI+EWiQN544=; b=WLMo1XDPcbbydrPQpzqN/fOSIj
	xvfIeoljxDOHi4Ra5iZAcEWpsLSYsQ1C3AafDN8vlpbpZ79bF6dXQr8JX3RVne5R/Sff34nZQRfew
	qS0vzsO1SLiMCTG5LSurf3tIyLqW6fBSFXchxAtSI6FZSk/m7bQEpxJauJVmvdiLQ+7iHYFUTaT0u
	wkw68VehzhBAdp+TqJaSEkKvPpIsH5JrhzNuunxjHrvMkPHpj7LrqhnkxFZh4vdePOABEUgJuRDG+
	UNKUabRM7bSnrN6kyr6D0wM3mg9JhEVmdp13cK8pwkWbU5MeTcP4JpfOgyyUboOqbJ3i2b07GC8bt
	6ERfTLmQ==;
Received: from lan.nucleusys.com ([92.247.61.126]:34090
 helo=lootbox.konsulko.bg)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1mnzFa-0008o5-JG; Fri, 19 Nov 2021 12:27:58 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-aiohue: Upgrade 2.6.3 -> 3.0.1
Date: Fri, 19 Nov 2021 12:27:40 +0200
Message-Id: <20211119102740.2676-5-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Nov 2021 10:28:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94060

Upgrade to release 3.0.1:

- catch more generic aiohttp ClientError in eventstream
- Refactor full v2 support
- Bump flake8 from 3.9.2 to 4.0.1

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-aiohue_2.6.3.bb => python3-aiohue_3.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiohue_2.6.3.bb => python3-aiohue_3.0.1.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohue_2.6.3.bb b/meta-python/recipes-devtools/python/python3-aiohue_3.0.1.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-aiohue_2.6.3.bb
rename to meta-python/recipes-devtools/python/python3-aiohue_3.0.1.bb
index e9cbde84d..757ab96c3 100644
--- a/meta-python/recipes-devtools/python/python3-aiohue_2.6.3.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohue_3.0.1.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dab31a1d28183826937f4b152143a33f"
 
-SRC_URI[sha256sum] = "ce9c240ca3eb1394c56503b403589f4d0ee7f93445a578b78da8b7879a65c863"
+SRC_URI[sha256sum] = "f4933b8583d093da4c2772c40c59d262892539c7053996cea5b964a2cceaa386"
 
 inherit pypi setuptools3
 
-- 
2.20.1


