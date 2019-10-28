Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 926BE7FA9A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2019 22:16:30 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Oct 2019 15:16:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,241,1569308400"; d="scan'208";a="229842338"
Received: from mng-mobl.gar.corp.intel.com (HELO shodan.fritz.box)
	([10.249.76.230])
	by fmsmga002.fm.intel.com with ESMTP; 28 Oct 2019 15:16:30 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Oct 2019 11:16:21 +1300
Message-Id: <b861622f69daacf750318ce60fdb8551942b5865.1572300962.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1572300962.git.paul.eggleton@linux.intel.com>
References: <cover.1572300962.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH 1/1] python3-pillow: update to 6.2.1
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
X-List-Received-Date: Mon, 28 Oct 2019 22:16:30 -0000
Content-Transfer-Encoding: 8bit

Upstream release notes:

  https://pillow.readthedocs.io/en/stable/releasenotes/6.2.0.html
  https://pillow.readthedocs.io/en/stable/releasenotes/6.2.1.html

Also fixes CVE-2019-16865:

  https://nvd.nist.gov/vuln/detail/CVE-2019-16865

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../0001-explicitly-set-compile-options.patch    | 16 +++++++---------
 ...on3-pillow_6.1.bb => python3-pillow_6.2.1.bb} |  4 ++--
 2 files changed, 9 insertions(+), 11 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pillow_6.1.bb => python3-pillow_6.2.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-pillow/0001-explicitly-set-compile-options.patch b/meta-python/recipes-devtools/python/python3-pillow/0001-explicitly-set-compile-options.patch
index d4372696fe..35aee42145 100644
--- a/meta-python/recipes-devtools/python/python3-pillow/0001-explicitly-set-compile-options.patch
+++ b/meta-python/recipes-devtools/python/python3-pillow/0001-explicitly-set-compile-options.patch
@@ -1,4 +1,4 @@
-From 9f3073bf6a7c7c51bb49d25f65c8f75cc704a5ee Mon Sep 17 00:00:00 2001
+From 862a981ce462cd83a99e3db9faeeda1f8c64983f Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 18 Mar 2019 23:23:55 -0400
 Subject: [PATCH] explicitly set compile options
@@ -10,18 +10,19 @@ explicitly set build_ext options for oe-core's
 Upstream-Status: Inappropriate [oe specific]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
 ---
  setup.cfg | 12 ++++++++++++
  1 file changed, 12 insertions(+)
 
 diff --git a/setup.cfg b/setup.cfg
-index 3ab2e127..e92615f3 100644
+index 1c6ebc84..1ccc3d69 100644
 --- a/setup.cfg
 +++ b/setup.cfg
-@@ -4,3 +4,15 @@ test=pytest
- [flake8]
- extend-ignore = E203, W503
- max-line-length = 88
+@@ -13,3 +13,15 @@ multi_line_output = 3
+ 
+ [tool:pytest]
+ addopts = -rs
 +
 +[build_ext]
 +disable-platform-guessing = 1
@@ -34,6 +35,3 @@ index 3ab2e127..e92615f3 100644
 +disable-webp = 1
 +disable-webpmux = 1
 +disable-imagequant = 1
--- 
-2.20.1
-
diff --git a/meta-python/recipes-devtools/python/python3-pillow_6.1.bb b/meta-python/recipes-devtools/python/python3-pillow_6.2.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-pillow_6.1.bb
rename to meta-python/recipes-devtools/python/python3-pillow_6.2.1.bb
index 1d91066481..a383a3ff91 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_6.2.1.bb
@@ -5,11 +5,11 @@ HOMEPAGE = "https://pillow.readthedocs.io"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=55c0f320370091249c1755c0d2b48e89"
 
-SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=6.1.x \
+SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=6.2.x \
            file://0001-support-cross-compiling.patch \
            file://0001-explicitly-set-compile-options.patch \
 "
-SRCREV ?= "aaca672173413883fbcefd659f04d74fe44fb5d5"
+SRCREV ?= "6e0f07bbe38def22d36ee176b2efd9ea74b453a6"
 
 
 inherit setuptools3
-- 
2.20.1


