Return-Path: <dmkhn@proton.me>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9804C3ABD8
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 22:17:54 +0000 (UTC)
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by mx.groups.io with SMTP id smtpd.web10.54.1747261070341042983
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 May 2025 15:17:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@proton.me header.s=protonmail header.b=kK2W5as8;
 spf=pass (domain: proton.me, ip: 185.70.43.16, mailfrom: dmkhn@proton.me)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1747261068; x=1747520268;
	bh=V3ceWzd0fa6exI7CWQf5dG9b9uz7I2rw8KqIyldWOXk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=kK2W5as8M795sv1lHQ4Roofw2iiX2/EEoZMmetovGMIYrcK4BmzPe7NEnfEVes4zD
	 jygnaooUfozBZKm4WE53b5n6SMWcnShZNE1g1pDHZv+3MicuZUttpAx3P6TkSrU/Xf
	 NJFtLDv79TtMd2X+L4BDOWl5UTT0oIY0Qn8h9uOewUxBbytNI74DZzNvd6mkNvY7Ld
	 s9JdAyYAVyWFOjoU+DDlxKtfsnojkCIgzMbONqVe6+zJkJU9tLe6M0fHOXxt2gH/Ka
	 iLqsgIoxQfalmUUa+kcLgFpRN6VjaT9L/+if4Uq0pj8pr0mDOhW0AErzp1oAopMnkX
	 89jGh8G7IG1qQ==
Date: Wed, 14 May 2025 22:17:45 +0000
To: Khem Raj <raj.khem@gmail.com>
From: dmkhn@proton.me
Cc: openembedded-devel@lists.openembedded.org, Denis Mukhin <dmukhin@ford.com>
Subject: Re: [meta-oe][PATCH v2] dediprog-flasher: enable native builds
Message-ID: <aCUWh0n+7Vh9wJOt@kraken>
In-Reply-To: <CAMKF1sohNMruhcU=HUP=iPbZwoGgDbcRbDUewSNcVxE_NB_=VQ@mail.gmail.com>
References: <20250514212249.74664-1-dmukhin@ford.com> <CAMKF1sohNMruhcU=HUP=iPbZwoGgDbcRbDUewSNcVxE_NB_=VQ@mail.gmail.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: aff1343034607b5daa7991ffbb0bd9907cb15126
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 May 2025 22:17:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117420

On Wed, May 14, 2025 at 02:49:07PM -0700, Khem Raj wrote:
> On Wed, May 14, 2025 at 2:23=E2=80=AFPM <dmkhn@proton.me> wrote:
> >
> > From: Denis Mukhin <dmukhin@ford.com>
> >
> > Update dediprog-flasher recipe to support native class variants.
> >
> > Normally, the recipe comes with a USB udev rule. Do not package USB ude=
v rule
> > into nativesdk artifacts because this will pollute the host environment=
, which
> > is not desired.
> >
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > ---
> >  .../dediprog-flasher_1.14.20.bb               | 20 ++++++++++++++++---
> >  1 file changed, 17 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher_1.14=
.20.bb b/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher_1.14.20.bb
> > index 83a88ab75f..3d55b34a8d 100644
> > --- a/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher_1.14.20.bb
> > +++ b/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher_1.14.20.bb
> > @@ -12,18 +12,32 @@ SRC_URI =3D " \
> >      file://0002-Makefile-add-conditional-stripping.patch \
> >      "
> >
> > -EXTRA_OEMAKE =3D "NOSTRIP=3D1"
> > +EXTRA_OEMAKE =3D "NOSTRIP=3D1 DESTDIR=3D${D} PREFIX=3D${prefix}"
> >
> >  PV =3D "1.0+${SRCPV}"
> >
> >  S =3D "${WORKDIR}/git"
> >
> > -do_install () {
> > -    oe_runmake DESTDIR=3D${D} PREFIX=3D/usr install
> > +do_install() {
> > +    oe_runmake install
> > +}
> > +
> > +do_install:append:class-nativesdk() {
> > +    # QA override: omit packaging dediprog's udev rule under /etc/udev=
.
> > +    # The file redides outside the nativesdk ${prefix} and must not po=
llute the
>                           ^^^
> Typo

Thanks!

>=20
> > +    # host environment.
> > +    rm -rf ${D}/etc
> >  }
> >
> >  FILES:${PN} +=3D " \
> > +    ${bindir} \
> >      ${datadir}/DediProg \
> >  "
> >
> > +FILES:${PN}:append:class-target =3D " \
>=20
> I think we can do away with using target override here.

Oh, that's right, thank you!

>=20
> > +    ${sysconfdir}/udev \
> > +"
> > +
> >  inherit pkgconfig
> > +
> > +BBCLASSEXTEND +=3D " native nativesdk"
> > --
> > 2.34.1
> >
> >


