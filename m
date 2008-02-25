Received: from [66.249.92.174] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JTdnk-0007He-EN
	for openembedded-devel@openembedded.org; Mon, 25 Feb 2008 14:55:33 +0100
Received: by ug-out-1314.google.com with SMTP id q7so816660uge.0
	for <openembedded-devel@openembedded.org>;
	Mon, 25 Feb 2008 05:55:00 -0800 (PST)
Received: by 10.66.252.18 with SMTP id z18mr3183369ugh.37.1203947700336;
	Mon, 25 Feb 2008 05:55:00 -0800 (PST)
Received: from widy.localdomain ( [78.164.227.166])
	by mx.google.com with ESMTPS id 30sm5347249ugf.31.2008.02.25.05.54.56
	(version=SSLv3 cipher=OTHER); Mon, 25 Feb 2008 05:54:57 -0800 (PST)
Date: Mon, 25 Feb 2008 15:57:52 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: angstrom-distro-devel@linuxtogo.org
Message-ID: <20080225155752.0fd04927@widy.localdomain>
In-Reply-To: <fpuebs$5oa$1@ger.gmane.org>
References: <20080225014825.36e60782@widy.localdomain>
	<fpu0uv$oi8$1@ger.gmane.org>
	<20080225122234.5a02ee72@widy.localdomain>
	<fpuebs$5oa$1@ger.gmane.org>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.5; i686-pc-linux-gnu)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 66.249.92.174
X-SA-Exim-Mail-From: pmiscml@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@openembedded.org
Subject: Re: [Angstrom-devel] [RFC] initramfs support for linux-handhelds-2.6
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Feb 2008 13:55:34 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

On Mon, 25 Feb 2008 14:03:55 +0100
Koen Kooi <koen@dominion.kabel.utwente.nl> wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Paul Sokolovsky schreef:
> | Hello,
> |
> | On Mon, 25 Feb 2008 10:15:11 +0100
> | Koen Kooi
> <koen@dominion.kabel.utwente.nl> wrote:
> |
> |> -----BEGIN PGP SIGNED MESSAGE-----
> |> Hash: SHA1
> |>
> |> Paul Sokolovsky schreef:
> |> | Hello,
> |> |
> |> | Failing to add generic and fully automated kernel-with-initramfs
> |> build, | I have patch to add external initramfs to kernel for
> |> linux-hh. I'd | still like to establish conventions for other
> kernel |> recipes to follow, | so here're the patch for suggestion.
> The idea is |> simple: |
> |> | 1. KERNEL_INITRAMFS_PATH is set to the full path of cpio.gz
> image to |> | use as initramfs. Empty value (default) means don't use
> initramfs. |> If | file doesn't exist, build fails with an error
> message (content |> is left | to specific recipe - there
> unfortunately doesn't seem to be |> a way to | sensibly provide
> detailed one in generic case). |> |
> |> | 2. KERNEL_INITRAMFS_PATH is considered a distro realm, like for
> |> example | kernel PREFERRED_VERSION. Below, angstrom distro config
> |> sets it.
> |>
> |> | +KERNEL_INITRAMFS_PATH =
> |>
> "${TMPDIR}/deploy/uclibc/images/${MACHINE}/initramfs-bootmenu-image-${MACHINE}.cpio.gz"
> |>
> |> | +	if [ -n "${KERNEL_INITRAMFS_PATH}" -a "${ANGSTROM_MODE}"
> |> == "glibc" ]; then
> |>
> |> A number of things:
> |>
> |> 1) Make the initramfs generation a seperate function (or task) that
> |> can be called at will, instead of always being called in
> |> do_compile_prepend
> |
> | Initramfs *generation* is a separate task. With this scheme, it is
> | completely external, binary blob drop. Except by setting initramfs
> path | to point to OE's deploy dir, one can use previous OE build
> result. So, | for our case, it would be:
> |
> | ANGSTROM_MODE=uclibc IMAGE_FSTYPES="cpio.gz" bitbake \
> | 	initramfs-bootmenu-image
> | bitbake x11-image
> |
> | and everything will magically work.
> |
> |
> |> 2) Keep it simple and keep the kernel and
> |> initramfs in the same libc realm, so a uclibc based initramfs
> needs a |> uclibc kernel (I known there is no such thing, but you get
> the idea). |
> | Keeping it separate is exactly *the simple* thing. Trying to do it
> | otherwise calls for hard-to-resolve-in-good-way complications.
> Again, | there's recursion in the job of building kernel with
> initramfs: |
> | To build kernel, you need to have initramfs. To build initramfs, you
> | need modules. To build modules, you need to build kernel.
> |
> | You saw one solution for breaking this vicious cycle - the recursion
> | was lashed into OE's own blackbox where it was kept under control
> under | given, real-world achievable circumstances. That was rejected.
> |
> | Current solution splits cycle the other way: 1) "uclibc" kernel is
> never | built with initramfs; 2) that means that its build finishes
> without | recursion, giving out modules; 3) uclibc initramfs is built
> with that | modules; 4) then "glibc" kernel recipes pulls it
> automatically(!) from | uclibc deploy dir, builds kernel with it, and
> more importantly | *packages* it w/o any dirty magic.
> 
> So:
> 
> ANGSTROM_MODE=glibc bitbake virtual/kernel
> 
> Will build a kernel without initramfs and:
> 
> ANGSTROM_MODE=uclibc bitbake virtual/kernel
> ANGSTROM_MODE=uclibc bitbake initramfs-foo-image
> ANGSTROM_MODE=glibc bitbake virtual/kernel
> 
> Will build one with initramfs, right?

No, vice-versa.

ANGSTROM_MODE=uclibc bitbake virtual/kernel - builds w/o initramfs
(by-product, never used, built only for modules)
ANGSTROM_MODE=glibc bitbake virtual/kernel - builds production kernel,
with initramfs


> If so, I want to propose something different:
> 
> ANGSTROM_MODE=uclibc bitbake virtual/kernel
> ANGSTROM_MODE=uclibc bitbake initramfs-foo-image
> ANGSTROM_MODE=uclibc bitbake initramfs-bar-image
> ANGSTROM_MODE=uclibc bitbake initramfs-qux-image
> ANGSTROM_MODE=glibc  bitbake virtual/kernel
> 
> The virtual/kernel recipe (e.g. linux-handhelds-2.6_2.6.21-hh21.bb)
> looks in the KERNEL_INITRAMFS_DIR (e.g.
> ${TMPDIR}/deploy/initramfs/${MACHINE}/) for initramfs*cpio.gz and
> iterates over those creating
> 
> zImage.bin (no initramfs)
> zImage-initramfs-foo.bin
> zImage-initramfs-bar.bin
> zImage-initramfs-qux.bin

Or, speaking in other words, it picks up random, non-deterministic
stuff and creates something from it? -1 from me.

> 
> in ${DEPLOYDIR_IMAGE} and
> 
> kernel-image_2.6.21_h4000.ipk
> kernel-initramfs-image-foo_2.6.21_h4000.ipk
> kernel-initramfs-image-bar_2.6.21_h4000.ipk
> kernel-initramfs-image-qux_2.6.21_h4000.ipk
> 
> in ${DEPLOYDIR_IPK}.

virtual/kernel recipe cannot create packages on its whim. Packaging
stuff is flesh-deep area of OE, which works well and transparent when
used as it is intended, but is not ready for such tricks. Most
discussion with Richard on the previous try evolved actually around
this, not even bitbake recursion. It ended with him saying something
in the spirit of "I know a magic way, but I won't tell ya", but I
didn't insist as by that time I gathered that OE simply not ready for
such tricks, and any implementation of that would be a pretty dirty
hack.

> That way people wanting a kernel without initramfs (for whatever
> reasons) get one, and people wanting a kernel with initramfs get one
> as well.

Well, just compare all the procedure above with what I've written in
the original message: people who want kernel with initramfs, set
KERNEL_INITRAMFS_PATH to the exact initramfs image to include, and get
properly packaged kernel without any residue in deploy dirs (or
alternatively error if the image they expect to be used is not
available). People who don't want builtin initramfs, just don't set
KERNEL_INITRAMFS_PATH (what is the default), and also get exactly what
they want and not something else in addition.

Finally, people who want both, or threesome, call for rather different
build configs, so, to not get themselves confused, they just split it
up into different DISTROs.

> The big gaping hole in this a mechanism that select which kernel
> package to install (for machines with kernel in rootfs), but that
> shouldn't be too hard.

Big gaping, yeah.

> 
> And this scenario is generic enough for general usage, so we can do
> this for 'all' kernels in OE, instead of a specific 'family'.

Well, mine obviously too - that do_compile_prepend can be moved to
kernel.bbclass and all recipes will enjoy that functionality without
changes.

> 
> regards,
> 
> Koen
> 
> 
> |> That way you can just fish it out of DEPLOY_DIR_IMAGE
> |
> | The main problem is not kernel image, but kernel package.
> |
> |> 3) Add an initramfs-<kernel-name_version>.bb that does
> |>
> |> ~  require <kernel-name_version>.bb
> |> ~  FILESPATH = "/path/magic/whatever"
> |> ~  do_compile_prepend() { do_initramfs}
> |>
> |> This involves some extra build time ('uclibc' kernel build and a
> |> 'uclibc' initramfs kernel build), but is more transparent and less
> |> error prone than your plan. I think it even avoids the dependency
> |> problems :)
> |
> | Packaging.
> |
> | Besides, it's conceptually not very correct. For a given
> | configuration (distro+machine), there used to be one kernel, right?
> | Now, there're two, one of which is not supposed to be used, nor it's
> | even working (now that we rely on initramfs, a kernel w/o it is dead
> | beef). One way to ensure transparency is to not confuse people with
> | giving out build results which are not intended to be there. My
> patch | works exactly that way - if Angstrom currently really
> supports glibc as | "production" config, and thus "glibc" kernel is
> production one, then it | will be always built with initramfs, and
> non-initramfs (== broken) | kernel won't be built at all, to not make
> all this prone to errors like | it getting into rootfs, picked up by
> users, etc. |
> | Yes, that's not too general. But as I told, the correct way to solve
> | this is to have zImage vs modules split for kernel recipe.
> (Currently | tried splits - user level vs OE balckbox; uclibc vs
> glibc - are just | hacks around the issue).
> |
> |> regards,
> |>
> |> Koen
> |>
> | []
> |
> 
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> 
> iD8DBQFHwry7MkyGM64RGpERAgp2AJ4qQGU212X2cU1VuT7YuuTM13Ro+QCeLNcZ
> YfKyN8LUcuhnutmRqVdF7Ec=
> =SzBL
> -----END PGP SIGNATURE-----
> 
> 
> _______________________________________________
> Angstrom-distro-devel mailing list
> Angstrom-distro-devel@linuxtogo.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/angstrom-distro-devel



-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com


