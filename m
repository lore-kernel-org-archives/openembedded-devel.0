Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.6649.1622121606412746820
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 May 2021 06:20:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=56734 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lmFvf-0003sv-LK; Thu, 27 May 2021 16:20:06 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/6] python3-pysonos: Upgrade 0.0.49 -> 0.0.50
Date: Thu, 27 May 2021 16:19:48 +0300
Message-Id: <20210527131952.20082-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210527131952.20082-1-leon.anavi@konsulko.com>
References: <20210527131952.20082-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.0.50:

- Add ShareLink plugin
- Revert some fixes
- Merge current SoCo master

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pysonos_0.0.49.bb => python3-pysonos_0.0.50.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pysonos_0.0.49.bb => python3-pysonos_0.0.50.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-pysonos_0.0.49.bb b/meta-python/recipes-devtools/python/python3-pysonos_0.0.50.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-pysonos_0.0.49.bb
rename to meta-python/recipes-devtools/python/python3-pysonos_0.0.50.bb
index 77ea6c08c..cfa0d6ef0 100644
--- a/meta-python/recipes-devtools/python/python3-pysonos_0.0.49.bb
+++ b/meta-python/recipes-devtools/python/python3-pysonos_0.0.50.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=07b0e2ca9ac77cd65cd4edf2e13367ea"
 
-SRC_URI[sha256sum] = "77b8987ddbc69ea5c28ec1dee09cd6c30267e196521b1847e43cdea77bce4f09"
+SRC_URI[sha256sum] = "15a583b819c1e758cca72d5e148d59dd3bf7c9d59f19b5e79ab38c743c3e0738"
 
 inherit pypi setuptools3
 
-- 
2.17.1

