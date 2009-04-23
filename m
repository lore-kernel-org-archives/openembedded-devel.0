Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Lx2jc-0008S1-ST
	for openembedded-devel@openembedded.org; Thu, 23 Apr 2009 19:29:16 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Lx2f6-0006zQ-UU
	for openembedded-devel@openembedded.org; Thu, 23 Apr 2009 17:24:37 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 23 Apr 2009 17:24:36 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 23 Apr 2009 17:24:36 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 23 Apr 2009 19:24:21 +0200
Message-ID: <gsq885$h7s$1@ger.gmane.org>
References: <1240504230-9936-1-git-send-email-marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090415 Shredder/3.0b3pre
In-Reply-To: <1240504230-9936-1-git-send-email-marcin@juszkiewicz.com.pl>
Sender: news <news@ger.gmane.org>
Subject: Re: [STABLE][PATCH 1/1] task-base: added btusb driver to list of recommended BT drivers
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
X-List-Received-Date: Thu, 23 Apr 2009 17:29:17 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23-04-09 18:30, Marcin Juszkiewicz wrote:
> From: Marcin Juszkiewicz<hrw@openembedded.org>
>
> 'btusb' driver replaced 'hci-usb' one few kernel releases ago. We recommend
> both as some devices use older kernels.
>
> Signed-off-by: Marcin Juszkiewicz<hrw@openembedded.org>

I ran into the same problem as well:

Acked-by: Koen Kooi <koen@openembedded.org>


> ---
>   recipes/tasks/task-base.bb |    4 ++--
>   1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes/tasks/task-base.bb b/recipes/tasks/task-base.bb
> index 4003359..66c26af 100644
> --- a/recipes/tasks/task-base.bb
> +++ b/recipes/tasks/task-base.bb
> @@ -1,5 +1,5 @@
>   DESCRIPTION = "Merge machine and distro options to create a basic machine task/package"
> -PR = "r80"
> +PR = "r83"
>
>   inherit task
>
> @@ -256,7 +256,7 @@ RRECOMMENDS_task-base-bluetooth = "\
>       kernel-module-hidp \
>       kernel-module-hci-uart \
>       kernel-module-sco \
> -    ${@base_contains('COMBINED_FEATURES', 'usbhost', 'kernel-module-hci-usb', '',d)} \
> +    ${@base_contains('COMBINED_FEATURES', 'usbhost', 'kernel-module-btusb kernel-module-hci-usb', '',d)} \
>       ${@base_contains('COMBINED_FEATURES', 'pcmcia', 'kernel-module-bluetooth3c-cs', '',d)} \
>       ${@base_contains('COMBINED_FEATURES', 'pcmcia', 'kernel-module-bluecard-cs', '',d)} \
>       ${@base_contains('COMBINED_FEATURES', 'pcmcia', 'kernel-module-bluetoothuart-cs', '',d)} \




