Return-Path: <net147@gmail.com>
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 4A9816B7B3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Aug 2013 01:41:47 +0000 (UTC)
Received: by mail-pd0-f171.google.com with SMTP id g10so1162767pdj.16
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Aug 2013 18:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=9n94afj59IWV5+8Jy1aybbLRdaH4I1bjVjRyoRtEyOg=;
	b=x4G4a4nbpQV6faf73Xh2hXA+iHB8r1Lt08aTWrwd20WzMtYe3pdo0h0QXzjwmf1Ggf
	NUHxYNO9sdpLhgTKOhAnPcz+dkILqqZPCdZDdkFXe5Vv/U2L3JLk5fS4DGKf1ZL1xMwa
	4m3pg4Sxmp5heXNXjc4ZlO+923Cu7LN2yv4f9nJNjoVHNQrF/0JmdIbzOnu0Px0ydiSc
	VhGjdLERrEAr9lVLuhDe71ZGW3dbpsPAIpJnbh7mdKS5xwsD156Ky3xUIwvuftBQvxMR
	xAD83xN1OV4aqu0RFpjJWZUmdSWEEnsBNPrGzVZyjhXuxgSkWIIT35YQgYFyZOWn9U5n
	Cbqw==
X-Received: by 10.68.200.9 with SMTP id jo9mr4940009pbc.120.1377049307627;
	Tue, 20 Aug 2013 18:41:47 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	qp10sm6662709pab.13.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 20 Aug 2013 18:41:47 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Aug 2013 11:36:41 +1000
Message-Id: <1377049001-8170-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.3.4
Subject: [meta-oe][PATCH] llvm: include /usr/lib/libLLVM-*.so in lib package
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
X-List-Received-Date: Wed, 21 Aug 2013 01:41:48 -0000

/usr/lib/libLLVM-*.so was being split into the dev package but it should
be in the lib package otherwise software that depends on the LLVM shared
library will be unable to to locate it when the dev package isn't
installed.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta-oe/recipes-core/llvm/llvm.inc | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-core/llvm/llvm.inc b/meta-oe/recipes-core/llvm/llvm.inc
index c0d6b6e..525dd3c 100644
--- a/meta-oe/recipes-core/llvm/llvm.inc
+++ b/meta-oe/recipes-core/llvm/llvm.inc
@@ -42,20 +42,24 @@ DOTDEBUG-dbg = " ${bindir}/${LLVM_DIR}/.debug \
                  /usr/src/debug \
 "
 
-FILES_${PN}-dev += "${bindir}/${LLVM_DIR} \
-                    ${libdir}/${LLVM_DIR}/BugpointPasses.so \
-                    ${libdir}/${LLVM_DIR}/LLVMHello.so \
+FILES_${PN}-dev = "${bindir}/${LLVM_DIR} \
+                   ${includedir}/${LLVM_DIR} \
+                   ${libdir}/${LLVM_DIR}/BugpointPasses.so \
+                   ${libdir}/${LLVM_DIR}/LLVMHello.so \
 "
 
 PACKAGES_DYNAMIC = "^libllvm-.*$"
 
 python llvm_populate_packages() {
+    libdir = bb.data.expand('${libdir}', d)
     libllvm_libdir = bb.data.expand('${libdir}/${LLVM_DIR}', d)
-    split_packages = do_split_packages(d, libllvm_libdir, '^lib(.*)\.so$', 'libllvm${LLVM_RELEASE}-%s', 'Split package for %s', allow_dirs=True)
     split_dbg_packages = do_split_packages(d, libllvm_libdir+'/.debug', '^lib(.*)\.so$', 'libllvm${LLVM_RELEASE}-%s-dbg', 'Split debug package for %s', allow_dirs=True)
+    split_packages = do_split_packages(d, libdir, '^lib(.*)\.so$', 'libllvm${LLVM_RELEASE}-%s', 'Split package for %s', allow_dirs=True, allow_links=True, recursive=True)
     split_staticdev_packages = do_split_packages(d, libllvm_libdir, '^lib(.*)\.a$', 'libllvm${LLVM_RELEASE}-%s-staticdev', 'Split staticdev package for %s', allow_dirs=True)
     if split_packages:
         pn = d.getVar('PN', True)
+        for package in split_packages:
+            d.appendVar('INSANE_SKIP_' + package, ' dev-so')
         d.appendVar('RDEPENDS_' + pn, ' '+' '.join(split_packages))
         d.appendVar('RDEPENDS_' + pn + '-dbg', ' '+' '.join(split_dbg_packages))
         d.appendVar('RDEPENDS_' + pn + '-staticdev', ' '+' '.join(split_staticdev_packages))
-- 
1.8.3.4


