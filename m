Return-Path: <bradleyb@fuzziesquirrel.com>
X-Greylist: delayed 527 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 26 Mar 2019 12:07:01 UTC
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
	[173.167.31.197])
	by mail.openembedded.org (Postfix) with ESMTP id 431927D0FF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Mar 2019 12:07:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 Mar 2019 07:58:17 -0400
Message-Id: <20190326115817.23731-1-bradleyb@fuzziesquirrel.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH] nodejs: Update GCC 4.8 compat patch
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
X-List-Received-Date: Tue, 26 Mar 2019 12:07:01 -0000
Content-Transfer-Encoding: quoted-printable

GCC 4.8 compatibility was lost moving from 10.15.1 to 10.15.3.  Add
another wrapper for std::make_unique to restore it.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 ...0004-Make-compatibility-with-gcc-4.8.patch | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0004-Make-compatibili=
ty-with-gcc-4.8.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0004-Make-=
compatibility-with-gcc-4.8.patch
index cb38362e4f..925c085e9b 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs/0004-Make-compatibility-with=
-gcc-4.8.patch
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0004-Make-compatibility-with=
-gcc-4.8.patch
@@ -3,6 +3,7 @@ method to be compatible with gcc < 4.9 .
 "error::make_unique is not a member of 'std'"
=20
 Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
+Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
=20
 diff -Naur node-v10.15.1/src/cares_wrap.cc node-v10.15.1/src/cares_wrap.=
cc
 --- node-v10.15.1/src/cares_wrap.cc	2019-01-29 08:20:50.000000000 +0100
@@ -44,3 +45,25 @@ diff -Naur node-v10.15.1/src/inspector_agent.cc node-v=
10.15.1/src/inspector_agen
  namespace node {
  namespace inspector {
  namespace {
+
+diff --git a/src/inspector/main_thread_interface.cc b/src/inspector/main=
_thread_interface.cc
+index e374c0fd70..05d7d8c60f 100644
+--- a/src/inspector/main_thread_interface.cc
++++ b/src/inspector/main_thread_interface.cc
+@@ -6,6 +6,16 @@
+ #include <functional>
+ #include <unicode/unistr.h>
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
--=20
2.20.1

