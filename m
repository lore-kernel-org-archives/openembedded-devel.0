Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.3709.1606389752097080139
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2020 03:22:32 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=52394 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kiFM6-0005Yd-Jf; Thu, 26 Nov 2020 13:22:31 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/7] python3-luma-oled: Upgrade 3.7.0 -> 3.8.1
Date: Thu, 26 Nov 2020 13:22:10 +0200
Message-Id: <20201126112215.11451-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201126112215.11451-1-leon.anavi@konsulko.com>
References: <20201126112215.11451-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.8.1:

- Improved diff_to_previous framebuffer performance
- Fix mutable default parameter bug when using multiple displays

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-luma-oled_3.7.0.bb => python3-luma-oled_3.8.1.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-luma-oled_3.7.0.bb => python3-luma-oled_3.8.1.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-luma-oled_3.7.0.bb b/meta-python/recipes-devtools/python/python3-luma-oled_3.8.1.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-luma-oled_3.7.0.bb
rename to meta-python/recipes-devtools/python/python3-luma-oled_3.8.1.bb
index 8c9d195baa..329cdb9e3f 100644
--- a/meta-python/recipes-devtools/python/python3-luma-oled_3.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-luma-oled_3.8.1.bb
@@ -8,8 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=c328c862c3335ad464e1c9a3ba574249"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "dd661f869180c5b306628cc6ade04d60"
-SRC_URI[sha256sum] = "fa710ea5d46f731033dbbcf4330f264d653a9a21d60b29dfc53355f72f355e17"
+SRC_URI[sha256sum] = "a9b445ecc686e9413ddac655544da21d801bbc6b94612736cf59283e6b92bcbb"
 
 CLEANBROKEN = "1"
 
-- 
2.17.1

