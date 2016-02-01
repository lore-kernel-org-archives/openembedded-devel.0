Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id D83887017C
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Feb 2016 18:46:36 +0000 (UTC)
Received: by mail-ig0-f170.google.com with SMTP id ik10so42823511igb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Feb 2016 10:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=Rl08AMim+BbJ6JbDT14ZK8B3S5fVc9tB64Vnf7E8HQk=;
	b=Kd0A91koYm59ZIJzM+1xaEp9hTZzGcWIuCTr7PO0p9XyM5spMyibPk2EX5Ut3nRiFR
	edM9+Oahsmt4Xa2qzxcuj9cAmsxpXMsdJ6o7Fp5SBlQ8MSbqw40KwKZzq6nYFso7dTEW
	usp2vvsytB/KJLrQtvJIqWek5uLZDAt6h9XjS+LeHMgmws9EBlG/ViHf4bYZO4giBwr3
	5JWMhNkOueCDeOADq6r+0Xf+zyk45qpl5zf8PMLcaCnIL+O81Qv5WzNz7CqHaRgk+exE
	yDso7QHP452PYSamxl5ocpOrdDeXCj+RyWW61QphRoGyrDvhL5sMaFfgzhcGYNez0i52
	HlXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=Rl08AMim+BbJ6JbDT14ZK8B3S5fVc9tB64Vnf7E8HQk=;
	b=bldGZI1EXD5jTUy3oOxwPfvs67pjaIOzlKGOek2fzJyQwCz6Bzrjsm3wg7Ph+gGqj8
	dXqghUm4lCSGqSkTVVoAs7Tc1wYeG7aSPCDNoiM/SWGU93B2VrqhjTh2yMWTGgyWGRCl
	vjj7a2o7mHUHNel0PlDpnWGJ+csn4+0lSJ0MlYgV1I+G/8JWdzPTmRGmuQ/wfIPhFZhY
	MVs7orGItJqumFCZ3OA2Q0eUVNRRDUhpYNsTlkjfZGU/jkHrAVR+ZxGRXRw/Egzx4EWO
	WiWNUTRM5YJP8hL6fM63lhmkddgA4UIFYxIPIr+xxMq+wZq8qI41/Uf3waBvZ1YZ+KqU
	C7iQ==
X-Gm-Message-State: AG10YORWDSmQN3h1dj4gaQqe09EzlBB2NcxnY7rHNf9QkCF9vSmWBMRP+7ezPnJQNtVxUs4IdXi7iFIzARktxw==
X-Received: by 10.50.33.81 with SMTP id p17mr11223655igi.75.1454352397036;
	Mon, 01 Feb 2016 10:46:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.46.219 with HTTP; Mon, 1 Feb 2016 10:46:07 -0800 (PST)
In-Reply-To: <20160201092403.GA4183@zdravan.emea.corp.natinst.com>
References: <1453200318-25633-1-git-send-email-alexandru.but@ni.com>
	<20160129180157.GA15053@jama>
	<20160201092403.GA4183@zdravan.emea.corp.natinst.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 1 Feb 2016 10:46:07 -0800
Message-ID: <CAMKF1srGrCKd=u3xuYEB4c2NgBsT1KJWTW6D4DPqFaFoerowFg@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] efivar: fix zero initializer compiler error
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
X-List-Received-Date: Mon, 01 Feb 2016 18:46:37 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 1, 2016 at 1:24 AM, Alexandru But <alexandru.but@ni.com> wrote:
> On Fri, Jan 29, 2016 at 07:01:57PM +0100, Martin Jansa wrote:
>> On Tue, Jan 19, 2016 at 12:45:18PM +0200, Alexandru But wrote:
>> > Patch based on commit a3606c0:
>> > Sometimes the compiler doesn't like { 0,} as an initializer
>>
>> Probably not caused by this change, but efivar now fails to build in
>> world build for qemuarm:
>>
>> | linux.c: In function 'eb_nvme_ns_id':
>> | linux.c:48:27: error: 'NVME_IOCTL_ID' undeclared (first use in this function)
>> |   uint64_t ret = ioctl(fd, NVME_IOCTL_ID, NULL);
>> |                            ^
>> | linux.c:48:27: note: each undeclared identifier is reported only once for each function it appears in
>> | make[1]: *** [linux.o] Error 1
>> | make[1]: Leaving directory `/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/efivar/0.21-r0/git/src'
>> | make: *** [src] Error 2
>> | ERROR: oe_runmake failed
>> | ERROR: Function failed: do_compile (log file is located at /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/efivar/0.21-r0/temp/log.do_compile.8376)
>> NOTE: recipe efivar-0.21-r0: task do_compile: Failed
>> ERROR: Task 5672 (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/efivar/efivar_0.21.bb, do_compile) failed with exit code '1'
>>
>
> Yes, I saw the error, and indeed is not related to this change. The problem is
> that NVMe uapi header was renamed from nvme.h to nvme_ioctl.h. Here is the
> change:
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=9d99a8dda154f38307d43d9c9aa504bd3703d596
>
> The Kconfig update unfortunately hasn't been change in the same time. It was
> commited to the kernel only recently and will most likely be present in 4.5.
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=a9cf8284b45110a4d98aea180a89c857e53bf850
>
> In the standard/base repository that yocto uses, only the first of the above
> changes have been pulled. The old header has a new name, so the desired macro
> is no longer there. The problem could be solved from the utility point of view
> with a patch that gentoo tree already has:
> https://gitweb.gentoo.org/repo/gentoo.git/tree/sys-libs/efivar/files/0.21-nvme_ioctl.h.patch
>
> The problem is that even with this change the new header will not be found since
> the second change is not yet in the yocto repo. I cherry-picked and created all
> the changes above, but efivar still does not find the new header.
> Problem is that the headers from sysroot are built by linux-libc-headers and
> this recipe uses the static 4.4 linux release archive from kernel.org. If all
> the above are pulled in and linux-libc-headers are using sources with both
> changes, than efivar build will pass.
>
> From my point of view the possible solutions for this problem are:
> - Push the efivar patch and blacklist the recipe until linux-libc-headers points
>   to 4.5

this is usually not preferred since its far away, please propose a
backport to linux-yocto 4.4

> - Revert the rename change in the yocto kernel repo and apply the efivar patch
>   after 4.5 token
> - Apply the efivar patch, and a patch for linux-libc-headers
> - Escalate the problem to the kernel comunity to backport the Kconfig change to
>   4.4

yes thats the right long term approach.

>
> I am not sure which is the right approach since they all have downsides.
>
> Regards,
> Alex But
>
>> >
>> > Signed-off-by: Alexandru But <alexandru.but@ni.com>
>> > ---
>> >  ...he-compiler-doesn-t-like-0-as-an-initiali.patch | 42 ++++++++++++++++++++++
>> >  meta-oe/recipes-extended/efivar/efivar_0.21.bb     |  3 +-
>> >  2 files changed, 44 insertions(+), 1 deletion(-)
>> >  create mode 100644 meta-oe/recipes-extended/efivar/efivar/0001-Sometimes-the-compiler-doesn-t-like-0-as-an-initiali.patch
>> >
>> > diff --git a/meta-oe/recipes-extended/efivar/efivar/0001-Sometimes-the-compiler-doesn-t-like-0-as-an-initiali.patch b/meta-oe/recipes-extended/efivar/efivar/0001-Sometimes-the-compiler-doesn-t-like-0-as-an-initiali.patch
>> > new file mode 100644
>> > index 0000000..68cabd6
>> > --- /dev/null
>> > +++ b/meta-oe/recipes-extended/efivar/efivar/0001-Sometimes-the-compiler-doesn-t-like-0-as-an-initiali.patch
>> > @@ -0,0 +1,42 @@
>> > +From a3606c02fd271d32e364fcc540e34ba1899309f6 Mon Sep 17 00:00:00 2001
>> > +From: Peter Jones <pjones@redhat.com>
>> > +Date: Tue, 14 Jul 2015 09:33:54 -0400
>> > +Subject: [PATCH] Sometimes the compiler doesn't like { 0, } as an
>> > + initializer...
>> > +
>> > +Because it really wants to be { {0, },} or something, and sometimes the
>> > +compiler, knowing full well what we're trying to do, likes to complain
>> > +about the rigor applied to our technique in doing it.
>> > +
>> > +memset() the struct ifreq to 0 instead so I don't need to figure out its
>> > +internal structure just to zero it out.
>> > +
>> > +Resolves #28
>> > +
>> > +Signed-off-by: Peter Jones <pjones@redhat.com>
>> > +---
>> > + src/linux.c | 3 ++-
>> > + 1 file changed, 2 insertions(+), 1 deletion(-)
>> > +
>> > +diff --git a/src/linux.c b/src/linux.c
>> > +index 57f71f3..817b8e6 100644
>> > +--- a/src/linux.c
>> > ++++ b/src/linux.c
>> > +@@ -847,12 +847,13 @@ ssize_t
>> > + __attribute__((__visibility__ ("hidden")))
>> > + make_mac_path(uint8_t *buf, ssize_t size, const char * const ifname)
>> > + {
>> > +-  struct ifreq ifr = { 0, };
>> > ++  struct ifreq ifr;
>> > +   struct ethtool_drvinfo drvinfo = { 0, };
>> > +   int fd, rc;
>> > +   ssize_t ret = -1, sz, off=0;
>> > +   char busname[PATH_MAX+1] = "";
>> > +
>> > ++  memset(&ifr, 0, sizeof (ifr));
>> > +   strncpy(ifr.ifr_name, ifname, IF_NAMESIZE);
>> > +   drvinfo.cmd = ETHTOOL_GDRVINFO;
>> > +   ifr.ifr_data = (caddr_t)&drvinfo;
>> > +--
>> > +2.6.1
>> > +
>> > diff --git a/meta-oe/recipes-extended/efivar/efivar_0.21.bb b/meta-oe/recipes-extended/efivar/efivar_0.21.bb
>> > index b5ef90a..1684a10 100644
>> > --- a/meta-oe/recipes-extended/efivar/efivar_0.21.bb
>> > +++ b/meta-oe/recipes-extended/efivar/efivar_0.21.bb
>> > @@ -8,7 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6626bb1e20189cfa95f2c508ba286393"
>> >  DEPENDS_class-target = "popt efivar-native"
>> >
>> >  SRCREV = "aab6c2a64d90b6e5a63661fb5bd6be8d878b0784"
>> > -SRC_URI = "git://github.com/rhinstaller/efivar.git"
>> > +SRC_URI = "git://github.com/rhinstaller/efivar.git \
>> > +           file://0001-Sometimes-the-compiler-doesn-t-like-0-as-an-initiali.patch"
>> >  SRC_URI_append_class-target = " file://0001-efivar-fix-for-cross-compile.patch"
>> >  SRC_URI_append_class-native = " file://efivar-drop-options-not-supported-by-lower-version-gcc.patch"
>> >
>> > --
>> > 2.6.1
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>> --
>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
>
>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

