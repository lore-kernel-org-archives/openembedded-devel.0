Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.32170.1620655661074856238
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 May 2021 07:07:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=57184 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lg6ZM-000657-UF; Mon, 10 May 2021 17:07:40 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 04/10] python3-typing-extensions: Upgrade 3.7.4.3 -> 3.10.0.0
Date: Mon, 10 May 2021 17:07:16 +0300
Message-Id: <20210510140722.27201-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210510140722.27201-1-leon.anavi@konsulko.com>
References: <20210510140722.27201-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.10.0.0:

- Implement TypeGuard (PEP 649)
- backport ParamSpecArgs/Kwargs
- Fixed required/optional keys with old-style TypedDict
- Support PEP 612 in typing_extensions (Python 3)

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...nsions_3.7.4.3.bb => python3-typing-extensions_3.10.0.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-typing-extensions_3.7.4.3.bb => python3-typing-extensions_3.10.0.0.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-typing-extensions_3.7.4.3.bb b/meta-python/recipes-devtools/python/python3-typing-extensions_3.10.0.0.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python3-typing-extensions_3.7.4.3.bb
rename to meta-python/recipes-devtools/python/python3-typing-extensions_3.10.0.0.bb
index 8ef15fab79..a8e632487d 100644
--- a/meta-python/recipes-devtools/python/python3-typing-extensions_3.7.4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-typing-extensions_3.10.0.0.bb
@@ -5,8 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=64fc2b30b67d0a8423c250e0386ed72f"
 # The name on PyPi is slightly different.
 PYPI_PACKAGE = "typing_extensions"
 
-SRC_URI[md5sum] = "5fcbfcb22e6f8c9bf23fb9f8e020f6ee"
-SRC_URI[sha256sum] = "99d4073b617d30288f569d3f13d2bd7548c3a7e4c8de87db09a9d29bb3a4a60c"
+SRC_URI[sha256sum] = "50b6f157849174217d0656f99dc82fe932884fb250826c18350e159ec6cdf342"
 
 inherit pypi setuptools3
 
-- 
2.17.1

