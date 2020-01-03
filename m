Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 31E8B7FBAC
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Jan 2020 08:30:38 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,390,1571673600"; d="scan'208";a="81266698"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 03 Jan 2020 16:30:39 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 2A122406AB15
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Jan 2020 16:21:41 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Fri, 3 Jan 2020 16:30:35 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 3 Jan 2020 16:30:39 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 3 Jan 2020 04:57:32 -0800
Message-ID: <1578056252-94410-4-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1578056252-94410-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1578056252-94410-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 2A122406AB15.A0202
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python][PATCH] python-pyyaml: upgrade 5.1.2 -> 5.2
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
X-List-Received-Date: Fri, 03 Jan 2020 08:30:39 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-pyyaml.inc         | 4 ++--
 .../python/{python-pyyaml_5.1.2.bb => python-pyyaml_5.2.bb}   | 0
 .../python/{python3-pyyaml_5.1.2.bb => python3-pyyaml_5.2.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyyaml_5.1.2.bb => python-pyyaml_5.2.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pyyaml_5.1.2.bb => python3-pyyaml_5.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pyyaml.inc b/meta-python/recipes-devtools/python/python-pyyaml.inc
index e9ae85eb0..48ebf73c9 100644
--- a/meta-python/recipes-devtools/python/python-pyyaml.inc
+++ b/meta-python/recipes-devtools/python/python-pyyaml.inc
@@ -8,8 +8,8 @@ DEPENDS = "libyaml ${PYTHON_PN}-cython-native ${PYTHON_PN}"
 PYPI_PACKAGE = "PyYAML"
 inherit pypi
 
-SRC_URI[md5sum] = "20f87ab421b0271dbf371dc5c1cddb5c"
-SRC_URI[sha256sum] = "01adf0b6c6f61bd11af6e10ca52b7d4057dd0be0343eb9283c878cf3af56aee4"
+SRC_URI[md5sum] = "d7e45e932d6e6649ac574a1ed77b4269"
+SRC_URI[sha256sum] = "c0ee8eca2c582d29c3c2ec6e2c4f703d1b7f1fb10bc72317355a746057e7346c"
 
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-datetime \
diff --git a/meta-python/recipes-devtools/python/python-pyyaml_5.1.2.bb b/meta-python/recipes-devtools/python/python-pyyaml_5.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pyyaml_5.1.2.bb
rename to meta-python/recipes-devtools/python/python-pyyaml_5.2.bb
diff --git a/meta-python/recipes-devtools/python/python3-pyyaml_5.1.2.bb b/meta-python/recipes-devtools/python/python3-pyyaml_5.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pyyaml_5.1.2.bb
rename to meta-python/recipes-devtools/python/python3-pyyaml_5.2.bb
-- 
2.17.1




