Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.3657.1592905912582322331
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Jun 2020 02:51:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=35806 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jnfap-0006Iq-2O; Tue, 23 Jun 2020 12:51:51 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 06/11] python3-configparser: Upgrade 4.0.2 -> 5.0.0
Date: Tue, 23 Jun 2020 12:51:31 +0300
Message-Id: <20200623095136.24854-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200623095136.24854-1-leon.anavi@konsulko.com>
References: <20200623095136.24854-1-leon.anavi@konsulko.com>
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

Add toml-native as dependency. Upgrade to release 5.0.0:

- Require Python 3.6 or later. For Python 2.6-3.5, use
  configparser < 5 (selection should be automatic when installed
  using pip 9 from PyPI). The 4.x line remains supported for bug
  fixes but will no longer be updated for future releases.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...-configparser_4.0.2.bb => python3-configparser_5.0.0.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-configparser_4.0.2.bb => python3-configparser_5.0.0.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-configparser_4.0.2.bb b/meta-python/recipes-devtools/python/python3-configparser_5.0.0.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-configparser_4.0.2.bb
rename to meta-python/recipes-devtools/python/python3-configparser_5.0.0.bb
index 196660925..6b2af125f 100644
--- a/meta-python/recipes-devtools/python/python3-configparser_4.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-configparser_5.0.0.bb
@@ -5,10 +5,10 @@ LICENSE = "MIT"
 
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=10;endline=10;md5=23f9ad5cad3d8cc0336e2a5d8a87e1fa"
 
-SRC_URI[md5sum] = "35926cc4b9133f1f9ca70a1fd2fdf237"
-SRC_URI[sha256sum] = "c7d282687a5308319bf3d2e7706e575c635b0a470342641c93bea0ea3b5331df"
+SRC_URI[md5sum] = "558114054aa5610365df1b34d3fea349"
+SRC_URI[sha256sum] = "2ca44140ee259b5e3d8aaf47c79c36a7ab0d5e94d70bd4105c03ede7a20ea5a1"
 
-DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
+DEPENDS += "${PYTHON_PN}-setuptools-scm-native ${PYTHON_PN}-toml-native"
 inherit pypi setuptools3
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

