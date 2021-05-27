Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.6705.1622121620247319902
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 May 2021 06:20:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=56734 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lmFvt-0003sv-NF; Thu, 27 May 2021 16:20:19 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/6] python3-urllib3: Upgrade 1.26.4 -> 1.26.5
Date: Thu, 27 May 2021 16:19:51 +0300
Message-Id: <20210527131952.20082-5-leon.anavi@konsulko.com>
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

Upgrade to release 1.26.5:

- Fixed deprecation warnings emitted in Python 3.10.
- Updated vendored six library to 1.16.0.
- Improved performance of URL parser when splitting the authority
  component.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-urllib3_1.26.4.bb => python3-urllib3_1.26.5.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-urllib3_1.26.4.bb => python3-urllib3_1.26.5.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-urllib3_1.26.4.bb b/meta-python/recipes-devtools/python/python3-urllib3_1.26.5.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-urllib3_1.26.4.bb
rename to meta-python/recipes-devtools/python/python3-urllib3_1.26.5.bb
index 0a31fb1e2..f2fb33c6d 100644
--- a/meta-python/recipes-devtools/python/python3-urllib3_1.26.4.bb
+++ b/meta-python/recipes-devtools/python/python3-urllib3_1.26.5.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/shazow/urllib3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c2823cb995439c984fd62a973d79815c"
 
-SRC_URI[sha256sum] = "e7b021f7241115872f92f43c6508082facffbd1c048e3c6e2bb9c2a157e28937"
+SRC_URI[sha256sum] = "a7acd0977125325f516bda9735fa7142b909a8d01e8b2e4c8108d0984e6e0098"
 
 inherit pypi setuptools3
 
-- 
2.17.1

