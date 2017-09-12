Return-Path: <pascal.bach@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id B77F378511
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Sep 2017 16:24:36 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id v8CGOaU1025199
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Sep 2017 18:24:36 +0200
Received: from dev.sbt.siemens.com (MD1FZU9C.ad001.siemens.net [139.16.76.177])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id v8CGOa90016788;
	Tue, 12 Sep 2017 18:24:36 +0200
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Sep 2017 18:24:32 +0200
Message-Id: <1505233472-10700-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-python][PATCH] python-jsonschema, python3-jsonschema: add vcversioner-native dependency
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
X-List-Received-Date: Tue, 12 Sep 2017 16:24:37 -0000

If not added the setup.py will complain that it can't find
vcversioner. The non native dependency is not working as the module is
required during compilation not at runtime.

Also the dependency is required for both the Python 2 and Python 3 version

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 meta-python/recipes-devtools/python/python-jsonschema.inc       | 2 ++
 meta-python/recipes-devtools/python/python3-jsonschema_2.6.0.bb | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python-jsonschema.inc b/meta-python/recipes-devtools/python/python-jsonschema.inc
index 74933f5..db57c69 100644
--- a/meta-python/recipes-devtools/python/python-jsonschema.inc
+++ b/meta-python/recipes-devtools/python/python-jsonschema.inc
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7a60a81c146ec25599a3e1dabb8610a8"
 SRC_URI[md5sum] = "50c6b69a373a8b55ff1e0ec6e78f13f4"
 SRC_URI[sha256sum] = "6ff5f3180870836cae40f06fa10419f557208175f13ad7bc26caa77beb1f6e02"
 
+DEPENDS += "${PYTHON_PN}-vcversioner-native"
+
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-core \
     ${PYTHON_PN}-io \
diff --git a/meta-python/recipes-devtools/python/python3-jsonschema_2.6.0.bb b/meta-python/recipes-devtools/python/python3-jsonschema_2.6.0.bb
index 53b8839..5aaee68 100644
--- a/meta-python/recipes-devtools/python/python3-jsonschema_2.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-jsonschema_2.6.0.bb
@@ -1,8 +1,6 @@
 inherit pypi setuptools3
 require python-jsonschema.inc
 
-DEPENDS += "python3-vcversioner"
-
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-misc \
 "
-- 
2.1.4


