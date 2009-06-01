Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1MBAZ9-0007Cf-D9
	for openembedded-devel@openembedded.org; Mon, 01 Jun 2009 18:40:51 +0200
Received: (qmail 19590 invoked from network); 1 Jun 2009 16:32:01 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 1 Jun 2009 09:32:01 -0700
Date: Mon, 1 Jun 2009 09:32:00 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090601163200.GX23842@smtp.west.cox.net>
References: <20090530215243.GS23842@smtp.west.cox.net>
	<1243847615-8450-1-git-send-email-khimov@altell.ru>
MIME-Version: 1.0
In-Reply-To: <1243847615-8450-1-git-send-email-khimov@altell.ru>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH] (e)glibc.inc: add minimal sane kernel versions, move from bitbake.conf
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
X-List-Received-Date: Mon, 01 Jun 2009 16:40:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 01, 2009 at 01:13:35PM +0400, Roman I Khimov wrote:

> (e)glibc is configured for OLDEST_KERNEL, certain target architectures have
> specific requirements for kernel versions, if that are not satisfied (e)glibc
> reconfigures itself with what it think more appropriate and warns user that
> there is misconfiguration on his side.
> 
> Add minimal sane kernel versions for architectures requiring that.
> 
> Also move (e)glibc-specific OLDEST_KERNEL variable from bitbake.conf to
> (e)glibc.inc files that are more appropriate for this.

Thanks.

Acked-by: Tom Rini <trini@embeddedalley.com>

> ---
>  conf/bitbake.conf              |    2 --
>  conf/distro/include/eglibc.inc |   11 +++++++++++
>  conf/distro/include/glibc.inc  |   11 +++++++++++
>  3 files changed, 22 insertions(+), 2 deletions(-)
> 
> diff --git a/conf/bitbake.conf b/conf/bitbake.conf
> index 0caa162..e711a1f 100644
> --- a/conf/bitbake.conf
> +++ b/conf/bitbake.conf
> @@ -656,8 +656,6 @@ require conf/enterprise.conf
>  # Weak variables (usually to retain backwards compatibility)
>  ##################################################################
>  
> -OLDEST_KERNEL ?= "2.4.0"
> -
>  DL_DIR ?= "${TMPDIR}/downloads"
>  IMAGE_FSTYPES ?= "tar.gz"
>  PCMCIA_MANAGER ?= "pcmcia-cs"
> diff --git a/conf/distro/include/eglibc.inc b/conf/distro/include/eglibc.inc
> index 0d2087e..0443140 100644
> --- a/conf/distro/include/eglibc.inc
> +++ b/conf/distro/include/eglibc.inc
> @@ -7,3 +7,14 @@ PREFERRED_PROVIDER_virtual/libintl ?= "eglibc"
>  PREFERRED_PROVIDER_virtual/libc = "eglibc"
>  PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-initial = "eglibc-initial"
>  PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc = "eglibc"
> +
> +# eglibc is configured for OLDEST_KERNEL kernel version, so we set minimal
> +# sane versions there
> +
> +OLDEST_KERNEL ?= "2.4.0"
> +
> +# ARM OABI is fine with 2.4.0, EABI is not, so we override on "-gnueabi"
> +# TARGET_OS here, not on architecture which is 'arm' in both cases
> +OLDEST_KERNEL_linux-gnueabi ?= "2.6.16"
> +OLDEST_KERNEL_sparc64 ?= "2.4.21"
> +OLDEST_KERNEL_ppc64 ?= "2.4.21"
> diff --git a/conf/distro/include/glibc.inc b/conf/distro/include/glibc.inc
> index f9140ff..2cb6502 100644
> --- a/conf/distro/include/glibc.inc
> +++ b/conf/distro/include/glibc.inc
> @@ -7,3 +7,14 @@ PREFERRED_PROVIDER_virtual/libintl ?= "glibc"
>  PREFERRED_PROVIDER_virtual/libc = "glibc"
>  PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-initial = "glibc-initial"
>  PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc = "glibc"
> +
> +# glibc is configured for OLDEST_KERNEL kernel version, so we set minimal
> +# sane versions there
> +
> +OLDEST_KERNEL ?= "2.4.0"
> +
> +# ARM OABI is fine with 2.4.0, EABI is not, so we override on "-gnueabi"
> +# TARGET_OS here, not on architecture which is 'arm' in both cases
> +OLDEST_KERNEL_linux-gnueabi ?= "2.6.14"
> +OLDEST_KERNEL_sparc64 ?= "2.4.21"
> +OLDEST_KERNEL_ppc64 ?= "2.4.21"
> -- 
> 1.6.3.1
> 
> 
> -- 
> This message has been scanned for viruses and
> dangerous content by MailScanner, and is
> believed to be clean.
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 

-- 
Tom Rini


