Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa07-03.prod.phx3.secureserver.net
	(p3plsmtpa07-03.prod.phx3.secureserver.net [173.201.192.232])
	by mail.openembedded.org (Postfix) with ESMTP id 0FCFE72373
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Nov 2014 20:08:00 +0000 (UTC)
Received: from llc.pab ([75.72.225.8])
	by p3plsmtpa07-03.prod.phx3.secureserver.net with 
	id LL7z1p00Y0BVjqb01L81rP; Wed, 26 Nov 2014 13:08:01 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 Nov 2014 14:07:53 -0600
Message-Id: <84be7aa67c947491a0a817fcbac23bf662b06743.1417031714.git.pab@pabigot.com>
X-Mailer: git-send-email 1.8.5.5
In-Reply-To: <cover.1417031714.git.pab@pabigot.com>
References: <cover.1417031714.git.pab@pabigot.com>
In-Reply-To: <cover.1417031714.git.pab@pabigot.com>
References: <cover.1417031714.git.pab@pabigot.com>
Subject: [meta-oe][RFC v2 2/3] gpsd: select distro preference for bluez provider
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
X-List-Received-Date: Wed, 26 Nov 2014 20:08:04 -0000

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
 meta-oe/recipes-navigation/gpsd/gpsd_3.10.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.10.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.10.bb
index 6d3adc1..93cf1ae 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.10.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.10.bb
@@ -20,7 +20,7 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/${BPN}/${BP}.tar.gz \
 SRC_URI[md5sum] = "fc5b03aae38b9b5b6880b31924d0ace3"
 SRC_URI[sha256sum] = "706fc2c1cf3dfbf87c941f543381bccc9c4dc9f8240eec407dcbf2f70b854320"
 
-inherit scons update-rc.d python-dir pythonnative systemd
+inherit scons update-rc.d python-dir pythonnative systemd bluetooth
 
 INITSCRIPT_NAME = "gpsd"
 INITSCRIPT_PARAMS = "defaults 35"
@@ -30,8 +30,8 @@ SYSTEMD_OESCONS = "${@base_contains('DISTRO_FEATURES', 'systemd', 'true', 'false
 export STAGING_INCDIR
 export STAGING_LIBDIR
 
-PACKAGECONFIG ??= "bluez"
-PACKAGECONFIG[bluez] = "bluez='true',bluez='false',bluez4"
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'bluetooth', '${BLUEZ}', '', d)}"
+PACKAGECONFIG[bluez4] = "bluez='true',bluez='false',bluez4"
 
 EXTRA_OESCONS = " \
     sysroot=${STAGING_DIR_TARGET} \
-- 
1.8.5.5


