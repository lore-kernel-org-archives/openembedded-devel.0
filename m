Return-Path: <akuster808@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 171E174C56
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Apr 2018 22:48:08 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id o205so7331151qke.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Apr 2018 15:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=/SGZEp298Ses0Uotp4PABt7cA3odK6aysgd5cUwzCo0=;
	b=pYCadWzbHeOuiCec2P74bH42AFeiOgaqhujHea88SnoSn7hUpIdOxQuCuxzjsFCG10
	55hIOSsxBJnc9XZhzL0auJB0TiK5gID2hm+KBp6kSIT9XGbMV+n+coR6Rd4FcEEdH8OK
	Nk1wr4l3PcLzzlq2XOjU8D1/U9bw6ADzjPBat/tpq19SOcFlnMGbqOoNckvAZuojOaY2
	opt4yFytrf3E5uqKeba5trhU3KCcE2J1Nul/ED1WYV6/ZVN6nkp3nt2uMuYtPSxlCMQe
	6d0gzdpiXbHCYRCURqz9AONciPbGwCEwG0uUMOKnwmVpsSVSZbQVWCZpXjjzun4Oxati
	s5MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=/SGZEp298Ses0Uotp4PABt7cA3odK6aysgd5cUwzCo0=;
	b=FlMcXCBKBIDD2PkxUHvT11Pwl0tOeHzokaV+tVCsSbKmsBrAzS8cDCb/wn5LVf9BM9
	GOWyUxCimyIpoj8XsHYMioZPLOSgAkjS3MLbxSWMKZ3xhYM87fhhOaWuf+VHQu53bFo4
	69gX6b8UvA+c5Mlm10ZdNvqd/cG9Qb4X9wGT723nN9zVOU6JLu4UBD+q98harj+IFgNk
	1gyGma2bI6g2zfL9j8LPFs/FPKg46RyR9Efd3NeyEjLBpvru1RCBwGukT5xv7rqoGBGa
	YiWOXdiIeBfkl4kMffdanXURsXR+v9dcpLO0sdS1kK0MrNmrmETqyI/jzWFwBhGj9fzh
	WpLQ==
X-Gm-Message-State: ALQs6tC3EddE1BALYCACkTxpHzSFeD0SYVF+G/8eZ7YFZYvYFQ9S/9Ek
	s+ojl1D/wlCLzT82UJCRo/CgFA==
X-Google-Smtp-Source: AIpwx498E91jYC+reEq70EeoVyC3SINVLHZFL3wt8vCmpGmkhPL4CH+5xGSik/JaRCs6UJ3J7gsyWw==
X-Received: by 10.55.239.5 with SMTP id j5mr24945571qkk.105.1523227689093;
	Sun, 08 Apr 2018 15:48:09 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:6097:a43d:5d02:3a1c])
	by smtp.gmail.com with ESMTPSA id
	20sm14875555qkw.75.2018.04.08.15.48.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 08 Apr 2018 15:48:08 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	akuster808@gmail.com
Date: Sun,  8 Apr 2018 15:48:06 -0700
Message-Id: <1523227686-19760-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][v3][PATCH] mongodb: refresh patches and remove un-needed patch
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
X-List-Received-Date: Sun, 08 Apr 2018 22:48:09 -0000

[V2]
remove patch, changes upstream

[v3]
Actually remove the patch

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...to-use-build-settings-from-environment-va.patch | 37 +++++------
 .../0001-Use-long-long-instead-of-int64_t.patch    | 21 +++----
 .../mongodb/0001-mongo-Add-using-std-string.patch  | 72 ----------------------
 ...-Add-missing-dependenncy-on-local_shardin.patch | 11 ++--
 meta-oe/recipes-dbs/mongodb/mongodb_git.bb         |  1 -
 5 files changed, 30 insertions(+), 112 deletions(-)
 delete mode 100644 meta-oe/recipes-dbs/mongodb/mongodb/0001-mongo-Add-using-std-string.patch

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
deleted file mode 100644
index e517d53..0000000
--- a/meta-oe/recipes-dbs/mongodb/mongodb/0001-mongo-Add-using-std-string.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From 5fdec9592285f5976345fbccb3d07fae1245ab53 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 2 Aug 2017 15:41:22 -0700
-Subject: [PATCH] mongo: Add using std::string
-
-This is needed with latest clang
-Fixes
-src/mongo/db/dbwebserver.cpp:206:23: error: use of undeclared identifier 'string'; did you mean 'String'?
-        static vector<string> commands;
-                      ^~~~~~
-                      String
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/mongo/db/dbwebserver.cpp             | 1 +
- src/mongo/db/matcher/expression_leaf.cpp | 2 ++
- src/mongo/db/repl/master_slave.cpp       | 1 +
- src/mongo/util/net/miniwebserver.cpp     | 1 +
- 4 files changed, 5 insertions(+)
-
-diff --git a/src/mongo/db/dbwebserver.cpp b/src/mongo/db/dbwebserver.cpp
-index b202e0500b..0255613524 100644
---- a/src/mongo/db/dbwebserver.cpp
-+++ b/src/mongo/db/dbwebserver.cpp
-@@ -67,6 +67,7 @@ namespace mongo {
- using std::map;
- using std::stringstream;
- using std::vector;
-+using std::string;
- 
- using namespace html;
- 
-diff --git a/src/mongo/db/matcher/expression_leaf.cpp b/src/mongo/db/matcher/expression_leaf.cpp
-index d562bff141..4d931985e2 100644
---- a/src/mongo/db/matcher/expression_leaf.cpp
-+++ b/src/mongo/db/matcher/expression_leaf.cpp
-@@ -44,6 +44,8 @@
- #include "mongo/stdx/memory.h"
- #include "mongo/util/mongoutils/str.h"
- 
-+using std::string;
-+
- namespace mongo {
- 
- Status LeafMatchExpression::setPath(StringData path) {
-diff --git a/src/mongo/db/repl/master_slave.cpp b/src/mongo/db/repl/master_slave.cpp
-index 05faad1259..ea25d7151b 100644
---- a/src/mongo/db/repl/master_slave.cpp
-+++ b/src/mongo/db/repl/master_slave.cpp
-@@ -78,6 +78,7 @@ using std::endl;
- using std::max;
- using std::min;
- using std::set;
-+using std::string;
- using std::stringstream;
- using std::unique_ptr;
- using std::vector;
-diff --git a/src/mongo/util/net/miniwebserver.cpp b/src/mongo/util/net/miniwebserver.cpp
-index 5f4165d42f..239720c349 100644
---- a/src/mongo/util/net/miniwebserver.cpp
-+++ b/src/mongo/util/net/miniwebserver.cpp
-@@ -46,6 +46,7 @@ namespace mongo {
- 
- using std::shared_ptr;
- using std::stringstream;
-+using std::string;
- using std::vector;
- 
- MiniWebServer::MiniWebServer(const string& name, const string& ip, int port, ServiceContext* ctx)
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


