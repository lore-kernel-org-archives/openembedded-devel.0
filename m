Return-Path: <johannes.pointner@br-automation.com>
Received: from mail2.br-automation.com (mail.automotion.info [213.33.116.60])
	by mail.openembedded.org (Postfix) with ESMTP id 1546777EA6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jul 2017 09:19:38 +0000 (UTC)
X-AuditID: c0a80110-eb1ff70000000ea4-08-59649828147c
Received: from brsmtp01.br-automation.com (Unknown_Domain [192.168.1.60])
	by mail2.br-automation.com () with SMTP id AB.D7.03748.82894695;
	Tue, 11 Jul 2017 11:19:36 +0200 (CEST)
MIME-Version: 1.0
From: Johannes Pointner <johannes.pointner@br-automation.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Jul 2017 11:19:11 +0200
Message-Id: <20170711091911.27151-1-johannes.pointner@br-automation.com>
X-Mailer: git-send-email 2.13.2
X-MIMETrack: Itemize by SMTP Server on BRSMTPINTERN2/InternSMTP(Release
	9.0.1FP5|November 22, 2015) at 11/07/2017 11:20:25,
	Serialize by Router on BRSMTPINTERN2/InternSMTP(Release
	9.0.1FP5|November 22, 2015) at 11/07/2017 11:20:29,
	Serialize complete at 11/07/2017 11:20:29,
	Itemize by SMTP Server on BRSMTP01/Eggelsberg/AT/B&R(Release
	9.0.1FP5|November 22, 2015) at 11.07.2017 11:19:35
X-TNEFEvaluated: 1
X-Disclaimed: 14067
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkluLIzCtJLcpLzFFi42I5sILRRldjRkqkwbRPOhYXDy9ldmD0OLdx
	BWMAYxSXTUpqTmZZapG+XQJXxv2Np9gLfnNWrPr/g7mB8TVHFyMnh4SAicTtizuZuhi5OIQE
	NjNKzPt2jR0kwSsgKHFy5hMWEJtNwFbiyISvYLaIgK7Exw9zGUFsZgFriffLF7CC2MICVhLT
	HmwFq2ERUJVoWrGDFWKOh8SznROh6rUlli18zQyxWF7iXf9TsMUSAh3MEvP2/GGCSAhJnF58
	FqpIWOLakwmMExj5ZiG5aRaSWQsYmVYxiucmZuYY6SUV6SaWluTnJpZk5ufpJefnbmKEBJDA
	Dsbdb7QPMQpwMCrx8D6wTI4UYk0sK67MPcQowcGsJMK7sjklUog3JbGyKrUoP76oNCe1+BCj
	NAeLkjhvnHh8pJBAemJJanZqakFqEUyWiYNTqoGRMWNWkULo3k1hs3X+fl+rWJ78mqlmCX/q
	5Z3rN6Vunh39/MKhprKZlUuPf5xe+aThwbqFX3xsdn5q4zM1anxbxVl9mvXjKsnjr26c6ZQM
	vrF7zb7bsdc/JF+10nMQW/PKXTHMkLniju+SRW4RCnE9IVlO9zVEdBYrzlGtEldmPHYwKkBl
	6fWzSizFGYmGWsxFxYkAC6eBPBwCAAA=
Subject: [meta-oe][PATCH v2] libtinyxml2: upgrade to 5.0.1
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
X-List-Received-Date: Tue, 11 Jul 2017 09:19:40 -0000
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Johannes Pointner <johannes.pointner@br-automation.com>
---
v2:
 - fixed packaging rules
---
 .../libtinyxml2/{libtinyxml2=5F4.0.1.bb =3D> libtinyxml2=5F5.0.1.bb}      =
  | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-support/libtinyxml2/{libtinyxml2=5F4.0.1.bb =3D> li=
btinyxml2=5F5.0.1.bb} (81%)

diff --git a/meta-oe/recipes-support/libtinyxml2/libtinyxml2=5F4.0.1.bb b/m=
eta-oe/recipes-support/libtinyxml2/libtinyxml2=5F5.0.1.bb
similarity index 81%
rename from meta-oe/recipes-support/libtinyxml2/libtinyxml2=5F4.0.1.bb
rename to meta-oe/recipes-support/libtinyxml2/libtinyxml2=5F5.0.1.bb
index 3a6659815..8b5ab44fd 100644
--- a/meta-oe/recipes-support/libtinyxml2/libtinyxml2=5F4.0.1.bb
+++ b/meta-oe/recipes-support/libtinyxml2/libtinyxml2=5F5.0.1.bb
@@ -6,10 +6,12 @@ LIC=5FFILES=5FCHKSUM =3D "file://tinyxml2.cpp;endline=3D2=
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
+FILES=5F${PN}-dev +=3D "${libdir}/cmake/"
+
 BBCLASSEXTEND =3D "native"
--=20
2.13.2



