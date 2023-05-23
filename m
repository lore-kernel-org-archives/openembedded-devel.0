Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31C1FC7EE26
	for <webhook@archiver.kernel.org>; Tue, 23 May 2023 15:19:27 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
 by mx.groups.io with SMTP id smtpd.web10.25012.1684853040768851364
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 May 2023 07:44:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ideasonboard.com header.s=mail header.b=NKtFRpXR;
 spf=pass (domain: ideasonboard.com, ip: 213.167.242.64, mailfrom: kieran.bingham@ideasonboard.com)
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3F75E496;
	Tue, 23 May 2023 16:43:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1684853022;
	bh=MUsSoOYxO8/TJi8g21L4IorHOnHPtTHkKo5zuzaz1a0=;
	h=In-Reply-To:References:Subject:From:To:Date:From;
	b=NKtFRpXR19wr9vy2IhiM8t/6r6e4B3lnYJsjPXVvU9HfOO0SlHcljJby7/dZH4+Qu
	 5W2eFy4FoV0UEwlfOVGbMGGsvLmwAb5k72gYllIgruU1aDHIfAVuW55zpa7teet3CL
	 eXCSuUlrUQHjqYZRDuS7IaO6tEaN2KjDS30A2tOM=
MIME-Version: 1.0
In-Reply-To: <2146662.irdbgypaU6@steina-w>
References: <20230517082759.1289294-1-alexander.stein@ew.tq-group.com> <168432525509.3378917.14773482271941853163@Monstersaurus> <2146662.irdbgypaU6@steina-w>
Subject: Re: [[oe] [meta-oe] 1/1] libcamera: Allow overwriting default pipelines and IPA
From: "Kieran Bingham" <kieran.bingham@ideasonboard.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>, openembedded-devel@lists.openembedded.org
Date: Tue, 23 May 2023 15:43:55 +0100
Message-ID: <168485303519.2931851.7244682223427714089@Monstersaurus>
User-Agent: alot/0.10
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 May 2023 15:19:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102740

Hi Alexander,

Quoting Alexander Stein (2023-05-23 14:15:55)
> Hi Kieran,
>=20
> Am Mittwoch, 17. Mai 2023, 14:07:35 CEST schrieb Kieran Bingham:
> > Hi Alex,
> >=20
> > Quoting Alexander Stein (2023-05-17 09:27:59)
> >=20
> > > By default only uvcvideo, simple and vimc pipelines as well as vimc I=
PA
> > > are built. Add new variables for enabling a custom set of enabled
> > > pipelines and IPAs.
> > >=20
> > > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > ---
> > > An example is the 'rkips1' pipeline and IPA.
> > >=20
> > >  .../recipes-multimedia/libcamera/libcamera_0.0.5.bb        | 7 +++++=
--
> > >  1 file changed, 5 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git
> > > a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.0.5.bb
> > > b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.0.5.bb ind=
ex
> > > 14a20b431..47da0ec61 100644
> > > --- a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.0.5.bb
> > > +++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.0.5.bb
> > > @@ -26,9 +26,12 @@ PACKAGES =3D+ "${PN}-gst"
> > >=20
> > >  PACKAGECONFIG ??=3D ""
> > >  PACKAGECONFIG[gst] =3D
> > >  "-Dgstreamer=3Denabled,-Dgstreamer=3Ddisabled,gstreamer1.0
> > >  gstreamer1.0-plugins-base">=20
> > > +LIBCAMERA_PIPELINES ??=3D "uvcvideo,simple,vimc"
> > > +LIBCAMERA_IPAS ??=3D "vimc"
> >=20
> > Could you test with LIBCAMERA_PIPELINES ??=3D "auto" please? That should
> > give an appropriate selection based on the architecture. But it may
> > depend on the correct architecture being conveyed through the meson
> > cross files.
>=20
> That seems to work as well. Using "-Dpipelines=3Dauto" and "Dipas" remove=
d, I=20
> get the following lines in log.do_configure:
>=20
> >   Configuration
> >  =20
> >     IPA modules signed with  : gnutls
> >     Enabled pipelines        : imx8-isi
> >    =20
> >                                rkisp1
> >                                rpi/vc4
> >                                simple
> >                                uvcvideo
> >    =20
> >     Enabled IPA modules      : rkisp1
> >    =20
> >                                rpi/vc4
>=20
> This seems a good default for an aarch64 platform.
>=20
> > > +
> > >=20
> > >  EXTRA_OEMESON =3D " \
> > >=20
> > > -    -Dpipelines=3Duvcvideo,simple,vimc \
> > > -    -Dipas=3Dvimc \
> > > +    -Dpipelines=3D${LIBCAMERA_PIPELINES} \
> > > +    -Dipas=3D${LIBCAMERA_IPAS} \
> >=20
> > I think you should probably remove the -Dipas option too and let that be
> > selected automatically by the pipelines choice.
>=20
> That's true as well (see above), but I still would like to disable unneed=
ed,=20
> unwanted IPAs or pipelines. If I read the meson code correctly an IPA is =
only=20
> enabled if a corresponding pipeline is enabled as well, right?

Correct. Only IPA's with a corresponding Pipeline handler enabled will be b=
uilt.
And with auto - that will match the target architecture + UVC.

--
Kieran

