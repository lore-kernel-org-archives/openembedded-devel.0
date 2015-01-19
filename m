Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F1BD57229E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Jan 2015 21:07:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t0JL70sV014810
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Jan 2015 13:07:00 -0800 (PST)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 19 Jan 2015 13:06:59 -0800
From: Joe Slater <jslater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 19 Jan 2015 13:06:59 -0800
Message-ID: <1421701619-14831-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [meta-python][PATCH 1/1] python-ldap: move to version 2.4.10
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 19 Jan 2015 21:07:01 -0000
Content-Type: text/plain

Retain 2.3.9 in case configuration differences matter to
some people.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 .../recipes-devtools/python/python-ldap_2.4.10.bb  |   27 ++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-ldap_2.4.10.bb

diff --git a/meta-python/recipes-devtools/python/python-ldap_2.4.10.bb b/meta-python/recipes-devtools/python/python-ldap_2.4.10.bb
new file mode 100644
index 0000000..78a878a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-ldap_2.4.10.bb
@@ -0,0 +1,27 @@
+#
+# Copyright (C) 2012 Wind River Systems, Inc.
+#
+SUMMARY = "Provides a wrapper in Python to LDAP"
+DESCRIPTION = "This module provides access to the LDAP \
+(Lightweight Directory Access Protocol) through Python operations \
+instead of C API. The module mainly acts as a wrapper for the \
+OpenLDAP 2.x libraries. Errors will appear as exceptions."
+
+SECTION = "devel/python"
+PRIORITY = "optional"
+LICENSE = "PSF"
+HOMEPAGE = "http://www.python-ldap.org/"
+DEPENDS = "python openldap cyrus-sasl"
+
+SRC_URI = "http://pypi.python.org/packages/source/p/${PN}/${BPN}-${PV}.tar.gz"
+
+inherit setuptools
+
+LIC_FILES_CHKSUM = "file://LICENCE;md5=a41c82edffa04912007cae1d20cac555"
+SRC_URI[md5sum] = "a15827ca13c90e9101e5e9405c1d83be"
+SRC_URI[sha256sum] = "67cc7801bf24c29386ab99966ceb68d6a60fa9e0566cc95a4fbb2c4695a8ce54"
+
+do_configure_prepend() {
+    sed -i -e 's:^library_dirs =.*::' setup.cfg
+    sed -i -e 's:^include_dirs =.*:include_dirs = =/usr/include/sasl/:' setup.cfg
+}
-- 
1.7.9.5


