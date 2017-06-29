Return-Path: <s.mueller-klieser@phytec.de>
X-Greylist: delayed 555 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 29 Jun 2017 14:20:15 UTC
Received: from root.phytec.de (mail.rapiddevelopmentkit.de [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id 81F9D774DC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Jun 2017 14:20:15 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id 959CAA0023F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Jun 2017 16:12:08 +0200 (CEST)
Received: from lws-mklieser.phytec.de ([172.16.26.141])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
	with ESMTP id 2017062916105922-144267 ;
	Thu, 29 Jun 2017 16:10:59 +0200 
From: =?UTF-8?q?Stefan=20M=C3=BCller-Klieser?= <s.mueller-klieser@phytec.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Jun 2017 16:10:49 +0200
Message-Id: <1498745449-26690-1-git-send-email-s.mueller-klieser@phytec.de>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
	17, 2016) at 29.06.2017 16:10:59,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17,
	2016) at 29.06.2017 16:10:59
X-TNEFEvaluated: 1
Subject: [meta-qt5][pyro][PATCH] qtquickcontrols: fix qa issue installed-vs-shipped
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
X-List-Received-Date: Thu, 29 Jun 2017 14:20:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

QML dialogs ship an icons.ttf which does not get picked up by the
default FILES mask.

Signed-off-by: Stefan M=C3=BCller-Klieser <s.mueller-klieser@phytec.de>
---
 recipes-qt/qt5/qtquickcontrols=5Fgit.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-qt/qt5/qtquickcontrols=5Fgit.bb b/recipes-qt/qt5/qtqui=
ckcontrols=5Fgit.bb
index 69f3d3b..c72ac4f 100644
--- a/recipes-qt/qt5/qtquickcontrols=5Fgit.bb
+++ b/recipes-qt/qt5/qtquickcontrols=5Fgit.bb
@@ -22,3 +22,5 @@ SRC=5FURI +=3D " \
 "
=20
 SRCREV =3D "201c86391c7ff78d570fdec6e0c0b71eb1e9aae4"
+
+FILES=5F${PN}-qmlplugins +=3D "${OE=5FQMAKE=5FPATH=5FQML}/*/*/*/*.ttf"
--=20
1.9.1


