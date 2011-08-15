Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QszHa-0004Y4-K4
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Aug 2011 17:40:54 +0200
Received: by ywe9 with SMTP id 9so3140846ywe.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2011 08:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=ooWrk0zLn06vqpaExjSMLvtO+3hwo57/ZFJcTi8R9gY=;
	b=qkNND4TIMuIdPdntPNm3wrXYXaHFGx0veFUIcM1frM5IYo+6a0Tq48xOgLD7b39G8D
	DUY+zX9zb82lSfJXYVPkHfT89T25Kz6a1qij8GgLn1H14b/19f1Sx1ZwXLPMJ02Xy4K8
	RE8Hz8MlFApTKWHbSVwwLBOFGE+9HRxwUpbAA=
Received: by 10.236.173.129 with SMTP id v1mr12181410yhl.207.1313422577187;
	Mon, 15 Aug 2011 08:36:17 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id j45sm6440886yhe.8.2011.08.15.08.36.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 15 Aug 2011 08:36:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Aug 2011 08:36:02 -0700
Message-Id: <1313422562-26037-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [meta-oe][PATCH] openssl-1.0.0: Remove spurious comment in recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Aug 2011 15:40:54 -0000

That comment was to note the reason for differences in license
checksums between 1.0.0c and 1.0.0d

Adjust the formatting of patches in SRC_URI

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-connectivity/openssl/openssl_1.0.0d.bb |   28 +++++++++----------
 1 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/meta-oe/recipes-connectivity/openssl/openssl_1.0.0d.bb b/meta-oe/recipes-connectivity/openssl/openssl_1.0.0d.bb
index 384f3ba..cd5408d 100644
--- a/meta-oe/recipes-connectivity/openssl/openssl_1.0.0d.bb
+++ b/meta-oe/recipes-connectivity/openssl/openssl_1.0.0d.bb
@@ -7,8 +7,6 @@ DEPENDS += "ocf-linux"
 CFLAG += "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
 
 PR = "${INC_PR}.0"
-#- * Copyright (c) 1998-2008 The OpenSSL Project.  All rights reserved.
-#+ * Copyright (c) 1998-2011 The OpenSSL Project.  All rights reserved.
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f9a8f968107345e0b75aa8c2ecaa7ec8"
 
@@ -23,19 +21,19 @@ export OE_LDFLAGS="${LDFLAGS}"
 SRC_URI += "file://configure-targets.patch \
             file://shared-libs.patch \
             file://oe-ldflags.patch \
-	    file://engines-install-in-libdir-ssl.patch \
-	    file://debian/version-script.patch \
-	    file://debian/pic.patch \
-	    file://debian/c_rehash-compat.patch \
-	    file://debian/ca.patch \
-	    file://debian/make-targets.patch \
-	    file://debian/no-rpath.patch \
-	    file://debian/man-dir.patch \
-	    file://debian/man-section.patch \
-	    file://debian/pkg-config.patch \
-	    file://debian/no-symbolic.patch \
-	    file://debian/debian-targets.patch \
-	   "
+            file://engines-install-in-libdir-ssl.patch \
+            file://debian/version-script.patch \
+            file://debian/pic.patch \
+            file://debian/c_rehash-compat.patch \
+            file://debian/ca.patch \
+            file://debian/make-targets.patch \
+            file://debian/no-rpath.patch \
+            file://debian/man-dir.patch \
+            file://debian/man-section.patch \
+            file://debian/pkg-config.patch \
+            file://debian/no-symbolic.patch \
+            file://debian/debian-targets.patch \
+           "
 
 PACKAGES += " \
 	${PN}-engines \
-- 
1.7.5.4



