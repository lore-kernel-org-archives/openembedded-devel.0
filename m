Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A335EC433F5
	for <webhook@archiver.kernel.org>; Wed,  3 Nov 2021 12:12:06 +0000 (UTC)
Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.6535.1635941525636075687
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Nov 2021 05:12:06 -0700
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
	id 1miF7W-0005MY-20; Wed, 03 Nov 2021 14:12:02 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-isort: Upgrade 5.9.3 -> 5.10.0
Date: Wed,  3 Nov 2021 14:11:49 +0200
Message-Id: <20211103121150.28596-4-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Nov 2021 12:12:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93805

Upgrade to release 5.10.0:

- Switch to tomli for pyproject.toml configuration loader.
- CLI bug (--exend-skip-glob, overrides instead of extending).
- respect PATH customization in nested calls to git.
- Append only with certain code snippets incorrectly adds imports.
- Added official support for Python 3.10

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-isort_5.9.3.bb => python3-isort_5.10.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-isort_5.9.3.bb => python3-isort_5.10.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-isort_5.9.3.bb b/meta-python/recipes-devtools/python/python3-isort_5.10.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-isort_5.9.3.bb
rename to meta-python/recipes-devtools/python/python3-isort_5.10.0.bb
index 44a51db28f..2eae82026c 100644
--- a/meta-python/recipes-devtools/python/python3-isort_5.9.3.bb
+++ b/meta-python/recipes-devtools/python/python3-isort_5.10.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=8227180126797a0148f94f483f3e1489"
 
-SRC_URI[sha256sum] = "9c2ea1e62d871267b78307fe511c0838ba0da28698c5732d54e2790bf3ba9899"
+SRC_URI[sha256sum] = "e52ff6d38012b131628cf0f26c51e7bd3a7c81592eefe3ac71411e692f1b9345"
 
 inherit pypi setuptools3
 
-- 
2.17.1


