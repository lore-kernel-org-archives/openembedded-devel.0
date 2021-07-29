Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.8052.1627557928558659554
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Jul 2021 04:25:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=41638 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1m94AH-0000JQ-BI; Thu, 29 Jul 2021 14:25:26 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-pysonos: Upgrade 0.0.53 -> 0.0.54
Date: Thu, 29 Jul 2021 14:25:17 +0300
Message-Id: <20210729112518.26031-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210729112518.26031-1-leon.anavi@konsulko.com>
References: <20210729112518.26031-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.0.54:

- Raise exception if Service command is not supported

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pysonos_0.0.53.bb => python3-pysonos_0.0.54.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pysonos_0.0.53.bb => python3-pysonos_0.0.54.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-pysonos_0.0.53.bb b/meta-python/recipes-devtools/python/python3-pysonos_0.0.54.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-pysonos_0.0.53.bb
rename to meta-python/recipes-devtools/python/python3-pysonos_0.0.54.bb
index dc7f676657..220393c550 100644
--- a/meta-python/recipes-devtools/python/python3-pysonos_0.0.53.bb
+++ b/meta-python/recipes-devtools/python/python3-pysonos_0.0.54.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=07b0e2ca9ac77cd65cd4edf2e13367ea"
 
-SRC_URI[sha256sum] = "e24ea33f4ab810ff5e698d5e577d382413a2994565439ebc67fb42614f899e93"
+SRC_URI[sha256sum] = "2a72897cfd342382573632d80d38776884a38c8d02353d9d5da4e9e8e83cb42b"
 
 inherit pypi setuptools3
 
-- 
2.17.1

