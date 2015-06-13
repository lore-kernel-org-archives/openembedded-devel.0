Return-Path: <matti.kaasinen@gmail.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id A9EC67599A
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Jun 2015 05:22:35 +0000 (UTC)
Received: by igbpi8 with SMTP id pi8so23654518igb.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Jun 2015 22:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=319QRsfJgiNV4W72SVoscFou73MYUBSwxBABi0zfz70=;
	b=AvEP86n19TyhGHVQFMercqJWPRtUI7kZs5nDnLH4plgrjPdtlMA0y1p34X4Li61YP1
	OCl9JgTN5LafwkV2JGGUBiy56GFPS3G34wW/Icjp2YQIj2hxo8PCmfyqOiVYY5CHUVJP
	/RPqAvgVDpD3Xxljj4nWez5+bpzFoERiC4jBysgjulkBgjmAO+iy/fot6IlBflDUimox
	AWHA7ixmhKGUxrDiW75/hqMhMA7/RiucXJBfS+1o5OzS5Yv/XJDPfwxy8aDxftn43+4g
	hULgGjnkD5ycquEeTCYV6IWYkzJr4GAtSsaTGpiLAiYWiu3rYsquWoxVDayOO9OeIuPb
	DxxQ==
MIME-Version: 1.0
X-Received: by 10.42.213.136 with SMTP id gw8mr19812871icb.95.1434172956488;
	Fri, 12 Jun 2015 22:22:36 -0700 (PDT)
Received: by 10.36.1.197 with HTTP; Fri, 12 Jun 2015 22:22:36 -0700 (PDT)
In-Reply-To: <CAMKF1sqS-dpJbFtkZwB4qVyDsCGrLROkXYPiLQ-6ugaJ+A2Hxg@mail.gmail.com>
References: <CADnUhn1U1vmKZH2QcV_t9e1X9HC=BLZceB73G=zYxqpCBdFZSA@mail.gmail.com>
	<CAMKF1sqS-dpJbFtkZwB4qVyDsCGrLROkXYPiLQ-6ugaJ+A2Hxg@mail.gmail.com>
Date: Sat, 13 Jun 2015 08:22:36 +0300
Message-ID: <CADnUhn3yR_282cEf415zCdRK2HWNBXgqHOg1DG5KO6tCTJH2VA@mail.gmail.com>
From: matti kaasinen <matti.kaasinen@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: klibc_2.0.4.bb crashes
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
X-List-Received-Date: Sat, 13 Jun 2015 05:22:40 -0000
Content-Type: text/plain; charset=UTF-8

So, do you mean that this is not a layer problem but distro problem?
Considering Yocto/Poky based distro like Silica/ArchiTech or Ti/Arago:
should I contact Arago or ArchiTech community or Poky community? Who should
define these parameters "umbrella" distro or sub-distro? I suppose I should
contact myself (or Poky), as I started from plain Yocto/Poky and copied
some layers from Arago distribution (meta-ti and layers it required).

2015-06-12 17:51 GMT+03:00 Khem Raj <raj.khem@gmail.com>:

> On Fri, Jun 12, 2015 at 4:16 AM, matti kaasinen
> <matti.kaasinen@gmail.com> wrote:
> >
> > klibc_2.0.4.bb recipe linking crashes with following error messages.
> > arm-poky-linux-gnueabi-ld: error:
> >
> .../sysroots/am335x-evm/usr/lib/arm-poky-linux-gnueabi/4.9.2/libgcc.a(bpabi.o)
> > uses VFP register arguments, usr/klibc/libc.so does not
> > arm-poky-linux-gnueabi-ld: failed to merge target specific data of file
> >
> .../sysroots/am335x-evm/usr/lib/arm-poky-linux-gnueabi/4.9.2/libgcc.a(bpabi.o)
> >
> > I'm checked out fido branch of meta-openembedded.
>
> It means that TOOLCHAIN_OPTIONS is not passed via CFLAGS when building
> klibc, we have a diversion
> in expectation where we do not configure toolchain to hardfp unless we
> specify it via cmdline to compiler. Once you
> fix that, next thing might be that klibc is not good with hardfp
> itself which could be a bigger problem.
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

