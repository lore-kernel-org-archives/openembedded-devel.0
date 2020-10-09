Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.10728.1602239745561287333
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Oct 2020 03:35:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=59440 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kQpkT-0007Jc-AU; Fri, 09 Oct 2020 13:35:42 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-configparser: Upgrade 5.0.0 -> 5.0.1
Date: Fri,  9 Oct 2020 13:35:31 +0300
Message-Id: <20201009103535.31339-1-leon.anavi@konsulko.com>
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

Upgrade to release 5.0.1:

- Synced with Python 3.9.0.
- Refreshed package metadata.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...n3-configparser_5.0.0.bb => python3-configparser_5.0.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-configparser_5.0.0.bb => python3-configparser_5.0.1.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-configparser_5.0.0.bb b/meta-python/recipes-devtools/python/python3-configparser_5.0.1.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-configparser_5.0.0.bb
rename to meta-python/recipes-devtools/python/python3-configparser_5.0.1.bb
index 6b2af125fb..b78de58447 100644
--- a/meta-python/recipes-devtools/python/python3-configparser_5.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-configparser_5.0.1.bb
@@ -5,8 +5,8 @@ LICENSE = "MIT"
 
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=10;endline=10;md5=23f9ad5cad3d8cc0336e2a5d8a87e1fa"
 
-SRC_URI[md5sum] = "558114054aa5610365df1b34d3fea349"
-SRC_URI[sha256sum] = "2ca44140ee259b5e3d8aaf47c79c36a7ab0d5e94d70bd4105c03ede7a20ea5a1"
+SRC_URI[md5sum] = "5faf185693cd21d83f6a3bc01b5733fa"
+SRC_URI[sha256sum] = "005c3b102c96f4be9b8f40dafbd4997db003d07d1caa19f37808be8031475f2a"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native ${PYTHON_PN}-toml-native"
 inherit pypi setuptools3
-- 
2.17.1

