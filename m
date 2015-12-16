Return-Path: <vomegaz@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 7FF3B6FFCD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Dec 2015 10:08:15 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id l126so30875549wml.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Dec 2015 02:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=FO0DzWG7IAPbnVLsq3gx3af9vBnbyJhLPC6YJoL1RME=;
	b=oPPlP4MUUl/yZvgCowyEhoYxkvBB/WFiLdVkjAQDeD6XeOhp5O4WwN3SB+uokBGGnX
	qVAc6Y3qXJ6WqVqytMgD4RVf1cExM+/IqGGvcNTYA+bBu/uqCcSagBR7iaxCIrv2z19j
	6yLbrLs9BK9zyxJv315SOOcw57Z4CyuzfiFFChrW8MTB/y3RoEFTjNPg91MyB3kaFRZv
	P/PjeWd8tvt/fXj6Fqj0naBGd9Gg6ceApKJxgSWqzDq7Ch6MJFsld3ux1OVO0jlTTWzd
	CZA9ndPH+h1O/993OUgOe9gMw68x6jIS+kj8TvehAzQnrf3knOnUfpOLE90mZwl0vjw5
	4TyA==
X-Received: by 10.194.87.201 with SMTP id ba9mr51036665wjb.125.1450260495630; 
	Wed, 16 Dec 2015 02:08:15 -0800 (PST)
Received: from sgxcmp131.intra.sigfox.io ([217.114.201.133])
	by smtp.gmail.com with ESMTPSA id u17sm6730653wmd.8.2015.12.16.02.08.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 16 Dec 2015 02:08:14 -0800 (PST)
Sender: Thomas PERROT <vomegaz@gmail.com>
From: Thomas Perrot <thomas.perrot@tupi.fr>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Dec 2015 11:08:11 +0100
Message-Id: <1450260491-23059-1-git-send-email-thomas.perrot@tupi.fr>
X-Mailer: git-send-email 2.1.4
Subject: [fido][PATCH] Fix build issue on openssl 1.0.2d on Fido branch. OpenSSL's URIs of old releases have changed to /source/old/<x.y.z> instead of /source.
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
X-List-Received-Date: Wed, 16 Dec 2015 10:08:15 -0000

Signed-off-by: Thomas Perrot <thomas.perrot@tupi.fr>
---
 .../recipes-connectivity/openssl/openssl_1.0.2d.bb | 51 +++++++++++-----------
 1 file changed, 26 insertions(+), 25 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
index c862d5d..2f4f7a1 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
@@ -11,31 +11,32 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f9a8f968107345e0b75aa8c2ecaa7ec8"
 export DIRS = "crypto ssl apps engines"
 export OE_LDFLAGS="${LDFLAGS}"
 
-SRC_URI += "file://configure-targets.patch \
-            file://shared-libs.patch \
-            file://oe-ldflags.patch \
-            file://engines-install-in-libdir-ssl.patch \
-            file://debian1.0.2/block_diginotar.patch \
-            file://debian1.0.2/block_digicert_malaysia.patch \
-            file://debian/ca.patch \
-            file://debian/c_rehash-compat.patch \
-            file://debian/debian-targets.patch \
-            file://debian/man-dir.patch \
-            file://debian/man-section.patch \
-            file://debian/no-rpath.patch \
-            file://debian/no-symbolic.patch \
-            file://debian/pic.patch \
-            file://debian/version-script.patch \
-            file://openssl_fix_for_x32.patch \
-            file://fix-cipher-des-ede3-cfb1.patch \
-            file://openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch \
-            file://find.pl \
-            file://openssl-fix-des.pod-error.patch \
-            file://Makefiles-ptest.patch \
-            file://ptest-deps.patch \
-            file://run-ptest \
-            file://crypto_use_bigint_in_x86-64_perl.patch \
-           "
+SRC_URI = "http://www.openssl.org/source/old/1.0.2/openssl-${PV}.tar.gz \
+	   file://configure-targets.patch \
+           file://shared-libs.patch \
+           file://oe-ldflags.patch \
+           file://engines-install-in-libdir-ssl.patch \
+           file://debian1.0.2/block_diginotar.patch \
+           file://debian1.0.2/block_digicert_malaysia.patch \
+           file://debian/ca.patch \
+           file://debian/c_rehash-compat.patch \
+           file://debian/debian-targets.patch \
+           file://debian/man-dir.patch \
+           file://debian/man-section.patch \
+           file://debian/no-rpath.patch \
+           file://debian/no-symbolic.patch \
+           file://debian/pic.patch \
+           file://debian/version-script.patch \
+           file://openssl_fix_for_x32.patch \
+           file://fix-cipher-des-ede3-cfb1.patch \
+           file://openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch \
+           file://find.pl \
+           file://openssl-fix-des.pod-error.patch \
+           file://Makefiles-ptest.patch \
+           file://ptest-deps.patch \
+           file://run-ptest \
+           file://crypto_use_bigint_in_x86-64_perl.patch \
+          "
 
 SRC_URI[md5sum] = "38dd619b2e77cbac69b99f52a053d25a"
 SRC_URI[sha256sum] = "671c36487785628a703374c652ad2cebea45fa920ae5681515df25d9f2c9a8c8"
-- 
2.1.4


