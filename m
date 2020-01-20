Return-Path: <ticotimo@gmail.com>
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id E27A77F93F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jan 2020 15:52:27 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id f5so27607191ilq.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jan 2020 07:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=S8Sj4cdDog8rk/f063zEHoJYsqTRvl7sGVrAi87MsF0=;
	b=qg7Z117PmgNLKR48dZy9q5DJ5J/Injn13hfNHhwMWSh/4Lty6qvOujiTCn2DGNEVrA
	PufuJYey7pVlSpIUXCaaDeeSrvzWTbgjlLyYH0Tace20XFYotPMDa+OwhIigIMFm/uPV
	P7WaVSD4Z19KaFHAFSJS/j52q2451y41r0eeQKk5Ea57uNldVOzG84IWXQNj0y7iONXT
	VszAT+biKMPuhefGwQraptjcqEojfk+yrSdCDMCQExRSVqnPdWiKTsWpUIMDp2LFx1OA
	owVv2ohEKMCw2VRgAjFw1jeVidwRndrwaO1NxrxCcteylugJhHpCJjdNlFwDj0toTARP
	BFWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=S8Sj4cdDog8rk/f063zEHoJYsqTRvl7sGVrAi87MsF0=;
	b=ix7fZAMqVZov3pbC5W2kMvkhvN33EBICuSKzLUuJWcAnVDeTuCGJkf38aqDu3n1OKA
	d1njE6oHCJclUxIG1CwMy9aH8KG+9iMx+Xc3kvAjRgDJYRY01d6vhYn1rlh8vcUht9JD
	U58yOw1dpenElw0lqBi8XL12/IIqcx9vT1iP13E/EUS00Dn3sFpmUn053o7avgSMTckL
	xZJz9oel5P9/hiWhQHEVwdzWP851z3sRHBky8H2BfnHot0rpHTIcE39eUM/XJExp8+qh
	l1yWvuZuGgYasNwJKcbyblmhRUxxMaOEfCIDLp4aF2qy/3ORDcEFxFcKQvnSOQt5c7Et
	ASjQ==
X-Gm-Message-State: APjAAAV3wtYWALTCPsYzGgsQ5yKT3G7b2hObc40/TF9bDoEHme8hkol6
	QAxBkJtXGzonbn6x09t51/nLuG2+LuE44SgG+mvq9Acq
X-Google-Smtp-Source: APXvYqx7LteH07nciA7QRmrciJf7Py7eXeNP4aCkt1g0SaMdSXNk9ZcQfnTyL9aiGGxY83nqVdKEhnXWR4+6/cp1vTM=
X-Received: by 2002:a92:911b:: with SMTP id t27mr11330738ild.142.1579535548769;
	Mon, 20 Jan 2020 07:52:28 -0800 (PST)
MIME-Version: 1.0
References: <20200119232403.12871-1-ticotimo@gmail.com>
	<2c54d8cc9d1e1763e0f4d17b72c55a3bc995ed6a.camel@andred.net>
In-Reply-To: <2c54d8cc9d1e1763e0f4d17b72c55a3bc995ed6a.camel@andred.net>
From: Tim Orling <ticotimo@gmail.com>
Date: Mon, 20 Jan 2020 07:52:17 -0800
Message-ID: <CANx9H-BhtqWsifCy0vuLQWF029is4+2ZjUsmGi34a6PTe8yhFg@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-python2][PATCH] python-beautifulsoup4: fix target RDEPENDS
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 20 Jan 2020 15:52:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 20, 2020 at 2:29 AM Andr=C3=A9 Draszik <git@andred.net> wrote:

> On Sun, 2020-01-19 at 15:24 -0800, Tim Orling wrote:
> > * target has run-time dependencies on:
> >   - python-html
> >   - python-logging
>
> Any reason -native doesn't depend on those?


These are part of the package splitting OE does for python. They are
normally part of a full python installation in distros that don=E2=80=99t c=
are
about space. For python-native environment, there is no package splitting
and these would not exist as -native variants.

>
>
> > Unexpectedly, class-target +=3D override is wiping out
> > RDEPENDS_${PN}, so explicitly add the rest of the
> > run-time dependencies (python-html5lib, python-lxml,
> > python-soupsieve).
>
> This is expected, you should instead do:
>
> RDEPENDS_${PN}_append_class-target =3D "\
>     ${PYTHON_PN}-html \
>     ${PYTHON_PN}-logging"
>

Facepalm. I had tried it with append after class-target, which clearly
doesn=E2=80=99t work and my brain was getting tired. I=E2=80=99ll clean it =
up today. Thank
you for the catch.

So as to avoid duplication and having to maintain two distinct lists.
>
> Cheers,
> Andre'
>
>
> >
> > Signed-off-by: Tim Orling <ticotimo@gmail.com>
> > ---
> >  recipes-devtools/python/python-beautifulsoup4_4.8.1.bb | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/recipes-devtools/python/python-beautifulsoup4_4.8.1.bb
> b/recipes-devtools/python/python-
> > beautifulsoup4_4.8.1.bb
> > index 86482714..8ac9c8c5 100644
> > --- a/recipes-devtools/python/python-beautifulsoup4_4.8.1.bb
> > +++ b/recipes-devtools/python/python-beautifulsoup4_4.8.1.bb
> > @@ -19,4 +19,14 @@ RDEPENDS_${PN} =3D "\
> >      ${PYTHON_PN}-soupsieve \
> >
> > +# class override, which is not
> > +# inheriting from above (FIXME?)
> > +RDEPENDS_${PN}_class-target +=3D "\
> > +    ${PYTHON_PN}-html \
> > +    ${PYTHON_PN}-html5lib \
> > +    ${PYTHON_PN}-logging \
> > +    ${PYTHON_PN}-lxml \
> > +    ${PYTHON_PN}-soupsieve \
> > +"
> > +
> >  BBCLASSEXTEND =3D "native nativesdk"
> > --
> > 2.25.0
> >
>
>

