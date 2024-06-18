Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC4AAC2BA18
	for <webhook@archiver.kernel.org>; Tue, 18 Jun 2024 18:28:47 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.1853.1718735323197098594
 for <Openembedded-devel@lists.openembedded.org>;
 Tue, 18 Jun 2024 11:28:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 958D340C50;
	Tue, 18 Jun 2024 18:28:41 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uw1w9rdNDvDt; Tue, 18 Jun 2024 18:28:41 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id ABBD040C2A;
	Tue, 18 Jun 2024 18:28:35 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 5EEE0163FB7; Tue, 18 Jun 2024 14:28:34 -0400 (EDT)
Date: Tue, 18 Jun 2024 14:28:34 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: rs@ti.com, Openembedded-devel@lists.openembedded.org, afd@ti.com,
	detheridge@ti.com, reatmon@ti.com
Subject: Re: [meta-oe][master][PATCH] vulkan-cts: add workaround for
 createMeshShaderMiscTestsEXT
Message-ID: <20240618182834.GA18231@denix.org>
References: <20240618005203.2022725-1-rs@ti.com>
 <CAMKF1spyT0tUjE8=ojmWNV+5Gz-QYrUUepoTKSRwoa2YNkqTtw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMKF1spyT0tUjE8=ojmWNV+5Gz-QYrUUepoTKSRwoa2YNkqTtw@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Jun 2024 18:28:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110955

On Mon, Jun 17, 2024 at 06:41:57PM -0700, Khem Raj wrote:
> On Mon, Jun 17, 2024 at 5:52=E2=80=AFPM <rs@ti.com> wrote:
>=20
> > From: Randolph Sapp <rs@ti.com>
> >
> > Remove the CXX flag "-O2" for GCC 13 and 14. There's a bug with ARM G=
CC
> > that breaks the iteration of "types" in the createMeshShaderMiscTests=
EXT
> > function. This issue is not present for clang or x86_64 GCC 14.

Is there an upstream bug submitted that tracks it?


> > It seems that the array is not initialized before the first iteration=
.
> > In testing this can result in a random value being used. This can
> > manifest in LINES type being processed twice, resulting in the follow=
ing
> > error:
> >
> > FATAL ERROR: Failed to initialize dEQP: Test case with non-unique nam=
e
> > 'no_lines' added to group 'misc'.
> >
> > Signed-off-by: Randolph Sapp <rs@ti.com>
> > ---
> >  meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.7.3.bb | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.7.3.bb
> > b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.7.3.bb
> > index 1008a5fd4..7492fe9aa 100644
> > --- a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.7.3.bb
> > +++ b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.7.3.bb
> > @@ -23,6 +23,9 @@ SRC_URI +=3D
> > "file://0001-cmake-Define-WAYLAND_SCANNER-and-WAYLAND_PROTOCOLS_D.pat
> >
> >  TOOLCHAIN =3D "gcc"
> >
> > +# Workaround an optimization bug that breaks createMeshShaderMiscTes=
tsEXT
> > +OECMAKE_CXX_FLAGS:remove:toolchain-gcc =3D "-O2"
>=20
>=20
> Let=E2=80=99s limit it to arm
> And gcc using the needed overrides
>=20
> >
> > +
> >  S =3D "${WORKDIR}/git"
> >
> >  REQUIRED_DISTRO_FEATURES =3D "vulkan"
> > --
> > 2.45.1
> >
> >

