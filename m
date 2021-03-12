Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.446.1615566376769515965
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Mar 2021 08:26:17 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=36668 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lKkc7-0007yZ-T2; Fri, 12 Mar 2021 18:26:15 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-pako: Upgrade 0.3.0 -> 0.3.1
Date: Fri, 12 Mar 2021 18:25:57 +0200
Message-Id: <20210312162600.8335-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210312162600.8335-1-leon.anavi@konsulko.com>
References: <20210312162600.8335-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-0.5
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Upgrade to release 0.3.1:

- Adds an optional no-confirm flag particularly for use in
  non-interactive setups.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-pako_0.3.0.bb => python3-pako_0.3.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pako_0.3.0.bb => python3-pako_0.3.1.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-pako_0.3.0.bb b/meta-python/recipes-devtools/python/python3-pako_0.3.1.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-pako_0.3.0.bb
rename to meta-python/recipes-devtools/python/python3-pako_0.3.1.bb
index 3eacd0bdd..1930d866e 100644
--- a/meta-python/recipes-devtools/python/python3-pako_0.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pako_0.3.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/MycroftAI/pako"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e23fadd6ceef8c618fc1c65191d846fa"
 
-SRC_URI[sha256sum] = "eabd1c121d6701069d1a10132f197ee2b5f4e75a3d68a93b07f69214ab0ff9c7"
+SRC_URI[sha256sum] = "c033a073bb818ca336ae1fccba2655bd60dfe77744f85d4517abd3160d72231f"
 
 inherit pypi setuptools3
 
-- 
2.17.1

