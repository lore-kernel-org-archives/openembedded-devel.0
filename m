Received: from pd95cb174.dip0.t-ipconnect.de ([217.92.177.116] helo=localhost)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@localhost.localdomain>) id 1RanJX-0004e9-KA
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Dec 2011 12:48:00 +0100
Received: by localhost (Postfix, from userid 1000)
	id 4B705440BF6; Wed, 14 Dec 2011 12:41:03 +0100 (CET)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: Tom Rini <tom.rini@gmail.com>,
	openembedded-devel@lists.openembedded.org
Date: Wed, 14 Dec 2011 12:40:56 +0100
Message-Id: <a992bc4a3733a7074206ff7d767f6058fcdcfd14.1323862499.git.sledz@dresearch-fe.de>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <cover.1323862499.git.sledz@dresearch-fe.de>
References: <cover.1323862499.git.sledz@dresearch-fe.de>
Subject: [2011.03-maintenance 1/5] llvm2.7_2.7: Add patch for build errors on newer gcc / glibc combinations
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Dec 2011 11:48:00 -0000

From: Stefan Schmidt <stefan@buglabs.net>

Its seems there is a stricter header checking again which results in errors like
this:
error: 'ptrdiff_t' does not name a type

This happens on my Debian SID system. Adding the needed includes fixes the
build.

Signed-off-by: Stefan Schmidt <stefan@buglabs.net>
---
 recipes/llvm/llvm2.7/include-fixes.patch |   55 ++++++++++++++++++++++++++++++
 recipes/llvm/llvm2.7_2.7.bb              |    3 +-
 2 files changed, 57 insertions(+), 1 deletions(-)
 create mode 100644 recipes/llvm/llvm2.7/include-fixes.patch

diff --git a/recipes/llvm/llvm2.7/include-fixes.patch b/recipes/llvm/llvm2.7/include-fixes.patch
new file mode 100644
index 0000000..9e71e40
--- /dev/null
+++ b/recipes/llvm/llvm2.7/include-fixes.patch
@@ -0,0 +1,55 @@
+Fixes stricter includes which result in failures like this:
+error: 'ptrdiff_t' does not name a type
+
+Upstream-Status: Unknown, not submitted as 2.7 is very old
+
+Signed-off-by: Stefan Schmidt <stefan@datenfreihafen.org>
+
+Index: llvm-2.7/include/llvm/ADT/SmallVector.h
+===================================================================
+--- llvm-2.7.orig/include/llvm/ADT/SmallVector.h	2011-05-08 17:07:09.000000000 +0200
++++ llvm-2.7/include/llvm/ADT/SmallVector.h	2011-05-08 17:07:25.000000000 +0200
+@@ -19,6 +19,7 @@
+ #include <cassert>
+ #include <cstring>
+ #include <memory>
++#include <stddef.h>
+ 
+ #ifdef _MSC_VER
+ namespace std {
+Index: llvm-2.7/include/llvm/ADT/ilist.h
+===================================================================
+--- llvm-2.7.orig/include/llvm/ADT/ilist.h	2011-05-08 20:24:57.000000000 +0200
++++ llvm-2.7/include/llvm/ADT/ilist.h	2011-05-08 20:25:12.000000000 +0200
+@@ -40,6 +40,7 @@
+ 
+ #include <cassert>
+ #include <iterator>
++#include <stddef.h>
+ 
+ namespace llvm {
+ 
+Index: llvm-2.7/include/llvm/Use.h
+===================================================================
+--- llvm-2.7.orig/include/llvm/Use.h	2011-05-08 20:28:21.000000000 +0200
++++ llvm-2.7/include/llvm/Use.h	2011-05-08 20:28:37.000000000 +0200
+@@ -28,6 +28,7 @@
+ #include "llvm/Support/Casting.h"
+ #include "llvm/ADT/PointerIntPair.h"
+ #include <iterator>
++#include <stddef.h>
+ 
+ namespace llvm {
+ 
+Index: llvm-2.7/include/llvm/ADT/DenseMap.h
+===================================================================
+--- llvm-2.7.orig/include/llvm/ADT/DenseMap.h	2011-05-08 20:32:11.000000000 +0200
++++ llvm-2.7/include/llvm/ADT/DenseMap.h	2011-05-08 20:32:21.000000000 +0200
+@@ -23,6 +23,7 @@
+ #include <utility>
+ #include <cassert>
+ #include <cstring>
++#include <stddef.h>
+ 
+ namespace llvm {
+ 
diff --git a/recipes/llvm/llvm2.7_2.7.bb b/recipes/llvm/llvm2.7_2.7.bb
index 4353622..12755db 100644
--- a/recipes/llvm/llvm2.7_2.7.bb
+++ b/recipes/llvm/llvm2.7_2.7.bb
@@ -1,6 +1,6 @@
 require llvm.inc
 
-PR = "r9"
+PR = "r10"
 
 DEPENDS = "llvm-common llvm2.7-native"
 
@@ -15,6 +15,7 @@ SRC_URI += "\
   file://r104652-VFPLoadStoreMultiple.patch \
   file://r104653-BFC-BFI.patch \
   file://rawMOVLRPC.patch \
+  file://include-fixes.patch \
   "
 
 LLVM_RELEASE = "2.7"
-- 
1.7.7



