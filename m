Return-Path: <robert.joslyn@redrectangle.org>
X-Greylist: delayed 3677 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 03 Jun 2019 00:43:34 UTC
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
	by mail.openembedded.org (Postfix) with ESMTP id EE3726D52B
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Jun 2019 00:43:34 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (unknown [217.70.183.196])
	by mslow2.mail.gandi.net (Postfix) with ESMTP id 997343A35B2
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  2 Jun 2019 23:12:43 +0000 (UTC)
X-Originating-IP: 64.126.149.72
Received: from localhost.localdomain (unknown [64.126.149.72])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id E2F23E0003;
	Sun,  2 Jun 2019 23:12:39 +0000 (UTC)
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  2 Jun 2019 16:12:21 -0700
Message-Id: <20190602231221.24148-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] cryptsetup: Add PACKAGECONFIG options
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
X-List-Received-Date: Mon, 03 Jun 2019 00:43:35 -0000
Content-Transfer-Encoding: 8bit

Add various PACKAGECONFIG options, keeping the default options enabled.
---
 .../cryptsetup/cryptsetup_2.1.0.bb            | 51 ++++++++++++++++++-
 1 file changed, 49 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.1.0.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.1.0.bb
index cf1d22242..51cecf5d2 100644
--- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.1.0.bb
+++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.1.0.bb
@@ -9,7 +9,12 @@ SECTION = "console"
 LICENSE = "GPL-2.0-with-OpenSSL-exception"
 LIC_FILES_CHKSUM = "file://COPYING;md5=32107dd283b1dfeb66c9b3e6be312326"
 
-DEPENDS = "util-linux libdevmapper popt libgcrypt json-c"
+DEPENDS = " \
+    json-c \
+    libdevmapper \
+    popt \
+    util-linux \
+"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}/${BP}.tar.xz"
 SRC_URI[md5sum] = "41d8b985ef69242852b93e95d53e8e28"
@@ -19,9 +24,45 @@ inherit autotools gettext pkgconfig
 
 # Use openssl because libgcrypt drops root privileges
 # if libgcrypt is linked with libcap support
-PACKAGECONFIG ??= "openssl"
+PACKAGECONFIG ??= " \
+    keyring \
+    cryptsetup \
+    veritysetup \
+    cryptsetup-reencrypt \
+    integritysetup \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)} \
+    udev \
+    kernel_crypto \
+    internal-argon2 \
+    blkid \
+    luks-adjust-xts-keysize \
+    openssl \
+"
+
+PACKAGECONFIG[keyring] = "--enable-keyring,--disable-keyring"
+PACKAGECONFIG[fips] = "--enable-fips,--disable-fips"
+PACKAGECONFIG[pwquality] = "--enable-pwquality,--disable-pwquality,libpwquality"
+PACKAGECONFIG[passwdqc] = "--enable-passwdqc,--disable-passwdqc,passwdqc"
+PACKAGECONFIG[cryptsetup] = "--enable-cryptsetup,--disable-cryptsetup"
+PACKAGECONFIG[veritysetup] = "--enable-veritysetup,--disable-veritysetup"
+PACKAGECONFIG[cryptsetup-reencrypt] = "--enable-cryptsetup-reencrypt,--disable-cryptsetup-reencrypt"
+PACKAGECONFIG[integritysetup] = "--enable-integritysetup,--disable-integritysetup"
+PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux"
+PACKAGECONFIG[udev] = "--enable-udev,--disable-udev,udev"
+PACKAGECONFIG[kernel_crypto] = "--enable-kernel_crypto,--disable-kernel_crypto"
+# gcrypt-pkbdf2 requries --with-crypto_backend=gcrypt or the flag isn't
+# recognized.
+PACKAGECONFIG[gcrypt-pbkdf2] = "--enable-gcrypt-pbkdf2"
+PACKAGECONFIG[internal-argon2] = "--enable-internal-argon2,--disable-internal-argon2"
+PACKAGECONFIG[internal-sse-argon2] = "--enable-internal-sse-argon2,--disable-internal-sse-argon2"
+PACKAGECONFIG[blkid] = "--enable-blkid,--disable-blkid,util-linux"
+PACKAGECONFIG[dev-random] = "--enable-dev-random,--disable-dev-random"
+PACKAGECONFIG[luks-adjust-xts-keysize] = "--enable-luks-adjust-xts-keysize,--disable-luks-adjust-xts-keysize"
 PACKAGECONFIG[openssl] = "--with-crypto_backend=openssl,,openssl"
 PACKAGECONFIG[gcrypt] = "--with-crypto_backend=gcrypt,,libgcrypt"
+PACKAGECONFIG[nss] = "--with-crypto_backend=nss,,nss"
+PACKAGECONFIG[kernel] = "--with-crypto_backend=kernel"
+PACKAGECONFIG[nettle] = "--with-crypto_backend=nettle,,nettle"
 
 RRECOMMENDS_${PN} = "kernel-module-aes-generic \
                      kernel-module-dm-crypt \
@@ -32,6 +73,12 @@ RRECOMMENDS_${PN} = "kernel-module-aes-generic \
 "
 
 EXTRA_OECONF = "--enable-static"
+# Building without largefile is not supported by upstream
+EXTRA_OECONF += "--enable-largefile"
+# Requires a static popt library
+EXTRA_OECONF += "--disable-static-cryptsetup"
+# There's no recipe for libargon2 yet
+EXTRA_OECONF += "--disable-libargon2"
 
 FILES_${PN} += "${@bb.utils.contains('DISTRO_FEATURES','systemd','${exec_prefix}/lib/tmpfiles.d/cryptsetup.conf', '', d)}"
 
-- 
2.21.0


