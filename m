Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.8617.1610547999524393107
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Jan 2021 06:26:39 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=48560 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kzh6b-0000Li-I7; Wed, 13 Jan 2021 16:26:38 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 07/10] python3-cryptography: Upgrade 3.2 -> 3.3.1
Date: Wed, 13 Jan 2021 16:26:23 +0200
Message-Id: <20210113142626.27599-7-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210113142626.27599-1-leon.anavi@konsulko.com>
References: <20210113142626.27599-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.3.1:

- Re-added a legacy symbol causing problems for older pyOpenSSL
  users.
- BACKWARDS INCOMPATIBLE: Support for Python 3.5 has been removed
  due to low usage and maintenance burden.
- BACKWARDS INCOMPATIBLE: The
  :class:`~cryptography.hazmat.primitives.ciphers.modes.GCM` and
  :class:`~cryptography.hazmat.primitives.ciphers.aead.AESGCM` now
  require 64-bit to 1024-bit (8 byte to 128 byte) initialization
  vectors. This change is to conform with an upcoming OpenSSL
  release that will no longer support sizes outside this window.
- BACKWARDS INCOMPATIBLE: When deserializing asymmetric keys we
  now raise ValueError rather than UnsupportedAlgorithm when an
  unsupported cipher is used. This change is to conform with an
  upcoming OpenSSL release that will no longer distinguish between
  error types.
- BACKWARDS INCOMPATIBLE: We no longer allow loading of finite
  field Diffie-Hellman parameters of less than 512 bits in length.
  This change is to conform with an upcoming OpenSSL release that
  no longer supports smaller sizes. These keys were already wildly
  insecure and should not have been used in any application
  outside of testing.
- Updated Windows, macOS, and manylinux wheels to be compiled with
  OpenSSL 1.1.1i.
- Python 2 support is deprecated in cryptography. This is the last
  release that will support Python 2.

License-Update: Update note about the code derived from CPython

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...on3-cryptography_3.2.bb => python3-cryptography_3.3.1.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cryptography_3.2.bb => python3-cryptography_3.3.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-cryptography_3.2.bb b/meta-python/recipes-devtools/python/python3-cryptography_3.3.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-cryptography_3.2.bb
rename to meta-python/recipes-devtools/python/python3-cryptography_3.3.1.bb
index cec37b027..79a7ac1bf 100644
--- a/meta-python/recipes-devtools/python/python3-cryptography_3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-cryptography_3.3.1.bb
@@ -2,12 +2,11 @@ SUMMARY = "Provides cryptographic recipes and primitives to python developers"
 HOMEPAGE = "https://cryptography.io/"
 SECTION = "devel/python"
 LICENSE = "Apache-2.0 | BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=097f805837700cfac572ac274cd38124"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=bf405a8056a6647e7d077b0e7bc36aba"
 
 LDSHARED += "-pthread"
 
-SRC_URI[md5sum] = "1e476287399bae923514e19429804155"
-SRC_URI[sha256sum] = "e4789b84f8dedf190148441f7c5bfe7244782d9cbb194a36e17b91e7d3e1cca9"
+SRC_URI[sha256sum] = "7e177e4bea2de937a584b13645cab32f25e3d96fc0bc4a4cf99c27dc77682be6"
 
 SRC_URI += " \
     file://run-ptest \
-- 
2.17.1

