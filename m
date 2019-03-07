Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id DC7887C675
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Mar 2019 07:24:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44FMZx0nb2z5p
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Mar 2019 08:24:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1551943481;
	bh=5Y0UxJ3eaC1XLOFnWjBCxzB4bjyq1Vlc2p2yzN91hRY=;
	h=From:To:Subject:Date:From;
	b=d9O4Dy3W2vhdIPR27jTr2sEJveVdDoa/n8Xt8Eru6BF0tn6/fwIZzraN905v2/MOM
	fve9UMxOzOY57zZuMojmggN+DJ0orsaiiz4CZE5qgoj5wrLn8qOyO1a8c9xheqI0VF
	1RLZhZD5OZ02rEHePBl6um1NfNvxUSYsgPTPG/0PEFX3it2z0UWQZqAdlgl8awh6yb
	RzzgLKdKaHA+oy1M4j48Au1IuP6XzJQ42g4CQjx/wYNyNHhWRzT2KzwBC8NHidSWEH
	UGuAnzvxeZUe2EWN7zQslIeez5ekXFdRWnRMkPEYf3OTl79Kb0SpqC3mwe/apxKRkM
	Gj2dsK2IFMkm7akDNPVK43lrzhxQ51SHDSOa+Fq13gkbTdwQXOGn2BDKO7m9LPVMCp
	WIg0ZixG4L937Ru6tLluVcLGAJ3WUEzlx67UCX9gp1vXaLjqamrpfm6CHoUQ6itK55
	TNavd8DoVBTzmJMZ0iJwEbpGVkd/k1N938ZMGiT5zbsLFuyxiH6P4Ei/ECi+drxPac
	lvbwtEjxMurl9C2SiCxqEzRZtoYQ530JMEWXF8hCESOiuEQNeXZXoiqdlTjFGPMuRX
	eGUF3EzO8SCBmj4kUFmGI/rHnLQKBSLEkl+ap1iUGpGBLD/KulSLZnai0poL8EOwli
	g5FmwyqsSubvmNvwyxBQzVCo=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Mar 2019 09:24:39 +0200
Message-Id: <20190307072439.26527-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-networking][PATCH] crda: Remove alternative option to build with the obsolete OpenSSL 1.0
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
X-List-Received-Date: Thu, 07 Mar 2019 07:24:42 -0000

Note that crda is mainly a legacy package for older kernels,
wireless-regdb-static is recommended instead for kernels >= 4.15.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta-networking/recipes-connectivity/crda/crda_3.18.bb | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/meta-networking/recipes-connectivity/crda/crda_3.18.bb b/meta-networking/recipes-connectivity/crda/crda_3.18.bb
index d5d2ab68c..c93905ea7 100644
--- a/meta-networking/recipes-connectivity/crda/crda_3.18.bb
+++ b/meta-networking/recipes-connectivity/crda/crda_3.18.bb
@@ -4,10 +4,7 @@ SECTION = "net"
 LICENSE = "copyleft-next-0.3.0"
 LIC_FILES_CHKSUM = "file://copyleft-next-0.3.0;md5=8743a2c359037d4d329a31e79eabeffe"
 
-DEPENDS = "python-m2crypto-native python-typing-native python-native libnl \
-           ${@oe.utils.conditional("DEFAULT_CRYPT", "gcrypt", "libgcrypt", "", d)} \
-           ${@oe.utils.conditional("DEFAULT_CRYPT", "openssl", "openssl10", "", d)} \
-          "
+DEPENDS = "python-m2crypto-native python-typing-native python-native libnl libgcrypt"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz \
            file://do-not-run-ldconfig-if-destdir-is-set.patch \
@@ -23,13 +20,9 @@ SRC_URI[sha256sum] = "43fcb9679f8b75ed87ad10944a506292def13e4afb194afa7aa921b01e
 
 inherit python-dir pythonnative siteinfo
 
-# "gcrypt" or "openssl"
-DEFAULT_CRYPT ??= "gcrypt"
-
 # Recursive make problem
 EXTRA_OEMAKE = "MAKEFLAGS= DESTDIR=${D} LIBDIR=${libdir}/crda LDLIBREG='-Wl,-rpath,${libdir}/crda -lreg' \
                 UDEV_RULE_DIR=${nonarch_libdir}/udev/rules.d/"
-EXTRA_OEMAKE_append = " ${@oe.utils.conditional("DEFAULT_CRYPT", "openssl", "USE_OPENSSL=1", "", d)}"
 TARGET_BITS = "${SITEINFO_BITS}"
 export TARGET_BITS
 
-- 
2.17.1


