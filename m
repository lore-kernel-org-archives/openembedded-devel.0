Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-vk0-f53.google.com (mail-vk0-f53.google.com
	[209.85.213.53])
	by mail.openembedded.org (Postfix) with ESMTP id A6B33731D8;
	Fri, 11 Mar 2016 16:21:23 +0000 (UTC)
Received: by mail-vk0-f53.google.com with SMTP id c3so139808302vkb.3;
	Fri, 11 Mar 2016 08:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=4ovDmWQjlxVOC/kuoGJOxw7tcQIXv311WqtbEHH/Bfs=;
	b=wQiaB9/vLSFJAfxyzYt5zJx5TX0LnCIbfrf6jE+diY3kDAMUdZnJd284S4pgE1t2UG
	KT7wDRfvtpN07H4upyYCMOgbS9AK3vBorZGmX3xVeRffNv1UXtI60aRGIIIOIGkrVS+O
	elB7aLzRVfb3fl8Hl9wZ2Zw5OyUOY8V+YR5hpFdDXyTRfJb5nfu0nTglZa5z56LwN8F5
	lbIDCaGgPwk2M5n7iAGgg3E/RSlX+Fg/AMg6a9SOM9yzEiZOiMxHtaotB5Ho2wSGbhtY
	D9x9SLxS0u8DM8hvvhwb9eYKDSFQjGqW3uHwt64bCRwdnHyZ/lr/LL9SyNSoy7Sfdsih
	Nu2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=4ovDmWQjlxVOC/kuoGJOxw7tcQIXv311WqtbEHH/Bfs=;
	b=V+TqArIemcu0IerbHf1+b1idJeRTvzm6WkgJ80Ao6Zro7nsk8hJR+mZsjfEhFv7WGT
	Yt/1NNmzbKuGB1Yu1RmLZWsAFeNjuDjgUrHDUFiUB1J+3TJSoKJ6Y14YCzeWrmHB/u3R
	/mnmSIFb8ew+kLi4kXjqT+o7wpDi9nDOv0+wbP8pkHB12X7aNFO/OC4NUIra3jkfHXjd
	BO0FIj+iczEzcKDOwuL28iudZnpKR3pohci1gY64ytHe+UH6PsHAc1jV1VswJsV3s5LI
	QqJaBJhWKPQzn9g06FLxMxXrkTooYPwnOqmzzTCFJ/J5mYwn87O8gfFULoX5VtL3Or/z
	W0Xw==
X-Gm-Message-State: AD7BkJJKQ19Vl0Ot6RDbyyaw18rF0/lwtoCWWv8215RvIvBwJ2VF9aPFJv99Mh7JymzA5mfRkkM8kYjmZLPoPg==
MIME-Version: 1.0
X-Received: by 10.31.6.17 with SMTP id 17mr10782219vkg.75.1457713284624; Fri,
	11 Mar 2016 08:21:24 -0800 (PST)
Received: by 10.176.6.42 with HTTP; Fri, 11 Mar 2016 08:21:24 -0800 (PST)
In-Reply-To: <20160311161353.GA2646@jama>
References: <20160310115301.GC2573@jama> <56E2E731.1040005@windriver.com>
	<CADkTA4N43Zi=oLVRe99eEvvPjgYethKFNKH3J90Bss_AzqovVg@mail.gmail.com>
	<20160311161353.GA2646@jama>
Date: Fri, 11 Mar 2016 11:21:24 -0500
Message-ID: <CADkTA4N9fYRt15y36RBUYrQBu=7DAdWdw7iAamMY7s0xvSfLaQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] State of bitbake world, Failed tasks 2016-03-09
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
X-List-Received-Date: Fri, 11 Mar 2016 16:21:27 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 11, 2016 at 11:13 AM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> On Fri, Mar 11, 2016 at 10:52:14AM -0500, Bruce Ashfield wrote:
> > On Fri, Mar 11, 2016 at 10:41 AM, Mark Hatle <mark.hatle@windriver.com>
> > wrote:
> >
> > > On 3/10/16 5:53 AM, Martin Jansa wrote:
> > > > Aggressive PNBLACKLISTing continues. But linux-yocto (and modules
> > > depending on it)
> > > > are still broken :/.
> > > >
> > > > I'll look at cef3 and chromium issue, my recent patch for
> meta-browser
> > > > fixed the build for armv7a MACHINEs, so it probably needs to be
> extended
> > > > a bit to cover warnings in x86 and then duplicate the same to cef3.
> > > > This issue is there for so long, slowing down the builds
> significantly
> > > > (and causing logs to be much bigger) - I don't use these recipes but
> I
> > > > hate the failures even more.
> > > >
> > >
> > > Is see the reported log failure, but I've been building with the
> oe-core
> > > and
> > > poky linux-yocto head of master for the last couple weeks, all arches
> > > includes
> > > qemux86.
> > >
> >
> >
> > I don't know what to say about those failures either. I've been chasing
> > perf build
> > races for the past week, and that includes building linux-yocto hundreds
> of
> > times,
> > and I've never seen the uapi headers not be in place like the logs show.
>
> My guess (and supported by Andrea) is that it's caused by
> linux-yocto-tiny which is built as part of bitbake world and probably
> not included in your tests when you build the same linux-yocto.
>
>
Aha. Thanks, I'm working those problems as well and did reproduce a variant
when rm_work is enabled. So I do have a thread to tug on for the failure.

With that, plus your description below, I've got a better chance of seeing
it.

Cheers,

Bruce


> That would also explain why these issues break almost every qemux86 and
> I haven't seen them for qemuarm, linux-yocto-tiny has:
>   COMPATIBLE_MACHINE = "(qemux86)"
>
> Try to run
> "bitbake linux-yocto linux-yocto-tiny" couple times and maybe you'll be
> able to reproduce it.
>
> For next runs I've PNBLACKLISTED linux-yocto-tiny and
> linux-yocto-tiny-kexecboot:
>
> https://github.com/shr-project/jenkins-jobs/commit/c168b7824c2c68bd5894532fc122929d2d9df9a7
>
> > The Yocto AB is also not showing it to me.
> >
> > Unless I can get access to a broken build, I'm at a loss to actually
> debug
> > and
> > fix it.
> >
> > Bruce
> >
> >
> > >
> > > I don't see the error on my builder.  Is something changing the default
> > > recipe/kernel configuration triggering the fault?
> > >
> > > --Mark
> > >
> > > > === qemux86 (2) ===
> > > >     * /meta-openembedded/meta-python/recipes-devtools/python/
> > > python-m2crypto_0.23.0.bb, do_compile
> > > >     * /openembedded-core/meta/recipes-kernel/linux/
> linux-yocto_4.4.bb,
> > > do_compile
> > >
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> > >
> >
> >
> >
> > --
> > "Thou shalt not follow the NULL pointer, for chaos and madness await thee
> > at its end"
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

