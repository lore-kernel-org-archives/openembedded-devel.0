Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id D873B77E55
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Jun 2017 06:50:30 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id u26so11734167pfd.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Jun 2017 23:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=HFicugR7mOo4QbE1SPu4YUYiUyHt1bpLt8tv+mW7lik=;
	b=s10rGlCbpxo5e2T8efwMC3O0oUdQ8Bwk3YjSH4uEfZwJk5Ak8/0cKJjHbhQfEZxrLo
	HabQuGR2mOvt6Lm4QWRFOonuiuN4TR4u/kIekMYrXHNjFpICn4pH9kVHwImGn/fLxGRr
	sHSY1xsNhe+aeY+xUoOYdVQbdGnr8ia6q+ay6lr6KSEwpQLGxFw/HLL1RKqUbG6LO2N5
	weQCku9dfizrw31E8HzWa9dSLIaZi8NXw1KqqZEHspgInrKiYJ+psZwputqepctor1eJ
	aAyx/Wp4ETltqLjL99aWMx2cnKthdHCx6DztR3MJhoI7uQfqo+oLwSyg/qNP5YIWjR37
	yB4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=HFicugR7mOo4QbE1SPu4YUYiUyHt1bpLt8tv+mW7lik=;
	b=ObJWYCBEHmj68epsz9I1wJTroMVTkqh5nVD0dVeoY7fMrAXZo6oQX5m3NLpfUEPWqz
	y8htcYmQy/Pab8BIwvUd3vTrUnH2EetUBlsT8W/kLepNeUwqRC+1wSF5xqua66eYwONj
	tuTK01KVIiUJffbC/3+yZsIn39GuZlQ2SbJJXT5V4tBepsOd2eX2WVU4s6w590nER9ek
	bgwPZU8cX1GLoZV6xrmOTESWh/EjM69iH2ag62sZDRF70SoFIstWPOwgz2QKKnZkaGqx
	cmCsfWsDfSwwwHKVEnrWBDheL8HxSHsdt7brygw80lIPB1uo2kWYMahI9d2Jexp7umeG
	xj4Q==
X-Gm-Message-State: AODbwcCQJ0mm+7xxaNUZgTi5JoGlQ8sLScf/EOZ0RL7CaDdLXLwtqn+z
	YCaAGkX+zkOxxAjn
X-Received: by 10.98.192.80 with SMTP id x77mr5398639pff.1.1496386231656;
	Thu, 01 Jun 2017 23:50:31 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::cf4])
	by smtp.gmail.com with ESMTPSA id
	a78sm43177369pfk.122.2017.06.01.23.50.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Jun 2017 23:50:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Jun 2017 23:50:15 -0700
Message-Id: <20170602065016.27954-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170602065016.27954-1-raj.khem@gmail.com>
References: <20170602065016.27954-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/4] konkretcmpi: Update and fix build with latest oe-core
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
X-List-Received-Date: Fri, 02 Jun 2017 06:50:31 -0000

Drop already upstreamed patch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-drop-including-rpath-cmake-module.patch   | 38 ++++++++++++++++++++++
 ...-0.9.2-fix-returning-instance-from-method.patch | 38 ----------------------
 .../konkretcmpi/konkretcmpi_0.9.2.bb               |  4 +--
 3 files changed, 40 insertions(+), 40 deletions(-)
 create mode 100644 meta-oe/recipes-extended/konkretcmpi/konkretcmpi/0001-drop-including-rpath-cmake-module.patch
 delete mode 100644 meta-oe/recipes-extended/konkretcmpi/konkretcmpi/konkretcmpi-0.9.2-fix-returning-instance-from-method.patch

diff --git a/meta-oe/recipes-extended/konkretcmpi/konkretcmpi/0001-drop-including-rpath-cmake-module.patch b/meta-oe/recipes-extended/konkretcmpi/konkretcmpi/0001-drop-including-rpath-cmake-module.patch
new file mode 100644
index 000000000..342017bed
--- /dev/null
+++ b/meta-oe/recipes-extended/konkretcmpi/konkretcmpi/0001-drop-including-rpath-cmake-module.patch
@@ -0,0 +1,38 @@
+From 45e1c4c04a126d2386446775f99084bd603016af Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 1 Jun 2017 23:10:59 -0700
+Subject: [PATCH] drop including rpath cmake module
+
+Fixes cross compilation QA errors e.g.
+/usr/lib/libkonkret.so.0.0.1 contains probably-redundant RPATH /usr/lib [useless-rpaths]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/konkret/CMakeLists.txt | 1 -
+ src/program/CMakeLists.txt | 1 -
+ 2 files changed, 2 deletions(-)
+
+diff --git a/src/konkret/CMakeLists.txt b/src/konkret/CMakeLists.txt
+index c2faa40..df49e11 100644
+--- a/src/konkret/CMakeLists.txt
++++ b/src/konkret/CMakeLists.txt
+@@ -8,7 +8,6 @@ set(konkret_SRCS
+     kstr.c
+     print.c
+ )
+-include(rpath)
+ include_directories(${CMPI_INCLUDE_DIR})
+ 
+ add_library(libkonkret SHARED ${konkret_SRCS})
+diff --git a/src/program/CMakeLists.txt b/src/program/CMakeLists.txt
+index afcefe5..8a4646c 100644
+--- a/src/program/CMakeLists.txt
++++ b/src/program/CMakeLists.txt
+@@ -1,4 +1,3 @@
+-include (rpath)
+ include_directories(${CMPI_INCLUDE_DIR} ${CMAKE_SOURCE_DIR}/src)
+ 
+ add_executable(konkret main.cpp)
+-- 
+2.13.0
+
diff --git a/meta-oe/recipes-extended/konkretcmpi/konkretcmpi/konkretcmpi-0.9.2-fix-returning-instance-from-method.patch b/meta-oe/recipes-extended/konkretcmpi/konkretcmpi/konkretcmpi-0.9.2-fix-returning-instance-from-method.patch
deleted file mode 100644
index b54d09159..000000000
--- a/meta-oe/recipes-extended/konkretcmpi/konkretcmpi/konkretcmpi-0.9.2-fix-returning-instance-from-method.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-Port from Fedora20
-
-    | commit aca6c7f910ffe9930b5789969f0adfadd668bb46
-    | Author: Michal Minar <miminar@redhat.com>
-    | Date:   Fri Jun 20 10:50:45 2014 +0200
-    | 
-    |     Fix returning instance as an output argument from method
-    |     
-    |     Submitted By: Radek Novacek <rnovacek@redhat.com>
-
-Upstream-Status: Pending
-Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
-
-diff --git a/src/program/main.cpp b/src/program/main.cpp
-index 885dc12..9e7108a 100644
---- a/src/program/main.cpp
-+++ b/src/program/main.cpp
-@@ -506,7 +506,11 @@ static void gen_feature_decls(
- 
-             // Add sig entry [type][length][name][zero-terminator]
- 
--            KTag tag = _ktag(pd->data_type, pd->array_index, key, false, false);
-+            KTag tag;
-+            if (pd->qualifiers->has_key("EmbeddedInstance"))
-+                tag = _ktag(TOK_INSTANCE, pd->array_index, key, false, false);
-+            else
-+                tag = _ktag(pd->data_type, pd->array_index, key, false, false);
-             pack_tag(sig, tag);
-             pack_name(sig, pd->name);
-             count++;
-@@ -640,6 +644,7 @@ static void gen_param(FILE* os, MOF_Parameter* p, vector<unsigned char>& sig)
-         const char* ktn = _ktype_name(p->data_type);
- 
-         if (p->qualifiers->has_key("EmbeddedInstance")) {
-+            tag = _ktag(TOK_INSTANCE, p->array_index, false, in, out);
-             if (p->array_index)
-                 put(os, "    KInstanceA $0;\n", p->name, NULL);
-             else
diff --git a/meta-oe/recipes-extended/konkretcmpi/konkretcmpi_0.9.2.bb b/meta-oe/recipes-extended/konkretcmpi/konkretcmpi_0.9.2.bb
index 1d8b0dbd4..4e4aa6cde 100644
--- a/meta-oe/recipes-extended/konkretcmpi/konkretcmpi_0.9.2.bb
+++ b/meta-oe/recipes-extended/konkretcmpi/konkretcmpi_0.9.2.bb
@@ -9,11 +9,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f673270bfc350d9ce1efc8724c6c1873"
 DEPENDS = "swig-native sblim-cmpi-devel python"
 
 SRC_URI = "git://github.com/rnovacek/konkretcmpi.git \
-           file://konkretcmpi-0.9.2-fix-returning-instance-from-method.patch \
            file://0001-CMakeLists.txt-fix-lib64-can-not-be-shiped-in-64bit-.patch \
+           file://0001-drop-including-rpath-cmake-module.patch \
            "
 
-SRCREV = "460e6421c16a8216d29ccd1b7490f814dab8b769"
+SRCREV = "ad28225e6eceff88417a60c1ba8896c8e40f21a7"
 S = "${WORKDIR}/git"
 
 inherit cmake
-- 
2.13.0


