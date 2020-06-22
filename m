Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.14346.1592822167774155077
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jun 2020 03:36:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=43452 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jnJo4-0005ty-Hu; Mon, 22 Jun 2020 13:36:06 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 04/10] python3-pyrsistent: Upgrade 0.15.7 -> 0.16.0
Date: Mon, 22 Jun 2020 13:35:36 +0300
Message-Id: <20200622103542.27830-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200622103542.27830-1-leon.anavi@konsulko.com>
References: <20200622103542.27830-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.16.0:

- No major updates but Python 2 support no longer guaranteed.
- Fix #192, 'ignore_extra' for 'pvector_field'.
- Fix #191, include LICENCE in distribution.
- Fix #190, minor MyPy errors.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-pyrsistent_0.15.7.bb => python3-pyrsistent_0.16.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyrsistent_0.15.7.bb => python3-pyrsistent_0.16.0.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-pyrsistent_0.15.7.bb b/meta-python/recipes-devtools/python/python3-pyrsistent_0.16.0.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-pyrsistent_0.15.7.bb
rename to meta-python/recipes-devtools/python/python3-pyrsistent_0.16.0.bb
index 53251aa55..dec661143 100644
--- a/meta-python/recipes-devtools/python/python3-pyrsistent_0.15.7.bb
+++ b/meta-python/recipes-devtools/python/python3-pyrsistent_0.16.0.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/tobgu/pyrsistent"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE.mit;md5=ca574f2891cf528b3e7a2ee570337e7c"
 
-SRC_URI[md5sum] = "da9486d00ef5b213f40d5cf3c5bca82d"
-SRC_URI[sha256sum] = "cdc7b5e3ed77bed61270a47d35434a30617b9becdf2478af76ad2c6ade307280"
+SRC_URI[md5sum] = "4ba30da6f0a63554e70ac6c4c1904929"
+SRC_URI[sha256sum] = "28669905fe725965daa16184933676547c5bb40a5153055a8dee2a4bd7933ad3"
 
 inherit pypi setuptools3
 
-- 
2.17.1

