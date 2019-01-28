Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 65C387C5A6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jan 2019 18:24:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x0SIO31B000592
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jan 2019 10:24:04 -0800 (PST)
Received: from fidler.wrs.com (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.435.0;
	Mon, 28 Jan 2019 10:24:03 -0800
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 28 Jan 2019 13:24:00 -0500
Message-ID: <20190128182401.8932-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
Subject: [PATCH 1/2] libvncserver: Update to latest commit post 0.9.12
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
X-List-Received-Date: Mon, 28 Jan 2019 18:24:03 -0000
Content-Type: text/plain

Update to latest git HEAD rather than just 0.9.12 since
that includes a fix for CVE-2018-15127.

Support for lzo in addition to a bundled minilzo was added
upstream so add a PACKAGECONFIG[lzo] and add it to the default config.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb b/meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb
index b493f7f01..627b03109 100644
--- a/meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb
+++ b/meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb
@@ -9,6 +9,7 @@ PACKAGECONFIG ??= " \
     gcrypt \
     gnutls \
     jpeg \
+    lzo \
     png \
     ${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','',d)} \
     sdl \
@@ -17,6 +18,7 @@ PACKAGECONFIG ??= " \
 PACKAGECONFIG[gcrypt] = ",,libgcrypt,libgcrypt"
 PACKAGECONFIG[gnutls] = ",,gnutls"
 PACKAGECONFIG[jpeg] = ",-DWITH_JPEG=OFF,jpeg"
+PACKAGECONFIG[lzo] = ",-DWITH_LZO=OFF,lzo"
 PACKAGECONFIG[openssl] = ",-DWITH_OPENSSL=OFF,openssl"
 PACKAGECONFIG[png] = ",-DWITH_PNG=OFF,libpng,libpng"
 PACKAGECONFIG[systemd] = ",,systemd"
@@ -26,6 +28,7 @@ PACKAGECONFIG[zlib] = ",,zlib"
 inherit cmake
 
 SRC_URI = "git://github.com/LibVNC/libvncserver"
-SRCREV = "f997b5a75fa171d79c5e568b7157fba83c8d8355"
+SRCREV = "c0a23857a5c42b45b6d22ccf7218becd1fa69402"
+
 
 S = "${WORKDIR}/git"
-- 
2.17.0


