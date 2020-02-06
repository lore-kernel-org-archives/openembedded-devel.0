Return-Path: <twoerner@gmail.com>
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
	[209.85.208.43])
	by mail.openembedded.org (Postfix) with ESMTP id 2BAFC60CD2
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Feb 2020 00:01:09 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id m8so3963263edi.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Feb 2020 16:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=wqWspQQGi+YD2yZjMyCwrScj9ZrTvj1cRkNfSSMrXE0=;
	b=gBfbbnxN09z2R8wj8KEjVX/i6jbO0sprWhaJbdSdaCWHAU20e9SDMa7yLhn8yDykGA
	g0zw7P/39twP3UZy6PWIwxEg326OXivB9Tiq0LRkFRdmVJsOhFGi1/6zoLydTuBDlEA1
	3Q4PiZ6qH/VyVqQrhxsAbBEkkAV/T7mytNljkYyrHQd2XTl0Uw6EVr2oX1/pSpJ9SwXk
	vJZunWwVWI2ZcEMvRpOoX/ScI0m5wyOwwJ75zk8BEeGp7dHmJFDHRhAzM11KSwxUDYfh
	thUN6eDgYfkR/Yzc6hv0dSCSxmGmPpedymJdBeOotasrV5ih7smFBa5eYO7gHLfUeQqJ
	LHRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=wqWspQQGi+YD2yZjMyCwrScj9ZrTvj1cRkNfSSMrXE0=;
	b=KeXJzZCESU0xlF6vyKyjSAquqefpAplmjSBULTG0ym8jH3OMtGk+8urZpt7C5noBtU
	8qlUwgJwrjcGSk6EnYnrkKl3+5SBjE1A3Zb/ToNKwXjvp5olSvxzHs79ZiBfQzLqcWSr
	B+XwxxOVnLqEMYyGzQrREgro8kvSstdGRJ1xuwS23x0D0b52wjVFtX/tSvMIi8dSAXNR
	YhkCVfN7RVHUsGjT+Zzmft52GzOmWIai2oPEkemC6ZpgInZoB0egnDOiiu/QF03AuJTq
	744zTVYKvqyC/Xj9M2YkZ4a2gBYD2dUtmcNgz+iSrKpcVMToAY2fli+bFBZmrxGY8kEe
	0uXw==
X-Gm-Message-State: APjAAAVkPZldMvoend04VF2vGjc53Cf25roaIurQqkbrbU8L218DLkKU
	DUs9+7M2vMg3RgVZrSVLTm2bSNcXrMyxa1YpUOI=
X-Google-Smtp-Source: APXvYqwgKZYb6elqjv7CScG2j4kbd3lX6EXs9Fipuf7BGP8IXs7jQDPAm2XxiyW9trv8+ZrVM1K0hDrV7Up+j4CWIuI=
X-Received: by 2002:a17:906:2e53:: with SMTP id
	r19mr505287eji.306.1580947269672; 
	Wed, 05 Feb 2020 16:01:09 -0800 (PST)
MIME-Version: 1.0
References: <20200205203053.6742-1-twoerner@gmail.com>
	<20200205210707.c4eqrvbyl7tl3knt@jama>
	<20200205230236.GA18868@linux-uys3>
	<CAMKF1srgMFjgmLkmo6NLW=xdvK-0ARqowk9z6bBRjWqmkgViSg@mail.gmail.com>
In-Reply-To: <CAMKF1srgMFjgmLkmo6NLW=xdvK-0ARqowk9z6bBRjWqmkgViSg@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Wed, 5 Feb 2020 19:00:58 -0500
Message-ID: <CAHUNapQt+Ce+4vysuB4v72mkMZsk9ir9ORZsk0Axt_Fa+RZmpg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] mpv: 0.26.0 -> 0.32.0
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
X-List-Received-Date: Thu, 06 Feb 2020 00:01:09 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 5, 2020 at 6:32 PM Khem Raj <raj.khem@gmail.com> wrote:

> On Wed, Feb 5, 2020 at 3:02 PM Trevor Woerner <twoerner@gmail.com> wrote:
> >
> > On Wed 2020-02-05 @ 10:07:07 PM, Martin Jansa wrote:
> > > Thanks,
> > >
> > > would you mind undoing:
> > >
> http://git.openembedded.org/meta-openembedded/commit/?id=0c182e58775966699c303c1e2561c273197bf445
> > > in the same commit?
> >
> > Sure, no problem.
> > v2 on the way
> >
> > > Also was this sent with -M?
> >
> > haha, I know exactly what you mean! I did the format-patch twice just to
> > convince myself I had used the -M (and I had, twice). I don't understand
> why
> > there's no similarity :-(
>
> also please take a look at
> https://errors.yoctoproject.org/Errors/Details/390294/
>

okay

