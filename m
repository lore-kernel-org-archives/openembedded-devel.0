Received: from [80.91.229.12] (helo=lo.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MppnA-0001Tw-AC for openembedded-devel@lists.openembedded.org;
	Mon, 21 Sep 2009 22:47:27 +0200
Received: from list by lo.gmane.org with local (Exim 4.50) id 1Mppmb-00071b-GN
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Sep 2009 22:46:49 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Sep 2009 22:46:49 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Sep 2009 22:46:49 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 21 Sep 2009 22:46:22 +0200
Message-ID: <h98omu$35c$1@ger.gmane.org>
References: <1253549226-16186-1-git-send-email-denis@denix.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.3pre) Gecko/20090811 Shredder/3.0b4pre
In-Reply-To: <1253549226-16186-1-git-send-email-denis@denix.org>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [RFC][PATCH] netbase: don't start udhcpc if kernel assigned IP statically
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
X-List-Received-Date: Mon, 21 Sep 2009 20:47:27 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21-09-09 18:07, Denys Dmytriyenko wrote:
>
> Signed-off-by: Denys Dmytriyenko<denis@denix.org>

Acked-by: Koen Kooi <koen@openembedded.org>


> ---
>   recipes/netbase/netbase/interfaces |    2 ++
>   1 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/recipes/netbase/netbase/interfaces b/recipes/netbase/netbase/interfaces
> index c615642..bae03dd 100644
> --- a/recipes/netbase/netbase/interfaces
> +++ b/recipes/netbase/netbase/interfaces
> @@ -52,6 +52,8 @@ iface atml0 inet dhcp
>   # Wired or wireless interfaces
>   auto eth0
>   iface eth0 inet dhcp
> +        pre-up /bin/grep -v -e "ip=[0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+" /proc/cmdline>  /dev/null
> +
>   iface eth1 inet dhcp
>
>   # Ethernet/RNDIS gadget (g_ether)




