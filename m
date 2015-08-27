Return-Path: <s.mueller-klieser@phytec.de>
Received: from root.phytec.de (mail.phytec.de [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id 00BC460043
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2015 15:57:01 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id 3DFB1A0035A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2015 17:58:59 +0200 (CEST)
Received: from lws-mklieser.phytec.de ([172.16.10.21])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP2 HF590)
	with ESMTP id 2015082717570125-152860 ;
	Thu, 27 Aug 2015 17:57:01 +0200 
From: =?UTF-8?q?Stefan=20M=C3=BCller-Klieser?= <s.mueller-klieser@phytec.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Aug 2015 17:57:01 +0200
Message-Id: <1440691021-5427-1-git-send-email-s.mueller-klieser@phytec.de>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP2
	HF590|December 11, 2014) at 27.08.2015 17:57:01,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP2 HF590|December 11,
	2014) at 27.08.2015 17:57:01
Subject: [PATCH] vorbis-tools: remove unnecessary options
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
X-List-Received-Date: Thu, 27 Aug 2015 15:57:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

This code is not required for yocto 1.9 any more.

Signed-off-by: Stefan M=C3=BCller-Klieser <s.mueller-klieser@phytec.de>
---
- the recipe was pulled too quickly on master for me, sorry that it is a
  patch now instead of a v2

 .../recipes-multimedia/vorbis-tools/vorbis-tools=5F1.4.0.bb      | 10 ----=
------
 1 file changed, 10 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools=
=5F1.4.0.bb b/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools=
=5F1.4.0.bb
index de89d22..a35dee6 100644
--- a/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools=5F1.4.0.=
bb
+++ b/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools=5F1.4.0.=
bb
@@ -17,16 +17,6 @@ SRC=5FURI[sha256sum] =3D "a389395baa43f8e5a796c99daf6239=
7e435a7e73531c9f44d9084055a0
=20
 inherit autotools pkgconfig gettext
=20
-RDEPENDS=5F${PN} =3D "libogg libvorbis libcurl libao"
-
 PACKAGECONFIG ??=3D "flac"
 PACKAGECONFIG[flac] =3D ",--without-flac,flac,libflac"
 PACKAGECONFIG[speex] =3D ",--without-speex,speex,speex"
-
-EXTRA=5FOECONF =3D "--with-ogg-libraries=3D${STAGING=5FLIBDIR} \
-                --with-ogg-includes=3D${STAGING=5FINCDIR} \
-                --with-vorbis-libraries=3D${STAGING=5FLIBDIR} \
-                --with-vorbis-includes=3D${STAGING=5FINCDIR} \
-                --with-curl-libraries=3D${STAGING=5FLIBDIR} \
-                --with-curl-libraries=3D${STAGING=5FLIBDIR} \
-"
--=20
1.9.1


