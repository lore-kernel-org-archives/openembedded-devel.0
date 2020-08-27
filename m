Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.15059.1598520603269449242
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Aug 2020 02:30:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=58710 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kBEEL-0005Nx-Br; Thu, 27 Aug 2020 12:30:02 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-cryptography: Upgrade 3.0 -> 3.1
Date: Thu, 27 Aug 2020 12:29:50 +0300
Message-Id: <20200827092951.15749-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200827092951.15749-1-leon.anavi@konsulko.com>
References: <20200827092951.15749-1-leon.anavi@konsulko.com>
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
- Deprecated support for Python 3.5. This version sees very
  little use and will be removed in the next release.
- backend arguments to functions are no longer required and the
  default backend will automatically be selected if no backend
  is provided.
- Added initial support for parsing certificates from PKCS7 files
- Calling update or update_into on
  :class:`~cryptography.hazmat.primitives.ciphers.CipherContext`
  with data longer than 231 bytes no longer raises an
  OverflowError. This also resolves the same issue in
  :doc:`/fernet`.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-cryptography_3.0.bb => python3-cryptography_3.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cryptography_3.0.bb => python3-cryptography_3.1.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-cryptography_3.0.bb b/meta-python/recipes-devtools/python/python3-cryptography_3.1.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-cryptography_3.0.bb
rename to meta-python/recipes-devtools/python/python3-cryptography_3.1.bb
index 05a2350e3..9ac23cda4 100644
--- a/meta-python/recipes-devtools/python/python3-cryptography_3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cryptography_3.1.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=097f805837700cfac572ac274cd38124"
 
 LDSHARED += "-pthread"
 
-SRC_URI[md5sum] = "163608a7cb838c6b39360e1e64377d54"
-SRC_URI[sha256sum] = "8e924dbc025206e97756e8903039662aa58aa9ba357d8e1d8fc29e3092322053"
+SRC_URI[md5sum] = "aa91e4974981b29e99b863c54034c361"
+SRC_URI[sha256sum] = "26409a473cc6278e4c90f782cd5968ebad04d3911ed1c402fc86908c17633e08"
 
 SRC_URI += " \
     file://run-ptest \
-- 
2.17.1

