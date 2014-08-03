Return-Path: <pab@pabigot.com>
X-Greylist: delayed 436 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 03 Aug 2014 20:39:58 UTC
Received: from p3plsmtpa07-01.prod.phx3.secureserver.net
	(p3plsmtpa07-01.prod.phx3.secureserver.net [173.201.192.230])
	by mail.openembedded.org (Postfix) with ESMTP id 410736059A
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  3 Aug 2014 20:39:58 +0000 (UTC)
Received: from llc.pab ([66.41.60.82])
	by p3plsmtpa07-01.prod.phx3.secureserver.net with 
	id aLYh1o0091mTNtu01LYh5x; Sun, 03 Aug 2014 13:32:42 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  3 Aug 2014 15:32:38 -0500
Message-Id: <1407097958-26267-1-git-send-email-pab@pabigot.com>
X-Mailer: git-send-email 1.8.5.5
Cc: "Peter A. Bigot" <pab@pabigot.com>
Subject: [meta-python][PATCH] python-smbus: upgrade to 3.1.1
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
X-List-Received-Date: Sun, 03 Aug 2014 20:39:58 -0000

Also use SECURITY_NO_PIE_CFLAGS as with other python modules to avoid
undefined reference to main during link.

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
 .../python/{python-smbus_3.0.3.bb => python-smbus_3.1.1.bb}       | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-smbus_3.0.3.bb => python-smbus_3.1.1.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python-smbus_3.0.3.bb b/meta-python/recipes-devtools/python/python-smbus_3.1.1.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python-smbus_3.0.3.bb
rename to meta-python/recipes-devtools/python/python-smbus_3.1.1.bb
index 14548a9..455ec1e 100644
--- a/meta-python/recipes-devtools/python/python-smbus_3.0.3.bb
+++ b/meta-python/recipes-devtools/python/python-smbus_3.1.1.bb
@@ -4,13 +4,17 @@ LIC_FILES_CHKSUM = "file://smbusmodule.c;startline=1;endline=17;md5=fa24df321a52
 
 SRC_URI = "http://dl.lm-sensors.org/i2c-tools/releases/i2c-tools-${PV}.tar.bz2 \
 "
-SRC_URI[md5sum] = "511376eed04455cdb277ef19c5f73bb4"
-SRC_URI[sha256sum] = "23b28e474741834e3f1b35b0686528769a13adc92d2ff5603cbda1d6bd5e5629"
+SRC_URI[md5sum] = "0fdbff53ebd0b8d9249256d6c56480b1"
+SRC_URI[sha256sum] = "14d4d7d60d1c12e43f2befe239c682a5c44c27682f153d4b58c1e392d2db1700"
 
 DEPENDS = "i2c-tools"
 
 inherit distutils
 
+# Presence of -pie in smbus.so link command causes undefined reference
+# to main
+SECURITY_CFLAGS = "${SECURITY_NO_PIE_CFLAGS}"
+
 S = "${WORKDIR}/i2c-tools-${PV}/py-smbus/"
 
 do_configure_prepend() {
-- 
1.8.5.5


