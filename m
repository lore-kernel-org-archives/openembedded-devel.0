Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 2BEA07F39D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2019 20:25:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46KDdc5TKQz3J;
	Thu, 29 Aug 2019 22:25:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1567110357;
	bh=DcSLbmx/YVqF4FZqE7y1uCuCZ9HG7/+s93KK6FcO8lU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VBFetpPDcCEwVV9sKUAH6Wgj+F0BxhkYwcvopYorcs1iSFlypJYqtW9YaLReiJ8oc
	Aihwk2aFHlJt8ImUFXVmWAVfV1ewlCaGW8foLSp4dJ5HZ/bLOUEr7xBM2+rrveizWS
	nl8jt1TjScYmUYNzF/GRDaIcRVM0WHB1HELaiqvAlE8xjQjZXH0HpDBPHZkYY+cnUc
	Xc5nnoOoJgNiepB8jyW8MJ0ow0lMTdR9GPtIwbAzgHARJNKXqcy7bkzMKqyaxJ5YB3
	bEIyCsgch7jyepSamtTscGFW/EM1U1l4uRGKzKeAWPIMzeDadbLol0Lk4OjtwmlEJS
	yG1+eKLVmovBzY+MVs0Wfh/47BwSVatCzOH/47sXH2PeSzYwQRnpRw/+wWRiK+PFNp
	ISgrDlNTjUaff1vRshbF5h7zeWFCG11X727RrmBmUC+Sa3EDIQdXWfGCkN/PJu/9if
	q+shw0lobQzDDJB45ZFl6std7XR49MbAIo7DV2DXwzOo9D+QwNMfPe6fX5pjW95KpP
	7qCl/MZPIDMbP0+F7t186GfbRORfpsp2UB5uxEjIal7k32W6xoILmU7cvkZjdlPANf
	xoiZawyIMGHQZJ59/NY6nLoeniN7p0lTBz+ORIC1fCEN7m4ub5uOc9rkirgB1g8RrI
	nzwPrCdMzS/oJ7tyDFJfxvwM=
Date: Thu, 29 Aug 2019 23:25:54 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190829202554.GC24691@localhost>
References: <20190829103934.21804-1-bunk@stusta.de>
	<CAMKF1srGz8Zw4vh3_9GJsbmrKzARCrVHrs9k9tmd=aAznXHTHA@mail.gmail.com>
	<20190829191417.GA24691@localhost>
	<CAMKF1sp-XUzwLpW4_VfWkDOH8vuJ4TAo+Wgj+uPFS4DWSox1wg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sp-XUzwLpW4_VfWkDOH8vuJ4TAo+Wgj+uPFS4DWSox1wg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] libwebsockets: Fix the build with -Os
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
X-List-Received-Date: Thu, 29 Aug 2019 20:25:57 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Aug 29, 2019 at 12:54:16PM -0700, Khem Raj wrote:
> On Thu, Aug 29, 2019 at 12:14 PM Adrian Bunk <bunk@stusta.de> wrote:
> >
> > On Thu, Aug 29, 2019 at 11:46:55AM -0700, Khem Raj wrote:
> > > On Thu, Aug 29, 2019 at 3:39 AM Adrian Bunk <bunk@stusta.de> wrote:
> > > >
> > > > lib/event-libs/libuv/libuv.c: In function 'elops_destroy_context1_uv':
> > > > lib/event-libs/libuv/libuv.c:519:7: error: 'm' may be used uninitialized in this function [-Werror=maybe-uninitialized]
> > > >     if (m)
> > > >        ^
> > > >
> > > > Signed-off-by: Adrian Bunk <bunk@stusta.de>
> > > > ---
> > > >  .../recipes-connectivity/libwebsockets/libwebsockets_3.1.0.bb   | 2 ++
> > > >  1 file changed, 2 insertions(+)
> > > >
> > > > diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_3.1.0.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_3.1.0.bb
> > > > index 50620d99e..fcabeb902 100644
> > > > --- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_3.1.0.bb
> > > > +++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_3.1.0.bb
> > > > @@ -28,3 +28,5 @@ EXTRA_OECMAKE += " \
> > > >  PACKAGES =+ "${PN}-testapps"
> > > >
> > > >  FILES_${PN}-testapps += "${datadir}/libwebsockets-test-server/*"
> > > > +
> > > > +CFLAGS_append = " -Wno-error"
> > >
> > > is it possible to fix the underlying problem? since Os is not default
> > > it definitely could be a bug in upstream but
> > > by disabling warnings for all kind of builds we are  painting with broad brush
> >
> > The underlying problem is that some gcc warnings are not reliable with -Os,
> > there are bugs open in the gcc bugzilla for that.
> >
> I am aware of that for maybe-* warnings heuristics may go wrong, but
> then its better to just disable that
> one warning from being treated as error if thats possible to add
> easily something like
> -Wno-error=maybe-uninitialized could do it.

And then the package fails to build due to a different warning after the 
next gcc upgrade.

The few packages that manually set -Werror are causing so much trouble,
and seeing warnings as errors in this code from 2018 that is currently
298 commits behind upstream master won't bring actual benefits even
when the warnings are not gcc bugs.

If you are interested in warnings you shouldn't have -Werror in very few 
packages, but check for the most problematic warnings in all packages.

E.g. -Wimplicit-function-declaration warnings are often the cause for
runime crashes, and a quick grep through my build logs shows that your
gettid patches to snort/lttng-tools/lttng-ust are not correct.[1]

cu
Adrian

[1] pid_t is an int in glibc, which makes the lack of prototypes
    harmless in this specific case.

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


