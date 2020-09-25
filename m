Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.5632.1601033013649854337
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Sep 2020 04:23:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=56930 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kLlp5-0008RR-0g; Fri, 25 Sep 2020 14:23:32 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/4] python3-pycrypto: Consolidate in a single file
Date: Fri, 25 Sep 2020 14:23:21 +0300
Message-Id: <20200925112321.3195-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200925112321.3195-1-leon.anavi@konsulko.com>
References: <20200925112321.3195-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-0.7
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

Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python-pycrypto.inc                | 21 ----------------
 .../CVE-2013-7459.patch                       |  0
 .../cross-compiling.patch                     |  0
 .../python/python3-pycrypto_2.6.1.bb          | 24 ++++++++++++++++---
 4 files changed, 21 insertions(+), 24 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pycrypto.inc
 rename meta-python/recipes-devtools/python/{python-pycrypto => python3-pycrypto}/CVE-2013-7459.patch (100%)
 rename meta-python/recipes-devtools/python/{python-pycrypto => python3-pycrypto}/cross-compiling.patch (100%)

diff --git a/meta-python/recipes-devtools/python/python-pycrypto.inc b/meta-python/recipes-devtools/python/python-pycrypto.inc
deleted file mode 100644
index 232cdb7116..0000000000
--- a/meta-python/recipes-devtools/python/python-pycrypto.inc
+++ /dev/null
@@ -1,21 +0,0 @@
-DESCRIPTION = "Cryptographic modules for Python."
-HOMEPAGE = "http://www.pycrypto.org/"
-LICENSE = "PSFv2"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=35f354d199e8cb7667b059a23578e63d"
-
-FILESEXTRAPATHS_prepend := "${THISDIR}/python-pycrypto:"
-
-DEPENDS += " gmp"
-
-inherit pypi autotools-brokensep
-
-SRC_URI += "file://cross-compiling.patch \
-            file://CVE-2013-7459.patch \
-           "
-
-SRC_URI[md5sum] = "55a61a054aa66812daf5161a0d5d7eda"
-SRC_URI[sha256sum] = "f2ce1e989b272cfcb677616763e0a2e7ec659effa67a88aa92b3a65528f60a3c"
-
-do_compile[noexec] = "1"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-pycrypto/CVE-2013-7459.patch b/meta-python/recipes-devtools/python/python3-pycrypto/CVE-2013-7459.patch
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pycrypto/CVE-2013-7459.patch
rename to meta-python/recipes-devtools/python/python3-pycrypto/CVE-2013-7459.patch
diff --git a/meta-python/recipes-devtools/python/python-pycrypto/cross-compiling.patch b/meta-python/recipes-devtools/python/python3-pycrypto/cross-compiling.patch
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pycrypto/cross-compiling.patch
rename to meta-python/recipes-devtools/python/python3-pycrypto/cross-compiling.patch
diff --git a/meta-python/recipes-devtools/python/python3-pycrypto_2.6.1.bb b/meta-python/recipes-devtools/python/python3-pycrypto_2.6.1.bb
index a20eafec43..78a1ef2ac0 100644
--- a/meta-python/recipes-devtools/python/python3-pycrypto_2.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pycrypto_2.6.1.bb
@@ -1,7 +1,23 @@
-inherit distutils3
-require python-pycrypto.inc
+DESCRIPTION = "Cryptographic modules for Python."
+HOMEPAGE = "http://www.pycrypto.org/"
+LICENSE = "PSFv2"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=35f354d199e8cb7667b059a23578e63d"
 
-SRC_URI += "file://0001-Replace-time.clock-with-time.process_time.patch"
+DEPENDS += " gmp"
+
+export HOST_SYS
+
+inherit pypi autotools-brokensep distutils3
+
+SRC_URI += "file://cross-compiling.patch \
+            file://CVE-2013-7459.patch \
+            file://0001-Replace-time.clock-with-time.process_time.patch \
+           "
+
+SRC_URI[md5sum] = "55a61a054aa66812daf5161a0d5d7eda"
+SRC_URI[sha256sum] = "f2ce1e989b272cfcb677616763e0a2e7ec659effa67a88aa92b3a65528f60a3c"
+
+do_compile[noexec] = "1"
 
 # We explicitly call distutils_do_install, since we want it to run, but
 # *don't* want the autotools install to run, since this package doesn't
@@ -9,3 +25,5 @@ SRC_URI += "file://0001-Replace-time.clock-with-time.process_time.patch"
 do_install() {
        distutils3_do_install
 }
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

