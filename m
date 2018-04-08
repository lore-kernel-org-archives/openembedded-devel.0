Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id 448F375577
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Apr 2018 06:59:15 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id v5-v6so3198847plo.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Apr 2018 23:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=b3nfS+YMZHhsokA0+PtKu9qHe96Sv/eTvbt9eXnJ/xw=;
	b=RgBFSjQ+T0qm8YVW3oDa2p12e3chAPLWksTsDHPpnaWH5FFLYJOJQgdZWJN4KpuOzV
	/NtrTbIpaMx1wyuwJCn5ap7IGWGbJcJF04IFwlJhLxp0g9xXQoHm3dK+EDQXOYoHSRG8
	zBs9P5VAdf0ovzzgrt/LVMrfiE4gTq/U8vYD/J360ACxrDbuUWRTOZ+e7LI6UN1Up2FF
	8crzkSnjZ4jJSVe/zCck7NJdqpKIVlqioaf8ho3Yz41gGOgfsA5eqMViq96UwSWvy43r
	QjbFiste+CW8ex5c0LhTAOtFqUFIvAw+khLbyvT4csTiGLaqff9hZT04CpdRrL0b9GGC
	roOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=b3nfS+YMZHhsokA0+PtKu9qHe96Sv/eTvbt9eXnJ/xw=;
	b=jorX7I2gRtdg5+KZjvue2Q7aIfu7KvbbL2RObL6k9JhAMRtdZ+9RzmfYBwzVR1wzCO
	oCR07qKmhciPZkB0+Yw25F3vmjajmoLozIwmULjTOJqQjcBtCXc3U7w+Sw+bE9pFNlm9
	aB3xi9HVDrwnGxF5sw/MmGWSIlypJ0dXFLzwMqn7QbW/NrNIuuTyZuiIsVJjLj6EOW7M
	y8WOmN0sEL77hn1pG0grLIVP3gONd7CQv3B9JabPCGKR1ufZ9FIG+ZD+CQMgw7tzIHcP
	mdau+TwU8CXzJGVzRns6JhaWixJMqx0m7FR1Dw5Sbx3TAoKq3Ka4XXE3X1BSUHTuXjuc
	ZbUA==
X-Gm-Message-State: AElRT7Ha1+r8CJrC3aFaXi9ulL9jYVCePZ9NDQU8AiGEZBdhwcqmVO8w
	lJLhc1OJ9uzckxvMOt8rRT198A==
X-Google-Smtp-Source: AIpwx49iCpYYPncJGHKsTuSAKCtjfSiVp6lhH9/BmV93Ou/vtaDgfhCI1fS9xgfTG/6tkXSlFzXbMg==
X-Received: by 2002:a17:902:ba87:: with SMTP id
	k7-v6mr34378048pls.124.1523170757013; 
	Sat, 07 Apr 2018 23:59:17 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:932:e5ef:c5a4:fdbd])
	by smtp.gmail.com with ESMTPSA id
	c186sm20506137pfb.40.2018.04.07.23.59.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 07 Apr 2018 23:59:16 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sat,  7 Apr 2018 23:58:37 -0700
Message-Id: <1523170729-26321-25-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1523170729-26321-1-git-send-email-akuster808@gmail.com>
References: <1523170729-26321-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 25/37] mongodb: refresh patches
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
X-List-Received-Date: Sun, 08 Apr 2018 06:59:16 -0000

WARNING: mongodb-3.4.13+gitAUTOINC+fbdef2ccc5-r0 do_patch:
Some of the context lines in patches were ignored. This can lead to incorrectly applied patches.
The context lines in the patches can be updated with devtool:

    devtool modify <recipe>
    devtool finish --force-patch-refresh <recipe> <layer_path>

Then the updated patches and the source tree (in devtool's workspace)
should be reviewed to make sure the patches apply in the correct place
and don't introduce duplicate lines (which can, and does happen
when some of the context is ignored). Further information:
http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148675.html
https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450
Details:
Applying patch 0001-Tell-scons-to-use-build-settings-from-environment-va.patch
patching file SConstruct
Hunk #1 succeeded at 548 (offset 41 lines).
Hunk #2 succeeded at 628 with fuzz 1 (offset 59 lines).
Hunk #3 succeeded at 649 (offset 59 lines).
Hunk #4 succeeded at 898 (offset 77 lines).
patching file src/mongo/util/SConscript
Hunk #1 succeeded at 274 with fuzz 2 (offset 23 lines).

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...to-use-build-settings-from-environment-va.patch | 37 +++++++++----------
 .../mongodb/0001-mongo-Add-using-std-string.patch  | 43 ++++++++++------------
 2 files changed, 37 insertions(+), 43 deletions(-)

diff --git a/meta-oe/recipes-dbs/mongodb/mongodb/0001-Tell-scons-to-use-build-settings-from-environment-va.patch b/meta-oe/recipes-dbs/mongodb/mongodb/0001-Tell-scons-to-use-build-settings-from-environment-va.patch
index 09d49d2..aa01e95 100644
--- a/meta-oe/recipes-dbs/mongodb/mongodb/0001-Tell-scons-to-use-build-settings-from-environment-va.patch
+++ b/meta-oe/recipes-dbs/mongodb/mongodb/0001-Tell-scons-to-use-build-settings-from-environment-va.patch
@@ -9,11 +9,11 @@ Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
  src/mongo/util/SConscript | 2 ++
  2 files changed, 8 insertions(+), 2 deletions(-)
 
-diff --git a/SConstruct b/SConstruct
-index 5082a4b..3370f70 100644
---- a/SConstruct
-+++ b/SConstruct
-@@ -507,6 +507,7 @@ def variable_arch_converter(val):
+Index: git/SConstruct
+===================================================================
+--- git.orig/SConstruct
++++ git/SConstruct
+@@ -548,6 +548,7 @@ def variable_arch_converter(val):
          'amd64':  'x86_64',
          'emt64':   'x86_64',
          'x86':    'i386',
@@ -21,8 +21,8 @@ index 5082a4b..3370f70 100644
      }
      val = val.lower()
  
-@@ -568,7 +569,8 @@ env_vars.Add('ARFLAGS',
-     converter=variable_shlex_converter)
+@@ -627,7 +628,8 @@ env_vars.Add(
+ )
  
  env_vars.Add('CC',
 -    help='Select the C compiler to use')
@@ -31,7 +31,7 @@ index 5082a4b..3370f70 100644
  
  env_vars.Add('CCFLAGS',
      help='Sets flags for the C and C++ compiler',
-@@ -588,7 +590,8 @@ env_vars.Add('CPPPATH',
+@@ -647,7 +649,8 @@ env_vars.Add('CPPPATH',
      converter=variable_shlex_converter)
  
  env_vars.Add('CXX',
@@ -41,7 +41,7 @@ index 5082a4b..3370f70 100644
  
  env_vars.Add('CXXFLAGS',
      help='Sets flags for the C++ compiler',
-@@ -818,6 +821,7 @@ envDict = dict(BUILD_ROOT=buildDir,
+@@ -895,6 +898,7 @@ envDict = dict(BUILD_ROOT=buildDir,
                 )
  
  env = Environment(variables=env_vars, **envDict)
@@ -49,19 +49,16 @@ index 5082a4b..3370f70 100644
  del envDict
  
  env.AddMethod(env_os_is_wrapper, 'TargetOSIs')
-diff --git a/src/mongo/util/SConscript b/src/mongo/util/SConscript
-index 6add602..8d05a62 100644
---- a/src/mongo/util/SConscript
-+++ b/src/mongo/util/SConscript
-@@ -251,6 +251,8 @@ if get_option('allocator') == 'tcmalloc':
-                 'MONGO_HAVE_GPERFTOOLS_GET_THREAD_CACHE_SIZE'
+Index: git/src/mongo/util/SConscript
+===================================================================
+--- git.orig/src/mongo/util/SConscript
++++ git/src/mongo/util/SConscript
+@@ -274,6 +274,8 @@ if env['MONGO_ALLOCATOR'] == 'tcmalloc':
+                 'MONGO_HAVE_GPERFTOOLS_SIZE_CLASS_STATS'
              ]
          )
 +    if not use_system_version_of_library('valgrind'):
 +        tcmspEnv.InjectThirdPartyIncludePaths('valgrind')
  
-     tcmspEnv.Library(
-         target='tcmalloc_set_parameter',
--- 
-1.9.1
-
+     if not use_system_version_of_library('valgrind'):
+         # Include valgrind since tcmalloc disables itself while running under valgrind
diff --git a/meta-oe/recipes-dbs/mongodb/mongodb/0001-mongo-Add-using-std-string.patch b/meta-oe/recipes-dbs/mongodb/mongodb/0001-mongo-Add-using-std-string.patch
index e517d53..ad9ff5a 100644
--- a/meta-oe/recipes-dbs/mongodb/mongodb/0001-mongo-Add-using-std-string.patch
+++ b/meta-oe/recipes-dbs/mongodb/mongodb/0001-mongo-Add-using-std-string.patch
@@ -18,22 +18,22 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  src/mongo/util/net/miniwebserver.cpp     | 1 +
  4 files changed, 5 insertions(+)
 
-diff --git a/src/mongo/db/dbwebserver.cpp b/src/mongo/db/dbwebserver.cpp
-index b202e0500b..0255613524 100644
---- a/src/mongo/db/dbwebserver.cpp
-+++ b/src/mongo/db/dbwebserver.cpp
-@@ -67,6 +67,7 @@ namespace mongo {
- using std::map;
+Index: git/src/mongo/db/dbwebserver.cpp
+===================================================================
+--- git.orig/src/mongo/db/dbwebserver.cpp
++++ git/src/mongo/db/dbwebserver.cpp
+@@ -68,6 +68,7 @@ using std::map;
+ using std::string;
  using std::stringstream;
  using std::vector;
 +using std::string;
  
  using namespace html;
  
-diff --git a/src/mongo/db/matcher/expression_leaf.cpp b/src/mongo/db/matcher/expression_leaf.cpp
-index d562bff141..4d931985e2 100644
---- a/src/mongo/db/matcher/expression_leaf.cpp
-+++ b/src/mongo/db/matcher/expression_leaf.cpp
+Index: git/src/mongo/db/matcher/expression_leaf.cpp
+===================================================================
+--- git.orig/src/mongo/db/matcher/expression_leaf.cpp
++++ git/src/mongo/db/matcher/expression_leaf.cpp
 @@ -44,6 +44,8 @@
  #include "mongo/stdx/memory.h"
  #include "mongo/util/mongoutils/str.h"
@@ -43,10 +43,10 @@ index d562bff141..4d931985e2 100644
  namespace mongo {
  
  Status LeafMatchExpression::setPath(StringData path) {
-diff --git a/src/mongo/db/repl/master_slave.cpp b/src/mongo/db/repl/master_slave.cpp
-index 05faad1259..ea25d7151b 100644
---- a/src/mongo/db/repl/master_slave.cpp
-+++ b/src/mongo/db/repl/master_slave.cpp
+Index: git/src/mongo/db/repl/master_slave.cpp
+===================================================================
+--- git.orig/src/mongo/db/repl/master_slave.cpp
++++ git/src/mongo/db/repl/master_slave.cpp
 @@ -78,6 +78,7 @@ using std::endl;
  using std::max;
  using std::min;
@@ -55,18 +55,15 @@ index 05faad1259..ea25d7151b 100644
  using std::stringstream;
  using std::unique_ptr;
  using std::vector;
-diff --git a/src/mongo/util/net/miniwebserver.cpp b/src/mongo/util/net/miniwebserver.cpp
-index 5f4165d42f..239720c349 100644
---- a/src/mongo/util/net/miniwebserver.cpp
-+++ b/src/mongo/util/net/miniwebserver.cpp
-@@ -46,6 +46,7 @@ namespace mongo {
- 
+Index: git/src/mongo/util/net/miniwebserver.cpp
+===================================================================
+--- git.orig/src/mongo/util/net/miniwebserver.cpp
++++ git/src/mongo/util/net/miniwebserver.cpp
+@@ -47,6 +47,7 @@ namespace mongo {
  using std::shared_ptr;
+ using std::string;
  using std::stringstream;
 +using std::string;
  using std::vector;
  
  MiniWebServer::MiniWebServer(const string& name, const string& ip, int port, ServiceContext* ctx)
--- 
-2.13.3
-
-- 
2.7.4


