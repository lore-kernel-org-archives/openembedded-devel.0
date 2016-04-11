Return-Path: <j-stiffler@ti.com>
X-Greylist: delayed 568 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 11 Apr 2016 21:42:00 UTC
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by mail.openembedded.org (Postfix) with ESMTP id EE09365C5C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Apr 2016 21:42:00 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u3BLWXac007388
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Apr 2016 16:32:33 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u3BLWWr0014139
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Apr 2016 16:32:32 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 11 Apr 2016 16:32:32 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u3BLWWJW031223;	Mon, 11 Apr 2016 16:32:32 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 11 Apr 2016 17:32:30 -0400
Message-ID: <1460410351-25968-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] llvm: correct fix for the multilib libdir
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
X-List-Received-Date: Mon, 11 Apr 2016 21:42:01 -0000
Content-Type: text/plain

* If llvm.inc is used for native and nativesdk class packages, the
  resulting llvm-config is broken since "${base_libdir}" is prefixed
  with the full patch to sysroot
* Replace "/lib" with "/${baselib}" instead of "${base_libdir}" as
  "${base_libdir}" is the full path and "${baselib}" is the name of
  the multilib directory.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-oe/recipes-core/llvm/llvm.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/llvm/llvm.inc b/meta-oe/recipes-core/llvm/llvm.inc
index 31b2db4..02d4617 100644
--- a/meta-oe/recipes-core/llvm/llvm.inc
+++ b/meta-oe/recipes-core/llvm/llvm.inc
@@ -61,7 +61,7 @@ do_configure_prepend() {
     sed -ri "s#/(bin|include|lib)(/?\")#/\1/${LLVM_DIR}\2#g" ${S}/tools/llvm-config/llvm-config.cpp
 
     # Fix the hardcoded libdir in llvm-config
-    sed -i 's:/lib\>:${base_libdir}:g' ${S}/tools/llvm-config/llvm-config.cpp
+    sed -i 's:/lib\>:/${baselib}:g' ${S}/tools/llvm-config/llvm-config.cpp
 
     # Fails to build unless using separate directory from source
     mkdir -p ${LLVM_BUILD_DIR}
@@ -72,7 +72,7 @@ do_compile() {
     cd ${LLVM_BUILD_DIR}
 
     # Fix libdir for multilib
-    sed -i 's:(PROJ_prefix)/lib:(PROJ_prefix)${base_libdir}:g' Makefile.config
+    sed -i 's:(PROJ_prefix)/lib:(PROJ_prefix)/${baselib}:g' Makefile.config
 
     oe_runmake \
         AR="${BUILD_AR}" \
-- 
1.9.1


