Return-Path: <jlu@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAC56C05027
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 06:52:51 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web11.68381.1674715963775569621
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Jan 2023 22:52:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: jlu@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1pKw7l-0000NY-Gn; Thu, 26 Jan 2023 07:52:41 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <jlu@pengutronix.de>)
	id 1pKw7l-000V3u-AG; Thu, 26 Jan 2023 07:52:40 +0100
Received: from localhost ([127.0.0.1])
	by ptz.office.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <jlu@pengutronix.de>)
	id 1pKw7j-00FxRN-H9; Thu, 26 Jan 2023 07:52:39 +0100
Message-ID: <d963f3446b9a6a5c2b0a48b48560676a566148b4.camel@pengutronix.de>
Subject: Re: [oe] [meta-oe][PATCH] softhsm: enable objectstore backend
From: Jan =?ISO-8859-1?Q?L=FCbbe?= <jlu@pengutronix.de>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Date: Thu, 26 Jan 2023 07:52:39 +0100
In-Reply-To: <CAMKF1spCW78kZiADbiurViZOyjA_Eyuv09XH050uimJc3kj3zg@mail.gmail.com>
References: <20230124131336.3877979-1-jlu@pengutronix.de>
	 <CAMKF1spCW78kZiADbiurViZOyjA_Eyuv09XH050uimJc3kj3zg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (by Flathub.org) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: jlu@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Jan 2023 06:52:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100781

On Wed, 2023-01-25 at 08:56 -0800, Khem Raj wrote:
> seeing a build failure
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/2389/st=
eps/15/logs/stdio

It is looking for the sqlite3 binary during configure:
https://github.com/opendnssec/SoftHSMv2/blob/2.6.1/m4/acx_sqlite3.m4#L12
This worked for me, as sqlite3 was leaking in from the host.

It doesn't actually use the binary though, from a quick look at least. What=
's
the better fix? DEPEND on sqlite3-native or remove the AC_PATH_PROGS check?

Thanks,
Jan

> On Tue, Jan 24, 2023 at 5:13 AM Jan Luebbe <jlu@pengutronix.de> wrote:
> >=20
> > We already depend on sqlite, but the objectstore backend using it is no=
t
> > enabled by default. Add the necessary configure option.
> >=20
> > The db backend is more robust when accessing the objectstore from many
> > parallel processes (such as during kernel module signing).
> >=20
> > Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
> > ---
> >  meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb b/meta-o=
e/recipes-security/softhsm/softhsm_2.6.1.bb
> > index d7bcd4f03bb2..1fded8df3dbb 100644
> > --- a/meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb
> > +++ b/meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb
> > @@ -11,6 +11,7 @@ SRC_URI[sha256sum] =3D "61249473054bcd1811519ef9a989a=
880a7bdcc36d317c9c25457fc614d
> >  inherit autotools pkgconfig siteinfo
> >=20
> >  EXTRA_OECONF +=3D " --with-sqlite3=3D${STAGING_DIR_HOST}/usr"
> > +EXTRA_OECONF +=3D " --with-objectstore-backend-db"
> >  EXTRA_OECONF +=3D "${@oe.utils.conditional('SITEINFO_BITS', '64', ' --=
enable-64bit', '', d)}"
> >=20
> >  PACKAGECONFIG ?=3D "ecc eddsa pk11 openssl"
> > --
> > 2.30.2
> >=20
> >=20
> >=20
> >=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#100780): https://lists.openembedded.org/g/openembedde=
d-devel/message/100780
> Mute This Topic: https://lists.openembedded.org/mt/96496618/2167243
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [j=
lu@pengutronix.de]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

