Return-Path: <akuster808@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6E5917495D
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Apr 2018 15:57:59 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id u84-v6so5390624oie.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Apr 2018 08:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=gYtCPBMwj6C4ijDnkNQPCGQal3DggPYX5pxVDGZud7Q=;
	b=laczXQEvgfpB+wGSGIdc00S84p30KzNumOOrp1FLPAFmSa+02vBBYs3+5vRonYa0SS
	jPQTXOBBw1yE3017jL+BX22I9cucjv8tG9OMXRHg3N2yiZaAmEwTyj3X1OtMRPKGOzdr
	jsmFt3ympyGVgw8ZOtgRADS+jGGoAXuX7sGmrL6mkwPiYpbU2R/x9bI8vx3Dxx1dB6TT
	8S2G5ZLGHBpl/Gmi8O6kvffC2JmzI92FJLCQu21HHUzucDpwpJA1uWq0ad15XuznrxyC
	CUWo1b1ES2u/9NKyRVNXhPe6Laa0D02N8YBF5sqnXuegk/N7+vWVNy5OtkGxcQTmwog/
	r3Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=gYtCPBMwj6C4ijDnkNQPCGQal3DggPYX5pxVDGZud7Q=;
	b=jMdqFVxsWzWhxI0h1KG3z4e4AcfdATTmoQgWCwhGR4ABfMCXxwwzD4faahMduiBHvT
	5JSGTQDODL6HnDFRGfLk7OrBtawe8amVF40Zbt8woPZYRuxVw/E1WNuRcmjpS7Z7Llsq
	YQp/GglnX09PFChJGUG1SYSp6D/F+h0PFfiL+taF/Ce8DnsOwdWiujHtCbxOZZp0T6z+
	wX95maihkXyu2jRswn2058QTBfmEyonRIk7nFp9Z7O416OPBrFzoQIVe1e/KrFGCR/8Q
	6J/V1wFDW16q5wvO/QFrWofob4TqQWlfqYWfqt+rmIH/mcZ2CDI/9zDSbXTnFeQ6Cy9S
	v8GQ==
X-Gm-Message-State: ALQs6tA1JHqi5yryDqHo4389bPc99D6pO154QyZ6QuARiOq0RmpOxLd7
	aV7z3O5CnSuS/oYM+0qu4/NMRA==
X-Google-Smtp-Source: AIpwx4/L8UmLCnJmJio/LirWTJ7kMVbB0rYE5pypukCml0DP9fb664y+wtmBsloXA6Qndy9pFLskIw==
X-Received: by 2002:aca:edd2:: with SMTP id
	l201-v6mr20523107oih.109.1523203080317; 
	Sun, 08 Apr 2018 08:58:00 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:6097:a43d:5d02:3a1c])
	by smtp.gmail.com with ESMTPSA id
	h7-v6sm1937449oti.76.2018.04.08.08.57.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 08 Apr 2018 08:57:59 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	akuster808@gmail.com
Date: Sun,  8 Apr 2018 08:57:56 -0700
Message-Id: <1523203076-7314-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1523203076-7314-1-git-send-email-akuster808@gmail.com>
References: <1523203076-7314-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][v2][PATCH 2/2] mongodb: refresh patches and remove un-needed patch
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
X-List-Received-Date: Sun, 08 Apr 2018 15:57:59 -0000

[V2]
remove patch, changes upstream

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...to-use-build-settings-from-environment-va.patch | 37 +++++++++----------
 .../0001-Use-long-long-instead-of-int64_t.patch    | 21 +++++------
 .../mongodb/0001-mongo-Add-using-std-string.patch  | 43 ++++++++++------------
 ...-Add-missing-dependenncy-on-local_shardin.patch | 11 ++----
 meta-oe/recipes-dbs/mongodb/mongodb_git.bb         |  1 -
 5 files changed, 50 insertions(+), 63 deletions(-)

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
diff --git a/meta-oe/recipes-dbs/mongodb/mongodb/0001-Use-long-long-instead-of-int64_t.patch b/meta-oe/recipes-dbs/mongodb/mongodb/0001-Use-long-long-instead-of-int64_t.patch
index c43beb4..389b302 100644
--- a/meta-oe/recipes-dbs/mongodb/mongodb/0001-Use-long-long-instead-of-int64_t.patch
+++ b/meta-oe/recipes-dbs/mongodb/mongodb/0001-Use-long-long-instead-of-int64_t.patch
@@ -13,11 +13,11 @@ Upstream-Status: Pending
  src/mongo/util/procparser.cpp | 10 +++++-----
  1 file changed, 5 insertions(+), 5 deletions(-)
 
-diff --git a/src/mongo/util/procparser.cpp b/src/mongo/util/procparser.cpp
-index 36f2ae0254..2c164bcbf3 100644
---- a/src/mongo/util/procparser.cpp
-+++ b/src/mongo/util/procparser.cpp
-@@ -260,7 +260,7 @@ Status parseProcStat(const std::vector<StringData>& keys,
+Index: git/src/mongo/util/procparser.cpp
+===================================================================
+--- git.orig/src/mongo/util/procparser.cpp
++++ git/src/mongo/util/procparser.cpp
+@@ -260,7 +260,7 @@ Status parseProcStat(const std::vector<S
  
                      StringData stringValue((*partIt).begin(), (*partIt).end() - (*partIt).begin());
  
@@ -26,7 +26,7 @@ index 36f2ae0254..2c164bcbf3 100644
  
                      if (!parseNumberFromString(stringValue, &value).isOK()) {
                          value = 0;
-@@ -272,7 +272,7 @@ Status parseProcStat(const std::vector<StringData>& keys,
+@@ -272,7 +272,7 @@ Status parseProcStat(const std::vector<S
              } else {
                  StringData stringValue((*partIt).begin(), (*partIt).end() - (*partIt).begin());
  
@@ -35,7 +35,7 @@ index 36f2ae0254..2c164bcbf3 100644
  
                  if (!parseNumberFromString(stringValue, &value).isOK()) {
                      value = 0;
-@@ -365,7 +365,7 @@ Status parseProcMemInfo(const std::vector<StringData>& keys,
+@@ -365,7 +365,7 @@ Status parseProcMemInfo(const std::vecto
  
              StringData stringValue((*partIt).begin(), (*partIt).end());
  
@@ -44,7 +44,7 @@ index 36f2ae0254..2c164bcbf3 100644
  
              if (!parseNumberFromString(stringValue, &value).isOK()) {
                  value = 0;
-@@ -426,7 +426,7 @@ Status parseProcDiskStats(const std::vector<StringData>& disks,
+@@ -426,7 +426,7 @@ Status parseProcDiskStats(const std::vec
                            StringData data,
                            BSONObjBuilder* builder) {
      bool foundKeys = false;
@@ -53,7 +53,7 @@ index 36f2ae0254..2c164bcbf3 100644
      stats.reserve(kDiskFieldCount);
  
      using string_split_iterator = boost::split_iterator<StringData::const_iterator>;
-@@ -501,7 +501,7 @@ Status parseProcDiskStats(const std::vector<StringData>& disks,
+@@ -501,7 +501,7 @@ Status parseProcDiskStats(const std::vec
  
                  StringData stringValue((*partIt).begin(), (*partIt).end());
  
@@ -62,6 +62,3 @@ index 36f2ae0254..2c164bcbf3 100644
  
                  if (!parseNumberFromString(stringValue, &value).isOK()) {
                      value = 0;
--- 
-2.14.1
-
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
diff --git a/meta-oe/recipes-dbs/mongodb/mongodb/0002-d_state.cpp-Add-missing-dependenncy-on-local_shardin.patch b/meta-oe/recipes-dbs/mongodb/mongodb/0002-d_state.cpp-Add-missing-dependenncy-on-local_shardin.patch
index 95f9c1c..dc488ad 100644
--- a/meta-oe/recipes-dbs/mongodb/mongodb/0002-d_state.cpp-Add-missing-dependenncy-on-local_shardin.patch
+++ b/meta-oe/recipes-dbs/mongodb/mongodb/0002-d_state.cpp-Add-missing-dependenncy-on-local_shardin.patch
@@ -12,10 +12,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  src/mongo/s/SConscript | 1 +
  1 file changed, 1 insertion(+)
 
-diff --git a/src/mongo/s/SConscript b/src/mongo/s/SConscript
-index 71720be517..51bd199127 100644
---- a/src/mongo/s/SConscript
-+++ b/src/mongo/s/SConscript
+Index: git/src/mongo/s/SConscript
+===================================================================
+--- git.orig/src/mongo/s/SConscript
++++ git/src/mongo/s/SConscript
 @@ -317,5 +317,6 @@ env.Library(
          "$BUILD_DIR/mongo/db/s/sharding",
          "$BUILD_DIR/mongo/executor/network_interface_factory",
@@ -23,6 +23,3 @@ index 71720be517..51bd199127 100644
 +        "$BUILD_DIR/mongo/s/local_sharding_info",
      ],
  )
--- 
-2.13.3
-
diff --git a/meta-oe/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/recipes-dbs/mongodb/mongodb_git.bb
index 723663f..bb3ff3b 100644
--- a/meta-oe/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/recipes-dbs/mongodb/mongodb_git.bb
@@ -11,7 +11,6 @@ PV = "3.4.13+git${SRCPV}"
 SRCREV = "fbdef2ccc53e0fcc9afb570063633d992b2aae42"
 SRC_URI = "git://github.com/mongodb/mongo.git;branch=v3.4 \
            file://0001-Tell-scons-to-use-build-settings-from-environment-va.patch \
-           file://0001-mongo-Add-using-std-string.patch \
            file://0002-d_state.cpp-Add-missing-dependenncy-on-local_shardin.patch \
            file://0001-Use-long-long-instead-of-int64_t.patch \
            file://0001-Use-__GLIBC__-to-control-use-of-gnu_get_libc_version.patch \
-- 
2.7.4


