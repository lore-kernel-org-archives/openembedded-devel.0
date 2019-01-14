Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
	[209.85.160.172])
	by mail.openembedded.org (Postfix) with ESMTP id E27166D63F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jan 2019 22:47:11 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id r14so988792qtp.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jan 2019 14:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=5fLBh0ZeCNgQlkghNCYAJdFoPy55IdADB7tbth1B4Uo=;
	b=fYP9lf6fDp3z8BMNklVQC76kmsXz9zYyWmdWMG8pkP7Nyufod5sSGq2w9Cwp0Thm+7
	HqIyRfj5sAFgnevp4iFm4P/NH92a8MTEwfsXAClyhqU3/+SYrqeCJXgeiMI8YZylLZaS
	NnMWke8ttZFj6D9r7CAX2mKwGiGyjjj+6xAixO9CpaKZZShahJhHrZ90pQKaev0AoZVP
	pYNnt/kxYxkXPh49F26ljPb+fowHVvnRmUk3pWD6mnRfcp9B/B3wPz25JCPROohKgrSi
	VZoCRkJOlfZ7f//1KdqdnBjfngkU1Pw1sVPPfU/+FE4dhT2cPGt/CnbeOsjk3FD+vRhq
	7MXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=5fLBh0ZeCNgQlkghNCYAJdFoPy55IdADB7tbth1B4Uo=;
	b=s7PZi5O5ZyNN8KhEMFZRO5ATtAPikWy/FE2FdvNJf+oJsU0AAoArA1WKEjF1pN4XTW
	NO1dDpMxCv2Q0DfP1KVG8KPKTCVn4qZgmZRRgMIxXsYXLtRn5gnT/yje97HpJU3Et06n
	Qs9nYT0BD1oHwa3rkPvpYCUkGbj+3NvNZhh2YWabVtnM/HD5tu9Ifrr2UlcrkKz0ScKh
	Xy0bUqLQ4+IpFoeiQyd+JgLjrUZLEDJd8LVFrJ6wi7u0jesgV1naJA16NxAmtlMxq6I+
	vwMzU68O/8u/A6pkuotOfjfR50UlgI9vilzdnkZtzZtSRm6eNqreOa1hEuD89tqC0LbP
	9zMw==
X-Gm-Message-State: AJcUukd7NUdVl3rRU3XdhgK7QF5moF3f8yzq5HURRuzRYvyNf1AZm5QE
	awQDY4hYz3LoaBdtHfdSMu7iv1XZD9xyVBUhjvg=
X-Google-Smtp-Source: ALg8bN6ZyrfJRYEWjouneRra0wCVT44vYwMtHKlg3qV26FxuCMrcmCvgLAJ03/4HwQIn+gCfU7mhZV6H5LEyz1x1Ob8=
X-Received: by 2002:a0c:a144:: with SMTP id d62mr678613qva.50.1547506031699;
	Mon, 14 Jan 2019 14:47:11 -0800 (PST)
MIME-Version: 1.0
References: <20190110053633.40604-1-yongxin.liu@windriver.com>
	<CALbNGRQoS517_VZR081ZYTJOj=hzxJeMuNw2tBo0WqOBcUbTgg@mail.gmail.com>
	<597B109EC20B76429F71A8A97770610D129EDEF0@ALA-MBD.corp.ad.wrs.com>
In-Reply-To: <597B109EC20B76429F71A8A97770610D129EDEF0@ALA-MBD.corp.ad.wrs.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 14 Jan 2019 14:46:45 -0800
Message-ID: <CAMKF1sr4vvxS=9zNJn2ZYLh4-9=7pjFbiBUEvLFDdims86eUgg@mail.gmail.com>
To: "Liu, Yongxin" <Yongxin.Liu@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH V2] pmdk: fix install error
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
X-List-Received-Date: Mon, 14 Jan 2019 22:47:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 9, 2019 at 11:43 PM Liu, Yongxin <Yongxin.Liu@windriver.com> wr=
ote:
>
> > -----Original Message-----
> > From: Andreas M=C3=BCller [mailto:schnitzeltony@gmail.com]
> > Sent: Thursday, January 10, 2019 14:46
> > To: Liu, Yongxin
> > Cc: openembeded-devel
> > Subject: Re: [oe] [meta-oe][PATCH V2] pmdk: fix install error
> >
> > On Thu, Jan 10, 2019 at 6:40 AM Yongxin Liu <yongxin.liu@windriver.com>
> > wrote:
> > >
> > > Install files to /usr instead of /usr/local by replacing
> > > PREFIX=3D${prefix} with prefix=3D${prefix}.
> > > Remove unnecessary files which are only for debugging.
> > > Set FILES to package /usr/etc/bash_completion.d/pmempool.
> > >
> > > Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
> > > ---
> > >  meta-oe/recipes-extended/pmdk/pmdk_1.4.2.bb | 20 ++++---------------=
-
> > >  1 file changed, 4 insertions(+), 16 deletions(-)
> > >
> > > diff --git a/meta-oe/recipes-extended/pmdk/pmdk_1.4.2.bb b/meta-
> > oe/recipes-extended/pmdk/pmdk_1.4.2.bb
> > > index 3da22a970..8c3ead2ef 100644
> > > --- a/meta-oe/recipes-extended/pmdk/pmdk_1.4.2.bb
> > > +++ b/meta-oe/recipes-extended/pmdk/pmdk_1.4.2.bb
> > > @@ -34,25 +34,13 @@ EXTRA_OEMAKE =3D "HOST_SYS=3D'${HOST_SYS}'
> > EXTRA_CFLAGS=3D'${SELECTED_OPTIMIZATION}'"
> > >  # Fix the missing fts libs when using musl
> > >  EXTRA_OEMAKE_append_libc-musl =3D " EXTRA_LIBS=3D'-lfts'"
> > >
> > > -do_install() {
> > > -       oe_runmake PREFIX=3D${prefix} DESTDIR=3D${D} install
> > > -
> > > -       # Copy these into the standard directories
> > > -       install -d ${D}${bindir}/
> > > -       mv ${D}/usr/local/bin/pmempool ${D}${bindir}/
> > > -       mv ${D}/usr/local/bin/daxio ${D}${bindir}/
> > > -
> > > -       install -d ${D}${libdir}
> > > -       mv ${D}/usr/local/lib/*so* ${D}${libdir}/
> > > +FILES_${PN} =3D "/usr/etc"
> > ^ This looks wrong: Seems config path is prefixed too
>
> Without this I got the following warning.
>
>     WARNING: pmdk-1.4.2-r0 do_package: QA Issue: pmdk: Files/directories =
were installed but not shipped in any package:
>       /usr/etc
>       /usr/etc/bash_completion.d
>       /usr/etc/bash_completion.d/pmempool
>     Please set FILES such that these items are packaged. Alternatively if=
 they are unneeded, avoid installing them or delete them within do_install.
>     pmdk: 3 installed and not shipped files. [installed-vs-shipped]
>
> With it, the issue is gone. And those files can be shipped in RPM package=
s.
>
>     $ rpm -qpl pmdk-1.4.2-r0.skylake_avx512_64.rpm
>     /usr
>     /usr/bin
>     /usr/bin/daxio
>     /usr/bin/pmempool
>     /usr/etc
>     /usr/etc/bash_completion.d
>     /usr/etc/bash_completion.d/pmempool
>

Its better to move bash_completion files under usr/share in
do_install

> I see similar usage, such as "meta-openembedded/meta-oe/recipes-support/l=
io-utils/lio-utils_4.1.bb:FILES_${PN} +=3D "${sbindir}/* /etc/init.d/* /etc=
/target/*""
>
>
> Thanks,
> Yongxin
>
> > >
> > > -       install -d ${D}${libdir}/pkgconfig
> > > -       mv ${D}/usr/local/lib/pkgconfig/*.pc ${D}${libdir}/pkgconfig/
> > > -
> > > -       install -d ${D}${includedir}
> > > -       mv ${D}/usr/local/include/* ${D}${includedir}/
> > > +do_install() {
> > > +       oe_runmake prefix=3D${prefix} DESTDIR=3D${D} install
> > >
> > >         # Remove uneeded files
> > > -       rm -rf ${D}/usr/local/
> > > +       rm -rf ${D}/usr/lib64/pmdk_debug
> > >  }
> > >
> > >  # Include these by default otherwise the SDK is not very useful
> > > --
> > > 2.14.4
> > Andreas
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

