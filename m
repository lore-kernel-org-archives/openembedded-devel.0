Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C45AD70904
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jul 2014 07:44:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s6U7iBES027549
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jul 2014 00:44:11 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Wed, 30 Jul 2014 00:44:10 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 30 Jul 2014 15:44:13 +0800
Message-ID: <1406706254-7799-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH v2][meta-python] python-slip-dbus: add recipe
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
X-List-Received-Date: Wed, 30 Jul 2014 07:44:19 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../python/python-slip-dbus_0.6.0.bb               |   27 ++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 meta-python/recipes-python/python/python-slip-dbus_0.6.0.bb

diff --git a/meta-python/recipes-python/python/python-slip-dbus_0.6.0.bb b/meta-python/recipes-python/python/python-slip-dbus_0.6.0.bb
new file mode 100644
index 0000000..d091336
--- /dev/null
+++ b/meta-python/recipes-python/python/python-slip-dbus_0.6.0.bb
@@ -0,0 +1,27 @@
+SUMMARY = "Convenience functions for dbus services in Python 2.x"
+HOMEPAGE = "http://nphilipp.fedorapeople.org/python-slip/"
+DESCRIPTION = "\
+The Simple Library for Python 2.x packages contain miscellaneous code for \
+convenience, extension and workaround purposes. \
+\
+This package provides slip.dbus.service.Object, which is a dbus.service.Object \
+derivative that ends itself after a certain time without being used and/or if \
+there are no clients anymore on the message bus, as well as convenience \
+functions and decorators for integrating a dbus service with PolicyKit."
+
+SECTION = "devel/python"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=5574c6965ae5f583e55880e397fbb018"
+SRCNAME = "python-slip"
+
+SRC_URI = "https://fedorahosted.org/released/python-slip/${SRCNAME}-${PV}.tar.bz2"
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
+
+SRC_URI[md5sum] = "fb3299d75af1a67ca6679d96ce839da6"
+SRC_URI[sha256sum] = "f47361ec52b608309b83c71905e692b6b363eaf3b8a7afdeff866cd94463ad5c"
+
+do_compile_prepend() {
+    sed -e 's/@VERSION@/${PV}/g' setup.py.in > setup.py
+}
-- 
1.7.10.4


