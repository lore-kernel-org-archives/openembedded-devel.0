Return-Path: <s.mueller-klieser@phytec.de>
X-Greylist: delayed 437 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 16 Jan 2018 13:54:17 UTC
Received: from root.phytec.de (mail.phycore.de [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id 2F31960777
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Jan 2018 13:54:17 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id 3550DA00324
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Jan 2018 14:47:07 +0100 (CET)
Received: from augenblix.phytec.de ([172.16.0.56])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
	with ESMTP id 2018011614470063-63760 ;
	Tue, 16 Jan 2018 14:47:00 +0100 
From: =?UTF-8?q?Stefan=20M=C3=BCller-Klieser?= <s.mueller-klieser@phytec.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Jan 2018 14:46:55 +0100
Message-Id: <1516110415-2058-1-git-send-email-s.mueller-klieser@phytec.de>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
	17, 2016) at 16.01.2018 14:47:00,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17,
	2016) at 16.01.2018 14:47:00
X-TNEFEvaluated: 1
Subject: [meta-qt5][PATCH] qtbase: fix pcre PACKAGECONFIG
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
X-List-Received-Date: Tue, 16 Jan 2018 13:54:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Qt switched to pcre2 for 5.9. The configure switch has not been renamed.
We just need to update the build dependency.
This requires the poky commit:
0204af2 libpcre2: add packages for 16-bit and 32-bit code unit support

Signed-off-by: Stefan M=C3=BCller-Klieser <s.mueller-klieser@phytec.de>
---
 recipes-qt/qt5/qtbase=5Fgit.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtbase=5Fgit.bb b/recipes-qt/qt5/qtbase=5Fgit.bb
index 2fff961..c1557d8 100644
--- a/recipes-qt/qt5/qtbase=5Fgit.bb
+++ b/recipes-qt/qt5/qtbase=5Fgit.bb
@@ -109,7 +109,7 @@ PACKAGECONFIG[libpng] =3D "-system-libpng,-no-libpng,li=
bpng"
 PACKAGECONFIG[gif] =3D "-gif,-no-gif"
 PACKAGECONFIG[ico] =3D "-ico,-no-ico"
 PACKAGECONFIG[zlib] =3D "-system-zlib,-qt-zlib,zlib"
-PACKAGECONFIG[pcre] =3D "-system-pcre,-qt-pcre,pcre"
+PACKAGECONFIG[pcre] =3D "-system-pcre,-qt-pcre,pcre2"
 PACKAGECONFIG[eglfs] =3D "-eglfs,-no-eglfs,drm"
 PACKAGECONFIG[gl] =3D "-opengl desktop,,virtual/libgl"
 PACKAGECONFIG[gles2] =3D "-opengl es2,,virtual/libgles2 virtual/egl"
--=20
2.7.4


