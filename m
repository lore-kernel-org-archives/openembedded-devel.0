Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.197021.1598280617866028517
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Aug 2020 07:50:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=39680 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kADnd-0006gX-0G; Mon, 24 Aug 2020 17:50:17 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/7] python3-typing-extensions: Upgrade 3.7.4.2 -> 3.7.4.3
Date: Mon, 24 Aug 2020 17:50:02 +0300
Message-Id: <20200824145004.12568-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200824145004.12568-1-leon.anavi@konsulko.com>
References: <20200824145004.12568-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.7.4.3:

- Add SupportsIndex, added in Python 3.8
- Make tests for Annotated work with Python 3.9
- Add PEP 613 TypeAlias to typing_extensions
- Add tox.ini for typing_extensions
- Remove extra 'use' in readme

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...nsions_3.7.4.2.bb => python3-typing-extensions_3.7.4.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-typing-extensions_3.7.4.2.bb => python3-typing-extensions_3.7.4.3.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-typing-extensions_3.7.4.2.bb b/meta-python/recipes-devtools/python/python3-typing-extensions_3.7.4.3.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python3-typing-extensions_3.7.4.2.bb
rename to meta-python/recipes-devtools/python/python3-typing-extensions_3.7.4.3.bb
index 51e9eda2e..8ef15fab7 100644
--- a/meta-python/recipes-devtools/python/python3-typing-extensions_3.7.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-typing-extensions_3.7.4.3.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=64fc2b30b67d0a8423c250e0386ed72f"
 # The name on PyPi is slightly different.
 PYPI_PACKAGE = "typing_extensions"
 
-SRC_URI[md5sum] = "f2674282966dc088d10170c2347431cc"
-SRC_URI[sha256sum] = "79ee589a3caca649a9bfd2a8de4709837400dfa00b6cc81962a1e6a1815969ae"
+SRC_URI[md5sum] = "5fcbfcb22e6f8c9bf23fb9f8e020f6ee"
+SRC_URI[sha256sum] = "99d4073b617d30288f569d3f13d2bd7548c3a7e4c8de87db09a9d29bb3a4a60c"
 
 inherit pypi setuptools3
 
-- 
2.17.1

