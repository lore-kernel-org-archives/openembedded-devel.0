Return-Path: <aurelienbertron@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F016C43334
	for <webhook@archiver.kernel.org>; Thu,  2 Jun 2022 08:59:09 +0000 (UTC)
Subject: [meta-networking] Incorrect src branch for http-parser
To: openembedded-devel@lists.openembedded.org
From: =?UTF-8?B?QXVyw6lsaWVuIEJlcnRyb24=?= <aurelienbertron@gmail.com>
X-Originating-Location: Albigny-sur-Saone, Auvergne-Rhone-Alpes,
 FR (37.58.149.117)
X-Originating-Platform: Linux Firefox 100
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 02 Jun 2022 01:59:04 -0700
Message-ID: <01L6.1654160344794307311.ZD0a@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="1InpxdbJihRpOGjP5x63"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Jun 2022 08:59:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97382

--1InpxdbJihRpOGjP5x63
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello,

I am experiencing a bug on kirkstone branch: the http-parser recipe fetches=
 its sources from github.com/nodejs/http-parser ( http://github.com/nodejs/=
http-parser ) repo :

>=20
> SRC_URI =3D "git://github.com/nodejs/http- parser.git;branch=3Dmaster;pro=
to col=3Dhttps"
>=20
> SRCREV =3D "2343fd6b5214b2ded2cdcf76de2bf60903bb90cd"

Problem: the branch is set to *master* but it does not exist on
upstream repo, the default branch is *main*. This makes the fetch step
to fail.

A possible workaround is to extend the recipe to change the SRC_URI.

Aur=C3=A9lien.

--1InpxdbJihRpOGjP5x63
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello,<br /><br />I am experiencing a bug on kirkstone branch: the <em>http=
-parser</em> recipe fetches its sources from<em> <a href=3D"http://github.c=
om/nodejs/http-parser" target=3D"_blank" rel=3D"noopener noreferrer" data-s=
aferedirecturl=3D"https://www.google.com/url?q=3Dhttp://github.com/nodejs/h=
ttp-parser&amp;source=3Dgmail&amp;ust=3D1654246401116000&amp;usg=3DAOvVaw0M=
RkI2C1N3e3tFsmr4Sxw4">github.com/nodejs/http-parser</a></em> repo :<br />
<blockquote>SRC_URI =3D "git://github.com/nodejs/http-<wbr />parser.git;bra=
nch=3Dmaster;proto<wbr />col=3Dhttps"<br />SRCREV =3D "2343fd6b5214b2ded2cd=
cf76de2bf60903bb90cd"</blockquote>
Problem: the branch is set to <strong>master</strong> but it does not exist=
 on<br />upstream repo, the default branch is <strong>main</strong>. This m=
akes the fetch step<br />to fail.
<p>A possible workaround is to extend the recipe to change the SRC_URI.<br =
/><br />Aur&eacute;lien.</p>
<span style=3D"color: #888888;"></span>

--1InpxdbJihRpOGjP5x63--

