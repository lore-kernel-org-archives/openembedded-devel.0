Return-Path: <richard.purdie@linuxfoundation.org>
X-Greylist: delayed 889 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 02 May 2014 08:36:20 UTC
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 06A56606D4
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 May 2014 08:36:20 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s428LPA9027042; Fri, 2 May 2014 09:21:25 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id NfS7RNHqXb7M; Fri,  2 May 2014 09:21:25 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s428LKM3027036
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 2 May 2014 09:21:21 +0100
Message-ID: <1399018873.12731.21.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andrea Adami <andrea.adami@gmail.com>
Date: Fri, 02 May 2014 09:21:13 +0100
In-Reply-To: <1398986009-20163-1-git-send-email-andrea.adami@gmail.com>
References: <1398986009-20163-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-initramfs][PATCH] klcc_cross: move in target sysroot as crosscript
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 02 May 2014 08:36:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2014-05-02 at 01:13 +0200, Andrea Adami wrote:
> Klcc-cross is properly a crosscript so avoid to
> inherit cross.bbclass and stage it in target sysroot
> under usr/bin/crossscripts.
> Minor adjustment is necessary for INSTALLDIR.
> 
> Finally some optional magic mangling is added to better match the perl syntax:
> let it commented for future reference.

Why is this commented? Its not optional and the recipe will not work
properly without that change.

Cheers,

Richard

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  .../recipes-devtools/klibc/klcc-cross_2.0.3.bb     | 40 +++++++++++++---------
>  1 file changed, 23 insertions(+), 17 deletions(-)
> 
> diff --git a/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.3.bb b/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.3.bb
> index 7ff9c2e..5e767c1 100644
> --- a/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.3.bb
> +++ b/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.3.bb
> @@ -7,28 +7,34 @@ FILESPATH =. "${FILE_DIRNAME}/klibc-${PV}:"
>  
>  SRC_URI += "file://use-env-for-perl.patch"
>  
> -inherit cross
> -
>  # disable task already run in klibc recipe
>  do_configure[noexec] = "1"
> +
>  do_compile() {
> -    oe_runmake 'INSTALLDIR=${STAGING_DIR_TARGET}${target_libdir}/klibc' klcc
> +    oe_runmake 'INSTALLDIR=${STAGING_DIR_TARGET}${libdir}/klibc' klcc
>  }
> -# The linux-libc-headers and klibc custom headers are not machine-specific
> -# but are installed into machine sysroot.
> -# Klcc wrapper is hardcoding some of these paths thus, to keep the recipe
> -# arch-specific, we force the rebuild of klcc-cross for each machine.
> -do_compile[vardeps] += "MACHINE"
> +
>  do_install() {
> -    install -d ${D}${bindir}
> -    install -m 0755 klcc/klcc ${D}${bindir}/${TARGET_PREFIX}klcc
> +    install -d ${D}${bindir_crossscripts}/
> +    install -m 0755 klcc/klcc ${D}${bindir_crossscripts}/${TARGET_PREFIX}klcc
> +    # Insert an unencoded path as a comment to trigger the sstate renaming functions
> +    sed -i '2i #${STAGING_DIR_TARGET}'  ${D}${bindir_crossscripts}/${TARGET_PREFIX}klcc
> +}
> +
> +SYSROOT_PREPROCESS_FUNCS += "klcc_sysroot_preprocess"
> +
> +klcc_sysroot_preprocess () {
> +       sysroot_stage_dir ${D}${bindir_crossscripts} ${SYSROOT_DESTDIR}${bindir_crossscripts}
>  }
>  
> +deltask do_package
> +deltask do_packagedata
> +deltask do_package_write_ipk
> +deltask do_package_write_rpm
> +deltask do_package_write_deb
> +deltask do_package_write_tar
>  
> -# disable unneeded tasks
> -do_package[noexec] = "1"
> -do_packagedata[noexec] = "1"
> -do_package_write_ipk[noexec] = "1"
> -do_package_write_rpm[noexec] = "1"
> -do_package_write_deb[noexec] = "1"
> -do_package_write_tar[noexec] = "1"
> +SSTATE_SCAN_FILES = "*"
> +#EXTRA_STAGING_FIXMES = "MANGLEDSTAGINGDIRTARGET MANGLEDSTAGINGDIR"
> +#MANGLEDSTAGINGDIR = "${@d.getVar("STAGING_DIR", True).replace("/", "\\\\/").replace("-", "\\-")}"
> +#MANGLEDSTAGINGDIRTARGET = "${@d.getVar("STAGING_DIR_TARGET", True).replace("/", "\\\\/").replace("-", "\\-")}"



