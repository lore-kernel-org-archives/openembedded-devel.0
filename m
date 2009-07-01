Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MM5XE-0003EW-98
	for openembedded-devel@openembedded.org; Wed, 01 Jul 2009 21:32:00 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1MM5Lf-0005S8-5W
	for openembedded-devel@openembedded.org; Wed, 01 Jul 2009 19:20:03 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 01 Jul 2009 19:20:03 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 01 Jul 2009 19:20:03 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 01 Jul 2009 21:15:41 +0200
Message-ID: <h2gckt$bts$2@ger.gmane.org>
References: <200907011817.02564.marcin@juszkiewicz.com.pl>
	<1246474461-16671-7-git-send-email-marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1pre) Gecko/20090622 Shredder/3.0b3pre
In-Reply-To: <1246474461-16671-7-git-send-email-marcin@juszkiewicz.com.pl>
Sender: news <news@ger.gmane.org>
Subject: Re: [STABLE][PATCH 012/125] (e)glibc-package: enable binary locale generation on x86 and x86_64
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
X-List-Received-Date: Wed, 01 Jul 2009 19:32:00 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01-07-09 20:54, Marcin Juszkiewicz wrote:
> From: Roman I Khimov<khimov@altell.ru>
>
> Works well for this targets, so we can add that to BINARY_LOCALE_ARCHES
> whitelist.
>
> Acked-by: Tom Rini<trini@embeddedalley.com>
> Signed-off-by: Marcin Juszkiewicz<marcin@juszkiewicz.com.pl>

Acked-by: Koen Kooi <koen@openembedded.org>

> ---
>   recipes/eglibc/eglibc-package.bbclass |    4 +++-
>   recipes/glibc/glibc-package.bbclass   |    2 +-
>   2 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/recipes/eglibc/eglibc-package.bbclass b/recipes/eglibc/eglibc-package.bbclass
> index 241499f..22ff52b 100644
> --- a/recipes/eglibc/eglibc-package.bbclass
> +++ b/recipes/eglibc/eglibc-package.bbclass
> @@ -24,7 +24,7 @@ python __anonymous () {
>   ENABLE_BINARY_LOCALE_GENERATION ?= "0"
>
>   # BINARY_LOCALE_ARCHES is a space separated list of regular expressions
> -BINARY_LOCALE_ARCHES ?= "arm.*"
> +BINARY_LOCALE_ARCHES ?= "arm.* i[3-6]86 x86_64"
>
>   PACKAGES = "eglibc-dbg eglibc catchsegv sln nscd ldd localedef eglibc-utils eglibc-dev eglibc-doc eglibc-locale libsegfault eglibc-extra-nss eglibc-thread-db eglibc-pcprofile"
>   PACKAGES_DYNAMIC = "glibc-gconv-* glibc-charmap-* glibc-localedata-* glibc-binary-localedata-* eglibc-gconv-* eglibc-charmap-* eglibc-localedata-* eglibc-binary-localedata-* locale-base-*"
> @@ -287,6 +287,8 @@ python package_do_split_gconvs () {
>
>   	def output_locale_binary(name, locale, encoding):
>   		target_arch = bb.data.getVar("TARGET_ARCH", d, 1)
> +		if target_arch in ("i486", "i586", "i686"):
> +			target_arch = "i386"
>   		kernel_ver = bb.data.getVar("OLDEST_KERNEL", d, 1)
>   		if kernel_ver is None:
>   			qemu = "qemu-%s  -s 1048576" % target_arch
> diff --git a/recipes/glibc/glibc-package.bbclass b/recipes/glibc/glibc-package.bbclass
> index 46f809e..ac7e0f3 100644
> --- a/recipes/glibc/glibc-package.bbclass
> +++ b/recipes/glibc/glibc-package.bbclass
> @@ -24,7 +24,7 @@ python __anonymous () {
>   ENABLE_BINARY_LOCALE_GENERATION ?= "0"
>
>   # BINARY_LOCALE_ARCHES is a space separated list of regular expressions
> -BINARY_LOCALE_ARCHES ?= "arm.*"
> +BINARY_LOCALE_ARCHES ?= "arm.* i[3-6]86 x86_64"
>
>   # Set this to zero if you don't want ldconfig in the output package
>   USE_LDCONFIG ?= "1"




