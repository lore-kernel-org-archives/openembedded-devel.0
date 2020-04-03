Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.6549.1585901757890885507
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Apr 2020 01:15:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=45474 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jKHUZ-0006Wi-1K; Fri, 03 Apr 2020 11:15:55 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python-smbus2: Add new recipe
Date: Fri,  3 Apr 2020 11:15:46 +0300
Message-Id: <1585901748-16446-1-git-send-email-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.7.4
X-OutGoing-Spam-Status: No, score=-1.0
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

Drop-in replacement for smbus-cffi/smbus-python in pure Python.
It is another implementation of the python-smbus package.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 meta-python/recipes-devtools/python/python-smbus2.inc | 19 +++++++++++++++++++
 .../recipes-devtools/python/python3-smbus2_0.3.0.bb   |  2 ++
 2 files changed, 21 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-smbus2.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-smbus2_0.3.0.bb

diff --git a/meta-python/recipes-devtools/python/python-smbus2.inc b/meta-python/recipes-devtools/python/python-smbus2.inc
new file mode 100644
index 0000000..0bab1a4
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-smbus2.inc
@@ -0,0 +1,19 @@
+SUMMARY = "Drop-in replacement for smbus-cffi/smbus-python in pure Python"
+DESCRIPTION = "smbus2 is a drop-in replacement for smbus-cffi/smbus-python in pure Python"
+HOMEPAGE = "https://github.com/kplindegaard/smbus2"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+SRC_URI[md5sum] = "d5ed5acc889b4770a84cc932853ed20a"
+SRC_URI[sha256sum] = "210e66eebe4d0b1fe836b3ec2751841942e1c4918c0b429b20a0e20a222228b4"
+
+CLEANBROKEN = "1"
+
+PYPI_PACKAGE = "smbus2"
+
+RDEPENDS_${PN} = "${PYTHON_PN}-ctypes ${PYTHON_PN}-fcntl"
+
+RDEPENDS_${PN} += "\
+	${PYTHON_PN}-ctypes \
+	${PYTHON_PN}-fcntl \
+"
diff --git a/meta-python/recipes-devtools/python/python3-smbus2_0.3.0.bb b/meta-python/recipes-devtools/python/python3-smbus2_0.3.0.bb
new file mode 100644
index 0000000..6149e35
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-smbus2_0.3.0.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools3
+require python-smbus2.inc
-- 
2.7.4

