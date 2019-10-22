Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id C3CF27CE27
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 01:27:47 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.67,325,1566835200"; d="scan'208";a="77294673"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 22 Oct 2019 09:27:47 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id C81D54B6EC89
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 09:19:54 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 22 Oct 2019 09:27:49 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 22 Oct 2019 09:27:59 +0800
Message-ID: <20191022012759.12376-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: C81D54B6EC89.AA7AD
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-ipaddress: upgrade 1.0.22 -> 1.0.23
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
X-List-Received-Date: Tue, 22 Oct 2019 01:27:48 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Add python3 version.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/{python-ipaddress_1.0.22.bb => python-ipaddress.inc}   | 8 ++++----
 meta-python/recipes-devtools/python/python-ipaddress_1.0.23.bb    | 2 ++
 meta-python/recipes-devtools/python/python3-ipaddress_1.0.23.bb   | 2 ++
 3 files changed, 8 insertions(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python-ipaddress_1.0.22.bb => python-ipaddress.inc} (56%)
 create mode 100644 meta-python/recipes-devtools/python/python-ipaddress_1.0.23.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-ipaddress_1.0.23.bb

diff --git a/meta-python/recipes-devtools/python/python-ipaddress_1.0.22.bb b/meta-python/recipes-devtools/python/python-ipaddress.inc
similarity index 56%
rename from meta-python/recipes-devtools/python/python-ipaddress_1.0.22.bb
rename to meta-python/recipes-devtools/python/python-ipaddress.inc
index 66de8b6..a230206 100644
--- a/meta-python/recipes-devtools/python/python-ipaddress_1.0.22.bb
+++ b/meta-python/recipes-devtools/python/python-ipaddress.inc
@@ -3,11 +3,11 @@ HOMEPAGE = "https://github.com/phihag/ipaddress"
 LICENSE = "Python-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7f538584cc3407bf76042def7168548a"
 
-DEPENDS += "python-pip"
+DEPENDS += "${PYTHON_PN}-pip"
 
-SRC_URI[md5sum] = "74c1ce3109f30eaa1ab3dd342e7b76d4"
-SRC_URI[sha256sum] = "b146c751ea45cad6188dd6cf2d9b757f6f4f8d6ffb96a023e6f2e26eea02a72c"
+SRC_URI[md5sum] = "aaee67a8026782af1831148beb0d9060"
+SRC_URI[sha256sum] = "b7f8e0369580bb4a24d5ba1d7cc29660a4a6987763faf1d8a8046830e020e7e2"
 
-inherit pypi setuptools
+inherit pypi
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-ipaddress_1.0.23.bb b/meta-python/recipes-devtools/python/python-ipaddress_1.0.23.bb
new file mode 100644
index 0000000..ed4e6cb
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-ipaddress_1.0.23.bb
@@ -0,0 +1,2 @@
+inherit setuptools
+require python-ipaddress.inc
diff --git a/meta-python/recipes-devtools/python/python3-ipaddress_1.0.23.bb b/meta-python/recipes-devtools/python/python3-ipaddress_1.0.23.bb
new file mode 100644
index 0000000..77e9787
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-ipaddress_1.0.23.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-ipaddress.inc
-- 
2.7.4




