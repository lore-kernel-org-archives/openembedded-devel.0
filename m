Received: from hsp-52.hspserver.com ([85.197.80.179])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ml@vdm-design.de>) id 1NrCji-0002kE-J2
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Mar 2010 17:01:52 +0100
Received: from localhost (localhost [127.0.0.1])
	by hsp-52.hspserver.com (Postfix) with ESMTP id 05EC8A2C3CC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Mar 2010 16:58:47 +0100 (CET)
Received: from hsp-52.hspserver.com ([127.0.0.1])
	by localhost (hsp-52.hspserver.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id hhwf5HK-AjLO
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Mar 2010 16:58:46 +0100 (CET)
Received: from tomboy.localnet (pD9E154E8.dip.t-dialin.net [217.225.84.232])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by hsp-52.hspserver.com (Postfix) with ESMTP id 40DCAA2C3AF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Mar 2010 16:58:46 +0100 (CET)
From: Thomas Zimmermann <ml@vdm-design.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Mar 2010 16:58:45 +0100
User-Agent: KMail/1.12.4 (Linux/2.6.33-0.slh.16-sidux-amd64; KDE/4.3.4; x86_64;
	; )
MIME-Version: 1.0
Message-Id: <201003151658.45421.ml@vdm-design.de>
X-SA-Exim-Connect-IP: 85.197.80.179
X-SA-Exim-Mail-From: ml@vdm-design.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: qemu: fails to build without zlib-dev installed on buildhost
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
X-List-Received-Date: Mon, 15 Mar 2010 16:01:52 -0000
X-Groupsio-MsgNum: 17680
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_1klnL3MagD6G4KM"

--Boundary-00=_1klnL3MagD6G4KM
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,
i tried to build an image on a minimal system today, to check which depencies 
are needed to build the image.
First thing that fails is qemu-native. It Fails during do_configure because of 
missing zlib headers.
So i tried to build zlib-native first, but that has changed nothing. After 
looking at the configure script it seems that the check just uses $QEMU_CFLAGS 
which contains only "-I. -I${SRC_DIR}" so adding -I${STAGIUNG_INCDIR_NATIVE} 
to $QEMU_CFLAGS solves that issue.

Please check the following patch, as i've no exprience with 
BBCLASSEXTEND="native" and i don't want to break qemu.

Regards
Thomas

--Boundary-00=_1klnL3MagD6G4KM
Content-Type: text/x-patch;
  charset="UTF-8";
  name="0001-qemu-fix-build-without-zlib-headers-installed-on-bui.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="0001-qemu-fix-build-without-zlib-headers-installed-on-bui.patch"

From e19f00968b9d865088ef3a45a85825c5fc17edc5 Mon Sep 17 00:00:00 2001
From: Thomas Zimmermann <ml@vdm-design.de>
Date: Mon, 15 Mar 2010 16:42:14 +0100
Subject: [PATCH] qemu: fix build without zlib headers installed on buildhos=
t

*qemu-native fails to build without zlib-dev package installed on buildhost
*configure script just adds -I. and -I${SRC_DIR} to QEMU_CFLAGS to build ch=
ecks,
 so it fails to build without headers installed on host
*change DEPENDS from zlib to zlib-native to install zlib headers in staging

Signed-off-by: Thomas Zimmermann <ml@vdm-design.de>
---
 recipes/qemu/qemu_0.12.3.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/qemu/qemu_0.12.3.bb b/recipes/qemu/qemu_0.12.3.bb
index 035b1a5..bc5c251 100644
--- a/recipes/qemu/qemu_0.12.3.bb
+++ b/recipes/qemu/qemu_0.12.3.bb
@@ -1,5 +1,5 @@
 LICENSE =3D "GPL"
-DEPENDS =3D "zlib"
+DEPENDS =3D "zlib-native"
=20
 PR =3D "r0"
=20
@@ -32,5 +32,6 @@ EXTRA_OECONF +=3D "--disable-sdl --disable-strip"
 inherit autotools
=20
 do_configure() {
+	export QEMU_CFLAGS=3D"-I${STAGING_INCDIR_NATIVE} ${QEMU_CFLAGS}"
 	${S}/configure --prefix=3D${prefix} ${EXTRA_OECONF}
 }
--=20
1.7.0


--Boundary-00=_1klnL3MagD6G4KM--
