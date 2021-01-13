Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.8616.1610547998079505250
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Jan 2021 06:26:38 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=48560 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kzh6Z-0000Li-Oh; Wed, 13 Jan 2021 16:26:36 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 04/10] python3-pyopenssl: Upgrade 19.1.0 -> 20.0.1
Date: Wed, 13 Jan 2021 16:26:20 +0200
Message-Id: <20210113142626.27599-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210113142626.27599-1-leon.anavi@konsulko.com>
References: <20210113142626.27599-1-leon.anavi@konsulko.com>
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

Upgrade to release 20.0.1:

- Fixed compatibility with OpenSSL 1.1.0
- Added a new optional chain parameter to
  OpenSSL.crypto.X509StoreContext() where additional untrusted
  certificates can be specified to help chain building.
- Added OpenSSL.crypto.X509Store.load_locations to set trusted
  certificate file bundles and/or directories for verification.
- Added Context.set_keylog_callback to log key material.
- Added OpenSSL.SSL.Connection.get_verified_chain to retrieve
  the verified certificate chain of the peer.
- Make verification callback optional in Context.set_verify. If
  omitted, OpenSSL’s default verification is used.
- Fixed a bug that could truncate or cause a zero-length key
  error due to a null byte in private key passphrase in
  OpenSSL.crypto.load_privatekey and OpenSSL.crypto.dump_privatekey.
- Deprecated OpenSSL.crypto.loads_pkcs7 and
  OpenSSL.crypto.loads_pkcs12.
- The minimum cryptography version is now 3.2.
- Remove deprecated OpenSSL.tsafe module.
- Removed deprecated OpenSSL.SSL.Context.set_npn_advertise_callback,
  OpenSSL.SSL.Context.set_npn_select_callback, and
  OpenSSL.SSL.Connection.get_next_proto_negotiated.
- Drop support for Python 3.4
- Drop support for OpenSSL 1.0.1 and 1.0.2

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...python3-pyopenssl_19.1.0.bb => python3-pyopenssl_20.0.1.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyopenssl_19.1.0.bb => python3-pyopenssl_20.0.1.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-pyopenssl_19.1.0.bb b/meta-python/recipes-devtools/python/python3-pyopenssl_20.0.1.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-pyopenssl_19.1.0.bb
rename to meta-python/recipes-devtools/python/python3-pyopenssl_20.0.1.bb
index da783ea29..e121ef844 100644
--- a/meta-python/recipes-devtools/python/python3-pyopenssl_19.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyopenssl_20.0.1.bb
@@ -5,8 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 DEPENDS += "openssl ${PYTHON_PN}-cryptography"
 
-SRC_URI[md5sum] = "d9804fedbd1eb0c7d9243397b1fbf972"
-SRC_URI[sha256sum] = "9a24494b2602aaf402be5c9e30a0b82d4a5c67528fe8fb475e3f3bc00dd69507"
+SRC_URI[sha256sum] = "4c231c759543ba02560fcd2480c48dcec4dae34c9da7d3747c508227e0624b51"
 
 PYPI_PACKAGE = "pyOpenSSL"
 inherit pypi setuptools3
-- 
2.17.1

