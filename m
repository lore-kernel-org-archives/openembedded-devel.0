Received: from [80.91.229.12] (helo=lo.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MsvaG-0003HW-NE for openembedded-devel@lists.openembedded.org;
	Wed, 30 Sep 2009 11:34:55 +0200
Received: from list by lo.gmane.org with local (Exim 4.50) id 1MsvZb-0000ay-1M
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Sep 2009 11:34:11 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Sep 2009 11:34:11 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Sep 2009 11:34:11 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 30 Sep 2009 11:33:48 +0200
Message-ID: <h9v8lt$ivq$1@ger.gmane.org>
References: <1254234301-11957-1-git-send-email-marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.3pre) Gecko/20090811 Shredder/3.0b4pre
In-Reply-To: <1254234301-11957-1-git-send-email-marcin@juszkiewicz.com.pl>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [STABLE][PATCH] netbase: on BUG eth0 is always built-in Ethernet not wifi
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
X-List-Received-Date: Wed, 30 Sep 2009 09:34:55 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29-09-09 16:25, Marcin Juszkiewicz wrote:
> From: Marcin Juszkiewicz<marcin@buglabs.net>

Acked-by: Koen Kooi <koen@openembedded.org>


>
> ---
>   recipes/netbase/netbase/bug/interfaces |   11 ++++-------
>   recipes/netbase/netbase_4.21.bb        |    2 +-
>   2 files changed, 5 insertions(+), 8 deletions(-)
>
> diff --git a/recipes/netbase/netbase/bug/interfaces b/recipes/netbase/netbase/bug/interfaces
> index c410484..30e2404 100644
> --- a/recipes/netbase/netbase/bug/interfaces
> +++ b/recipes/netbase/netbase/bug/interfaces
> @@ -20,17 +20,14 @@ iface wlan0 inet dhcp
>   	wpa-driver wext
>   	wpa-conf /etc/wpa_supplicant.conf
>
> -# Wired or wireless interfaces
> -# Handylink Ethernet or Wifi bugmodule or USB Ethernet
> +# Wired interface
> +# BUGbase Ethernet which is built into kernel
>   auto eth0
>   iface eth0 inet dhcp
> -	wireless_mode managed
> -	wireless_essid any
> -	wpa-driver wext
> -	wpa-conf /etc/wpa_supplicant.conf
> +
>   #
>   # Wired or wireless interfaces
> -# Wifi bugmodule or USB Ethernet
> +# BUGbase or BUGWifi module or USB Ethernet
>   auto eth1
>   iface eth1 inet dhcp
>   	wireless_mode managed
> diff --git a/recipes/netbase/netbase_4.21.bb b/recipes/netbase/netbase_4.21.bb
> index c0c97b7..adde2f0 100644
> --- a/recipes/netbase/netbase_4.21.bb
> +++ b/recipes/netbase/netbase_4.21.bb
> @@ -2,7 +2,7 @@ DESCRIPTION = "This package provides the necessary \
>   infrastructure for basic TCP/IP based networking."
>   SECTION = "base"
>   LICENSE = "GPL"
> -PR = "r35"
> +PR = "r37"
>
>   inherit update-rc.d
>




