Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id 48D517F89A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 16:14:05 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id p1so12432423pgi.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 09:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=FvTaCx/JRyuXdvIgSqeiw3vXhXURiUamzXoIfhURXvQ=;
	b=ckZrXZebwCKKg7zVqCDiSiYGXRt2regoi0Jr5rOMEWSTh2A7gt661Oil8tp0Q1c9VL
	fqi2Hd6XwDVV7g/P/S3vbrNLew1m4i+k0CsETa1WXoC/lJqt2lGiZeqF7ACXx5eDHfEa
	ks3mrgdx0tPBKf9PTT2KPcENLZ9vdnmXEXaQAh4mDfQbNxRKep7jLTs/eueHBt3H/lbU
	OA+7H5ccNRBm+fzt371pKLZtpc/IqkU6tDrOmvbKCniQuYQpUz9AIvGgkBsj/I+0+zoj
	vm63A+lFZKIlS3G/Mk/xl+N4IjiC5Yz0kigZ21y6+PTJ9oKmCHCS1xxZKiUZSv3hUc4e
	OXKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=FvTaCx/JRyuXdvIgSqeiw3vXhXURiUamzXoIfhURXvQ=;
	b=JPQ46ZaFW6NFY4cJ/LgaKU6saQJ8CGD4YmxkwSBb6gomTYUvJfLZtR+6eiQnjbJ6tC
	69V10o84hNEsHxl+Y8MnDvG/k4/FiJvxXT7Tb9dmpuzPHSFBDTGV8Le7pzN3hEHWDZjs
	FXBkoce4BSRJ4Bv45+y8cpuhdYbhHroz4aoRbrChDqcXdB7TLYDnG1BJfHbAYAHRj4iz
	HBn1uGSLkJiW74eUVAR7R0VtjCRdJcaZK41cx2E6LoGGg6kUf7BrUwaWPQZcg7KCcxFQ
	nFRraa/dHdiQ4GWV1fyOd3+OkRphjq0iniu5IckvI4MPGnQ3ZKAIpD48WyeapkSR97L4
	mpjw==
X-Gm-Message-State: APjAAAVNzUd4CxDzj580WbMa3tbvmkhZKxMrA5IjOup77jUi+sI0mhNS
	giziMQXPpNw/ykJCJP4iIMhYjK7i
X-Google-Smtp-Source: APXvYqy3Rf2KPLi3amRZo3SG/WFQuYAmaS7knCG0EpjQv94qWqY7s3lrG42pSX2FmwWNi43ePsjpQw==
X-Received: by 2002:a17:90a:a605:: with SMTP id
	c5mr1016446pjq.28.1571847246111; 
	Wed, 23 Oct 2019 09:14:06 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:d998:942e:6613:6ef4])
	by smtp.gmail.com with ESMTPSA id
	d19sm23179067pjz.5.2019.10.23.09.14.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 23 Oct 2019 09:14:05 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Oct 2019 09:13:52 -0700
Message-Id: <7f011d0ba2e0dd31f3f07d03730974ea862e926b.1571847041.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1571847041.git.akuster808@gmail.com>
References: <cover.1571847041.git.akuster808@gmail.com>
Subject: [warrior 07/10] protobuf-c: fix race condition
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
X-List-Received-Date: Wed, 23 Oct 2019 16:14:05 -0000

From: "Qi.Chen@windriver.com" <Qi.Chen@windriver.com>

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Sinan Kaya <okaya@kernel.org>
(cherry picked from commit 489d3b4b932ee8016d792341f8ea5836a9522cd4)
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../protobuf-c/0001-avoid-race-condition.patch     | 36 ++++++++++++++++++++++
 .../recipes-devtools/protobuf/protobuf-c_1.3.1.bb  |  3 +-
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/protobuf/protobuf-c/0001-avoid-race-condition.patch

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-avoid-race-condition.patch b/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-avoid-race-condition.patch
new file mode 100644
index 0000000..4fc7703
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
index 7ef0300..17f92f0 100644
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
2.7.4


