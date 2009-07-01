Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MM5gv-0004A4-5X
	for openembedded-devel@openembedded.org; Wed, 01 Jul 2009 21:42:02 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1MM5VK-0005xm-Du
	for openembedded-devel@openembedded.org; Wed, 01 Jul 2009 19:30:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 01 Jul 2009 19:30:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 01 Jul 2009 19:30:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 01 Jul 2009 21:27:06 +0200
Message-ID: <h2gdab$e8d$1@ger.gmane.org>
References: <200907011819.54127.marcin@juszkiewicz.com.pl>
	<1246474518-16737-1-git-send-email-marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1pre) Gecko/20090622 Shredder/3.0b3pre
In-Reply-To: <1246474518-16737-1-git-send-email-marcin@juszkiewicz.com.pl>
Sender: news <news@ger.gmane.org>
Subject: Re: [STABLE][PATCH 077/125] kexecboot: require ../linux/linux.inc, not recipes/linux/linux.inc.
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
X-List-Received-Date: Wed, 01 Jul 2009 19:42:05 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01-07-09 20:54, Marcin Juszkiewicz wrote:
> From: Chris Larson<clarson@mvista.com>
>
> linux-kexecboot.inc does a 'require recipes/linux/linux.inc', but it really
> depends on how the upstream OpenEmbedded linux/linux.inc behaves, not whatever
> the first one it finds in BBPATH does.  This broke builds for me combining
> upstream OpenEmbedded with some local collections that do different things
> with their kernels.
>
> Signed-off-by: Chris Larson<clarson@mvista.com>
> Signed-off-by: Marcin Juszkiewicz<marcin@juszkiewicz.com.pl>

Acked-by: Koen Kooi <koen@openembedded.org>


> ---
>   recipes/kexecboot/linux-kexecboot.inc |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/kexecboot/linux-kexecboot.inc b/recipes/kexecboot/linux-kexecboot.inc
> index 31b6377..eba5d66 100644
> --- a/recipes/kexecboot/linux-kexecboot.inc
> +++ b/recipes/kexecboot/linux-kexecboot.inc
> @@ -6,7 +6,7 @@ SRC_URI = "file://defconfig"
>   LOGO_SIZE = '${@base_conditional("GUI_MACHINE_CLASS", "bigscreen", "vga", "qvga", d)}'
>   SRC_URI += "file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2"
>
> -require recipes/linux/linux.inc
> +require ../linux/linux.inc
>
>   DONT_CHECK_KERNELSIZE = ""
>   INITRAMFS_IMAGE = "initramfs-kexecboot-image"




