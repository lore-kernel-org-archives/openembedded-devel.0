Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.22656.1593613383803971432
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Jul 2020 07:23:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=60354 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jqddd-0002cZ-Ss; Wed, 01 Jul 2020 17:23:03 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-cryptography-vectors: Upgrade 2.8 -> 2.9.2
Date: Wed,  1 Jul 2020 17:22:40 +0300
Message-Id: <20200701142243.1686-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200701142243.1686-1-leon.anavi@konsulko.com>
References: <20200701142243.1686-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.9.2:

- Updated the macOS wheel to fix an issue where it would not run
  on macOS versions older than 10.15.
- Updated Windows, macOS, and manylinux wheels to be compiled with
  OpenSSL 1.1.1g.
- Support for Python 3.4 has been removed due to low usage and
  maintenance burden.
- Support for OpenSSL 1.0.1 has been removed. Users on older
  version of OpenSSL will need to upgrade.
- Support for LibreSSL 2.6.x has been removed.
- Removed support for calling
  :meth:`~cryptography.hazmat.primitives.asymmetric.x25519.X25519PublicKey.public_bytes`
  with no arguments, as per our deprecation policy. You must now
  pass encoding and format.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...y-vectors_2.8.bb => python3-cryptography-vectors_2.9.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cryptography-vectors_2.8.bb => python3-cryptography-vectors_2.9.2.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-cryptography-vectors_2.8.bb b/meta-python/recipes-devtools/python/python3-cryptography-vectors_2.9.2.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-cryptography-vectors_2.8.bb
rename to meta-python/recipes-devtools/python/python3-cryptography-vectors_2.9.2.bb
index 948aab9e0..60316fc74 100644
--- a/meta-python/recipes-devtools/python/python3-cryptography-vectors_2.8.bb
+++ b/meta-python/recipes-devtools/python/python3-cryptography-vectors_2.9.2.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0 | BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4"
 
-SRC_URI[md5sum] = "a744ed29bb9ef56b3a50317fea3b218e"
-SRC_URI[sha256sum] = "6cd32174c56a3eca72f64af43c1daacaae758cfa5ff9d280dfcf818fa11ef116"
+SRC_URI[md5sum] = "657349b8de73959fc49ba15fd7346b58"
+SRC_URI[sha256sum] = "99ac91c4d89572399b097240809af1b8f67f4bedf43398d290c9b2b3d9f491b4"
 
 PYPI_PACKAGE = "cryptography_vectors"
 
-- 
2.17.1

