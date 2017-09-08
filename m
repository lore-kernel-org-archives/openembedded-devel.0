Return-Path: <mikko.ylinen@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 847A66067D
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Sep 2017 11:10:39 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Sep 2017 04:10:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,360,1500966000"; d="scan'208";a="898350036"
Received: from summit.tm.intel.com ([10.237.55.36])
	by FMSMGA003.fm.intel.com with ESMTP; 08 Sep 2017 04:10:40 -0700
From: Mikko Ylinen <mikko.ylinen@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Sep 2017 14:10:39 +0300
Message-Id: <20170908111039.5192-1-mikko.ylinen@linux.intel.com>
X-Mailer: git-send-email 2.14.1
Subject: [PATCH] efivar: fix build when host gcc version is < 4.9
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
X-List-Received-Date: Fri, 08 Sep 2017 11:10:40 -0000

efivar v27 started using C11 _Generic keyword in macros but that
is not implemented in gcc until 4.9. This makes efivar-native
(which is a dependency to efivar) build to fail if the builder host
gcc version is < 4.9.

It turns out only 'makeguids' generator needs to be built for the
build arch to generate GENERATED_SOURCES for efivar target build.
'makeguids' sources/includes have no gcc version dependencies so
to fix efivar build when host gcc < 4.9, we simply build 'makeguids'
target for efivar-native.

Signed-off-by: Mikko Ylinen <mikko.ylinen@linux.intel.com>
---
 meta-oe/recipes-extended/efivar/efivar_0.31.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/efivar/efivar_0.31.bb b/meta-oe/recipes-extended/efivar/efivar_0.31.bb
index 6ad3b36..9d4cdc9 100644
--- a/meta-oe/recipes-extended/efivar/efivar_0.31.bb
+++ b/meta-oe/recipes-extended/efivar/efivar_0.31.bb
@@ -35,11 +35,15 @@ do_compile_prepend() {
     sed -i -e s:-Werror::g ${S}/gcc.specs
 }
 
+do_compile_class-native() {
+    oe_runmake -C src makeguids
+}
+
 do_install() {
     oe_runmake install DESTDIR=${D}
 }
 
-do_install_append_class-native() {
+do_install_class-native() {
     install -D -m 0755 ${B}/src/makeguids ${D}${bindir}/makeguids
 }
 
-- 
2.1.4


