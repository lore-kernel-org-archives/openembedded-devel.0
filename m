Return-Path: <s.mueller-klieser@phytec.de>
X-Greylist: delayed 445 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 13 Aug 2015 10:26:36 UTC
Received: from root.phytec.de (mail.rapiddevelopmentkit.de [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id 139B573D64
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Aug 2015 10:26:36 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id 705E7A00389
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Aug 2015 12:21:04 +0200 (CEST)
Received: from lws-mklieser.phytec.de ([172.16.10.21])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP2 HF590)
	with ESMTP id 2015081312191157-140581 ;
	Thu, 13 Aug 2015 12:19:11 +0200 
From: =?UTF-8?q?Stefan=20M=C3=BCller-Klieser?= <s.mueller-klieser@phytec.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Aug 2015 12:19:14 +0200
Message-Id: <1439461154-22584-1-git-send-email-s.mueller-klieser@phytec.de>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP2
	HF590|December 11, 2014) at 13.08.2015 12:19:11,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP2 HF590|December 11,
	2014) at 13.08.2015 12:19:11
Subject: [meta-multimedia][PATCH] vorbis-tools: add new recipe
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
X-List-Received-Date: Thu, 13 Aug 2015 10:26:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Vorbis tools provide command line editing and playback tools for the
patent free audio codec. Use cases in embedded are audio tests and
performance benchmarks.

Signed-off-by: Stefan M=C3=BCller-Klieser <s.mueller-klieser@phytec.de>
---
 .../vorbis-tools/vorbis-tools=5F1.4.0.bb             | 32 ++++++++++++++++=
++++++
 1 file changed, 32 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-=
tools=5F1.4.0.bb

diff --git a/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools=
=5F1.4.0.bb b/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools=
=5F1.4.0.bb
new file mode 100644
index 0000000..de89d22
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools=5F1.4.0.=
bb
@@ -0,0 +1,32 @@
+SUMMARY =3D "Vorbis Tools"
+DESCRIPTION =3D "Ogg Vorbis is a high-quality lossy audio codec \
+that is free of intellectual property restrictions. vorbis-tools \
+include some command line applications to use the libraries."
+HOMEPAGE =3D "http://www.vorbis.com/"
+BUGTRACKER =3D "https://trac.xiph.org"
+SECTION =3D "multimedia"
+LICENSE =3D "GPLv2"
+LIC=5FFILES=5FCHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079b=
ae19f"
+
+DEPENDS =3D "libogg libvorbis curl libao"
+
+SRC=5FURI =3D "http://downloads.xiph.org/releases/vorbis/${BP}.tar.gz"
+
+SRC=5FURI[md5sum] =3D "567e0fb8d321b2cd7124f8208b8b90e6"
+SRC=5FURI[sha256sum] =3D "a389395baa43f8e5a796c99daf62397e435a7e73531c9f44=
d9084055a05d22bc"
+
+inherit autotools pkgconfig gettext
+
+RDEPENDS=5F${PN} =3D "libogg libvorbis libcurl libao"
+
+PACKAGECONFIG ??=3D "flac"
+PACKAGECONFIG[flac] =3D ",--without-flac,flac,libflac"
+PACKAGECONFIG[speex] =3D ",--without-speex,speex,speex"
+
+EXTRA=5FOECONF =3D "--with-ogg-libraries=3D${STAGING=5FLIBDIR} \
+                --with-ogg-includes=3D${STAGING=5FINCDIR} \
+                --with-vorbis-libraries=3D${STAGING=5FLIBDIR} \
+                --with-vorbis-includes=3D${STAGING=5FINCDIR} \
+                --with-curl-libraries=3D${STAGING=5FLIBDIR} \
+                --with-curl-libraries=3D${STAGING=5FLIBDIR} \
+"
--=20
1.9.1


