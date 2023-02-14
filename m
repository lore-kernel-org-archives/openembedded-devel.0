Return-Path: <jlu@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0061FC05027
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 14:43:54 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web11.8532.1676385832198565062
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Feb 2023 06:43:53 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: jlu@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1pRwX8-0000bq-Bp; Tue, 14 Feb 2023 15:43:50 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <jlu@pengutronix.de>)
	id 1pRwX5-004u5D-Or; Tue, 14 Feb 2023 15:43:48 +0100
Received: from localhost ([127.0.0.1])
	by ptz.office.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <jlu@pengutronix.de>)
	id 1pRwX5-003V06-Rm; Tue, 14 Feb 2023 15:43:47 +0100
Message-ID: <5cb5977b346827a6c71be6b9d0a2d589c25d7eee.camel@pengutronix.de>
Subject: Re: [yocto] [oe] [meta-oe][PATCH 1/2] smemstat: add recipe
From: Jan =?ISO-8859-1?Q?L=FCbbe?= <jlu@pengutronix.de>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, yocto@pengutronix.de
Date: Tue, 14 Feb 2023 15:43:47 +0100
In-Reply-To: <CA+chaQekd6nXV_CXHHJCBZK6QCMc-MYd+L4nutS52yk6SCyUgA@mail.gmail.com>
References: <20230214131349.1685229-1-jlu@pengutronix.de>
	 <CA+chaQekd6nXV_CXHHJCBZK6QCMc-MYd+L4nutS52yk6SCyUgA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (by Flathub.org) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: jlu@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Feb 2023 14:43:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101075

On Tue, 2023-02-14 at 14:33 +0100, Martin Jansa wrote:
> FWIW: this was in meta-luneos for a while:
> https://github.com/webOS-ports/meta-webos-ports/blob/master/meta-luneos/r=
ecipes-devtools/smemstat/smemstat_git.bb
>=20
> since=C2=A0
> https://github.com/webOS-ports/meta-webos-ports/commit/9c73ce110a6cd97a47=
6c6be
> ff10f9d8648cffea6

Ah, I could probably pick the install via make DESTDIR=3D${D}.

> I didn't compare the output from your version, but does it set the VERSIO=
N
> correctly now?

It seems to work:
root@qemux86-64:~# smemstat -h
smemstat, version 0.02.11
...

Regards,
Jan

> Regards,
>=20
> On Tue, Feb 14, 2023 at 2:14 PM Jan Luebbe <jlu@pengutronix.de> wrote:
> > This is useful to see which processes use physical memory.
> >=20
> > Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
> > ---
> > =C2=A0.../smemstat/smemstat_0.02.11.bb=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 27 +++++++++++++++++++
> > =C2=A01 file changed, 27 insertions(+)
> > =C2=A0create mode 100644 meta-oe/recipes-devtools/smemstat/smemstat_0.0=
2.11.bb
> >=20
> > diff --git a/meta-oe/recipes-devtools/smemstat/smemstat_0.02.11.bb b/me=
ta-
> > oe/recipes-devtools/smemstat/smemstat_0.02.11.bb
> > new file mode 100644
> > index 000000000000..37015ce6bdc1
> > --- /dev/null
> > +++ b/meta-oe/recipes-devtools/smemstat/smemstat_0.02.11.bb
> > @@ -0,0 +1,27 @@
> > +SUMMARY =3D "smemstat reports the physical memory usage taking into
> > consideration shared memory"
> > +HOMEPAGE =3D "https://github.com/ColinIanKing/smemstat"
> > +LICENSE =3D "GPL-2.0-or-later"
> > +
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4=
a4263"
> > +
> > +DEPENDS =3D "ncurses"
> > +
> > +SRC_URI =3D
> > "git://github.com/ColinIanKing/smemstat.git;protocol=3Dhttps;branch=3Dm=
aster"
> > +SRCREV =3D "9eea7504ab33783d804c4ed9237e299effb68874"
> > +
> > +S =3D "${WORKDIR}/git"
> > +
> > +do_configure () {
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0:
> > +}
> > +
> > +do_compile () {
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake
> > +}
> > +
> > +do_install () {
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d -m 755 ${D}${sbindir}
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 755 ${B}/smemstat ${D}${sbindir}=
/
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d -m 755 ${D}${mandir}/man8
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 644 ${S}/smemstat.8 ${D}${mandir=
}/man8/
> > +}

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

