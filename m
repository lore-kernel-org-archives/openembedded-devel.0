Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1TCzEz-0008Hu-Dz
	for openembedded-devel@lists.openembedded.org;
	Sat, 15 Sep 2012 22:45:25 +0200
Received: by iaky10 with SMTP id y10so4547859iak.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Sep 2012 13:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=TQW3y7YZJ+1Eg+54eJVfkivM+CwxinaMHn4+TBCVlTs=;
	b=SsYg7J/8eytGPnys8+THz5l6oLw2Ms2SI5OhNYEpwGX+M2xStlAkl6U2dhhRRL5u8E
	HEe3qg52vYRiZKfgDM73cOM9B1eLQpIaASoI5VRGujL72x9AGgdVNipH5D3lmFBkErr/
	uQouqhe41z879v9vPcSkcesiqbhdma8xyd7FC7N3u3rWLw6xVw+XjNtcble9y/wA9yh0
	r3t4R9blkthZT7zk0VATCoHmcL8SANWILWD7V1Iy2+imoRwtnlBVZTdkT4vWpd6jel1M
	lim530T5WfCpyy3tFgOsMl+Q3x7f9BuMxTSCMwOZa1UCET8AA1uGgx3RrOdsZPZbJkuj
	eIxQ==
MIME-Version: 1.0
Received: by 10.50.152.141 with SMTP id uy13mr2869996igb.64.1347741168290;
	Sat, 15 Sep 2012 13:32:48 -0700 (PDT)
Received: by 10.64.41.98 with HTTP; Sat, 15 Sep 2012 13:32:48 -0700 (PDT)
In-Reply-To: <20120915194747.GE11051@jama.jama.net>
References: <1347737390-21615-1-git-send-email-andrea.adami@gmail.com>
	<20120915194747.GE11051@jama.jama.net>
Date: Sat, 15 Sep 2012 22:32:48 +0200
Message-ID: <CAAQYJAvoY36=8zrRpCAEHW8snfVrohoJjfcdUMV6Su7p-abTzg@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-initramfs][PATCH] linux-yocto: slob breaks usb networking, use slab
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 15 Sep 2012 20:45:25 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Sep 15, 2012 at 9:47 PM, Martin Jansa <martin.jansa@gmail.com>wrote:

> On Sat, Sep 15, 2012 at 09:29:50PM +0200, Andrea Adami wrote:
> > Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
>
> Subject: Re: [oe] [meta-initramfs][PATCH] linux-yocto: slob breaks usb
> networking, use slab
>
> s/meta-initramfs/meta-handheld/g
>
> ?
>
> > ---
> >  recipes-kernel/linux/linux-yocto/akita/akita.cfg   |    4 ++--
> >  recipes-kernel/linux/linux-yocto/c7x0/c7x0.cfg     |    4 ++--
> >  recipes-kernel/linux/linux-yocto/collie/collie.cfg |    4 ++--
> >  recipes-kernel/linux/linux-yocto/poodle/poodle.cfg |    4 ++--
> >  recipes-kernel/linux/linux-yocto/spitz/spitz.cfg   |    4 ++--
> >  recipes-kernel/linux/linux-yocto/tosa/tosa.cfg     |    4 ++--
> >  6 files changed, 12 insertions(+), 12 deletions(-)
> >
> > diff --git a/recipes-kernel/linux/linux-yocto/akita/akita.cfg
> b/recipes-kernel/linux/linux-yocto/akita/akita.cfg
> > index 6f0db54..e7ecdde 100644
> > --- a/recipes-kernel/linux/linux-yocto/akita/akita.cfg
> > +++ b/recipes-kernel/linux/linux-yocto/akita/akita.cfg
> > @@ -128,9 +128,9 @@ CONFIG_PERF_EVENTS=y
> >  # CONFIG_DEBUG_PERF_USE_VMALLOC is not set
> >  CONFIG_VM_EVENT_COUNTERS=y
> >  CONFIG_COMPAT_BRK=y
> > -# CONFIG_SLAB is not set
> > +CONFIG_SLAB=y
> >  # CONFIG_SLUB is not set
> > -CONFIG_SLOB=y
> > +# CONFIG_SLOB is not set
> >  CONFIG_PROFILING=y
> >  CONFIG_OPROFILE=m
> >  CONFIG_HAVE_OPROFILE=y
> > diff --git a/recipes-kernel/linux/linux-yocto/c7x0/c7x0.cfg
> b/recipes-kernel/linux/linux-yocto/c7x0/c7x0.cfg
> > index 5655f0d..f8d3f4d 100644
> > --- a/recipes-kernel/linux/linux-yocto/c7x0/c7x0.cfg
> > +++ b/recipes-kernel/linux/linux-yocto/c7x0/c7x0.cfg
> > @@ -128,9 +128,9 @@ CONFIG_PERF_EVENTS=y
> >  # CONFIG_DEBUG_PERF_USE_VMALLOC is not set
> >  CONFIG_VM_EVENT_COUNTERS=y
> >  CONFIG_COMPAT_BRK=y
> > -# CONFIG_SLAB is not set
> > +CONFIG_SLAB=y
> >  # CONFIG_SLUB is not set
> > -CONFIG_SLOB=y
> > +# CONFIG_SLOB is not set
> >  CONFIG_PROFILING=y
> >  CONFIG_OPROFILE=m
> >  CONFIG_HAVE_OPROFILE=y
> > diff --git a/recipes-kernel/linux/linux-yocto/collie/collie.cfg
> b/recipes-kernel/linux/linux-yocto/collie/collie.cfg
> > index 4cc5f56..2f5ead7 100644
> > --- a/recipes-kernel/linux/linux-yocto/collie/collie.cfg
> > +++ b/recipes-kernel/linux/linux-yocto/collie/collie.cfg
> > @@ -129,9 +129,9 @@ CONFIG_PERF_EVENTS=y
> >  # CONFIG_DEBUG_PERF_USE_VMALLOC is not set
> >  CONFIG_VM_EVENT_COUNTERS=y
> >  CONFIG_COMPAT_BRK=y
> > -# CONFIG_SLAB is not set
> > +CONFIG_SLAB=y
> >  # CONFIG_SLUB is not set
> > -CONFIG_SLOB=y
> > +# CONFIG_SLOB is not set
> >  CONFIG_PROFILING=y
> >  CONFIG_OPROFILE=m
> >  CONFIG_HAVE_OPROFILE=y
> > diff --git a/recipes-kernel/linux/linux-yocto/poodle/poodle.cfg
> b/recipes-kernel/linux/linux-yocto/poodle/poodle.cfg
> > index c20557e..644ff69 100644
> > --- a/recipes-kernel/linux/linux-yocto/poodle/poodle.cfg
> > +++ b/recipes-kernel/linux/linux-yocto/poodle/poodle.cfg
> > @@ -129,9 +129,9 @@ CONFIG_PERF_EVENTS=y
> >  # CONFIG_DEBUG_PERF_USE_VMALLOC is not set
> >  CONFIG_VM_EVENT_COUNTERS=y
> >  CONFIG_COMPAT_BRK=y
> > -# CONFIG_SLAB is not set
> > +CONFIG_SLAB=y
> >  # CONFIG_SLUB is not set
> > -CONFIG_SLOB=y
> > +# CONFIG_SLOB is not set
> >  CONFIG_PROFILING=y
> >  CONFIG_OPROFILE=m
> >  CONFIG_HAVE_OPROFILE=y
> > diff --git a/recipes-kernel/linux/linux-yocto/spitz/spitz.cfg
> b/recipes-kernel/linux/linux-yocto/spitz/spitz.cfg
> > index f3f6561..6a26182 100644
> > --- a/recipes-kernel/linux/linux-yocto/spitz/spitz.cfg
> > +++ b/recipes-kernel/linux/linux-yocto/spitz/spitz.cfg
> > @@ -128,9 +128,9 @@ CONFIG_PERF_EVENTS=y
> >  # CONFIG_DEBUG_PERF_USE_VMALLOC is not set
> >  CONFIG_VM_EVENT_COUNTERS=y
> >  CONFIG_COMPAT_BRK=y
> > -# CONFIG_SLAB is not set
> > +CONFIG_SLAB=y
> >  # CONFIG_SLUB is not set
> > -CONFIG_SLOB=y
> > +# CONFIG_SLOB is not set
> >  CONFIG_PROFILING=y
> >  CONFIG_OPROFILE=m
> >  CONFIG_HAVE_OPROFILE=y
> > diff --git a/recipes-kernel/linux/linux-yocto/tosa/tosa.cfg
> b/recipes-kernel/linux/linux-yocto/tosa/tosa.cfg
> > index 31c6da3..013112f 100644
> > --- a/recipes-kernel/linux/linux-yocto/tosa/tosa.cfg
> > +++ b/recipes-kernel/linux/linux-yocto/tosa/tosa.cfg
> > @@ -128,9 +128,9 @@ CONFIG_PERF_EVENTS=y
> >  # CONFIG_DEBUG_PERF_USE_VMALLOC is not set
> >  CONFIG_VM_EVENT_COUNTERS=y
> >  CONFIG_COMPAT_BRK=y
> > -# CONFIG_SLAB is not set
> > +CONFIG_SLAB=y
> >  # CONFIG_SLUB is not set
> > -CONFIG_SLOB=y
> > +# CONFIG_SLOB is not set
> >  CONFIG_PROFILING=y
> >  CONFIG_OPROFILE=m
> >  CONFIG_HAVE_OPROFILE=y
> > --
> > 1.7.8.6
> >
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> sure, please discard this one

A.A.

