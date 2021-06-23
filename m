Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.5047.1624439179383580383
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Jun 2021 02:06:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=54240 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lvypn-0008WN-F4; Wed, 23 Jun 2021 12:06:13 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-mypy: Upgrade 0.902 -> 0.910
Date: Wed, 23 Jun 2021 12:06:02 +0300
Message-Id: <20210623090602.27496-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210623090602.27496-1-leon.anavi@konsulko.com>
References: <20210623090602.27496-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.910:

- Call get_method_hook when methods are used in decorators
- Don't ask to install a stub package if stubs are installed
- [mypyc] Support various number-related dunders
- Fix crash when inferring multiple assignment with overloaded
  function
- Replace variable annotation with type comment to fix Python 3.5
- docs: updating URL in comment

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-mypy_0.902.bb => python3-mypy_0.910.bb}  | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-mypy_0.902.bb => python3-mypy_0.910.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-mypy_0.902.bb b/meta-python/recipes-devtools/python/python3-mypy_0.910.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-mypy_0.902.bb
rename to meta-python/recipes-devtools/python/python3-mypy_0.910.bb
index 86465e2f3a..8e675e6a9b 100644
--- a/meta-python/recipes-devtools/python/python3-mypy_0.902.bb
+++ b/meta-python/recipes-devtools/python/python3-mypy_0.910.bb
@@ -3,21 +3,18 @@ HOMEPAGE = "https://github.com/python/mypy"
 LICENSE = "MIT & Python-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=17b7180fcfc43c4e70c07c71588604c4"
 
-RDEPENDS_${PN} = " \
-    ${PYTHON_PN}-mypy-extensions \
-    ${PYTHON_PN}-typed-ast \
-    ${PYTHON_PN}-typing-extensions \
-"
-
 PYPI_PACKAGE = "mypy"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "9236c21194fde5df1b4d8ebc2ef2c1f2a5dc7f18bcbea54274937cae2e20a01c"
+SRC_URI[sha256sum] = "704098302473cb31a218f1775a873b376b30b4c18229421e9e9dc8916fd16150"
 
 BBCLASSEXTEND = "native"
 
 RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-mypy-extensions \
+    ${PYTHON_PN}-typed-ast \
+    ${PYTHON_PN}-typing-extensions \
     ${PYTHON_PN}-json \
     ${PYTHON_PN}-compression \
     ${PYTHON_PN}-pprint \
-- 
2.17.1

