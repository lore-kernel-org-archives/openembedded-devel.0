Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11FE2C27C4F
	for <webhook@archiver.kernel.org>; Tue, 18 Jun 2024 18:48:18 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.2309.1718736489368014518
 for <Openembedded-devel@lists.openembedded.org>;
 Tue, 18 Jun 2024 11:48:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=AMHeji4N;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45IIm0om063126;
	Tue, 18 Jun 2024 13:48:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718736480;
	bh=+xS5WSclePM6R9wfEoOEVjyPIyIJ6BgriCF4a7dJT+Q=;
	h=Date:CC:Subject:From:To:References:In-Reply-To;
	b=AMHeji4NcBSDfPvW9U+eHIJOdCQEiSjrKkDAJMW8aPG7Ei+gGxO7gUSTIhE7axSQz
	 9C9qOgUGklgtkABVpN3XGabHf4ZZg2Rc4Mlb9rebSnAMDxi2AHh22fPcvolqNfANJ+
	 qEZPyuEZV5QOlBw5+VRXls5YZtBhRHBtNaxWYLrw=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45IIm0Cn068474
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 18 Jun 2024 13:48:00 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 18
 Jun 2024 13:48:00 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 18 Jun 2024 13:48:00 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45IIm0N7047837;
	Tue, 18 Jun 2024 13:48:00 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 18 Jun 2024 13:48:00 -0500
Message-ID: <D23D8EROG3XR.95WKB5GSHMHP@ti.com>
CC: <Openembedded-devel@lists.openembedded.org>, <afd@ti.com>,
        <detheridge@ti.com>, <reatmon@ti.com>
Subject: Re: [meta-oe][master][PATCH] vulkan-cts: add workaround for
 createMeshShaderMiscTestsEXT
From: Randolph Sapp <rs@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, Khem Raj <raj.khem@gmail.com>
X-Mailer: aerc 0.17.0
References: <20240618005203.2022725-1-rs@ti.com>
 <CAMKF1spyT0tUjE8=ojmWNV+5Gz-QYrUUepoTKSRwoa2YNkqTtw@mail.gmail.com>
 <20240618182834.GA18231@denix.org>
In-Reply-To: <20240618182834.GA18231@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Jun 2024 18:48:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110956

On Tue Jun 18, 2024 at 1:28 PM CDT, Denys Dmytriyenko wrote:
> On Mon, Jun 17, 2024 at 06:41:57PM -0700, Khem Raj wrote:
> > On Mon, Jun 17, 2024 at 5:52=E2=80=AFPM <rs@ti.com> wrote:
> >=20
> > > From: Randolph Sapp <rs@ti.com>
> > >
> > > Remove the CXX flag "-O2" for GCC 13 and 14. There's a bug with ARM G=
CC
> > > that breaks the iteration of "types" in the createMeshShaderMiscTests=
EXT
> > > function. This issue is not present for clang or x86_64 GCC 14.
>
> Is there an upstream bug submitted that tracks it?

Not that I know of, at least for GCC. Still trying to track down where that
should go and how to reproduce this in a way people will take it seriously.

About to have a PR in cts with two modifications to that function that also
solve the issue, though. Hoping to get more insight from them.

> > > It seems that the array is not initialized before the first iteration=
.
> > > In testing this can result in a random value being used. This can
> > > manifest in LINES type being processed twice, resulting in the follow=
ing
> > > error:
> > >
> > > FATAL ERROR: Failed to initialize dEQP: Test case with non-unique nam=
e
> > > 'no_lines' added to group 'misc'.
> > >
> > > Signed-off-by: Randolph Sapp <rs@ti.com>
> > > ---
> > >  meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.7.3.bb | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.7.3.bb
> > > b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.7.3.bb
> > > index 1008a5fd4..7492fe9aa 100644
> > > --- a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.7.3.bb
> > > +++ b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.7.3.bb
> > > @@ -23,6 +23,9 @@ SRC_URI +=3D
> > > "file://0001-cmake-Define-WAYLAND_SCANNER-and-WAYLAND_PROTOCOLS_D.pat
> > >
> > >  TOOLCHAIN =3D "gcc"
> > >
> > > +# Workaround an optimization bug that breaks createMeshShaderMiscTes=
tsEXT
> > > +OECMAKE_CXX_FLAGS:remove:toolchain-gcc =3D "-O2"
> >=20
> >=20
> > Let=E2=80=99s limit it to arm
> > And gcc using the needed overrides
> >=20
> > >
> > > +
> > >  S =3D "${WORKDIR}/git"
> > >
> > >  REQUIRED_DISTRO_FEATURES =3D "vulkan"
> > > --
> > > 2.45.1
> > >
> > >


