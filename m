Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RDvyE-0002Fd-Gl for openembedded-devel@lists.openembedded.org;
	Wed, 12 Oct 2011 12:23:30 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RDvsj-0003LA-4Y for openembedded-devel@lists.openembedded.org;
	Wed, 12 Oct 2011 12:17:49 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Oct 2011 12:17:49 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Oct 2011 12:17:49 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 12 Oct 2011 12:17:32 +0200
Message-ID: <j73pg0$knr$1@dough.gmane.org>
References: <5A47E75E594F054BAF48C5E4FC4B92AB038595A123@dbde02.ent.ti.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:7.0) Gecko/20110922 Thunderbird/7.0
In-Reply-To: <5A47E75E594F054BAF48C5E4FC4B92AB038595A123@dbde02.ent.ti.com>
X-Enigmail-Version: 1.3.2
Subject: Re: Patches to add support for TI Linux Graphics SDK release 04.04.00.02
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
X-List-Received-Date: Wed, 12 Oct 2011 10:23:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 12-10-11 11:57, Srinivas, Prathap schreef:
> Hi All, Attached are the patches for adding TI Linux Graphics SDK
> 04.04.00.02 Release support in OE. Please include these patches in the
> OE.
> 
> Details of patches - 1)
> 0001-libgles-omap3_4.04.00.02-added-support-for-graphics-.patch - Adds
> support for TI Linux graphics SDK release 04.04.00.02 2)
> 0002-Fix-for-library-linking-isssue-with-graphics-SDK.patch - Fix to link
> the appropriate graphics user library with TI Linux graphics SDK release
> 04.04.00.02.
> 
> Since I am sending through outlook, the patches may get mangled. So I am
> attaching the patches.
> 
> Thanks, Prathap.
> 
> 
> 
> 0001-libgles-omap3_4.04.00.02-added-support-for-graphics-.patch
> 
> 
> From a11f1ae4c07d09be89be49f9094207abddad854e Mon Sep 17 00:00:00 2001 
> From: Prathap M S <msprathap@ti.com> Date: Mon, 10 Oct 2011 15:09:46
> +0530 Subject: [PATCH 1/2] libgles-omap3_4.04.00.02: added support for
> graphics sdk 04.04.00.02
> 
> * added support sgx ddk 1.6.16.4117 * included video driver as part of
> the kernel for accessing the fbdev in the sgx driver
> 
> Signed-off-by: Prathap M S <msprathap@ti.com> --- classes/kernel.bbclass
> |    2 +- .../powervr-drivers/libgles-omap3_4.04.00.02.bb    |   29
> +++++++++++++ .../omap3-sgx-modules_1.6.16.4117.bb               |   44
> ++++++++++++++++++++ 3 files changed, 74 insertions(+), 1 deletions(-) 
> create mode 100644 recipes/powervr-drivers/libgles-omap3_4.04.00.02.bb 
> create mode 100644
> recipes/powervr-drivers/omap3-sgx-modules_1.6.16.4117.bb
> 
> diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass index
> 0109ce6..bf731e6 100644 --- a/classes/kernel.bbclass +++
> b/classes/kernel.bbclass @@ -168,7 +168,7 @@ sysroot_stage_all_append()
> { mkdir -p $kerneldir/include/asm-generic cp -fR include/asm-generic/*
> $kerneldir/include/asm-generic/
> 
> -	for entry in drivers/crypto drivers/media include/generated
> include/linux include/net include/pcmcia include/media include/acpi
> include/sound include/video include/scsi include/trace include/mtd
> include/rdma include/drm include/xen crypto/ocf; do +	for entry in
> drivers/crypto drivers/media drivers/video drivers/gpu drivers/base
> include/generated include/linux include/net include/pcmcia include/media
> include/acpi include/sound include/video include/scsi include/trace
> include/mtd include/rdma include/drm include/xen crypto/ocf; do if [ -d
> $entry ]; then mkdir -p $kerneldir/$entry cp -fR $entry/*
> $kerneldir/$entry/

The above needs to be a seperate patch


> diff --git a/recipes/powervr-drivers/libgles-omap3_4.04.00.02.bb
> b/recipes/powervr-drivers/libgles-omap3_4.04.00.02.bb new file mode
> 100644 index 0000000..c5062c1 --- /dev/null +++
> b/recipes/powervr-drivers/libgles-omap3_4.04.00.02.bb @@ -0,0 +1,29 @@ 
> +BINLOCATION_omap3  = "${S}/gfx_rel_es3.x" +BINLOCATION_ti816x =
> "${S}/gfx_rel_es6.x" + +ES2LOCATION = "${S}/gfx_rel_es2.x" +ES3LOCATION =
> "${S}/gfx_rel_es3.x" +ES5LOCATION = "${S}/gfx_rel_es5.x" +ES6LOCATION =
> "${S}/gfx_rel_es6.x"

Since the above is being repeated in each recipe, shouldn't it move to the .inc?

> --- /dev/null +++
> b/recipes/powervr-drivers/omap3-sgx-modules_1.6.16.4117.bb

> +MACHINE_KERNEL_PR_append = "i"

Start at 'a' please, or remove it

> +TI_PLATFORM_omap3 = "omap3630" +TI_PLATFORM_ti816x = "ti81xx" + 
> +MODULESLOCATION_omap3 = "dc_omapfb3_linux" +MODULESLOCATION_ti816x =
> "dc_ti81xx_linux"

Move to .inc?

> From 59227811f6d4364cb8cf254f527efd233bd10827 Mon Sep 17 00:00:00 2001 
> From: Prathap M S <msprathap@ti.com> Date: Tue, 11 Oct 2011 10:58:34
> +0530 Subject: [PATCH 2/2] Fix for library linking isssue with graphics
> SDK

please format the summary according to the commit guidelines

> Signed-off-by: Prathap M S <msprathap@ti.com>
> 
> --- recipes/powervr-drivers/libgles-omap3.inc |    9 ++++++++- 1 files
> changed, 8 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes/powervr-drivers/libgles-omap3.inc
> b/recipes/powervr-drivers/libgles-omap3.inc index 36c311d..e605681
> 100644 --- a/recipes/powervr-drivers/libgles-omap3.inc +++
> b/recipes/powervr-drivers/libgles-omap3.inc @@ -1,7 +1,7 @@ DESCRIPTION =
> "libGLES for the omap3" LICENSE = "proprietary-binary"
> 
> -PR = "r15" +PR = "r16"
> 
> COMPATIBLE_MACHINE = "(omap3|ti816x)"
> 
> @@ -35,6 +35,13 @@ do_configure() { for i in $(find ${S} -name "*.h")
> $(find ${S} -name "*.c") $(find ${S} -name "Make*") ; do chmod 0644 $i 
> done + +	for drifile in $(find ${S} -name "libsrv_um_dri.so"); do +
> if [ "$drifile" != "" ] ; then +                        dir=$(dirname
> ${drifile}) +                        rm -rf ${dir}/libsrv_um_dri.so +
> fi +	done

What does this try to fix exactly?
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFOlWk8MkyGM64RGpERAl2qAJsFjMZDHiIY14FPRsWrqg+bIkQAZwCeJqTJ
NHO0BQ5XeErYUttBY44hqGM=
=lbJ/
-----END PGP SIGNATURE-----



