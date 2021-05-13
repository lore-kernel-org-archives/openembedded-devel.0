Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.13114.1620912240981028560
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 May 2021 06:24:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=44224 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lhBJm-0004kU-38; Thu, 13 May 2021 16:24:00 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 09/10] python3-rfc3339-validator: Upgrade 0.1.3 -> 0.1.4
Date: Thu, 13 May 2021 16:23:31 +0300
Message-Id: <20210513132332.3745-9-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210513132332.3745-1-leon.anavi@konsulko.com>
References: <20210513132332.3745-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.1.4:

- Fix test failure on darwin

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...39-validator_0.1.3.bb => python3-rfc3339-validator_0.1.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-rfc3339-validator_0.1.3.bb => python3-rfc3339-validator_0.1.4.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-rfc3339-validator_0.1.3.bb b/meta-python/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-rfc3339-validator_0.1.3.bb
rename to meta-python/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb
index a07a094479..f1064f327d 100644
--- a/meta-python/recipes-devtools/python/python3-rfc3339-validator_0.1.3.bb
+++ b/meta-python/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a21b13b5a996f08f7e0b088aa38ce9c6"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/python-rfc3339-validator:"
 
-SRC_URI[sha256sum] = "7a578aa0740e9ee2b48356fe1f347139190c4c72e27f303b3617054efd15df32"
+SRC_URI[sha256sum] = "138a2abdf93304ad60530167e51d2dfb9549521a836871b88d7f4695d0022f6b"
 
 PYPI_PACKAGE = "rfc3339_validator"
 
-- 
2.17.1

