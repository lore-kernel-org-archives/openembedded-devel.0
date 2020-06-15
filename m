Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.14597.1592217036078235942
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jun 2020 03:30:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=45690 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jkmNt-0002ty-HQ; Mon, 15 Jun 2020 13:30:35 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/7] python3-importlib-metadata: Consolidate in a single file
Date: Mon, 15 Jun 2020 13:30:15 +0300
Message-Id: <20200615103017.2714-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200615103017.2714-1-leon.anavi@konsulko.com>
References: <20200615103017.2714-1-leon.anavi@konsulko.com>
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
 .../python/python-importlib-metadata.inc          | 14 --------------
 .../python/python3-importlib-metadata_1.5.2.bb    | 15 ++++++++++++++-
 2 files changed, 14 insertions(+), 15 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-importlib-metadata.inc

diff --git a/meta-python/recipes-devtools/python/python-importlib-metadata.inc b/meta-python/recipes-devtools/python/python-importlib-metadata.inc
deleted file mode 100644
index b6165dc5b..000000000
--- a/meta-python/recipes-devtools/python/python-importlib-metadata.inc
+++ /dev/null
@@ -1,14 +0,0 @@
-DESCRIPTION = "Read metadata from Python packages"
-HOMEPAGE = "https://pypi.org/project/importlib-metadata/"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e88ae122f3925d8bde8319060f2ddb8e"
-
-SRC_URI = "https://files.pythonhosted.org/packages/d7/cd/3b1dffa46b19dac269d586b9d45090588a8bd7a5741602a369d45e1bdf65/importlib_metadata-1.5.2.tar.gz"
-S = "${WORKDIR}/importlib_metadata-${PV}"
-SRC_URI[md5sum] = "35a85a81c7d86605f4f49397f4e7e39c"
-SRC_URI[sha256sum] = "dfc83688553a91a786c6c91eeb5f3b1d31f24d71877bbd94ecbf5484e57690a2"
-
-DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
-RDEPENDS_${PN} += "${PYTHON_PN}-zipp ${PYTHON_PN}-pathlib2"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-importlib-metadata_1.5.2.bb b/meta-python/recipes-devtools/python/python3-importlib-metadata_1.5.2.bb
index 8a971dac0..5170855c2 100644
--- a/meta-python/recipes-devtools/python/python3-importlib-metadata_1.5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-importlib-metadata_1.5.2.bb
@@ -1,5 +1,18 @@
+DESCRIPTION = "Read metadata from Python packages"
+HOMEPAGE = "https://pypi.org/project/importlib-metadata/"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e88ae122f3925d8bde8319060f2ddb8e"
+
 inherit pypi setuptools3
-require python-importlib-metadata.inc
 
+SRC_URI = "https://files.pythonhosted.org/packages/d7/cd/3b1dffa46b19dac269d586b9d45090588a8bd7a5741602a369d45e1bdf65/importlib_metadata-1.5.2.tar.gz"
+S = "${WORKDIR}/importlib_metadata-${PV}"
+SRC_URI[md5sum] = "35a85a81c7d86605f4f49397f4e7e39c"
+SRC_URI[sha256sum] = "dfc83688553a91a786c6c91eeb5f3b1d31f24d71877bbd94ecbf5484e57690a2"
+
+DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
+RDEPENDS_${PN} += "${PYTHON_PN}-zipp ${PYTHON_PN}-pathlib2"
 RDEPENDS_${PN}_append_class-target = " python3-misc"
 RDEPENDS_${PN}_append_class-nativesdk = " python3-misc"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

