Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web10.2158.1589320293678458120
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2020 14:51:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: trevor.gamblin@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 04CLpWDA014331
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2020 14:51:33 -0700 (PDT)
Received: from yow-tgamblin-fedora2.wrs.com (128.224.56.206) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
 14.3.487.0; Tue, 12 May 2020 14:51:32 -0700
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <randy.macleod@windriver.com>
Subject: [meta-python][PATCH] python3-dbusmock: re-add recipe and fix patch path
Date: Tue, 12 May 2020 17:51:31 -0400
Message-ID: <20200512215131.4000236-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Running the "non-gpl3" builder in my local autobuilder fails
almost immediately because python3-dbusmock is not available. It
appears that during the creation of meta-python2 and cleanup of
meta-python that the recipe for python3-dbusmock got removed
entirely, so I've re-added it, and renamed the corresponding
patch folder so that it can find the patches listed in the
recipe.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 ...y-to-add-own-objects-to-internal-obj.patch |  0
 ...ty-to-import-templates-from-packages.patch |  0
 .../python/python3-dbusmock_0.16.7.bb         | 25 +++++++++++++++++++
 3 files changed, 25 insertions(+)
 rename meta-python/recipes-devtools/python/{python-dbusmock => python3-dbusmock}/0001-Add-functionality-to-add-own-objects-to-internal-obj.patch (100%)
 rename meta-python/recipes-devtools/python/{python-dbusmock => python3-dbusmock}/0002-Add-possibility-to-import-templates-from-packages.patch (100%)
 create mode 100644 meta-python/recipes-devtools/python/python3-dbusmock_0.16.7.bb

diff --git a/meta-python/recipes-devtools/python/python-dbusmock/0001-Add-functionality-to-add-own-objects-to-internal-obj.patch b/meta-python/recipes-devtools/python/python3-dbusmock/0001-Add-functionality-to-add-own-objects-to-internal-obj.patch
similarity index 100%
rename from meta-python/recipes-devtools/python/python-dbusmock/0001-Add-functionality-to-add-own-objects-to-internal-obj.patch
rename to meta-python/recipes-devtools/python/python3-dbusmock/0001-Add-functionality-to-add-own-objects-to-internal-obj.patch
diff --git a/meta-python/recipes-devtools/python/python-dbusmock/0002-Add-possibility-to-import-templates-from-packages.patch b/meta-python/recipes-devtools/python/python3-dbusmock/0002-Add-possibility-to-import-templates-from-packages.patch
similarity index 100%
rename from meta-python/recipes-devtools/python/python-dbusmock/0002-Add-possibility-to-import-templates-from-packages.patch
rename to meta-python/recipes-devtools/python/python3-dbusmock/0002-Add-possibility-to-import-templates-from-packages.patch
diff --git a/meta-python/recipes-devtools/python/python3-dbusmock_0.16.7.bb b/meta-python/recipes-devtools/python/python3-dbusmock_0.16.7.bb
new file mode 100644
index 000000000..cd760ab89
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-dbusmock_0.16.7.bb
@@ -0,0 +1,25 @@
+# Copyright (c) 2014 LG Electronics, Inc.
+
+SUMMARY = "With this program/Python library you can easily create mock objects on D-Bus"
+AUTHOR = "Martin Pitt <martin.pitt@ubuntu.com>"
+
+LICENSE = "GPL-3.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02"
+
+SRC_URI[md5sum] = "80f8caa838fad96483a8751e11d384f9"
+SRC_URI[sha256sum] = "2d2ea892fa4633c3ec6ac1e912120ec493047a5c6522849b7d1c95ad755bce75"
+
+SRC_URI += " \
+    file://0001-Add-functionality-to-add-own-objects-to-internal-obj.patch \
+    file://0002-Add-possibility-to-import-templates-from-packages.patch \
+"
+
+PYPI_PACKAGE = "python-dbusmock"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-dbus \
+    ${PYTHON_PN}-pygobject \
+    ${PYTHON_PN}-xml \
+    "
-- 
2.25.4

