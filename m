Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
	[209.85.222.179])
	by mail.openembedded.org (Postfix) with ESMTP id 48B487F238
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Oct 2019 02:45:42 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id y189so21366953qkc.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2019 19:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=aT+rG/3UC6bpB3ESJn/gUEKcchrMvIf5JDsEuEqP6fw=;
	b=SIePc2i82O3/3hhSD2ZdcpG54Ynsag21eJrFtFUj/XcSflMgHefOuqZlvaX+USNfFm
	JCZ+zmfHHab0qcS2WzWdpn3H5+SQsbslBxusUKpoLXY2T4YeiBA4xvJMgMC7cqFSGHdi
	bvOKOJT4LUd2eba+yK42MY+oYSVZiIKtF95Nfa8BTdPiPy6sqWi0lvXLgQUxQhGigBsK
	WnsGjOX87ql2CzXxmmEdaX5dwZfEFB61jpTbnGe7lYYnsPbWZX2hShfnGTe/SsBtAJjv
	SoE6Z2IGqXhK3KCsYb+E5n3Crg4/FZyUYaYrkd0UqokwSqefVuWzXHedBYh7ockhOOoZ
	r5Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=aT+rG/3UC6bpB3ESJn/gUEKcchrMvIf5JDsEuEqP6fw=;
	b=pexCWhfqbPalNTAz3zjlmTev+cD+4qZpF4GC4/4Y9jx8BgJCBf/lI9H/K3Xp70oAj3
	npFXC3wd7zzyoSv2dJsmoWU9ye511vOmuBuJ8QouuYKUt8w8O5is7kZkOUL5lp1Sfw0A
	5BtkDGCZcZVdZAcoRNihSonM3nKJkNWowUQlwcSZO8QaGaKyZYUmvO7JPFiwvNpvXtfa
	DO6IzAR7/R6hdsmINpJmDReECwmTaXSt7yyJ0Xv3V5XDQ7JN+KREBGX929Au7UaKvMLu
	CV5TpwJp953gYoVosJFa8STV1lQDpSiQayLX/7b4phlMHGBAGfQs4NRpryq2cwGzO303
	GuGQ==
X-Gm-Message-State: APjAAAUslKfS5vMgbU/1o5EGtCDQyxqDlo35FH4F/+m//LR3Y5zoWM6n
	g3H2hF7m6GAp7XyBgQCszW8O/3Gk/cEfXdGGxYY=
X-Google-Smtp-Source: APXvYqx+19hOstfBgASt+p6k3zVrCSwr3ychpFfpqkH27cHPFw9FwmUof46s7n/q+9D8dj9y91kGUU3teFslGsWcBUQ=
X-Received: by 2002:a05:620a:14b9:: with SMTP id
	x25mr39312443qkj.9.1571193943617; 
	Tue, 15 Oct 2019 19:45:43 -0700 (PDT)
MIME-Version: 1.0
References: <20191014222047.22306-1-schnitzeltony@gmail.com>
	<20191015174854.GN16029@bill-the-cat>
	<CALbNGRSjsd2LJWKSKNOcC6cNiC+mZNA6EjpGi+u8UcdpDv3arQ@mail.gmail.com>
In-Reply-To: <CALbNGRSjsd2LJWKSKNOcC6cNiC+mZNA6EjpGi+u8UcdpDv3arQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 15 Oct 2019 19:45:32 -0700
Message-ID: <CAMKF1sp8KvvACfgujOUzBitKW2wD4f=aVtVZsxMMcwbrhYMkWw@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Tom Rini <trini@konsulko.com>, openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/2] pipewire: initial add 0.2.7
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
X-List-Received-Date: Wed, 16 Oct 2019 02:45:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Tom and Andreas

I think it will be good to converge the recipe if we want to host it in
meta-oe such that agl also is able to use it while Andreas has time
constraints can I ask Tom to look into delta that=E2=80=99s needed for it t=
o usable
with AGL as well ? Secondly it would be good to keep default packageconfig
to be common enough that covers normal case that Andreas has

On Wed, Oct 16, 2019 at 12:28 AM Andreas M=C3=BCller <schnitzeltony@gmail.c=
om>
wrote:

> On Tue, Oct 15, 2019 at 7:48 PM Tom Rini <trini@konsulko.com> wrote:
> >
> > On Tue, Oct 15, 2019 at 12:20:46AM +0200, Andreas M=C3=BCller wrote:
> >
> > > Have 0.2.4 in meta-qt5-extra as dependency for liri-shell. Soon it
> gets an
> > > optional dependency for mutter so move latest to meta-oe.
> > >
> > > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> > > ---
> > >  .../pipewire/pipewire_git.bb                  | 32
> +++++++++++++++++++
> > >  1 file changed, 32 insertions(+)
> > >  create mode 100644 meta-oe/recipes-multimedia/pipewire/
> pipewire_git.bb
> > >
> > > diff --git a/meta-oe/recipes-multimedia/pipewire/pipewire_git.bb
> b/meta-oe/recipes-multimedia/pipewire/pipewire_git.bb
> > > new file mode 100644
> > > index 000000000..9b9b64205
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-multimedia/pipewire/pipewire_git.bb
> > > @@ -0,0 +1,32 @@
> > > +SUMMARY =3D "Multimedia processing graphs"
> > > +HOMEPAGE =3D "http://pipewire.org/"
> > > +LICENSE =3D "LGPLv2.1"
> > > +LIC_FILES_CHKSUM =3D " \
> > > +    file://LICENSE;md5=3Dd8153c6e65986f862a0550ca74a3ed73 \
> > > +    file://LGPL;md5=3D2d5025d4aa3495befef8f17206a5b0a1 \
> > > +"
> > > +
> > > +inherit meson
> > > +
> > > +DEPENDS +=3D " \
> > > +    dbus \
> > > +    glib-2.0 \
> > > +    alsa-lib \
> > > +    v4l-utils \
> > > +    gstreamer1.0 \
> > > +    gstreamer1.0-plugins-base \
> > > +"
> > > +
> > > +SRC_URI =3D "git://github.com/PipeWire/pipewire.git"
> > > +PV =3D "0.2.7"
> > > +SRCREV =3D "14c11c0fe4d366bad4cfecdee97b6652ff9ed63d"
> > > +S =3D "${WORKDIR}/git"
> > > +
> > > +
> > > +FILES_${PN} +=3D " \
> > > +    ${systemd_user_unitdir} \
> > > +    ${libdir}/pipewire-0.2 \
> > > +    ${libdir}/spa \
> > > +    ${libdir}/gstreamer-1.0 \
> > > +"
> >
> > A few thoughts.  First, there's a lot of knobs that can be set, and it
> > might be a good idea to take a look at the recipe in AGL:
> >
> https://gerrit.automotivelinux.org/gerrit/gitweb?p=3DAGL/meta-agl-devel.g=
it;a=3Dtree;f=3Dmeta-pipewire/recipes-multimedia/pipewire;h=3D59d7d7bae1b0c=
072afbfe804857c0f7b4676766a;hb=3DHEAD
> Sorry but I do not have the resources to test all these knobs.
> Currently pipewire is yet another optional dependency for mutter on my
> way to gnome-desktop (which is already a challenge). Once I got there
> I can think of further 'optimizations'
>
> Cheers
>
> Andreas
> >
> > Second, it's worth keeping in mind for future updates that after v0.2.7
> > the license changed to MIT (and yes, I know LIC_FILES_CHKSUM will catch
> > this):
> > https://github.com/PipeWire/pipewire/blob/master/LICENSE
> >
> > --
> > Tom
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

