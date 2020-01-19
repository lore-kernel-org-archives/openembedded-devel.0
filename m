Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 711507FC41
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Jan 2020 05:25:07 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,336,1574092800"; d="scan'208";a="82252301"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 19 Jan 2020 13:25:07 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 847085010EB0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Jan 2020 13:15:56 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Sun, 19 Jan 2020 13:25:08 +0800
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Sun, 19 Jan 2020 13:25:06 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 19 Jan 2020 13:26:36 +0800
Message-ID: <20200119052636.3450-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 847085010EB0.A61CD
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-pyyaml: upgrade 5.2 -> 5.3
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
X-List-Received-Date: Sun, 19 Jan 2020 05:25:07 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-pyyaml.inc         | 4 ++--
 .../python/{python-pyyaml_5.2.bb => python-pyyaml_5.3.bb}     | 0
 .../python/{python3-pyyaml_5.2.bb => python3-pyyaml_5.3.bb}   | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyyaml_5.2.bb => python-pyyaml_5.3.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pyyaml_5.2.bb => python3-pyyaml_5.3.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pyyaml.inc b/meta-python/recipes-devtools/python/python-pyyaml.inc
index 48ebf73c9..aede58530 100644
--- a/meta-python/recipes-devtools/python/python-pyyaml.inc
+++ b/meta-python/recipes-devtools/python/python-pyyaml.inc
@@ -8,8 +8,8 @@ DEPENDS = "libyaml ${PYTHON_PN}-cython-native ${PYTHON_PN}"
 PYPI_PACKAGE = "PyYAML"
 inherit pypi
 
-SRC_URI[md5sum] = "d7e45e932d6e6649ac574a1ed77b4269"
-SRC_URI[sha256sum] = "c0ee8eca2c582d29c3c2ec6e2c4f703d1b7f1fb10bc72317355a746057e7346c"
+SRC_URI[md5sum] = "adbb0d336b509d6472d3b095a0f1cf30"
+SRC_URI[sha256sum] = "e9f45bd5b92c7974e59bcd2dcc8631a6b6cc380a904725fce7bc08872e691615"
 
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-datetime \
diff --git a/meta-python/recipes-devtools/python/python-pyyaml_5.2.bb b/meta-python/recipes-devtools/python/python-pyyaml_5.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pyyaml_5.2.bb
rename to meta-python/recipes-devtools/python/python-pyyaml_5.3.bb
diff --git a/meta-python/recipes-devtools/python/python3-pyyaml_5.2.bb b/meta-python/recipes-devtools/python/python3-pyyaml_5.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pyyaml_5.2.bb
rename to meta-python/recipes-devtools/python/python3-pyyaml_5.3.bb
-- 
2.20.1




