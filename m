Return-Path: <brgl@bgdev.pl>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 26F2D7FC9C
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 15:01:01 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id u7so15064069iop.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Dec 2019 07:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:cc
	:content-transfer-encoding;
	bh=OelpblnDtDPFg37q1huwwdR3Yo0c7IaEVZiyhoDl2og=;
	b=gpGk0MP5gK9hE1nWMjsNmAGXx5UCedUjqcPIrSyNkRlu825MNOrHjYQgI/MzvnrZ/w
	7m2iG6Wsvb5hOfhtDAvS4wn9mNTIjhsWlk3ILHpFmz3cmgs36UeVQYZjK1DtF/RQDNti
	CYcAHsgq8AUF0XL5K/AJN9Muc4XT9aKlx18clb+ltYEY28qvBsSo4Nb5Wlh5YgsUdNqZ
	+bcH0T1lVo1IQzNG12zZRkpo5eA5veLtWd9jekcLcDFvM5hP8ZIqUCk9e2AIrnLTV7qQ
	UMuQ+cWIzdCDXkVxmDCnTdKgSq6rFNu7KlV9qiw3B23p35R9GsaP79PNrMXV2V3yrJdo
	AlyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:cc:content-transfer-encoding;
	bh=OelpblnDtDPFg37q1huwwdR3Yo0c7IaEVZiyhoDl2og=;
	b=AyKumR8FEORdxbkKeQZsTUHY5Mrf3Jveyqm8GOUpjmJYLEhCW7xFPFZ8Biqo3U7dmx
	CaREas3XNiUN/DY4HH8tSk3e9ARzDyWHD3/5sw07V0221tJaLeFc73U1daZB/Ol5FEO/
	r1G5O7QGiaOGaa+z5Ff/ab3NXom/EtBjsbqZt8JBnCVUkDxRi8HkIMUMIe+jdKhX6Nx2
	aJnc33pQ/wScRbISTSmxRzQ5celem1LWaAac9ABqNVmoaMKItEA4ZmeXzQCD3VyKB+gK
	daW2zsw4L4Ua7Qp1KttxaJSOznPlvLv1Rs6lBejOkmz5cyO9LFdsbokJOMQfBJzW5YSh
	Na4Q==
X-Gm-Message-State: APjAAAUrvcHqzMuDBZ9DKBi9INBuThSVbev+xNOKylbjdmg54T8iyCpe
	D25IMh7V45L0RxM3x1aUAPspviidCHCy3ZXyyGjwZi1WQZo=
X-Google-Smtp-Source: APXvYqxaNsO7B9syDlzKO9Jdfnl8pbvvVPH7y1f0VZEFVMHnKE6V6xnLsxjQjgRqCljVL+i0E4u/k5VrYJFjHnc0vRk=
X-Received: by 2002:a05:6638:72c:: with SMTP id
	j12mr28192845jad.136.1575903661591; 
	Mon, 09 Dec 2019 07:01:01 -0800 (PST)
MIME-Version: 1.0
References: <20191209144601.21938-1-brgl@bgdev.pl>
	<c8092805-82d6-9cbf-83de-d7a8b8bc0062@denx.de>
In-Reply-To: <c8092805-82d6-9cbf-83de-d7a8b8bc0062@denx.de>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 9 Dec 2019 16:00:49 +0100
Message-ID: <CAMRc=McwqcgGDfhxegUunZd7kVK6kJQ=hYhncRSLujB1jNTKkg@mail.gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] librsync: new package
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
X-List-Received-Date: Mon, 09 Dec 2019 15:01:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

pon., 9 gru 2019 o 15:53 Stefano Babic <sbabic@denx.de> napisa=C5=82(a):
>
> Hi Bartosz,
>
> On 09/12/19 15:46, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > rdiff is a popular tool for calculating binary delta patches. It's
> > provided by the librsync package (unrelated to rsync already available
> > in poky).
> >
>
> Nice, I added it (really, 2.1) to my public layer, but this definetely
> belongs to OE:
>
> https://github.com/sbabic/meta-swupdate/blob/master/recipes-support/librs=
ync/librsync_2.1.0.bb
>

Ha! Somehow it didn't pop up in google search. If you want you can
send your own patch instead of this one.

We probably have the same idea for updates - I'm using it in my
binary-delta update module for mender.

>
> > This recipe adds new packages for librsync and rdiff.
> >
> > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > ---
> >  .../recipes-support/librsync/librsync_2.2.1.bb | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> >  create mode 100644 meta-oe/recipes-support/librsync/librsync_2.2.1.bb
> >
> > diff --git a/meta-oe/recipes-support/librsync/librsync_2.2.1.bb b/meta-=
oe/recipes-support/librsync/librsync_2.2.1.bb
> > new file mode 100644
> > index 000000000..9d224767c
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/librsync/librsync_2.2.1.bb
> > @@ -0,0 +1,18 @@
> > +SUMMARY =3D "Remote delta-compression library."
> > +AUTHOR =3D "Martin Pool, Andrew Tridgell, Donovan Baarda, Adam Schuber=
t"
> > +
> > +LICENSE =3D "LGPLv2.1+"
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd8045f3b8f929c1cb29a1e3fd73=
7b499"
> > +
> > +SRC_URI =3D "git://github.com/librsync/librsync.git"
> > +SRCREV =3D "5917692418657dc78c9cbde3a8db4c85f25b9c8d"
> > +S =3D "${WORKDIR}/git"
> > +
> > +DEPENDS =3D "popt"
>
> Don't you have any depends from zlib / bzip ? cmake tests it, if you do
> not add it, build will be fine but without support.
>

Sure - it probably should become a PACKAGECONFIG option.

Bartosz

> > +
> > +inherit cmake
> > +
> > +BBCLASSEXTEND =3D "native nativesdk"
> > +
> > +PACKAGES =3D+ "rdiff"
> > +FILES_rdiff =3D "/usr/bin/rdiff"
> >
>
> Best regards,
> Stefano
>
> --
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
> HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
> Phone: +49-8142-66989-53 Fax: +49-8142-66989-80 Email: sbabic@denx.de
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

