Return-Path: <ticotimo@gmail.com>
Received: from mail-la0-f47.google.com (mail-la0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id 2C475705A3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jul 2014 20:03:36 +0000 (UTC)
Received: by mail-la0-f47.google.com with SMTP id mc6so4139715lab.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jul 2014 13:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=XceEGu+zKkEea/jWqftNnd3RUVY8PuXNiXLNmItCT9Q=;
	b=jY9HLggH7QyuyfEf9Xlpdx8jwwk+OQuSgR5hHKG2kbV0rJIn/1+u9myfXNLX34D7qs
	UUHePCp1NHgbRfYABYn6bDHBopFmbtNXrLQ5e6MXJ4OW0RP2MyM6MUXt3BCJrU5CFCsA
	yamdgKrtXCD2G+BlQGnKZ0XmQX/p8OZ4jLDFhCdTDQTHbzphHzuYriQ9ZfDTJUupN3UT
	SekMIR9oWQnbYwg431TO+wSTYBbHGsiejB5L9Uih/mz0+FWjJidtla/CjrQIDorNEZlC
	Lrrt6xGOAnc36xruWqcnDCcwu/Rvz9vZz/qyMRUHHRsSOE0UG+bpZ4o20CaChKtTJo18
	Ax0g==
MIME-Version: 1.0
X-Received: by 10.152.115.139 with SMTP id jo11mr5706460lab.77.1405886616608; 
	Sun, 20 Jul 2014 13:03:36 -0700 (PDT)
Received: by 10.114.216.35 with HTTP; Sun, 20 Jul 2014 13:03:36 -0700 (PDT)
In-Reply-To: <20140720195343.GE22875@jama>
References: <1405883786-26358-1-git-send-email-TicoTimo@gmail.com>
	<20140720195343.GE22875@jama>
Date: Sun, 20 Jul 2014 13:03:36 -0700
Message-ID: <CANx9H-DHuf+6bKXQ7jgbJXKNKaXV0hTJJOMCzhiRcKsGwfcbgQ@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH v2] imagemagick: add some PACKAGECONFIG, fix unrecognized --without-jp2 option
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 20 Jul 2014 20:03:38 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Jul 20, 2014 at 12:53 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> On Sun, Jul 20, 2014 at 12:16:26PM -0700, Tim Orling wrote:
> > * Add PACKAGECONFIG for lzma, pango, webp, wmf
> >
> > Change in v2:
> > * libwmf is currently blacklisted, so #comment it out
>
> I like v1 more, because explicitly disable libwmf is better than
> floating.
>
> Fine with me. I commented out the line during testing because it failed
due to blacklist.
v1 it is :)


> > Signed-off-by: Tim Orling <TicoTimo@gmail.com>
> > ---
> >  meta-oe/recipes-support/imagemagick/imagemagick_6.8.8.bb | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_6.8.8.bb
> b/meta-oe/recipes-support/imagemagick/imagemagick_6.8.8.bb
> > index e261eb8..4b52568 100644
> > --- a/meta-oe/recipes-support/imagemagick/imagemagick_6.8.8.bb
> > +++ b/meta-oe/recipes-support/imagemagick/imagemagick_6.8.8.bb
> > @@ -2,7 +2,7 @@ SUMMARY = "ImageMagick is an image convertion tools"
> >  SECTION = "console/utils"
> >  LICENSE = "ImageMagick"
> >  LIC_FILES_CHKSUM = "file://LICENSE;md5=5d84c6ddd4028aa53d028b4c50f9361e"
> > -# FIXME: There is much more checked libraries. All should be added or
> explicitly disabled to get consistent results.
> > +# FIXME: There are many more checked libraries. All should be added or
> explicitly disabled to get consistent results.
> >  DEPENDS = "lcms bzip2 jpeg libpng librsvg tiff zlib fftw freetype"
> >
> >  PATCHSET = "10"
> > @@ -21,7 +21,12 @@ inherit autotools binconfig pkgconfig
> >  EXTRA_OECONF = "--program-prefix= --program-suffix=.im6 --without-x
> --without-perl --disable-openmp --without-xml --disable-opencl"
> >
> >  PACKAGECONFIG ??= ""
> > -PACKAGECONFIG[jp2] = "--with-jp2,--without-jp2,jasper"
> > +PACKAGECONFIG[jp2] = "--with-jp2,,jasper"
> > +PACKAGECONFIG[lzma] = "--with-lzma,--without-lzma,xz"
> > +PACKAGECONFIG[pango] = "--with-pango,--without-pango,pango cairo"
> > +PACKAGECONFIG[webp] = "--with-webp,--without-webp,libwebp"
> > +# libwmf is currently blacklisted
> > +#PACKAGECONFIG[wmf] = "--with-wmf,--without-wmf,libwmf"
> >
> >  FILES_${PN} += "${libdir}/ImageMagick-${PV}/modules-Q16/*/*.so \
> >                  ${libdir}/ImageMagick-${PV}/modules-Q16/*/*.la \
> > --
> > 1.9.3
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

