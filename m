Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.11393.1603713051016524498
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Oct 2020 04:50:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=55378 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kX11U-0007bv-CU; Mon, 26 Oct 2020 13:50:49 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-cryptography: Upgrade 3.1.1 -> 3.2
Date: Mon, 26 Oct 2020 13:50:37 +0200
Message-Id: <20201026115041.11671-1-leon.anavi@konsulko.com>
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
 ...hon3-cryptography_3.1.1.bb => python3-cryptography_3.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cryptography_3.1.1.bb => python3-cryptography_3.2.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-cryptography_3.1.1.bb b/meta-python/recipes-devtools/python/python3-cryptography_3.2.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-cryptography_3.1.1.bb
rename to meta-python/recipes-devtools/python/python3-cryptography_3.2.bb
index 1d6a9b32e0..cec37b0276 100644
--- a/meta-python/recipes-devtools/python/python3-cryptography_3.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cryptography_3.2.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=097f805837700cfac572ac274cd38124"
 
 LDSHARED += "-pthread"
 
-SRC_URI[md5sum] = "c3807891d36aa9de8187e9db8b2bb457"
-SRC_URI[sha256sum] = "9d9fc6a16357965d282dd4ab6531013935425d0dc4950df2e0cf2a1b1ac1017d"
+SRC_URI[md5sum] = "1e476287399bae923514e19429804155"
+SRC_URI[sha256sum] = "e4789b84f8dedf190148441f7c5bfe7244782d9cbb194a36e17b91e7d3e1cca9"
 
 SRC_URI += " \
     file://run-ptest \
-- 
2.17.1

