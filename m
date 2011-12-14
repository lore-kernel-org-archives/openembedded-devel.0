Received: from pd95cb174.dip0.t-ipconnect.de ([217.92.177.116] helo=localhost)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@localhost.localdomain>) id 1RanJc-0004hQ-Nl
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Dec 2011 12:48:04 +0100
Received: by localhost (Postfix, from userid 1000)
	id 64DF1440BF6; Wed, 14 Dec 2011 12:41:08 +0100 (CET)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: Tom Rini <tom.rini@gmail.com>,
	openembedded-devel@lists.openembedded.org
Date: Wed, 14 Dec 2011 12:40:57 +0100
Message-Id: <3904feb71c67aed74e003d8e8bc576f934caa8be.1323862499.git.sledz@dresearch-fe.de>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <a992bc4a3733a7074206ff7d767f6058fcdcfd14.1323862499.git.sledz@dresearch-fe.de>
References: <a992bc4a3733a7074206ff7d767f6058fcdcfd14.1323862499.git.sledz@dresearch-fe.de>
In-Reply-To: <cover.1323862499.git.sledz@dresearch-fe.de>
References: <cover.1323862499.git.sledz@dresearch-fe.de>
Subject: [2011.03-maintenance 2/5] llvm2.7_2.7.bb: Update patch to use c++ include style.
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
X-List-Received-Date: Wed, 14 Dec 2011 11:48:04 -0000

From: Stefan Schmidt <stefan@buglabs.net>

As henning suggested on we should use a c++ style include here instead. Thus
changing to #include <cstddef>

Signed-off-by: Stefan Schmidt <stefan@datenfreihafen.org>
---
 recipes/llvm/llvm2.7/include-fixes.patch |    8 ++++----
 recipes/llvm/llvm2.7_2.7.bb              |    2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/recipes/llvm/llvm2.7/include-fixes.patch b/recipes/llvm/llvm2.7/include-fixes.patch
index 9e71e40..2783f4d 100644
--- a/recipes/llvm/llvm2.7/include-fixes.patch
+++ b/recipes/llvm/llvm2.7/include-fixes.patch
@@ -13,7 +13,7 @@ Index: llvm-2.7/include/llvm/ADT/SmallVector.h
  #include <cassert>
  #include <cstring>
  #include <memory>
-+#include <stddef.h>
++#include <cstddef>
  
  #ifdef _MSC_VER
  namespace std {
@@ -25,7 +25,7 @@ Index: llvm-2.7/include/llvm/ADT/ilist.h
  
  #include <cassert>
  #include <iterator>
-+#include <stddef.h>
++#include <cstddef>
  
  namespace llvm {
  
@@ -37,7 +37,7 @@ Index: llvm-2.7/include/llvm/Use.h
  #include "llvm/Support/Casting.h"
  #include "llvm/ADT/PointerIntPair.h"
  #include <iterator>
-+#include <stddef.h>
++#include <cstddef>
  
  namespace llvm {
  
@@ -49,7 +49,7 @@ Index: llvm-2.7/include/llvm/ADT/DenseMap.h
  #include <utility>
  #include <cassert>
  #include <cstring>
-+#include <stddef.h>
++#include <cstddef>
  
  namespace llvm {
  
diff --git a/recipes/llvm/llvm2.7_2.7.bb b/recipes/llvm/llvm2.7_2.7.bb
index 12755db..7d56e7d 100644
--- a/recipes/llvm/llvm2.7_2.7.bb
+++ b/recipes/llvm/llvm2.7_2.7.bb
@@ -1,6 +1,6 @@
 require llvm.inc
 
-PR = "r10"
+PR = "r11"
 
 DEPENDS = "llvm-common llvm2.7-native"
 
-- 
1.7.7



