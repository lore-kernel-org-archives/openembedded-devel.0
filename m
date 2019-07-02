Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id 16CE27E9FE
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Jul 2019 14:48:19 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id n4so18194829wrs.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Jul 2019 07:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wBDXDLFkhGS4swOIRQeaVXsNBatzXgM7Y2sJ5jyAKjQ=;
	b=eQy/nMP6eHr7UxkWKpTACpaTPVFq14w1AlcMDM9XPgQUv1UXnUgd/DKDiD6AdltP9Q
	JMZuPUXxjAlX6D1UwBXW9ZINDFPMypZOmEgfmQLl+SVzKMrcHT3XDnjLXNzQ8AU2lhKy
	o+dz+ZxLzEJD8JbCRi5xPY03q177kkWO4MV3RvLkCpcHUQGs8btuDQEXioAhyI2TjLVf
	nQaCr5RNpnE/AqJWPoPbvxhRRYeTqeSKVeYPh/4YjTo2aRMKSj40MnJox4w6FUHgaDnm
	emfU1duTUik3Qfb/JdvgyTlyt3xbgxWQda12iwpPtwsui/LgCaNpGTNL9g/d3QkUhveK
	EwvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=wBDXDLFkhGS4swOIRQeaVXsNBatzXgM7Y2sJ5jyAKjQ=;
	b=ai0EKw6ILYHdzCGC9NCdACYan+kkhIb3lFsr1pS8amLXFrJ9x+xFyDRoamtCaYL8Ji
	RTBfq3uKjEqTalCJ+JGnDArEYXQTtO5zYFS71yrAO2FNAo7cULchP2sMGQ5guBgJpCIi
	1OJgasr/i7y4TCqD+MTd68a3+TqgC17xCgBbMmyth0hLTV87GvUgx9dQDcflC6wM4gf5
	JGaGMFyaNKWZFrmlCqQ/AJGyIATv6N7U9RBDnZrDHccwkT4BBK9IsC7cgbjbPTfD40xQ
	r9GE92cBnNRLxYkcKzmogtRD3Pyde41b+/GTIRnWtETCs5NYb8SCVCJ+wpXTnZhM4oVu
	kaSQ==
X-Gm-Message-State: APjAAAXSf0pH8YmP9r9tuxOBgqB9g/fR1FDWxicXjRYNKN5/ZL0CvuHk
	8ypr/K6hblXF1auEjrdzEFC6rpk2
X-Google-Smtp-Source: APXvYqxHWEAW4TQLTdPjyWPwWdxOd1gB41OkU/Czow/f2TEBbLKvt50edOdJ5O9/PNlt/0JR2WQRuw==
X-Received: by 2002:adf:e50b:: with SMTP id j11mr23675059wrm.351.1562078899583;
	Tue, 02 Jul 2019 07:48:19 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	n125sm3981509wmf.6.2019.07.02.07.48.18
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 02 Jul 2019 07:48:18 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  2 Jul 2019 14:48:15 +0000
Message-Id: <20190702144816.7520-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190702144816.7520-1-Martin.Jansa@gmail.com>
References: <20190702144816.7520-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/3] protobuf: fix build with gold
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
X-List-Received-Date: Tue, 02 Jul 2019 14:48:19 -0000

* Makefile.am: include descriptor.pb.cc when building libprotoc.so

* otherwise plugin.pb.o has undefined symbol scc_info_FileDescriptorProto_google_2fprotobuf_2fdescriptor_2eproto
  and build with gold fails with:
  core2-32-oe-linux/protobuf/3.8.0-r0/recipe-sysroot-native/usr/bin/i686-oe-linux/../../libexec/i686-oe-linux/gcc/i686-oe-linux/9.1.0/ld.bfd: ./.libs/libprotoc.so: undefined reference to `descriptor_table_google_2fprotobuf_2fdescriptor_2eproto'
  core2-32-oe-linux/protobuf/3.8.0-r0/recipe-sysroot-native/usr/bin/i686-oe-linux/../../libexec/i686-oe-linux/gcc/i686-oe-linux/9.1.0/ld.bfd: ./.libs/libprotoc.so: undefined reference to `scc_info_FileDescriptorProto_google_2fprotobuf_2fdescriptor_2eproto'

* examples/Makefile: respect CXX,LDFLAGS variables, fix build with gold

* move pkg-config call to separate variable, so that the final version
  of the whole command so it's shown in log.do_compile_ptest_base
* add ../src/google/protobuf/.libs/timestamp.pb.o when linking
  add_person_cpp otherwise it fails to link with gold:
  i686-oe-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse --sysroot=core2-32-oe-linux/protobuf/3.8.0-r0/recipe-sysroot -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed add_person.cc addressbook.pb.cc -o add_person_cpp `pkg-config --cflags --libs protobuf`
  /tmp/cccjSJQs.o:addressbook.pb.cc:scc_info_Person_addressbook_2eproto: error: undefined reference to 'scc_info_Timestamp_google_2fprotobuf_2ftimestamp_2eproto'
  /tmp/cccjSJQs.o:addressbook.pb.cc:descriptor_table_addressbook_2eproto_deps: error: undefined reference to 'descriptor_table_google_2fprotobuf_2ftimestamp_2eproto'
  collect2: error: ld returned 1 exit status
  Makefile:43: recipe for target 'add_person_cpp' failed

* and the same with list_people_cpp this time with pkg-config already through the variable:
  i686-oe-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse --sysroot=core2-32-oe-linux/protobuf/3.8.0-r0/recipe-sysroot -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -pthread -Icore2-32-oe-linux/protobuf/3.8.0-r0/git/src -Lcore2-32-oe-linux/protobuf/3.8.0-r0/git/src/.libs -Lcore2-32-oe-linux/protobuf/3.8.0-r0/recipe-sysroot/usr/lib -lprotobuf list_people.cc addressbook.pb.cc -o list_people_cpp
  /tmp/ccpaI5Su.o:addressbook.pb.cc:scc_info_Person_addressbook_2eproto: error: undefined reference to 'scc_info_Timestamp_google_2fprotobuf_2ftimestamp_2eproto'
  /tmp/ccpaI5Su.o:addressbook.pb.cc:descriptor_table_addressbook_2eproto_deps: error: undefined reference to 'descriptor_table_google_2fprotobuf_2ftimestamp_2eproto'
  collect2: error: ld returned 1 exit status
  Makefile:49: recipe for target 'list_people_cpp' failed

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...ude-descriptor.cc-when-building-libp.patch | 28 ++++++++++
 ...e-respect-CXX-LDFLAGS-variables-fix-.patch | 56 +++++++++++++++++++
 .../protobuf/protobuf_3.8.0.bb                |  5 +-
 3 files changed, 86 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/protobuf/protobuf/0001-Makefile.am-include-descriptor.cc-when-building-libp.patch
 create mode 100644 meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/0001-Makefile.am-include-descriptor.cc-when-building-libp.patch b/meta-oe/recipes-devtools/protobuf/protobuf/0001-Makefile.am-include-descriptor.cc-when-building-libp.patch
new file mode 100644
index 0000000000..fc7286122c
--- /dev/null
+++ b/meta-oe/recipes-devtools/protobuf/protobuf/0001-Makefile.am-include-descriptor.cc-when-building-libp.patch
@@ -0,0 +1,28 @@
+From 321709837f412e2f590e36e3fe33571bb40036a7 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Thu, 27 Jun 2019 13:27:18 +0000
+Subject: [PATCH] Makefile.am: include descriptor.pb.cc when building libprotoc.so
+
+* otherwise plugin.pb.o has undefined symbol scc_info_FileDescriptorProto_google_2fprotobuf_2fdescriptor_2eproto
+  and build with gold fails with:
+  core2-32-oe-linux/protobuf/3.8.0-r0/recipe-sysroot-native/usr/bin/i686-oe-linux/../../libexec/i686-oe-linux/gcc/i686-oe-linux/9.1.0/ld.bfd: ./.libs/libprotoc.so: undefined reference to `descriptor_table_google_2fprotobuf_2fdescriptor_2eproto'
+  core2-32-oe-linux/protobuf/3.8.0-r0/recipe-sysroot-native/usr/bin/i686-oe-linux/../../libexec/i686-oe-linux/gcc/i686-oe-linux/9.1.0/ld.bfd: ./.libs/libprotoc.so: undefined reference to `scc_info_FileDescriptorProto_google_2fprotobuf_2fdescriptor_2eproto'
+
+Upstream-Status: Pending
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ src/Makefile.am | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/Makefile.am b/src/Makefile.am
+index be18ba761..57e3daec1 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -313,6 +313,7 @@ libprotoc_la_LDFLAGS += -Wl,--version-script=$(srcdir)/libprotoc.map
+ EXTRA_libprotoc_la_DEPENDENCIES = libprotoc.map
+ endif
+ libprotoc_la_SOURCES =                                         \
++  google/protobuf/descriptor.pb.cc                             \
+   google/protobuf/compiler/code_generator.cc                   \
+   google/protobuf/compiler/command_line_interface.cc           \
+   google/protobuf/compiler/plugin.cc                           \
diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch b/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch
new file mode 100644
index 0000000000..029abfdae3
--- /dev/null
+++ b/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch
@@ -0,0 +1,56 @@
+From a28e15092a298e0c73c6fc1ded0913275cf27cb0 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Fri, 28 Jun 2019 13:50:52 +0000
+Subject: [PATCH] examples/Makefile: respect CXX,LDFLAGS variables, fix build
+ with gold
+
+* move pkg-config call to separate variable, so that the final version
+  of the whole command so it's shown in log.do_compile_ptest_base
+* add ../src/google/protobuf/.libs/timestamp.pb.o when linking
+  add_person_cpp otherwise it fails to link with gold:
+  i686-oe-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse --sysroot=core2-32-oe-linux/protobuf/3.8.0-r0/recipe-sysroot -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed add_person.cc addressbook.pb.cc -o add_person_cpp `pkg-config --cflags --libs protobuf`
+  /tmp/cccjSJQs.o:addressbook.pb.cc:scc_info_Person_addressbook_2eproto: error: undefined reference to 'scc_info_Timestamp_google_2fprotobuf_2ftimestamp_2eproto'
+  /tmp/cccjSJQs.o:addressbook.pb.cc:descriptor_table_addressbook_2eproto_deps: error: undefined reference to 'descriptor_table_google_2fprotobuf_2ftimestamp_2eproto'
+  collect2: error: ld returned 1 exit status
+  Makefile:43: recipe for target 'add_person_cpp' failed
+
+* and the same with list_people_cpp this time with pkg-config already through the variable:
+  i686-oe-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse --sysroot=core2-32-oe-linux/protobuf/3.8.0-r0/recipe-sysroot -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -pthread -Icore2-32-oe-linux/protobuf/3.8.0-r0/git/src -Lcore2-32-oe-linux/protobuf/3.8.0-r0/git/src/.libs -Lcore2-32-oe-linux/protobuf/3.8.0-r0/recipe-sysroot/usr/lib -lprotobuf list_people.cc addressbook.pb.cc -o list_people_cpp
+  /tmp/ccpaI5Su.o:addressbook.pb.cc:scc_info_Person_addressbook_2eproto: error: undefined reference to 'scc_info_Timestamp_google_2fprotobuf_2ftimestamp_2eproto'
+  /tmp/ccpaI5Su.o:addressbook.pb.cc:descriptor_table_addressbook_2eproto_deps: error: undefined reference to 'descriptor_table_google_2fprotobuf_2ftimestamp_2eproto'
+  collect2: error: ld returned 1 exit status
+  Makefile:49: recipe for target 'list_people_cpp' failed
+
+Upstream-Status: Pending
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ examples/Makefile | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/examples/Makefile b/examples/Makefile
+index 4ad605641..31d887639 100644
+--- a/examples/Makefile
++++ b/examples/Makefile
+@@ -2,6 +2,8 @@
+ 
+ .PHONY: all cpp java python clean
+ 
++PROTOBUF := $(shell pkg-config --cflags --libs protobuf)
++
+ all: cpp java python
+ 
+ cpp:    add_person_cpp    list_people_cpp
+@@ -41,11 +43,11 @@ protoc_middleman_dart: addressbook.proto
+ 
+ add_person_cpp: add_person.cc protoc_middleman
+ 	pkg-config --cflags protobuf  # fails if protobuf is not installed
+-	c++ add_person.cc addressbook.pb.cc -o add_person_cpp `pkg-config --cflags --libs protobuf`
++	$(CXX) $(LDFLAGS) $(PROTOBUF) ../src/google/protobuf/.libs/timestamp.pb.o add_person.cc addressbook.pb.cc -o add_person_cpp
+ 
+ list_people_cpp: list_people.cc protoc_middleman
+ 	pkg-config --cflags protobuf  # fails if protobuf is not installed
+-	c++ list_people.cc addressbook.pb.cc -o list_people_cpp `pkg-config --cflags --libs protobuf`
++	$(CXX) $(LDFLAGS) $(PROTOBUF) ../src/google/protobuf/.libs/timestamp.pb.o list_people.cc addressbook.pb.cc -o list_people_cpp
+ 
+ add_person_dart: add_person.dart protoc_middleman_dart
+ 
diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.8.0.bb b/meta-oe/recipes-devtools/protobuf/protobuf_3.8.0.bb
index 476d1e3091..be5caa4da4 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_3.8.0.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.8.0.bb
@@ -16,6 +16,8 @@ SRC_URI = "git://github.com/google/protobuf.git;branch=3.8.x \
            file://run-ptest \
            file://0001-protobuf-fix-configure-error.patch \
            file://0001-Added-stubs-map_util.h-to-list-of-installed-headers.patch \
+           file://0001-Makefile.am-include-descriptor.cc-when-building-libp.patch \
+           file://0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch \
 "
 S = "${WORKDIR}/git"
 
@@ -30,9 +32,6 @@ TEST_SRC_DIR = "examples"
 LANG_SUPPORT = "cpp ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python', '', d)}"
 
 do_compile_ptest() {
-	# Modify makefile to use the cross-compiler
-	sed -e "s|c++|${CXX} \$(LDFLAGS)|g" -i "${S}/${TEST_SRC_DIR}/Makefile"
-
 	mkdir -p "${B}/${TEST_SRC_DIR}"
 
 	# Add the location of the cross-compiled header and library files
-- 
2.17.1


