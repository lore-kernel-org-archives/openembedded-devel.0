Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.43119.1598622707737719838
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Aug 2020 06:51:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=49752 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kBenA-0004K0-Ht; Fri, 28 Aug 2020 16:51:45 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-ecdsa: Upgrade 0.15 -> 0.16.0
Date: Fri, 28 Aug 2020 16:51:27 +0300
Message-Id: <20200828135131.26321-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.16.0:

- Support for reading and writing private keys in PKCS#8 format.
- to_pem and to_der now accept new parameter, format, to specify
  the format of the encoded files, either the dafault, legacy
  "ssleay", or the new pkcs8 to use PKCS#8. Note that only
  unencrypted PKCS#8 files are supported
- Add allow_truncate to verify in VerifyingKey, it defaults to
  True, when specified as False, use of large hashes smaller than
  curves will be disallowed (as it was in 0.14.1 and earlier)
- Correctly calculate signatures for private keys equal to n-1
- Make PointJacobi and thus SigningKey and VerifyingKey pickleable
- to_pem functions return bytes not str, document them as such
- from_pem and from_pem in SigningKey returns SigningKey, document
  them as such
- Ensure that version checks will work with Python 4.
- Format the source with black.
- Fix uses of assert_ in test suite.
- Use newer Ubuntu in Travis to test against OpenSSL 1.1.1 (and
  thus test the interoperability of ECDH code in Travis).

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-ecdsa_0.15.bb => python3-ecdsa_0.16.0.bb}  | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ecdsa_0.15.bb => python3-ecdsa_0.16.0.bb} (69%)

diff --git a/meta-python/recipes-devtools/python/python3-ecdsa_0.15.bb b/meta-python/recipes-devtools/python/python3-ecdsa_0.16.0.bb
similarity index 69%
rename from meta-python/recipes-devtools/python/python3-ecdsa_0.15.bb
rename to meta-python/recipes-devtools/python/python3-ecdsa_0.16.0.bb
index aba62f3ef..36bb246fd 100644
--- a/meta-python/recipes-devtools/python/python3-ecdsa_0.15.bb
+++ b/meta-python/recipes-devtools/python/python3-ecdsa_0.16.0.bb
@@ -6,7 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=66ffc5e30f76cbb5358fe54b645e5a1d"
 DEPENDS += "python3-pip python3-pbr"
 
 PYPI_PACKAGE = "ecdsa"
-SRC_URI[sha256sum] = "8f12ac317f8a1318efa75757ef0a651abe12e51fc1af8838fb91079445227277"
+SRC_URI[md5sum] = "d593df1ab57da611dca76f7328c47b21"
+SRC_URI[sha256sum] = "494c6a853e9ed2e9be33d160b41d47afc50a6629b993d2b9c5ad7bb226add892"
 
 inherit pypi setuptools3
 
-- 
2.17.1

