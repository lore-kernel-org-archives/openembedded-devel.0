Received: from smtp3-g21.free.fr ([212.27.42.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1RY2Lw-0003wN-Tr
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Dec 2011 22:15:13 +0100
Received: from localhost.localdomain (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 647B6A6604;
	Tue,  6 Dec 2011 22:07:36 +0100 (CET)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Dec 2011 22:07:30 +0100
Message-Id: <1323205650-14903-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.6.4
MIME-Version: 1.0
Cc: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [meta-oe] xf86-input-tslib: fix checksum error
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Dec 2011 21:15:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

remove name=3Darchive in SRC_URI in order to use the right checksum
(else, we would need SRC_URI[archive.md5sum])

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
---
 .../xorg-driver/xf86-input-tslib_0.0.6.bb          |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib_0.0.6.=
bb b/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib_0.0.6.bb
index de0eb6f..d00fb4e 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib_0.0.6.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib_0.0.6.bb
@@ -10,13 +10,14 @@ LIC_FILES_CHKSUM =3D "file://src/tslib.c;endline=3D28=
;md5=3Dbd62eaef222dcf5cd59e490a12
=20
 PR =3D "${INC_PR}.1"
=20
-SRC_URI =3D "http://www.pengutronix.de/software/xf86-input-tslib/downloa=
d/xf86-input-tslib-${PV}.tar.bz2;name=3Darchive \
+SRC_URI =3D "http://www.pengutronix.de/software/xf86-input-tslib/downloa=
d/xf86-input-tslib-${PV}.tar.bz2 \
            file://double-free-crash.patch \
            file://10-x11-input-tslib.fdi \
            file://xserver-174-XGetPointerControl.patch \
            file://99-xf86-input-tslib.rules \
            file://xf86-input-tslib-port-ABI-12-r48.patch \
 "
+
 SRC_URI[md5sum] =3D "b7a4d2f11637ee3fcf432e044b1d017f"
 SRC_URI[sha256sum] =3D "5f46fdef095a6e44a69e0f0b57c7d665224b26d990d00661=
1236d8332e85b105"
=20
--=20
1.7.6.4



