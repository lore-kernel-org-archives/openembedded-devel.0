Return-Path: <johannes.pointner@br-automation.com>
Received: from mail2.br-automation.com (mail.automotion.info [213.33.116.60])
	by mail.openembedded.org (Postfix) with ESMTP id E2E9671C0F
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Jul 2017 09:32:34 +0000 (UTC)
X-AuditID: c0a80110-e99ff70000000ea4-fa-595e03b022a9
Received: from brsmtp01.br-automation.com (Unknown_Domain [192.168.1.60])
	by mail2.br-automation.com () with SMTP id 0D.07.03748.0B30E595;
	Thu,  6 Jul 2017 11:32:32 +0200 (CEST)
MIME-Version: 1.0
From: Johannes Pointner <johannes.pointner@br-automation.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 6 Jul 2017 11:30:39 +0200
Message-Id: <20170706093039.30435-1-johannes.pointner@br-automation.com>
X-Mailer: git-send-email 2.13.2
X-MIMETrack: Itemize by SMTP Server on BRSMTPINTERN2/InternSMTP(Release
	9.0.1FP5|November 22, 2015) at 06/07/2017 11:33:18,
	Serialize by Router on BRSMTPINTERN2/InternSMTP(Release
	9.0.1FP5|November 22, 2015) at 06/07/2017 11:33:23,
	Serialize complete at 06/07/2017 11:33:23,
	Itemize by SMTP Server on BRSMTP01/Eggelsberg/AT/B&R(Release
	9.0.1FP5|November 22, 2015) at 06.07.2017 11:32:32
X-TNEFEvaluated: 1
X-Disclaimed: 19919
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupgluLIzCtJLcpLzFFi42I5sILRRncjc1ykQfcHJouLh5cyOzB6nNu4
	gjGAMYrLJiU1J7MstUjfLoEro+3QX9aCNu6Kd1uLGxiPc3YxcnJICJhITHv5nbGLkYtDSGAz
	o0RHwz52kASvgKDEyZlPWEBsNgFbiSMTvoLZIgK6Eh8/zGUEsZkFrCXeL1/ACmILC5hL7N/5
	ignEZhFQkbj/7jALxBwPiXuXLrJB1GtLLFv4mhlisbzEu/6nTCCLJQQ6mCXerutjhEgISZxe
	fBaqSFiiZ9185gmMfLOQ3DQLyawFjEyrGMVzEzNzjPSSinQTS0vycxNLMvPz9JLzczcxQsJH
	YAfj7jfahxgFOBiVeHib7sVGCrEmlhVX5h5ilOBgVhLhPfUDKMSbklhZlVqUH19UmpNafIhR
	moNFSZyX2Tk6UkggPbEkNTs1tSC1CCbLxMEp1cCouHfOz9qe3lfv9reva5W+smN/2N3PnBMj
	/LxnXX5ccZPnzmJhw1m7Naz2tG7gqeP4PS3BZ6Ndn2l8w/w3Oy4HnHa9bJv27HMf44VtiWuq
	ua0/SxnLxzFFV787d/xm6yYOLnujfVdtfO6w61562/NwQ4hN7MnpZi+dn7FtCHJqZpNYsz/U
	MXCzEktxRqKhFnNRcSIAr7zByRsCAAA=
Subject: [meta-oe][PATCH] libtinyxml2: upgrade to 5.0.1
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
X-List-Received-Date: Thu, 06 Jul 2017 09:32:36 -0000
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Johannes Pointner <johannes.pointner@br-automation.com>
---
 .../{libtinyxml2=5F4.0.1.bb =3D> libtinyxml2=5F5.0.1.bb}          | 13 +++=
+++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-support/libtinyxml2/{libtinyxml2=5F4.0.1.bb =3D> li=
btinyxml2=5F5.0.1.bb} (63%)

diff --git a/meta-oe/recipes-support/libtinyxml2/libtinyxml2=5F4.0.1.bb b/m=
eta-oe/recipes-support/libtinyxml2/libtinyxml2=5F5.0.1.bb
similarity index 63%
rename from meta-oe/recipes-support/libtinyxml2/libtinyxml2=5F4.0.1.bb
rename to meta-oe/recipes-support/libtinyxml2/libtinyxml2=5F5.0.1.bb
index 3a6659815..edf836814 100644
--- a/meta-oe/recipes-support/libtinyxml2/libtinyxml2=5F4.0.1.bb
+++ b/meta-oe/recipes-support/libtinyxml2/libtinyxml2=5F5.0.1.bb
@@ -6,10 +6,21 @@ LIC=5FFILES=5FCHKSUM =3D "file://tinyxml2.cpp;endline=3D2=
2;md5=3Dc19221dbd8a66ad3090462af4
=20
 SRC=5FURI =3D "git://github.com/leethomason/tinyxml2.git"
=20
-SRCREV =3D "74d44acb176f8510abf28ee0a70961eb26631988"
+SRCREV =3D "37bc3aca429f0164adf68c23444540b4a24b5778"
=20
 S =3D "${WORKDIR}/git"
=20
 inherit cmake
=20
+FILES=5F${PN} =3D " \
+    ${libdir}/lib*${SOLIBS} \
+    ${includedir}/* \
+    "
+
+FILES=5F${PN}-dev =3D " \
+    ${libdir}/lib*${SOLIBSDEV} \
+    ${libdir}/cmake/* \
+    ${libdir}/pkgconfig/* \
+    "
+
 BBCLASSEXTEND =3D "native"
--=20
2.13.2



