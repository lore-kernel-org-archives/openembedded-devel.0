Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1SsWN1-0004YP-4U
	for openembedded-devel@lists.openembedded.org;
	Sat, 21 Jul 2012 11:53:07 +0200
Received: from relay1.zedat.fu-berlin.de ([130.133.4.67])
	by outpost1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-devel@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1SsWC1-0002BB-29>; Sat, 21 Jul 2012 11:41:45 +0200
Received: from andorra.imp.fu-berlin.de ([160.45.42.84])
	by relay1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-devel@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1SsWC0-0001JG-SM>; Sat, 21 Jul 2012 11:41:44 +0200
Received: from heinold by internal andorra.imp.fu-berlin.de with local (Exim
	4.72) id 1SsWBz-0000qI-PR
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Jul 2012 11:41:43 +0200
Date: Sat, 21 Jul 2012 11:41:43 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120721094143.GA31778@mi.fu-berlin.de>
References: <1342761538-19890-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1342761538-19890-1-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
X-Originating-IP: 160.45.42.84
Subject: Re: [meta-java][PATCH 1/5] openjdk-6-common: Pass LD_LIBRARY_PATH to app running under qemu
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
X-List-Received-Date: Sat, 21 Jul 2012 09:53:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 19, 2012 at 10:18:54PM -0700, Khem Raj wrote:
> When target and build host are same eg. x86_64 and qemux86-64
> then application uses the dynamic linker from OEs sysroot but
> libc from the build host and they may have different versions
> and end up in unpleasant results.
> 
> We therefore make sure that libc is also used from OEs sysroot
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  recipes-core/openjdk/openjdk-6-common.inc |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-core/openjdk/openjdk-6-common.inc b/recipes-core/openjdk/openjdk-6-common.inc
> index d81543c..c1861b6 100644
> --- a/recipes-core/openjdk/openjdk-6-common.inc
> +++ b/recipes-core/openjdk/openjdk-6-common.inc
> @@ -10,7 +10,7 @@ ICEDTEA = "NEEDS TO BE SET"
>  S = "${WORKDIR}/${ICEDTEA}"
>  B = "${S}/build"
>  
> -INC_PR = "r17"
> +INC_PR = "r18"
>  
>  SRC_URI = "\
>    ${ICEDTEA_URI} \
> @@ -242,7 +242,7 @@ EXTRA_OEMAKE += 'OE_LAUNCHER_LDFLAGS="${OE_LAUNCHER_LDFLAGS}"'
>  
>  
>  # Large stack is required at least on x86_64 host, otherwise random segfaults appear:
> -QEMU = "${@qemu_target_binary(d)} ${QEMU_OPTIONS} -s 1048576 -L ${STAGING_DIR_TARGET}"
> +QEMU = "${@qemu_target_binary(d)} ${QEMU_OPTIONS} -s 1048576 -L ${STAGING_DIR_TARGET} -E LD_LIBRARY_PATH=${STAGING_BASELIBDIR}"
>  
>  EXTRA_OEMAKE += 'QEMU="${QEMU}"'
>  
> -- 
> 1.7.9.5
> 

Thanks,

patch is applied to master.

Bye Henning


