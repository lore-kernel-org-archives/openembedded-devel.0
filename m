Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@datenfreihafen.org>) id 1QJLb3-0006Oh-O4
	for openembedded-devel@openembedded.org; Mon, 09 May 2011 10:13:41 +0200
Received: from [2001:638:602:1183:4da:ff61:f5c:b7b4] (helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1QJL70-0007lm-KP by authid <stefan@sostec.de> with srv_auth_cram_md5;
	Mon, 09 May 2011 09:42:40 +0200
Received: from stefan by excalibur.local with local (Exim 4.75)
	(envelope-from <stefan@excalibur.local>)
	id 1QJL6y-0001F9-DG; Mon, 09 May 2011 09:42:36 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@openembedded.org
Date: Mon,  9 May 2011 09:41:45 +0200
Message-Id: <1304926905-4739-1-git-send-email-stefan@datenfreihafen.org>
X-Mailer: git-send-email 1.7.5.1
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,NO_RELAYS
	autolearn=ham version=3.2.5
Cc: Stefan Schmidt <stefan@buglabs.net>
Subject: [PATCH] llvm2.7_2.7: Add patch for build errors on newer gcc / glibc combinations
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
X-List-Received-Date: Mon, 09 May 2011 08:13:41 -0000

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
1.7.5.1



