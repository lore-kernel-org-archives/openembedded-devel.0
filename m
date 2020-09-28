Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.31558.1601280095654583351
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Sep 2020 01:01:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=40866 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kMo6I-0001Xq-C6; Mon, 28 Sep 2020 11:01:34 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 6/6] python3-luma-oled: Upgrade 3.5.0 -> 3.6.0
Date: Mon, 28 Sep 2020 11:00:59 +0300
Message-Id: <20200928080059.18929-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200928080059.18929-1-leon.anavi@konsulko.com>
References: <20200928080059.18929-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.6.0:

- Add support for Winstar OLED displays

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-luma-oled_3.5.0.bb => python3-luma-oled_3.6.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-luma-oled_3.5.0.bb => python3-luma-oled_3.6.0.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-luma-oled_3.5.0.bb b/meta-python/recipes-devtools/python/python3-luma-oled_3.6.0.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-luma-oled_3.5.0.bb
rename to meta-python/recipes-devtools/python/python3-luma-oled_3.6.0.bb
index 39bc37fda1..ae14aff366 100644
--- a/meta-python/recipes-devtools/python/python3-luma-oled_3.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-luma-oled_3.6.0.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=c328c862c3335ad464e1c9a3ba574249"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "64436aaa7a05a205430b38d2f9a9bec7"
-SRC_URI[sha256sum] = "ca62fd7337ee9780b32a8cdc10bcd69879f2cfd97720ab2e17e254a160f6c24f"
+SRC_URI[md5sum] = "ff45a3067658434339da2586a97e526b"
+SRC_URI[sha256sum] = "dbd8ebce1c0b10feabb725b321d4a7f9f7353fe16878c8145ca332a173c193c9"
 
 CLEANBROKEN = "1"
 
-- 
2.17.1

