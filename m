Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0936CC27C53
	for <webhook@archiver.kernel.org>; Wed, 19 Jun 2024 23:32:47 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.35658.1718839966549773254
 for <Openembedded-devel@lists.openembedded.org>;
 Wed, 19 Jun 2024 16:32:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=sG+BLcW8;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45JNWeuP081412;
	Wed, 19 Jun 2024 18:32:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718839960;
	bh=mCUAr8w9ml43/uTojhzCy+jS+PnjK3mPI1kMOcpuc9I=;
	h=Date:CC:Subject:From:To:References:In-Reply-To;
	b=sG+BLcW8t67/g68UNHDJAK1qmKCMzMnc0ToNdsFTyZYgtVvHjsXOv7t8uT7K5kGaH
	 KrzDbHQAy+JrYzFEzGuwwxe4udI8llfJICF0sExSzfOH45KlFWmiE2EKu92ow9/Vpp
	 9fdPCTVoAbuQ652giCYDKcoq74pyKgr0qOYyRs7A=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45JNWedJ017071
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 19 Jun 2024 18:32:40 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 19
 Jun 2024 18:32:39 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 19 Jun 2024 18:32:39 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45JNWdJd064051;
	Wed, 19 Jun 2024 18:32:39 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 19 Jun 2024 18:32:39 -0500
Message-ID: <D24DWWN82CIP.2FFBJGZYED6MI@ti.com>
CC: <Openembedded-devel@lists.openembedded.org>, <afd@ti.com>,
        <detheridge@ti.com>, <reatmon@ti.com>
Subject: Re: [meta-oe][master][PATCH] vulkan-cts: add workaround for
 createMeshShaderMiscTestsEXT
From: Randolph Sapp <rs@ti.com>
To: Randolph Sapp <rs@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        Khem Raj
	<raj.khem@gmail.com>
X-Mailer: aerc 0.17.0
References: <20240618005203.2022725-1-rs@ti.com>
 <CAMKF1spyT0tUjE8=ojmWNV+5Gz-QYrUUepoTKSRwoa2YNkqTtw@mail.gmail.com>
 <20240618182834.GA18231@denix.org> <D23D8EROG3XR.95WKB5GSHMHP@ti.com>
In-Reply-To: <D23D8EROG3XR.95WKB5GSHMHP@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Jun 2024 23:32:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110969

On Tue Jun 18, 2024 at 1:48 PM CDT, Randolph Sapp wrote:
> On Tue Jun 18, 2024 at 1:28 PM CDT, Denys Dmytriyenko wrote:
> > On Mon, Jun 17, 2024 at 06:41:57PM -0700, Khem Raj wrote:
> > > On Mon, Jun 17, 2024 at 5:52=E2=80=AFPM <rs@ti.com> wrote:
> > >=20
> > > > From: Randolph Sapp <rs@ti.com>
> > > >
> > > > Remove the CXX flag "-O2" for GCC 13 and 14. There's a bug with ARM=
 GCC
> > > > that breaks the iteration of "types" in the createMeshShaderMiscTes=
tsEXT
> > > > function. This issue is not present for clang or x86_64 GCC 14.
> >
> > Is there an upstream bug submitted that tracks it?
>
> Not that I know of, at least for GCC. Still trying to track down where th=
at
> should go and how to reproduce this in a way people will take it seriousl=
y.

Narrowing down the optimization flags that cause this while I wait for a GC=
C
bugzilla account...

> About to have a PR in cts with two modifications to that function that al=
so
> solve the issue, though. Hoping to get more insight from them.

CTS PR open here if anyone wants to comment:
https://gerrit.khronos.org/c/vk-gl-cts/+/14984

> > > > It seems that the array is not initialized before the first iterati=
on.
> > > > In testing this can result in a random value being used. This can
> > > > manifest in LINES type being processed twice, resulting in the foll=
owing
> > > > error:
> > > >
> > > > FATAL ERROR: Failed to initialize dEQP: Test case with non-unique n=
ame
> > > > 'no_lines' added to group 'misc'.
> > > >
> > > > Signed-off-by: Randolph Sapp <rs@ti.com>
> > > > ---
> > > >  meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.7.3.bb | 3 +++
> > > >  1 file changed, 3 insertions(+)
> > > >
> > > > diff --git a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.7.3.=
bb
> > > > b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.7.3.bb
> > > > index 1008a5fd4..7492fe9aa 100644
> > > > --- a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.7.3.bb
> > > > +++ b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.7.3.bb
> > > > @@ -23,6 +23,9 @@ SRC_URI +=3D
> > > > "file://0001-cmake-Define-WAYLAND_SCANNER-and-WAYLAND_PROTOCOLS_D.p=
at
> > > >
> > > >  TOOLCHAIN =3D "gcc"
> > > >
> > > > +# Workaround an optimization bug that breaks createMeshShaderMiscT=
estsEXT
> > > > +OECMAKE_CXX_FLAGS:remove:toolchain-gcc =3D "-O2"
> > >=20
> > >=20
> > > Let=E2=80=99s limit it to arm
> > > And gcc using the needed overrides
> > >=20
> > > >
> > > > +
> > > >  S =3D "${WORKDIR}/git"
> > > >
> > > >  REQUIRED_DISTRO_FEATURES =3D "vulkan"
> > > > --
> > > > 2.45.1
> > > >
> > > >


