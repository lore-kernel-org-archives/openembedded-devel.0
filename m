Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1M5OT7-0000RP-1j
	for openembedded-devel@openembedded.org; Sat, 16 May 2009 20:18:45 +0200
Received: (qmail 29071 invoked from network); 16 May 2009 18:11:40 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 16 May 2009 11:11:40 -0700
Date: Sat, 16 May 2009 11:11:39 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090516181139.GD23842@smtp.west.cox.net>
References: <20090515183512.GZ7973@smtp.west.cox.net>
	<1242497080-28506-1-git-send-email-khimov@altell.ru>
	<1242497080-28506-2-git-send-email-khimov@altell.ru>
	<1242497080-28506-3-git-send-email-khimov@altell.ru>
MIME-Version: 1.0
In-Reply-To: <1242497080-28506-3-git-send-email-khimov@altell.ru>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH 3/3] (e)glibc-package: enable binary locale	generation on x86 and x86_64
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
X-List-Received-Date: Sat, 16 May 2009 18:18:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, May 16, 2009 at 10:04:40PM +0400, Roman I Khimov wrote:

I assume the explanation got cut out,
Acked-by: Tom Rini <trini@embeddedalley.com>

> ---
>  recipes/eglibc/eglibc-package.bbclass |    4 +++-
>  recipes/glibc/glibc-package.bbclass   |    2 +-
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes/eglibc/eglibc-package.bbclass b/recipes/eglibc/eglibc-package.bbclass
> index 241499f..22ff52b 100644
> --- a/recipes/eglibc/eglibc-package.bbclass
> +++ b/recipes/eglibc/eglibc-package.bbclass
> @@ -24,7 +24,7 @@ python __anonymous () {
>  ENABLE_BINARY_LOCALE_GENERATION ?= "0"
>  
>  # BINARY_LOCALE_ARCHES is a space separated list of regular expressions
> -BINARY_LOCALE_ARCHES ?= "arm.*"
> +BINARY_LOCALE_ARCHES ?= "arm.* i[3-6]86 x86_64"
>  
>  PACKAGES = "eglibc-dbg eglibc catchsegv sln nscd ldd localedef eglibc-utils eglibc-dev eglibc-doc eglibc-locale libsegfault eglibc-extra-nss eglibc-thread-db eglibc-pcprofile"
>  PACKAGES_DYNAMIC = "glibc-gconv-* glibc-charmap-* glibc-localedata-* glibc-binary-localedata-* eglibc-gconv-* eglibc-charmap-* eglibc-localedata-* eglibc-binary-localedata-* locale-base-*"
> @@ -287,6 +287,8 @@ python package_do_split_gconvs () {
>  
>  	def output_locale_binary(name, locale, encoding):
>  		target_arch = bb.data.getVar("TARGET_ARCH", d, 1)
> +		if target_arch in ("i486", "i586", "i686"):
> +			target_arch = "i386"
>  		kernel_ver = bb.data.getVar("OLDEST_KERNEL", d, 1)
>  		if kernel_ver is None:
>  			qemu = "qemu-%s  -s 1048576" % target_arch
> diff --git a/recipes/glibc/glibc-package.bbclass b/recipes/glibc/glibc-package.bbclass
> index 46f809e..ac7e0f3 100644
> --- a/recipes/glibc/glibc-package.bbclass
> +++ b/recipes/glibc/glibc-package.bbclass
> @@ -24,7 +24,7 @@ python __anonymous () {
>  ENABLE_BINARY_LOCALE_GENERATION ?= "0"
>  
>  # BINARY_LOCALE_ARCHES is a space separated list of regular expressions
> -BINARY_LOCALE_ARCHES ?= "arm.*"
> +BINARY_LOCALE_ARCHES ?= "arm.* i[3-6]86 x86_64"
>  
>  # Set this to zero if you don't want ldconfig in the output package
>  USE_LDCONFIG ?= "1"
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


