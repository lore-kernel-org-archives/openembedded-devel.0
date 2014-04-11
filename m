Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EFD4F65D28
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Apr 2014 03:33:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s3B3XCwU021649
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Apr 2014 20:33:12 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Thu, 10 Apr 2014 20:33:11 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 11 Apr 2014 11:34:02 +0800
Message-ID: <1397187242-25786-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [meta-oe][PATCH] libnet: update version to 1.1.6
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
X-List-Received-Date: Fri, 11 Apr 2014 03:33:17 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Changes:
- use doc/COPYING instead of README as the license file
- use BPN instead of PN to fix multilib build
- rebase the fix-endianess-test.patch

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../fix-endianess-test.patch                       |   14 ++++++++------
 .../libnet/{libnet_1.1.5.bb => libnet_1.1.6.bb}    |   10 +++++-----
 2 files changed, 13 insertions(+), 11 deletions(-)
 rename meta-oe/recipes-connectivity/libnet/{libnet-1.1.5 => libnet-1.1.6}/fix-endianess-test.patch (80%)
 rename meta-oe/recipes-connectivity/libnet/{libnet_1.1.5.bb => libnet_1.1.6.bb} (57%)

diff --git a/meta-oe/recipes-connectivity/libnet/libnet-1.1.5/fix-endianess-test.patch b/meta-oe/recipes-connectivity/libnet/libnet-1.1.6/fix-endianess-test.patch
similarity index 80%
rename from meta-oe/recipes-connectivity/libnet/libnet-1.1.5/fix-endianess-test.patch
rename to meta-oe/recipes-connectivity/libnet/libnet-1.1.6/fix-endianess-test.patch
index 4d8697d..4f9d5a4 100644
--- a/meta-oe/recipes-connectivity/libnet/libnet-1.1.5/fix-endianess-test.patch
+++ b/meta-oe/recipes-connectivity/libnet/libnet-1.1.6/fix-endianess-test.patch
@@ -6,19 +6,21 @@ Idea from http://www.security-lists.org/lists/libnet/2003/03/00001.html
 
 Also remove the old test from aclocal.m4.
 
-Rebased for libnet-1.1.5 on 2011/04/19.
+Rebased for libnet-1.1.6
 
---- a/configure.in	2010-11-03 00:59:21.000000000 +0100
-+++ b/configure.in	2011-04-19 17:08:47.087712604 +0200
-@@ -6,6 +6,7 @@
+diff --git a/configure.in b/configure.in
+index e54c688..e2e768e 100644
+--- a/configure.in
++++ b/configure.in
+@@ -4,6 +4,7 @@ dnl All rights reserved.
  dnl
  dnl Process this file with autoconf to produce a configure script.
  
 +AC_PREREQ(2.52)
- AC_INIT(libnet, 1.1.5)
+ AC_INIT(libnet, 1.1.6)
  AC_MSG_RESULT(beginning autoconfiguration process for libnet-${PACKAGE_VERSION} ...)
  AC_CANONICAL_SYSTEM
-@@ -39,7 +40,16 @@
+@@ -38,7 +39,16 @@ dnl
  dnl And some custom things
  dnl
  
diff --git a/meta-oe/recipes-connectivity/libnet/libnet_1.1.5.bb b/meta-oe/recipes-connectivity/libnet/libnet_1.1.6.bb
similarity index 57%
rename from meta-oe/recipes-connectivity/libnet/libnet_1.1.5.bb
rename to meta-oe/recipes-connectivity/libnet/libnet_1.1.6.bb
index 76959fe..0db074b 100644
--- a/meta-oe/recipes-connectivity/libnet/libnet_1.1.5.bb
+++ b/meta-oe/recipes-connectivity/libnet/libnet_1.1.6.bb
@@ -3,18 +3,18 @@ SUMMARY = "A packet dissection and creation library"
 HOMEPAGE = "https://github.com/sam-github/libnet"
 SECTION = "libs"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://README;md5=533bea47338d490e86744c6a0c5692e7"
+LIC_FILES_CHKSUM = "file://doc/COPYING;md5=fb43d5727b2d3d1238545f75ce456ec3"
 DEPENDS = "libpcap"
 # There are major API changes beween libnet v1.0 and libnet v1.1
 PROVIDES = "libnet-1.1"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/libnet-dev/${PN}-${PV}.tar.gz \
+SRC_URI = "${SOURCEFORGE_MIRROR}/libnet-dev/${BPN}-${PV}.tar.gz \
            file://fix-endianess-test.patch"
 
-SRC_URI[md5sum] = "a9bc1d75a610efcfee200d3e28d8eb8f"
-SRC_URI[sha256sum] = "75588f8d1232e1df34eccf2dba5e66be197b345a07fae80d8275db994496a20d"
+SRC_URI[md5sum] = "710296fe424a49344e5fcc0d09e53317"
+SRC_URI[sha256sum] = "d392bb5825c4b6b672fc93a0268433c86dc964e1500c279dc6d0711ea6ec467a"
 
-S = "${WORKDIR}/${PN}-${PV}"
+S = "${WORKDIR}/${BPN}-${PV}"
 
 inherit autotools binconfig
 
-- 
1.7.9.5


