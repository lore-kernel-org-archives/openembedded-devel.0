Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ACE7E7C4D2
	for <webhook@archiver.kernel.org>; Wed,  4 Oct 2023 15:07:44 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
 by mx.groups.io with SMTP id smtpd.web11.112248.1696349351063246569
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Oct 2023 09:09:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ideasonboard.com header.s=mail header.b=r+XntwL7;
 spf=pass (domain: ideasonboard.com, ip: 213.167.242.64, mailfrom: kieran.bingham@ideasonboard.com)
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B5B73881;
	Tue,  3 Oct 2023 18:07:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1696349242;
	bh=5C/ObJFetO2QWjCQul2yQ0vbrchrK+6TXuI16JPNa5g=;
	h=In-Reply-To:References:Subject:From:To:Date:From;
	b=r+XntwL76Sxjyn8oy1jFpICkRB92olIqJEDoqtbiyKEIeHkaiOM3A/SX7vUD9xWpq
	 /KL+NRI9O11DBdcRdwdZCQWQnfwHHDa9/2nHoEUEKzxCJrl+1Ddow6kSX/eQCsJQA7
	 oY7IVSl8IQ31Ni50NhSIYwU34teh0IHKLXXZq8N4=
MIME-Version: 1.0
In-Reply-To: <DU0PR04MB9696DB38588F0EE1508653E6E2C4A@DU0PR04MB9696.eurprd04.prod.outlook.com>
References: <20231002173644.3284604-1-tom.hochstein@nxp.com> <169632534898.277971.10586575068039243782@ping.linuxembedded.co.uk> <DU0PR04MB9696DB38588F0EE1508653E6E2C4A@DU0PR04MB9696.eurprd04.prod.outlook.com>
Subject: Re: [meta-multimedia][PATCH] libcamera: Avoid build break in signature recalculation
From: "Kieran Bingham" <kieran.bingham@ideasonboard.com>
To: Tom Hochstein <tom.hochstein@nxp.com>, openembedded-devel@lists.openembedded.org
Date: Tue, 03 Oct 2023 17:09:05 +0100
Message-ID: <169634934558.2427060.13439469260056089722@ping.linuxembedded.co.uk>
User-Agent: alot/0.10
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Oct 2023 15:07:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105331

Quoting Tom Hochstein (2023-10-03 14:38:41)
>=20
>=20
> > -----Original Message-----
> > From: Kieran Bingham <kieran.bingham@ideasonboard.com>
> > Sent: Tuesday, October 3, 2023 4:29 AM
> > To: Tom Hochstein <tom.hochstein@nxp.com>; openembedded-
> > devel@lists.openembedded.org
> > Cc: Tom Hochstein <tom.hochstein@nxp.com>
> > Subject: Re: [meta-multimedia][PATCH] libcamera: Avoid build break in
> > signature recalculation
> >=20
> > Quoting Tom Hochstein (2023-10-02 18:36:44)
> > > The signature recalculation task can fail:
> > > ```
> > > /.../build/tmp/work/armv8a-poky-linux/libcamera/1_0.0.4-
> > r0/temp/run.do_recalculate_ipa_signatures_package.937421: line 154:
> > /.../build/tmp/work/armv8a-poky-linux/libcamera/1_0.0.4-
> > r0/git/src/ipa/ipa-sign-install.sh: No such file or directory
> > > ```
> > >
> > > This happens whenever ${S} is removed and packages are retrieved from
> > > sstate cache.
> > >
> > > Instead of trying to fix the task, avoid the issue altogether by
> > > performing the signature recalculation directly in do_package.
> >=20
> > Will this still happen after any calls to strip? (i.e. the binaries will
> > not be modified after this step?)
>=20
> Yes. The run.do_package script does have the recalculation call as the
> final line in the do_package function, which is after the call to
> split_and_strip.

That settles my worries then! - I'm not sure I'm expert enough on the
rest of the yocto syntax, but from libcamera perspective:

Acked-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

>=20
> >=20
> > --
> > Kieran
> >=20
> >=20
> > >
> > > Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
> > > ---
> > >  .../recipes-multimedia/libcamera/libcamera_0.1.0.bb        | 7 +++++=
--
> > >  1 file changed, 5 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/meta-multimedia/recipes-
> > multimedia/libcamera/libcamera_0.1.0.bb b/meta-multimedia/recipes-
> > multimedia/libcamera/libcamera_0.1.0.bb
> > > index ece1be6f3..2a3c6473e 100644
> > > --- a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.1.0.bb
> > > +++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.1.0.bb
> > > @@ -50,8 +50,11 @@ do_install:append() {
> > >      chrpath -d ${D}${libexecdir}/libcamera/v4l2-compat.so
> > >  }
> > >
> > > -addtask do_recalculate_ipa_signatures_package after do_package before
> > do_packagedata
> > > -do_recalculate_ipa_signatures_package() {
> > > +do_package:append() {
> > > +    bb.build.exec_func("do_package_recalculate_ipa_signatures", d)
> > > +}
> > > +
> > > +do_package_recalculate_ipa_signatures() {
> > >      local modules
> > >      for module in $(find ${PKGD}/usr/lib/libcamera -name "*.so.sign"=
); do
> > >          module=3D"${module%.sign}"
> > > --
> > > 2.25.1
> > >
> > >

