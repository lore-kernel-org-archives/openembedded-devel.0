Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3ADEF7FCC8
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2019 21:19:14 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id m16so11677816qki.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Nov 2019 14:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3VTyF5d3pHSEerDHhs9D3bPKgTAPKa0yBS6Su020nFY=;
	b=LMVELDyTtUjLVFNcEnvxUODji5SNoA/liUc7gq2uGTCZ0Ipw8Bl7z8HBhwcMMBZLDl
	Tctt19ffq8QKU/6vYVI2/dD/fXkoKdRuo79HyLeKYQsaqN3OCAtGBE6UAf5HYA9GePyw
	1Z4nWXh18k08pOssIqPUHxIzvmCXYbbJyYw/Cvw2J35pF61EV0p1iz04HlE68UysgUcN
	azxTUQX5EaH5UxO4HaEe4aJFKCfaH7ZNcWQBb/YFVlHSozT3mRD10X2CYLQPidX0ZmaJ
	4ojuB+EqE2xQKfF5BJ5qbPh2mcf/RuOhXwV58qjGr1mV5Olkcs0suyVX6WsNKmLNVjfV
	ORlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3VTyF5d3pHSEerDHhs9D3bPKgTAPKa0yBS6Su020nFY=;
	b=Gn/rmig8cOl0PXvprLuboQjbuAvNLxM/gjxjTqauyAoatDoH2MhVRQgZUs0MdgF+mH
	dohBAoDiZgKhYHPjK5r6Xph9rP1EexVhfpMRrRrmU1a8NEFUaz5rZ7U6PErKtRHoV5Cj
	5AQgI0WTrMAX4ZsGRibUjZwnOEUYh/xkoiL5X3vZu6v5DXbaHHY7j+2dbsnUd/rZBF+K
	adzDnQO9+wM+A2nHvgEW451nLtgQdGlGKvTzr9ar3pnDOvUhT2m5kWSbUaq0mwIc75ov
	GWpizq8FpjDsZ4MrY9sMFLa8j6E1NEZww0KyAutLIW8ng96rsTyRMBHO3PRpRofvG2V1
	QuSQ==
X-Gm-Message-State: APjAAAVwHx9NOx1Mnt5JzV5PuDs+MIzBaBgg7Ngo7CzzwxMIKZXdluMV
	Op/XmOweX79vKszPmjoaCWJLyttfaIItKKaSrMM=
X-Google-Smtp-Source: APXvYqyectwl+xf7guZ20GGwHZ1MWHZUTELPSoiqsLoRp5Nf8yRimXDx343CkiWN5GUhXLqurG29ZipZcCqn55n75L0=
X-Received: by 2002:a37:84b:: with SMTP id 72mr12352683qki.337.1572643154802; 
	Fri, 01 Nov 2019 14:19:14 -0700 (PDT)
MIME-Version: 1.0
References: <1572600861-65655-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<20191101204750.GA6557@localhost>
In-Reply-To: <20191101204750.GA6557@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 1 Nov 2019 14:18:48 -0700
Message-ID: <CAMKF1srwsBaNv2U35t9zfbGHOJ07pC2P7YVL47FGem6XHpDJsQ@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] rtorrent: upgrade 0.9.7 -> 0.9.8
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
X-List-Received-Date: Fri, 01 Nov 2019 21:19:14 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 1, 2019 at 1:48 PM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Fri, Nov 01, 2019 at 05:34:21PM +0800, Zheng Ruoqin wrote:
> >...
> > index 9bb81c4..6f0e8c1 100644
> > --- a/meta-oe/recipes-connectivity/rtorrent/rtorrent_git.bb
> > +++ b/meta-oe/recipes-connectivity/rtorrent/rtorrent_git.bb
> > @@ -8,10 +8,10 @@ DEPENDS = "libsigc++-2.0 curl cppunit libtorrent ncurses"
> >  SRC_URI = "git://github.com/rakshasa/rtorrent \
> >      file://don-t-run-code-while-configuring-package.patch \
> >  "
> > -# v0.9.7
> > -SRCREV = "327164f9d86aafcd2500a317d485374df32ea622"
> > +# v0.9.8
> > +SRCREV = "6154d1698756e0c4842b1c13a0e56db93f1aa947"
> >
> > -PV = "0.9.7+git${SRCPV}"
> > +PV = "0.9.8+git${SRCPV}"
> >...
>
> This is exactly the 0.9.8 release, please change to
>   PV = "0.9.8"
>

I have already tweaked this patch in master-next

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
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

