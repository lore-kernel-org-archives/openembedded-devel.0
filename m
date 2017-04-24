Return-Path: <pascal.bach@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id BFB8971D9E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Apr 2017 08:36:19 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id v3O8aKbT014953
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Mon, 24 Apr 2017 10:36:20 +0200
Received: from dev.sbt.siemens.com ([139.16.73.49])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id v3O8aKns022212;
	Mon, 24 Apr 2017 10:36:20 +0200
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Apr 2017 10:36:15 +0200
Message-Id: <1493022975-20228-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
Cc: Pascal Bach <pascal.bach@nextrem.ch>
Subject: [meta-python][PATCH] python-pytz, python3-pytz: update to 2017.2
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
X-List-Received-Date: Mon, 24 Apr 2017 08:36:22 -0000

From: Pascal Bach <pascal.bach@nextrem.ch>

- License checksum changed due to copyright year update to 2017.
- Source package extension changed form to zip.

Signed-off-by: Pascal Bach <pascal.bach@nextrem.ch>
---
 meta-python/recipes-devtools/python/python-pytz.inc                | 7 ++++---
 .../python/{python-pytz_2016.10.bb => python-pytz_2017.2.bb}       | 0
 .../python/{python3-pytz_2016.10.bb => python3-pytz_2017.2.bb}     | 0
 3 files changed, 4 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pytz_2016.10.bb => python-pytz_2017.2.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pytz_2016.10.bb => python3-pytz_2017.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pytz.inc b/meta-python/recipes-devtools/python/python-pytz.inc
index 17ffbfd..1c6564b 100644
--- a/meta-python/recipes-devtools/python/python-pytz.inc
+++ b/meta-python/recipes-devtools/python/python-pytz.inc
@@ -1,12 +1,13 @@
 SUMMARY = "World timezone definitions, modern and historical"
 HOMEPAGE = "http://pythonhosted.org/pytz"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=22b38951eb857cf285a4560a914b7cd6"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=39ea92752a35cf67d8a885d8e3af3c69"
 
 inherit pypi
+PYPI_PACKAGE_EXT = "zip"
 
-SRC_URI[md5sum] = "cc9f16ba436efabdcef3c4d32ae4919c"
-SRC_URI[sha256sum] = "9a43e20aa537cfad8fe7a1715165c91cb4a6935d40947f2d070e4c80f2dcd22b"
+SRC_URI[md5sum] = "f89bde8a811c8a1a5bac17eaaa94383c"
+SRC_URI[sha256sum] = "f5c056e8f62d45ba8215e5cb8f50dfccb198b4b9fbea8500674f3443e4689589"
 
 RDEPENDS_${PN}_class-target += "\
     ${PYTHON_PN}-datetime \
diff --git a/meta-python/recipes-devtools/python/python-pytz_2016.10.bb b/meta-python/recipes-devtools/python/python-pytz_2017.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pytz_2016.10.bb
rename to meta-python/recipes-devtools/python/python-pytz_2017.2.bb
diff --git a/meta-python/recipes-devtools/python/python3-pytz_2016.10.bb b/meta-python/recipes-devtools/python/python3-pytz_2017.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pytz_2016.10.bb
rename to meta-python/recipes-devtools/python/python3-pytz_2017.2.bb
-- 
2.1.4


