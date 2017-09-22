Return-Path: <guy@guy-morand.ch>
Received: from smtp-sh2.infomaniak.ch (smtp-sh2.infomaniak.ch [128.65.195.6])
	by mail.openembedded.org (Postfix) with ESMTP id ACDF76E5CB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Sep 2017 10:40:24 +0000 (UTC)
Received: from smtp5.infomaniak.ch (smtp5.infomaniak.ch [83.166.132.18])
	by smtp-sh.infomaniak.ch (8.14.5/8.14.5) with ESMTP id v8MAOvDp017328
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Fri, 22 Sep 2017 12:24:57 +0200
Received: from localhost.localdomain ([62.192.30.6]) (authenticated bits=0)
	by smtp5.infomaniak.ch (8.14.5/8.14.5) with ESMTP id v8MAOspY039131
	(version=TLSv1/SSLv3 cipher=AES128-SHA256 bits=128 verify=NO);
	Fri, 22 Sep 2017 12:24:57 +0200
From: Guy Morand <guy@guy-morand.ch>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Sep 2017 12:24:49 +0200
Message-Id: <1506075891-4205-1-git-send-email-guy@guy-morand.ch>
X-Mailer: git-send-email 2.7.4
X-Antivirus: Dr.Web (R) for Unix mail servers drweb plugin ver.6.0.2.8
X-Antivirus-Code: 0x100000
Subject: [meta-python][PATCH 1/3] Add python3 matplotlib
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
X-List-Received-Date: Fri, 22 Sep 2017 10:40:25 -0000

---
 .../python-matplotlib/files/0001-fix_setup.diff    | 13 +++++++++
 .../python/python-matplotlib/python-matplotlib.inc | 32 ++++++++++++++++++++++
 .../python-matplotlib/python3-matplotlib_2.0.2.bb  |  6 ++++
 3 files changed, 51 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-matplotlib/files/0001-fix_setup.diff
 create mode 100644 meta-python/recipes-devtools/python/python-matplotlib/python-matplotlib.inc
 create mode 100644 meta-python/recipes-devtools/python/python-matplotlib/python3-matplotlib_2.0.2.bb

diff --git a/meta-python/recipes-devtools/python/python-matplotlib/files/0001-fix_setup.diff b/meta-python/recipes-devtools/python/python-matplotlib/files/0001-fix_setup.diff
new file mode 100644
index 0000000..8f1b505
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-matplotlib/files/0001-fix_setup.diff
@@ -0,0 +1,13 @@
+Index: matplotlib-2.0.2/setupext.py
+===================================================================
+--- matplotlib-2.0.2.orig/setupext.py
++++ matplotlib-2.0.2/setupext.py
+@@ -182,7 +182,7 @@ def get_base_dirs():
+         'gnu0': ['/usr'],
+         'aix5': ['/usr/local'],
+         }
+-    return basedir_map.get(sys.platform, ['/usr/local', '/usr'])
++    return basedir_map.get(sys.platform, [os.environ['STAGING_LIBDIR']])
+ 
+ 
+ def get_include_dirs():
diff --git a/meta-python/recipes-devtools/python/python-matplotlib/python-matplotlib.inc b/meta-python/recipes-devtools/python/python-matplotlib/python-matplotlib.inc
new file mode 100644
index 0000000..74dcf97
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-matplotlib/python-matplotlib.inc
@@ -0,0 +1,32 @@
+SUMMARY  = "Matplotlib produces publication quality figures"
+DESCRIPTION = "Matplotlib is a Python 2D plotting library which produces \
+publication quality figures in a variety of hardcopy formats and interactive \
+environments across platforms. Matplotlib can be used in Python scripts, the \
+Python and IPython shell, the jupyter notebook, web application servers, and \
+four graphical user interface toolkits."
+HOMEPAGE = "https://matplotlib.org/"
+LICENSE = "PSF"
+LIC_FILES_CHKSUM = "file://LICENSE/LICENSE;md5=afec61498aa5f0c45936687da9a53d74"
+
+PYPI_PACKAGE = "matplotlib"
+
+inherit pypi
+
+SRC_URI += "\
+  file://0001-fix_setup.diff \
+  "
+
+DEPENDS += " \
+  ${PYTHON_PN}-numpy-native \
+  freetype \
+  libpng \
+  "
+
+RDEPENDS_${PN} += " \
+  ${PYTHON_PN}-numpy \
+  ${PYTHON_PN}-dateutil \
+  ${PYTHON_PN}-pyparsing \
+  ${PYTHON_PN}-pytz \
+  ${PYTHON_PN}-six \
+  ${PYTHON_PN}-cycler \
+  "
diff --git a/meta-python/recipes-devtools/python/python-matplotlib/python3-matplotlib_2.0.2.bb b/meta-python/recipes-devtools/python/python-matplotlib/python3-matplotlib_2.0.2.bb
new file mode 100644
index 0000000..7e309b2
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-matplotlib/python3-matplotlib_2.0.2.bb
@@ -0,0 +1,6 @@
+inherit setuptools3
+require python-matplotlib.inc
+
+SRC_URI[md5sum] = "061111784278bde89b5d4987014be4ca"
+SRC_URI[sha256sum] = "0ffbc44faa34a8b1704bc108c451ecf87988f900ef7ce757b8e2e84383121ff1"
+
-- 
2.7.4


