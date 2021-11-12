Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE2BAC433F5
	for <webhook@archiver.kernel.org>; Fri, 12 Nov 2021 19:05:59 +0000 (UTC)
Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.232.1636743959090240510
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Nov 2021 11:05:59 -0800
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
	id 1mlbs0-0006tw-Rg; Fri, 12 Nov 2021 21:05:53 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/6] python3-yarl: Upgrade 1.7.0 -> 1.7.2
Date: Fri, 12 Nov 2021 21:05:44 +0200
Message-Id: <20211112190547.4560-3-leon.anavi@konsulko.com>
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
 https://lists.openembedded.org/g/openembedded-devel/message/93920

Upgrade to release 1.7.2:

- Changed call in with_port() to stop reencoding parts of the URL
  that were already encoded.
- Fix 1.7.0 build error

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-yarl_1.7.0.bb => python3-yarl_1.7.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-yarl_1.7.0.bb => python3-yarl_1.7.2.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-yarl_1.7.0.bb b/meta-python/recipes-devtools/python/python3-yarl_1.7.2.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-yarl_1.7.0.bb
rename to meta-python/recipes-devtools/python/python3-yarl_1.7.2.bb
index acb4b4ac2..0867d1cb5 100644
--- a/meta-python/recipes-devtools/python/python3-yarl_1.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-yarl_1.7.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/aio-libs/yarl/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e581798a7b985311f29fa3e163ea27ae"
 
-SRC_URI[sha256sum] = "8e7ebaf62e19c2feb097ffb7c94deb0f0c9fab52590784c8cd679d30ab009162"
+SRC_URI[sha256sum] = "45399b46d60c253327a460e99856752009fcee5f5d3c80b2f7c0cae1c38d56dd"
 
 SRC_URI += "file://run-ptest"
 
-- 
2.20.1


