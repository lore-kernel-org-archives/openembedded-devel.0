Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 4454E7E20E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 19:03:26 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id o7so8062743qtp.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 12:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Df4GEsUdSkciI8pGPkGGm/PvoG2Lvfb8nBdlTd73DVQ=;
	b=TDL1X0245J2mzE1PsKx9zqV2kcXBlUExrSeZQEH6FBUF6KuX4GWYSkwqyR+Lk65+Ul
	g9u/XFJzwue8J78pdycZTbDG3mi1y6jM65QTcgeSVPIEp3/HMFBV0t3259INykvUmdIS
	P+oX7vu87hSbU1Tey7t56kP4AuabUa5GimVQkvXielHYwgLko95BSU0nqK88lej3t/Np
	kGQ+1baaE9Y5S7i+//Vk+4ExUvvzdsvHQX7eCwJQMbbwm8jP2CZMSyQHw1fXH5BEVgWv
	o3wMICtPgyY5DIvhKnCRZPZyB/IbD5wDRBNDBu7k7QHmJ5K/5ijUTRO4NMnCt3BKdmwI
	Tgkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Df4GEsUdSkciI8pGPkGGm/PvoG2Lvfb8nBdlTd73DVQ=;
	b=ZPZqA0yIG3AvY4UJK2JL3uJB4vxxJ09grIvNopC5ZVLXpyt8XAV8s+qPdgf4GDjK/F
	eqSBoYVjqh3Oy8EAmeOMsaVbq92beuQi8WpdTrfijfCRQHBgVMdKItyrWE4MoLJFinxC
	5CDZyvzkk+9kmhJ8wPpqbr+9G5agTmX9zzDIwvP09wU1NCUVuaOiNZedO6Ur9iust8JD
	p/yaooRbzOHssxT88cBoQVwxt80nzjwkso63bLJP3VlGPB8GbS0RfamSCvrVY5r1d/Xz
	4OEDI/O7gckK9oV7ZmKT+XCWsH+q4wzdhibP2331YDdGvqXurpWfKc6YYG41sjepRN3m
	ViuA==
X-Gm-Message-State: APjAAAXXcyMe7gLIWlb3d7hYWob58lQY3WzM0JtmQ3kpYjma1U/JbPzg
	qhl2+j1BhIfkcAAIGYZ0giKLskieji1tl4oqaDVPOA==
X-Google-Smtp-Source: APXvYqxObOO3m3CJ+wD+Gl9LTFhtQowunLuRsHrs9l9JInudRKaRFu36ujpdSGBO16MKaNNtpkqSVvTeg1P4YCoo/UQ=
X-Received: by 2002:ac8:2f35:: with SMTP id j50mr80798897qta.378.1558638206708;
	Thu, 23 May 2019 12:03:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190523174735.42541-1-raj.khem@gmail.com>
	<20190523181000.GD3348@localhost>
In-Reply-To: <20190523181000.GD3348@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 23 May 2019 12:01:41 -0700
Message-ID: <CAMKF1sq5VCW=3oG-CwMytnf9ePM4YbvzfzUYR5THteRHc0zv9Q@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] spice, spice-protocol: Uprev to 0.14.0
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
X-List-Received-Date: Thu, 23 May 2019 19:03:26 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, May 23, 2019 at 11:10 AM Adrian Bunk <bunk@stusta.de> wrote:

> On Thu, May 23, 2019 at 10:47:35AM -0700, Khem Raj wrote:
> >...
> > --- a/meta-networking/recipes-support/spice/spice-protocol_git.bb
> > +++ b/meta-networking/recipes-support/spice/spice-protocol_git.bb
> > @@ -13,9 +13,9 @@ architectures."
> >  LICENSE = "BSD"
> >  LIC_FILES_CHKSUM = "file://COPYING;md5=b37311cb5604f3e5cc2fb0fd23527e95"
> >
> > -PV = "0.12.13+git${SRCPV}"
> > +PV = "0.14.0+git${SRCPV}"
> >
> > -SRCREV = "87441524f4e7b79658e42bd8f1f6c3e3c8649aa5"
> > +SRCREV = "f72ece993aeaf23f77e2845562b20e5563e52ba0"
> >...
>
> The previous one was a git snapshot but this is a release,
> so +git should be dropped from PV.
>
> >...
> > Add -Wno-address-of-packed-member needed with gcc9
> >
> > replace _append += with just _append syntax
> >...
> > +CFLAGS += "-Wno-address-of-packed-member"
> > +
> >  PACKAGECONFIG_class-native = ""
> >  PACKAGECONFIG_class-nativesdk = ""
> >  PACKAGECONFIG ?= "sasl"
> > @@ -54,4 +55,4 @@ COMPATIBLE_HOST = '(x86_64|i.86).*-linux'
> >
> >  BBCLASSEXTEND = "native nativesdk"
> >
> > -EXTRA_OECONF_toolchain-clang += "--disable-werror"
> > +EXTRA_OECONF_append_toolchain-clang = " --disable-werror"
> >...
>
> Would adding --disable-werror for all toolchains also fix the
> gcc 9 build error?


It will but so far we have not needed it and would like to keep it this way
since it helps the upstream packages to fix the issues as they happen

>
>
> cu
> Adrian
>
> --
>
>        "Is there not promise of rain?" Ling Tan asked suddenly out
>         of the darkness. There had been need of rain for many days.
>        "Only a promise," Lao Er said.
>                                        Pearl S. Buck - Dragon Seed
>
>

