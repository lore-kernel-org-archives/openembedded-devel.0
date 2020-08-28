Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.43121.1598622708333891667
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Aug 2020 06:51:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=49752 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kBenD-0004K0-1W; Fri, 28 Aug 2020 16:51:47 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-cryptography-vectors: Upgrade 3.0 -> 3.1
Date: Fri, 28 Aug 2020 16:51:29 +0300
Message-Id: <20200828135131.26321-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200828135131.26321-1-leon.anavi@konsulko.com>
References: <20200828135131.26321-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.1:

- BACKWARDS INCOMPATIBLE: Removed support for idna based
  :term:`U-label` parsing in various X.509 classes. This support
  was originally deprecated in version 2.1 and moved to an extra
  in 2.5.
- Deprecated OpenSSL 1.0.2 support. OpenSSL 1.0.2 is no longer
  supported by the OpenSSL project. The next version of
  cryptography will drop support for it.
- Deprecated support for Python 3.5. This version sees very little
  use and will be removed in the next release.
- backend arguments to functions are no longer required and the
  default backend will automatically be selected if no backend is
  provided.
- Added initial support for parsing certificates from PKCS7 files
- Calling update or update_into on
  :class:`~cryptography.hazmat.primitives.ciphers.CipherContext`
  with data longer than 231 bytes no longer raises an
  OverflowError. This also resolves the same issue in
  :doc:`/fernet`.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...phy-vectors_3.0.bb => python3-cryptography-vectors_3.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cryptography-vectors_3.0.bb => python3-cryptography-vectors_3.1.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-cryptography-vectors_3.0.bb b/meta-python/recipes-devtools/python/python3-cryptography-vectors_3.1.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-cryptography-vectors_3.0.bb
rename to meta-python/recipes-devtools/python/python3-cryptography-vectors_3.1.bb
index 26f1a2389..59347c94e 100644
--- a/meta-python/recipes-devtools/python/python3-cryptography-vectors_3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cryptography-vectors_3.1.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0 | BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4"
 
-SRC_URI[md5sum] = "689e44b945870a2ed197c0c35e4a0330"
-SRC_URI[sha256sum] = "52eff0457b3148ebbdc16dc7ad569bb88ccb2578414936c8b2137a3ddf334239"
+SRC_URI[md5sum] = "1ba5b0743e2876e909f7cfc28b744f27"
+SRC_URI[sha256sum] = "2660bc3a720d3955341803195ae5352a236c5f26e01a178c44fc5ee1f0ef1182"
 
 PYPI_PACKAGE = "cryptography_vectors"
 
-- 
2.17.1

