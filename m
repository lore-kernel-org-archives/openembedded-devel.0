Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.187.1616517223520717743
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Mar 2021 09:33:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=60894 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lOjyM-0000KS-8y; Tue, 23 Mar 2021 18:33:43 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 05/10] python3-scrypt: Upgrade 0.8.6 -> 0.8.17
Date: Tue, 23 Mar 2021 18:33:12 +0200
Message-Id: <20210323163317.26664-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210323163317.26664-1-leon.anavi@konsulko.com>
References: <20210323163317.26664-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=0.5
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

Upgrade to release 0.8.17:

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
 ...-remove-the-hard-coded-include-paths.patch | 36 ++++++-------------
 ...rypt_0.8.6.bb => python3-scrypt_0.8.17.bb} |  9 +++--
 2 files changed, 14 insertions(+), 31 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-scrypt_0.8.6.bb => python3-scrypt_0.8.17.bb} (53%)

diff --git a/meta-python/recipes-devtools/python/python3-scrypt/0001-py-scrypt-remove-the-hard-coded-include-paths.patch b/meta-python/recipes-devtools/python/python3-scrypt/0001-py-scrypt-remove-the-hard-coded-include-paths.patch
index d535e4326..42d20855d 100644
--- a/meta-python/recipes-devtools/python/python3-scrypt/0001-py-scrypt-remove-the-hard-coded-include-paths.patch
+++ b/meta-python/recipes-devtools/python/python3-scrypt/0001-py-scrypt-remove-the-hard-coded-include-paths.patch
@@ -1,26 +1,10 @@
-From d8db473ce9346cd6254c90e13ac45b3bbde494c4 Mon Sep 17 00:00:00 2001
-From: Derek Straka <derek@asterius.io>
-Date: Sun, 11 Mar 2018 19:55:38 -0400
-Subject: [PATCH] py-scrypt: remove the hard coded include paths
-
-Upstream-Status: Pending
-
-Signed-off-by: Derek Straka <derek@asterius.io>
----
- setup.py | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/setup.py b/setup.py
-index e36adc4..2ebfbf1 100644
---- a/setup.py
-+++ b/setup.py
-@@ -24,7 +24,6 @@ if sys.platform.startswith('linux'):
-                      ('HAVE_SYS_SYSINFO_H', '1'),
-                      ('_FILE_OFFSET_BITS', '64')]
-     libraries = ['crypto', 'rt']
--    includes = ['/usr/local/include', '/usr/include']
-     CFLAGS.append('-O2')
- elif sys.platform.startswith('win32'):
-     define_macros = [('inline', '__inline')]
--- 
-2.7.4
+--- a/setup.py	2020-09-09 16:39:47.000000000 +0000
++++ b/setup.py	2021-03-22 11:35:31.171587290 +0000
+@@ -25,7 +25,6 @@
+                      ('HAVE_SYS_SYSINFO_H', '1'),
+                      ('_FILE_OFFSET_BITS', '64')]
+     libraries = ['crypto', 'rt']
+-    includes = ['/usr/local/include', '/usr/include']
+     CFLAGS.append('-O2')
+ elif sys.platform.startswith('win32'):
+     define_macros = [('inline', '__inline')]
diff --git a/meta-python/recipes-devtools/python/python3-scrypt_0.8.6.bb b/meta-python/recipes-devtools/python/python3-scrypt_0.8.17.bb
similarity index 53%
rename from meta-python/recipes-devtools/python/python3-scrypt_0.8.6.bb
rename to meta-python/recipes-devtools/python/python3-scrypt_0.8.17.bb
index 7588fc54b..122aa84d0 100644
--- a/meta-python/recipes-devtools/python/python3-scrypt_0.8.6.bb
+++ b/meta-python/recipes-devtools/python/python3-scrypt_0.8.17.bb
@@ -1,12 +1,11 @@
 DESCRIPTION = "Bindings for the scrypt key derivation function library"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=168ff75417f75a83e63c8875292d44dc"
-HOMEPAGE="https://bitbucket.org/mhallin/py-scrypt/overview"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=adb100454edec31fac41b1331cc76540"
+HOMEPAGE="https://github.com/holgern/py-scrypt"
 
 SRC_URI += "file://0001-py-scrypt-remove-the-hard-coded-include-paths.patch"
 
-SRC_URI[md5sum] = "ae8e3263aa31b040c1f9c7f1e1843a56"
-SRC_URI[sha256sum] = "f8239b2d47fa1d40bc27efd231dc7083695d10c1c2ac51a99380360741e0362d"
+SRC_URI[sha256sum] = "25b5075f2238be93af1cd574540a5ea01b8547f9b678aa72d22fce22577475ec"
 
 inherit pypi ptest setuptools3
 
@@ -20,5 +19,5 @@ RDEPENDS_${PN}-ptest += " \
 
 do_install_ptest() {
     install -d ${D}${PTEST_PATH}/tests
-    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+    cp -rf ${S}/scrypt/tests/* ${D}${PTEST_PATH}/tests/
 }
-- 
2.17.1

