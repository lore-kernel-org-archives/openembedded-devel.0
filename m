Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OdU7K-0008Fy-ER for openembedded-devel@lists.openembedded.org;
	Mon, 26 Jul 2010 22:17:43 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OdU73-0001b3-4b for openembedded-devel@lists.openembedded.org;
	Mon, 26 Jul 2010 22:17:25 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jul 2010 22:17:25 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jul 2010 22:17:25 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 26 Jul 2010 22:17:16 +0200
Message-ID: <i2kqgc$ql1$1@dough.gmane.org>
References: <1280174528-27682-1-git-send-email-raj.khem@gmail.com>
	<1280174528-27682-8-git-send-email-raj.khem@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.10) Gecko/20100611 Shredder/3.0.6pre
In-Reply-To: <1280174528-27682-8-git-send-email-raj.khem@gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS,UPPERCASE_50_75 autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 7/7] recipes: Replace usage of MULTIMACH_TARGET_SYS with TARGET_SYS
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
X-List-Received-Date: Mon, 26 Jul 2010 20:17:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Khem,

What does '${TARGET_SYS}' expand to for machine specific recipes? The TI
tools need to go into sysroots/machine/, not sysroot/arch/ in the
current setup.

regards,

Koen

On 26-07-10 22:02, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  recipes/gnuradio/gnuradio-libusb-compat.inc     |    2 +-
>  recipes/gnuradio/gnuradio.inc                   |    2 +-
>  recipes/opencv/opencv-dsp-acceleration_svn.bb   |    2 +-
>  recipes/ti/README                               |    3 +-
>  recipes/ti/ti-paths.inc                         |   34 +++++++++++-----------
>  recipes/ti/ti-staging.inc                       |    3 --
>  recipes/xapian/xapian-bindings-python_1.0.14.bb |    2 +-
>  7 files changed, 22 insertions(+), 26 deletions(-)
> 
> diff --git a/recipes/gnuradio/gnuradio-libusb-compat.inc b/recipes/gnuradio/gnuradio-libusb-compat.inc
> index efe2b88..aa4d41a 100644
> --- a/recipes/gnuradio/gnuradio-libusb-compat.inc
> +++ b/recipes/gnuradio/gnuradio-libusb-compat.inc
> @@ -8,7 +8,7 @@ INC_PR = "r7"
>  inherit distutils-base autotools autotools_stage pkgconfig
>  
>  export BUILD_SYS
> -export HOST_SYS=${MULTIMACH_TARGET_SYS}
> +export HOST_SYS
>  
>  CXXFLAGS_powerpc += "-lstdc++"
>  
> diff --git a/recipes/gnuradio/gnuradio.inc b/recipes/gnuradio/gnuradio.inc
> index 6eaf119..1a08930 100644
> --- a/recipes/gnuradio/gnuradio.inc
> +++ b/recipes/gnuradio/gnuradio.inc
> @@ -8,7 +8,7 @@ INC_PR = "r7"
>  inherit distutils-base autotools autotools_stage pkgconfig
>  
>  export BUILD_SYS
> -export HOST_SYS=${MULTIMACH_TARGET_SYS}
> +export HOST_SYS
>  
>  CXXFLAGS_powerpc += "-lstdc++"
>  
> diff --git a/recipes/opencv/opencv-dsp-acceleration_svn.bb b/recipes/opencv/opencv-dsp-acceleration_svn.bb
> index 788e8e2..26fc3c6 100644
> --- a/recipes/opencv/opencv-dsp-acceleration_svn.bb
> +++ b/recipes/opencv/opencv-dsp-acceleration_svn.bb
> @@ -22,7 +22,7 @@ export OPENCV_PATH = "${STAGING_INCDIR}"
>  export DSPLIB_PATH = "${DSPLIB_INSTALL_DIR}"
>  
>  # You need to extract the imglib from the .exe manually and place it in /OE/tmp (or somewhere else and change the patch below)
> -export IMGLIB_PATH = "${STAGING_DIR}/${MULTIMACH_TARGET_SYS}${installdir}/imglib_v201"
> +export IMGLIB_PATH = "${STAGING_DIR}/${TARGET_SYS}${installdir}/imglib_v201"
>  
>  do_configure() {
>  	echo "-l ${DSPLIB_INSTALL_DIR}/dsplib64plus.lib" >> ${S}/beagle/server/opencv_unitserver_evm3530/link.cmd
> diff --git a/recipes/ti/README b/recipes/ti/README
> index 2fbb9f1..6262c9c 100644
> --- a/recipes/ti/README
> +++ b/recipes/ti/README
> @@ -29,13 +29,12 @@ Since most of the recipes in this directory deal with a DSP (e.g OMAP3) or accel
>  The complete unpacked trees are staged to staging/machine/usr/share/ti/${PN}(-tree) and all the _INSTALL_DIR vars will point to that. To make this work there is a ti-staging.inc which contains:
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
> -BASEPKG_HOST_SYS = "${MULTIMACH_HOST_SYS}"
>  PACKAGE_STRIP = "no"
>  
>  The 'BASEPKG_HOST_SYS' bit is what makes it work, but cause trouble is you want to read from it, so ti-paths.inc does:
>  
>  export CODEGEN_INSTALL_DIR_RECIPE    = "${installdir}/ti-cgt6x"
> -export CODEGEN_INSTALL_DIR    = "${STAGING_DIR}/${MULTIMACH_TARGET_SYS}/${CODEGEN_INSTALL_DIR_RECIPE}"
> +export CODEGEN_INSTALL_DIR    = "${STAGING_DIR}/${TARGET_SYS}/${CODEGEN_INSTALL_DIR_RECIPE}"
>  
>  Which will point it to the machine specific staging like we want it to.
>  
> diff --git a/recipes/ti/ti-paths.inc b/recipes/ti/ti-paths.inc
> index 27400a1..57af6c5 100644
> --- a/recipes/ti/ti-paths.inc
> +++ b/recipes/ti/ti-paths.inc
> @@ -22,23 +22,23 @@ export BIOSPSP_INSTALL_DIR_RECIPE    = "${installdir}/ti-biospsp-tree"
>  export AUDIO_SOC_INSTALL_DIR_RECIPE  = "${installdir}/ti-audio-soc-example-tree"
>  
>  # This is where the tools will end up in staging provided PACKAGE_ARCH = ${MACHINE_ARCH} is set
> -export CODEGEN_INSTALL_DIR    = "${STAGING_DIR}/${MULTIMACH_TARGET_SYS}${CODEGEN_INSTALL_DIR_RECIPE}"
> -export XDC_INSTALL_DIR        = "${STAGING_DIR}/${MULTIMACH_TARGET_SYS}${XDC_INSTALL_DIR_RECIPE}"
> -export XDAIS_INSTALL_DIR      = "${STAGING_DIR}/${MULTIMACH_TARGET_SYS}${XDAIS_INSTALL_DIR_RECIPE}"
> -export BIOS_INSTALL_DIR       = "${STAGING_DIR}/${MULTIMACH_TARGET_SYS}${BIOS_INSTALL_DIR_RECIPE}"
> -export SYSBIOS_INSTALL_DIR    = "${STAGING_DIR}/${MULTIMACH_TARGET_SYS}${SYSBIOS_INSTALL_DIR_RECIPE}"
> -export BIOSUTILS_INSTALL_DIR  = "${STAGING_DIR}/${MULTIMACH_TARGET_SYS}${BIOSUTILS_INSTALL_DIR_RECIPE}"
> -export FC_INSTALL_DIR         = "${STAGING_DIR}/${MULTIMACH_TARGET_SYS}${FC_INSTALL_DIR_RECIPE}"
> -export CE_INSTALL_DIR         = "${STAGING_DIR}/${MULTIMACH_TARGET_SYS}${CE_INSTALL_DIR_RECIPE}"
> -export EDMA3_LLD_INSTALL_DIR  = "${STAGING_DIR}/${MULTIMACH_TARGET_SYS}${EDMA3_LLD_INSTALL_DIR_RECIPE}"
> -export LINUXUTILS_INSTALL_DIR = "${STAGING_DIR}/${MULTIMACH_TARGET_SYS}${LINUXUTILS_INSTALL_DIR_RECIPE}"
> -export CMEM_INSTALL_DIR       = "${STAGING_DIR}/${MULTIMACH_TARGET_SYS}${CMEM_INSTALL_DIR_RECIPE}"
> -export LINK_INSTALL_DIR       = "${STAGING_DIR}/${MULTIMACH_TARGET_SYS}${LINK_INSTALL_DIR_RECIPE}"
> -export LPM_INSTALL_DIR        = "${STAGING_DIR}/${MULTIMACH_TARGET_SYS}${LPM_INSTALL_DIR_RECIPE}"
> -export DMAI_INSTALL_DIR       = "${STAGING_DIR}/${MULTIMACH_TARGET_SYS}${DMAI_INSTALL_DIR_RECIPE}"
> -export CODEC_INSTALL_DIR      = "${STAGING_DIR}/${MULTIMACH_TARGET_SYS}${CODEC_INSTALL_DIR_RECIPE}"
> -export DSPLIB_INSTALL_DIR     = "${STAGING_DIR}/${MULTIMACH_TARGET_SYS}${DSPLIB_INSTALL_DIR_RECIPE}"
> -export BIOSPSP_INSTALL_DIR    = "${STAGING_DIR}/${MULTIMACH_TARGET_SYS}${BIOSPSP_INSTALL_DIR_RECIPE}"
> +export CODEGEN_INSTALL_DIR    = "${STAGING_DIR}/${TARGET_SYS}${CODEGEN_INSTALL_DIR_RECIPE}"
> +export XDC_INSTALL_DIR        = "${STAGING_DIR}/${TARGET_SYS}${XDC_INSTALL_DIR_RECIPE}"
> +export XDAIS_INSTALL_DIR      = "${STAGING_DIR}/${TARGET_SYS}${XDAIS_INSTALL_DIR_RECIPE}"
> +export BIOS_INSTALL_DIR       = "${STAGING_DIR}/${TARGET_SYS}${BIOS_INSTALL_DIR_RECIPE}"
> +export SYSBIOS_INSTALL_DIR    = "${STAGING_DIR}/${TARGET_SYS}${SYSBIOS_INSTALL_DIR_RECIPE}"
> +export BIOSUTILS_INSTALL_DIR  = "${STAGING_DIR}/${TARGET_SYS}${BIOSUTILS_INSTALL_DIR_RECIPE}"
> +export FC_INSTALL_DIR         = "${STAGING_DIR}/${TARGET_SYS}${FC_INSTALL_DIR_RECIPE}"
> +export CE_INSTALL_DIR         = "${STAGING_DIR}/${TARGET_SYS}${CE_INSTALL_DIR_RECIPE}"
> +export EDMA3_LLD_INSTALL_DIR  = "${STAGING_DIR}/${TARGET_SYS}${EDMA3_LLD_INSTALL_DIR_RECIPE}"
> +export LINUXUTILS_INSTALL_DIR = "${STAGING_DIR}/${TARGET_SYS}${LINUXUTILS_INSTALL_DIR_RECIPE}"
> +export CMEM_INSTALL_DIR       = "${STAGING_DIR}/${TARGET_SYS}${CMEM_INSTALL_DIR_RECIPE}"
> +export LINK_INSTALL_DIR       = "${STAGING_DIR}/${TARGET_SYS}${LINK_INSTALL_DIR_RECIPE}"
> +export LPM_INSTALL_DIR        = "${STAGING_DIR}/${TARGET_SYS}${LPM_INSTALL_DIR_RECIPE}"
> +export DMAI_INSTALL_DIR       = "${STAGING_DIR}/${TARGET_SYS}${DMAI_INSTALL_DIR_RECIPE}"
> +export CODEC_INSTALL_DIR      = "${STAGING_DIR}/${TARGET_SYS}${CODEC_INSTALL_DIR_RECIPE}"
> +export DSPLIB_INSTALL_DIR     = "${STAGING_DIR}/${TARGET_SYS}${DSPLIB_INSTALL_DIR_RECIPE}"
> +export BIOSPSP_INSTALL_DIR    = "${STAGING_DIR}/${TARGET_SYS}${BIOSPSP_INSTALL_DIR_RECIPE}"
>  
>  DSPSUFFIX_omapl137 = "x674"
>  DSPSUFFIX_omapl138 = "x674"
> diff --git a/recipes/ti/ti-staging.inc b/recipes/ti/ti-staging.inc
> index 593f094..de2a882 100644
> --- a/recipes/ti/ti-staging.inc
> +++ b/recipes/ti/ti-staging.inc
> @@ -1,8 +1,5 @@
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> -# Allow staging into machine specific dir
> -BASEPKG_HOST_SYS = "${MULTIMACH_HOST_SYS}"
> -
>  # Search archdir for shlibs instead of machine dir due to above BASEPKG_HOST_SYS
>  SHLIBSDIR = "${STAGING_DIR}/${BASE_PACKAGE_ARCH}${HOST_VENDOR}-${HOST_OS}/shlibs"
>  
> diff --git a/recipes/xapian/xapian-bindings-python_1.0.14.bb b/recipes/xapian/xapian-bindings-python_1.0.14.bb
> index ae97779..6c24e2d 100644
> --- a/recipes/xapian/xapian-bindings-python_1.0.14.bb
> +++ b/recipes/xapian/xapian-bindings-python_1.0.14.bb
> @@ -18,7 +18,7 @@ EXTRA_OECONF = "--with-python --without-php --without-ruby --without-tcl \
>                  --without-csharp --without-java"
>  
>  do_configure () {
> -        BUILD_SYS=${BUILD_SYS} HOST_SYS=${MULTIMACH_HOST_SYS} \
> +        BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
>          autotools_do_configure
>  }
>  

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMTe1MMkyGM64RGpERAoCzAJwPY77OLBG0BghEgbCtOwyU/o+VcwCgg/j8
Ica4QN3ugkVKWaLju2oc6ig=
=DWeX
-----END PGP SIGNATURE-----



