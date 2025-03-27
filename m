Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13D61C3600B
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 07:26:17 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
 by mx.groups.io with SMTP id smtpd.web10.44645.1743060370093479922
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Mar 2025 00:26:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.51, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgemrelse6q.lge.com) (156.147.1.121)
	by 156.147.23.51 with ESMTP; 27 Mar 2025 16:26:07 +0900
X-Original-SENDERIP: 156.147.1.121
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.121.109)
	by 156.147.1.121 with ESMTP; 27 Mar 2025 16:26:07 +0900
X-Original-SENDERIP: 10.177.121.109
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-devel@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>
Subject: [meta-oe][PATCH] poco: fix build with gcc-15.0.1
Date: Thu, 27 Mar 2025 16:26:06 +0900
Message-Id: <20250327072606.696177-1-mark.yang@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Mar 2025 07:26:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116316

From: "mark.yang" <mark.yang@lge.com>

* 0001-SimpleRowFormatter.h-fix-the-build-on-gcc-15-unsatis.patch
  backport fix from:
  https://github.com/pocoproject/poco/commit/03c35cf

In file included from poco/1.13.3/git/Data/src/SimpleRowFormatter.cpp:15:
poco/1.13.3/git/Data/include/Poco/Data/SimpleRowFormatter.h:114:21: error: declaration of 'std::_Require<std::__not_<std::__is_tuple_like<_Tp> >, std::is_move_constructible<_Tp>, std::is_move_assignable<_Tp> > std::swap(_Tp&, _Tp&) noexcept [with _Tp = Poco::Data::SimpleRowFormatter; _Require<__not_<__is_tuple_like<_Tp> >, is_move_constructible<_Tp>, is_move_assignable<_Tp> > = void]' has a different exception specifier
  114 |         inline void swap<Poco::Data::SimpleRowFormatter>(Poco::Data::SimpleRowFormatter& s1,
      |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from poco/1.13.3/recipe-sysroot/usr/include/c++/15.0.1/bits/new_allocator.h:36,
                 from poco/1.13.3/recipe-sysroot/usr/include/c++/15.0.1/aarch64-VENDOR-linux/bits/c++allocator.h:33,
                 from poco/1.13.3/recipe-sysroot/usr/include/c++/15.0.1/bits/allocator.h:46,
                 from poco/1.13.3/recipe-sysroot/usr/include/c++/15.0.1/string:45,
                 from poco/1.13.3/git/Foundation/include/Poco/Foundation.h:94,
                 from poco/1.13.3/git/Data/include/Poco/Data/Data.h:23,
                 from poco/1.13.3/git/Data/include/Poco/Data/SimpleRowFormatter.h:21:

* 0002-fix-Foundation-Build-error-with-GCC-15-class-Poco-Pr.patch
  backport fix from:
  https://github.com/pocoproject/poco/commit/6faf907

In file included from poco/1.13.3/git/Foundation/testsuite/src/PriorityEventTest.cpp:15:
poco/1.13.3/git/Foundation/include/Poco/PriorityDelegate.h: In member function 'Poco::PriorityDelegate<TObj, void, true>& Poco::PriorityDelegate<TObj, void, true>::operator=(const Poco::PriorityDelegate<TObj, void, true>&)':
poco/1.13.3/git/Foundation/include/Poco/PriorityDelegate.h:203:31: error: 'class Poco::PriorityDelegate<TObj, void, true>' has no member named '_pTarget' [-Wtemplate-body]
  203 |                         this->_pTarget        = delegate._pTarget;
      |                               ^~~~~~~~
poco/1.13.3/git/Foundation/include/Poco/PriorityDelegate.h:203:58: error: 'const class Poco::PriorityDelegate<TObj, void, true>' has no member named '_pTarget' [-Wtemplate-body]
  203 |                         this->_pTarget        = delegate._pTarget;
      |                                                          ^~~~~~~~
poco/1.13.3/git/Foundation/include/Poco/PriorityDelegate.h: In member function 'Poco::PriorityDelegate<TObj, void, false>& Poco::PriorityDelegate<TObj, void, false>::operator=(const Poco::PriorityDelegate<TObj, void, false>&)':
poco/1.13.3/git/Foundation/include/Poco/PriorityDelegate.h:277:31: error: 'class Poco::PriorityDelegate<TObj, void, false>' has no member named '_pTarget' [-Wtemplate-body]
  277 |                         this->_pTarget        = delegate._pTarget;
      |                               ^~~~~~~~
poco/1.13.3/git/Foundation/include/Poco/PriorityDelegate.h:277:58: error: 'const class Poco::PriorityDelegate<TObj, void, false>' has no member named '_pTarget' [-Wtemplate-body]
  277 |                         this->_pTarget        = delegate._pTarget;
      |                                                          ^~~~~~~~

Signed-off-by: mark.yang <mark.yang@lge.com>
---
 ...er.h-fix-the-build-on-gcc-15-unsatis.patch | 59 +++++++++++++++++++
 ...uild-error-with-GCC-15-class-Poco-Pr.patch | 53 +++++++++++++++++
 meta-oe/recipes-support/poco/poco_1.13.3.bb   |  2 +
 3 files changed, 114 insertions(+)
 create mode 100644 meta-oe/recipes-support/poco/poco/0001-SimpleRowFormatter.h-fix-the-build-on-gcc-15-unsatis.patch
 create mode 100644 meta-oe/recipes-support/poco/poco/0002-fix-Foundation-Build-error-with-GCC-15-class-Poco-Pr.patch

diff --git a/meta-oe/recipes-support/poco/poco/0001-SimpleRowFormatter.h-fix-the-build-on-gcc-15-unsatis.patch b/meta-oe/recipes-support/poco/poco/0001-SimpleRowFormatter.h-fix-the-build-on-gcc-15-unsatis.patch
new file mode 100644
index 0000000000..d976a1f83b
--- /dev/null
+++ b/meta-oe/recipes-support/poco/poco/0001-SimpleRowFormatter.h-fix-the-build-on-gcc-15-unsatis.patch
@@ -0,0 +1,59 @@
+From 03c35cff930e421199b586c33a00eb6cc537ba28 Mon Sep 17 00:00:00 2001
+From: Sergei Trofimovich <slyich@gmail.com>
+Date: Thu, 19 Sep 2024 09:36:48 +0100
+Subject: [PATCH] SimpleRowFormatter.h: fix the build on `gcc-15` (unsatisfied
+ `noexcept`)
+
+On today's `gcc-15` poco fails to build as:
+
+    In file included from /build/source/Data/include/Poco/Data/Statement.h:27,
+                     from /build/source/Data/include/Poco/Data/Session.h:23,
+                     from /build/source/Data/include/Poco/Data/ArchiveStrategy.h:22,
+                     from /build/source/Data/src/ArchiveStrategy.cpp:15:
+    /build/source/Data/include/Poco/Data/SimpleRowFormatter.h:114:21: error: declaration of 'std::_Require<std::__not_<std::__is_tuple_like<_Tp> >, std::is_move_construc
+    tible<_Tp>, std::is_move_assignable<_Tp> > std::swap(_Tp&, _Tp&) noexcept [with _Tp = Poco::Data::SimpleRowFormatter; _Require<__not_<__is_tuple_like<_Tp> >, is_move_constructible<_Tp>, is_move_assignable<_Tp> > = void]' has a different exception specifier
+      114 |         inline void swap<Poco::Data::SimpleRowFormatter>(Poco::Data::SimpleRowFormatter& s1,
+          |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+    In file included from /nix/store/...-gcc-15.0.0/include/c++/15.0.0/bits/new_allocator.h:36,
+                     from /nix/store/...-gcc-15.0.0/include/c++/15.0.0/x86_64-unknown-linux-gnu/bits/c++allocator.h:33,
+                     from /nix/store/...-gcc-15.0.0/include/c++/15.0.0/bits/allocator.h:46,
+                     from /nix/store/...-gcc-15.0.0/include/c++/15.0.0/string:43,
+                     from /build/source/Foundation/include/Poco/Foundation.h:94,
+                     from /build/source/Data/include/Poco/Data/Data.h:23,
+                     from /build/source/Data/include/Poco/Data/ArchiveStrategy.h:21:
+    /nix/store/...-gcc-15.0.0/include/c++/15.0.0/bits/move.h:214:5: note: from previous declaration 'std::_Require<std::__not_<std::__is_tuple_like<_Tp> >, std::is_move_constructible<_Tp>, std::is_move_assignable<_Tp> > std::swap(_Tp&, _Tp&) noexcept (false) [with _Tp = Poco::Data::SimpleRowFormatter; _Require<__not_<__is_tuple_like<_Tp> >, is_move_constructible<_Tp>, is_move_assignable<_Tp> > = void]'
+      214 |     swap(_Tp& __a, _Tp& __b)
+          |     ^~~~
+
+Possibly because `SimpleRowFormatter` does not have constructors and
+assignment operators that involve rvalue references?
+
+Updated `noexcept` condition. Fixes the build on` gcc-15`. Still
+compiles on `gcc-13`.
+
+Upstream-Status: Backport [03c35cf SimpleRowFormatter.h: fix the build on `gcc-15` (unsatisfied `noexcept`)]
+Signed-off-by: mark.yang <mark.yang@lge.com>
+---
+ Data/include/Poco/Data/SimpleRowFormatter.h | 5 +----
+ 1 file changed, 1 insertion(+), 4 deletions(-)
+
+diff --git a/Data/include/Poco/Data/SimpleRowFormatter.h b/Data/include/Poco/Data/SimpleRowFormatter.h
+index 0dcb43b0b..c8417b3a7 100644
+--- a/Data/include/Poco/Data/SimpleRowFormatter.h
++++ b/Data/include/Poco/Data/SimpleRowFormatter.h
+@@ -109,13 +109,10 @@ inline std::streamsize SimpleRowFormatter::getSpacing() const
+ 
+ namespace std
+ {
+-	// Note: for an unknown reason, clang refuses to compile this function as noexcept
+ 	template<>
+ 	inline void swap<Poco::Data::SimpleRowFormatter>(Poco::Data::SimpleRowFormatter& s1,
+ 		Poco::Data::SimpleRowFormatter& s2)
+-#ifndef POCO_COMPILER_CLANG
+-		noexcept
+-#endif
++		noexcept(std::is_nothrow_swappable_v<Poco::Data::SimpleRowFormatter>)
+ 		/// Full template specalization of std:::swap for SimpleRowFormatter
+ 	{
+ 		s1.swap(s2);
+
diff --git a/meta-oe/recipes-support/poco/poco/0002-fix-Foundation-Build-error-with-GCC-15-class-Poco-Pr.patch b/meta-oe/recipes-support/poco/poco/0002-fix-Foundation-Build-error-with-GCC-15-class-Poco-Pr.patch
new file mode 100644
index 0000000000..e607063d58
--- /dev/null
+++ b/meta-oe/recipes-support/poco/poco/0002-fix-Foundation-Build-error-with-GCC-15-class-Poco-Pr.patch
@@ -0,0 +1,53 @@
+From 6faf90773a7327e54342a5d3caee151623b5caf0 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?G=C3=BCnter=20Obiltschnig?= <guenter.obiltschnig@appinf.com>
+Date: Fri, 27 Sep 2024 08:53:18 +0200
+Subject: [PATCH] =?UTF-8?q?fix(Foundation):=20Build=20error=20with=20GCC-1?=
+ =?UTF-8?q?5=20(class=20Poco::PriorityDelegate<TObj,=20void,=20true>?=
+ =?UTF-8?q?=E2=80=99=20has=20no=20member=20named=20=E2=80=98=5FpTarget?=
+ =?UTF-8?q?=E2=80=99)=20(#4695)?=
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Backport [6faf907 fix(Foundation): Build error with GCC-15 (class Poco::PriorityDelegate<TObj, void, true>’ has no member named ‘_pTarget’) (#4695)]
+Signed-off-by: mark.yang <mark.yang@lge.com>
+---
+ Foundation/include/Poco/PriorityDelegate.h | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/Foundation/include/Poco/PriorityDelegate.h b/Foundation/include/Poco/PriorityDelegate.h
+index 4cd664aab..cac9cf25e 100644
+--- a/Foundation/include/Poco/PriorityDelegate.h
++++ b/Foundation/include/Poco/PriorityDelegate.h
+@@ -52,7 +52,6 @@ public:
+ 	{
+ 		if (&delegate != this)
+ 		{
+-			this->_pTarget        = delegate._pTarget;
+ 			this->_receiverObject = delegate._receiverObject;
+ 			this->_receiverMethod = delegate._receiverMethod;
+ 			this->_priority       = delegate._priority;
+@@ -126,7 +125,6 @@ public:
+ 	{
+ 		if (&delegate != this)
+ 		{
+-			this->_pTarget        = delegate._pTarget;
+ 			this->_receiverObject = delegate._receiverObject;
+ 			this->_receiverMethod = delegate._receiverMethod;
+ 			this->_priority       = delegate._priority;
+@@ -200,7 +198,6 @@ public:
+ 	{
+ 		if (&delegate != this)
+ 		{
+-			this->_pTarget        = delegate._pTarget;
+ 			this->_receiverObject = delegate._receiverObject;
+ 			this->_receiverMethod = delegate._receiverMethod;
+ 			this->_priority       = delegate._priority;
+@@ -274,7 +271,6 @@ public:
+ 	{
+ 		if (&delegate != this)
+ 		{
+-			this->_pTarget        = delegate._pTarget;
+ 			this->_receiverObject = delegate._receiverObject;
+ 			this->_receiverMethod = delegate._receiverMethod;
+ 			this->_priority       = delegate._priority;
diff --git a/meta-oe/recipes-support/poco/poco_1.13.3.bb b/meta-oe/recipes-support/poco/poco_1.13.3.bb
index 0beffab99f..662caa27d7 100644
--- a/meta-oe/recipes-support/poco/poco_1.13.3.bb
+++ b/meta-oe/recipes-support/poco/poco_1.13.3.bb
@@ -11,6 +11,8 @@ DEPENDS = "libpcre2 zlib"
 SRC_URI = "git://github.com/pocoproject/poco.git;branch=poco-1.13.3;protocol=https \
            file://0001-cppignore.lnx-Ignore-PKCS12-and-testLaunch-test.patch \
            file://run-ptest \
+           file://0001-SimpleRowFormatter.h-fix-the-build-on-gcc-15-unsatis.patch \
+           file://0002-fix-Foundation-Build-error-with-GCC-15-class-Poco-Pr.patch \
            "
 SRCREV = "7f848d25aa0461d3beeff1189dc61b48ffe8e2f4"
 
-- 
2.34.1


