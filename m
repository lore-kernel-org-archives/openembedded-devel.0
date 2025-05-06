Return-Path: <f.pflug@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9BF8C3ABBC
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 06:06:22 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.69918.1746511573711720946
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 May 2025 23:06:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: f.pflug@pengutronix.de)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <f.pflug@pengutronix.de>)
	id 1uCBRT-0002qA-6r; Tue, 06 May 2025 08:06:11 +0200
Message-ID: <b748d150745bee22c0a1817119a7582e0bc39f2f.camel@pengutronix.de>
Subject: Re: [oe] [meta-python2][PATCH] layer.conf: update
 LAYERSERIES_COMPAT to scarthgap
From: Fabian Pflug <f.pflug@pengutronix.de>
To: ticotimo@gmail.com
Cc: Trevor Gamblin <tgamblin@baylibre.com>, 
	openembedded-devel@lists.openembedded.org
Date: Tue, 06 May 2025 08:06:10 +0200
In-Reply-To: <CANx9H-CpromEyc800E_eifb-XD553Yo74TiJygCrhk+40KKeFQ@mail.gmail.com>
References: <20250505150451.2675990-1-f.pflug@pengutronix.de>
	 <f79a78f5-0b9a-4f17-9ce8-9e48945db579@baylibre.com>
	 <a3a06f7205cb4aebbee8c045ed9a28fa57286052.camel@pengutronix.de>
	 <CANx9H-CpromEyc800E_eifb-XD553Yo74TiJygCrhk+40KKeFQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: f.pflug@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 May 2025 06:06:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117337

Then could you remove the CONTRIBUTING part from the README in meta-
python2? Or make it very clear inside this, that no patches will be
accepted?

currently it states:
Support by the above maintainer will end when Yocto Project 3.1 is
released in
approximately April 2020. Creation and maintainence of this layer is
entirely a volunteer
effort and the author has ZERO REASON to continue using or supporting
python2.

Which sounds like it would accept patches, but there is no active
development. Especially when there has been a commit 14 days ago.

On Mon, 2025-05-05 at 14:52 -0700, Tim Orling via
lists.openembedded.org wrote:
> I made it very clear this would not receive any continued support.
>=20
> On Mon, May 5, 2025 at 8:42=E2=80=AFAM Fabian Pflug via
> lists.openembedded.org
> <f.pflug=3Dpengutronix.de@lists.openembedded.org> wrote:
> > On Mon, 2025-05-05 at 11:13 -0400, Trevor Gamblin wrote:
> > >=20
> > > On 2025-05-05 11:04, Fabian Pflug via lists.openembedded.org
> > > wrote:
> > > > Layer is compatible with all version up till scarthgap.
> > >=20
> > > Do we really want to be making Python 2 recipes compatible with
> > > Scarthgap?
> > they already are. It is just not declared that way. My current
> > problem
> > is that meta-qt5 in scarthgap requires python2 for some of its
> > packages, so there is a need here for me to have it compatible.
> >=20
> > >=20
> > > It's been EOL since 2020.
> > that is why there is the meta-python2 repository and not part of
> > oe-
> > core
> >=20
> >=20
> > > >=20
> > > > Signed-off-by: Fabian Pflug <f.pflug@pengutronix.de>
> > > > ---
> > > > =C2=A0 conf/layer.conf | 2 +-
> > > > =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
> > > >=20
> > > > diff --git a/conf/layer.conf b/conf/layer.conf
> > > > index 38ef579..b1d9820 100644
> > > > --- a/conf/layer.conf
> > > > +++ b/conf/layer.conf
> > > > @@ -14,7 +14,7 @@ LAYERVERSION_meta-python2 =3D "1"
> > > > =C2=A0=20
> > > > =C2=A0 LAYERDEPENDS_meta-python2 =3D "core openembedded-layer"
> > > > =C2=A0=20
> > > > -LAYERSERIES_COMPAT_meta-python2 =3D "kirkstone"
> > > > +LAYERSERIES_COMPAT_meta-python2 =3D "kirkstone langdale
> > > > mickledore
> > > > nanbield scarthgap"
> > > > =C2=A0=20
> > > > =C2=A0 LICENSE_PATH +=3D "${LAYERDIR}/licenses"
> > > > =C2=A0=20
> > > >=20
> > > >=20
> > > >=20
> > >=20
> >=20
> >=20
> >=20
> >=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117332):
> https://lists.openembedded.org/g/openembedded-devel/message/117332
> Mute This Topic: https://lists.openembedded.org/mt/112631225/9783037
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-devel/unsub=C2=A0[
> f.pflug@pengutronix.de]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


