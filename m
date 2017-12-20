Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0505D6FF56
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Dec 2017 15:37:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vBKFb4TL014235
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 20 Dec 2017 07:37:05 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 20 Dec 2017 07:37:04 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 20 Dec 2017 10:36:59 -0500
Message-ID: <1513784219-1399-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-python][v2][PATCH] python-pyroute2: uprev to v0.4.21 (from 0.3.22)
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
X-List-Received-Date: Wed, 20 Dec 2017 15:37:05 -0000
Content-Type: text/plain

Drop the json<-->simplejson patch instead opting to depend on
python-json (part of core python libs). Beyond this the uprev is
straightforward.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---

**V2**
* Drop FILESEXTRAPATHS_prepend since it is now unused
* Restore RDEPENDS for stdlibs

 .../recipes-devtools/python/python-pyroute2.inc    | 12 ++++------
 .../import-simplejson-as-json.patch                | 26 ----------------------
 ...yroute2_0.3.22.bb => python-pyroute2_0.4.21.bb} |  0
 ...route2_0.3.22.bb => python3-pyroute2_0.4.21.bb} |  0
 4 files changed, 4 insertions(+), 34 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pyroute2/import-simplejson-as-json.patch
 rename meta-python/recipes-devtools/python/{python-pyroute2_0.3.22.bb => python-pyroute2_0.4.21.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pyroute2_0.3.22.bb => python3-pyroute2_0.4.21.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pyroute2.inc b/meta-python/recipes-devtools/python/python-pyroute2.inc
index da1d4cd..4b43a27 100644
--- a/meta-python/recipes-devtools/python/python-pyroute2.inc
+++ b/meta-python/recipes-devtools/python/python-pyroute2.inc
@@ -1,20 +1,16 @@
 SUMMARY = "A pure Python netlink and Linux network configuration library"
 LICENSE = "GPLv2 & Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL.v2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://LICENSE.Apache.v2;md5=3b83ef96387f14655fc854ddc3c6bd57"
+                    file://LICENSE.Apache.v2;md5=34281e312165f843a2b7d1f114fe65ce"
 
-SRC_URI[md5sum] = "733adb362b6603c7269c0b3df3045a55"
-SRC_URI[sha256sum] = "5cdf44656cf623369f0cbf183d9d14a1a50ebdffbd50d4e30ffda62c0a05d7b3"
-
-SRC_URI += "file://import-simplejson-as-json.patch"
-
-FILESEXTRAPATHS_prepend := "${THISDIR}/python-pyroute2:"
+SRC_URI[md5sum] = "9c251543c4282a2f8b1a8d6aa8afc688"
+SRC_URI[sha256sum] = "7afad28ee0a0f3e7c34adaa9f953d00560ed9910203e93f107833b6e8d151171"
 
 inherit pypi
 
 RDEPENDS_${PN} += "\
   ${PYTHON_PN}-distutils \
-  ${PYTHON_PN}-simplejson \
+  ${PYTHON_PN}-json \
   ${PYTHON_PN}-multiprocessing \
   ${PYTHON_PN}-io ${PYTHON_PN}-pprint \
   ${PYTHON_PN}-pickle \
diff --git a/meta-python/recipes-devtools/python/python-pyroute2/import-simplejson-as-json.patch b/meta-python/recipes-devtools/python/python-pyroute2/import-simplejson-as-json.patch
deleted file mode 100644
index d73da07..0000000
--- a/meta-python/recipes-devtools/python/python-pyroute2/import-simplejson-as-json.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-Upstream-Status: Inappropriate [wrong dependency]
-
-Subject: [PATCH] import simplejson as json
-
-At runtime python-pyroute2 tries to import json, but the module is not 
-available, import simplejson as json solve the issue.
-
-Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
----
- pyroute2/netlink/rtnl/ifinfmsg.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/pyroute2/netlink/rtnl/ifinfmsg.py b/pyroute2/netlink/rtnl/ifinfmsg.py
-index 4f14f25..55643eb 100644
---- a/pyroute2/netlink/rtnl/ifinfmsg.py
-+++ b/pyroute2/netlink/rtnl/ifinfmsg.py
-@@ -1,5 +1,5 @@
- import os
--import json
-+import simplejson as json
- import errno
- import select
- import struct
--- 
-2.1.4
-
diff --git a/meta-python/recipes-devtools/python/python-pyroute2_0.3.22.bb b/meta-python/recipes-devtools/python/python-pyroute2_0.4.21.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pyroute2_0.3.22.bb
rename to meta-python/recipes-devtools/python/python-pyroute2_0.4.21.bb
diff --git a/meta-python/recipes-devtools/python/python3-pyroute2_0.3.22.bb b/meta-python/recipes-devtools/python/python3-pyroute2_0.4.21.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pyroute2_0.3.22.bb
rename to meta-python/recipes-devtools/python/python3-pyroute2_0.4.21.bb
-- 
2.7.4


