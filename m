Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.34198.1611567045103021027
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Jan 2021 01:30:45 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=58296 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1l3yCm-0004I9-V5; Mon, 25 Jan 2021 11:30:42 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-pyjwt: Upgrade 2.0.0 -> 2.0.1
Date: Mon, 25 Jan 2021 11:30:34 +0200
Message-Id: <20210125093035.6177-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.0.1:

- Rename CHANGELOG.md to CHANGELOG.rst and include in docs
- Fix from_jwk() for all algorithms

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-pyjwt_2.0.0.bb => python3-pyjwt_2.0.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyjwt_2.0.0.bb => python3-pyjwt_2.0.1.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-pyjwt_2.0.0.bb b/meta-python/recipes-devtools/python/python3-pyjwt_2.0.1.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-pyjwt_2.0.0.bb
rename to meta-python/recipes-devtools/python/python3-pyjwt_2.0.1.bb
index aa6531ea3..ed52da4d4 100644
--- a/meta-python/recipes-devtools/python/python3-pyjwt_2.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyjwt_2.0.1.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "http://github.com/jpadilla/pyjwt"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=68626705a7b513ca8d5f44a3e200ed0c"
 
-SRC_URI[sha256sum] = "7a2b271c6dac2fda9e0c33d176c4253faba2c6c6b3a99c7f28a32c3c97522779"
+SRC_URI[sha256sum] = "a5c70a06e1f33d81ef25eecd50d50bd30e34de1ca8b2b9fa3fe0daaabcf69bf7"
 
 PYPI_PACKAGE = "PyJWT"
 inherit pypi setuptools3
-- 
2.17.1

