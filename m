Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1M8YGR-0005xb-E7
	for openembedded-devel@openembedded.org; Mon, 25 May 2009 13:22:43 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1M8Y8i-0000QO-7E
	for openembedded-devel@openembedded.org; Mon, 25 May 2009 11:14:44 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 25 May 2009 11:14:44 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 25 May 2009 11:14:44 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 25 May 2009 13:14:30 +0200
Message-ID: <gvduim$pdi$1@ger.gmane.org>
References: <1243248515-28181-1-git-send-email-ihar.hrachyshka@gmail.com>
	<1243248679-28230-1-git-send-email-ihar.hrachyshka@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b5pre) Gecko/20090519 Shredder/3.0b3pre
In-Reply-To: <1243248679-28230-1-git-send-email-ihar.hrachyshka@gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH] udev: include udev-utils into udev rootfs
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
X-List-Received-Date: Mon, 25 May 2009 11:22:43 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25-05-09 12:51, Ihar Hrachyshka wrote:
> The reason for the move is that udevadm binary is executed from udev
> init.d script.

Acked-by: Koen Kooi <koen@openembedded.org>


>
> Signed-off-by: Ihar Hrachyshka<ihar.hrachyshka@gmail.com>
> ---
>   recipes/udev/udev_141.bb |    5 ++++-
>   1 files changed, 4 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/udev/udev_141.bb b/recipes/udev/udev_141.bb
> index 7e26798..068d23c 100644
> --- a/recipes/udev/udev_141.bb
> +++ b/recipes/udev/udev_141.bb
> @@ -6,7 +6,10 @@ LICENSE = "GPL"
>   # Untested
>   DEFAULT_PREFERENCE = "-1"
>
> -PR = "r7"
> +PR = "r8"
> +
> +# needed for init.d script
> +RDEPENDS_udev += "udev-utils"
>
>   SRC_URI = "http://kernel.org/pub/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
>   	   file://mount.blacklist \




