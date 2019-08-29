Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id AE56B7E5FA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2019 21:23:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46KFwV3MLvz3J;
	Thu, 29 Aug 2019 23:23:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1567113834;
	bh=xIlDANoBK2asWa0JfgXIohj9I9mK/z0GWeA3jNbmI1Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FFAHMCJWDmLgo/PVSBlfRy3ye5LFDhCBnG/jp/hjYNfSPJm5Sv+DlMXywXDONpbVe
	xPAvCORGQ1IGM1Ytq3Lhk8TSc3FUAmDqfT46g/cT+Zav3e9Ac+EhSKToQtexsgYX/I
	/YozWsBh+Y/b9vO/hcvQqGRpzVz7MI2SRePQx7bYgkUdbkQ6W4CNACtuEKH0PO3BBt
	MKPPG3/Hye0ZO72aAePK1CHohWsbqa869Kv7rhlLZ1xor6XZzFhvW+L9wgRwfCYW1q
	qzXCDTWWQjlSydaRoT7/LEdjCRBfGF1GHGFujrZk/hC9W5OZDwN4Tjj2CMXGy/WhoL
	eKmmyu7sPB2fi/ybm6OeGrv75KIVRfmSUjTuPOZ/lDqAH0UJD2FZMEJplImP04HzHn
	oa/RBqeEh5xzXOoq2V1GU/rMlsbAuVWlYbMH2DYhdPDsdiFsszllhahjxPJun0xI1d
	5pv3/vT1BLKYN9OMSQU6kKbXQJ8tdYfbf53R2fWQnyiE4QbfhNtd4PGEDelAcuhMVs
	km+148lEgN9FzNzxH4evHjE63NgfuNpTqH/zPP37pXfKlhekwCHHmJ+IflN6NQpTms
	2yLBqoawLYE5HCh1ZC0Vwyzqq1pLtPq6p2tFy8rUisaAQSjLeM+IuwA1NgxQ74nM2Y
	ZAuXcuGM8Hc1zTUCn2gfxNbM=
Date: Fri, 30 Aug 2019 00:23:52 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190829212352.GD24691@localhost>
References: <20190829103934.21804-1-bunk@stusta.de>
	<CAMKF1srGz8Zw4vh3_9GJsbmrKzARCrVHrs9k9tmd=aAznXHTHA@mail.gmail.com>
	<20190829191417.GA24691@localhost>
	<CAMKF1sp-XUzwLpW4_VfWkDOH8vuJ4TAo+Wgj+uPFS4DWSox1wg@mail.gmail.com>
	<20190829202554.GC24691@localhost>
	<CAMKF1sp0NpB-JgQSxvHCYurYtccv1NfU61a=VvTnYB+yArbrPQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sp0NpB-JgQSxvHCYurYtccv1NfU61a=VvTnYB+yArbrPQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 29 Aug 2019 21:23:55 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Aug 29, 2019 at 01:51:05PM -0700, Khem Raj wrote:
> On Thu, Aug 29, 2019 at 1:25 PM Adrian Bunk <bunk@stusta.de> wrote:
> >
> > On Thu, Aug 29, 2019 at 12:54:16PM -0700, Khem Raj wrote:
> > > On Thu, Aug 29, 2019 at 12:14 PM Adrian Bunk <bunk@stusta.de> wrote:
> > > >
> > > > On Thu, Aug 29, 2019 at 11:46:55AM -0700, Khem Raj wrote:
> > > > > On Thu, Aug 29, 2019 at 3:39 AM Adrian Bunk <bunk@stusta.de> wrote:
> > > > > >
> > > > > > lib/event-libs/libuv/libuv.c: In function 'elops_destroy_context1_uv':
> > > > > > lib/event-libs/libuv/libuv.c:519:7: error: 'm' may be used uninitialized in this function [-Werror=maybe-uninitialized]
> > > > > >     if (m)
> > > > > >        ^
> > > > > >
> > > > > > Signed-off-by: Adrian Bunk <bunk@stusta.de>
> > > > > > ---
> > > > > >  .../recipes-connectivity/libwebsockets/libwebsockets_3.1.0.bb   | 2 ++
> > > > > >  1 file changed, 2 insertions(+)
> > > > > >
> > > > > > diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_3.1.0.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_3.1.0.bb
> > > > > > index 50620d99e..fcabeb902 100644
> > > > > > --- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_3.1.0.bb
> > > > > > +++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_3.1.0.bb
> > > > > > @@ -28,3 +28,5 @@ EXTRA_OECMAKE += " \
> > > > > >  PACKAGES =+ "${PN}-testapps"
> > > > > >
> > > > > >  FILES_${PN}-testapps += "${datadir}/libwebsockets-test-server/*"
> > > > > > +
> > > > > > +CFLAGS_append = " -Wno-error"
> > > > >
> > > > > is it possible to fix the underlying problem? since Os is not default
> > > > > it definitely could be a bug in upstream but
> > > > > by disabling warnings for all kind of builds we are  painting with broad brush
> > > >
> > > > The underlying problem is that some gcc warnings are not reliable with -Os,
> > > > there are bugs open in the gcc bugzilla for that.
> > > >
> > > I am aware of that for maybe-* warnings heuristics may go wrong, but
> > > then its better to just disable that
> > > one warning from being treated as error if thats possible to add
> > > easily something like
> > > -Wno-error=maybe-uninitialized could do it.
> >
> > And then the package fails to build due to a different warning after the
> > next gcc upgrade.
> >
> 
> which is fine, since we can report it upstream to either gcc if its
> gcc's fault or to package itself

This is often a waste of time since the code in OE is often much older 
than upstream master.

> and better still with a patch.

But please do not add such patches to OE.

Patches from people who don't know the code well are often quite buggy,
and fixing warnings then tends to add more bugs than it fixes.

Google "Debian OpenSSL disaster" for how the Debian maintainer "fixing" 
a Valgrind warning in the Debian OpenSSL package made private keys used 
for ssh authentication in Debian/Ubuntu predictable (AKA everyone on the 
internet could log into the affected machines).

> Ideally we should use package defaults
> or maybe be more strict
>  If everyone stop using these warnings then why is compiler adding
> them in the first place
> here I realize lies the difference of opinion.

When you are developing software these warnings are very useful.

A distribution is not developing software, it is distributing 
software developed by other people.

> > The few packages that manually set -Werror are causing so much trouble,
> > and seeing warnings as errors in this code from 2018 that is currently
> > 298 commits behind upstream master won't bring actual benefits even
> > when the warnings are not gcc bugs.
> >
> > If you are interested in warnings you shouldn't have -Werror in very few
> > packages, but check for the most problematic warnings in all packages.
> >
> > E.g. -Wimplicit-function-declaration warnings are often the cause for
> > runime crashes, and a quick grep through my build logs shows that your
> > gettid patches to snort/lttng-tools/lttng-ust are not correct.[1]
> 
> maybe you should explain a bit more why they not correct
> these patches are to define local gettid function if system libc does
> not provide it
> there is a new syscall wrapper in glibc 2.30, older glibcs wont have it.

...
../../../../lttng-tools-2.10.7/src/common/error.h:154:27: warning: implicit declaration of function 'getpid'; did you mean 'getpt'? [-Wimplicit-function-declaration]
../../../../lttng-tools-2.10.7/src/common/error.h:154:44: warning: implicit declaration of function 'gettid'; did you mean 'getcpu'? [-Wimplicit-function-declaration]
...

You ifdef'ed away the #include <unistd.h> that provides the prototypes 
for these functions in glibc 2.30.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


