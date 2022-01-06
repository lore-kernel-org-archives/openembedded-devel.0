Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44FC7C433F5
	for <webhook@archiver.kernel.org>; Thu,  6 Jan 2022 20:56:17 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web08.14829.1641502575247429865
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jan 2022 12:56:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=SQF4QpR4;
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
	bh=GdeHiStgagGUE30mJFLo12GreR9iWSPsTaW2fAYOeHg=; b=SQF4QpR4QjmcI4GAwY/gtDjmy+
	JL5oqjlWIZhlYo15+ufqq9sHOCH9gn6prxjlLvq2+Ivew4hlD6k/LJcLsOSGMDUnAEi+M/FWUQ0+L
	gWGEzTQEKNWiS4o+vQlwhblr9hZYVVuWCDsY5G8240P4zcDTTIKfdOWa4KW+uSJb0GSCg+GyJoubb
	mj+2JuTnS19BZ60xv2qif/08FDI4mObIZ8EwwdkLNtdFWB/KDfrPNtMArWaqgJzDVRAbFCWAJRgml
	5w6qR7jxXZWaSBr7ByqF5BY4Z7tuphk8P0SuugkzsN/U8ZG5xxKUIl3KEaxPvAYkkFWVQJpxk4bSt
	jjKOXTFg==;
Received: from lan.nucleusys.com ([92.247.61.126]:44748 helo=lootbox.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1n5ZpR-000AYs-NK; Thu, 06 Jan 2022 22:56:16 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/4] python3-pychromecast: Upgrade 10.1.1 ->
 10.2.3
Date: Thu,  6 Jan 2022 22:55:59 +0200
Message-Id: <20220106205600.3147781-3-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Jan 2022 20:56:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94674

Upgrade to release 10.2.3:

- Attempt reconnect on unknown exceptions
- Handle NotConnected exception when reconnecting

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...n3-pychromecast_10.1.1.bb => python3-pychromecast_10.2.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pychromecast_10.1.1.bb => python3-pychromecast_10.2.3.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_10.1.1.bb b/meta-python/recipes-devtools/python/python3-pychromecast_10.2.3.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-pychromecast_10.1.1.bb
rename to meta-python/recipes-devtools/python/python3-pychromecast_10.2.3.bb
index 185193992..9bd037981 100644
--- a/meta-python/recipes-devtools/python/python3-pychromecast_10.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pychromecast_10.2.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/balloob/pychromecast"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5"
 
-SRC_URI[sha256sum] = "33a47d551ae8b6f93129564828e72e7f4dcb26c9f8812328870cf300ee45438f"
+SRC_URI[sha256sum] = "ddb86c5acdc13e8bdadd2b7f5738fda36b32c1750548f7b629ca8d178f05e0da"
 
 PYPI_PACKAGE = "PyChromecast"
 
-- 
2.30.2


