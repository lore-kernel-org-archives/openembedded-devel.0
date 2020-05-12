Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web10.6073.1589291727132919706
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2020 06:55:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=ltedFSFU;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=h6oi=62=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49LzpP2SQyz5R
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2020 15:55:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1589291725;
	bh=bU/c67zdQbE674JwcRLl4jya1BzugbQJ/V07PCj4Nnw=;
	h=From:To:Subject:Date:From;
	b=ltedFSFUu0h6778l0Lj5gNlqsXIZgI+U8wzdglz5/9u7x93CQu+lY8XqMUfBslewy
	 hMwvd5mhO1tSXjSFTnkPUU+GmwpHnxtpm9lkMPe1mjm3NnAxN4Bh18z9lSh8JMAWtN
	 5a9530ogmRr+FEVOMJbZC3uGFeyYXbaxcRtSnZdIZ6LBVjA512RxgYU9jNRDzVmril
	 WPi0s87sKHLX+hmhNnssI40palfRduNEsBDO5HJgBx2F9hyJpp6RM40Bq5ys0j5nl3
	 TrvMh/ajWyUm2IXE5wgm3g2/aObaef9WhsDGiJ7DSZOCDvnttsbYTeO8k2kf7Mx1VU
	 ZAf1eBsIzc2ATtcu12V4X3cbad7oggfldkWXPeYALhX2bj36pNf3f883QcKIGzI4EJ
	 5uVH2cMxuDRp34TX9WETb0prGo9j6zGA1Pb8F40MbbYuBQrqebk8JYyTctzlW8oGZ6
	 9Vh8KKPKBSR2dxad39MashD2PTNmigxdvTeZK7gOXhwcNMjPihGjaVO+dBRUUHJ5Fq
	 P/trgUZx1VZEz6GzZv6kW6CFaDxhApbCFWMFNwjDWu9i6fZeKOhZNGM+SqhBZxe30h
	 vBmLfLcbgPMLw1Az9UeLOOLo1pQoo/Ho+YEoEMXK/xnp9MYUAsjzsM3aSNTflg+YoB
	 FEF6CyWK6seaAZ4pAwOKYQZ4=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Subject: [OE-core][PATCH] libxcrypt2: Remove -fcommon
Date: Tue, 12 May 2020 16:55:17 +0300
Message-Id: <20200512135523.19970-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1

This was fixed in upstream version 4.4.12.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-core/libxcrypt/libxcrypt.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index bee1367c99..2d2a0b03e3 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -27,8 +27,6 @@ BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
 TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${includedir} -Wno-error"
 CPPFLAGS_append_class-nativesdk = " -Wno-error"
 
-CFLAGS += "-fcommon"
-
 API = "--disable-obsolete-api"
 EXTRA_OECONF += "${API}"
 
-- 
2.17.1

