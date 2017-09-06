Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2CCF377B95
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Sep 2017 19:29:40 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v86JTfGM022126
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 6 Sep 2017 12:29:41 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 6 Sep 2017 12:29:40 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 6 Sep 2017 14:23:09 -0500
Message-ID: <1504725809-12825-12-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1504725809-12825-1-git-send-email-mark.hatle@windriver.com>
References: <1504725809-12825-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 11/31] python-ldap: Move to meta-networking, requires cyrus-sasl
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Sep 2017 19:29:40 -0000
Content-Type: text/plain

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../recipes-devtools/python/python-ldap_2.4.41.bb  | 29 ++++++++++++++++++++++
 .../recipes-devtools/python/python-ldap_2.4.41.bb  | 29 ----------------------
 2 files changed, 29 insertions(+), 29 deletions(-)
 create mode 100644 meta-networking/recipes-devtools/python/python-ldap_2.4.41.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-ldap_2.4.41.bb

diff --git a/meta-networking/recipes-devtools/python/python-ldap_2.4.41.bb b/meta-networking/recipes-devtools/python/python-ldap_2.4.41.bb
new file mode 100644
index 0000000..3dbc8b1
--- /dev/null
+++ b/meta-networking/recipes-devtools/python/python-ldap_2.4.41.bb
@@ -0,0 +1,29 @@
+#
+# Copyright (C) 2012 Wind River Systems, Inc.
+#
+SUMMARY = "Provides a wrapper in Python to LDAP"
+DESCRIPTION = "This module provides access to the LDAP \
+(Lightweight Directory Access Protocol) through Python operations \
+instead of C API. The module mainly acts as a wrapper for the \
+OpenLDAP 2.x libraries. Errors will appear as exceptions."
+
+LICENSE = "PSF"
+HOMEPAGE = "http://www.python-ldap.org/"
+DEPENDS = "python openldap cyrus-sasl"
+
+PYPI_PACKAGE = "python-ldap"
+inherit pypi setuptools
+
+LIC_FILES_CHKSUM = "file://LICENCE;md5=a41c82edffa04912007cae1d20cac555"
+SRC_URI[md5sum] = "18db2d009150ec1864710fea3ed76173"
+SRC_URI[sha256sum] = "6d430ecf040f2fc704ee316d3390cb1f5419c191371e1e131baef54a0e42cef0"
+
+do_configure_prepend() {
+    sed -i -e 's:^library_dirs =.*::' setup.cfg
+    sed -i -e 's:^include_dirs =.*:include_dirs = =/usr/include/sasl/:' setup.cfg
+}
+
+RDEPENDS_${PN} = " \
+    ${PYTHON_PN}-pprint \
+    ${PYTHON_PN}-threading \
+"
diff --git a/meta-python/recipes-devtools/python/python-ldap_2.4.41.bb b/meta-python/recipes-devtools/python/python-ldap_2.4.41.bb
deleted file mode 100644
index 3dbc8b1..0000000
--- a/meta-python/recipes-devtools/python/python-ldap_2.4.41.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-#
-# Copyright (C) 2012 Wind River Systems, Inc.
-#
-SUMMARY = "Provides a wrapper in Python to LDAP"
-DESCRIPTION = "This module provides access to the LDAP \
-(Lightweight Directory Access Protocol) through Python operations \
-instead of C API. The module mainly acts as a wrapper for the \
-OpenLDAP 2.x libraries. Errors will appear as exceptions."
-
-LICENSE = "PSF"
-HOMEPAGE = "http://www.python-ldap.org/"
-DEPENDS = "python openldap cyrus-sasl"
-
-PYPI_PACKAGE = "python-ldap"
-inherit pypi setuptools
-
-LIC_FILES_CHKSUM = "file://LICENCE;md5=a41c82edffa04912007cae1d20cac555"
-SRC_URI[md5sum] = "18db2d009150ec1864710fea3ed76173"
-SRC_URI[sha256sum] = "6d430ecf040f2fc704ee316d3390cb1f5419c191371e1e131baef54a0e42cef0"
-
-do_configure_prepend() {
-    sed -i -e 's:^library_dirs =.*::' setup.cfg
-    sed -i -e 's:^include_dirs =.*:include_dirs = =/usr/include/sasl/:' setup.cfg
-}
-
-RDEPENDS_${PN} = " \
-    ${PYTHON_PN}-pprint \
-    ${PYTHON_PN}-threading \
-"
-- 
1.8.3.1


