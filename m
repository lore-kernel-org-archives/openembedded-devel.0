Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.28481.1591618469568750788
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jun 2020 05:14:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=50432 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jiGfc-0005b8-7R; Mon, 08 Jun 2020 15:14:29 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/7] python3-hyperlink: Consolidate in a single file
Date: Mon,  8 Jun 2020 15:14:06 +0300
Message-Id: <20200608121410.5814-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200608121410.5814-1-leon.anavi@konsulko.com>
References: <20200608121410.5814-1-leon.anavi@konsulko.com>
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
 .../python/python-hyperlink.inc               | 17 -----------------
 .../python/python3-hyperlink_19.0.0.bb        | 19 +++++++++++++++++--
 2 files changed, 17 insertions(+), 19 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-hyperlink.inc

diff --git a/meta-python/recipes-devtools/python/python-hyperlink.inc b/meta-python/recipes-devtools/python/python-hyperlink.inc
deleted file mode 100644
index 653170ca6..000000000
--- a/meta-python/recipes-devtools/python/python-hyperlink.inc
+++ /dev/null
@@ -1,17 +0,0 @@
-DESCRIPTION = "A featureful, correct URL for Python"
-HOMEPAGE = "https://github.com/python-hyper/hyperlink"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3893d4ed05dcc823f8ed685a9ea19bcb"
-
-SRC_URI[sha256sum] = "4288e34705da077fada1111a24a0aa08bb1e76699c9ce49876af722441845654"
-SRC_URI[md5sum] = "4772fb4d87c26a1ab22a6161424e3cba"
-
-inherit pypi
-
-RDEPENDS_${PN} += "${PYTHON_PN}-stringold ${PYTHON_PN}-netclient ${PYTHON_PN}-idna"
-
-PACKAGES =. "${PN}-test "
-
-FILES_${PN}-test += " \
-        ${PYTHON_SITEPACKAGES_DIR}/hyperlinkt/test \
-"
diff --git a/meta-python/recipes-devtools/python/python3-hyperlink_19.0.0.bb b/meta-python/recipes-devtools/python/python3-hyperlink_19.0.0.bb
index 70813bf34..3ee098ad6 100644
--- a/meta-python/recipes-devtools/python/python3-hyperlink_19.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-hyperlink_19.0.0.bb
@@ -1,2 +1,17 @@
-inherit setuptools3
-require python-hyperlink.inc
+DESCRIPTION = "A featureful, correct URL for Python"
+HOMEPAGE = "https://github.com/python-hyper/hyperlink"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3893d4ed05dcc823f8ed685a9ea19bcb"
+
+SRC_URI[sha256sum] = "4288e34705da077fada1111a24a0aa08bb1e76699c9ce49876af722441845654"
+SRC_URI[md5sum] = "4772fb4d87c26a1ab22a6161424e3cba"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += "${PYTHON_PN}-stringold ${PYTHON_PN}-netclient ${PYTHON_PN}-idna"
+
+PACKAGES =. "${PN}-test "
+
+FILES_${PN}-test += " \
+        ${PYTHON_SITEPACKAGES_DIR}/hyperlinkt/test \
+"
-- 
2.17.1

