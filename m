Return-Path: <krzk@kernel.org>
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail.openembedded.org (Postfix) with ESMTP id 1893C6FFD8
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  9 Jul 2017 15:47:47 +0000 (UTC)
Received: from localhost.localdomain (pub082136089155.dh-hfc.datazug.ch
	[82.136.89.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 32E2D22C91;
	Sun,  9 Jul 2017 15:47:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32E2D22C91
Authentication-Results: mail.kernel.org;
	dmarc=none (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=krzk@kernel.org
From: Krzysztof Kozlowski <krzk@kernel.org>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  9 Jul 2017 17:47:22 +0200
Message-Id: <20170709154723.4623-2-krzk@kernel.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170709154723.4623-1-krzk@kernel.org>
References: <20170709154723.4623-1-krzk@kernel.org>
Subject: [meta-python][PATCH 2/3] meta-python: Add python-daemon recipe and its dependencies
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
X-List-Received-Date: Sun, 09 Jul 2017 15:47:47 -0000

Add recipes for python-daemon PIP package with its dependencies -
lockfile and docutils.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 .../0001-Workaround-for-issue-2-1.patch            | 31 ++++++++++++++++++++++
 .../recipes-devtools/python/python-daemon_2.1.2.bb | 27 +++++++++++++++++++
 .../python/python-docutils_0.14rc2.bb              | 18 +++++++++++++
 .../python/python-lockfile_0.12.2.bb               | 13 +++++++++
 4 files changed, 89 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-daemon/0001-Workaround-for-issue-2-1.patch
 create mode 100644 meta-python/recipes-devtools/python/python-daemon_2.1.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python-docutils_0.14rc2.bb
 create mode 100644 meta-python/recipes-devtools/python/python-lockfile_0.12.2.bb

diff --git a/meta-python/recipes-devtools/python/python-daemon/0001-Workaround-for-issue-2-1.patch b/meta-python/recipes-devtools/python/python-daemon/0001-Workaround-for-issue-2-1.patch
new file mode 100644
index 000000000000..dbb840718618
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-daemon/0001-Workaround-for-issue-2-1.patch
@@ -0,0 +1,31 @@
+From 0981eee9f0198c2045dc0eaa78a005d06fc7bfe4 Mon Sep 17 00:00:00 2001
+From: Carlos Eduardo Moreira dos Santos <cems@cemshost.com.br>
+Date: Tue, 28 Mar 2017 18:23:44 -0300
+Subject: [PATCH] Workaround for issue 2 [1]
+
+[1] https://pagure.io/python-daemon/issue/2
+---
+ version.py | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/version.py b/version.py
+index d58422a377ee..293e2d64c2b7 100644
+--- a/version.py
++++ b/version.py
+@@ -648,9 +648,10 @@ class ChangelogAwareDistribution(distutils.dist.Distribution, object):
+ 
+     @lru_cache(maxsize=128)
+     def get_version_info(self):
+-        changelog_path = get_changelog_path(self)
+-        version_info = generate_version_info_from_changelog(changelog_path)
+-        return version_info
++        return {
++            'version': '2.1.2',
++            'maintainer': 'Ben Finney'
++        }
+ 
+     def get_version(self):
+         version_info = self.get_version_info()
+-- 
+2.7.4
+
diff --git a/meta-python/recipes-devtools/python/python-daemon_2.1.2.bb b/meta-python/recipes-devtools/python/python-daemon_2.1.2.bb
new file mode 100644
index 000000000000..4c18e2bad5c4
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-daemon_2.1.2.bb
@@ -0,0 +1,27 @@
+DESCRIPTION = "Library to implement a well-behaved Unix daemon process"
+HOMEPAGE = "https://pagure.io/python-daemon/"
+SECTION = "devel/python"
+
+DEPENDS = "python-docutils"
+RDEPENDS_${PN} = "python-docutils \
+                  python-lockfile (>= 0.10) \
+                  python-resource \
+"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
+
+inherit pypi setuptools
+
+SRC_URI[md5sum] = "9c57343d81f2a96c51cffeab982b04d2"
+SRC_URI[sha256sum] = "261c859be5c12ae7d4286dc6951e87e9e1a70a882a8b41fd926efc1ec4214f73"
+
+# Fix for build error in Yocto:
+#     i = p.rfind('/') + 1
+# AttributeError: 'NoneType' object has no attribute 'rfind'
+#S = "${WORKDIR}/python-daemon"
+SRC_URI_append = " \
+                  file://0001-Workaround-for-issue-2-1.patch \
+"
+
+PYPI_PACKAGE = "python-daemon"
diff --git a/meta-python/recipes-devtools/python/python-docutils_0.14rc2.bb b/meta-python/recipes-devtools/python/python-docutils_0.14rc2.bb
new file mode 100644
index 000000000000..68436a1a544b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-docutils_0.14rc2.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Text processing system for documentation"
+HOMEPAGE = "http://docutils.sourceforge.net"
+SECTION = "devel/python"
+LICENSE = "PSF & BSD-2-Clause & GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=35a23d42b615470583563132872c97d6"
+
+DEPENDS = "python"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/docutils/docutils-${PV}.tar.gz"
+SRC_URI[md5sum] = "2f4bee6451958252f7bec71f18b05be3"
+SRC_URI[sha256sum] = "3caee0bcb2a49fdf24fcfa70849a60abb7a181aa68b030f7cb7494096181830c"
+
+S = "${WORKDIR}/docutils-${PV}"
+
+inherit distutils
+
+BBCLASSEXTEND = "native"
+
diff --git a/meta-python/recipes-devtools/python/python-lockfile_0.12.2.bb b/meta-python/recipes-devtools/python/python-lockfile_0.12.2.bb
new file mode 100644
index 000000000000..cd15760d46ae
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-lockfile_0.12.2.bb
@@ -0,0 +1,13 @@
+DESCRIPTION = "Platform-independent file locking module"
+HOMEPAGE = "http://launchpad.net/pylockfile"
+SECTION = "devel/python"
+
+RDEPENDS_${PN} = "python-threading"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+inherit pypi setuptools
+
+SRC_URI[md5sum] = "a6a1a82957a23afdf44cfdd039b65ff9"
+SRC_URI[sha256sum] = "6aed02de03cba24efabcd600b30540140634fc06cfa603822d508d5361e9f799"
-- 
2.11.0


