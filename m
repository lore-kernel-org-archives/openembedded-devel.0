Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B38E875742
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jun 2015 07:48:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t547mPr4005399
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 4 Jun 2015 00:48:25 -0700 (PDT)
Received: from localhost (128.224.163.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Thu, 4 Jun 2015 00:48:25 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 4 Jun 2015 15:48:13 +0800
Message-ID: <fadb64c6fa4d33d4ccd562a1bef5eca5bf9f8139.1433403866.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1433403866.git.yi.zhao@windriver.com>
References: <cover.1433403866.git.yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.163.137]
Subject: [meta-oe][PATCH 3/3] llvm: fix libdir for multilib
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
X-List-Received-Date: Thu, 04 Jun 2015 07:48:23 -0000
Content-Type: text/plain

Fix the hardcoded libdir in llvm-config and Makefile.config

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-core/llvm/llvm.inc |    9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/llvm/llvm.inc b/meta-oe/recipes-core/llvm/llvm.inc
index 26bac33..0597be1 100644
--- a/meta-oe/recipes-core/llvm/llvm.inc
+++ b/meta-oe/recipes-core/llvm/llvm.inc
@@ -60,6 +60,9 @@ do_configure_prepend() {
     sed -i "s|sys::path::parent_path(CurrentPath))\.str()|sys::path::parent_path(sys::path::parent_path(CurrentPath))).str()|g" ${S}/tools/llvm-config/llvm-config.cpp
     sed -ri "s#/(bin|include|lib)(/?\")#/\1/${LLVM_DIR}\2#g" ${S}/tools/llvm-config/llvm-config.cpp
 
+    # Fix the hardcoded libdir in llvm-config
+    sed -i 's:/lib\>:${base_libdir}:g' ${S}/tools/llvm-config/llvm-config.cpp
+
     # Fails to build unless using separate directory from source
     mkdir -p ${LLVM_BUILD_DIR}
     cd ${LLVM_BUILD_DIR}
@@ -67,6 +70,10 @@ do_configure_prepend() {
 
 do_compile() {
     cd ${LLVM_BUILD_DIR}
+
+    # Fix libdir for multilib
+    sed -i 's:(PROJ_prefix)/lib:(PROJ_prefix)${base_libdir}:g' Makefile.config
+
     oe_runmake \
         AR="${BUILD_AR}" \
         CC="${BUILD_CC}" \
@@ -127,7 +134,7 @@ FILES_${PN}-dev = "${bindir}/${LLVM_DIR} \
 
 PACKAGES_DYNAMIC = "^libllvm-.*$"
 
-INSANE_SKIP_libllvm${LLVM_RELEASE}-llvm-${LLVM_RELEASE} += "dev-so"
+INSANE_SKIP_${MLPREFIX}libllvm${LLVM_RELEASE}-llvm-${LLVM_RELEASE} += "dev-so"
 
 python llvm_populate_packages() {
     libdir = bb.data.expand('${libdir}', d)
-- 
1.7.9.5


