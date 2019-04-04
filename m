Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
	[173.167.31.197])
	by mail.openembedded.org (Postfix) with ESMTP id 4A3BB79CB3
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Apr 2019 20:26:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Apr 2019 16:26:59 -0400
Message-Id: <20190404202659.25953-1-bradleyb@fuzziesquirrel.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH] libvncserver: enable split client/server packages
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
X-List-Received-Date: Thu, 04 Apr 2019 20:26:49 -0000
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb b/=
meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb
index 88a859ba2f..6a806ffbaf 100644
--- a/meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb
+++ b/meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb
@@ -25,6 +25,9 @@ PACKAGECONFIG[systemd] =3D "-DWITH_SYSTEMD=3DON,-DWITH_=
SYSTEMD=3DOFF,systemd"
 PACKAGECONFIG[sdl] =3D "-DWITH_SDL=3DON,-DWITH_SDL=3DOFF,libsdl2"
 PACKAGECONFIG[zlib] =3D "-DWITH_ZLIB=3DON,-DWITH_ZLIB=3DOFF,zlib"
=20
+PACKAGE_BEFORE_PN =3D "libvncclient"
+FILES_libvncclient =3D "${libdir}/libvncclient.*"
+
 inherit cmake
=20
 SRC_URI =3D "git://github.com/LibVNC/libvncserver"
--=20
2.20.1

