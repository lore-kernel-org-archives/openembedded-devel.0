Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.45509.1624273122166999241
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Jun 2021 03:58:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=54610 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lvHdT-0001ID-NY; Mon, 21 Jun 2021 13:58:36 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-mypy: Upgrade 0.812 -> 0.902
Date: Mon, 21 Jun 2021 13:58:25 +0300
Message-Id: <20210621105825.28736-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210621105825.28736-1-leon.anavi@konsulko.com>
References: <20210621105825.28736-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.902:

- Move third-party library stubs to stub packages, allowing newer
  stubs to be easily used without updating mypy
- Support pyproject.toml and type guards
- Ship wheels for Apple Silicon
- Many other features and bug fixes

License-Update: Update copyright year

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-mypy_0.812.bb => python3-mypy_0.902.bb} | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-mypy_0.812.bb => python3-mypy_0.902.bb} (51%)

diff --git a/meta-python/recipes-devtools/python/python3-mypy_0.812.bb b/meta-python/recipes-devtools/python/python3-mypy_0.902.bb
similarity index 51%
rename from meta-python/recipes-devtools/python/python3-mypy_0.812.bb
rename to meta-python/recipes-devtools/python/python3-mypy_0.902.bb
index 8faab60b97..86465e2f3a 100644
--- a/meta-python/recipes-devtools/python/python3-mypy_0.812.bb
+++ b/meta-python/recipes-devtools/python/python3-mypy_0.902.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Optional static typing for Python 3 and 2 (PEP 484)"
 HOMEPAGE = "https://github.com/python/mypy"
 LICENSE = "MIT & Python-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=6afb7c151c4dedb5c3dc292cc120fadc"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=17b7180fcfc43c4e70c07c71588604c4"
 
 RDEPENDS_${PN} = " \
     ${PYTHON_PN}-mypy-extensions \
@@ -13,6 +13,14 @@ PYPI_PACKAGE = "mypy"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "cd07039aa5df222037005b08fbbfd69b3ab0b0bd7a07d7906de75ae52c4e3119"
+SRC_URI[sha256sum] = "9236c21194fde5df1b4d8ebc2ef2c1f2a5dc7f18bcbea54274937cae2e20a01c"
 
 BBCLASSEXTEND = "native"
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-json \
+    ${PYTHON_PN}-compression \
+    ${PYTHON_PN}-pprint \
+    ${PYTHON_PN}-difflib \
+    ${PYTHON_PN}-toml \
+"
-- 
2.17.1

