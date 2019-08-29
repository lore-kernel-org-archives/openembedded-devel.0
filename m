Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id DA8966C108
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2019 22:09:43 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id m2so4410334qkd.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2019 15:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3PL2k8ZwmyDOUY8JcR5vg9VNZm4aKCKSwS1h0hZlc/Q=;
	b=MbrSlGJPUD6RGw1AZYGQ1ZD5BkJ/MzZK+ZG/iK3orsVC2Nq/jK3ygtOBA+ZhGEst4C
	OJAA1MNKAEZRic67wsg4ji5PTJd3rRwjSdg2pv8vjR8N4s3bUFph9NOOkp1bVtqyHjjR
	AuWoF9h7MfP++Q6OOMuJbAKBvOM8vpER/wOlarwsduM4LSCYU0mHOJR55egXbks6bzgP
	jCNbFlKWRmM3q8zEIQGd4Se2OSMzIw05vGLlusDZmVKf2yO1GOQYnxvqyT7he5GlOBJw
	g10q4HaPFFEY9hxKrieuU1qbLzGIXFbIe0UJuK+Lvq1uFBhY3iU64IKtt2gWmJsDaKYr
	lhyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3PL2k8ZwmyDOUY8JcR5vg9VNZm4aKCKSwS1h0hZlc/Q=;
	b=QJ8+xtGSKH2LjRMBCBarB9RhWLWe0zZTVaC0pZuS81jVxTgh1jVzFTRu6XQN7Q0ewH
	viaCFOa7oTFQdl6bbZVXrwgp2y8vFuljinge5Uiplb8/6XJ6w8t7btJ7t8Sfi9J8OQgS
	/WX9wdPYOt3aJei1zNU6HH5oYkbp25SkF9RAp2DJXBK4/xi3owk15eLqlljsG6H6WHxD
	aA9ybrBQx2MN4dJVen8wgUsh4+JeTC+02vM9rZaniHoy2l4aKnDjk8P/bHlC56x6POg/
	5FX7qrohNuo05npNfh+LG595yED/oO+eg8QoJEqVzr8KRVgfrp1E2KvAwf19YZXT9uH/
	7Chg==
X-Gm-Message-State: APjAAAVP5VFKoVuu7AbVYHwrRIJN2yYIzEWtf0m/CuLS+vXkidX4Nd9c
	sbuu9IpN5oCJxDihVaeMLS124+s18QH5SjuW4Fw=
X-Google-Smtp-Source: APXvYqyyWwdbHOT4L6Sok9fisnIQ6ipzkfLXKvkMcabIwWB7QoUANV4E2ll1aNsJvyGZBNfXNNSLFcS7maMwbJIzI7o=
X-Received: by 2002:a37:b245:: with SMTP id b66mr12331911qkf.337.1567116584200;
	Thu, 29 Aug 2019 15:09:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190829103934.21804-1-bunk@stusta.de>
	<CAMKF1srGz8Zw4vh3_9GJsbmrKzARCrVHrs9k9tmd=aAznXHTHA@mail.gmail.com>
	<20190829191417.GA24691@localhost>
	<CAMKF1sp-XUzwLpW4_VfWkDOH8vuJ4TAo+Wgj+uPFS4DWSox1wg@mail.gmail.com>
	<20190829202554.GC24691@localhost>
	<CAMKF1sp0NpB-JgQSxvHCYurYtccv1NfU61a=VvTnYB+yArbrPQ@mail.gmail.com>
	<20190829212352.GD24691@localhost>
In-Reply-To: <20190829212352.GD24691@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 29 Aug 2019 15:09:17 -0700
Message-ID: <CAMKF1srqhNCYgMHkumXFda=ZLLfMOJB5ZhZJtMi00SpL5GTRYw@mail.gmail.com>
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
X-List-Received-Date: Thu, 29 Aug 2019 22:09:44 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 29, 2019 at 2:23 PM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Thu, Aug 29, 2019 at 01:51:05PM -0700, Khem Raj wrote:
> > On Thu, Aug 29, 2019 at 1:25 PM Adrian Bunk <bunk@stusta.de> wrote:
> > >
> > > On Thu, Aug 29, 2019 at 12:54:16PM -0700, Khem Raj wrote:
> > > > On Thu, Aug 29, 2019 at 12:14 PM Adrian Bunk <bunk@stusta.de> wrote:
> > > > >
> > > > > On Thu, Aug 29, 2019 at 11:46:55AM -0700, Khem Raj wrote:
> > > > > > On Thu, Aug 29, 2019 at 3:39 AM Adrian Bunk <bunk@stusta.de> wrote:
> > > > > > >
> > > > > > > lib/event-libs/libuv/libuv.c: In function 'elops_destroy_context1_uv':
> > > > > > > lib/event-libs/libuv/libuv.c:519:7: error: 'm' may be used uninitialized in this function [-Werror=maybe-uninitialized]
> > > > > > >     if (m)
> > > > > > >        ^
> > > > > > >
> > > > > > > Signed-off-by: Adrian Bunk <bunk@stusta.de>
> > > > > > > ---
> > > > > > >  .../recipes-connectivity/libwebsockets/libwebsockets_3.1.0.bb   | 2 ++
> > > > > > >  1 file changed, 2 insertions(+)
> > > > > > >
> > > > > > > diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_3.1.0.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_3.1.0.bb
> > > > > > > index 50620d99e..fcabeb902 100644
> > > > > > > --- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_3.1.0.bb
> > > > > > > +++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_3.1.0.bb
> > > > > > > @@ -28,3 +28,5 @@ EXTRA_OECMAKE += " \
> > > > > > >  PACKAGES =+ "${PN}-testapps"
> > > > > > >
> > > > > > >  FILES_${PN}-testapps += "${datadir}/libwebsockets-test-server/*"
> > > > > > > +
> > > > > > > +CFLAGS_append = " -Wno-error"
> > > > > >
> > > > > > is it possible to fix the underlying problem? since Os is not default
> > > > > > it definitely could be a bug in upstream but
> > > > > > by disabling warnings for all kind of builds we are  painting with broad brush
> > > > >
> > > > > The underlying problem is that some gcc warnings are not reliable with -Os,
> > > > > there are bugs open in the gcc bugzilla for that.
> > > > >
> > > > I am aware of that for maybe-* warnings heuristics may go wrong, but
> > > > then its better to just disable that
> > > > one warning from being treated as error if thats possible to add
> > > > easily something like
> > > > -Wno-error=maybe-uninitialized could do it.
> > >
> > > And then the package fails to build due to a different warning after the
> > > next gcc upgrade.
> > >
> >
> > which is fine, since we can report it upstream to either gcc if its
> > gcc's fault or to package itself
>
> This is often a waste of time since the code in OE is often much older
> than upstream master.
>

which is partly because we dont have conducive workflow and tooling
for devs to upstream the patches or
consider building master branch of upstream repos easily. Maybe some
thought for future enhancements where
we can have a develop mode for packages which we can use for doing
this kind of work.

> > and better still with a patch.
>
> But please do not add such patches to OE.
>
> Patches from people who don't know the code well are often quite buggy,
> and fixing warnings then tends to add more bugs than it fixes.
>
> Google "Debian OpenSSL disaster" for how the Debian maintainer "fixing"
> a Valgrind warning in the Debian OpenSSL package made private keys used
> for ssh authentication in Debian/Ubuntu predictable (AKA everyone on the
> internet could log into the affected machines).
>

right I remember that, but then I also know first-hand cases where the
compiler was telling you all the way and it was
ignored which ended up in field bugs, so there is no right answer.

> > Ideally we should use package defaults
> > or maybe be more strict
> >  If everyone stop using these warnings then why is compiler adding
> > them in the first place
> > here I realize lies the difference of opinion.
>
> When you are developing software these warnings are very useful.
>
> A distribution is not developing software, it is distributing
> software developed by other people.
>

we also provide development environment along with distro building
tools so its in interest for us to enable
not only packagers but also package developers

> > > The few packages that manually set -Werror are causing so much trouble,
> > > and seeing warnings as errors in this code from 2018 that is currently
> > > 298 commits behind upstream master won't bring actual benefits even
> > > when the warnings are not gcc bugs.
> > >
> > > If you are interested in warnings you shouldn't have -Werror in very few
> > > packages, but check for the most problematic warnings in all packages.
> > >
> > > E.g. -Wimplicit-function-declaration warnings are often the cause for
> > > runime crashes, and a quick grep through my build logs shows that your
> > > gettid patches to snort/lttng-tools/lttng-ust are not correct.[1]
> >
> > maybe you should explain a bit more why they not correct
> > these patches are to define local gettid function if system libc does
> > not provide it
> > there is a new syscall wrapper in glibc 2.30, older glibcs wont have it.
>
> ...
> ../../../../lttng-tools-2.10.7/src/common/error.h:154:27: warning: implicit declaration of function 'getpid'; did you mean 'getpt'? [-Wimplicit-function-declaration]
> ../../../../lttng-tools-2.10.7/src/common/error.h:154:44: warning: implicit declaration of function 'gettid'; did you mean 'getcpu'? [-Wimplicit-function-declaration]
> ...
>
> You ifdef'ed away the #include <unistd.h> that provides the prototypes
> for these functions in glibc 2.30.
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

