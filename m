Return-Path: <Fupan.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A4F9F78272
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Oct 2017 05:57:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v9I5vMCd014716
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Oct 2017 22:57:22 -0700 (PDT)
Received: from svc-pulsar-build.wrs.com (128.224.137.13) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Tue, 17 Oct 2017 22:57:21 -0700
From: Fupan Li <fupan.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 18 Oct 2017 05:57:21 +0000
Message-ID: <1508306241-230482-1-git-send-email-fupan.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-java][PATCH] jamvm: fix the building issue of missing ecj-initial
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
X-List-Received-Date: Wed, 18 Oct 2017 05:57:21 -0000
Content-Type: text/plain

Both of building jamvm and jamvm-native need ecj-initial
native tool, but the DEPENDS missed it, thus add ecj-initial
to its DEPENDS. This commit will fix the following building error:

linux/jamvm/2.0.0-devel+gitAUTOINC+6cef41d859-r0/recipe-sysroot-native/usr/bin/ecj-initial: No such file or directory
| Makefile:660: recipe for target 'classes.zip' failed
| make[6]: *** [classes.zip] Error 127

Signed-off-by: Fupan Li <fupan.li@windriver.com>
---
 recipes-core/jamvm/jamvm.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-core/jamvm/jamvm.inc b/recipes-core/jamvm/jamvm.inc
index cad91a2..56b01a6 100644
--- a/recipes-core/jamvm/jamvm.inc
+++ b/recipes-core/jamvm/jamvm.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://jamvm.sourceforge.net/"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
-DEPENDS = "zlib classpath virtual/javac-native libffi virtual/java-initial-native"
+DEPENDS = "zlib classpath virtual/javac-native libffi virtual/java-initial-native classpath-initial-native ecj-initial-native"
 DEPENDS_virtclass-native = "virtual/java-initial-native classpath-initial-native zlib-native classpath-native ecj-initial-native libffi-native"
 
 RDEPENDS_${PN} = "classpath"
@@ -21,7 +21,7 @@ inherit java autotools update-alternatives pkgconfig relative_symlinks
 # This uses 32 bit arm, so force the instruction set to arm, not thumb
 ARM_INSTRUCTION_SET = "arm"
 
-do_configure_append_virtclass-native() {
+do_configure_append() {
 	sed -i -e"s|STAGING_LIBDIR_NATIVE|${STAGING_LIBDIR_NATIVE}|g" \
 		-e "s|STAGING_DATADIR_NATIVE|${STAGING_DATADIR_NATIVE}|g" \
 	${WORKDIR}/java
-- 
2.7.4


