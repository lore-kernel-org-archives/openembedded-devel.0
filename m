Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.6816.1622200151858718565
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 May 2021 04:09:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=57792 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lmaMO-0001Il-Gr; Fri, 28 May 2021 14:09:01 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-ecdsa: Upgrade 0.16.1 -> 0.17.0
Date: Fri, 28 May 2021 14:08:47 +0300
Message-Id: <20210528110850.22402-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210528110850.22402-1-leon.anavi@konsulko.com>
References: <20210528110850.22402-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.17.0:

- Keys that use explicit curve parameters can now be read and
  written. Reading of explicit curves can be disabled by using
  the valid_curve_encodings keyword argument in
  VerifyingKey.from_pem(), VerifyingKey.from_der(),
  SigningKey.from_pem(), and SigningKey.from_der().
- Keys can now be written with use of explicit curve parameters,
  use curve_parameters_encoding keyword argument of
  VerifyingKey.to_pem(), VerifyingKey.to_der(),
  SigningKey.to_pem(), or SigningKey.to_der() to specify the
  format. By default named_curve will be used, unless the curve
  doesn't have an associated OID (as will be the case for an
  unsupported curve), then explicit encoding will be used.
- Allow specifying acceptable point formats when loading public
  keys (this also fixes a minor bug where python-ecdsa would
  accept raw encoding for points in PKCS#8 files). Set of accepted
  encodings is controlled by valid_encodings keyword argument in
  ECDH.load_received_public_key_bytes(),
  VerifyingKey.from_string(), VerifyingKey.from_pem(),
  VerifyingKey.from_der().
- PointJacobi and Point now inherit from AbstractPoint that
  implements the methods for parsing points. That added
  from_bytes() and to_bytes() methods to both of them.
- Curve parameters can now be read and written to PEM and DER
  files. The Curve class supports new to_der(), from_der(),
  to_pem(), and from_pem() methods.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-ecdsa_0.16.1.bb => python3-ecdsa_0.17.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ecdsa_0.16.1.bb => python3-ecdsa_0.17.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-ecdsa_0.16.1.bb b/meta-python/recipes-devtools/python/python3-ecdsa_0.17.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-ecdsa_0.16.1.bb
rename to meta-python/recipes-devtools/python/python3-ecdsa_0.17.0.bb
index 819d41e86..1401f8e58 100644
--- a/meta-python/recipes-devtools/python/python3-ecdsa_0.16.1.bb
+++ b/meta-python/recipes-devtools/python/python3-ecdsa_0.17.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=66ffc5e30f76cbb5358fe54b645e5a1d"
 DEPENDS += "python3-pip python3-pbr"
 
 PYPI_PACKAGE = "ecdsa"
-SRC_URI[sha256sum] = "cfc046a2ddd425adbd1a78b3c46f0d1325c657811c0f45ecc3a0a6236c1e50ff"
+SRC_URI[sha256sum] = "b9f500bb439e4153d0330610f5d26baaf18d17b8ced1bc54410d189385ea68aa"
 
 inherit pypi setuptools3
 
-- 
2.17.1

