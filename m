Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0152B6028C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jan 2020 12:43:00 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id g19so3623112eds.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jan 2020 04:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=CsacmQ7DNJ7xV1n4Y1NhHXlZ6B1UZoaFNh2PAIcPIaI=;
	b=aMpRvVr3eDXG0Pp1uVhGHiF8SnFZl9xEFEX6lp9dlZiooxeoVWQBxxVM1pfaGjXIgA
	7kdxULMzBL9zRFvCSUlrG/N5RyGURp2Budjr1a2G1lPlbnyIUWanP+ATo6zla5j9yTck
	3lRvm35J0D2kB0UVqMX9ym2V7+TBekcFvS8p2RuH4XpYpmihnbtUo/XxgbKOSxrZnmL8
	sA1+VHdf4PFLmDMhG/8Tw/3/lb/t77IpOgMTo6ngxI9UClK/8zDJNSby+3e/iJf7pxyg
	nRdGDrU/g+JEAWyPWmjnW5a3wJbLgZbt/VE1i8HMMV/vpPoCn/PUWkyXra9jwye6rSpV
	GL8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=CsacmQ7DNJ7xV1n4Y1NhHXlZ6B1UZoaFNh2PAIcPIaI=;
	b=jxPm/HZJVILtHy3N1KZeFeCncNYL4kihlok9p1ZBHv5hYZOyM1fNBchQ6md//bDIaB
	vXNQHjTmnh/K9gMp8r2DBFoy/tlxWF85tVin7zi1C+b+xh8Mjht4wxULD9iYj3+khoDE
	H/HZveEatIwtgOfMhuE5Z0gKdvSaBySsKisMw2SiqnnhUujXxIfXbaZH0NJnzB3AGxi2
	LTThiCBO7ANxXzn+fI3VaZaFDQPaX4oyzFlGZSf5CH79/wWhvVODsZaNw6BpHX2BBLc6
	Oscm5r7w2Vwfb7fYEgi1w2rZq87GhzF9Y27O9Dj6UArTdQHES9OZ8fLdxJhUljBtjF+w
	Oh/g==
X-Gm-Message-State: APjAAAUY3JPS8cVQ6l8FoypLBwKw4CuRGLp4ZPI5Ym9ChImMcUOjI1s+
	04Crut5kwQe443Kumn5d0DfVc6kZWzTih2desBOXOA==
X-Google-Smtp-Source: APXvYqyki+MQc0pmfsJjkjGQVufl0OHGvsKf0CizaiA/pKlFMg4/btbC3prBbFkHLPTsJuVtgrlvw8chRBx8Zh2OpIU=
X-Received: by 2002:a17:906:2651:: with SMTP id
	i17mr1142385ejc.246.1580330709962; 
	Wed, 29 Jan 2020 12:45:09 -0800 (PST)
MIME-Version: 1.0
References: <20200125202357.4766-1-Martin.Jansa@gmail.com>
	<CANx9H-BvkgBQb_NPgJ66LUJvpMDFy7h899MTrnVrqGsm=fDsaQ@mail.gmail.com>
	<20200129203200.GA3422@linux-uys3>
In-Reply-To: <20200129203200.GA3422@linux-uys3>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 29 Jan 2020 21:44:58 +0100
Message-ID: <CA+chaQdfwSjbc0NvO9u+7cvcRC+hGK7y64LZSSdR=_Hwc1jMpA@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] packagegrop-meta-oe: remove blacklisted mpv
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
X-List-Received-Date: Fri, 31 Jan 2020 09:28:12 -0000
Content-Type: text/plain; charset="UTF-8"

I'm not,

I've noticed this only because of sstate-diff-machine.sh failures, not
using mpv myself.

On Wed, Jan 29, 2020 at 9:32 PM Trevor Woerner <twoerner@gmail.com> wrote:

> On Sat 2020-01-25 @ 12:42:21 PM, Tim Orling wrote:
> > If someone cares, it has been updated to python3
> > https://github.com/mpv-player/mpv/releases/tag/v0.31.0
>
> I'm looking into this now. Is anyone else?
> (no point multiple people looking into this)
>
> > On Sat, Jan 25, 2020 at 12:24 PM Martin Jansa <martin.jansa@gmail.com>
> > wrote:
> >
> > > * it's blacklisted with:
> > >   mpv_0.26.0.bb:PNBLACKLIST[mpv] = "Needs forward porting to use
> python3"
> > >
> > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > ---
> > >  meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta-oe/recipes-core/packagegroups/
> packagegroup-meta-oe.bb
> > > b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> > > index 865cbb0bfc..d5789a758d 100644
> > > --- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> > > +++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> > > @@ -207,7 +207,7 @@ RDEPENDS_packagegroup-meta-oe-multimedia ="\
> > >      sound-theme-freedesktop v4l-utils yavta wavpack libvpx \
> > >      ${@bb.utils.contains("DISTRO_FEATURES", "x11", "xpext pavucontrol
> > > xsp", "", d)} \
> > >      libmikmod \
> > > -    ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial",
> "libmad
> > > faad2 mpv", "", d)} \
> > > +    ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial",
> "libmad
> > > faad2", "", d)} \
> > >      "
> > >  RDEPENDS_packagegroup-meta-oe-multimedia_remove_libc-musl = "alsa-oss"
> > >
> > > --
> > > 2.20.1
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

