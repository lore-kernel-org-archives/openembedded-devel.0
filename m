Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.11377.1603713176193849805
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Oct 2020 04:52:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=55384 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kX13X-0000PS-3K; Mon, 26 Oct 2020 13:52:55 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCHv2] python3-cryptography-vectors: Upgrade 3.1.1 -> 3.2
Date: Mon, 26 Oct 2020 13:52:47 +0200
Message-Id: <20201026115247.11902-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.2:

- SECURITY ISSUE: Attempted to make RSA PKCS#1v1.5 decryption more
  constant time, to protect against Bleichenbacher vulnerabilities.
  Due to limitations imposed by our API, we cannot completely
  mitigate this vulnerability and a future release will contain a
  new API which is designed to be resilient to these for contexts
  where it is required. Credit to Hubert Kario for reporting the
  issue. CVE-2020-25659
- Support for OpenSSL 1.0.2 has been removed. Users on older
  version of OpenSSL will need to upgrade.
- Added basic support for PKCS7 signing (including SMIME) via
  :class:`~cryptography.hazmat.primitives.serialization.pkcs7.PKCS7SignatureBuilder`.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...y-vectors_3.1.1.bb => python3-cryptography-vectors_3.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cryptography-vectors_3.1.1.bb => python3-cryptography-vectors_3.2.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-cryptography-vectors_3.1.1.bb b/meta-python/recipes-devtools/python/python3-cryptography-vectors_3.2.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-cryptography-vectors_3.1.1.bb
rename to meta-python/recipes-devtools/python/python3-cryptography-vectors_3.2.bb
index 9486fe2350..2e7ed81696 100644
--- a/meta-python/recipes-devtools/python/python3-cryptography-vectors_3.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cryptography-vectors_3.2.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0 | BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4"
 
-SRC_URI[md5sum] = "fbc43f8b155b52f9ed163d3555ea5e83"
-SRC_URI[sha256sum] = "5529c516194122fec7db1682812e2314ddff4221fdf993169118f9c0d291e2f6"
+SRC_URI[md5sum] = "20976284d12ed99e31d38814be038ac1"
+SRC_URI[sha256sum] = "785f06ffd0bbc73bdd69d0b164d72a7a7827c7c3bbf79ae9a235d7126afd98e4"
 
 PYPI_PACKAGE = "cryptography_vectors"
 
-- 
2.17.1

