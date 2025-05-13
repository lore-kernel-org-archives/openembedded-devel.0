Return-Path: <dmkhn@proton.me>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EC43C3ABC9
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 21:21:35 +0000 (UTC)
Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch [79.135.106.29])
 by mx.groups.io with SMTP id smtpd.web11.88125.1747171285915337292
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 May 2025 14:21:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@proton.me header.s=protonmail header.b=C9zQ9K/n;
 spf=pass (domain: proton.me, ip: 79.135.106.29, mailfrom: dmkhn@proton.me)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1747171282; x=1747430482;
	bh=nU5MY2BvBYxfHE6OdDN74+2eB0x8Ots2PGQHHqmTECA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=C9zQ9K/nD+6alw4ab6smn7i3+NKX+nOEPxzdwArkuDbAEPC/la5NHdbcz5Rx6RZSy
	 Hp4XXhnOEk7ApShxEN6XhbsLaS27d444EZf/8bSjJRll/RgY8DTX+OjYDJAy7/Nevc
	 6Cn4zy02Q/X4pqX2mDa4SQ+nxFX/cGRkbMUWNy2gF+QAt8IuFSviBUmzXEBFdmjLP5
	 JVlgea+nDpQRNh+etN6ImFOQ7Rzbwlw421euplejWwK5KqolXpBkYGom2LSCy1BsNb
	 1TdrNBvy04luG63jWcAgd5adm52zoNf4HpwZSnCUu0YKKbgb0ZIgeaE1gweY9qqFKC
	 7MTjRkqcIAEYQ==
Date: Tue, 13 May 2025 21:21:18 +0000
To: Khem Raj <raj.khem@gmail.com>
From: dmkhn@proton.me
Cc: openembedded-devel@lists.openembedded.org, tymoteusz.burak@3mdeb.com, Denis Mukhin <dmukhin@ford.com>
Subject: Re: [meta-oe][PATCH v1] dediprog-flasher: enable native builds
Message-ID: <aCO3yr77yzsKCylq@kraken>
In-Reply-To: <CAMKF1srPZJ7=AmVVyp6Y7b3AsJAy4jjqeV+iaOgApF0phXmOxA@mail.gmail.com>
References: <20250513060149.3971753-1-dmukhin@ford.com> <CAMKF1srPZJ7=AmVVyp6Y7b3AsJAy4jjqeV+iaOgApF0phXmOxA@mail.gmail.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 901033e2853cea14d30876f359d26df4d15ded43
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 May 2025 21:21:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117407

On Mon, May 12, 2025 at 11:40:18PM -0700, Khem Raj wrote:
> On Mon, May 12, 2025 at 11:04=E2=80=AFPM <dmkhn@proton.me> wrote:
> >
> > From: Denis Mukhin <dmukhin@ford.com>
> >
> > Update dediprog-flasher recipe to support native class variants.
> >
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > ---
> >  .../dediprog-flasher/dediprog-flasher_1.14.20.bb      | 11 ++++++++---
> >  1 file changed, 8 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher_1.14=
.20.bb b/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher_1.14.20.bb
> > index 83a88ab75f..4c6d6bf6f1 100644
> > --- a/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher_1.14.20.bb
> > +++ b/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher_1.14.20.bb
> > @@ -12,18 +12,23 @@ SRC_URI =3D " \
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
> >  }
> >
> > +# NB: /etc/udev/rules.d is packaged outside of ${prefix}
> >  FILES:${PN} +=3D " \
> > +    /etc/udev \
>=20
> Please use ${sysconfdir} here instead of hardcoding /etc

nativesdk variant of sysconfdir expands to something like:
    sysconfdir=3D"/usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-mys=
dk-linux/etc"
where
    prefix=3D"/usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-mysdk-l=
inux"

dediprog build installs USB udev rules into the host's environment
    /etc/udev/rules.d
i.e. packages udev rules outside of ${prefix}.
So in this case /etc/udev should be open-coded, which is not ideal.

I can expand the comment before FILES:${PN} to explain that better.
Will that work?

>=20
> > +    ${bindir} \
> >      ${datadir}/DediProg \
> >  "
> >
> >  inherit pkgconfig
> > +
> > +BBCLASSEXTEND =3D "native nativesdk"
> > --
> > 2.34.1
> >
> >


