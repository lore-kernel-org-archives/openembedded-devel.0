Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1573F6BD1C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jan 2019 03:58:19 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x0O3w0SR028902
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jan 2019 19:58:10 -0800
Received: from fidler.wrs.com (172.25.44.4) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 23 Jan 2019 19:57:37 -0800
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 23 Jan 2019 22:57:36 -0500
Message-ID: <20190124035736.14187-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
Subject: [PATCH] libvncserver: Update to latest commit post 0.9.12
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
X-List-Received-Date: Thu, 24 Jan 2019 03:58:20 -0000
Content-Type: text/plain

Update to latest git HEAD which includes a fix for CVE-2018-15127.

Support for lzo in addition to a bundled minilzo was added so
add a PACKAGECONFIG[lzo] and add it to the default config.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb b/meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb
index 25917756f..b789055bb 100644
--- a/meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb
+++ b/meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb
@@ -5,10 +5,11 @@ PRIORITY = "optional"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=361b6b837cad26c6900a926b62aada5f"
 
-PACKAGECONFIG ??= "gcrypt gnutls jpeg png ${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','',d)} sdl zlib"
+PACKAGECONFIG ??= "gcrypt gnutls jpeg png lzo ${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','',d)} sdl zlib"
 PACKAGECONFIG[gcrypt] = ",,libgcrypt,libgcrypt"
 PACKAGECONFIG[gnutls] = ",,gnutls"
 PACKAGECONFIG[jpeg] = ",-DWITH_JPEG=OFF,jpeg"
+PACKAGECONFIG[lzo] = ",,lzo"
 PACKAGECONFIG[openssl] = ",,openssl"
 PACKAGECONFIG[png] = ",-DWITH_PNG=OFF,libpng,libpng"
 PACKAGECONFIG[systemd] = ",,systemd"
@@ -18,6 +19,6 @@ PACKAGECONFIG[zlib] = ",,zlib"
 inherit cmake
 
 SRC_URI = "git://github.com/LibVNC/libvncserver"
-SRCREV = "f997b5a75fa171d79c5e568b7157fba83c8d8355"
+SRCREV = "c0a23857a5c42b45b6d22ccf7218becd1fa69402"
 
 S = "${WORKDIR}/git"
-- 
2.17.0


