Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id 87170788FF
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Mar 2018 05:50:06 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Mar 2018 22:50:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,323,1517904000"; d="scan'208";a="26609914"
Received: from chiron.jf.intel.com ([10.7.159.63])
	by orsmga006.jf.intel.com with ESMTP; 17 Mar 2018 22:50:07 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 17 Mar 2018 22:49:59 -0700
Message-Id: <20180318054959.59712-1-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.14.3
Subject: [meta-oe][PATCH] python-futures: upgrade v3.0.5 -> v3.2.0; inherit pypi
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
X-List-Received-Date: Sun, 18 Mar 2018 05:50:06 -0000

* For changes, see:
https://github.com/agronholm/pythonfutures/blob/master/CHANGES.rst

* Inheriting pypi class has the benefit of allowing
  auto-upgrade-helper to properly check for new versions
* HOMEPAGE is now on github
* Add nativesdk to BBCLASSEXTEND
* Use LICENSE file for license checksum
* License has changed from BSD to PSF

License-Update: use LICENSE file; license is now PSF

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 meta-oe/recipes-devtools/python/python-futures_3.0.5.bb | 16 ----------------
 meta-oe/recipes-devtools/python/python-futures_3.2.0.bb | 13 +++++++++++++
 2 files changed, 13 insertions(+), 16 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/python/python-futures_3.0.5.bb
 create mode 100644 meta-oe/recipes-devtools/python/python-futures_3.2.0.bb

diff --git a/meta-oe/recipes-devtools/python/python-futures_3.0.5.bb b/meta-oe/recipes-devtools/python/python-futures_3.0.5.bb
deleted file mode 100644
index c85fc56b83..0000000000
--- a/meta-oe/recipes-devtools/python/python-futures_3.0.5.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-DESCRIPTION = "The concurrent.futures module provides a high-level interface for asynchronously executing callables."
-SECTION = "devel/python"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=3d78c5bb15ac641d34f2ddc3bd7f51fa"
-HOMEPAGE = "http://code.google.com/p/pythonfutures"
-DEPENDS = "python"
-
-SRC_URI = "https://pypi.python.org/packages/source/f/futures/futures-${PV}.tar.gz"
-SRC_URI[md5sum] = "ced2c365e518242512d7a398b515ff95"
-SRC_URI[sha256sum] = "0542525145d5afc984c88f914a0c85c77527f65946617edb5274f72406f981df"
-
-S = "${WORKDIR}/futures-${PV}"
-
-inherit setuptools
-
-BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-devtools/python/python-futures_3.2.0.bb b/meta-oe/recipes-devtools/python/python-futures_3.2.0.bb
new file mode 100644
index 0000000000..3ee945fc9c
--- /dev/null
+++ b/meta-oe/recipes-devtools/python/python-futures_3.2.0.bb
@@ -0,0 +1,13 @@
+DESCRIPTION = "The concurrent.futures module provides a high-level interface for asynchronously executing callables."
+SECTION = "devel/python"
+LICENSE = "PSF"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=834d982f973c48b6d662b5944c5ab567"
+HOMEPAGE = "https://github.com/agronholm/pythonfutures"
+DEPENDS = "python"
+
+SRC_URI[md5sum] = "d1b299a06b96ccb59f70324716dc0016"
+SRC_URI[sha256sum] = "9ec02aa7d674acb8618afb127e27fde7fc68994c0437ad759fa094a574adb265"
+
+inherit pypi setuptools
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.14.3


