Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MGuuW-00024C-MZ
	for openembedded-devel@openembedded.org; Wed, 17 Jun 2009 15:10:42 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MGukQ-0002G0-KI
	for openembedded-devel@openembedded.org; Wed, 17 Jun 2009 13:00:14 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 17 Jun 2009 13:00:14 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 17 Jun 2009 13:00:14 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 17 Jun 2009 14:59:59 +0200
Message-ID: <h1apcf$7kb$1@ger.gmane.org>
References: <1245240653-436-1-git-send-email-marcin@juszkiewicz.com.pl>
	<1245242573-5006-1-git-send-email-marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1pre) Gecko/20090604 Shredder/3.0b3pre
In-Reply-To: <1245242573-5006-1-git-send-email-marcin@juszkiewicz.com.pl>
Sender: news <news@ger.gmane.org>
Subject: Re: [STABLE][PATCH] fix for MACHINE_KERNEL_PR stuff
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
X-List-Received-Date: Wed, 17 Jun 2009 13:10:50 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17-06-09 14:42, Marcin Juszkiewicz wrote:
> This patch unbreaks current behaviour which was introduced by
> MACHINE_KERNEL_PR variable.
>
> As most of target machines do not use it they have PR with broken value
> (set to "r0" instead of value in recipe). I took other way which makes
> both types of users happy -- those with MACHINE_KERNEL_PR in use and
> those without it.
>
> By default we set M_K_PR to empty string instead of "r0" - this allows
> to check is it set at all or not. If it is set then we set PR to this value.
> Otherwise we ignore existance of that variable and use PR from recipe.
>
> Signed-off-by: Marcin Juszkiewicz<marcin@juszkiewicz.com.pl>

Acked-by: Koen Kooi <koen@openembedded.org>


> ---
>   classes/kernel.bbclass |    9 +++++----
>   conf/bitbake.conf      |    2 +-
>   2 files changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
> index 954c407..278aec1 100644
> --- a/classes/kernel.bbclass
> +++ b/classes/kernel.bbclass
> @@ -20,6 +20,11 @@ python __anonymous () {
>       image = bb.data.getVar('INITRAMFS_IMAGE', d, True)
>       if image != '' and image is not None:
>           bb.data.setVar('INITRAMFS_TASK', '${INITRAMFS_IMAGE}:do_rootfs', d)
> +
> +    machine_kernel_pr = bb.data.getVar('MACHINE_KERNEL_PR', d, True)
> +
> +    if machine_kernel_pr:
> +       bb.data.setVar('PR', machine_kernel_pr, d)
>   }
>
>   INITRAMFS_IMAGE ?= ""
> @@ -64,10 +69,6 @@ export CMDLINE_CONSOLE = "console=${@bb.data.getVar("KERNEL_CONSOLE",d,1) or "tt
>   KERNEL_VERSION = "${@get_kernelversion('${S}')}"
>   KERNEL_MAJOR_VERSION = "${@get_kernelmajorversion('${KERNEL_VERSION}')}"
>
> -# A machine.conf or local.conf can increase MACHINE_KERNEL_PR to force
> -# rebuilds for kernel and external modules
> -PR = "${MACHINE_KERNEL_PR}"
> -
>   KERNEL_LOCALVERSION ?= ""
>
>   # kernels are generally machine specific
> diff --git a/conf/bitbake.conf b/conf/bitbake.conf
> index c411b95..9333b4e 100644
> --- a/conf/bitbake.conf
> +++ b/conf/bitbake.conf
> @@ -159,7 +159,7 @@ P = "${PN}-${PV}"
>
>   # Define a PR for kernels that machines can override so things like
>   # modules get rebuilt
> -MACHINE_KERNEL_PR ?= "r0"
> +MACHINE_KERNEL_PR = ""
>
>   # Base package name
>   # Automatically derives "foo" from "foo-native", "foo-cross" or "foo-initial"




