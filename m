Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.5548.1615883874997406092
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Mar 2021 01:37:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=35240 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lM5D4-0006gf-S6; Tue, 16 Mar 2021 10:37:53 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/6] python3-configparser: Upgrade 5.0.1 -> 5.0.2
Date: Tue, 16 Mar 2021 10:37:40 +0200
Message-Id: <20210316083744.17558-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210316083744.17558-1-leon.anavi@konsulko.com>
References: <20210316083744.17558-1-leon.anavi@konsulko.com>
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

Upgrade to release 5.0.2:

- Packaging refresh

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...on3-configparser_5.0.1.bb => python3-configparser_5.0.2.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-configparser_5.0.1.bb => python3-configparser_5.0.2.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-configparser_5.0.1.bb b/meta-python/recipes-devtools/python/python3-configparser_5.0.2.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-configparser_5.0.1.bb
rename to meta-python/recipes-devtools/python/python3-configparser_5.0.2.bb
index b78de5844..87cdd09f7 100644
--- a/meta-python/recipes-devtools/python/python3-configparser_5.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-configparser_5.0.2.bb
@@ -5,8 +5,7 @@ LICENSE = "MIT"
 
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=10;endline=10;md5=23f9ad5cad3d8cc0336e2a5d8a87e1fa"
 
-SRC_URI[md5sum] = "5faf185693cd21d83f6a3bc01b5733fa"
-SRC_URI[sha256sum] = "005c3b102c96f4be9b8f40dafbd4997db003d07d1caa19f37808be8031475f2a"
+SRC_URI[sha256sum] = "85d5de102cfe6d14a5172676f09d19c465ce63d6019cf0a4ef13385fc535e828"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native ${PYTHON_PN}-toml-native"
 inherit pypi setuptools3
-- 
2.17.1

