Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.33277.1612183532681517562
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Feb 2021 04:45:33 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=33634 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1l6YaA-0001Fc-QT; Mon, 01 Feb 2021 14:45:31 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-pychromecast: Upgrade 7.7.2 -> 8.0.0
Date: Mon,  1 Feb 2021 14:45:15 +0200
Message-Id: <20210201124516.30135-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210201124516.30135-1-leon.anavi@konsulko.com>
References: <20210201124516.30135-1-leon.anavi@konsulko.com>
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

Upgrade to release 8.0.0:

- Infer contentType from playQueue items
- Lint example scripts
- Revert "Lint example scripts"
- Lint example scripts
- Bump pylint to 2.6.0
- Remove unintended 'async' from listener interfaces
- Update BubbleUPNP example
- Refactor listeners and controllers as ABCs
- Add more google devices to consts
- Make current_time optional when loading or queing media

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-pychromecast_7.7.2.bb => python3-pychromecast_8.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pychromecast_7.7.2.bb => python3-pychromecast_8.0.0.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_7.7.2.bb b/meta-python/recipes-devtools/python/python3-pychromecast_8.0.0.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-pychromecast_7.7.2.bb
rename to meta-python/recipes-devtools/python/python3-pychromecast_8.0.0.bb
index c0ff58cfd..939db5768 100644
--- a/meta-python/recipes-devtools/python/python3-pychromecast_7.7.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pychromecast_8.0.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/balloob/pychromecast"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5"
 
-SRC_URI[sha256sum] = "aad4b145cb8c76b629c700877e49c418810aaabb26ace5035c49940f9657f2f0"
+SRC_URI[sha256sum] = "21e9295b2e8088a7f19f82b22c7abcc07ab329914d647cc5dcac08790a7c9d36"
 
 PYPI_PACKAGE = "PyChromecast"
 
-- 
2.17.1

