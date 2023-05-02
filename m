Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45ABEC77B7E
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 16:13:14 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.148.1683043985783570970
 for <Openembedded-devel@lists.openembedded.org>;
 Tue, 02 May 2023 09:13:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=dtwQX5Vw;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 342GD2eM102421;
	Tue, 2 May 2023 11:13:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1683043982;
	bh=GeJA7Abvgu7LnTHzUcv76bPbhqRi8rdSOAnD8+guh8c=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=dtwQX5VwHSNinWc8fyhR5gfcBqZ5ye2MKLL12m0fbvG/RWHMfJcQ3sH/qJCflEmkJ
	 nyI5odw7lsK7B9CfHWppug+Q1Cx5AFlA0J39BMZ/FfUqefIPptY7nooASVI3yJhVOs
	 GRMCInx3JVlomMp1nbkCo+Rwnr8ljlKsf+EdRu+U=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 342GD2I3016419
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 2 May 2023 11:13:02 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 2
 May 2023 11:13:02 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 2 May 2023 11:13:02 -0500
Received: from [128.247.81.144] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 342GD2fP078437;
	Tue, 2 May 2023 11:13:02 -0500
Message-ID: <95542507-bc1f-ebb8-0bf0-29a6e43f0e62@ti.com>
Date: Tue, 2 May 2023 11:13:02 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [EXTERNAL] Re: [EXTERNAL] Re: [oe] [meta-oe][kirkstone][PATCHv2]
 glfw: add packageconfig and wayland dependencies
Content-Language: en-US, en-US-large
To: Khem Raj <raj.khem@gmail.com>
CC: Martin Jansa <martin.jansa@gmail.com>, akuster808 <akuster808@gmail.com>,
        <afd@ti.com>, <detheridge@ti.com>, <reatmon@ti.com>, <denis@denix.org>,
        <Openembedded-devel@lists.openembedded.org>
References: <20230427164723.863197-1-rs@ti.com>
 <36d695de-8152-c528-4b17-f85ff1e4c4ff@gmail.com>
 <df484615-b1eb-d368-f48e-f9da599cd4c4@ti.com>
 <CA+chaQfpAZwtAk4kOG56xiCmOm62MGW6YPEG661-n7XqC08Rxg@mail.gmail.com>
 <055e898a-d85e-2f86-da85-b7b00db1cf54@ti.com>
 <CAMKF1squ-NOf4+qgDGVV3yPjX95Kp_nCOq0zK5QWGeqxb=h9OQ@mail.gmail.com>
From: Randolph Sapp <rs@ti.com>
In-Reply-To: <CAMKF1squ-NOf4+qgDGVV3yPjX95Kp_nCOq0zK5QWGeqxb=h9OQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 342GD2eM102421
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 May 2023 16:13:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102264

On 5/2/23 11:08, Khem Raj wrote:
> On Tue, May 2, 2023 at 9:06=E2=80=AFAM Randolph Sapp <rs@ti.com> wrote:
>>
>> On 5/2/23 10:56, Martin Jansa wrote:
>>> The version which was merged with:
>>>
>>> PACKAGECONFIG ??=3D "x11"
>>>
>>> Should still respect x11 in DISTRO_FEATURES, now this causes:
>>>
>>> ERROR: Nothing PROVIDES 'libxi' (but
>>> meta-oe/recipes-core/glfw/glfw_3.3.bb <http://glfw_3.3.bb> DEPENDS on=
 or
>>> otherwise requires it)
>>> libxi was skipped: missing required distro feature 'x11' (not in
>>> DISTRO_FEATURES)
>>> ERROR: Nothing PROVIDES 'libxinerama' (but
>>> meta-oe/recipes-core/glfw/glfw_3.3.bb <http://glfw_3.3.bb> DEPENDS on=
 or
>>> otherwise requires it)
>>> libxinerama was skipped: missing required distro feature 'x11' (not i=
n
>>> DISTRO_FEATURES)
>>> ERROR: Nothing PROVIDES 'libxrandr' (but
>>> meta-oe/recipes-core/glfw/glfw_3.3.bb <http://glfw_3.3.bb> DEPENDS on=
 or
>>> otherwise requires it)
>>> libxrandr was skipped: missing required distro feature 'x11' (not in
>>> DISTRO_FEATURES)
>>> ERROR: Nothing PROVIDES 'libglu' (but
>>> meta-oe/recipes-core/glfw/glfw_3.3.bb <http://glfw_3.3.bb> DEPENDS on=
 or
>>> otherwise requires it)
>>> libglu was skipped: missing required distro feature 'x11' (not in
>>> DISTRO_FEATURES)
>>> ERROR: Nothing PROVIDES 'libxcursor' (but
>>> meta-oe/recipes-core/glfw/glfw_3.3.bb <http://glfw_3.3.bb> DEPENDS on=
 or
>>> otherwise requires it)
>>> libxcursor was skipped: missing required distro feature 'x11' (not in
>>> DISTRO_FEATURES)
>>>
>>> when wayland and opengl are in DISTRO_FEATURES, but x11 isn't.
>>>
>>
>> Yeah, that's expected behavior at this point. You need to manually
>> override the PACKAGECONFIG for wayland in this patch. Just slightly
>> better than no wayland at all.
>>
>> The only way we can get around it is if this layer or one of it's
>> dependencies decides to adopt extra-cmake-modules. They the
>> packageconfig can automatically configure itself. Discussion on who's
>> job it is to carry this package has yet to conclude.
>>
>=20
> May be bring it to meta-oe at this point.

Roger. Patches Soon=E2=84=A2

>=20
>>> REQUIRED_DISTRO_FEATURES is satisfied by "opengl" and
>>> ANY_OF_DISTRO_FEATURES by "wayland", but the default PACKAGECONFIG
>>> doesn't match with that.
>>>
>>> On Fri, Apr 28, 2023 at 6:32=E2=80=AFPM Randolph Sapp via lists.opene=
mbedded.org
>>> <http://lists.openembedded.org> <rs=3Dti.com@lists.openembedded.org
>>> <mailto:ti.com@lists.openembedded.org>> wrote:
>>>
>>>      On 4/28/23 06:16, akuster808 wrote:
>>>       > Doesn't this need to land it Master first? Kirkstone is in th=
e
>>>      subject
>>>       >
>>>       > - armin
>>>       >
>>>
>>>      Perhaps, but I've only had a chance to test it against kirkstone=
 so I
>>>      flagged it as such. At this point I'm still vetting solutions to=
 this
>>>      dependency chain though. Looking for something this layer would
>>>      actually
>>>      like to carry.
>>>
>>>       > On 4/27/23 12:47 PM, rs@ti.com <mailto:rs@ti.com> wrote:
>>>       >> From: Randolph Sapp <rs@ti.com <mailto:rs@ti.com>>
>>>       >>
>>>       >> GLFW has the ability to use a wayland backend. This patch ad=
ds a
>>>      config
>>>       >> for it, but does not enable it by default because it has a
>>>      dependency on
>>>       >> extra-cmake-modules which is provided (most commonly) by
>>>      meta-qt5-extra.
>>>       >>
>>>       >> Signed-off-by: Randolph Sapp <rs@ti.com <mailto:rs@ti.com>>
>>>       >> ---
>>>       >>   meta-oe/recipes-core/glfw/glfw_3.3.bb <http://glfw_3.3.bb>=
 |
>>>      14 ++++++++++++--
>>>       >>   1 file changed, 12 insertions(+), 2 deletions(-)
>>>       >>
>>>       >> diff --git a/meta-oe/recipes-core/glfw/glfw_3.3.bb
>>>      <http://glfw_3.3.bb>
>>>       >> b/meta-oe/recipes-core/glfw/glfw_3.3.bb <http://glfw_3.3.bb>
>>>       >> index b31bba6b6b..5b0d61241e 100644
>>>       >> --- a/meta-oe/recipes-core/glfw/glfw_3.3.bb <http://glfw_3.3=
.bb>
>>>       >> +++ b/meta-oe/recipes-core/glfw/glfw_3.3.bb <http://glfw_3.3=
.bb>
>>>       >> @@ -20,7 +20,17 @@ EXTRA_OECMAKE +=3D "-DBUILD_SHARED_LIBS=3D=
ON
>>>       >> -DGLFW_BUILD_DOCS=3DOFF"
>>>       >>   CFLAGS +=3D "-fPIC"
>>>       >> -DEPENDS =3D "libpng libglu zlib libxrandr libxinerama libxi
>>>      libxcursor"
>>>       >> -REQUIRED_DISTRO_FEATURES =3D "x11 opengl"
>>>       >> +DEPENDS =3D "libpng libglu zlib"
>>>       >> +REQUIRED_DISTRO_FEATURES =3D "opengl"
>>>       >> +ANY_OF_DISTRO_FEATURES =3D "wayland x11"
>>>       >> +
>>>       >> +# upstream considers x11 and wayland backends mutually
>>>      exclusive and
>>>       >> will
>>>       >> +# prioritize wayland if it is enabled, but wayland has
>>>      dependencies
>>>       >> that cannot
>>>       >> +# be satisfied by this layer so it is disabled by default
>>>       >> +
>>>       >> +PACKAGECONFIG ??=3D "x11"
>>>       >> +
>>>       >> +PACKAGECONFIG[wayland] =3D "-DGLFW_USE_WAYLAND=3DON,,waylan=
d
>>>       >> wayland-native wayland-protocols extra-cmake-modules libxkbc=
ommon"
>>>       >> +PACKAGECONFIG[x11] =3D ",,libxrandr libxinerama libxi libxc=
ursor"
>>>       >>   COMPATIBLE_HOST:libc-musl =3D "null"
>>>       >
>>>
>>>
>>>      -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>      Links: You receive all messages sent to this group.
>>>      View/Reply Online (#102225):
>>>      https://lists.openembedded.org/g/openembedded-devel/message/1022=
25
>>>      <https://lists.openembedded.org/g/openembedded-devel/message/102=
225>
>>>      Mute This Topic: https://lists.openembedded.org/mt/98540896/3617=
156
>>>      <https://lists.openembedded.org/mt/98540896/3617156>
>>>      Group Owner: openembedded-devel+owner@lists.openembedded.org
>>>      <mailto:openembedded-devel%2Bowner@lists.openembedded.org>
>>>      Unsubscribe:
>>>      https://lists.openembedded.org/g/openembedded-devel/unsub
>>>      <https://lists.openembedded.org/g/openembedded-devel/unsub>
>>>      [Martin.Jansa@gmail.com <mailto:Martin.Jansa@gmail.com>]
>>>      -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>
>>


