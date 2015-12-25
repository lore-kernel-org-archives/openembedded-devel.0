Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BE4917319E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Dec 2015 07:56:30 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tBP7uVXA028308
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Dec 2015 23:56:31 -0800 (PST)
Received: from pek-kkang-d2.wrs.com (128.224.162.180) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 24 Dec 2015 23:56:31 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 25 Dec 2015 15:56:26 +0800
Message-ID: <6004cfb78ffea3953ac24226c5d1212de349dde4.1451029460.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1451029460.git.jackie.huang@windriver.com>
References: <cover.1451029460.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-java][PATCH 06/15] Missing inheritance and dependencies in some java packages
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
X-List-Received-Date: Fri, 25 Dec 2015 07:56:31 -0000
Content-Type: text/plain

From: Amy Fong <amy.fong@windriver.com>

icedtea7-native, openjdk-7, and jamvm-native requires pkg-config to
configure without running into an error similar to

7554: syntax error near unexpected token `NSS,'
7554: `PKG_CHECK_MODULES(NSS, nss, NSS_FOUND=yes, NSS_FOUND=no)'

classpath-native and jamvm-native both needs to depend on
java-initial-native

Signed-off-by: Amy Fong <amy.fong@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 recipes-core/classpath/classpath-native_0.99.bb | 2 +-
 recipes-core/icedtea/icedtea7-native.inc        | 2 +-
 recipes-core/jamvm/jamvm.inc                    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-core/classpath/classpath-native_0.99.bb b/recipes-core/classpath/classpath-native_0.99.bb
index 02951b9..d49d7d7 100644
--- a/recipes-core/classpath/classpath-native_0.99.bb
+++ b/recipes-core/classpath/classpath-native_0.99.bb
@@ -1,7 +1,7 @@
 require classpath-native.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=af0004801732bc4b20d90f351cf80510"
-DEPENDS += "ecj-initial-native"
+DEPENDS += "ecj-initial-native virtual/java-initial-native"
 
 PR = "${INC_PR}.0"
 
diff --git a/recipes-core/icedtea/icedtea7-native.inc b/recipes-core/icedtea/icedtea7-native.inc
index 43385e9..b38f3cb 100644
--- a/recipes-core/icedtea/icedtea7-native.inc
+++ b/recipes-core/icedtea/icedtea7-native.inc
@@ -17,7 +17,7 @@ PACKAGECONFIG[x11] = ",--disable-headful,libx11-native xproto-native libxt-nativ
 OEMAKE_BUILD_HEADLESS_ONLY = "${@base_contains('PACKAGECONFIG', 'x11', '', 'BUILD_HEADLESS_ONLY=1', d)}"
 CFLAGS_append = "${@base_contains('PACKAGECONFIG', 'x11', '', ' -DHEADLESS=true', d)}"
 
-inherit native java autotools
+inherit native java autotools pkgconfig
 
 JAVA_HOME[unexport] = "1"
 
diff --git a/recipes-core/jamvm/jamvm.inc b/recipes-core/jamvm/jamvm.inc
index 777b442..880b1e7 100644
--- a/recipes-core/jamvm/jamvm.inc
+++ b/recipes-core/jamvm/jamvm.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://jamvm.sourceforge.net/"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
-DEPENDS = "zlib classpath virtual/javac-native libffi"
+DEPENDS = "zlib classpath virtual/javac-native libffi virtual/java-initial-native"
 DEPENDS_virtclass-native = "zlib-native classpath-native ecj-initial-native libffi-native"
 
 RDEPENDS_${PN} = "classpath"
-- 
1.9.1


