Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1MAX6l-0003Z5-LL
	for openembedded-devel@openembedded.org; Sun, 31 May 2009 00:32:56 +0200
Received: (qmail 28270 invoked from network); 30 May 2009 22:24:21 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 30 May 2009 15:24:21 -0700
Date: Sat, 30 May 2009 15:24:20 -0700
From: Tom Rini <trini@embeddedalley.com>
To: OpenEmbedded Devel List <openembedded-devel@openembedded.org>
Message-ID: <20090530222420.GT23842@smtp.west.cox.net>
MIME-Version: 1.0
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: (e)glibc-package: enable binary locale generation for powerpc
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
X-List-Received-Date: Sat, 30 May 2009 22:32:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 19, 2009 at 11:04:38PM -0000, Roman Khimov wrote:

> It works there, so add to whitelist.

Acked-by: Tom Rini <trini@embeddedalley.com>

(And pushed just now, forgot to Ackby, wait for patchwork then push).

> 
> ---
> recipes/eglibc/eglibc-package.bbclass |    4 +++-
>  recipes/glibc/glibc-package.bbclass   |    6 ++++--
>  2 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes/eglibc/eglibc-package.bbclass b/recipes/eglibc/eglibc-package.bbclass
> index 22ff52b..f2acc96 100644
> --- a/recipes/eglibc/eglibc-package.bbclass
> +++ b/recipes/eglibc/eglibc-package.bbclass
> @@ -24,7 +24,7 @@ python __anonymous () {
>  ENABLE_BINARY_LOCALE_GENERATION ?= "0"
>  
>  # BINARY_LOCALE_ARCHES is a space separated list of regular expressions
> -BINARY_LOCALE_ARCHES ?= "arm.* i[3-6]86 x86_64"
> +BINARY_LOCALE_ARCHES ?= "arm.* i[3-6]86 x86_64 powerpc"
>  
>  PACKAGES = "eglibc-dbg eglibc catchsegv sln nscd ldd localedef eglibc-utils eglibc-dev eglibc-doc eglibc-locale libsegfault eglibc-extra-nss eglibc-thread-db eglibc-pcprofile"
>  PACKAGES_DYNAMIC = "glibc-gconv-* glibc-charmap-* glibc-localedata-* glibc-binary-localedata-* eglibc-gconv-* eglibc-charmap-* eglibc-localedata-* eglibc-binary-localedata-* locale-base-*"
> @@ -289,6 +289,8 @@ python package_do_split_gconvs () {
>  		target_arch = bb.data.getVar("TARGET_ARCH", d, 1)
>  		if target_arch in ("i486", "i586", "i686"):
>  			target_arch = "i386"
> +		elif target_arch == "powerpc":
> +			target_arch = "ppc"
>  		kernel_ver = bb.data.getVar("OLDEST_KERNEL", d, 1)
>  		if kernel_ver is None:
>  			qemu = "qemu-%s  -s 1048576" % target_arch
> diff --git a/recipes/glibc/glibc-package.bbclass b/recipes/glibc/glibc-package.bbclass
> index ac7e0f3..78738c2 100644
> --- a/recipes/glibc/glibc-package.bbclass
> +++ b/recipes/glibc/glibc-package.bbclass
> @@ -24,7 +24,7 @@ python __anonymous () {
>  ENABLE_BINARY_LOCALE_GENERATION ?= "0"
>  
>  # BINARY_LOCALE_ARCHES is a space separated list of regular expressions
> -BINARY_LOCALE_ARCHES ?= "arm.* i[3-6]86 x86_64"
> +BINARY_LOCALE_ARCHES ?= "arm.* i[3-6]86 x86_64 powerpc"
>  
>  # Set this to zero if you don't want ldconfig in the output package
>  USE_LDCONFIG ?= "1"
> @@ -250,7 +250,9 @@ python package_do_split_gconvs () {
>  	def output_locale_binary(name, locale, encoding):
>  		target_arch = bb.data.getVar("TARGET_ARCH", d, 1)
>  		if target_arch in ("i486", "i586", "i686"):
> -		   target_arch = "i386"
> +			target_arch = "i386"
> +		elif target_arch == "powerpc":
> +			target_arch = "ppc"
>  
>  		kernel_ver = bb.data.getVar("OLDEST_KERNEL", d, 1)
>  		if kernel_ver is None:
-- 
Tom Rini


