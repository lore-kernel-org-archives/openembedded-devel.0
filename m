Return-Path: <twoerner@gmail.com>
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
	[209.85.216.47])
	by mail.openembedded.org (Postfix) with ESMTP id 09A7060155
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jan 2020 13:08:57 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id ep11so1309413pjb.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jan 2020 05:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=UKbuoZ6zIpxk4JFHUmCluQisZoLmmMLhVhHMazkXFJw=;
	b=h7EAL27StWZKvWbHPo2mfGV9xDLCc8yYEty2HTR0DSnmwYNhhKzpSPrrqBTq+ZJiCB
	w8joN6Hh6JN3FXU4RSXzH5nuJ/2r+3Iqdft4LIlEMS8S5g7fLsi9B76Ku56lpn93GwKP
	fBZY7x3oDWD7N1+tGyUxwDj9mFdYQVTDwlhOoVshwou6gKuXDMRJtJBw3O1leJ2qfgug
	BPidJ4kbneZdRt+Z2gR3ge/bpAR2YdTYlOXzJrEYbCv4Ml9JN8TLJqj3IjhooO63nidf
	3mo+Z7KOB8lib2jqBf9JdtgGnhEhTPka0dFRB424CimynvOByEXTtFqp6yTIkX5rSdpn
	NhOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=UKbuoZ6zIpxk4JFHUmCluQisZoLmmMLhVhHMazkXFJw=;
	b=WV480WbfOcK0B8je8JuRqeGdXzc4f3ArTXGAFAtOKJuCBdAFvmYG+9PVd7dVRCa/Uc
	KTf7wmeYZVgaDBdMJNS6Z0dOposddaUP3P+b1EMRynb5fFP0M4G9Wb+1kbcplwV0u1pi
	4g+E21GfYhfW8/trfjDNzvp4cTCOBIx7jMhX6n0Yc5PPTRkiQXxjUz2gfSg/3ouKo3M+
	fILz7Zgz4XqadUYMco+swX06VkL39LKq2f4a2qfMWqbrkSBylJ03IZaVd5jMY1+dqqUL
	85sdHxGRjI0JCWTJoAEGyEfMuGO0NEg7l168fpRRSZO14QA7pIHSUEQRbdCGQNhX8EKK
	oYQA==
X-Gm-Message-State: APjAAAUAOPrJNkTlP3O7ULu9EEvXgrNGTzVTM0/IerEdsHp1ceU3Ardp
	lwVzrFs5tPqlx8yYMjE8jXCUZwbVfno=
X-Google-Smtp-Source: APXvYqxn3Z8afJaGeAHr8GZU1aEVspqMsBXkGkOd8GqSMvJCxOOZBitsc9l/d9hbn59HMjjqsBfiNw==
X-Received: by 2002:a0c:e4c1:: with SMTP id g1mr912615qvm.45.1580329924565;
	Wed, 29 Jan 2020 12:32:04 -0800 (PST)
Received: from linux-uys3 ([206.248.190.95]) by smtp.gmail.com with ESMTPSA id
	g18sm1546418qki.13.2020.01.29.12.32.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 Jan 2020 12:32:03 -0800 (PST)
Date: Wed, 29 Jan 2020 15:32:00 -0500
From: Trevor Woerner <twoerner@gmail.com>
To: Tim Orling <ticotimo@gmail.com>
Message-ID: <20200129203200.GA3422@linux-uys3>
References: <20200125202357.4766-1-Martin.Jansa@gmail.com>
	<CANx9H-BvkgBQb_NPgJ66LUJvpMDFy7h899MTrnVrqGsm=fDsaQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANx9H-BvkgBQb_NPgJ66LUJvpMDFy7h899MTrnVrqGsm=fDsaQ@mail.gmail.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Thu, 30 Jan 2020 13:09:10 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sat 2020-01-25 @ 12:42:21 PM, Tim Orling wrote:
> If someone cares, it has been updated to python3
> https://github.com/mpv-player/mpv/releases/tag/v0.31.0

I'm looking into this now. Is anyone else?
(no point multiple people looking into this)

> On Sat, Jan 25, 2020 at 12:24 PM Martin Jansa <martin.jansa@gmail.com>
> wrote:
> 
> > * it's blacklisted with:
> >   mpv_0.26.0.bb:PNBLACKLIST[mpv] = "Needs forward porting to use python3"
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> > b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> > index 865cbb0bfc..d5789a758d 100644
> > --- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> > +++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> > @@ -207,7 +207,7 @@ RDEPENDS_packagegroup-meta-oe-multimedia ="\
> >      sound-theme-freedesktop v4l-utils yavta wavpack libvpx \
> >      ${@bb.utils.contains("DISTRO_FEATURES", "x11", "xpext pavucontrol
> > xsp", "", d)} \
> >      libmikmod \
> > -    ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "libmad
> > faad2 mpv", "", d)} \
> > +    ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "libmad
> > faad2", "", d)} \
> >      "
> >  RDEPENDS_packagegroup-meta-oe-multimedia_remove_libc-musl = "alsa-oss"
> >
> > --
> > 2.20.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

