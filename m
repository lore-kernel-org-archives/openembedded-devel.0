Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7E19A7C5B5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jan 2019 18:24:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x0SIOFWA028032
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jan 2019 10:24:25 -0800
Received: from fidler.wrs.com (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.435.0;
	Mon, 28 Jan 2019 10:24:04 -0800
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 28 Jan 2019 13:24:01 -0500
Message-ID: <20190128182401.8932-2-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20190128182401.8932-1-Randy.MacLeod@windriver.com>
References: <20190128182401.8932-1-Randy.MacLeod@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] libvncserver: make PACKAGECONFIG flags explicit
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
X-List-Received-Date: Mon, 28 Jan 2019 18:24:34 -0000
Content-Type: text/plain

Set all the PACKAGECONFIG enable/disable flags explicitly
rather than rely on assumed defaults. This also makes it
clear what the intended configuration is in log files.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../libvncserver/libvncserver_git.bb           | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb b/meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb
index 627b03109..88a859ba2 100644
--- a/meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb
+++ b/meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb
@@ -15,15 +15,15 @@ PACKAGECONFIG ??= " \
     sdl \
     zlib \
 "
-PACKAGECONFIG[gcrypt] = ",,libgcrypt,libgcrypt"
-PACKAGECONFIG[gnutls] = ",,gnutls"
-PACKAGECONFIG[jpeg] = ",-DWITH_JPEG=OFF,jpeg"
-PACKAGECONFIG[lzo] = ",-DWITH_LZO=OFF,lzo"
-PACKAGECONFIG[openssl] = ",-DWITH_OPENSSL=OFF,openssl"
-PACKAGECONFIG[png] = ",-DWITH_PNG=OFF,libpng,libpng"
-PACKAGECONFIG[systemd] = ",,systemd"
-PACKAGECONFIG[sdl] = ",,libsdl2"
-PACKAGECONFIG[zlib] = ",,zlib"
+PACKAGECONFIG[gcrypt] = "-DWITH_GCRYPT=ON,-DWITH_GCRYPT=OFF,libgcrypt,libgcrypt"
+PACKAGECONFIG[gnutls] = "-DWITH_GNUTLS=ON,-DWITH_GNUTLS=OFF,gnutls"
+PACKAGECONFIG[jpeg] = "-DWITH_JPEG=ON,-DWITH_JPEG=OFF,jpeg"
+PACKAGECONFIG[lzo] = "-DWITH_LZO=ON,-DWITH_LZO=OFF,lzo"
+PACKAGECONFIG[openssl] = "-DWITH_OPENSSL=ON,-DWITH_OPENSSL=OFF,openssl"
+PACKAGECONFIG[png] = "-DWITH_PNG=ON,-DWITH_PNG=OFF,libpng,libpng"
+PACKAGECONFIG[systemd] = "-DWITH_SYSTEMD=ON,-DWITH_SYSTEMD=OFF,systemd"
+PACKAGECONFIG[sdl] = "-DWITH_SDL=ON,-DWITH_SDL=OFF,libsdl2"
+PACKAGECONFIG[zlib] = "-DWITH_ZLIB=ON,-DWITH_ZLIB=OFF,zlib"
 
 inherit cmake
 
-- 
2.17.0


