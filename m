Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web12.18015.1597160847374278197
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Aug 2020 08:47:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=bY2SCXJI;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=omdt=bv=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 4BQxzb0tksz2C;
	Tue, 11 Aug 2020 17:47:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1597160843;
	bh=bNsL7UQRFuqC/1y8RAweL7BBej67OSBgG7eF7W4mznc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bY2SCXJImPAOYBinS8q0/uixyxhle6w6AVU+NTfr2bF2BwxHVwhcFqr9fHhr5Wdb8
	 5/H8O9BMYqUZwXO1+vGViaAyFTyddtU4sSO0M4Q1IoOdFz7U9ZPzk5cjYwfznuWcYQ
	 rcBtJdHASeJpESdhcPNuq3TkdIdUPAViDCuFFT5qlc5RJqGpgbEHuMW7cFNPIpeyp1
	 sVYbAZM+DiEDPJjAdZe0sAjS+F6mwgcf2tXUmO5SE6957vr8NHLXW4/5kDsBrZVDSb
	 STu/UI8vA6fWJXtjgP5beZgJlPPwbAyF9h4156NXPZ3pAgKHX9hq5Ehv2ODTGH86tu
	 dQC9aeAEhPJazxmRuwLaLfKS7och8W1M+JWKmUPqieKS+ey+tcsg8ut8Rv6wnmRwFC
	 UMdqvV/VzuMkfj9AR6ocs74ZXuiYRhi3MgX3GLCDmgPYHra3+f+zG5PWC9r3MBVi5N
	 /xzjsT9s+Mnzm86+es7nGSYTagTp2gFTRmBcBTNClVOEbzadOxAPBK+HEaVy5mFcQ1
	 WkDCy+dL0WJYnOI0UzkZ0KYlRD0ZvOPZ3VO+0DoK7afW/pBdJiiLN9ks3cNBsU1gqd
	 PQ/cUp1SXutGz8pLK7HV0M/6tgndTHihq8wZQcE3FdDHFcRvDQ5F7MJbAHRfoKrHDI
	 DUA2YJ3OgHHzGBWABbj9Uk3I=
Date: Tue, 11 Aug 2020 18:47:21 +0300
From: "Adrian Bunk" <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH] libpeas: gobject-introspection is mandatory and cannot be configured
Message-ID: <20200811154721.GF7488@localhost>
References: <20200808125351.17467-1-bunk@stusta.de>
 <CAMKF1sq+=xDPy6mfM2cSb1eVruGe3bQjV8dATa3Eb8=bUVymfA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sq+=xDPy6mfM2cSb1eVruGe3bQjV8dATa3Eb8=bUVymfA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Aug 10, 2020 at 12:08:17PM -0700, Khem Raj wrote:
> On Sat, Aug 8, 2020 at 5:54 AM Adrian Bunk <bunk@stusta.de> wrote:
> >
> > ../libpeas-1.26.0/tests/libpeas/introspection/meson.build:47:0: ERROR: Unknown variable "libpeas_gir".
> >
> > Signed-off-by: Adrian Bunk <bunk@stusta.de>
> > ---
> >  meta-oe/recipes-gnome/libpeas/libpeas_1.26.0.bb | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/meta-oe/recipes-gnome/libpeas/libpeas_1.26.0.bb b/meta-oe/recipes-gnome/libpeas/libpeas_1.26.0.bb
> > index 881751008..1b754343a 100644
> > --- a/meta-oe/recipes-gnome/libpeas/libpeas_1.26.0.bb
> > +++ b/meta-oe/recipes-gnome/libpeas/libpeas_1.26.0.bb
> > @@ -10,6 +10,10 @@ GTKDOC_MESON_OPTION = "gtk_doc"
> >
> >  inherit gnomebase gobject-introspection gtk-doc gtk-icon-cache features_check
> >
> > +# gobject-introspection is mandatory and cannot be configured
> > +REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
> > +UNKNOWN_CONFIGURE_WHITELIST_append = " --enable-introspection --disable-introspection"
> 
> these are autotools options but since dunfell we use meson to build
> libpeas so I wonder how this is happening
> perhaps some bbappends need to catch up may be ?
>...

No, this was just me pasting from zeus without turning on my brain...

cu
Adrian
