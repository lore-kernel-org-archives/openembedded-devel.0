Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1M5OSZ-0000PM-8C
	for openembedded-devel@openembedded.org; Sat, 16 May 2009 20:18:11 +0200
Received: (qmail 29061 invoked from network); 16 May 2009 18:11:06 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 16 May 2009 11:11:06 -0700
Date: Sat, 16 May 2009 11:11:05 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090516181105.GB23842@smtp.west.cox.net>
References: <20090515183512.GZ7973@smtp.west.cox.net>
	<1242497080-28506-1-git-send-email-khimov@altell.ru>
MIME-Version: 1.0
In-Reply-To: <1242497080-28506-1-git-send-email-khimov@altell.ru>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH 1/3] (e)glibc-package: fix kernel version passed	to qemu
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
X-List-Received-Date: Sat, 16 May 2009 18:18:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, May 16, 2009 at 10:04:38PM +0400, Roman I Khimov wrote:
> Binary locale generation fails with
> 
> FATAL: kernel too old
> 
> if (e)glibc is configured for kernels newer than 2.6.16. This comes from
> kernel version check in sysdeps/unix/sysv/linux/dl-osinfo.h. We configure
> (e)glibc with "--enable-kernel=${OLDEST_KERNEL}", so to pass this check we
> need kernel version reported from QEMU to (e)glibc be $OLDEST_KERNEL or higher.
> 
> Fix qemu "-r" parameter to match OLDEST_KERNEL.

Acked-by: Tom Rini <trini@embeddedalley.com>

> ---
>  recipes/eglibc/eglibc-package.bbclass |    6 +++++-
>  recipes/glibc/glibc-package.bbclass   |    6 +++++-
>  2 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes/eglibc/eglibc-package.bbclass b/recipes/eglibc/eglibc-package.bbclass
> index 7fcb558..01f698a 100644
> --- a/recipes/eglibc/eglibc-package.bbclass
> +++ b/recipes/eglibc/eglibc-package.bbclass
> @@ -287,7 +287,11 @@ python package_do_split_gconvs () {
>  
>  	def output_locale_binary(name, locale, encoding):
>  		target_arch = bb.data.getVar("TARGET_ARCH", d, 1)
> -		qemu = "qemu-%s -r 2.6.16" % target_arch
> +		kernel_ver = bb.data.getVar("OLDEST_KERNEL", d, 1)
> +		if kernel_ver is None:
> +			qemu = "qemu-%s  -s 1048576" % target_arch
> +		else:
> +			qemu = "qemu-%s  -s 1048576 -r %s" % (target_arch, kernel_ver)
>  		pkgname = 'locale-base-' + legitimize_package_name(name)
>  		m = re.match("(.*)\.(.*)", name)
>  		if m:
> diff --git a/recipes/glibc/glibc-package.bbclass b/recipes/glibc/glibc-package.bbclass
> index 89fbd1c..8db8c5c 100644
> --- a/recipes/glibc/glibc-package.bbclass
> +++ b/recipes/glibc/glibc-package.bbclass
> @@ -252,7 +252,11 @@ python package_do_split_gconvs () {
>  		if target_arch in ("i486", "i586", "i686"):
>  		   target_arch = "i386"
>  
> -		qemu = "qemu-%s  -s 1048576 -r 2.6.16" % target_arch
> +		kernel_ver = bb.data.getVar("OLDEST_KERNEL", d, 1)
> +		if kernel_ver is None:
> +			qemu = "qemu-%s  -s 1048576" % target_arch
> +		else:
> +			qemu = "qemu-%s  -s 1048576 -r %s" % (target_arch, kernel_ver)
>  		pkgname = 'locale-base-' + legitimize_package_name(name)
>  		m = re.match("(.*)\.(.*)", name)
>  		if m:
> -- 
> 1.6.3.1
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 

-- 
Tom Rini


