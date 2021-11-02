Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C67CC433EF
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 15:46:30 +0000 (UTC)
Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.1579.1635867988816143393
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Nov 2021 08:46:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 spf.securedserverspace.com}: parse error
 for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded
 (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=53954 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1mhvzR-00031A-GA; Tue, 02 Nov 2021 17:46:22 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH] python3-bidict: Upgrade 0.21.2 -> 0.21.4
Date: Tue,  2 Nov 2021 17:46:18 +0200
Message-Id: <20211102154618.27517-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
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
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Nov 2021 15:46:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93780

Upgrade to release 0.21.4:

- Explicitly declare support for Python 3.10 as well as some minor
  internal improvements.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-bidict_0.21.2.bb => python3-bidict_0.21.4.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bidict_0.21.2.bb => python3-bidict_0.21.4.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-bidict_0.21.2.bb b/meta-python/recipes-devtools/python/python3-bidict_0.21.4.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-bidict_0.21.2.bb
rename to meta-python/recipes-devtools/python/python3-bidict_0.21.4.bb
index 237bd2a63..266dc606a 100644
--- a/meta-python/recipes-devtools/python/python3-bidict_0.21.2.bb
+++ b/meta-python/recipes-devtools/python/python3-bidict_0.21.4.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://bidict.readthedocs.io/"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9741c346eef56131163e13b9db1241b3"
 
-SRC_URI[sha256sum] = "4fa46f7ff96dc244abfc437383d987404ae861df797e2fd5b190e233c302be09"
+SRC_URI[sha256sum] = "42c84ffbe6f8de898af6073b4be9ea7ccedcd78d3474aa844c54e49d5a079f6f"
 
 inherit pypi setuptools3
 
-- 
2.17.1


