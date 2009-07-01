Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MM60G-0005G8-RF
	for openembedded-devel@openembedded.org; Wed, 01 Jul 2009 22:02:00 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1MM5oh-0006ii-7t
	for openembedded-devel@openembedded.org; Wed, 01 Jul 2009 19:50:03 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 01 Jul 2009 19:50:03 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 01 Jul 2009 19:50:03 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 01 Jul 2009 21:15:49 +0200
Message-ID: <h2gcl5$bts$3@ger.gmane.org>
References: <200907011817.02564.marcin@juszkiewicz.com.pl>
	<1246474461-16671-5-git-send-email-marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1pre) Gecko/20090622 Shredder/3.0b3pre
In-Reply-To: <1246474461-16671-5-git-send-email-marcin@juszkiewicz.com.pl>
Sender: news <news@ger.gmane.org>
Subject: Re: [STABLE][PATCH 010/125] (e)glibc-package: fix kernel version passed to qemu
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
X-List-Received-Date: Wed, 01 Jul 2009 20:02:01 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01-07-09 20:54, Marcin Juszkiewicz wrote:
> From: Roman I Khimov<khimov@altell.ru>
>
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
>
> Acked-by: Tom Rini<trini@embeddedalley.com>
> Signed-off-by: Marcin Juszkiewicz<marcin@juszkiewicz.com.pl>

Acked-by: Koen Kooi <koen@openembedded.org>


> ---
>   recipes/eglibc/eglibc-package.bbclass |    6 +++++-
>   recipes/glibc/glibc-package.bbclass   |    6 +++++-
>   2 files changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/recipes/eglibc/eglibc-package.bbclass b/recipes/eglibc/eglibc-package.bbclass
> index 7fcb558..01f698a 100644
> --- a/recipes/eglibc/eglibc-package.bbclass
> +++ b/recipes/eglibc/eglibc-package.bbclass
> @@ -287,7 +287,11 @@ python package_do_split_gconvs () {
>
>   	def output_locale_binary(name, locale, encoding):
>   		target_arch = bb.data.getVar("TARGET_ARCH", d, 1)
> -		qemu = "qemu-%s -r 2.6.16" % target_arch
> +		kernel_ver = bb.data.getVar("OLDEST_KERNEL", d, 1)
> +		if kernel_ver is None:
> +			qemu = "qemu-%s  -s 1048576" % target_arch
> +		else:
> +			qemu = "qemu-%s  -s 1048576 -r %s" % (target_arch, kernel_ver)
>   		pkgname = 'locale-base-' + legitimize_package_name(name)
>   		m = re.match("(.*)\.(.*)", name)
>   		if m:
> diff --git a/recipes/glibc/glibc-package.bbclass b/recipes/glibc/glibc-package.bbclass
> index 89fbd1c..8db8c5c 100644
> --- a/recipes/glibc/glibc-package.bbclass
> +++ b/recipes/glibc/glibc-package.bbclass
> @@ -252,7 +252,11 @@ python package_do_split_gconvs () {
>   		if target_arch in ("i486", "i586", "i686"):
>   		   target_arch = "i386"
>
> -		qemu = "qemu-%s  -s 1048576 -r 2.6.16" % target_arch
> +		kernel_ver = bb.data.getVar("OLDEST_KERNEL", d, 1)
> +		if kernel_ver is None:
> +			qemu = "qemu-%s  -s 1048576" % target_arch
> +		else:
> +			qemu = "qemu-%s  -s 1048576 -r %s" % (target_arch, kernel_ver)
>   		pkgname = 'locale-base-' + legitimize_package_name(name)
>   		m = re.match("(.*)\.(.*)", name)
>   		if m:




