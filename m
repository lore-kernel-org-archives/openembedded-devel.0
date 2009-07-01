Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MM6OX-00048W-Ka
	for openembedded-devel@openembedded.org; Wed, 01 Jul 2009 22:27:05 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1MM6Cs-0007gM-Gs
	for openembedded-devel@openembedded.org; Wed, 01 Jul 2009 20:15:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 01 Jul 2009 20:15:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 01 Jul 2009 20:15:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 01 Jul 2009 21:16:47 +0200
Message-ID: <h2gcmv$bts$9@ger.gmane.org>
References: <200907011819.54127.marcin@juszkiewicz.com.pl>
	<1246474518-16737-5-git-send-email-marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1pre) Gecko/20090622 Shredder/3.0b3pre
In-Reply-To: <1246474518-16737-5-git-send-email-marcin@juszkiewicz.com.pl>
Sender: news <news@ger.gmane.org>
Subject: Re: [STABLE][PATCH 105/125] at2440evb.conf: Add AT2440EVB machine config.
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
X-List-Received-Date: Wed, 01 Jul 2009 20:27:06 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01-07-09 20:55, Marcin Juszkiewicz wrote:
> From: Ramax Lo<ramaxlo@gmail.com>
>
> Signed-off-by: Marcin Juszkiewicz<marcin@juszkiewicz.com.pl>

Acked-by: Koen Kooi <koen@openembedded.org>


> ---
>   conf/machine/at2440evb.conf |   19 +++++++++++++++++++
>   1 files changed, 19 insertions(+), 0 deletions(-)
>   create mode 100644 conf/machine/at2440evb.conf
>
> diff --git a/conf/machine/at2440evb.conf b/conf/machine/at2440evb.conf
> new file mode 100644
> index 0000000..f3fa5ed
> --- /dev/null
> +++ b/conf/machine/at2440evb.conf
> @@ -0,0 +1,19 @@
> +#@TYPE: Machine
> +#@Name: Avantech AT2440EVB Dev Board
> +#@DESCRIPTION: Machine configuration for Avantech AT2440EVB Dev Board
> +
> +
> +TARGET_ARCH = "arm"
> +
> +PREFERRED_PROVIDER_virtual/kernel = "linux"
> +
> +# used by sysvinit_2
> +SERIAL_CONSOLE = "115200 ttySAC0"
> +
> +IMAGE_FSTYPES = "tar.gz"
> +KERNEL_IMAGETYPE = "uImage"
> +UBOOT_ENTRYPOINT = "30008000"
> +
> +MACHINE_FEATURES = "kernel26 screen touchscreen"
> +
> +require conf/machine/include/tune-arm920t.inc




