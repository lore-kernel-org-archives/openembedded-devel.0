Return-Path: <guy@guy-morand.ch>
Received: from smtp-sh.infomaniak.ch (smtp-sh.infomaniak.ch [128.65.195.4])
	by mail.openembedded.org (Postfix) with ESMTP id 208767772F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Sep 2017 08:26:10 +0000 (UTC)
Received: from smtp6.infomaniak.ch (smtp6.infomaniak.ch [83.166.132.19])
	by smtp-sh.infomaniak.ch (8.14.5/8.14.5) with ESMTP id v8T8QBdr000899
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Fri, 29 Sep 2017 10:26:11 +0200
Received: from localhost.localdomain ([62.192.30.6]) (authenticated bits=0)
	by smtp6.infomaniak.ch (8.14.5/8.14.5) with ESMTP id v8T8Q8Am055570
	(version=TLSv1/SSLv3 cipher=AES128-SHA256 bits=128 verify=NO);
	Fri, 29 Sep 2017 10:26:11 +0200
From: Guy Morand <guy@guy-morand.ch>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Sep 2017 10:26:05 +0200
Message-Id: <1506673565-17289-1-git-send-email-guy@guy-morand.ch>
X-Mailer: git-send-email 2.7.4
X-Antivirus: Dr.Web (R) for Unix mail servers drweb plugin ver.6.0.2.8
X-Antivirus-Code: 0x100000
Subject: [meta-python][PATCH] Add python pandas recipes
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
X-List-Received-Date: Fri, 29 Sep 2017 08:26:12 -0000

---
 .../recipes-devtools/python/python-pandas.inc       | 21 +++++++++++++++++++++
 .../recipes-devtools/python/python-pandas_0.20.3.bb | 10 ++++++++++
 .../python/python3-pandas_0.20.3.bb                 |  5 +++++
 3 files changed, 36 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-pandas.inc
 create mode 100644 meta-python/recipes-devtools/python/python-pandas_0.20.3.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pandas_0.20.3.bb

diff --git a/meta-python/recipes-devtools/python/python-pandas.inc b/meta-python/recipes-devtools/python/python-pandas.inc
new file mode 100644
index 0000000..9ca3806
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pandas.inc
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
diff --git a/meta-python/recipes-devtools/python/python-pandas_0.20.3.bb b/meta-python/recipes-devtools/python/python-pandas_0.20.3.bb
new file mode 100644
index 0000000..f4c486b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pandas_0.20.3.bb
@@ -0,0 +1,10 @@
+inherit setuptools
+require python-pandas.inc
+
+RDEPENDS_${PN} += " \
+  ${PYTHON_PN}-json \
+  ${PYTHON_PN}-importlib \
+  "
+
+SRC_URI[md5sum] = "4df858f28b4bf4fa07d9fbb7f2568173"
+SRC_URI[sha256sum] = "a777e07633d83d546c55706420179551c8e01075b53c497dcf8ae4036766bc66"
diff --git a/meta-python/recipes-devtools/python/python3-pandas_0.20.3.bb b/meta-python/recipes-devtools/python/python3-pandas_0.20.3.bb
new file mode 100644
index 0000000..81dd360
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pandas_0.20.3.bb
@@ -0,0 +1,5 @@
+inherit setuptools3
+require python-pandas.inc
+
+SRC_URI[md5sum] = "4df858f28b4bf4fa07d9fbb7f2568173"
+SRC_URI[sha256sum] = "a777e07633d83d546c55706420179551c8e01075b53c497dcf8ae4036766bc66"
-- 
2.7.4


