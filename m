Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.13506.1598362010806026876
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Aug 2020 06:26:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=56752 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kAYyP-0001xr-13; Tue, 25 Aug 2020 16:26:49 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/7] python3-cryptography-vectors: Upgrade 2.9.2 -> 3.0
Date: Tue, 25 Aug 2020 16:26:28 +0300
Message-Id: <20200825132633.875-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200825132633.875-1-leon.anavi@konsulko.com>
References: <20200825132633.875-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.0:

- Deprecated support for Python 2.
- Added support for OpenSSH serialization format for ec, ed25519,
  rsa and dsa private keys
- Added support for OpenSSH certificates
- Added support for parsing attributes in certificate signing
  requests
- On OpenSSL 1.1.1d and higher cryptography now uses OpenSSL's
  built-in CSPRNG instead of its own OS random engine because
  these versions of OpenSSL properly reseed on fork
- Added initial support for creating PKCS12 files

More details are avaialble at:
https://github.com/pyca/cryptography/blob/master/CHANGELOG.rst

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...y-vectors_2.9.2.bb => python3-cryptography-vectors_3.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cryptography-vectors_2.9.2.bb => python3-cryptography-vectors_3.0.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-cryptography-vectors_2.9.2.bb b/meta-python/recipes-devtools/python/python3-cryptography-vectors_3.0.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-cryptography-vectors_2.9.2.bb
rename to meta-python/recipes-devtools/python/python3-cryptography-vectors_3.0.bb
index 60316fc74..26f1a2389 100644
--- a/meta-python/recipes-devtools/python/python3-cryptography-vectors_2.9.2.bb
+++ b/meta-python/recipes-devtools/python/python3-cryptography-vectors_3.0.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0 | BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4"
 
-SRC_URI[md5sum] = "657349b8de73959fc49ba15fd7346b58"
-SRC_URI[sha256sum] = "99ac91c4d89572399b097240809af1b8f67f4bedf43398d290c9b2b3d9f491b4"
+SRC_URI[md5sum] = "689e44b945870a2ed197c0c35e4a0330"
+SRC_URI[sha256sum] = "52eff0457b3148ebbdc16dc7ad569bb88ccb2578414936c8b2137a3ddf334239"
 
 PYPI_PACKAGE = "cryptography_vectors"
 
-- 
2.17.1

