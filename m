Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.22882.1605864562612435889
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Nov 2020 01:29:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=40904 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kg2jH-0006cP-RB; Fri, 20 Nov 2020 11:29:20 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-cantools: Upgrade 35.3.0 -> 35.5.0
Date: Fri, 20 Nov 2020 11:29:08 +0200
Message-Id: <20201120092910.30736-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
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

Upgrade to release 35.5.0:

- Added support for CAN FD in monitor.py cli tool

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-cantools_35.3.0.bb => python3-cantools_35.5.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cantools_35.3.0.bb => python3-cantools_35.5.0.bb} (64%)

diff --git a/meta-python/recipes-devtools/python/python3-cantools_35.3.0.bb b/meta-python/recipes-devtools/python/python3-cantools_35.5.0.bb
similarity index 64%
rename from meta-python/recipes-devtools/python/python3-cantools_35.3.0.bb
rename to meta-python/recipes-devtools/python/python3-cantools_35.5.0.bb
index c79e51e33a..cb70ed3188 100644
--- a/meta-python/recipes-devtools/python/python3-cantools_35.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cantools_35.5.0.bb
@@ -3,8 +3,7 @@ HOMEPAGE = "https://github.com/eerimoq/cantools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd"
 
-SRC_URI[md5sum] = "068514ac776e03ebaa8b2d02dd16fc77"
-SRC_URI[sha256sum] = "5e3a6f679ad3dcb31142e388e052187d5fc5bd481c4fc3b2791eaa1e681cca98"
+SRC_URI[sha256sum] = "ce26ab5d54762c314bedc35b407d498b8ae11069ab4d9251f8ac83f2956438f9"
 
 PYPI_PACKAGE = "cantools"
 
-- 
2.17.1

