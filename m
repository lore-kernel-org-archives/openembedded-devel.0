Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E85BEC32772
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 11:02:30 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web11.29906.1661252540765725361
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Aug 2022 04:02:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=YUqZdDbf;
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
	bh=UfTviDEp7BI1AgODM4JgB0DhnUfak+/GMv0iiHxb+jQ=; b=YUqZdDbfyHrz6S9DjkhE5wHF0x
	uqfGKaruuEBOTzUeZT8sQIHeHUcJBGAIYYiJF9lRdb7vTQGUaisWFYSlNFboi26geX+2XgI/gAnbh
	1LCLw7vyGVEz1HPBJHNTSJ06cKXSMUt+bPMw+kLNpRUB57Y/8DBWZg//bNClknb1edyri5A/WtR0n
	ClcQYPZ0Yly7zE0CN1B+BbkuzuuXnZAkrV2wYrSR64XmF/vDe/2TJvdlY+07QeUmthd4dr4KcMric
	z7b2w2dOVoSuQdhEquLwQrLkJASR/GPxlu24KS4mK7tghcydMoDC7KadWSd8rrhVerWOxdCshYGda
	a7sYHAfw==;
Received: from lan.nucleusys.com ([92.247.61.126]:60034 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1oQRfp-0000ni-Oh;
	Tue, 23 Aug 2022 14:02:19 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/4] python3-prettytable: Upgrade 3.1.1 -> 3.3.0
Date: Tue, 23 Aug 2022 14:02:04 +0300
Message-Id: <20220823110204.2685251-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220823110204.2685251-1-leon.anavi@konsulko.com>
References: <20220823110204.2685251-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Aug 2022 11:02:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98391

Upgrade to release 3.3.0:

- Support Python 3.11
- Add flag to preserve internal borders when border=False

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-prettytable_3.1.1.bb => python3-prettytable_3.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-prettytable_3.1.1.bb => python3-prettytable_3.3.0.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-prettytable_3.1.1.bb b/meta-python/recipes-devtools/python/python3-prettytable_3.3.0.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-prettytable_3.1.1.bb
rename to meta-python/recipes-devtools/python/python3-prettytable_3.3.0.bb
index 5520edc06..b98ee4942 100644
--- a/meta-python/recipes-devtools/python/python3-prettytable_3.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-prettytable_3.3.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://code.google.com/p/prettytable"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c9a6829fcd174d9535b46211917c7671"
 
-SRC_URI[sha256sum] = "43c9e23272ca253d038ae76fe3adde89794e92e7fcab2ddf5b94b38642ef4f21"
+SRC_URI[sha256sum] = "118eb54fd2794049b810893653b20952349df6d3bc1764e7facd8a18064fa9b0"
 
 do_install:append() {
     perm_files=`find "${D}${PYTHON_SITEPACKAGES_DIR}/" -name "*.txt" -o -name "PKG-INFO"`
-- 
2.30.2


