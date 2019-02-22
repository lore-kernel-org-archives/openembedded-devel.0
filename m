Return-Path: <andrej.valek@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id 7B5DC7CBA4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Feb 2019 07:16:44 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x1M7GimO022729
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Feb 2019 08:16:44 +0100
Received: from dev.vm6.ccp.siemens.com (MD1JJJ2C.ad001.siemens.net
	[163.242.44.88])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id x1M7Gi48000321;
	Fri, 22 Feb 2019 08:16:44 +0100
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 0B5A3980210;
	Fri, 22 Feb 2019 08:16:44 +0100 (CET)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Feb 2019 08:16:37 +0100
Message-Id: <20190222071637.32111-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-oe][PATCH] nodejs: fix additional compatibility with older gcc
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
X-List-Received-Date: Fri, 22 Feb 2019 07:16:45 -0000

 - replace all occurrences of std::make_unique with wrapper
 - sync indent level

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 .../0004-Make-compatibility-with-gcc-4.8.patch     | 36 +++++++++++++++++-----
 1 file changed, 28 insertions(+), 8 deletions(-)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0004-Make-compatibility-with-gcc-4.8.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0004-Make-compatibility-with-gcc-4.8.patch
index 2b325b675..cb38362e4 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs/0004-Make-compatibility-with-gcc-4.8.patch
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0004-Make-compatibility-with-gcc-4.8.patch
@@ -5,22 +5,42 @@ method to be compatible with gcc < 4.9 .
 Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
 
 diff -Naur node-v10.15.1/src/cares_wrap.cc node-v10.15.1/src/cares_wrap.cc
---- node-v10.15.1/src/cares_wrap.cc	2019-02-17 09:40:36.040538319 +0100
-+++ node-v10.15.1/src/cares_wrap.cc	2019-02-17 09:39:57.883668702 +0100
+--- node-v10.15.1/src/cares_wrap.cc	2019-01-29 08:20:50.000000000 +0100
++++ node-v10.15.1/src/cares_wrap.cc	2019-02-21 16:22:25.489131665 +0100
 @@ -52,6 +52,16 @@
  # define AI_V4MAPPED 0
  #endif
  
 +#ifndef __cpp_lib_make_unique
-+  namespace std {
-+    /// make_unique implementation
-+    template<typename T, typename... Args>
-+    std::unique_ptr<T> make_unique(Args&&... args) {
-+      return std::unique_ptr<T>(new T(std::forward<Args>(args)...));
-+    }
++namespace std {
++  /// make_unique implementation
++  template<typename T, typename... Args>
++  std::unique_ptr<T> make_unique(Args&&... args) {
++    return std::unique_ptr<T>(new T(std::forward<Args>(args)...));
 +  }
++}
 +#endif
 +
  namespace node {
  namespace cares_wrap {
  
+diff -Naur node-v10.15.1/src/inspector_agent.cc node-v10.15.1/src/inspector_agent.cc
+--- node-v10.15.1/src/inspector_agent.cc	2019-01-29 08:20:50.000000000 +0100
++++ node-v10.15.1/src/inspector_agent.cc	2019-02-21 16:22:09.000185992 +0100
+@@ -24,6 +24,16 @@
+ #include <pthread.h>
+ #endif  // __POSIX__
+ 
++#ifndef __cpp_lib_make_unique
++namespace std {
++  /// make_unique implementation
++  template<typename T, typename... Args>
++  std::unique_ptr<T> make_unique(Args&&... args) {
++    return std::unique_ptr<T>(new T(std::forward<Args>(args)...));
++  }
++}
++#endif
++
+ namespace node {
+ namespace inspector {
+ namespace {
-- 
2.11.0


