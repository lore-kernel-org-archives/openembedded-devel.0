Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QWOEF-0000UL-AA for openembedded-devel@lists.openembedded.org;
	Tue, 14 Jun 2011 09:40:03 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QWOAx-0006ri-Rg for openembedded-devel@lists.openembedded.org;
	Tue, 14 Jun 2011 09:36:39 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jun 2011 09:36:39 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jun 2011 09:36:39 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 14 Jun 2011 09:36:26 +0200
Message-ID: <it731q$utn$1@dough.gmane.org>
References: <4DF6DBCE.7010404@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <4DF6DBCE.7010404@gmail.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH] ti-dsplink: Fixed location of toolchain
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
X-List-Received-Date: Tue, 14 Jun 2011 07:40:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 14-06-11 05:55, Joel A Fernandes wrote:
> ti-dsplink: Fixed location of toolchain to build ti-dsplink.

It sadly really needs an absolute path to the tools :(

> 
> Signed-off-by: Joel A Fernandes <agnel.joel@gmail.com>
> ---
>  recipes/ti/ti-dsplink.inc |   34 +++++++++++++++++-----------------
>  1 files changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/recipes/ti/ti-dsplink.inc b/recipes/ti/ti-dsplink.inc
> index c48ec41..bbdc35a 100644
> --- a/recipes/ti/ti-dsplink.inc
> +++ b/recipes/ti/ti-dsplink.inc
> @@ -94,23 +94,23 @@ do_compile() {
>      # Build the gpp user space library
>      cd ${DSPLINK}/gpp/src/api && make \
>        CROSS_COMPILE="${TARGET_PREFIX}" \
> -      CC="${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}gcc" \
> -      AR="${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}ar" \
> -      LD="${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}ld" \
> -      COMPILER="${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}gcc" \
> -      ARCHIVER="${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}ar" \
> +      CC="${CC}" \
> +      AR="${AR}" \
> +      LD="${LD}" \
> +      COMPILER="${CC}" \
> +      ARCHIVER="${AR}" \
>        KERNEL_DIR="${STAGING_KERNEL_DIR}" \
>        all
>  
>      # Build the gpp kernel space (debug and release)
>      cd ${DSPLINK}/gpp/src && make \
> -      OBJDUMP="${TARGET_PREFIX}objdump" \
> +      OBJDUMP="${OBJDUMP}" \
>        CROSS_COMPILE="${TARGET_PREFIX}" \
> -      CC="${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}gcc" \
> -      AR="${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}ar" \
> -      LD="${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}ld" \
> -      COMPILER="${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}gcc" \
> -      ARCHIVER="${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}ar" \
> +      CC="${CC}" \
> +      AR="${AR}" \
> +      LD="${LD}" \
> +      COMPILER="${CC}" \
> +      ARCHIVER="${AR}" \
>        KERNEL_DIR="${STAGING_KERNEL_DIR}" \
>        BASE_BUILDOS="${STAGING_KERNEL_DIR}" \
>        all
> @@ -122,12 +122,12 @@ do_compile() {
>        OSINC_PLATFORM="${TOOLCHAIN_PATH}/lib/gcc/${TARGET_SYS}/$(${TARGET_PREFIX}gcc -dumpversion)/include" \
>        OSINC_TARGET="${BASE_TOOLCHAIN}/target/usr/include" \
>        CROSS_COMPILE="${TARGET_PREFIX}" \
> -      CC="${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}gcc" \
> -      LD="${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}gcc" \
> -      AR="${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}ar" \
> -      COMPILER="${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}gcc" \
> -      LINKER="${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}gcc" \
> -      ARCHIVER="${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}ar" \
> +      CC="${CC}" \
> +      AR="${AR}" \
> +      LD="${LD}" \
> +      COMPILER="${CC}" \
> +      ARCHIVER="${AR}" \
> +      LINKER="${CC}" \
>        KERNEL_DIR="${STAGING_KERNEL_DIR}" \
>        all

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFN9w96MkyGM64RGpERAkk+AJ9kAE91Op6450wG1xySGpAa3drFXQCfSNcO
F1rBpao1N5wwWAlNk6kwiqU=
=x1pA
-----END PGP SIGNATURE-----



