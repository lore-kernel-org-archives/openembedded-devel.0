Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 252E0C4332F
	for <webhook@archiver.kernel.org>; Fri, 12 Nov 2021 19:05:59 +0000 (UTC)
Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.205.1636743957277140662
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Nov 2021 11:05:57 -0800
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
	id 1mlbry-0006tw-O4; Fri, 12 Nov 2021 21:05:51 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/6] python3-pydicti: Upgrade 1.1.4 -> 1.1.6
Date: Fri, 12 Nov 2021 21:05:42 +0200
Message-Id: <20211112190547.4560-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.20.1
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
 https://lists.openembedded.org/g/openembedded-devel/message/93918

Upgrade to release 1.1.6:

- Update the badges on the landing page
- Maintenance release for testing automatic releases using GitHub
  Actions

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pydicti_1.1.4.bb => python3-pydicti_1.1.6.bb}     | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pydicti_1.1.4.bb => python3-pydicti_1.1.6.bb} (60%)

diff --git a/meta-python/recipes-devtools/python/python3-pydicti_1.1.4.bb b/meta-python/recipes-devtools/python/python3-pydicti_1.1.6.bb
similarity index 60%
rename from meta-python/recipes-devtools/python/python3-pydicti_1.1.4.bb
rename to meta-python/recipes-devtools/python/python3-pydicti_1.1.6.bb
index 29ad30e0f..17c52881e 100644
--- a/meta-python/recipes-devtools/python/python3-pydicti_1.1.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pydicti_1.1.6.bb
@@ -3,7 +3,6 @@ HOMEPAGE = "https://github.com/coldfix/pydicti"
 LICENSE = "WTFPL"
 LIC_FILES_CHKSUM = "file://COPYING;md5=389a9e29629d1f05e115f8f05c283df5"
 
-SRC_URI[md5sum] = "c8925e333a78766cb469c1626880bd35"
-SRC_URI[sha256sum] = "dcea4d1892fc68ca62aba835b1ed444a1eb48bd0cca0b4599efd45cbb6272b5c"
+SRC_URI[sha256sum] = "32eb329de2023c92158ac6c2d67837adf96195f188ba8d768b3248a0218b5a65"
 
 inherit pypi setuptools3
-- 
2.20.1


