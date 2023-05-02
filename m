Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26A9EC77B73
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 16:06:15 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.87.1683043571131925759
 for <Openembedded-devel@lists.openembedded.org>;
 Tue, 02 May 2023 09:06:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=N7kC+OTn;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 342G65Wq049749;
	Tue, 2 May 2023 11:06:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1683043565;
	bh=ywZ8k89cl+9Vcf3hv5jGjJpU/ogV6Fo/aRenePxukBo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=N7kC+OTnnHrIJO9cCQlH6ZbLct4cRunt/huq8OD0q2sL9DCSmnzlXq5akJ5zSTR1g
	 cbpi64IkGOsg0xiqE+7HKZY/c/zfU2HlHrZeDF4rLak85heYhE26CAGySj/DOW6qSP
	 TzgVbL5ryfYNWNX879E1JWYxJMbyOZqjj4AxaiJ0=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 342G65mb093633
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 2 May 2023 11:06:05 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 2
 May 2023 11:06:05 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 2 May 2023 11:06:05 -0500
Received: from [128.247.81.144] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 342G65C6020142;
	Tue, 2 May 2023 11:06:05 -0500
Message-ID: <055e898a-d85e-2f86-da85-b7b00db1cf54@ti.com>
Date: Tue, 2 May 2023 11:06:05 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [EXTERNAL] Re: [oe] [meta-oe][kirkstone][PATCHv2] glfw: add
 packageconfig and wayland dependencies
Content-Language: en-US, en-US-large
To: Martin Jansa <martin.jansa@gmail.com>
CC: akuster808 <akuster808@gmail.com>, <raj.khem@gmail.com>, <afd@ti.com>,
        <detheridge@ti.com>, <reatmon@ti.com>, <denis@denix.org>,
        <Openembedded-devel@lists.openembedded.org>
References: <20230427164723.863197-1-rs@ti.com>
 <36d695de-8152-c528-4b17-f85ff1e4c4ff@gmail.com>
 <df484615-b1eb-d368-f48e-f9da599cd4c4@ti.com>
 <CA+chaQfpAZwtAk4kOG56xiCmOm62MGW6YPEG661-n7XqC08Rxg@mail.gmail.com>
From: Randolph Sapp <rs@ti.com>
In-Reply-To: <CA+chaQfpAZwtAk4kOG56xiCmOm62MGW6YPEG661-n7XqC08Rxg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0143.ext.ti.com id 342G65Wq049749
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 May 2023 16:06:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102262

On 5/2/23 10:56, Martin Jansa wrote:
> The version which was merged with:
>=20
> PACKAGECONFIG ??=3D "x11"
>=20
> Should still respect x11 in DISTRO_FEATURES, now this causes:
>=20
> ERROR: Nothing PROVIDES 'libxi' (but=20
> meta-oe/recipes-core/glfw/glfw_3.3.bb <http://glfw_3.3.bb> DEPENDS on o=
r=20
> otherwise requires it)
> libxi was skipped: missing required distro feature 'x11' (not in=20
> DISTRO_FEATURES)
> ERROR: Nothing PROVIDES 'libxinerama' (but=20
> meta-oe/recipes-core/glfw/glfw_3.3.bb <http://glfw_3.3.bb> DEPENDS on o=
r=20
> otherwise requires it)
> libxinerama was skipped: missing required distro feature 'x11' (not in=20
> DISTRO_FEATURES)
> ERROR: Nothing PROVIDES 'libxrandr' (but=20
> meta-oe/recipes-core/glfw/glfw_3.3.bb <http://glfw_3.3.bb> DEPENDS on o=
r=20
> otherwise requires it)
> libxrandr was skipped: missing required distro feature 'x11' (not in=20
> DISTRO_FEATURES)
> ERROR: Nothing PROVIDES 'libglu' (but=20
> meta-oe/recipes-core/glfw/glfw_3.3.bb <http://glfw_3.3.bb> DEPENDS on o=
r=20
> otherwise requires it)
> libglu was skipped: missing required distro feature 'x11' (not in=20
> DISTRO_FEATURES)
> ERROR: Nothing PROVIDES 'libxcursor' (but=20
> meta-oe/recipes-core/glfw/glfw_3.3.bb <http://glfw_3.3.bb> DEPENDS on o=
r=20
> otherwise requires it)
> libxcursor was skipped: missing required distro feature 'x11' (not in=20
> DISTRO_FEATURES)
>=20
> when wayland and opengl are in DISTRO_FEATURES, but x11 isn't.
>=20

Yeah, that's expected behavior at this point. You need to manually=20
override the PACKAGECONFIG for wayland in this patch. Just slightly=20
better than no wayland at all.

The only way we can get around it is if this layer or one of it's=20
dependencies decides to adopt extra-cmake-modules. They the=20
packageconfig can automatically configure itself. Discussion on who's=20
job it is to carry this package has yet to conclude.

> REQUIRED_DISTRO_FEATURES is satisfied by "opengl" and=20
> ANY_OF_DISTRO_FEATURES by "wayland", but the default PACKAGECONFIG=20
> doesn't match with that.
>=20
> On Fri, Apr 28, 2023 at 6:32=E2=80=AFPM Randolph Sapp via lists.openemb=
edded.org=20
> <http://lists.openembedded.org> <rs=3Dti.com@lists.openembedded.org=20
> <mailto:ti.com@lists.openembedded.org>> wrote:
>=20
>     On 4/28/23 06:16, akuster808 wrote:
>      > Doesn't this need to land it Master first? Kirkstone is in the
>     subject
>      >
>      > - armin
>      >
>=20
>     Perhaps, but I've only had a chance to test it against kirkstone so=
 I
>     flagged it as such. At this point I'm still vetting solutions to th=
is
>     dependency chain though. Looking for something this layer would
>     actually
>     like to carry.
>=20
>      > On 4/27/23 12:47 PM, rs@ti.com <mailto:rs@ti.com> wrote:
>      >> From: Randolph Sapp <rs@ti.com <mailto:rs@ti.com>>
>      >>
>      >> GLFW has the ability to use a wayland backend. This patch adds =
a
>     config
>      >> for it, but does not enable it by default because it has a
>     dependency on
>      >> extra-cmake-modules which is provided (most commonly) by
>     meta-qt5-extra.
>      >>
>      >> Signed-off-by: Randolph Sapp <rs@ti.com <mailto:rs@ti.com>>
>      >> ---
>      >> =C2=A0 meta-oe/recipes-core/glfw/glfw_3.3.bb <http://glfw_3.3.b=
b> |
>     14 ++++++++++++--
>      >> =C2=A0 1 file changed, 12 insertions(+), 2 deletions(-)
>      >>
>      >> diff --git a/meta-oe/recipes-core/glfw/glfw_3.3.bb
>     <http://glfw_3.3.bb>
>      >> b/meta-oe/recipes-core/glfw/glfw_3.3.bb <http://glfw_3.3.bb>
>      >> index b31bba6b6b..5b0d61241e 100644
>      >> --- a/meta-oe/recipes-core/glfw/glfw_3.3.bb <http://glfw_3.3.bb=
>
>      >> +++ b/meta-oe/recipes-core/glfw/glfw_3.3.bb <http://glfw_3.3.bb=
>
>      >> @@ -20,7 +20,17 @@ EXTRA_OECMAKE +=3D "-DBUILD_SHARED_LIBS=3DON
>      >> -DGLFW_BUILD_DOCS=3DOFF"
>      >> =C2=A0 CFLAGS +=3D "-fPIC"
>      >> -DEPENDS =3D "libpng libglu zlib libxrandr libxinerama libxi
>     libxcursor"
>      >> -REQUIRED_DISTRO_FEATURES =3D "x11 opengl"
>      >> +DEPENDS =3D "libpng libglu zlib"
>      >> +REQUIRED_DISTRO_FEATURES =3D "opengl"
>      >> +ANY_OF_DISTRO_FEATURES =3D "wayland x11"
>      >> +
>      >> +# upstream considers x11 and wayland backends mutually
>     exclusive and
>      >> will
>      >> +# prioritize wayland if it is enabled, but wayland has
>     dependencies
>      >> that cannot
>      >> +# be satisfied by this layer so it is disabled by default
>      >> +
>      >> +PACKAGECONFIG ??=3D "x11"
>      >> +
>      >> +PACKAGECONFIG[wayland] =3D "-DGLFW_USE_WAYLAND=3DON,,wayland
>      >> wayland-native wayland-protocols extra-cmake-modules libxkbcomm=
on"
>      >> +PACKAGECONFIG[x11] =3D ",,libxrandr libxinerama libxi libxcurs=
or"
>      >> =C2=A0 COMPATIBLE_HOST:libc-musl =3D "null"
>      >
>=20
>=20
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#102225):
>     https://lists.openembedded.org/g/openembedded-devel/message/102225
>     <https://lists.openembedded.org/g/openembedded-devel/message/102225=
>
>     Mute This Topic: https://lists.openembedded.org/mt/98540896/3617156
>     <https://lists.openembedded.org/mt/98540896/3617156>
>     Group Owner: openembedded-devel+owner@lists.openembedded.org
>     <mailto:openembedded-devel%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-devel/unsub
>     <https://lists.openembedded.org/g/openembedded-devel/unsub>
>     [Martin.Jansa@gmail.com <mailto:Martin.Jansa@gmail.com>]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


