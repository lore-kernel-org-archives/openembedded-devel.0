Return-Path: <alexander.stein@ew.tq-group.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C3EBC77B75
	for <webhook@archiver.kernel.org>; Tue, 23 May 2023 13:16:00 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by mx.groups.io with SMTP id smtpd.web10.22139.1684847758267229396
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 May 2023 06:15:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@tq-group.com header.s=key1 header.b=PE4jYasn;
 spf=pass (domain: ew.tq-group.com, ip: 93.104.207.81, mailfrom: alexander.stein@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1684847758; x=1716383758;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=lZg/SsBkz6B1F/+T7mifZhHbAOxWwj7oiq3A12eRd0Q=;
  b=PE4jYasnu9eM5fuymLf1/O3/XqGvClNfitWWQr1TNEzc6YJFeB1gXiWl
   Rz5pBTEeBapfTsALa0uYuxk9ddOVWETprNJcta7mXwa6b3KxStcBMtcha
   XnuEcU/D3LLL/L3b+6kVareIHGR1u7ibHQ4Y8W2RZCRfSwR2uOkzrc5SD
   WJNUe94SICcH43Vutx6bcoIx8hLG/AAS0sejw/sNg7p+w0LNfcUSYMP7K
   EQxuW0kEuEEnE/dAoQwhwG7vCjL12YpBv5ov17rwbywSoaiougpLuqSOR
   Qia9EnCpYHEJMEAe5kyfRu6LfEwu6zrhInp8e/1ZRmjK22ZF4lGH3cyJb
   g==;
X-IronPort-AV: E=Sophos;i="6.00,186,1681164000"; 
   d="scan'208";a="31049141"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 23 May 2023 15:15:56 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 23 May 2023 15:15:56 +0200
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Tue, 23 May 2023 15:15:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1684847756; x=1716383756;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=lZg/SsBkz6B1F/+T7mifZhHbAOxWwj7oiq3A12eRd0Q=;
  b=M53IaBgX2CdBgAbShZXsTkbhBUajsJoH3TV2kG3xUlw6Qr/0+sRym5lT
   yN4iuIUhEE6WgUd+q7tms2fdv5viOZzsFRG21//vfIJ9RxRlDgtcwvnfX
   54hBTJjbxEQdSNiNKJ2ApdNJ09Gm4LtOaISzuEWi5UmEkzma2/hMz9hXt
   ehj1+OcqYDztYBvpEVxo3DE9vTL26oY1G5zGpm/i2LmNRtm9I7CNCPAVq
   DbpUK45Nr4kOMV9zic2W9NiFpfjltuzzHGCzS0zqRM7HRkDAvbKuK38++
   1K5TK8PQzSxWoDKw/vf1juo0MVXC3tPxwstwukyXPl5o5KRNAZZyx1AvG
   Q==;
X-IronPort-AV: E=Sophos;i="6.00,186,1681164000"; 
   d="scan'208";a="31049140"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 23 May 2023 15:15:56 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 3A0D1280082;
	Tue, 23 May 2023 15:15:56 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: openembedded-devel@lists.openembedded.org, Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [[oe] [meta-oe] 1/1] libcamera: Allow overwriting default pipelines and IPA
Date: Tue, 23 May 2023 15:15:55 +0200
Message-ID: <2146662.irdbgypaU6@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <168432525509.3378917.14773482271941853163@Monstersaurus>
References: <20230517082759.1289294-1-alexander.stein@ew.tq-group.com> <168432525509.3378917.14773482271941853163@Monstersaurus>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 May 2023 13:16:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102738

Hi Kieran,

Am Mittwoch, 17. Mai 2023, 14:07:35 CEST schrieb Kieran Bingham:
> Hi Alex,
>=20
> Quoting Alexander Stein (2023-05-17 09:27:59)
>=20
> > By default only uvcvideo, simple and vimc pipelines as well as vimc IPA
> > are built. Add new variables for enabling a custom set of enabled
> > pipelines and IPAs.
> >=20
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> > An example is the 'rkips1' pipeline and IPA.
> >=20
> >  .../recipes-multimedia/libcamera/libcamera_0.0.5.bb        | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >=20
> > diff --git
> > a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.0.5.bb
> > b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.0.5.bb index
> > 14a20b431..47da0ec61 100644
> > --- a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.0.5.bb
> > +++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.0.5.bb
> > @@ -26,9 +26,12 @@ PACKAGES =3D+ "${PN}-gst"
> >=20
> >  PACKAGECONFIG ??=3D ""
> >  PACKAGECONFIG[gst] =3D
> >  "-Dgstreamer=3Denabled,-Dgstreamer=3Ddisabled,gstreamer1.0
> >  gstreamer1.0-plugins-base">=20
> > +LIBCAMERA_PIPELINES ??=3D "uvcvideo,simple,vimc"
> > +LIBCAMERA_IPAS ??=3D "vimc"
>=20
> Could you test with LIBCAMERA_PIPELINES ??=3D "auto" please? That should
> give an appropriate selection based on the architecture. But it may
> depend on the correct architecture being conveyed through the meson
> cross files.

That seems to work as well. Using "-Dpipelines=3Dauto" and "Dipas" removed,=
 I=20
get the following lines in log.do_configure:

>   Configuration
>  =20
>     IPA modules signed with  : gnutls
>     Enabled pipelines        : imx8-isi
>    =20
>                                rkisp1
>                                rpi/vc4
>                                simple
>                                uvcvideo
>    =20
>     Enabled IPA modules      : rkisp1
>    =20
>                                rpi/vc4

This seems a good default for an aarch64 platform.

> > +
> >=20
> >  EXTRA_OEMESON =3D " \
> >=20
> > -    -Dpipelines=3Duvcvideo,simple,vimc \
> > -    -Dipas=3Dvimc \
> > +    -Dpipelines=3D${LIBCAMERA_PIPELINES} \
> > +    -Dipas=3D${LIBCAMERA_IPAS} \
>=20
> I think you should probably remove the -Dipas option too and let that be
> selected automatically by the pipelines choice.

That's true as well (see above), but I still would like to disable unneeded=
,=20
unwanted IPAs or pipelines. If I read the meson code correctly an IPA is on=
ly=20
enabled if a corresponding pipeline is enabled as well, right?

Thanks
Alexander

> --
> Kieran
>=20
> >      -Dv4l2=3Dtrue \
> >      -Dcam=3Denabled \
> >      -Dlc-compliance=3Ddisabled \


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



