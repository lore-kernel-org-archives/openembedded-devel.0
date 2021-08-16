Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.24715.1629123164368860905
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Aug 2021 07:12:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=57306 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1mFdLy-0005El-GS; Mon, 16 Aug 2021 17:12:43 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-ujson: Upgrade 4.0.2 -> 4.1.0
Date: Mon, 16 Aug 2021 17:12:30 +0300
Message-Id: <20210816141231.13824-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210816141231.13824-1-leon.anavi@konsulko.com>
References: <20210816141231.13824-1-leon.anavi@konsulko.com>
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

Upgrade to release 4.1.0:

- Add gcov coverage testing for C code
- Test Python 3.10-dev
- Remove explicit handling of manylinux platform tag
- Remove unused variable
- dconv no longer uses global instances of StringToDoubleConverter
- Switch shebang for the manylinux-wheels script
- Fix typos in error message

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-ujson_4.0.2.bb => python3-ujson_4.1.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ujson_4.0.2.bb => python3-ujson_4.1.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-ujson_4.0.2.bb b/meta-python/recipes-devtools/python/python3-ujson_4.1.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-ujson_4.0.2.bb
rename to meta-python/recipes-devtools/python/python3-ujson_4.1.0.bb
index 096b5722af..d8e83c58a1 100644
--- a/meta-python/recipes-devtools/python/python3-ujson_4.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-ujson_4.1.0.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "UltraJSON is an ultra fast JSON encoder and decoder written in pu
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=10fa10456417c0252bcb8a498e498ffe"
 
-SRC_URI[sha256sum] = "c615a9e9e378a7383b756b7e7a73c38b22aeb8967a8bfbffd4741f7ffd043c4d"
+SRC_URI[sha256sum] = "22b63ec4409f0d2f2c4c9d5aa331997e02470b7a15a3233f3cc32f2f9b92d58c"
 
 inherit pypi ptest setuptools3
 
-- 
2.17.1

