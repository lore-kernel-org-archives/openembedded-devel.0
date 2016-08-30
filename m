Return-Path: <martin.jansa@gmail.com>
Received: from mail-lf0-f49.google.com (mail-lf0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id 5022460107
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Aug 2016 08:28:43 +0000 (UTC)
Received: by mail-lf0-f49.google.com with SMTP id l89so8171033lfi.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Aug 2016 01:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=TaVnKEw+mZHvQ+V0P6Cs3b1p/qgQRk83FaFZqV7Ukas=;
	b=cs7O+yaowtqZeYO1Eu1Q3J8eWEPhSa9h15YCgZmxziTLVcgIP9A2Qd4+6DAqre/D2B
	VLMlCNaFUXNYEwIFMWvvAEYt2a7sj9sMTdJaWhZBXqvCUo1/N1q/CE23IhM4w+qpTb3N
	bJVb6LNGF0sOhDbx+gdxlYn9b0gHfpm+kOEZMahNyTnehBFL46X/T5b0+EBfhlO7ryKH
	rf/Cjv4LetjvGadqzN7LW6RmqNGwNCJaldSulOTN3WnwSKRXphIlkhlyo3XRsiTHFB05
	VC8YUdBvzHlYfwR2Cpy+c4nBFiWoXz4XLzWjELelWdr6DX1APtsgBHN72zu8OShlZ11+
	PQcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=TaVnKEw+mZHvQ+V0P6Cs3b1p/qgQRk83FaFZqV7Ukas=;
	b=lSbv/YF5OmyzcTgPvYd5rn96kcVqHiwivuy+IYZh//V76OwU75X1zgvFwPFXfPwWER
	55t+cZZ+20UMPVp+SH1kvFNHkzKsnwgaifIb/5B0u55HMlV4/ecjqRA2kwTTYhRovJmk
	7f3k4g3TnzP5lDQJKWqtuUO+QOHc33Ijfx6GUUlXIaBmamFAJh2LhPSZP3ZpYkbnBaJz
	RnKJc/KdR1wZCuDssaoYfEsnWuDNwwmwD0dcxv8Hrv6s8K6y4i9vEW2M80ekCRXBNEXM
	PzcjTmaYHAq7NZI4v8ocQfjsmjKnHWbYeCQk/PBFMJm6bST6/YW7fb1+szDPVYZPmrin
	Avfw==
X-Gm-Message-State: AE9vXwNTJ2cZWMJkySSKdoyOXuMF0IvOUlqLzUMtNWYD1oK5yMWSBwd5JRiSv9ZKhydZRKHlWXfd704sp9pPNg==
X-Received: by 10.25.1.213 with SMTP id 204mr704759lfb.114.1472545723073; Tue,
	30 Aug 2016 01:28:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.87.12 with HTTP; Tue, 30 Aug 2016 01:28:42 -0700 (PDT)
In-Reply-To: <CALbNGRQ=PeJhSCj7uGd2Lgkx6MPZ8numfrLezWxH12x_1fSkOQ@mail.gmail.com>
References: <20160829205253.17988-1-Martin.Jansa@gmail.com>
	<CALbNGRQ=PeJhSCj7uGd2Lgkx6MPZ8numfrLezWxH12x_1fSkOQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 30 Aug 2016 10:28:42 +0200
Message-ID: <CA+chaQfp56r5TtypUDh3Kxhi6r3_BeV9WXqpeU1Y1dJb6QR9+g@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] geany-plugins: include GPLv3 in the main LICENSE
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
X-List-Received-Date: Tue, 30 Aug 2016 08:28:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

The warning is right in what it says.

The LICENSE variable now needs to contain all LICENSEs used in the recipe
(all packages), see discussion on oe-core ML.

On Tue, Aug 30, 2016 at 10:24 AM, Andreas M=C3=BCller <
schnitzeltony@googlemail.com> wrote:

> On Mon, Aug 29, 2016 at 10:52 PM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> > * since last changes in oe-core LICENSE variable needs to list all
> licenses used
> >   by individual packages otherwise bitbake warning like this is shown:
> >   WARNING: meta-openembedded/meta-oe/recipes-devtools/geany/geany-
> plugins_1.27.bb: LICENSE_geany-plugins-commander includes licenses
> (GPLv3) that are not listed in LICENSE
> >   as possible improvement you can set LICENSE to GPLv2 to all plugins
> >   which are GPLv2-only, because now they will "inherit" both GPLv2 &
> >   GPLv3 which sucks as described here:
> >   https://www.mail-archive.com/openembedded-core@lists.
> openembedded.org/msg81645.html
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta-oe/recipes-devtools/geany/geany-plugins_1.27.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-oe/recipes-devtools/geany/geany-plugins_1.27.bb
> b/meta-oe/recipes-devtools/geany/geany-plugins_1.27.bb
> > index 9a39150..5e1e721 100644
> > --- a/meta-oe/recipes-devtools/geany/geany-plugins_1.27.bb
> > +++ b/meta-oe/recipes-devtools/geany/geany-plugins_1.27.bb
> > @@ -1,7 +1,7 @@
> >  DESCRIPTION =3D "A fast and lightweight IDE"
> >  HOMEPAGE =3D "http://plugins.geany.org/"
> >  # majority's default
> > -LICENSE =3D "GPLv2"
> > +LICENSE =3D "GPLv2 & GPLv3"
> >
> >  DEPENDS =3D "geany lua libxml2 libsoup-2.4 vte enchant intltool-native
> libassuan gpgme"
> >
> > --
> > 2.9.2
> >
> NAK: The warning is wrong see recipe below contains
>
> LICENSE_${PN}-commander =3D "GPLv3"
>
> Andreas
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

