Return-Path: <robert.joslyn@redrectangle.org>
X-Greylist: delayed 690 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 03 Jul 2019 04:51:50 UTC
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
	[217.70.183.198])
	by mail.openembedded.org (Postfix) with ESMTP id A739E7D012
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Jul 2019 04:51:50 +0000 (UTC)
X-Originating-IP: 50.37.95.192
Received: from xps13.localdomain (50-37-95-192.mscw.id.frontiernet.net
	[50.37.95.192])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id A8931C0003;
	Wed,  3 Jul 2019 04:51:48 +0000 (UTC)
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  2 Jul 2019 21:51:18 -0700
Message-Id: <20190703045118.13041-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] cryptsetup: Don't enable udev for native build
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
X-List-Received-Date: Wed, 03 Jul 2019 04:51:51 -0000
Content-Transfer-Encoding: 8bit

When building cryptsetup-native, don't enable udev support since there
is not a udev-native recipe.

When udev is enabled, change the dependency from a DEPENDS to an
RDEPENDS. The --enable-udev option adds a runtime check for udev before
using udev features of libdevmapper. Because of this, udev isn't needed
at build time, just runtime.

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.1.0.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.1.0.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.1.0.bb
index 51cecf5d2..a500b1898 100644
--- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.1.0.bb
+++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.1.0.bb
@@ -31,13 +31,15 @@ PACKAGECONFIG ??= " \
     cryptsetup-reencrypt \
     integritysetup \
     ${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)} \
-    udev \
     kernel_crypto \
     internal-argon2 \
     blkid \
     luks-adjust-xts-keysize \
     openssl \
 "
+PACKAGECONFIG_append_class-target = " \
+    udev \
+"
 
 PACKAGECONFIG[keyring] = "--enable-keyring,--disable-keyring"
 PACKAGECONFIG[fips] = "--enable-fips,--disable-fips"
@@ -48,7 +50,7 @@ PACKAGECONFIG[veritysetup] = "--enable-veritysetup,--disable-veritysetup"
 PACKAGECONFIG[cryptsetup-reencrypt] = "--enable-cryptsetup-reencrypt,--disable-cryptsetup-reencrypt"
 PACKAGECONFIG[integritysetup] = "--enable-integritysetup,--disable-integritysetup"
 PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux"
-PACKAGECONFIG[udev] = "--enable-udev,--disable-udev,udev"
+PACKAGECONFIG[udev] = "--enable-udev,--disable-udev,,udev"
 PACKAGECONFIG[kernel_crypto] = "--enable-kernel_crypto,--disable-kernel_crypto"
 # gcrypt-pkbdf2 requries --with-crypto_backend=gcrypt or the flag isn't
 # recognized.
-- 
2.21.0


