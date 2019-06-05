Return-Path: <james.feist@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 131956BCE7
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Jun 2019 18:04:36 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Jun 2019 11:04:37 -0700
X-ExtLoop1: 1
Received: from skyhawk.jf.intel.com ([10.54.51.81])
	by orsmga008.jf.intel.com with ESMTP; 05 Jun 2019 11:04:37 -0700
From: James Feist <james.feist@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Jun 2019 11:04:30 -0700
Message-Id: <20190605180430.5382-1-james.feist@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] libgpiod: Enable cxx bindings by default
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
X-List-Received-Date: Wed, 05 Jun 2019 18:04:37 -0000

If we move the packageconfig settings from the shared
inc file into the individual version recipes, we can
enable the cxx bindings by default for the newer version
of libgpiod.

Signed-off-by: James Feist <james.feist@linux.intel.com>
---
 meta-oe/recipes-support/libgpiod/libgpiod.inc      | 3 ---
 meta-oe/recipes-support/libgpiod/libgpiod_0.3.3.bb | 3 +++
 meta-oe/recipes-support/libgpiod/libgpiod_1.3.bb   | 3 +++
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod.inc b/meta-oe/recipes-support/libgpiod/libgpiod.inc
index cd7750623..89679cb91 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod.inc
+++ b/meta-oe/recipes-support/libgpiod/libgpiod.inc
@@ -7,9 +7,6 @@ SRC_URI = "https://www.kernel.org/pub/software/libs/libgpiod/${BP}.tar.xz"
 
 inherit autotools pkgconfig
 
-# enable tools
-PACKAGECONFIG ?= "tools"
-
 PACKAGECONFIG[tests] = "--enable-tests,--disable-tests,kmod udev"
 PACKAGECONFIG[tools] = "--enable-tools,--disable-tools,"
 
diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_0.3.3.bb b/meta-oe/recipes-support/libgpiod/libgpiod_0.3.3.bb
index 96615ebf2..3ecfffdd6 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_0.3.3.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_0.3.3.bb
@@ -1,5 +1,8 @@
 require libgpiod.inc
 
+# enable tools
+PACKAGECONFIG ?= "tools"
+
 PACKAGECONFIG[tests] = "--enable-tests,--disable-tests,kmod udev"
 
 SRC_URI[md5sum] = "2aa1e1a80c3c919ae142ab9a55fb59ca"
diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.3.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.3.bb
index e513a33bd..ffa2b9f12 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_1.3.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.3.bb
@@ -5,6 +5,9 @@ DEPENDS += "autoconf-archive-native"
 SRC_URI[md5sum] = "9f7530a5d56f070ba0af78d6ba077973"
 SRC_URI[sha256sum] = "6ec837f23e8f2196e5976dec4ac81403170830075e7f33ede1394eaf67f2e962"
 
+# enable tools and cxx bindings
+PACKAGECONFIG ?= "cxx tools"
+
 PACKAGECONFIG[cxx] = "--enable-bindings-cxx,--disable-bindings-cxx"
 PACKAGECONFIG[tests] = "--enable-tests --enable-install-tests,--disable-tests --disable-install-tests,kmod udev"
 
-- 
2.17.1


