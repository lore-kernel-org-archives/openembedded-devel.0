Return-Path: <s.mueller-klieser@phytec.de>
X-Greylist: delayed 432 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 01 Dec 2017 10:55:52 UTC
Received: from root.phytec.de (mail.phycore.de [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id A06FE77E44
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Dec 2017 10:55:52 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id 7EDF1A00416
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Dec 2017 11:50:47 +0100 (CET)
Received: from augenblix.phytec.de ([172.16.0.56])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
	with ESMTP id 2017120111484083-33123 ;
	Fri, 1 Dec 2017 11:48:40 +0100 
From: =?UTF-8?q?Stefan=20M=C3=BCller-Klieser?= <s.mueller-klieser@phytec.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 1 Dec 2017 11:48:41 +0100
Message-Id: <1512125321-16818-1-git-send-email-s.mueller-klieser@phytec.de>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
	17, 2016) at 01.12.2017 11:48:41,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17,
	2016) at 01.12.2017 11:48:41
X-TNEFEvaluated: 1
Subject: [meta-oe][PATCH] dfu-utils-native: fix do_deploy sstate handling
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
X-List-Received-Date: Fri, 01 Dec 2017 10:55:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

We need to install to the sstate input dir and not the output dir, so
sstate handling will work correctly.

Signed-off-by: Stefan M=C3=BCller-Klieser <s.mueller-klieser@phytec.de>
---
 meta-oe/recipes-support/dfu-util/dfu-util-native=5F0.9.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/dfu-util/dfu-util-native=5F0.9.bb b/me=
ta-oe/recipes-support/dfu-util/dfu-util-native=5F0.9.bb
index 7a7a662..aeca23b 100644
--- a/meta-oe/recipes-support/dfu-util/dfu-util-native=5F0.9.bb
+++ b/meta-oe/recipes-support/dfu-util/dfu-util-native=5F0.9.bb
@@ -8,9 +8,8 @@ SRC=5FURI +=3D "file://0001-Revert-Makefile.am-Drop-static-=
dfu-util.patch"
=20
 do=5Fdeploy[sstate-outputdirs] =3D "${DEPLOY=5FDIR=5FTOOLS}"
 do=5Fdeploy() {
-    install -d ${DEPLOY=5FDIR=5FTOOLS}
-    install -m 0755 src/dfu-util=5Fstatic ${DEPLOY=5FDIR=5FTOOLS}/dfu-util=
-${PV}
-    rm -f ${DEPLOY=5FDIR=5FTOOLS}/dfu-util
-    ln -sf ./dfu-util-${PV} ${DEPLOY=5FDIR=5FTOOLS}/dfu-util
+    install -m 0755 src/dfu-util=5Fstatic ${DEPLOYDIR}/dfu-util-${PV}
+    rm -f ${DEPLOYDIR}/dfu-util
+    ln -sf ./dfu-util-${PV} ${DEPLOYDIR}/dfu-util
 }
 addtask deploy before do=5Fpackage after do=5Finstall
--=20
2.7.4


