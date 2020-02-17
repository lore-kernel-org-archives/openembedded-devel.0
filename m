Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5BD7B613FD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2020 07:47:12 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id v2so15378663qkj.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Feb 2020 23:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=1nY1sSm9zMXlvvDfJ2QzW8RgyuTcW8jPFwZSbEAh290=;
	b=TN+aVvXbyi7SOCNbz2IiALrUQpju4n1iCZ/Q/mhNtVH9RAGdBTk3I7HOktHRazt3SZ
	ySRM/Kn2jwM2jssnhlqwLpTSjMr89N11l03EQ73o5xrXd9LmucdLQlFgGhptuOIdZH2u
	h+S5b3wodznMvO29ieRkF0rsrYvN6KJ4dCTDU/JftFXPTdisuYIAo22Pd2dha0bMFkN9
	AAfpBohMYHkMuXLhoFkoNKp7OCXncal/5cyjr9YpYbZ2LlaKBDiRL+6ikGRyW0pFJmJr
	uEjvWgjD36xJSGCFVCdVX3XIr/hxuIS9QIF8NEwGt/cAa9e/V4FOuQdJs80D4l7rV+ZU
	lVJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=1nY1sSm9zMXlvvDfJ2QzW8RgyuTcW8jPFwZSbEAh290=;
	b=OkkDhU30o67/6oQgEN9nIvovKOjEQ9zWZ1Ec/pJWtbqG1K4EPtXn0/Y0N7B7a5JA6M
	D+CuYsOCB7jdbcbV2ADN4S/+NtoGbMLYw9WrGpqbIU7kuLmnVyFyl4jRGdL23nY3MnXy
	QB1qgz1VUW+gKC9ZcEKck2ToWWKYWRL7docWQ0DCTdl318QcOuS53iuuZ8UETjB4oie3
	Y7okfG8qTwuHh99SLtZCgWSdYiUaU2j1C8lBJb2+oKR3gdoIOAbLqkBtpv6AtXh3u+56
	ndI7JbERg2e6Hqj/FUHFykJlRBqHNbyH6RJfp5MgycwRC4+KhaG8ajGBaJIgJAhfVaTP
	536Q==
X-Gm-Message-State: APjAAAUUks4IY1KQpkcM+vI37kfD7VCCm3O1cnflCBid72nHo1kr94QV
	q05l2t5qqpPHuuJNNa111NPqRRPZIrPad80Fa0I=
X-Google-Smtp-Source: APXvYqzNzgOhKBiLDTAgq9bMUp+5sO/8MNCKOAVG6voRtojfimNQRRopjzdvKkQbyTb0KGkMcy96MGAeS4HOAuKzbU4=
X-Received: by 2002:ae9:ef96:: with SMTP id
	d144mr13244607qkg.337.1581925632889; 
	Sun, 16 Feb 2020 23:47:12 -0800 (PST)
MIME-Version: 1.0
References: <20200217024304.1131392-1-raj.khem@gmail.com>
	<20200217024304.1131392-7-raj.khem@gmail.com>
	<CALbNGRSzRB6zjQO0NBTU5D85+t-BEQuYL27CmHJFJtzGt_sGsg@mail.gmail.com>
In-Reply-To: <CALbNGRSzRB6zjQO0NBTU5D85+t-BEQuYL27CmHJFJtzGt_sGsg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 16 Feb 2020 23:46:46 -0800
Message-ID: <CAMKF1srBT++6xgJ89JF27T4XFAzdoE3OG2==5BYBX2EnBneaAw@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-gnome][PATCH 7/7] gimp: Depend on libexecinfo for musl
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
X-List-Received-Date: Mon, 17 Feb 2020 07:47:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 16, 2020 at 9:55 PM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> On Mon, Feb 17, 2020 at 3:43 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > musl does not have internal backtrace implementation like glibc
> > but we can use external library
>
> Sound reasonable and does not affect non musl.
>
> BTW: Old email address still works but the email address changed form
> 'googlemail' to 'gmail'.

Thanks for info.
perhaps update them in README of layers in meta-openembedded as well.

>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Cc: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> > ---
> >  meta-gnome/recipes-gimp/gimp/gimp_2.10.14.bb | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta-gnome/recipes-gimp/gimp/gimp_2.10.14.bb b/meta-gnome/=
recipes-gimp/gimp/gimp_2.10.14.bb
> > index 045958d0a6..30f0579e2d 100644
> > --- a/meta-gnome/recipes-gimp/gimp/gimp_2.10.14.bb
> > +++ b/meta-gnome/recipes-gimp/gimp/gimp_2.10.14.bb
> > @@ -29,6 +29,7 @@ DEPENDS =3D " \
> >      libmng \
> >      ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libxmu libxpm', ''=
, d)} \
> >  "
> > +DEPENDS_append_libc-musl =3D " libexecinfo"
> >
> >  inherit features_check gnomebase gtk-icon-cache gtk-doc mime-xdg
> >
> > --
> > 2.25.0
> >

