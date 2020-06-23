Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.3723.1592905913695306558
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Jun 2020 02:51:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=35806 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jnfaq-0006Iq-6c; Tue, 23 Jun 2020 12:51:52 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 07/11] python3-pytest-timeout: Upgrade 1.3.4 -> 1.4.1
Date: Tue, 23 Jun 2020 12:51:32 +0300
Message-Id: <20200623095136.24854-7-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200623095136.24854-1-leon.anavi@konsulko.com>
References: <20200623095136.24854-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=0.0
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

Upgrade to release 1.4.1:

- Fix coverage compatibility which was broken by 1.4.0.
- Better detection of when we are debugging.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ytest-timeout_1.3.4.bb => python3-pytest-timeout_1.4.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-timeout_1.3.4.bb => python3-pytest-timeout_1.4.1.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-timeout_1.3.4.bb b/meta-python/recipes-devtools/python/python3-pytest-timeout_1.4.1.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python3-pytest-timeout_1.3.4.bb
rename to meta-python/recipes-devtools/python/python3-pytest-timeout_1.4.1.bb
index a359969ed..506f4c065 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-timeout_1.3.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-timeout_1.4.1.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d8048cd156eda3df2e7f111b0ae9ceff"
 
 PYPI_PACKAGE = "pytest-timeout"
 
-SRC_URI[md5sum] = "1594762ae77ed7c6c2727aa8b4aa8bfb"
-SRC_URI[sha256sum] = "80faa19cd245a42b87a51699d640c00d937c02b749052bfca6bae8bdbe12c48e"
+SRC_URI[md5sum] = "c458dd7d417a5f2dbae0f1f6073845f7"
+SRC_URI[sha256sum] = "6d0fb4ce74cebb81be252e4e0d9c2a91f30270b33208cfa0f1da6eed9abf18ac"
 
 inherit pypi setuptools3
 
-- 
2.17.1

