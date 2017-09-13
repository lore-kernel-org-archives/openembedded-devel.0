Return-Path: <fabien.lahoudere@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id 9E1D27865F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Sep 2017 20:05:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: aragua) with ESMTPSA id A4B3F2613C4
From: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Sep 2017 22:05:37 +0200
Message-Id: <d57cfa967fda4643dcbafea12b51d4988517cce4.1505333001.git.fabien.lahoudere@collabora.co.uk>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1505333001.git.fabien.lahoudere@collabora.co.uk>
References: <cover.1505333001.git.fabien.lahoudere@collabora.co.uk>
In-Reply-To: <cover.1505333001.git.fabien.lahoudere@collabora.co.uk>
References: <cover.1505333001.git.fabien.lahoudere@collabora.co.uk>
Subject: [meta-multimedia][PATCH v4 2/2] gerbera: clean recipe
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
X-List-Received-Date: Wed, 13 Sep 2017 20:05:49 -0000

Clean the recipe and change the name of libupnp to libupnp1.8.

Signed-off-by: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
---
 meta-multimedia/recipes-multimedia/gerbera/gerbera_git.bb | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/gerbera/gerbera_git.bb b/meta-multimedia/recipes-multimedia/gerbera/gerbera_git.bb
index 2bbedc0d1..c618d4a0c 100644
--- a/meta-multimedia/recipes-multimedia/gerbera/gerbera_git.bb
+++ b/meta-multimedia/recipes-multimedia/gerbera/gerbera_git.bb
@@ -6,22 +6,22 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=25cdec9afe3f1f26212ead6bd2f7fac8"
 SRC_URI = "git://github.com/v00d00/gerbera.git;protocol=https \
 	   file://gerbera.service "
 
-
-# Modify these as desired
 PV = "1.0+git${SRCPV}"
 SRCREV = "4435b165d121195aefd67d0287f7f9349e181d45"
 
 S = "${WORKDIR}/git"
 
-DEPENDS = "expat zlib curl libupnp e2fsprogs sqlite3 taglib "
-RDEPENDS_${PN} = "expat zlib curl libupnp e2fsprogs taglib "
+DEPENDS = "expat zlib curl libupnp1.8 e2fsprogs sqlite3 "
+#RDEPENDS_${PN} = "expat zlib curl libupnp e2fsprogs "
 
 SYSTEMD_SERVICE_${PN} = "gerbera.service"
-SYSTEMD_AUTO_ENABLE = "enable"
 
 inherit cmake systemd
 
-EXTRA_OECMAKE = "-DWITH_JS=FALSE -DWITH_TAGLIB=FALSE -DWITH_MAGIC=FALSE -DWITH_EXIF=FALSE -DLIBUUID_INCLUDE_DIRS=${WORKDIR}/recipe-sysroot/usr/include -DLIBUUID_LIBRARIES=-luuid"
+PACKAGECONFIG = ""
+PACKAGECONFIG[taglib] = "-DWITH_TAGLIB=TRUE,-DWITH_TAGLIB=FALSE,taglib"
+
+EXTRA_OECMAKE = "-DWITH_JS=FALSE -DWITH_MAGIC=FALSE -DWITH_EXIF=FALSE -DLIBUUID_INCLUDE_DIRS=${STAGING_INCDIR} -DLIBUUID_LIBRARIES=-luuid"
 
 do_install_append() {
 	install -d ${D}/root/.config/
-- 
2.11.0


