Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.18990.1597250634451273156
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Aug 2020 09:43:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=55224 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k5tqw-0000d2-BP; Wed, 12 Aug 2020 19:43:51 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-pytest-timeout: Upgrade 1.4.1 -> 1.4.2
Date: Wed, 12 Aug 2020 19:43:31 +0300
Message-Id: <20200812164335.24599-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
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

Upgrade to release 1.4.2:

- Fix compatibility when run with pytest pre-releases
- Fix detection of third-party debuggers

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ytest-timeout_1.4.1.bb => python3-pytest-timeout_1.4.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-timeout_1.4.1.bb => python3-pytest-timeout_1.4.2.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-timeout_1.4.1.bb b/meta-python/recipes-devtools/python/python3-pytest-timeout_1.4.2.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python3-pytest-timeout_1.4.1.bb
rename to meta-python/recipes-devtools/python/python3-pytest-timeout_1.4.2.bb
index 506f4c065..906d67064 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-timeout_1.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-timeout_1.4.2.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d8048cd156eda3df2e7f111b0ae9ceff"
 
 PYPI_PACKAGE = "pytest-timeout"
 
-SRC_URI[md5sum] = "c458dd7d417a5f2dbae0f1f6073845f7"
-SRC_URI[sha256sum] = "6d0fb4ce74cebb81be252e4e0d9c2a91f30270b33208cfa0f1da6eed9abf18ac"
+SRC_URI[md5sum] = "552cc293447b00f7a294ce7a1fb3839f"
+SRC_URI[sha256sum] = "20b3113cf6e4e80ce2d403b6fb56e9e1b871b510259206d40ff8d609f48bda76"
 
 inherit pypi setuptools3
 
-- 
2.17.1

