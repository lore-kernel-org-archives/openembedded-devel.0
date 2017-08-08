Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f46.google.com (mail-pg0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id 7785877BC3
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Aug 2017 21:48:17 +0000 (UTC)
Received: by mail-pg0-f46.google.com with SMTP id v189so19857484pgd.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Aug 2017 14:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=nLXcdjKjIlBEDXZHCZQmjzUoe9w+Vs4WoI7M1rD/AeE=;
	b=N3s19+AkoOtM4lujjPu1HE+3W7JlYHEWJjI3M+LNt0aujWc8AA6WUkmIRFQCHMsPG+
	34Ov1gS5zac6P1RCYYjrEfan0D+WY6TUk02vscBUNWxqf5cNI642czkYE9q41svPfQKf
	QPSX9CGwKChGKxuxZVxDBkTSPamROFUkg3LhLqlblVMdiqE2CpW1kOzOUKjk/tRuaos4
	zPdjq/9EHJhDmXUmyMlrUzsKakCReCCXo16IxhQUQgNM+yylinwlVm+yCOXlfuuTIotY
	dNoZKj6TupvrAGVtfpdSWsVDyGmE1i24nqGt7K48a0/H/AoItG6nPe3wpWSAVV0JOJp5
	Z19Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=nLXcdjKjIlBEDXZHCZQmjzUoe9w+Vs4WoI7M1rD/AeE=;
	b=an563PWH9Yup04kWGP+psIH3v4DvTz2MvlCboVHbUyj3NAhlLkJpoNsWF5yTKRkQJR
	Ibn3cT55pAO6yw6CFc1+Qvx3FTdCOKesNIg8OuKl1tgycNgxI3dEicLVwcs4z4FT5DFL
	xRMhubm2griHjjDsW8JMg4DfkPEl0N77+WmRDo3P2EkTsdw1KbM99z2zAi4vOGL1FagZ
	hmKuSNduhdNl7RagNFIE/9vaRBNRnswAZwnMdgjpy0yOJnvaTla5/CjbSfG8Dlkohvx7
	boXWo46Dmr2/hZKdd+AO/+Z/l+kEkOdfo0Yc6eTxI2f0pSGEEMPnDJCaip8mtoB0QndI
	nF8w==
X-Gm-Message-State: AHYfb5iKw3dRgBl5OZ1oCfJIkJLSEFKrCWcifBldi55rLiYzAnrIYtQ2
	PDShQMAgUGAMu78a
X-Received: by 10.99.42.212 with SMTP id q203mr5426399pgq.448.1502228898343;
	Tue, 08 Aug 2017 14:48:18 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::f213])
	by smtp.gmail.com with ESMTPSA id
	d135sm2768713pga.6.2017.08.08.14.48.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Aug 2017 14:48:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Aug 2017 14:47:56 -0700
Message-Id: <20170808214800.39621-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.0
In-Reply-To: <20170808214800.39621-1-raj.khem@gmail.com>
References: <20170808214800.39621-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 5/9] mongodb: Upgrade to 3.4.6
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
X-List-Received-Date: Tue, 08 Aug 2017 21:48:17 -0000

Add missing Zlib to license list
Add patches to fix build issue with gcc7 and missing internal build dependency

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../mongodb/0001-mongo-Add-using-std-string.patch  | 72 ++++++++++++++++++++++
 ...-Add-missing-dependenncy-on-local_shardin.patch | 28 +++++++++
 meta-oe/recipes-support/mongodb/mongodb_git.bb     | 12 ++--
 3 files changed, 107 insertions(+), 5 deletions(-)
 create mode 100644 meta-oe/recipes-support/mongodb/mongodb/0001-mongo-Add-using-std-string.patch
 create mode 100644 meta-oe/recipes-support/mongodb/mongodb/0002-d_state.cpp-Add-missing-dependenncy-on-local_shardin.patch

diff --git a/meta-oe/recipes-support/mongodb/mongodb/0001-mongo-Add-using-std-string.patch b/meta-oe/recipes-support/mongodb/mongodb/0001-mongo-Add-using-std-string.patch
new file mode 100644
index 000000000..e517d53d1
--- /dev/null
+++ b/meta-oe/recipes-support/mongodb/mongodb/0001-mongo-Add-using-std-string.patch
@@ -0,0 +1,72 @@
+From 5fdec9592285f5976345fbccb3d07fae1245ab53 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 2 Aug 2017 15:41:22 -0700
+Subject: [PATCH] mongo: Add using std::string
+
+This is needed with latest clang
+Fixes
+src/mongo/db/dbwebserver.cpp:206:23: error: use of undeclared identifier 'string'; did you mean 'String'?
+        static vector<string> commands;
+                      ^~~~~~
+                      String
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/mongo/db/dbwebserver.cpp             | 1 +
+ src/mongo/db/matcher/expression_leaf.cpp | 2 ++
+ src/mongo/db/repl/master_slave.cpp       | 1 +
+ src/mongo/util/net/miniwebserver.cpp     | 1 +
+ 4 files changed, 5 insertions(+)
+
+diff --git a/src/mongo/db/dbwebserver.cpp b/src/mongo/db/dbwebserver.cpp
+index b202e0500b..0255613524 100644
+--- a/src/mongo/db/dbwebserver.cpp
++++ b/src/mongo/db/dbwebserver.cpp
+@@ -67,6 +67,7 @@ namespace mongo {
+ using std::map;
+ using std::stringstream;
+ using std::vector;
++using std::string;
+ 
+ using namespace html;
+ 
+diff --git a/src/mongo/db/matcher/expression_leaf.cpp b/src/mongo/db/matcher/expression_leaf.cpp
+index d562bff141..4d931985e2 100644
+--- a/src/mongo/db/matcher/expression_leaf.cpp
++++ b/src/mongo/db/matcher/expression_leaf.cpp
+@@ -44,6 +44,8 @@
+ #include "mongo/stdx/memory.h"
+ #include "mongo/util/mongoutils/str.h"
+ 
++using std::string;
++
+ namespace mongo {
+ 
+ Status LeafMatchExpression::setPath(StringData path) {
+diff --git a/src/mongo/db/repl/master_slave.cpp b/src/mongo/db/repl/master_slave.cpp
+index 05faad1259..ea25d7151b 100644
+--- a/src/mongo/db/repl/master_slave.cpp
++++ b/src/mongo/db/repl/master_slave.cpp
+@@ -78,6 +78,7 @@ using std::endl;
+ using std::max;
+ using std::min;
+ using std::set;
++using std::string;
+ using std::stringstream;
+ using std::unique_ptr;
+ using std::vector;
+diff --git a/src/mongo/util/net/miniwebserver.cpp b/src/mongo/util/net/miniwebserver.cpp
+index 5f4165d42f..239720c349 100644
+--- a/src/mongo/util/net/miniwebserver.cpp
++++ b/src/mongo/util/net/miniwebserver.cpp
+@@ -46,6 +46,7 @@ namespace mongo {
+ 
+ using std::shared_ptr;
+ using std::stringstream;
++using std::string;
+ using std::vector;
+ 
+ MiniWebServer::MiniWebServer(const string& name, const string& ip, int port, ServiceContext* ctx)
+-- 
+2.13.3
+
diff --git a/meta-oe/recipes-support/mongodb/mongodb/0002-d_state.cpp-Add-missing-dependenncy-on-local_shardin.patch b/meta-oe/recipes-support/mongodb/mongodb/0002-d_state.cpp-Add-missing-dependenncy-on-local_shardin.patch
new file mode 100644
index 000000000..95f9c1c1c
--- /dev/null
+++ b/meta-oe/recipes-support/mongodb/mongodb/0002-d_state.cpp-Add-missing-dependenncy-on-local_shardin.patch
@@ -0,0 +1,28 @@
+From 5759878e5d278f11a1063e8fccd1e6b7b54caadf Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 2 Aug 2017 16:25:37 -0700
+Subject: [PATCH 2/2] d_state.cpp: Add missing dependenncy on
+ local_sharding_info
+
+Fixes
+| src/mongo/s/d_state.cpp:81: error: undefined reference to 'mongo::enableLocalShardingInfo(mongo::ServiceContext*, std::function<bool (mongo::OperationContext*, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&)>)'
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/mongo/s/SConscript | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/mongo/s/SConscript b/src/mongo/s/SConscript
+index 71720be517..51bd199127 100644
+--- a/src/mongo/s/SConscript
++++ b/src/mongo/s/SConscript
+@@ -317,5 +317,6 @@ env.Library(
+         "$BUILD_DIR/mongo/db/s/sharding",
+         "$BUILD_DIR/mongo/executor/network_interface_factory",
+         "$BUILD_DIR/mongo/s/client/shard_local",
++        "$BUILD_DIR/mongo/s/local_sharding_info",
+     ],
+ )
+-- 
+2.13.3
+
diff --git a/meta-oe/recipes-support/mongodb/mongodb_git.bb b/meta-oe/recipes-support/mongodb/mongodb_git.bb
index f1a65550e..b38641cff 100644
--- a/meta-oe/recipes-support/mongodb/mongodb_git.bb
+++ b/meta-oe/recipes-support/mongodb/mongodb_git.bb
@@ -1,16 +1,18 @@
 SUMMARY = "mongodb"
-LICENSE = "AGPL-3.0 & Apache-2.0"
+LICENSE = "AGPL-3.0 & Apache-2.0 & Zlib"
 LIC_FILES_CHKSUM = "file://GNU-AGPL-3.0.txt;md5=73f1eb20517c55bf9493b7dd6e480788 \
                     file://APACHE-2.0.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-DEPENDS = "openssl libpcre libpcap zlib"
+DEPENDS = "openssl libpcre libpcap zlib python boost"
 
 inherit scons
 
-PV = "3.3.0+git${SRCPV}"
-SRCREV = "aacd231be0626a204cb40908afdf62c4b67bb0ad"
-SRC_URI = "git://github.com/mongodb/mongo.git;branch=master \
+PV = "3.4.6+git${SRCPV}"
+SRCREV = "c55eb86ef46ee7aede3b1e2a5d184a7df4bfb5b5"
+SRC_URI = "git://github.com/mongodb/mongo.git;branch=v3.4 \
            file://0001-Tell-scons-to-use-build-settings-from-environment-va.patch \
+           file://0001-mongo-Add-using-std-string.patch \
+           file://0002-d_state.cpp-Add-missing-dependenncy-on-local_shardin.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.14.0


