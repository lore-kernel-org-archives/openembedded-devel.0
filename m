Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.13607.1610475846910903090
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Jan 2021 10:24:07 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=47040 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kzOKq-0007kQ-55; Tue, 12 Jan 2021 20:24:06 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-pyjwt: Upgrade 1.7.1 -> 2.0.0
Date: Tue, 12 Jan 2021 20:23:54 +0200
Message-Id: <20210112182354.15359-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112182354.15359-1-leon.anavi@konsulko.com>
References: <20210112182354.15359-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.0.0:

- Drop support for Python 2 and Python 3.0-3.5
- Drop support for PyCrypto and ECDSA
- Improve typings
- Introduce better experience for JWKs
- Support for JWKs containing ECDSA keys
- Add support for Ed25519 / EdDSA

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-pyjwt_1.7.1.bb => python3-pyjwt_2.0.0.bb}  | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyjwt_1.7.1.bb => python3-pyjwt_2.0.0.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-pyjwt_1.7.1.bb b/meta-python/recipes-devtools/python/python3-pyjwt_2.0.0.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-pyjwt_1.7.1.bb
rename to meta-python/recipes-devtools/python/python3-pyjwt_2.0.0.bb
index d2f7be46c..aa6531ea3 100644
--- a/meta-python/recipes-devtools/python/python3-pyjwt_1.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyjwt_2.0.0.bb
@@ -5,8 +5,7 @@ HOMEPAGE = "http://github.com/jpadilla/pyjwt"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=68626705a7b513ca8d5f44a3e200ed0c"
 
-SRC_URI[md5sum] = "a4712f980c008696e13e09504120b2a0"
-SRC_URI[sha256sum] = "8d59a976fb773f3e6a39c85636357c4f0e242707394cadadd9814f5cbaa20e96"
+SRC_URI[sha256sum] = "7a2b271c6dac2fda9e0c33d176c4253faba2c6c6b3a99c7f28a32c3c97522779"
 
 PYPI_PACKAGE = "PyJWT"
 inherit pypi setuptools3
-- 
2.17.1

