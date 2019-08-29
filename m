Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 9A0097F39B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2019 20:51:30 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id u34so5318135qte.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2019 13:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5LDFpcFm+ggjV3P3WmXQlqdempA4lj6apMrS4QhUpIA=;
	b=nqk3+JSAbMAx7FHF/7zbcg5ZCVmUD2FtCiPPt4OGTbjwjHMupJ43CtpvLjGpRSxEpX
	gm5af/CS+kUhX74QMpUqdtITKXC9Tmc3cDF4wrMSHP5xmYcMOa5T7bQd6oKNAimil0ij
	pVvCtiv4F+Ux2EfKB77MKVmEyzpURliIqe++m8oxBwOrNVjDMQVn4HG8brm7QH7k8avb
	hCJKapa7jF81ZDuvodBzr7HAY8GwMzYT/MoQkVS7Ys+7VPUtQbQLxyEzX8RaU1v8jn4N
	dAZAx/dht3Xju1hcbxNszzMJ1tv6xCX+O8iNuXwiZcsgHJKEJni93ymI/ZSF4cy2NeFV
	M6ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5LDFpcFm+ggjV3P3WmXQlqdempA4lj6apMrS4QhUpIA=;
	b=bP3D1hTfe4DqoGrdFIlq/9NcjAh0rmxvYfwKFdD1P8ILsB/v8D1ahfrmURq5VljlzI
	CY4GlNcNEsUjaTb6EP5Fm1uTC21c1mtMEBIPWPbD8DOiSRSBI+JkEwvdXinZr0yiOrv0
	LKjpIQTSKzr5uxtK/2Vw0SogJSnWAekiU/8SeqnVFAr47FI7wzUf38Ds+b17Qq6Dpfdh
	LRHxCIHdrCvZFya/oyoGxUSiDTdIZ+iDkI0IKijXsjjTBgDIn31Cn7OJ/zag4O8p4XGP
	RbuKZ4TEVAVM3AsAsASWae7d77Ooy5BEBMbh06JS9WUNCoaehnQ1dmZ1oNcp9QbaounX
	Shbw==
X-Gm-Message-State: APjAAAWoaR0ya4U9XaMzjaCu+NlNbgYclxqt1JuTrknswMEB+CZOfCNk
	cEB0fJDtTMqEBm1AZuVzQOAIe56Nhq59Y8WltJ6Y2I9y
X-Google-Smtp-Source: APXvYqzEH4cdgkZN3Ja5r3PECi5o6NA3Ru7xptuWuY9t5HYe88AEmh1OGjtqe/c9Aw4XBP9xoN7dz77jnxHgMz2OTZk=
X-Received: by 2002:ac8:7445:: with SMTP id h5mr12063668qtr.53.1567111891034; 
	Thu, 29 Aug 2019 13:51:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190829103934.21804-1-bunk@stusta.de>
	<CAMKF1srGz8Zw4vh3_9GJsbmrKzARCrVHrs9k9tmd=aAznXHTHA@mail.gmail.com>
	<20190829191417.GA24691@localhost>
	<CAMKF1sp-XUzwLpW4_VfWkDOH8vuJ4TAo+Wgj+uPFS4DWSox1wg@mail.gmail.com>
	<20190829202554.GC24691@localhost>
In-Reply-To: <20190829202554.GC24691@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 29 Aug 2019 13:51:05 -0700
Message-ID: <CAMKF1sp0NpB-JgQSxvHCYurYtccv1NfU61a=VvTnYB+yArbrPQ@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
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
X-List-Received-Date: Thu, 29 Aug 2019 20:51:30 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 29, 2019 at 1:25 PM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Thu, Aug 29, 2019 at 12:54:16PM -0700, Khem Raj wrote:
> > On Thu, Aug 29, 2019 at 12:14 PM Adrian Bunk <bunk@stusta.de> wrote:
> > >
> > > On Thu, Aug 29, 2019 at 11:46:55AM -0700, Khem Raj wrote:
> > > > On Thu, Aug 29, 2019 at 3:39 AM Adrian Bunk <bunk@stusta.de> wrote:
> > > > >
> > > > > lib/event-libs/libuv/libuv.c: In function 'elops_destroy_context1_uv':
> > > > > lib/event-libs/libuv/libuv.c:519:7: error: 'm' may be used uninitialized in this function [-Werror=maybe-uninitialized]
> > > > >     if (m)
> > > > >        ^
> > > > >
> > > > > Signed-off-by: Adrian Bunk <bunk@stusta.de>
> > > > > ---
> > > > >  .../recipes-connectivity/libwebsockets/libwebsockets_3.1.0.bb   | 2 ++
> > > > >  1 file changed, 2 insertions(+)
> > > > >
> > > > > diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_3.1.0.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_3.1.0.bb
> > > > > index 50620d99e..fcabeb902 100644
> > > > > --- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_3.1.0.bb
> > > > > +++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_3.1.0.bb
> > > > > @@ -28,3 +28,5 @@ EXTRA_OECMAKE += " \
> > > > >  PACKAGES =+ "${PN}-testapps"
> > > > >
> > > > >  FILES_${PN}-testapps += "${datadir}/libwebsockets-test-server/*"
> > > > > +
> > > > > +CFLAGS_append = " -Wno-error"
> > > >
> > > > is it possible to fix the underlying problem? since Os is not default
> > > > it definitely could be a bug in upstream but
> > > > by disabling warnings for all kind of builds we are  painting with broad brush
> > >
> > > The underlying problem is that some gcc warnings are not reliable with -Os,
> > > there are bugs open in the gcc bugzilla for that.
> > >
> > I am aware of that for maybe-* warnings heuristics may go wrong, but
> > then its better to just disable that
> > one warning from being treated as error if thats possible to add
> > easily something like
> > -Wno-error=maybe-uninitialized could do it.
>
> And then the package fails to build due to a different warning after the
> next gcc upgrade.
>

which is fine, since we can report it upstream to either gcc if its
gcc's fault or to package itself
and better still with a patch. Ideally we should use package defaults
or maybe be more strict
 If everyone stop using these warnings then why is compiler adding
them in the first place
here I realize lies the difference of opinion.

> The few packages that manually set -Werror are causing so much trouble,
> and seeing warnings as errors in this code from 2018 that is currently
> 298 commits behind upstream master won't bring actual benefits even
> when the warnings are not gcc bugs.
>
> If you are interested in warnings you shouldn't have -Werror in very few
> packages, but check for the most problematic warnings in all packages.
>
> E.g. -Wimplicit-function-declaration warnings are often the cause for
> runime crashes, and a quick grep through my build logs shows that your
> gettid patches to snort/lttng-tools/lttng-ust are not correct.[1]
>

maybe you should explain a bit more why they not correct
these patches are to define local gettid function if system libc does
not provide it
there is a new syscall wrapper in glibc 2.30, older glibcs wont have it.

> cu
> Adrian
>
> [1] pid_t is an int in glibc, which makes the lack of prototypes
>     harmless in this specific case.
>
> --
>
>        "Is there not promise of rain?" Ling Tan asked suddenly out
>         of the darkness. There had been need of rain for many days.
>        "Only a promise," Lao Er said.
>                                        Pearl S. Buck - Dragon Seed
>

