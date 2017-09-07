Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id AE84177D6F
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Sep 2017 03:58:12 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id h4so577979pfk.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Sep 2017 20:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BRqt2Zsqd6IgGpzaqaaMYahuaIhMWIZgbLk8iLtC2wU=;
	b=FIJL4h5lG7oD7IzJrHNwQUrF5wKK7YmkOBmnDmMzUYNAjphApFO7wLN4rkua9zAf3O
	aMdKHC9Qc455GNya8qMjAUXRGqAqZjxU/gxo5m1o1vcVBTRBxiaDPE1oXGOMg3Drs6lP
	KPxuXgVP2nG7NtG5MIVYygWD2Jo+2iriaVb5D4tNq+rpSccMwLhqZoxDiwo663wt2V23
	kAkuYKlf61J23wBuxbN9xBgOEliRMDP/cimWi736bNQ152cFyjixbLNieK0ww1VjSaxn
	uRr65JCt5KjFVQKjHXs4UJQg+dcofKR3UFqvS1h+xul3cDvXz5tlEquCzc4Vo/F+HzG7
	MspA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=BRqt2Zsqd6IgGpzaqaaMYahuaIhMWIZgbLk8iLtC2wU=;
	b=sBhVbvlKWnJJy7DoXS91PWXbnqD4VwY+9rR6N02hWL7D6gvAOYKn8MKdHF35W/yKsD
	RxwTS3lsIuUl923OctXwO+rRy4AWVt+R44RnAZQ73v5vTQUNwvhktDJvup7VWKvbhCAj
	vyQFS/iPPklkNzKyMsnW52wEQVEXvuyFKEZioseKwjo3cBZseHlzp0e+fsb8dgJ6PaHo
	fgEXymwzVmhnfuSlDGsU7q3lVq28dkg/9X/YDNb5Bw8C6PuXmYo6PcY745LUqJWFH+Tc
	fuj8N6PcRTjiRINXkrPfnuOj7V7WDTMwfswg1IHqvjAHKqb8lCTeJzbvSCQt4vyxbxre
	Fgzg==
X-Gm-Message-State: AHPjjUhgnj2fUlKiULdC7HDc4eZya3dVu2labogEiYc3UooZplEZQSTm
	iE2JoStWNQmdnnKC
X-Google-Smtp-Source: ADKCNb5TcgKGARjS3Ns7ZVsHnnVgChFSlium0V0n4d5rz2P/Nf52SA+qFEsXA4hiVk9Or2CQDAfTuQ==
X-Received: by 10.98.12.19 with SMTP id u19mr1329904pfi.143.1504756693715;
	Wed, 06 Sep 2017 20:58:13 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::be3d])
	by smtp.gmail.com with ESMTPSA id 13sm1637379pfi.55.2017.09.06.20.58.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Sep 2017 20:58:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Sep 2017 20:57:55 -0700
Message-Id: <20170907035758.41689-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170907035758.41689-1-raj.khem@gmail.com>
References: <20170907035758.41689-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH V2 2/5] leveldb: Fix build with clang
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
X-List-Received-Date: Thu, 07 Sep 2017 03:58:12 -0000

Add build parallelism, since we do not use oe_runmake

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...uild_detect_platform-Check-for-__SSE4_2__.patch | 36 ++++++++++++++++++
 .../0002-makefile-build-SHARED_MEMENVLIB.patch     | 43 ++++++++++++++++++++++
 meta-oe/recipes-extended/leveldb/leveldb_git.bb    |  6 ++-
 3 files changed, 83 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-extended/leveldb/leveldb/0001-build_detect_platform-Check-for-__SSE4_2__.patch
 create mode 100644 meta-oe/recipes-extended/leveldb/leveldb/0002-makefile-build-SHARED_MEMENVLIB.patch

diff --git a/meta-oe/recipes-extended/leveldb/leveldb/0001-build_detect_platform-Check-for-__SSE4_2__.patch b/meta-oe/recipes-extended/leveldb/leveldb/0001-build_detect_platform-Check-for-__SSE4_2__.patch
new file mode 100644
index 000000000..bbabf688d
--- /dev/null
+++ b/meta-oe/recipes-extended/leveldb/leveldb/0001-build_detect_platform-Check-for-__SSE4_2__.patch
@@ -0,0 +1,36 @@
+From 5fd0918df2bb30e8f3edb2ee895d178edbf26f40 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 4 Sep 2017 22:38:03 -0700
+Subject: [PATCH 1/2] build_detect_platform: Check for __SSE4_2__
+
+just using -msse4.2 is not enough, especially with clang
+where it may accept -msse4.2 even during cross compiling
+for say arm, however the difference is that builtin defines
+wont be defined.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ build_detect_platform | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+Index: git/build_detect_platform
+===================================================================
+--- git.orig/build_detect_platform
++++ git/build_detect_platform
+@@ -230,13 +230,12 @@ EOF
+     rm -f $CXXOUTPUT 2>/dev/null
+ 
+     # Test if gcc SSE 4.2 is supported
+-    $CXX $CXXFLAGS -x c++ - -o $CXXOUTPUT -msse4.2 2>/dev/null  <<EOF
++    $CXX $CXXFLAGS -Werror -x c++ - -o $CXXOUTPUT -msse4.2 -dD -E 2>/dev/null | fgrep __SSE4_2__ $CXXOUTPUT 2>/dev/null  <<EOF
+       int main() {}
+ EOF
+     if [ "$?" = 0 ]; then
+         PLATFORM_SSEFLAGS="-msse4.2"
+     fi
+-
+     rm -f $CXXOUTPUT 2>/dev/null
+ fi
+ 
diff --git a/meta-oe/recipes-extended/leveldb/leveldb/0002-makefile-build-SHARED_MEMENVLIB.patch b/meta-oe/recipes-extended/leveldb/leveldb/0002-makefile-build-SHARED_MEMENVLIB.patch
new file mode 100644
index 000000000..fc708b23a
--- /dev/null
+++ b/meta-oe/recipes-extended/leveldb/leveldb/0002-makefile-build-SHARED_MEMENVLIB.patch
@@ -0,0 +1,43 @@
+From 1ed8cec1fcf666904bb3ebd29fc85e235b72d122 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 4 Sep 2017 22:40:49 -0700
+Subject: [PATCH 2/2] makefile: build SHARED_MEMENVLIB
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ Makefile | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index f7cc7d7..cb42278 100644
+--- a/Makefile
++++ b/Makefile
+@@ -126,12 +126,12 @@ SHARED_VERSION_MINOR = 20
+ SHARED_LIB1 = libleveldb.$(PLATFORM_SHARED_EXT)
+ SHARED_LIB2 = $(SHARED_LIB1).$(SHARED_VERSION_MAJOR)
+ SHARED_LIB3 = $(SHARED_LIB1).$(SHARED_VERSION_MAJOR).$(SHARED_VERSION_MINOR)
+-SHARED_LIBS = $(SHARED_OUTDIR)/$(SHARED_LIB1) $(SHARED_OUTDIR)/$(SHARED_LIB2) $(SHARED_OUTDIR)/$(SHARED_LIB3)
++SHARED_LIBS = $(SHARED_OUTDIR)/$(SHARED_LIB1) $(SHARED_OUTDIR)/$(SHARED_LIB2) $(SHARED_OUTDIR)/$(SHARED_LIB3) $(SHARED_MEMENVLIB)
+ $(SHARED_OUTDIR)/$(SHARED_LIB1): $(SHARED_OUTDIR)/$(SHARED_LIB3)
+ 	ln -fs $(SHARED_LIB3) $(SHARED_OUTDIR)/$(SHARED_LIB1)
+ $(SHARED_OUTDIR)/$(SHARED_LIB2): $(SHARED_OUTDIR)/$(SHARED_LIB3)
+ 	ln -fs $(SHARED_LIB3) $(SHARED_OUTDIR)/$(SHARED_LIB2)
+-SHARED_MEMENVLIB = $(SHARED_OUTDIR)/libmemenv.a
++SHARED_MEMENVLIB = $(SHARED_OUTDIR)/libmemenv.$(PLATFORM_SHARED_EXT).$(SHARED_VERSION_MAJOR).$(SHARED_VERSION_MINOR)
+ endif
+ 
+ $(SHARED_OUTDIR)/$(SHARED_LIB3): $(SHARED_LIBOBJECTS)
+@@ -294,7 +294,7 @@ endif
+ 
+ $(SHARED_MEMENVLIB):$(SHARED_MEMENVOBJECTS)
+ 	rm -f $@
+-	$(AR) -rs $@ $(SHARED_MEMENVOBJECTS)
++	$(CXX) $(LDFLAGS) $(PLATFORM_SHARED_LDFLAGS)$(basename $(notdir $(SHARED_MEMENVLIB))) $(SHARED_MEMENVOBJECTS) -o $(SHARED_MEMENVLIB) $(LIBS)
+ 
+ $(STATIC_OUTDIR)/db_bench:db/db_bench.cc $(STATIC_LIBOBJECTS) $(TESTUTIL)
+ 	$(CXX) $(LDFLAGS) $(CXXFLAGS) db/db_bench.cc $(STATIC_LIBOBJECTS) $(TESTUTIL) -o $@ $(LIBS)
+-- 
+2.14.1
+
diff --git a/meta-oe/recipes-extended/leveldb/leveldb_git.bb b/meta-oe/recipes-extended/leveldb/leveldb_git.bb
index d44aa14d2..93ae2fdea 100644
--- a/meta-oe/recipes-extended/leveldb/leveldb_git.bb
+++ b/meta-oe/recipes-extended/leveldb/leveldb_git.bb
@@ -8,7 +8,9 @@ SRCREV = "a53934a3ae1244679f812d998a4f16f2c7f309a6"
 PV = "1.20+git${SRCPV}"
 
 SRC_URI = "git://github.com/google/${BPN}.git \
-"
+           file://0001-build_detect_platform-Check-for-__SSE4_2__.patch \
+           file://0002-makefile-build-SHARED_MEMENVLIB.patch \
+           "
 
 S = "${WORKDIR}/git"
 
@@ -17,7 +19,7 @@ inherit utils
 do_compile() {
     # do not use oe_runmake. oe_runmake pass to make compilation arguments and override
     # leveldb makefile variable CFLAGS and broke leveldb build.
-    CFLAGS="${CFLAGS}" make || die
+    CFLAGS="${CFLAGS}" make ${PARALLEL_MAKE}|| die
 }
 
 do_install() {
-- 
2.14.1


