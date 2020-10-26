Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.11368.1603713084046425038
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Oct 2020 04:51:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=55378 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kX121-0007bv-Iw; Mon, 26 Oct 2020 13:51:22 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-luma-oled: Upgrade 3.6.0 -> 3.7.0
Date: Mon, 26 Oct 2020 13:50:41 +0200
Message-Id: <20201026115041.11671-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201026115041.11671-1-leon.anavi@konsulko.com>
References: <20201026115041.11671-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.7.0:

- Drop support for Python 3.5, only 3.6 or newer is supported now
- Add support for SSD1351 128x96 display
- Pin luma.core to 1.x.y line only, in anticipation of performance
  improvements in upcoming major release

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-luma-oled_3.6.0.bb => python3-luma-oled_3.7.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-luma-oled_3.6.0.bb => python3-luma-oled_3.7.0.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-luma-oled_3.6.0.bb b/meta-python/recipes-devtools/python/python3-luma-oled_3.7.0.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-luma-oled_3.6.0.bb
rename to meta-python/recipes-devtools/python/python3-luma-oled_3.7.0.bb
index ae14aff366..8c9d195baa 100644
--- a/meta-python/recipes-devtools/python/python3-luma-oled_3.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-luma-oled_3.7.0.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=c328c862c3335ad464e1c9a3ba574249"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "ff45a3067658434339da2586a97e526b"
-SRC_URI[sha256sum] = "dbd8ebce1c0b10feabb725b321d4a7f9f7353fe16878c8145ca332a173c193c9"
+SRC_URI[md5sum] = "dd661f869180c5b306628cc6ade04d60"
+SRC_URI[sha256sum] = "fa710ea5d46f731033dbbcf4330f264d653a9a21d60b29dfc53355f72f355e17"
 
 CLEANBROKEN = "1"
 
-- 
2.17.1

