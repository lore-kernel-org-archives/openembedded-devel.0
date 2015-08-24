Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id 9F7176AC1E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 17:44:10 +0000 (UTC)
Received: by igbjg10 with SMTP id jg10so67398527igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 10:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=4AM6fTSApo5QAOvXEwS1bQ7AXucAZJSjBtUe8AfN+iw=;
	b=FSEb2g2sgQv1eW+ghY3470tqvrZv0mXzOUl4wZBSzzfea2gRDviTKdoVh2t4M6U4HW
	eUM6isMqwic8hJ+kDusjg04L133TEnYSnGQbhRI9nCGzxu+OPvCSfwmQZikacJlvOKxQ
	UIAl7WoH94YX3c7dTxznoiYh4SYLXNyUbPgE/HtlFfN/PnjM4N70xvnBByAr4lIgiywv
	vM5+V2gUix1A7w/lBuiQ89Of3J2eccnCit70CaS8KxbYLOWKuLUmeuzHMcS7j9LZ7cFY
	Ofxrs1w1cAWlxhZ1Ok6Mh9GKbrrX5r5j4m4anqcCpUypNdTqDzPEZ3EcGyX8hVA+ApUI
	ghZg==
X-Received: by 10.50.32.97 with SMTP id h1mr15403601igi.29.1440438250381;
	Mon, 24 Aug 2015 10:44:10 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79]) by smtp.gmail.com with ESMTPSA id
	ht6sm9289129igb.11.2015.08.24.10.44.09
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 24 Aug 2015 10:44:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Aug 2015 10:43:56 -0700
Message-Id: <1440438239-19765-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-qt5][PATCH V2 1/4] qtbase: Fix build with clang
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
X-List-Received-Date: Mon, 24 Aug 2015 17:44:13 -0000

This patch is a backport from upstream qt5 fixes building with clang
from meta-clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-qt/qt5/qtbase-native_git.bb                |  1 +
 .../qt5/qtbase/0015-Fix-build-with-clang-3.7.patch | 71 ++++++++++++++++++++++
 recipes-qt/qt5/qtbase_git.bb                       |  1 +
 3 files changed, 73 insertions(+)
 create mode 100644 recipes-qt/qt5/qtbase/0015-Fix-build-with-clang-3.7.patch

diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
index ebd7280..1d09a19 100644
--- a/recipes-qt/qt5/qtbase-native_git.bb
+++ b/recipes-qt/qt5/qtbase-native_git.bb
@@ -24,6 +24,7 @@ SRC_URI += "\
     file://0005-qeglplatformintegration-Undefine-CursorShape-from-X..patch \
     file://0006-configure-bump-path-length-from-256-to-512-character.patch \
     file://0008-QOpenGLPaintDevice-sub-area-support.patch \
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
index f472c98..5603fb2 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -18,6 +18,7 @@ SRC_URI += "\
     file://0005-qeglplatformintegration-Undefine-CursorShape-from-X..patch \
     file://0006-configure-bump-path-length-from-256-to-512-character.patch \
     file://0008-QOpenGLPaintDevice-sub-area-support.patch \
+    file://0015-Fix-build-with-clang-3.7.patch \
 "
 
 # specific for target qtbase
-- 
2.1.4


