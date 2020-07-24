Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.3469.1595586931442599893
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Jul 2020 03:35:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=34792 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jyv33-0006km-Pf; Fri, 24 Jul 2020 13:35:31 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/7] python3-urllib3: Upgrade 1.25.9 -> 1.25.10
Date: Fri, 24 Jul 2020 13:35:13 +0300
Message-Id: <20200724103515.21420-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200724103515.21420-1-leon.anavi@konsulko.com>
References: <20200724103515.21420-1-leon.anavi@konsulko.com>
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

Upgarde to release 1.25.10:

* Added support for ``SSLKEYLOGFILE`` environment variable for
  logging TLS session keys with use with programs like
  Wireshark for decrypting captured web traffic
* Fixed loading of SecureTransport libraries on macOS Big Sur
  due to the new dynamic linker cache
* Collapse chunked request bodies data and framing into one
  call to ``send()`` to reduce the number of TCP packets by 2-4x
* Don't insert ``None`` into ``ConnectionPool`` if the pool
  was empty when requesting a connection
* Avoid ``hasattr`` call in ``BrotliDecoder.decompress()``

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-urllib3_1.25.9.bb => python3-urllib3_1.25.10.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-urllib3_1.25.9.bb => python3-urllib3_1.25.10.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-urllib3_1.25.9.bb b/meta-python/recipes-devtools/python/python3-urllib3_1.25.10.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-urllib3_1.25.9.bb
rename to meta-python/recipes-devtools/python/python3-urllib3_1.25.10.bb
index 8cbc1f9f9..db985a2ff 100644
--- a/meta-python/recipes-devtools/python/python3-urllib3_1.25.9.bb
+++ b/meta-python/recipes-devtools/python/python3-urllib3_1.25.10.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/shazow/urllib3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=65715c2eb961313d71b297dd5a04f85e"
 
-SRC_URI[md5sum] = "dbf9b868b90880b24b1ac278094e912e"
-SRC_URI[sha256sum] = "3018294ebefce6572a474f0604c2021e33b3fd8006ecd11d62107a5d2a963527"
+SRC_URI[md5sum] = "94e3d4d472a14e788d4bd1a903fd102b"
+SRC_URI[sha256sum] = "91056c15fa70756691db97756772bb1eb9678fa585d9184f24534b100dc60f4a"
 
 inherit pypi setuptools3
 
-- 
2.17.1

