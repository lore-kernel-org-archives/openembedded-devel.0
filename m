Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25F60C43219
	for <webhook@archiver.kernel.org>; Fri, 12 Nov 2021 19:05:59 +0000 (UTC)
Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.231.1636743958108453554
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Nov 2021 11:05:58 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 spf.securedserverspace.com}: parse error
 for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded
 (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from lan.nucleusys.com ([92.247.61.126]:53236
 helo=lootbox.konsulko.bg)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1mlbrz-0006tw-Vb; Fri, 12 Nov 2021 21:05:52 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/6] python3-zeroconf: Upgrade 0.36.9 -> 0.36.12
Date: Fri, 12 Nov 2021 21:05:43 +0200
Message-Id: <20211112190547.4560-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211112190547.4560-1-leon.anavi@konsulko.com>
References: <20211112190547.4560-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OutGoing-Spam-Status: No, score=-0.5
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id:
 leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Nov 2021 19:05:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93919

Upgrade to release 0.36.12:

- Prevent service lookups from deadlocking if time abruptly moves
  backwards
- scope_id is now stripped from IPv6 addresses if given
- Optimized decoding labels from incoming packets

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-zeroconf_0.36.9.bb => python3-zeroconf_0.36.12.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-zeroconf_0.36.9.bb => python3-zeroconf_0.36.12.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.36.9.bb b/meta-python/recipes-devtools/python/python3-zeroconf_0.36.12.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-zeroconf_0.36.9.bb
rename to meta-python/recipes-devtools/python/python3-zeroconf_0.36.12.bb
index 8258ddd51..24af70eee 100644
--- a/meta-python/recipes-devtools/python/python3-zeroconf_0.36.9.bb
+++ b/meta-python/recipes-devtools/python/python3-zeroconf_0.36.12.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jstasiak/python-zeroconf"
 LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bb705b228ea4a14ea2728215b780d80"
 
-SRC_URI[sha256sum] = "023ebc58b765537edcb0395367b732e5271e2659760b1d5c6119aaacaeb7b390"
+SRC_URI[sha256sum] = "1f1994f550abfeda10a9d5924c7e5b463213ea5ca87198da751c74995f59e780"
 
 inherit pypi setuptools3
 
-- 
2.20.1


