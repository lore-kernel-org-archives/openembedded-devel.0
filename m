Return-Path: <yuanc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 22C0B6010B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Aug 2019 02:13:16 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,403,1559491200"; d="scan'208";a="73858766"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 19 Aug 2019 10:13:15 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 25C334CE03CA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Aug 2019 10:13:12 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 19 Aug 2019 10:13:16 +0800
From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 19 Aug 2019 10:12:34 +0800
Message-ID: <20190819021234.1470-1-yuanc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 25C334CE03CA.A8050
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yuanc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH v2] python-flask-pymongo: upgrade 0.5.1 -> 2.3.0
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
X-List-Received-Date: Mon, 19 Aug 2019 02:13:18 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add depends of python-vcversioner and python3-vcversioner.

Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-flask-pymongo.inc        | 6 ++++--
 ...{python-flask-pymongo_0.5.1.bb => python-flask-pymongo_2.3.0.bb} | 0
 ...ython3-flask-pymongo_0.5.1.bb => python3-flask-pymongo_2.3.0.bb} | 0
 3 files changed, 4 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-flask-pymongo_0.5.1.bb => python-flask-pymongo_2.3.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-flask-pymongo_0.5.1.bb => python3-flask-pymongo_2.3.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-flask-pymongo.inc b/meta-python/recipes-devtools/python/python-flask-pymongo.inc
index fb2d6ed..bc41fd2 100644
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
 
+DEPENDS = "python-vcversioner python-vcversioner-native python3-vcversioner python3-vcversioner-native"
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
2.7.4




