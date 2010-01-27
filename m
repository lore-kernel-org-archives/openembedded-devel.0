Received: from moutng.kundenserver.de ([212.227.17.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Dirk@Do13.de>) id 1NaCWd-0003j0-1V
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Jan 2010 19:22:02 +0100
Received: from mail.opfer.lan (do13.in-dsl.de [217.197.85.204])
	by mrelayeu.kundenserver.de (node=mrbap2) with ESMTP (Nemesis)
	id 0LqWMz-1OEBl62x2v-00dy45; Wed, 27 Jan 2010 18:55:34 +0100
Received: from [192.168.2.27] by mail.opfer.lan with esmtpa (Exim 4.69)
	(envelope-from <Dirk@Do13.de>) id 1NaC6w-0003kM-IC
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Jan 2010 18:55:32 +0100
Message-ID: <4B607E23.1010601@Do13.de>
Date: Wed, 27 Jan 2010 18:55:47 +0100
From: Dirk Opfer <Dirk@Do13.de>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1264578737-7573-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1264578737-7573-1-git-send-email-raj.khem@gmail.com>
X-Scan-Signature: f702a406fef555483c4e078c87bec76d
X-Provags-ID: V01U2FsdGVkX1/MrQqYAb3NDIzKsr5Jsbvx2iEPc9sdf8aVs0f
	hMbzQooshM5xpqJsF/hvHKcOSkXHjKtMwow25nTSM1K9k9X5fR
	b0qtXXXQnJfdzVzVcYZKB8VudxBOuvC
X-SA-Exim-Connect-IP: 212.227.17.9
X-SA-Exim-Mail-From: Dirk@Do13.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] gcc-configure-common.inc: Disable	--enable-target-optspace for *-*-linux-gnuspe.
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
X-List-Received-Date: Wed, 27 Jan 2010 18:22:02 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Khem Raj schrieb:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  recipes/gcc/gcc-configure-common.inc |    9 ++++++++-
>  1 files changed, 8 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/gcc/gcc-configure-common.inc b/recipes/gcc/gcc-configure-common.inc
> index ee6c0e7..7a15562 100644
> --- a/recipes/gcc/gcc-configure-common.inc
> +++ b/recipes/gcc/gcc-configure-common.inc
> @@ -16,6 +16,13 @@ OBJC_nylon ?= ""
>  OBJC_mips ?= ""
>  OBJC_mipsel ?= ""
>  OBJC ?= ",objc"
> +# disable --enable-target-optspace for powerpc SPE
> +# at -Os libgcc.so.1 creates references into
> +# hidden symbols in libgcc.a which linker complains
> +# when linking shared libraries further in the build like (gnutls)
> +
> +OPTSPACE_linux-gnuspe ?= ""
> +OPTSPACE ?= "--enable-target-optspace"
>  
>  # gcc 3.x expects 'f77', 4.0 expects 'f95', 4.1 and 4.2 expect 'fortran'
>  FORTRAN ?= ",f77"
> @@ -27,7 +34,6 @@ EXTRA_OECONF_PATHS ?= ""
>  EXTRA_OECONF = "${@['--enable-clocale=generic', ''][bb.data.getVar('USE_NLS', d, 1) != 'no']} \
>                  --with-gnu-ld \
>                  --enable-shared \
> -                --enable-target-optspace \
>                  --enable-languages=${LANGUAGES} \
>                  --enable-threads=posix \
>                  --enable-multilib \
> @@ -36,6 +42,7 @@ EXTRA_OECONF = "${@['--enable-clocale=generic', ''][bb.data.getVar('USE_NLS', d,
>                  --enable-symvers=gnu \
>                  --enable-libstdcxx-pch \
>                  --program-prefix=${TARGET_PREFIX} \
> +                ${OPTSPACE} \
>                  ${EXTRA_OECONF_BASE} \
>                  ${EXTRA_OECONF_FPU} \
>                  ${EXTRA_OECONF_PATHS} \
>   
Builds a gcc 4.4.2 based toolchain without problems

Acked-by: Dirk Opfer <Dirk@do13.de>

Thanks,
Dirk



