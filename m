Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.4832.1616587779978191607
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Mar 2021 05:09:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=49130 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lP2KO-0006zK-Pm; Wed, 24 Mar 2021 14:09:37 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCHv2] python3-scrypt: Upgrade 0.8.6 -> 0.8.17
Date: Wed, 24 Mar 2021 14:09:30 +0200
Message-Id: <20210324120930.24792-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.8.17 and inherit dos2unix to resolve issues
due to different line endings:

- Add_dll_directory for python 3.8 on windows, as
  importlib.util.find_spec does not search all paths anymore
- Add additional test vector from RFC
- Fix missing import
- Fix imp deprecation warning
- Improve build for conda forge
- Add SCRYPT_WINDOWS_LINK_LEGACY_OPENSSL environment variable,
  when set, openssl 1.0.2 is linked
- Fix build for conda feedstock
- Fix typo
- Use the static libcrypto_static for windows and openssl 1.1.1
- Setup.py for windows improved, works with openssl 1.0.2 and 1.1.1
- Setup.py for windows fixed

License-Update: Update years

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-scrypt_0.8.17.bb           | 23 ++++++++++++++++++
 .../python/python3-scrypt_0.8.6.bb            | 24 -------------------
 2 files changed, 23 insertions(+), 24 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-scrypt_0.8.17.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-scrypt_0.8.6.bb

diff --git a/meta-python/recipes-devtools/python/python3-scrypt_0.8.17.bb b/meta-python/recipes-devtools/python/python3-scrypt_0.8.17.bb
new file mode 100644
index 000000000..bcd58914a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-scrypt_0.8.17.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "Bindings for the scrypt key derivation function library"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2ddf47d0ff1849bce3257ccbc1fd275c"
+HOMEPAGE="https://github.com/holgern/py-scrypt"
+
+SRC_URI += "file://0001-py-scrypt-remove-the-hard-coded-include-paths.patch"
+
+SRC_URI[sha256sum] = "25b5075f2238be93af1cd574540a5ea01b8547f9b678aa72d22fce22577475ec"
+
+inherit pypi ptest setuptools3 dos2unix
+
+SRC_URI += " \
+    file://run-ptest \
+"
+
+RDEPENDS_${PN}-ptest += " \
+    ${PYTHON_PN}-pytest \
+"
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    cp -rf ${S}/scrypt/tests/* ${D}${PTEST_PATH}/tests/
+}
diff --git a/meta-python/recipes-devtools/python/python3-scrypt_0.8.6.bb b/meta-python/recipes-devtools/python/python3-scrypt_0.8.6.bb
deleted file mode 100644
index 7588fc54b..000000000
--- a/meta-python/recipes-devtools/python/python3-scrypt_0.8.6.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-DESCRIPTION = "Bindings for the scrypt key derivation function library"
-LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=168ff75417f75a83e63c8875292d44dc"
-HOMEPAGE="https://bitbucket.org/mhallin/py-scrypt/overview"
-
-SRC_URI += "file://0001-py-scrypt-remove-the-hard-coded-include-paths.patch"
-
-SRC_URI[md5sum] = "ae8e3263aa31b040c1f9c7f1e1843a56"
-SRC_URI[sha256sum] = "f8239b2d47fa1d40bc27efd231dc7083695d10c1c2ac51a99380360741e0362d"
-
-inherit pypi ptest setuptools3
-
-SRC_URI += " \
-    file://run-ptest \
-"
-
-RDEPENDS_${PN}-ptest += " \
-    ${PYTHON_PN}-pytest \
-"
-
-do_install_ptest() {
-    install -d ${D}${PTEST_PATH}/tests
-    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
-- 
2.17.1

