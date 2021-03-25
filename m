Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.8072.1616679288598854072
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Mar 2021 06:34:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=38494 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lPQ8M-0007lW-9e; Thu, 25 Mar 2021 15:34:47 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 03/11] python3-pytest-helpers-namespace: Upgrade 2019.1.8 -> 2021.3.24
Date: Thu, 25 Mar 2021 15:34:28 +0200
Message-Id: <20210325133436.18328-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210325133436.18328-1-leon.anavi@konsulko.com>
References: <20210325133436.18328-1-leon.anavi@konsulko.com>
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

Upgrade to release 2021.3.24:

- Switched project to a src layout.
- Switched project to a declarative setuptools approach
- Added support to check if a helper has been registered

License-Update: Fix year in the license file

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...b => python3-pytest-helpers-namespace_2021.3.24.bb} | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-helpers-namespace_2019.1.8.bb => python3-pytest-helpers-namespace_2021.3.24.bb} (64%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-helpers-namespace_2019.1.8.bb b/meta-python/recipes-devtools/python/python3-pytest-helpers-namespace_2021.3.24.bb
similarity index 64%
rename from meta-python/recipes-devtools/python/python3-pytest-helpers-namespace_2019.1.8.bb
rename to meta-python/recipes-devtools/python/python3-pytest-helpers-namespace_2021.3.24.bb
index b3aced4f6..9211ac394 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-helpers-namespace_2019.1.8.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-helpers-namespace_2021.3.24.bb
@@ -2,13 +2,17 @@ DESCRIPTION = "This plugin does not provide any helpers to pytest, it does, howe
 HOMEPAGE = "https://github.com/saltstack/pytest-helpers-namespace"
 SECTION = "devel/python"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=cc99508c43d9d14fd51c7fac622ffd23"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=440a4cdb311cd7ad181efb4cba06d562"
 
-SRC_URI[md5sum] = "04ec1d8750f9b154e782a47cf8b30736"
-SRC_URI[sha256sum] = "4eff23a19f92410c0166f6dffbfa8901d3e14a80e97d70cd08428b6d597771ce"
+SRC_URI[sha256sum] = "188df5a7c52390fa27d6cd2f18e74d64a2ef0b9fb6e12f15fdf5a95f4813d25f"
 
 inherit pypi setuptools3
 
+DEPENDS += "\
+    ${PYTHON_PN}-wheel-native \
+    ${PYTHON_PN}-pip-native \
+"
+
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-pytest \
 "
-- 
2.17.1

