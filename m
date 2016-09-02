Return-Path: <s.mueller-klieser@phytec.de>
Received: from root.phytec.de (mail.phytec.de [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id 5C30A76312
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Sep 2016 14:58:38 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id C904EA002F6
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Sep 2016 16:58:49 +0200 (CEST)
Received: from lws-mklieser.phytec.de ([172.16.10.21])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP5 HF413)
	with ESMTP id 2016090216583811-142824 ;
	Fri, 2 Sep 2016 16:58:38 +0200 
From: =?UTF-8?q?Stefan=20M=C3=BCller-Klieser?= <s.mueller-klieser@phytec.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 2 Sep 2016 16:58:37 +0200
Message-Id: <1472828317-29130-1-git-send-email-s.mueller-klieser@phytec.de>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP5
	HF413|March 21, 2016) at 02.09.2016 16:58:38,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP5 HF413|March 21,
	2016) at 02.09.2016 16:58:38
X-TNEFEvaluated: 1
Subject: [meta-qt5][PATCH] qt5-opengles2-test: Add recipe
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
X-List-Received-Date: Fri, 02 Sep 2016 14:58:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

This brings back the qt5-opengles2-test. I cloned the vanished
repository, as it is a handy and small test application. We use it for
our embedded boards.

Signed-off-by: Stefan M=C3=BCller-Klieser <s.mueller-klieser@phytec.de>
---
 recipes-qt/examples/qt5-opengles2-test=5Fgit.bb | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 recipes-qt/examples/qt5-opengles2-test=5Fgit.bb

diff --git a/recipes-qt/examples/qt5-opengles2-test=5Fgit.bb b/recipes-qt/e=
xamples/qt5-opengles2-test=5Fgit.bb
new file mode 100644
index 0000000..5da25dc
--- /dev/null
+++ b/recipes-qt/examples/qt5-opengles2-test=5Fgit.bb
@@ -0,0 +1,19 @@
+SUMMARY =3D "Qt5 OpenGL ES 2.0 Test Application"
+DESCRIPTION =3D "This application is used to test OpenGL ES 2.0 rendering \
+in a simple QWindow, plus multi-touch input, window orientation, window \
+focus handling and some other game-related features."
+LICENSE =3D "MIT"
+LIC=5FFILES=5FCHKSUM =3D "file://${WORKDIR}/git/main.cpp;beginline=3D1;end=
line=3D26;md5=3D93b83ece006c9e76b9fca80c3aecb169"
+
+PV =3D "1.0.4+gitr${SRCPV}"
+
+DEPENDS =3D "qtbase qtsensors"
+
+# Depends on gles2 enabled and that's not default configuration
+EXCLUDE=5FFROM=5FWORLD =3D "1"
+
+SRC=5FURI =3D "git://github.com/smk-embedded/qt5-opengles2-test.git"
+SRCREV =3D "938390507054ed1258345f70ed55770d2fe56176"
+S =3D "${WORKDIR}/git"
+
+inherit qmake5
--=20
1.9.1


