Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.12084.1596463542815818868
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2020 07:05:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=40282 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k2b5x-00024S-N1; Mon, 03 Aug 2020 17:05:42 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/7] python3-cryptography: Upgrade 2.8 -> 3.0
Date: Mon,  3 Aug 2020 17:05:17 +0300
Message-Id: <20200803140520.23250-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200803140520.23250-1-leon.anavi@konsulko.com>
References: <20200803140520.23250-1-leon.anavi@konsulko.com>
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

- Deprecated support for Python 2. At the time there is no time
  table for actually dropping support, however we strongly
  encourage all users to upgrade their Python, as Python 2 no
  longer receives support from the Python core team.
- Added support for OpenSSH serialization format for ec, ed25519,
  rsa and dsa private keys.
- Added support for OpenSSH certificates.
- Added :meth:`~cryptography.fernet.Fernet.encrypt_at_time` and
  :meth:`~cryptography.fernet.Fernet.decrypt_at_time` to
  :class:`~cryptography.fernet.Fernet`.
- Added support for the :class:`~cryptography.x509.SubjectInformationAccess`
  X.509 extension.
- Added support for parsing :class:`~cryptography.x509.SignedCertificateTimestamps`
  in OCSP responses.
- Added support for parsing attributes in certificate signing
  requests.
- Added support for encoding attributes in certificate signing
  requests.
- On OpenSSL 1.1.1d and higher cryptography now uses OpenSSL's
  built-in CSPRNG instead of its own OS random engine because
  ithese versions of OpenSSL properly reseed on fork.

BACKWARDS INCOMPATIBLE:

- Support for LibreSSL 2.7.x, 2.8.x, and 2.9.0 has been removed
  (2.9.1+ is still supported).
- Dropped support for macOS 10.9, macOS users must upgrade to
  10.10 or newer.
- RSA :meth:`~cryptography.hazmat.primitives.asymmetric.rsa.generate_private_key`
  no longer accepts public_exponent values except 65537 and 3
  (the latter for legacy purposes).
- X.509 certificate parsing now enforces that the version field
  contains a valid value, rather than deferring this check until
  :attr:`~cryptography.x509.Certificate.version` is accessed.
- Added initial support for creating PKCS12 files with
  :func:`~cryptography.hazmat.primitives.serialization.pkcs12.serialize_key_and_certificates`.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-cryptography_2.8.bb => python3-cryptography_3.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cryptography_2.8.bb => python3-cryptography_3.0.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-cryptography_2.8.bb b/meta-python/recipes-devtools/python/python3-cryptography_3.0.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-cryptography_2.8.bb
rename to meta-python/recipes-devtools/python/python3-cryptography_3.0.bb
index 95e903b29..05a2350e3 100644
--- a/meta-python/recipes-devtools/python/python3-cryptography_2.8.bb
+++ b/meta-python/recipes-devtools/python/python3-cryptography_3.0.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=097f805837700cfac572ac274cd38124"
 
 LDSHARED += "-pthread"
 
-SRC_URI[md5sum] = "77730058b556c6d9838679a94c6229ce"
-SRC_URI[sha256sum] = "3cda1f0ed8747339bbdf71b9f38ca74c7b592f24f65cdb3ab3765e4b02871651"
+SRC_URI[md5sum] = "163608a7cb838c6b39360e1e64377d54"
+SRC_URI[sha256sum] = "8e924dbc025206e97756e8903039662aa58aa9ba357d8e1d8fc29e3092322053"
 
 SRC_URI += " \
     file://run-ptest \
-- 
2.17.1

