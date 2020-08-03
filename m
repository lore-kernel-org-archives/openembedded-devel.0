Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.7926.1596448689778068913
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2020 02:58:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=40162 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k2XEN-0003NX-1g; Mon, 03 Aug 2020 12:58:07 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-asn1crypto: Upgrade 1.3.0 -> 1.4.0
Date: Mon,  3 Aug 2020 12:57:55 +0300
Message-Id: <20200803095759.9591-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Upgrade to release 1.4.0:

- core.ObjectIdentifier and all derived classes now obey X.660 §7.6
  and thus restrict the first arc to 0 to 2, and the second arc to
  less than 40 if the first arc is 0 or 1. This also fixes parsing
  of OIDs where the first arc is 2 and the second arc is greater
  than 39.
- Fixed keys.PublicKeyInfo.bit_size to return an int rather than a
  float on Python 3 when working with elliptic curve keys
- Fixed the asn1crypto-tests sdist on PyPi to work properly to
  generate a .whl

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-asn1crypto_1.3.0.bb => python3-asn1crypto_1.4.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-asn1crypto_1.3.0.bb => python3-asn1crypto_1.4.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-asn1crypto_1.3.0.bb b/meta-python/recipes-devtools/python/python3-asn1crypto_1.4.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-asn1crypto_1.3.0.bb
rename to meta-python/recipes-devtools/python/python3-asn1crypto_1.4.0.bb
index 0d38da989..bb1271e33 100644
--- a/meta-python/recipes-devtools/python/python3-asn1crypto_1.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-asn1crypto_1.4.0.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=7439e38f5e04ff62fae436184786b7ca"
 
 PYPI_PACKAGE = "asn1crypto"
 
-SRC_URI[md5sum] = "daad112940181917e3ff169b47b9bd9a"
-SRC_URI[sha256sum] = "5a215cb8dc12f892244e3a113fe05397ee23c5c4ca7a69cd6e69811755efc42d"
+SRC_URI[md5sum] = "00bf5b72d37778e62cc73b1d8909ae27"
+SRC_URI[sha256sum] = "f4f6e119474e58e04a2b1af817eb585b4fd72bdd89b998624712b5c99be7641c"
 
 inherit pypi setuptools3
 
-- 
2.17.1

