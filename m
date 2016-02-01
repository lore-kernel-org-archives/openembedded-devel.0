Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-vk0-f43.google.com (mail-vk0-f43.google.com
	[209.85.213.43])
	by mail.openembedded.org (Postfix) with ESMTP id DF9047721C;
	Mon,  1 Feb 2016 13:33:56 +0000 (UTC)
Received: by mail-vk0-f43.google.com with SMTP id e64so77294990vkg.0;
	Mon, 01 Feb 2016 05:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=aZ59fxWAzb620WISl1KAKdfF9oLhm/Vd7RS0/VJiLeU=;
	b=lefHtpIjaif4ZvI564Zn8p/Tu/b2NnzDIfnj/+9dA4O5DWSilsvPlEa5/VPpCiXyhu
	u4/XbK215/WLUaSmEixwUcSKeF/NnWpKD1fH+yL/+5D8FqJIqywByU3V3O/MxV5Dj5JZ
	tfp1dAWkMLmRfqv2sdd9SnRU/22FRrjGCyBbl5WVInt2bl+7GeW43PxHb1d/eJKmxnf7
	jhk4b93ejaGxGhRIDLs/03PPJLu7vCNn/+udmKRnf2ptZRufa4Fihzsaj5LOR5G1cGNs
	KLg6IHF2+/HsuUJs6gbbdlX46Oy/LyIVvZfYYAiY78qJ0WTMTER09aZyjskiaIQplUi1
	5muQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=aZ59fxWAzb620WISl1KAKdfF9oLhm/Vd7RS0/VJiLeU=;
	b=N20EMJ3VVR6MeZSW5cdwd+23lyfnZL1GeJpEzj1ccW0Oa4xAEi0OzfuxrnpkX7b2en
	ia0KDIwB+Oezv6qIRYuN8xXzL+K4ZzDHsekB3Lhq31/6ECa0cfDpLbUYBIPa8397DtVP
	9P1EiCQgzKjhrPwHHvCLOQlRtnJJD7R+XW2Uj3dpE/Mpx2VM+pQMrDUDHgS2guSOQ5ec
	eJmeW42RNfrZC726k3jzWt8XDZrHO/NFOR7XsWx15ETB8Yg+v9my9lx39/ouy7Su+Cj8
	7YqVAccbYuBisvju6ntwImJkSAnFqDdQISX7lVjnsHcHB5TtWIlbOU6aIQxTHU50p+FV
	BuWg==
X-Gm-Message-State: AG10YOQ0zdQhFQxV11COx8V0hi63UYLYe4kTiYucewBFbMtsYLu8VPSLSa3Y0PJ0FwuSWZXdC7h6lGnZ5DR/vg==
MIME-Version: 1.0
X-Received: by 10.31.50.65 with SMTP id y62mr15930460vky.11.1454333637246;
	Mon, 01 Feb 2016 05:33:57 -0800 (PST)
Received: by 10.31.202.196 with HTTP; Mon, 1 Feb 2016 05:33:57 -0800 (PST)
In-Reply-To: <20160201104527.GB2803@jama>
References: <1453200318-25633-1-git-send-email-alexandru.but@ni.com>
	<20160129180157.GA15053@jama>
	<20160201092403.GA4183@zdravan.emea.corp.natinst.com>
	<20160201104527.GB2803@jama>
Date: Mon, 1 Feb 2016 08:33:57 -0500
Message-ID: <CADkTA4MCnK-i7QTejQcusLV1Pm-FShd67CdqzrS9u5d1BS8M7w@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>, alexandru.but@ni.com
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] linux-yocto issues Was: [meta-oe][PATCH] efivar: fix zero initializer compiler error
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
X-List-Received-Date: Mon, 01 Feb 2016 13:33:57 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 1, 2016 at 5:45 AM, Martin Jansa <martin.jansa@gmail.com> wrote:

> On Mon, Feb 01, 2016 at 11:24:03AM +0200, Alexandru But wrote:
> > On Fri, Jan 29, 2016 at 07:01:57PM +0100, Martin Jansa wrote:
> > > On Tue, Jan 19, 2016 at 12:45:18PM +0200, Alexandru But wrote:
> > > > Patch based on commit a3606c0:
> > > > Sometimes the compiler doesn't like { 0,} as an initializer
> > >
> > > Probably not caused by this change, but efivar now fails to build in
> > > world build for qemuarm:
> > >
> > > | linux.c: In function 'eb_nvme_ns_id':
> > > | linux.c:48:27: error: 'NVME_IOCTL_ID' undeclared (first use in this
> function)
> > > |   uint64_t ret = ioctl(fd, NVME_IOCTL_ID, NULL);
> > > |                            ^
> > > | linux.c:48:27: note: each undeclared identifier is reported only
> once for each function it appears in
> > > | make[1]: *** [linux.o] Error 1
> > > | make[1]: Leaving directory
> `/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/efivar/0.21-r0/git/src'
> > > | make: *** [src] Error 2
> > > | ERROR: oe_runmake failed
> > > | ERROR: Function failed: do_compile (log file is located at
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/efivar/0.21-r0/temp/log.do_compile.8376)
> > > NOTE: recipe efivar-0.21-r0: task do_compile: Failed
> > > ERROR: Task 5672
> (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/efivar/
> efivar_0.21.bb, do_compile) failed with exit code '1'
> > >
> >
> > Yes, I saw the error, and indeed is not related to this change. The
> problem is
> > that NVMe uapi header was renamed from nvme.h to nvme_ioctl.h. Here is
> the
> > change:
> >
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=9d99a8dda154f38307d43d9c9aa504bd3703d596
> >
> > The Kconfig update unfortunately hasn't been change in the same time. It
> was
> > commited to the kernel only recently and will most likely be present in
> 4.5.
> >
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=a9cf8284b45110a4d98aea180a89c857e53bf850
> >
> > In the standard/base repository that yocto uses, only the first of the
> above
> > changes have been pulled. The old header has a new name, so the desired
> macro
> > is no longer there. The problem could be solved from the utility point
> of view
> > with a patch that gentoo tree already has:
> >
> https://gitweb.gentoo.org/repo/gentoo.git/tree/sys-libs/efivar/files/0.21-nvme_ioctl.h.patch
> >
> > The problem is that even with this change the new header will not be
> found since
> > the second change is not yet in the yocto repo. I cherry-picked and
> created all
> > the changes above, but efivar still does not find the new header.
> > Problem is that the headers from sysroot are built by linux-libc-headers
> and
> > this recipe uses the static 4.4 linux release archive from kernel.org.
> If all
> > the above are pulled in and linux-libc-headers are using sources with
> both
> > changes, than efivar build will pass.
> >
> > From my point of view the possible solutions for this problem are:
> > - Push the efivar patch and blacklist the recipe until
> linux-libc-headers points
> >   to 4.5
> > - Revert the rename change in the yocto kernel repo and apply the efivar
> patch
> >   after 4.5 token
> > - Apply the efivar patch, and a patch for linux-libc-headers
> > - Escalate the problem to the kernel comunity to backport the Kconfig
> change to
> >   4.4
> >
> > I am not sure which is the right approach since they all have downsides.
>
> Thanks for detailed analysis, I don't use efivar or linux-yocto, so I
> was reporting the issue only because I wasn't able to even build-test
> your change in jenkins.
>
> Adding oe-core and Bruce, because the issue is in
> linux-yocto/linux-libc-headers maintained there.
>
>
Thanks Martin and Alexandru,

Alexandru: since we'd like to fix this everywhere, and not just someone
building,
against linux-yocto .. and I'd rather not wait until the 4.5 kernel is
released (so
I can bump the libc-headers).

I'd suggest that we patch linux-libc-headers to have the proper
definitions, can
you prepare a patch, since you are currently building efivar and can
quickly confim
a fix ?

We can also nominate the Kconfig change to be backported to 4.4, but we can
get things working in the mean time.

Cheers,

Bruce




> Regards,
>
> > > > Signed-off-by: Alexandru But <alexandru.but@ni.com>
> > > > ---
> > > >  ...he-compiler-doesn-t-like-0-as-an-initiali.patch | 42
> ++++++++++++++++++++++
> > > >  meta-oe/recipes-extended/efivar/efivar_0.21.bb     |  3 +-
> > > >  2 files changed, 44 insertions(+), 1 deletion(-)
> > > >  create mode 100644
> meta-oe/recipes-extended/efivar/efivar/0001-Sometimes-the-compiler-doesn-t-like-0-as-an-initiali.patch
> > > >
> > > > diff --git
> a/meta-oe/recipes-extended/efivar/efivar/0001-Sometimes-the-compiler-doesn-t-like-0-as-an-initiali.patch
> b/meta-oe/recipes-extended/efivar/efivar/0001-Sometimes-the-compiler-doesn-t-like-0-as-an-initiali.patch
> > > > new file mode 100644
> > > > index 0000000..68cabd6
> > > > --- /dev/null
> > > > +++
> b/meta-oe/recipes-extended/efivar/efivar/0001-Sometimes-the-compiler-doesn-t-like-0-as-an-initiali.patch
> > > > @@ -0,0 +1,42 @@
> > > > +From a3606c02fd271d32e364fcc540e34ba1899309f6 Mon Sep 17 00:00:00
> 2001
> > > > +From: Peter Jones <pjones@redhat.com>
> > > > +Date: Tue, 14 Jul 2015 09:33:54 -0400
> > > > +Subject: [PATCH] Sometimes the compiler doesn't like { 0, } as an
> > > > + initializer...
> > > > +
> > > > +Because it really wants to be { {0, },} or something, and sometimes
> the
> > > > +compiler, knowing full well what we're trying to do, likes to
> complain
> > > > +about the rigor applied to our technique in doing it.
> > > > +
> > > > +memset() the struct ifreq to 0 instead so I don't need to figure
> out its
> > > > +internal structure just to zero it out.
> > > > +
> > > > +Resolves #28
> > > > +
> > > > +Signed-off-by: Peter Jones <pjones@redhat.com>
> > > > +---
> > > > + src/linux.c | 3 ++-
> > > > + 1 file changed, 2 insertions(+), 1 deletion(-)
> > > > +
> > > > +diff --git a/src/linux.c b/src/linux.c
> > > > +index 57f71f3..817b8e6 100644
> > > > +--- a/src/linux.c
> > > > ++++ b/src/linux.c
> > > > +@@ -847,12 +847,13 @@ ssize_t
> > > > + __attribute__((__visibility__ ("hidden")))
> > > > + make_mac_path(uint8_t *buf, ssize_t size, const char * const
> ifname)
> > > > + {
> > > > +-        struct ifreq ifr = { 0, };
> > > > ++        struct ifreq ifr;
> > > > +         struct ethtool_drvinfo drvinfo = { 0, };
> > > > +         int fd, rc;
> > > > +         ssize_t ret = -1, sz, off=0;
> > > > +         char busname[PATH_MAX+1] = "";
> > > > +
> > > > ++        memset(&ifr, 0, sizeof (ifr));
> > > > +         strncpy(ifr.ifr_name, ifname, IF_NAMESIZE);
> > > > +         drvinfo.cmd = ETHTOOL_GDRVINFO;
> > > > +         ifr.ifr_data = (caddr_t)&drvinfo;
> > > > +--
> > > > +2.6.1
> > > > +
> > > > diff --git a/meta-oe/recipes-extended/efivar/efivar_0.21.bb
> b/meta-oe/recipes-extended/efivar/efivar_0.21.bb
> > > > index b5ef90a..1684a10 100644
> > > > --- a/meta-oe/recipes-extended/efivar/efivar_0.21.bb
> > > > +++ b/meta-oe/recipes-extended/efivar/efivar_0.21.bb
> > > > @@ -8,7 +8,8 @@ LIC_FILES_CHKSUM =
> "file://COPYING;md5=6626bb1e20189cfa95f2c508ba286393"
> > > >  DEPENDS_class-target = "popt efivar-native"
> > > >
> > > >  SRCREV = "aab6c2a64d90b6e5a63661fb5bd6be8d878b0784"
> > > > -SRC_URI = "git://github.com/rhinstaller/efivar.git"
> > > > +SRC_URI = "git://github.com/rhinstaller/efivar.git \
> > > > +
>  file://0001-Sometimes-the-compiler-doesn-t-like-0-as-an-initiali.patch"
> > > >  SRC_URI_append_class-target = "
> file://0001-efivar-fix-for-cross-compile.patch"
> > > >  SRC_URI_append_class-native = "
> file://efivar-drop-options-not-supported-by-lower-version-gcc.patch"
> > > >
> > > > --
> > > > 2.6.1
> > > >
> > > > --
> > > > _______________________________________________
> > > > Openembedded-devel mailing list
> > > > Openembedded-devel@lists.openembedded.org
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > >
> > > --
> > > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >
> >
> >
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

