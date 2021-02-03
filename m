Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.10853.1612366710633129743
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Feb 2021 07:38:31 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=46228 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1l7KEe-0007tX-4Y; Wed, 03 Feb 2021 17:38:29 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-pytest-html: Upgrade 2.1.1 -> 3.1.1
Date: Wed,  3 Feb 2021 17:38:19 +0200
Message-Id: <20210203153822.25077-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210203153822.25077-1-leon.anavi@konsulko.com>
References: <20210203153822.25077-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-0.2
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

Upgrade to release 3.1.1:

- Fix issue with reporting of missing CSS files
- Stop attaching test reruns to final test report entries
- Allow for report duration formatting
- Respect --capture=no, --show-capture=no, and -s pytest flags
- Make the Results table Links column sortable
- Fix issue with missing image or video in extras
- Fix attribute name for compatibility with pytest-xdist 2
- Post process HTML generation to allow teardown to appear in the
  HTML output

License-Update: Following recent changes to README.rst, just use
LICENSE downloaded from PyPI.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-pytest-html_2.1.1.bb       | 24 -------------------
 .../python/python3-pytest-html_3.1.1.bb       | 18 ++++++++++++++
 2 files changed, 18 insertions(+), 24 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pytest-html_2.1.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pytest-html_3.1.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-pytest-html_2.1.1.bb b/meta-python/recipes-devtools/python/python3-pytest-html_2.1.1.bb
deleted file mode 100644
index 27b768155..000000000
--- a/meta-python/recipes-devtools/python/python3-pytest-html_2.1.1.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-DESCRIPTION = "pytest plugin for generating html reports from test results"
-DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
-
-LICENSE = "MPL-2.0"
-LIC_FILES_CHKSUM = "file://../pytest-html.LICENSE;md5=5d425c8f3157dbf212db2ec53d9e5132"
-
-# Per README.rst the license statement is fetched from
-# https://raw.githubusercontent.com/davehunt/pytest-html/master/LICENSE
-SRC_URI += "https://raw.githubusercontent.com/davehunt/pytest-html/master/LICENSE;name=license;downloadfilename=pytest-html.LICENSE"
-SRC_URI[license.md5sum] = "5d425c8f3157dbf212db2ec53d9e5132"
-SRC_URI[license.sha256sum] = "2bfdca60adf803108d4c7f009000bea76ad00e621e163197881b0eaae91b530e"
-
-SRC_URI[sha256sum] = "6a4ac391e105e391208e3eb9bd294a60dd336447fd8e1acddff3a6de7f4e57c5"
-
-
-PYPI_PACKAGE = "pytest-html"
-
-inherit pypi setuptools3
-
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-pytest \
-"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-pytest-html_3.1.1.bb b/meta-python/recipes-devtools/python/python3-pytest-html_3.1.1.bb
new file mode 100644
index 000000000..bd543d2f0
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pytest-html_3.1.1.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "pytest plugin for generating html reports from test results"
+DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
+
+LICENSE = "MPL-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5d425c8f3157dbf212db2ec53d9e5132"
+
+SRC_URI[sha256sum] = "3ee1cf319c913d19fe53aeb0bc400e7b0bc2dbeb477553733db1dad12eb75ee3"
+
+
+PYPI_PACKAGE = "pytest-html"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-pytest \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

