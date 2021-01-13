Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.8618.1610548000184750044
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Jan 2021 06:26:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=48560 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kzh6c-0000Li-Ie; Wed, 13 Jan 2021 16:26:39 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 08/10] python3-cryptography-vectors: Upgrade 3.2 -> 3.3.1
Date: Wed, 13 Jan 2021 16:26:24 +0200
Message-Id: <20210113142626.27599-8-leon.anavi@konsulko.com>
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

Following the upgrade of python3-cryptography, upgrade to release
3.3.1:

- BACKWARDS INCOMPATIBLE: The
  :class:`~cryptography.hazmat.primitives.ciphers.modes.GCM` and
  :class:`~cryptography.hazmat.primitives.ciphers.aead.AESGCM` now
  require 64-bit to 1024-bit (8 byte to 128 byte) initialization
  vectors. This change is to conform with an upcoming OpenSSL
  release that will no longer support sizes outside this window.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hy-vectors_3.2.bb => python3-cryptography-vectors_3.3.1.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cryptography-vectors_3.2.bb => python3-cryptography-vectors_3.3.1.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-cryptography-vectors_3.2.bb b/meta-python/recipes-devtools/python/python3-cryptography-vectors_3.3.1.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-cryptography-vectors_3.2.bb
rename to meta-python/recipes-devtools/python/python3-cryptography-vectors_3.3.1.bb
index 2e7ed8169..bcdbc6adb 100644
--- a/meta-python/recipes-devtools/python/python3-cryptography-vectors_3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-cryptography-vectors_3.3.1.bb
@@ -4,8 +4,7 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0 | BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4"
 
-SRC_URI[md5sum] = "20976284d12ed99e31d38814be038ac1"
-SRC_URI[sha256sum] = "785f06ffd0bbc73bdd69d0b164d72a7a7827c7c3bbf79ae9a235d7126afd98e4"
+SRC_URI[sha256sum] = "03789c305dda8dccb4b8c9c019963a742469d88365abbc82e8e898ac478f5ca4"
 
 PYPI_PACKAGE = "cryptography_vectors"
 
-- 
2.17.1

