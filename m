Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.11230.1614093751302499405
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Feb 2021 07:22:31 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=56178 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lEZW6-00022z-AO; Tue, 23 Feb 2021 17:22:30 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 03/10] python3-mypy: Upgrade 0.800 -> 0.812
Date: Tue, 23 Feb 2021 17:22:12 +0200
Message-Id: <20210223152219.32129-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210223152219.32129-1-leon.anavi@konsulko.com>
References: <20210223152219.32129-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.812:

- Improved source file finding
- Excluding paths

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-mypy_0.800.bb => python3-mypy_0.812.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-mypy_0.800.bb => python3-mypy_0.812.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-mypy_0.800.bb b/meta-python/recipes-devtools/python/python3-mypy_0.812.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-mypy_0.800.bb
rename to meta-python/recipes-devtools/python/python3-mypy_0.812.bb
index 0d019dfe1a..8faab60b97 100644
--- a/meta-python/recipes-devtools/python/python3-mypy_0.800.bb
+++ b/meta-python/recipes-devtools/python/python3-mypy_0.812.bb
@@ -13,6 +13,6 @@ PYPI_PACKAGE = "mypy"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "e0202e37756ed09daf4b0ba64ad2c245d357659e014c3f51d8cd0681ba66940a"
+SRC_URI[sha256sum] = "cd07039aa5df222037005b08fbbfd69b3ab0b0bd7a07d7906de75ae52c4e3119"
 
 BBCLASSEXTEND = "native"
-- 
2.17.1

