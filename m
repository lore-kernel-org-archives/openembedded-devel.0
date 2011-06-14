Received: from vms173019pub.verizon.net ([206.46.173.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1QWMaU-00060d-8T
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Jun 2011 07:54:54 +0200
Received: from gandalf.denix.org ([unknown] [108.18.140.4])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LMR00BVIMXC3U76@vms173019.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	14 Jun 2011 00:51:17 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id EFD1614AF5D; Tue,
	14 Jun 2011 01:51:11 -0400 (EDT)
Date: Tue, 14 Jun 2011 01:51:11 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20110614055111.GA1324@denix.org>
References: <4DF6DBCE.7010404@gmail.com>
MIME-version: 1.0
In-reply-to: <4DF6DBCE.7010404@gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Cc: "Kridner, Jason" <jdk@ti.com>, Koen <k-kooi@ti.com>
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
X-List-Received-Date: Tue, 14 Jun 2011 05:54:54 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Jun 13, 2011 at 10:55:58PM -0500, Joel A Fernandes wrote:
> ti-dsplink: Fixed location of toolchain to build ti-dsplink.
> 
> Signed-off-by: Joel A Fernandes <agnel.joel@gmail.com>

Have you tested this with an external toolchain?

-- 
Denys


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
>  
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


