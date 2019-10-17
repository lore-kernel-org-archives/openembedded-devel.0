Return-Path: <okaya@kernel.org>
X-Greylist: delayed 368 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 17 Oct 2019 03:45:55 UTC
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail.openembedded.org (Postfix) with ESMTP id 8B5817F610
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 03:45:55 +0000 (UTC)
Received: from
	sinanubuntu1604.mkjiurmyylmellclgttazegk5f.bx.internal.cloudapp.net
	(unknown [40.121.86.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 329202082C;
	Thu, 17 Oct 2019 03:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1571283588;
	bh=A0eJ+djK30YrTcIj0aeHVwPiWU5BVvyZuv9VQzaVD8E=;
	h=From:To:Cc:Subject:Date:From;
	b=2uL3wdBKhVWCSA9uBoVyzjyisrkNQb5KvRM69kCvQsXkt9w9PGHTLniwbk8Ob4M6i
	tCT26v3qBfY11e8fS9VtezeSVST5lLKOpXtyJD9sFIFZ+9ljgMmeyvpYcZTLiM/ccH
	EQiqwLqGG777zZnqkuRN2H4iRz+7fAU9gNvzjOcc=
From: Sinan Kaya <okaya@kernel.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Oct 2019 03:39:46 +0000
Message-Id: <20191017033946.16494-1-okaya@kernel.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-oe][thud][PATCH] protobuf-c: fix race condition
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
X-List-Received-Date: Thu, 17 Oct 2019 03:45:55 -0000
Content-Transfer-Encoding: 8bit

From: "Qi.Chen@windriver.com" <Qi.Chen@windriver.com>

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Sinan Kaya <okaya@kernel.org>
(cherry picked from commit 489d3b4b932ee8016d792341f8ea5836a9522cd4)
---
 .../0001-avoid-race-condition.patch           | 36 +++++++++++++++++++
 .../protobuf/protobuf-c_1.3.1.bb              |  3 +-
 2 files changed, 38 insertions(+), 1 deletion(-)
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
diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.1.bb b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.1.bb
index 7ef030092..17f92f04b 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.1.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.1.bb
@@ -15,7 +15,8 @@ DEPENDS = "protobuf-native protobuf"
 PV .= "+git${SRCPV}"
 SRCREV = "269771b4b45d3aba04e59569f53600003db8d9ff"
 
-SRC_URI = "git://github.com/protobuf-c/protobuf-c.git"
+SRC_URI = "git://github.com/protobuf-c/protobuf-c.git \
+           file://0001-avoid-race-condition.patch"
 
 S = "${WORKDIR}/git"
 
-- 
2.23.0


