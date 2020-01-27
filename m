Return-Path: <prvs=288f39d4d=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id A41517FD6F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jan 2020 11:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1580124330; x=1611660330;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=FEsTwHAr3UrU75ppK/4mJWMz3KTKB576d4iVVhULOt4=;
	b=t2oQAwpnRiolr9ElakoL8g7nFmlhpOvs7wecJcMHCcV6kfyBK5DKWTYg
	L7rAR7nWRtvXMr4ozQ81fpSyeG61FTXGQ+/tps/1KrFTHKUpNDQoNMuFp
	/107P7FnzS//DDUK6QQRWmfYshEHkYKz5WgrCx3GBwjIxvyAumIWT6Lq0
	aeDSwV0dxrTziolFZ7qI8jq2nHOfvRl5M34+hQvT5IjcSfm1I9EAsQaZT
	S5cOlhkaZFuqtmFtph6ei4B2IpiuwtODgvpf2KpbxW1YQ2NFZZ9mrboaX
	u+Uop/JaPj9GJN7VeEVXk5VbfWr5rcnD7oNL3rPb4LSxqvi0i+0krHU5l w==;
IronPort-SDR: v8wataeAEs2EONQMu3yusD88GyexrBYiZeaqBg2IjylS0FbnATqNGjb1khnEpWVVnWkV10W5pz
	O4tTYxGQhJTFUNBfpL9ilQXeWJf0kL8YPRdbm0Z+Zd2qY4CYu7+8d4ZAHdlRA/+qg/KwAg2Qvg
	Kg6Ihxxb2/INtR2I9WKsMu5Bj/cPnq38TCauy946I/IA82stZFeBsWZtLGiiIzCMAUfCzkT+25
	9WMykxu9BjJcKr69FhtskuGCP6TpCYqHXq+qujxOoWdpNJjy8WYAvZLXErKh6DE8pQ/wb81isH
	Y3E=
X-IronPort-AV: E=Sophos;i="5.70,369,1574118000"; d="scan'208";a="22275563"
From: Richard Leitner <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 27 Jan 2020 12:24:51 +0100
Message-ID: <20200127112451.165555-5-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200127112451.165555-1-richard.leitner@skidata.com>
References: <20200127112451.165555-1-richard.leitner@skidata.com>
MIME-Version: 1.0
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: [meta-java][PATCH 4/4] openjdk-8: fix jdk linking for non aarch architectures
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
X-List-Received-Date: Mon, 27 Jan 2020 11:25:29 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Based on a patch by Jacob Kroon and the aarch32 upstream solution.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
Cc: Jacob Kroon <jacob.kroon@gmail.com>
---
 recipes-core/openjdk/openjdk-8-release-common.inc   |  6 ++++++
 ...tead-of-ld-to-link-genSocketOptionRegistry.patch | 13 +++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 recipes-core/openjdk/patches-openjdk-8/2009-jdk-use-gcc-instead-of-ld-to-link-genSocketOptionRegistry.patch

diff --git a/recipes-core/openjdk/openjdk-8-release-common.inc b/recipes-core/openjdk/openjdk-8-release-common.inc
index a8a653b..bd3092f 100644
--- a/recipes-core/openjdk/openjdk-8-release-common.inc
+++ b/recipes-core/openjdk/openjdk-8-release-common.inc
@@ -18,6 +18,7 @@ PATCHES_URI = "\
     file://2006-jdk-disable-backtrace-musl-build-fix.patch \
     file://2007-jdk-no-genx11-in-headless.patch \
     file://2008-jdk-no-unused-deps.patch \
+    file://2009-jdk-use-gcc-instead-of-ld-to-link-genSocketOptionRegistry.patch \
 "
 HOTSPOT_UB_PATCH = "\
     file://1001-hotspot-fix-crash-on-JNI_CreateJavaVM.patch \
@@ -75,6 +76,11 @@ PATCHES_URI_append_libc-musl_armv7a = " file://aarch32-hotspot-remaining-musl-fi
 PATCHES_URI_append_libc-musl_armv7ve = " file://aarch32-hotspot-remaining-musl-fixes.patch"
 PATCHES_URI_append_libc-musl_aarch64 = " file://aarch64-hotspot-remaining-musl-fixes.patch"
 
+# remove aarch32 & aarch64 mainlined patches
+PATCHES_URI_remove_armv7a = "file://2009-jdk-use-gcc-instead-of-ld-to-link-genSocketOptionRegistry.patch"
+PATCHES_URI_remove_armv7ve = "file://2009-jdk-use-gcc-instead-of-ld-to-link-genSocketOptionRegistry.patch"
+PATCHES_URI_remove_aarch64 = "file://2009-jdk-use-gcc-instead-of-ld-to-link-genSocketOptionRegistry.patch"
+
 # Name of the directory containing the compiled output
 BUILD_DIR = "openjdk.build"
 BUILD_DIR_ECJ = "openjdk.build-ecj"
diff --git a/recipes-core/openjdk/patches-openjdk-8/2009-jdk-use-gcc-instead-of-ld-to-link-genSocketOptionRegistry.patch b/recipes-core/openjdk/patches-openjdk-8/2009-jdk-use-gcc-instead-of-ld-to-link-genSocketOptionRegistry.patch
new file mode 100644
index 0000000..e35d0eb
--- /dev/null
+++ b/recipes-core/openjdk/patches-openjdk-8/2009-jdk-use-gcc-instead-of-ld-to-link-genSocketOptionRegistry.patch
@@ -0,0 +1,13 @@
+Index: jdk8u-jdk8u242-ga/jdk/make/gensrc/GensrcMisc.gmk
+===================================================================
+--- jdk8u-jdk8u242-ga.orig/jdk/make/gensrc/GensrcMisc.gmk
++++ jdk8u-jdk8u242-ga/jdk/make/gensrc/GensrcMisc.gmk
+@@ -76,7 +76,7 @@ $(eval $(call SetupNativeCompilation,BUI
+     INCLUDE_FILES := $(GENSRC_SOR_SRC_FILE), \
+     LANG := C, \
+     CC := $(BUILD_CC), \
+-    LDEXE := $(BUILD_LD), \
++    LDEXE := $(BUILD_CC), \
+     OBJECT_DIR := $(GENSRC_SOR_BIN), \
+     OUTPUT_DIR := $(GENSRC_SOR_BIN), \
+     PROGRAM := genSocketOptionRegistry))
-- 
2.24.1


