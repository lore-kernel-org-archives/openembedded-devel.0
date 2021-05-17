Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.17408.1621249900464009776
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 May 2021 04:11:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=33204 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lib9u-0007uL-RM; Mon, 17 May 2021 14:11:39 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-pyjwt: Upgrade 2.0.1 -> 2.1.0
Date: Mon, 17 May 2021 14:11:27 +0300
Message-Id: <20210517111129.11619-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210517111129.11619-1-leon.anavi@konsulko.com>
References: <20210517111129.11619-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.1.0:

- Allow claims validation without making JWT signature validation
  mandatory
- Remove padding from JWK test data
- Make kty mandatory in JWK to be compliant with RFC7517
- Allow JWK without alg to be compliant with RFC7517
- Allow to verify with private key on ECAlgorithm, as well as on
  Ed25519Algorithm
- Add caching by default to PyJWKClient
- Add missing exceptions.InvalidKeyError to jwt module __init__
  imports
- Add support for ES256K algorithm
- Add from_jwk() to Ed25519Algorithm
- Add to_jwk() to Ed25519Algorithm
- Export PyJWK and PyJWKSet

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-pyjwt_2.0.1.bb => python3-pyjwt_2.1.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyjwt_2.0.1.bb => python3-pyjwt_2.1.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-pyjwt_2.0.1.bb b/meta-python/recipes-devtools/python/python3-pyjwt_2.1.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-pyjwt_2.0.1.bb
rename to meta-python/recipes-devtools/python/python3-pyjwt_2.1.0.bb
index ed52da4d4a..f1486f4773 100644
--- a/meta-python/recipes-devtools/python/python3-pyjwt_2.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyjwt_2.1.0.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "http://github.com/jpadilla/pyjwt"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=68626705a7b513ca8d5f44a3e200ed0c"
 
-SRC_URI[sha256sum] = "a5c70a06e1f33d81ef25eecd50d50bd30e34de1ca8b2b9fa3fe0daaabcf69bf7"
+SRC_URI[sha256sum] = "fba44e7898bbca160a2b2b501f492824fc8382485d3a6f11ba5d0c1937ce6130"
 
 PYPI_PACKAGE = "PyJWT"
 inherit pypi setuptools3
-- 
2.17.1

