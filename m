Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Lx4Nd-0001A9-Bx
	for openembedded-devel@openembedded.org; Thu, 23 Apr 2009 21:14:42 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1Lx4J8-0003Wh-Ml
	for openembedded-devel@openembedded.org; Thu, 23 Apr 2009 19:10:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 23 Apr 2009 19:10:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 23 Apr 2009 19:10:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 23 Apr 2009 20:56:05 +0200
Message-ID: <gsqdk6$3q9$4@ger.gmane.org>
References: <1240511199-30422-1-git-send-email-marcin@juszkiewicz.com.pl>
	<1240511199-30422-2-git-send-email-marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090415 Shredder/3.0b3pre
In-Reply-To: <1240511199-30422-2-git-send-email-marcin@juszkiewicz.com.pl>
Sender: news <news@ger.gmane.org>
Subject: Re: [STABLE][PATCH 1/4] bug: added BUG Labs device
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
X-List-Received-Date: Thu, 23 Apr 2009 19:14:44 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23-04-09 20:26, Marcin Juszkiewicz wrote:
> From: Marcin Juszkiewicz<marcin@buglabs.net>
>
> BUG is i.mx31 based device which is often called 'LEGO for IT'.
>
> More info: http://buglabs.net/

Acked-by: Koen Kooi <koen@openembedded.org>


>
> Signed-off-by: Marcin Juszkiewicz<marcin@buglabs.net>
> ---
>   conf/machine/bug.conf |   16 ++++++++++++++++
>   1 files changed, 16 insertions(+), 0 deletions(-)
>   create mode 100644 conf/machine/bug.conf
>
> diff --git a/conf/machine/bug.conf b/conf/machine/bug.conf
> new file mode 100644
> index 0000000..cec3d5b
> --- /dev/null
> +++ b/conf/machine/bug.conf
> @@ -0,0 +1,16 @@
> +#@TYPE: Machine
> +#@NAME: Bug Labs BUG Computer
> +#@DESCRIPTION: Machine configuration for the BUG base unit.
> +TARGET_ARCH = "arm"
> +
> +MACHINE_EXTRA_RRECOMMENDS = "marvell-gspi-fw"
> +PREFERRED_PROVIDER_virtual/kernel = "linux-bug"
> +
> +MACHINE_FEATURES = "kernel26 screen touchscreen hotplug alsa wifi usbhost usbgadget"
> +SERIAL_CONSOLE = "-L 115200 ttymxc4"
> +
> +CPU_FEATURES += "vfp"
> +
> +require conf/machine/include/tune-arm1136jf-s.inc
> +
> +KERNEL_IMAGETYPE = "uImage"




