Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.3437.1592471049803321000
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Jun 2020 02:04:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=59970 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jlqSt-0004oK-ID; Thu, 18 Jun 2020 12:04:08 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-periphery: Consolidate in a single file
Date: Thu, 18 Jun 2020 12:03:57 +0300
Message-Id: <20200618090358.31927-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200618090358.31927-1-leon.anavi@konsulko.com>
References: <20200618090358.31927-1-leon.anavi@konsulko.com>
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

Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../recipes-devtools/python/python-periphery.inc    |  9 ---------
 .../python/python3-periphery_2.0.1.bb               | 13 +++++++++++--
 2 files changed, 11 insertions(+), 11 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-periphery.inc

diff --git a/meta-python/recipes-devtools/python/python-periphery.inc b/meta-python/recipes-devtools/python/python-periphery.inc
deleted file mode 100644
index 0171f63f8..000000000
--- a/meta-python/recipes-devtools/python/python-periphery.inc
+++ /dev/null
@@ -1,9 +0,0 @@
-DESCRIPTION = "A pure Python 2/3 library for peripheral I/O (GPIO, LED, PWM, SPI, I2C, MMIO, Serial) in Linux."
-HOMEPAGE = "http://pythonhosted.org/python-periphery/"
-LICENSE = "MIT"
-
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=1ecf5c2354c22fb5bfd53eefb8f9e65b"
-
-PYPI_PACKAGE = "python-periphery"
-
-RDEPENDS_${PN} += "${PYTHON_PN}-mmap"
diff --git a/meta-python/recipes-devtools/python/python3-periphery_2.0.1.bb b/meta-python/recipes-devtools/python/python3-periphery_2.0.1.bb
index e9944274b..1aa48625f 100644
--- a/meta-python/recipes-devtools/python/python3-periphery_2.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-periphery_2.0.1.bb
@@ -1,5 +1,14 @@
-inherit pypi setuptools3
-require python-periphery.inc
+DESCRIPTION = "A pure Python 2/3 library for peripheral I/O (GPIO, LED, PWM, SPI, I2C, MMIO, Serial) in Linux."
+HOMEPAGE = "http://pythonhosted.org/python-periphery/"
+LICENSE = "MIT"
+
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=1ecf5c2354c22fb5bfd53eefb8f9e65b"
 
 SRC_URI[md5sum] = "1d958f02575d4a19734ee2dd92336157"
 SRC_URI[sha256sum] = "5da4d5f40ff8974cf6c724587baa674d7e0593f07b6f6ee896104f11c1be18ec"
+
+inherit pypi setuptools3
+
+PYPI_PACKAGE = "python-periphery"
+
+RDEPENDS_${PN} += "${PYTHON_PN}-mmap"
-- 
2.17.1

