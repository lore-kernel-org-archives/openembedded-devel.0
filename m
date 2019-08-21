Return-Path: <yuanc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 3F6177CE86
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Aug 2019 05:34:28 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,411,1559491200"; d="scan'208";a="73987140"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 21 Aug 2019 13:34:27 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id CE21F4CE03E6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Aug 2019 13:34:20 +0800 (CST)
Received: from localhost.localdomain (10.167.225.21) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 21 Aug 2019 13:34:24 +0800
From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 21 Aug 2019 14:33:45 +0900
Message-ID: <20190821053345.112245-1-yuanc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-Originating-IP: [10.167.225.21]
X-yoursite-MailScanner-ID: CE21F4CE03E6.A0875
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yuanc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH v3] python-flask-pymongo: upgrade 0.5.1 -> 2.3.0
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
X-List-Received-Date: Wed, 21 Aug 2019 05:34:30 -0000
Content-Type: text/plain

Add depends of vcversioner.

Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-flask-pymongo.inc        | 6 ++++--
 ...flask-pymongo_0.5.1.bb => python-flask-pymongo_2.3.0.bb} | 0
 ...lask-pymongo_0.5.1.bb => python3-flask-pymongo_2.3.0.bb} | 0
 3 files changed, 4 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-flask-pymongo_0.5.1.bb => python-flask-pymongo_2.3.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-flask-pymongo_0.5.1.bb => python3-flask-pymongo_2.3.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-flask-pymongo.inc b/meta-python/recipes-devtools/python/python-flask-pymongo.inc
index fb2d6ed8b..39251525b 100644
--- a/meta-python/recipes-devtools/python/python-flask-pymongo.inc
+++ b/meta-python/recipes-devtools/python/python-flask-pymongo.inc
@@ -5,9 +5,11 @@ SECTION = "devel/python"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://flask_pymongo/wrappers.py;beginline=1;endline=24;md5=424c4e1047d28e01b4e4634a069c019d"
 
-SRC_URI[md5sum] = "d7a1b717f27154e1f3a355f8ec2467d6"
-SRC_URI[sha256sum] = "2baaa2ba5107d72b3a8bd4b5c0c8881316e35340ad1ae979cc13f1f3c8843b3d"
+SRC_URI[md5sum] = "94df71e6800b1d7915cc91a74b70f959"
+SRC_URI[sha256sum] = "620eb02dc8808a5fcb90f26cab6cba9d6bf497b15032ae3ca99df80366e33314"
 
 PYPI_PACKAGE = "Flask-PyMongo"
 
+DEPENDS = "${PYTHON_PN}-vcversioner ${PYTHON_PN}-vcversioner-native"
+
 RDEPENDS_${PN} = "${PYTHON_PN}-pymongo ${PYTHON_PN}-flask"
diff --git a/meta-python/recipes-devtools/python/python-flask-pymongo_0.5.1.bb b/meta-python/recipes-devtools/python/python-flask-pymongo_2.3.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-flask-pymongo_0.5.1.bb
rename to meta-python/recipes-devtools/python/python-flask-pymongo_2.3.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-flask-pymongo_0.5.1.bb b/meta-python/recipes-devtools/python/python3-flask-pymongo_2.3.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-flask-pymongo_0.5.1.bb
rename to meta-python/recipes-devtools/python/python3-flask-pymongo_2.3.0.bb
-- 
2.17.1




