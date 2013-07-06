Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id EE1516B084
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  6 Jul 2013 19:33:27 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id d41so1990762eek.33
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Jul 2013 12:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=x9VpZf0mkfyZAoUCiKWcABI7xXFKje0S4tZTwY0OmWY=;
	b=GVSXbzZSzLR9iVewPThTSu4KB/xuheJecJo+t4KUps562qppjzz+7wzrI8t3Tuioms
	6A/3aTcdkl32pl6S3regO+LH7o2/I7/AMsIJz2ZJZpfjVKMG+VE4Na/8Ao26vhAAVud9
	7cd7L4EqByny+WUiaogweZRlGH5SKqx9gGrdEOYeVLyHazzgKJSChJP7bZ5qFvt3STT8
	U0Mr01koKqPlGRWMZXOOhqiffIJi6mk2dOOWAlkj98FEIc5gBsJqdXZ9YXuNL63V8UPO
	0kChaBjYuJUXOpS8jIBOPcm/WmaefhAwTJPvyunXBbHd//0ABz9Zr7d1oyMMGZsLivv3
	qCQA==
X-Received: by 10.15.36.133 with SMTP id i5mr17999325eev.52.1373139208433;
	Sat, 06 Jul 2013 12:33:28 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	p49sm26375137eeu.2.2013.07.06.12.33.27 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 06 Jul 2013 12:33:27 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  6 Jul 2013 21:33:22 +0200
Message-Id: <69caeb1598b6e50a8e48ccf9105fb3aa61a91067.1373139082.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <5d905be3007b8c80144f011101a2c999b7b6011a.1373139082.git.Martin.Jansa@gmail.com>
References: <5d905be3007b8c80144f011101a2c999b7b6011a.1373139082.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1373139082.git.Martin.Jansa@gmail.com>
References: <cover.1373139082.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 3/4] llvm: use newer class-native overrides instead of virtclass
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
X-List-Received-Date: Sat, 06 Jul 2013 19:33:28 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-core/llvm/llvm-common.bb |  2 +-
 meta-oe/recipes-core/llvm/llvm2.inc      | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-core/llvm/llvm-common.bb b/meta-oe/recipes-core/llvm/llvm-common.bb
index 192919e..395ab01 100644
--- a/meta-oe/recipes-core/llvm/llvm-common.bb
+++ b/meta-oe/recipes-core/llvm/llvm-common.bb
@@ -14,7 +14,7 @@ llvm_common_sysroot_preprocess() {
     install -m 0755 ${WORKDIR}/llvm-config ${SYSROOT_DESTDIR}${bindir_crossscripts}/
 }
 
-do_install_virtclass-native() {
+do_install_class-native() {
     install -d ${D}${bindir}
     install -m 0755 ${WORKDIR}/llvm-config ${D}${bindir}
 }
diff --git a/meta-oe/recipes-core/llvm/llvm2.inc b/meta-oe/recipes-core/llvm/llvm2.inc
index 5ae993a..b239d30 100644
--- a/meta-oe/recipes-core/llvm/llvm2.inc
+++ b/meta-oe/recipes-core/llvm/llvm2.inc
@@ -1,5 +1,5 @@
 DEPENDS = "llvm${LLVM_RELEASE}-native llvm-common"
-DEPENDS_virtclass-native = "llvm-common-native cmake-native"
+DEPENDS_class-native = "llvm-common-native cmake-native"
 
 SRC_URI = "http://llvm.org/releases/${PV}/llvm-${PV}.tgz"
 S = "${WORKDIR}/llvm-${PV}"
@@ -57,7 +57,7 @@ PACKAGES_DYNAMIC = "llvm-*"
 
 # the difference to the non-native build is that we do not need
 # to declare the location of the tblgen executable.
-EXTRA_OECMAKE_virtclass-native = "\
+EXTRA_OECMAKE_class-native = "\
     -DLLVM_TARGETS_TO_BUILD=${LLVM_ARCH} \
     -DCMAKE_LINKER:FILEPATH=${LD} \
     -DCMAKE_AR:FILEPATH=${AR} \
@@ -68,9 +68,9 @@ EXTRA_OECMAKE_virtclass-native = "\
     -DNM_PATH:FILEPATH=${NM} \
 "
 
-PACKAGES_virtclass-native = ""
+PACKAGES_class-native = ""
 
-PACKAGES_DYNAMIC_virtclass-native = ""
+PACKAGES_DYNAMIC_class-native = ""
 
 python populate_packages_prepend () {
     libllvm_libdir = bb.data.expand('${libdir}/${LLVM_DIR}', d)
@@ -130,7 +130,7 @@ llvm_sysroot_preprocess() {
         install -m 0755 bin/llvm-config${LLVM_RELEASE} ${SYSROOT_DESTDIR}${bindir_crossscripts}
 }
 
-do_install_virtclass-native() {
+do_install_class-native() {
     # Install into a private directory to be able to reorganize the files.
     cd ${LLVM_BUILD_DIR}
     oe_runmake DESTDIR=${LLVM_INSTALL_DIR} install
-- 
1.8.2.1


