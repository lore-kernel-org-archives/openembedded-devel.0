Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1FCAC433EF
	for <webhook@archiver.kernel.org>; Wed,  3 Nov 2021 12:12:07 +0000 (UTC)
Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.6536.1635941526658661715
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Nov 2021 05:12:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 spf.securedserverspace.com}: parse error
 for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded
 (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=42766 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1miF7a-0005MY-3D; Wed, 03 Nov 2021 14:12:03 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-aenum: Upgrade 3.1.0 -> 3.1.2
Date: Wed,  3 Nov 2021 14:11:50 +0200
Message-Id: <20211103121150.28596-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211103121150.28596-1-leon.anavi@konsulko.com>
References: <20211103121150.28596-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Nov 2021 12:12:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93806

Upgrade to release 3.1.2:

- fix extend_enum()
- tests: move enum setting from body to header

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-aenum_3.1.0.bb => python3-aenum_3.1.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aenum_3.1.0.bb => python3-aenum_3.1.2.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-aenum_3.1.0.bb b/meta-python/recipes-devtools/python/python3-aenum_3.1.2.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-aenum_3.1.0.bb
rename to meta-python/recipes-devtools/python/python3-aenum_3.1.2.bb
index 999fd5a3d1..ce58c5ef49 100644
--- a/meta-python/recipes-devtools/python/python3-aenum_3.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-aenum_3.1.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/aenum/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://aenum/LICENSE;md5=c6a85477543f8b8591b9c1f82abebbe9"
 
-SRC_URI[sha256sum] = "87f0e9ef4f828578ab06af30e4d7944043bf4ecd3f4b7bd1cbe37e2173cde94a"
+SRC_URI[sha256sum] = "806dd4791298e19daff2cdfe7be3ae6d931d0d03097973f802b3ea55066f62dd"
 
 inherit pypi setuptools3
 
-- 
2.17.1


