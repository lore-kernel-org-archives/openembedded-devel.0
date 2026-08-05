Return-Path: <mathieu.caldeira@otodo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 915B5C55182
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 08:00:43 +0000 (UTC)
Subject: [meta-java][scarthgap] The SRC_URI of various packages needs to be updated
To: openembedded-devel@lists.openembedded.org
From: mathieu.caldeira@otodo.com
X-Originating-Location: =?UTF-8?B?w45sZS1kZS1GcmFuY2UsIEZS?= (82.67.215.179)
X-Originating-Platform: Linux Chrome 150
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 05 Aug 2026 01:00:43 -0700
Message-ID: <rhuH.1785916843276282730.UKUk@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="Pw5qOd1M6wvsy5c31za8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Aug 2026 08:00:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128802

--Pw5qOd1M6wvsy5c31za8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Some packages in meta-java can't be downloaded due to a modification (serve=
r side) in their URL.

Maybe, somone need to do something like this to repair the scarthgap branch=
:

>=20
> diff --git a/recipes-core/jakarta-libs/avalon-framework-api_4.3.bb
> b/recipes-core/jakarta-libs/avalon-framework-api_4.3.bb
> index 081cfe7..5572c77 100644
> --- a/recipes-core/jakarta-libs/avalon-framework-api_4.3.bb
> +++ b/recipes-core/jakarta-libs/avalon-framework-api_4.3.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE.txt;md5=3D1dece7821bf3fd70fe1309eaa37d52a2"
> PR =3D "r1"
>=20
> SRC_URI =3D " \
> - =C2=A0 =C2=A0 =C2=A0
> http://archive.apache.org/dist/excalibur/avalon-framework/source/${BP}-sr=
c.tar.gz;name=3Darchive
> \
> + =C2=A0 =C2=A0 =C2=A0
> http://archive.apache.org/dist/excalibur/excalibur-framework/source/${BP}=
-src.tar.gz;name=3Darchive
> \
> http://archive.apache.org/dist/avalon/logkit/source/logkit-1.2.2-src.tar.=
gz;name=3Dlogkit
> \
> "
>=20
> diff --git a/recipes-core/xalan-j/xalan-j_2.7.1.bb
> b/recipes-core/xalan-j/xalan-j_2.7.1.bb
> index 5e72a34..968ddaa 100644
> --- a/recipes-core/xalan-j/xalan-j_2.7.1.bb
> +++ b/recipes-core/xalan-j/xalan-j_2.7.1.bb
> @@ -12,7 +12,7 @@ PR =3D "r2"
> DEPENDS =3D "xerces-j regexp jlex cup jaxp1.3 bcel"
>=20
> SRC_URI =3D "\
> - =C2=A0=20
> http://archive.apache.org/dist/xml/${BPN}/${BPN}_2_7_1-src.tar.gz;name=3D=
archive
> \
> + =C2=A0=20
> https://archive.apache.org/dist/xalan/xalan-j/source/${BPN}_2_7_1-src.tar=
.gz;name=3Darchive
> \
> https://dlcdn.apache.org/commons/bsf/source/bsf-src-2.4.0.tar.gz;name=3Db=
sf
> \
> "
>=20
> diff --git a/recipes-core/xml-commons/xml-commons-resolver1.1_1.2.bb
> b/recipes-core/xml-commons/xml-commons-resolver1.1_1.2.bb
> index 0fafcea..7b4d30d 100644
> --- a/recipes-core/xml-commons/xml-commons-resolver1.1_1.2.bb
> +++ b/recipes-core/xml-commons/xml-commons-resolver1.1_1.2.bb
> @@ -4,7 +4,7 @@ LICENSE =3D "Apache-2.0"
> PR =3D "r1"
> LIC_FILES_CHKSUM =3D
> "file://LICENSE.resolver.txt;md5=3Dd229da563da18fe5d58cd95a6467d584"
>=20
> -SRC_URI =3D
> "http://archive.apache.org/dist/xml/commons/xml-commons-resolver-${PV}.ta=
r.gz"
>=20
> +SRC_URI =3D
> "http://archive.apache.org/dist/xml/commons/binaries/xml-commons-resolver=
-${PV}.tar.gz"
>=20
>=20
> inherit java-library
>=20
>=20

There is probably more SRC_URI to fix, this only the ones required in my bu=
ild.

--Pw5qOd1M6wvsy5c31za8
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hello,</div>
<div>&nbsp;</div>
<div>Some packages in meta-java can't be downloaded due to a modification (=
server side) in their URL.</div>
<div>&nbsp;</div>
<div>Maybe, somone need to do something like this to repair the scarthgap b=
ranch:</div>
<div>&nbsp;</div>
<blockquote>
<div>diff --git a/recipes-core/jakarta-libs/avalon-framework-api_4.3.bb b/r=
ecipes-core/jakarta-libs/avalon-framework-api_4.3.bb<br />index 081cfe7..55=
72c77 100644<br />--- a/recipes-core/jakarta-libs/avalon-framework-api_4.3.=
bb<br />+++ b/recipes-core/jakarta-libs/avalon-framework-api_4.3.bb<br />@@=
 -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D1dece7821bf3fd=
70fe1309eaa37d52a2"<br />&nbsp;PR =3D "r1"<br />&nbsp;<br />&nbsp;SRC_URI =
=3D " \<br />- &nbsp; &nbsp; &nbsp; http://archive.apache.org/dist/excalibu=
r/avalon-framework/source/${BP}-src.tar.gz;name=3Darchive \<br />+ &nbsp; &=
nbsp; &nbsp; http://archive.apache.org/dist/excalibur/excalibur-framework/s=
ource/${BP}-src.tar.gz;name=3Darchive \<br />&nbsp; &nbsp; &nbsp; &nbsp; ht=
tp://archive.apache.org/dist/avalon/logkit/source/logkit-1.2.2-src.tar.gz;n=
ame=3Dlogkit \<br />&nbsp; &nbsp; &nbsp; &nbsp;"<br />&nbsp;<br />diff --gi=
t a/recipes-core/xalan-j/xalan-j_2.7.1.bb b/recipes-core/xalan-j/xalan-j_2.=
7.1.bb<br />index 5e72a34..968ddaa 100644<br />--- a/recipes-core/xalan-j/x=
alan-j_2.7.1.bb<br />+++ b/recipes-core/xalan-j/xalan-j_2.7.1.bb<br />@@ -1=
2,7 +12,7 @@ PR =3D "r2"<br />&nbsp;DEPENDS =3D "xerces-j regexp jlex cup j=
axp1.3 bcel"<br />&nbsp;<br />&nbsp;SRC_URI =3D "\<br />- &nbsp; &nbsp;http=
://archive.apache.org/dist/xml/${BPN}/${BPN}_2_7_1-src.tar.gz;name=3Darchiv=
e \<br />+ &nbsp; &nbsp;https://archive.apache.org/dist/xalan/xalan-j/sourc=
e/${BPN}_2_7_1-src.tar.gz;name=3Darchive \<br />&nbsp; &nbsp; &nbsp;https:/=
/dlcdn.apache.org/commons/bsf/source/bsf-src-2.4.0.tar.gz;name=3Dbsf \<br /=
>&nbsp; &nbsp; &nbsp;"<br />&nbsp;<br />diff --git a/recipes-core/xml-commo=
ns/xml-commons-resolver1.1_1.2.bb b/recipes-core/xml-commons/xml-commons-re=
solver1.1_1.2.bb<br />index 0fafcea..7b4d30d 100644<br />--- a/recipes-core=
/xml-commons/xml-commons-resolver1.1_1.2.bb<br />+++ b/recipes-core/xml-com=
mons/xml-commons-resolver1.1_1.2.bb<br />@@ -4,7 +4,7 @@ LICENSE =3D "Apach=
e-2.0"<br />&nbsp;PR =3D "r1"<br />&nbsp;LIC_FILES_CHKSUM =3D "file://LICEN=
SE.resolver.txt;md5=3Dd229da563da18fe5d58cd95a6467d584"<br />&nbsp;<br />-S=
RC_URI =3D "http://archive.apache.org/dist/xml/commons/xml-commons-resolver=
-${PV}.tar.gz"<br />+SRC_URI =3D "http://archive.apache.org/dist/xml/common=
s/binaries/xml-commons-resolver-${PV}.tar.gz"<br />&nbsp;<br />&nbsp;inheri=
t java-library<br />&nbsp;</div>
</blockquote>
<div>&nbsp;</div>
<div>There is probably more SRC_URI to fix, this only the ones required in =
my build.</div>

--Pw5qOd1M6wvsy5c31za8--

