Received: from co1ehsobe006.messaging.microsoft.com ([216.32.180.189]
	helo=co1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1T9fbv-0007aM-4B
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Sep 2012 19:11:23 +0200
Received: from mail214-co1-R.bigfish.com (10.243.78.234) by
	CO1EHSOBE009.bigfish.com (10.243.66.72) with Microsoft SMTP Server id
	14.1.225.23; Thu, 6 Sep 2012 16:43:51 +0000
Received: from mail214-co1 (localhost [127.0.0.1])	by
	mail214-co1-R.bigfish.com (Postfix) with ESMTP id 18CBD840089;
	Thu,  6 Sep 2012 16:43:51 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: VS-2(zz98dI9371I1432Izz1202hzz8275ch8275bh8275dhz2dh2a8h668h839h8e2h8e3hd25hf0ah107ah10d2hbe9i1155h)
Received: from mail214-co1 (localhost.localdomain [127.0.0.1]) by mail214-co1
	(MessageSwitch) id 1346949829377374_30006;
	Thu,  6 Sep 2012 16:43:49 +0000 (UTC)
Received: from CO1EHSMHS001.bigfish.com (unknown [10.243.78.225])	by
	mail214-co1.bigfish.com (Postfix) with ESMTP id 501CE140048;
	Thu,  6 Sep 2012 16:43:49 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS001.bigfish.com
	(10.243.66.11) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 6 Sep 2012 16:43:47 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.37]) by
	039-SN1MMR1-004.039d.mgd.msft.net ([::1]) with mapi id 14.02.0309.003;
	Thu, 6 Sep 2012 11:43:46 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][for-denzil][PATCH 3/8] kernel: Add kernel
	headers to kernel-dev package
Thread-Index: AQHNjE7IaDKrJJaX70eKlqYrWIvTWw==
Date: Thu, 6 Sep 2012 16:43:45 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A657F94@039-SN1MPN1-003.039d.mgd.msft.net>
References: <1346930610-2977-1-git-send-email-koen@dominion.thruhere.net>
	<1346930610-2977-3-git-send-email-koen@dominion.thruhere.net>
In-Reply-To: <1346930610-2977-3-git-send-email-koen@dominion.thruhere.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	=?iso-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
Subject: Re: [meta-oe][for-denzil][PATCH 3/8] kernel: Add kernel headers to kernel-dev package
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
X-List-Received-Date: Thu, 06 Sep 2012 17:11:23 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <065670C0927B994B88C3EC9C9426DF5A@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 6, 2012 at 6:23 AM, Koen Kooi <koen@dominion.thruhere.net> wrot=
e:
> From: Darren Hart <dvhart@linux.intel.com>
>
> [YOCTO #1614]
>
> Add the kernel headers to the kernel-dev package. This packages what was
> already built and kept in sysroots for building modules with bitbake.
> Making this available on the target requires removing some additional
> host binaries.
>
> Move the location to /usr/src/kernel
>
> Before use on the target, the user will need to:
>
>     # cd /usr/src/kernel
>     # make scripts
>
> This renders the kernel-misc recipe empty, so remove it.
>
> As we use /usr/src/kernel in several places (and I missed one in the
> previous version), add a KERNEL_SRC_DIR variable and use that throughout
> the class to avoid update errors in the future.
>
> Now that we package the kernel headers, drop the
> kernel_package_preprocess function which removed them from PKGD.
>
> All *-sdk image recipes include dev-pkgs, so the kernel-dev package will
> be installed by default on all such images.
>
> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> CC: Bruce Ashfield <bruce.ashfield@windriver.com>
> CC: Tom Zanussi <tom.zanussi@intel.com>
> CC: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>

Why did you resent this? Are there changes or by accident? Just asking
before I make a patch for denzil with my previous fix.

-M


> ---
>  meta-oe/classes/kernel.bbclass |   27 ++++++++++++---------------
>  1 files changed, 12 insertions(+), 15 deletions(-)
>
> diff --git a/meta-oe/classes/kernel.bbclass b/meta-oe/classes/kernel.bbcl=
ass
> index 6f1b6a4..d7e42f6 100644
> --- a/meta-oe/classes/kernel.bbclass
> +++ b/meta-oe/classes/kernel.bbclass
> @@ -82,6 +82,10 @@ EXTRA_OEMAKE =3D ""
>
>  KERNEL_ALT_IMAGETYPE ??=3D ""
>
> +# Define where the kernel headers are installed on the target as well as=
 where
> +# they are staged.
> +KERNEL_SRC_PATH =3D "/usr/src/kernel"
> +
>  KERNEL_IMAGETYPE_FOR_MAKE =3D "${@(lambda s: s[:-3] if s[-3:] =3D=3D ".g=
z" else s)(d.getVar('KERNEL_IMAGETYPE', True))}"
>
>  kernel_do_compile() {
> @@ -135,7 +139,7 @@ kernel_do_install() {
>         # Support for external module building - create a minimal copy of=
 the
>         # kernel source tree.
>         #
> -       kerneldir=3D${D}/kernel
> +       kerneldir=3D${D}${KERNEL_SRC_PATH}
>         install -d $kerneldir
>
>         #
> @@ -188,23 +192,18 @@ kernel_do_install() {
>                 cp arch/powerpc/lib/crtsavres.o $kerneldir/arch/powerpc/l=
ib/crtsavres.o
>         fi
>
> -       # Remove the following binaries which cause strip errors
> +       # Remove the following binaries which cause strip or arch QA erro=
rs
>         # during do_package for cross-compiled platforms
>         bin_files=3D"arch/powerpc/boot/addnote arch/powerpc/boot/hack-cof=
f \
> -                  arch/powerpc/boot/mktree"
> +                  arch/powerpc/boot/mktree scripts/kconfig/zconf.tab.o \
> +                  scripts/kconfig/conf.o"
>         for entry in $bin_files; do
>                 rm -f $kerneldir/$entry
>         done
>  }
>
> -PACKAGE_PREPROCESS_FUNCS +=3D "kernel_package_preprocess"
> -
> -kernel_package_preprocess () {
> -       rm -rf ${PKGD}/kernel
> -}
> -
>  sysroot_stage_all_append() {
> -       sysroot_stage_dir ${D}/kernel ${SYSROOT_DESTDIR}/kernel
> +       sysroot_stage_dir ${D}${KERNEL_SRC_PATH} ${SYSROOT_DESTDIR}${KERN=
EL_SRC_PATH}
>  }
>
>  kernel_do_configure() {
> @@ -252,13 +251,11 @@ EXPORT_FUNCTIONS do_compile do_install do_configure
>
>  # kernel-base becomes kernel-${KERNEL_VERSION}
>  # kernel-image becomes kernel-image-${KERNEL_VERISON}
> -PACKAGES =3D "kernel kernel-base kernel-vmlinux kernel-image kernel-dev =
kernel-misc"
> +PACKAGES =3D "kernel kernel-base kernel-vmlinux kernel-image kernel-dev"
>  FILES =3D ""
>  FILES_kernel-image =3D "/boot/${KERNEL_IMAGETYPE}*"
> -FILES_kernel-dev =3D "/boot/System.map* /boot/Module.symvers* /boot/conf=
ig*"
> +FILES_kernel-dev =3D "/boot/System.map* /boot/Module.symvers* /boot/conf=
ig* ${KERNEL_SRC_PATH}"
>  FILES_kernel-vmlinux =3D "/boot/vmlinux*"
> -# misc is a package to contain files we need in staging
> -FILES_kernel-misc =3D "/kernel/include/config /kernel/scripts /kernel/dr=
ivers/crypto /kernel/drivers/media"
>  RDEPENDS_kernel =3D "kernel-base"
>  # Allow machines to override this dependency if kernel image files are
>  # not wanted in images as standard
> @@ -475,7 +472,7 @@ python populate_packages_prepend () {
>         metapkg =3D "kernel-modules"
>         d.setVar('ALLOW_EMPTY_' + metapkg, "1")
>         d.setVar('FILES_' + metapkg, "")
> -       blacklist =3D [ 'kernel-dev', 'kernel-image', 'kernel-base', 'ker=
nel-vmlinux', 'kernel-misc' ]
> +       blacklist =3D [ 'kernel-dev', 'kernel-image', 'kernel-base', 'ker=
nel-vmlinux' ]
>         for l in module_deps.values():
>                 for i in l:
>                         pkg =3D module_pattern % legitimize_package_name(=
re.match(module_regex, os.path.basename(i)).group(1))
> --
> 1.7.7.6
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel=



