Return-Path: <guy@guy-morand.ch>
X-Greylist: delayed 925 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 22 Sep 2017 10:40:22 UTC
Received: from smtp-sh2.infomaniak.ch (smtp-sh2.infomaniak.ch [128.65.195.6])
	by mail.openembedded.org (Postfix) with ESMTP id 071806E5CB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Sep 2017 10:40:22 +0000 (UTC)
Received: from smtp5.infomaniak.ch (smtp5.infomaniak.ch [83.166.132.18])
	by smtp-sh.infomaniak.ch (8.14.5/8.14.5) with ESMTP id v8MAOv5Y017342
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Fri, 22 Sep 2017 12:24:57 +0200
Received: from localhost.localdomain ([62.192.30.6]) (authenticated bits=0)
	by smtp5.infomaniak.ch (8.14.5/8.14.5) with ESMTP id v8MAOspa039131
	(version=TLSv1/SSLv3 cipher=AES128-SHA256 bits=128 verify=NO);
	Fri, 22 Sep 2017 12:24:57 +0200
From: Guy Morand <guy@guy-morand.ch>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Sep 2017 12:24:51 +0200
Message-Id: <1506075891-4205-3-git-send-email-guy@guy-morand.ch>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1506075891-4205-1-git-send-email-guy@guy-morand.ch>
References: <1506075891-4205-1-git-send-email-guy@guy-morand.ch>
X-Antivirus: Dr.Web (R) for Unix mail servers drweb plugin ver.6.0.2.8
X-Antivirus-Code: 0x100000
Subject: [meta-python][PATCH 3/3] Add python3 pandas
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
X-List-Received-Date: Fri, 22 Sep 2017 10:40:23 -0000

---
 .../python/python-pandas/python-pandas.inc          | 21 +++++++++++++++++++++
 .../python/python-pandas/python3-pandas_0.20.3.bb   |  5 +++++
 2 files changed, 26 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-pandas/python-pandas.inc
 create mode 100644 meta-python/recipes-devtools/python/python-pandas/python3-pandas_0.20.3.bb

diff --git a/meta-python/recipes-devtools/python/python-pandas/python-pandas.inc b/meta-python/recipes-devtools/python/python-pandas/python-pandas.inc
new file mode 100644
index 0000000..9ca3806
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pandas/python-pandas.inc
@@ -0,0 +1,21 @@
+SUMMARY  = "pandas library for high-performance data analysis tools"
+DESCRIPTION = "pandas is an open source, BSD-licensed library providing \
+high-performance, easy-to-use data structures and data analysis tools for \
+the Python programming language."
+HOMEPAGE = "http://pandas.pydata.org/"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=66017d3134349017409386be85176145"
+
+PYPI_PACKAGE = "pandas"
+
+inherit pypi
+
+DEPENDS += " \
+  ${PYTHON_PN}-numpy-native \
+  "
+
+RDEPENDS_${PN} += " \
+  ${PYTHON_PN}-numpy \
+  ${PYTHON_PN}-dateutil \
+  ${PYTHON_PN}-pytz \
+  "
diff --git a/meta-python/recipes-devtools/python/python-pandas/python3-pandas_0.20.3.bb b/meta-python/recipes-devtools/python/python-pandas/python3-pandas_0.20.3.bb
new file mode 100644
index 0000000..81dd360
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pandas/python3-pandas_0.20.3.bb
@@ -0,0 +1,5 @@
+inherit setuptools3
+require python-pandas.inc
+
+SRC_URI[md5sum] = "4df858f28b4bf4fa07d9fbb7f2568173"
+SRC_URI[sha256sum] = "a777e07633d83d546c55706420179551c8e01075b53c497dcf8ae4036766bc66"
-- 
2.7.4


