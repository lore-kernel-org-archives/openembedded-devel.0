Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5ADF07F1E3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Sep 2019 09:29:58 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x8T9TwwG009251
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Sep 2019 02:29:59 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Sun, 29 Sep 2019 02:29:58 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 29 Sep 2019 17:29:56 +0800
Message-ID: <20190929092956.13147-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] protobuf-c: fix race condition
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
X-List-Received-Date: Sun, 29 Sep 2019 09:29:58 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../0001-avoid-race-condition.patch           | 36 +++++++++++++++++++
 .../protobuf/protobuf-c_1.3.2.bb              |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/protobuf/protobuf-c/0001-avoid-race-condition.patch

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-avoid-race-condition.patch b/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-avoid-race-condition.patch
new file mode 100644
index 000000000..4fc7703d8
--- /dev/null
+++ b/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-avoid-race-condition.patch
@@ -0,0 +1,36 @@
+From 216e31260b618ec73862f9f5336597f391444dac Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Sun, 29 Sep 2019 17:20:42 +0800
+Subject: [PATCH] avoid race condition
+
+It's possible that the cxx-generate-packed-data.cc is compiled
+while the t/test-full.pb.h is being generated. This will result
+the following error.
+
+  DEBUG:	./t/test-full.pb.h:4:0: error: unterminated #ifndef
+  ./t/test-full.pb.h:4:0: error: unterminated #ifndef
+
+Add a dependency to avoid such problem.
+
+Upstream-Status: Pending
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ Makefile.am | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Makefile.am b/Makefile.am
+index b0cb065..1608ae0 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -156,6 +156,7 @@ noinst_PROGRAMS += \
+ t_generated_code2_cxx_generate_packed_data_SOURCES = \
+ 	t/generated-code2/cxx-generate-packed-data.cc \
+ 	t/test-full.pb.cc
++t/generated-code2/cxx-generate-packed-data.cc: t/test-full.pb.h
+ $(t_generated_code2_cxx_generate_packed_data_OBJECTS): t/test-full.pb.h
+ t_generated_code2_cxx_generate_packed_data_CXXFLAGS = \
+ 	$(AM_CXXFLAGS) \
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.2.bb b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.2.bb
index 6d1ffc3f4..b92f82dec 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.2.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.2.bb
@@ -15,6 +15,7 @@ DEPENDS = "protobuf-native protobuf"
 SRCREV = "1390409f4ee4e26d0635310995b516eb702c3f9e"
 
 SRC_URI = "git://github.com/protobuf-c/protobuf-c.git \
+           file://0001-avoid-race-condition.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
2.17.1


