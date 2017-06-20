Return-Path: <daniela.plascencia@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id CE1837806E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jun 2017 19:20:12 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Jun 2017 12:20:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,364,1493708400"; d="scan'208";a="1184927644"
Received: from yctb04.ostc.intel.com ([10.54.69.58])
	by fmsmga002.fm.intel.com with ESMTP; 20 Jun 2017 12:20:11 -0700
From: daniela.plascencia@linux.intel.com
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Jun 2017 12:20:04 -0700
Message-Id: <20170620192006.14846-4-daniela.plascencia@linux.intel.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20170620192006.14846-1-daniela.plascencia@linux.intel.com>
References: <20170620192006.14846-1-daniela.plascencia@linux.intel.com>
Cc: Daniela Plascencia <daniela.plascencia@linux.intel.com>
Subject: [meta-python][PATCH 3/5] python-lazy-object-proxy: adds Python3 support
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
X-List-Received-Date: Tue, 20 Jun 2017 19:20:13 -0000

From: Daniela Plascencia <daniela.plascencia@linux.intel.com>

Extend the recipe for Python3 support.

Signed-off-by: Daniela Plascencia <daniela.plascencia@linux.intel.com>
---
 .../recipes-devtools/python/python-lazy-object-proxy.inc     | 10 ++++++++++
 .../python/python-lazy-object-proxy_1.3.1.bb                 | 12 ++----------
 .../python/python3-lazy-object-proxy_1.3.1.bb                |  2 ++
 3 files changed, 14 insertions(+), 10 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-lazy-object-proxy.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.3.1.bb

diff --git a/meta-python/recipes-devtools/python/python-lazy-object-proxy.inc b/meta-python/recipes-devtools/python/python-lazy-object-proxy.inc
new file mode 100644
index 000000000..83d2ea3cd
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-lazy-object-proxy.inc
@@ -0,0 +1,10 @@
+SUMMARY = "A fast and thorough lazy object proxy"
+HOMEPAGE = "https://python-lazy-object-proxy.readthedocs.io/"
+LICENSE = "BSD"
+SECTION = "devel/python"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ec680df42d8ad56427a83308817658cc"
+
+SRC_URI[md5sum] = "e128152b76eb5b9ba759504936139fd0"
+SRC_URI[sha256sum] = "eb91be369f945f10d3a49f5f9be8b3d0b93a4c2be8f8a5b83b0571b8123e0a7a"
+
+inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-lazy-object-proxy_1.3.1.bb b/meta-python/recipes-devtools/python/python-lazy-object-proxy_1.3.1.bb
index 0db5e6ed9..df4d60bff 100644
--- a/meta-python/recipes-devtools/python/python-lazy-object-proxy_1.3.1.bb
+++ b/meta-python/recipes-devtools/python/python-lazy-object-proxy_1.3.1.bb
@@ -1,10 +1,2 @@
-SUMMARY = "A fast and thorough lazy object proxy"
-HOMEPAGE = "https://python-lazy-object-proxy.readthedocs.io/"
-LICENSE = "BSD"
-SECTION = "devel/python"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=ec680df42d8ad56427a83308817658cc"
-
-SRC_URI[md5sum] = "e128152b76eb5b9ba759504936139fd0"
-SRC_URI[sha256sum] = "eb91be369f945f10d3a49f5f9be8b3d0b93a4c2be8f8a5b83b0571b8123e0a7a"
-
-inherit setuptools pypi
+inherit setuptools
+require python-lazy-object-proxy.inc
diff --git a/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.3.1.bb b/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.3.1.bb
new file mode 100644
index 000000000..150e12fd4
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.3.1.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-lazy-object-proxy.inc
-- 
2.12.0


