Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MBp3P-0005Rv-PX
	for openembedded-devel@openembedded.org; Wed, 03 Jun 2009 13:54:47 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MBoue-0008AD-88
	for openembedded-devel@openembedded.org; Wed, 03 Jun 2009 11:45:44 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 03 Jun 2009 11:45:44 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 03 Jun 2009 11:45:44 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 03 Jun 2009 13:45:24 +0200
Message-ID: <h05nok$s93$1@ger.gmane.org>
References: <200906031325.48159.marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1pre) Gecko/20090526 Shredder/3.0b3pre
In-Reply-To: <200906031325.48159.marcin@juszkiewicz.com.pl>
Sender: news <news@ger.gmane.org>
Subject: Re: [RFC] fix for MACHINE_KERNEL_PR stuff
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
X-List-Received-Date: Wed, 03 Jun 2009 11:54:47 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03-06-09 13:25, Marcin Juszkiewicz wrote:
>
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
> Please test and review it. If this will work I will request it for stable/2009.
>
> Signed-off-by: Marcin Juszkiewicz<marcin@juszkiewicz.com.pl>
>
> diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
> index 1323228..757b704 100644
> --- a/classes/kernel.bbclass
> +++ b/classes/kernel.bbclass
> @@ -20,6 +20,12 @@ python __anonymous () {
>       image = bb.data.getVar('INITRAMFS_IMAGE', d, True)
>       if image != '' and image is not None:
>           bb.data.setVar('INITRAMFS_TASK', '${INITRAMFS_IMAGE}:do_rootfs', d)
> +
> +    pr = bb.data.getVar('PR', d, True)

You're not using 'pr' anywhere in the code you add. Looks fine 
otherwise, although I haven't tested it.

regards,

Koen



