Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 549F376ACA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 04:53:06 +0000 (UTC)
Received: by iodv127 with SMTP id v127so135946839iod.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Aug 2015 21:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=IRx0no4YtB1uhGMRIuoWckZYHK9W9fAhaJh3G9FbFO8=;
	b=Po7/ft28tViTbLUQgwwTlqWSUKFt4kFYtFhDwIA2/FryUs13BLYLkEmw6GF7p7ok9I
	KJ5qoLqaiMgKa2oibcabzvCBKZLVdFDMihTh6SsKFCyOJmmt+oaME2zfi5f89ZungEJO
	fPhfguzfO7xzN5DzQEj6g8TVuIKFPB7mkX7jSF159thIINwRMR+r/T3Ga+ql+xFBrGJN
	2+k/58zdaDETmeYjTMMBFNYuVIwqE5y0HIZTixYwU1epyeJPNMfuT4glWGM7iHUbiNke
	AbcNhfx7Z3UHduSWQxQ19jkAffMyWh4R3D/JUxQQ+VeNPh5yw/34PaUHcOSlSgHsCwpM
	Nr5g==
X-Received: by 10.107.157.1 with SMTP id g1mr15452799ioe.38.1440391986489;
	Sun, 23 Aug 2015 21:53:06 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by smtp.gmail.com with ESMTPSA id a1sm8172496iga.4.2015.08.23.21.53.05
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 23 Aug 2015 21:53:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Aug 2015 21:52:57 -0700
Message-Id: <1440391979-3469-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-qt5][PATCH 1/3] qtbase: Fix build with clang
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Aug 2015 04:53:08 -0000

This patch is a backport from upstream qt5 fixes building with clang
from meta-clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-qt/qt5/qtbase-native_git.bb                |  1 +
 .../qt5/qtbase/0015-Fix-build-with-clang-3.7.patch | 71 ++++++++++++++++++++++
 recipes-qt/qt5/qtbase_git.bb                       |  7 ++-
 3 files changed, 76 insertions(+), 3 deletions(-)
 create mode 100644 recipes-qt/qt5/qtbase/0015-Fix-build-with-clang-3.7.patch

diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
index f84f38e..034a314 100644
--- a/recipes-qt/qt5/qtbase-native_git.bb
+++ b/recipes-qt/qt5/qtbase-native_git.bb
@@ -27,6 +27,7 @@ SRC_URI += "\
     file://0008-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch \
     file://0009-QOpenGLPaintDevice-sub-area-support.patch \
     file://0010-Make-Qt5GuiConfigExtras.cmake-find-gl-es-include-dir.patch \
+    file://0015-Fix-build-with-clang-3.7.patch \
 "
 
 # common for qtbase-native and nativesdk-qtbase
diff --git a/recipes-qt/qt5/qtbase/0015-Fix-build-with-clang-3.7.patch b/recipes-qt/qt5/qtbase/0015-Fix-build-with-clang-3.7.patch
new file mode 100644
index 0000000..181d63c
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/0015-Fix-build-with-clang-3.7.patch
@@ -0,0 +1,71 @@
+This is backport of https://codereview.qt-project.org/#/c/121545/
+
+From 6a6acc496728ce96198d27f9ddd44c2367758d42 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 23 Aug 2015 15:19:41 -0700
+Subject: [PATCH] Fix build with clang 3.7
+
+Nullable is a language extension in clang 3.7 (indicating whether or
+not a pointer can be null).
+http://clang.llvm.org/docs/AttributeReference.html#nullable
+Using it as a class name breaks building with this compiler
+
+/mnt/home/kraj/work/angstrom/build/tmp-angstrom-glibc/work/armv7at2hf-vfp-neon-angstrom-linux-gnueabi/qtbase/5.4.2+gitAUTOINC+2cb17c1fb9-r0/git/src/tools/qlalr/lalr.cpp:241:1: error: declaration of anonymous
+      struct must be a definition
+struct _Nullable: public std::unary_function<Name, bool>
+^
+/mnt/home/kraj/work/angstrom/build/tmp-angstrom-glibc/work/armv7at2hf-vfp-neon-angstrom-linux-gnueabi/qtbase/5.4.2+gitAUTOINC+2cb17c1fb9-r0/git/src/tools/qlalr/lalr.cpp:241:56: error: expected unqualified-id
+struct _Nullable: public std::unary_function<Name, bool>
+                                                       ^
+/mnt/home/kraj/work/angstrom/build/tmp-angstrom-glibc/work/armv7at2hf-vfp-neon-angstrom-linux-gnueabi/qtbase/5.4.2+gitAUTOINC+2cb17c1fb9-r0/git/src/tools/qlalr/lalr.cpp:303:98: error: expected expression
+          NameList::iterator nn = std::find_if (rule->rhs.begin (), rule->rhs.end (), std::not1 (_Nullable (this)));
+                                                                                                 ^
+/mnt/home/kraj/work/angstrom/build/tmp-angstrom-glibc/work/armv7at2hf-vfp-neon-angstrom-linux-gnueabi/qtbase/5.4.2+gitAUTOINC+2cb17c1fb9-r0/git/src/tools/qlalr/lalr.cpp:638:107: error: expected expression
+                  NameList::iterator first_not_nullable = std::find_if (dot, rule->rhs.end (), std::not1 (_Nullable (this)));
+                                                                                                          ^
+4 errors generated.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/tools/qlalr/lalr.cpp | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/tools/qlalr/lalr.cpp b/src/tools/qlalr/lalr.cpp
+index be1df7d..55ef056 100644
+--- a/src/tools/qlalr/lalr.cpp
++++ b/src/tools/qlalr/lalr.cpp
+@@ -238,11 +238,11 @@ void Grammar::buildExtendedGrammar ()
+   non_terminals.insert (accept_symbol);
+ }
+ 
+-struct _Nullable: public std::unary_function<Name, bool>
++struct Nullable: public std::unary_function<Name, bool>
+ {
+   Automaton *_M_automaton;
+ 
+-  _Nullable (Automaton *aut):
++  Nullable (Automaton *aut):
+     _M_automaton (aut) {}
+ 
+   bool operator () (Name name) const
+@@ -300,7 +300,7 @@ void Automaton::buildNullables ()
+ 
+       for (RulePointer rule = _M_grammar->rules.begin (); rule != _M_grammar->rules.end (); ++rule)
+         {
+-          NameList::iterator nn = std::find_if (rule->rhs.begin (), rule->rhs.end (), std::not1 (_Nullable (this)));
++          NameList::iterator nn = std::find_if (rule->rhs.begin (), rule->rhs.end (), std::not1 (Nullable (this)));
+ 
+           if (nn == rule->rhs.end ())
+             changed |= nullables.insert (rule->lhs).second;
+@@ -635,7 +635,7 @@ void Automaton::buildIncludesDigraph ()
+                   if (! _M_grammar->isNonTerminal (*A))
+                     continue;
+ 
+-                  NameList::iterator first_not_nullable = std::find_if (dot, rule->rhs.end (), std::not1 (_Nullable (this)));
++                  NameList::iterator first_not_nullable = std::find_if (dot, rule->rhs.end (), std::not1 (Nullable (this)));
+                   if (first_not_nullable != rule->rhs.end ())
+                     continue;
+ 
+-- 
+2.1.4
+
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 33620cb..6814dbe 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -22,8 +22,9 @@ SRC_URI += "\
     file://0009-QOpenGLPaintDevice-sub-area-support.patch \
     file://0010-Make-Qt5GuiConfigExtras.cmake-find-gl-es-include-dir.patch \
     file://0014-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch \
+    file://0015-Fix-build-with-clang-3.7.patch \
 "
- 
+
 # specific for qtbase
 SRC_URI += "\
     file://0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch \
@@ -199,9 +200,9 @@ do_configure() {
         -hostbindir ${OE_QMAKE_PATH_HOST_BINS} \
         -hostdatadir ${OE_QMAKE_PATH_HOST_DATA} \
         -external-hostbindir ${OE_QMAKE_PATH_EXTERNAL_HOST_BINS} \
+        ${QT_CONFIG_FLAGS} \
         -platform ${OE_QMAKESPEC} \
-        -xplatform linux-oe-g++ \
-        ${QT_CONFIG_FLAGS}
+        -xplatform linux-oe-g++
 
     qmake5_base_do_configure
 }
-- 
2.1.4


