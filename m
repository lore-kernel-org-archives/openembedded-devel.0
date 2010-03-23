Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1NttPt-0006pl-NU
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Mar 2010 03:00:37 +0100
Received: (qmail 15665 invoked by uid 1003); 23 Mar 2010 01:57:02 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 23 Mar 2010 01:57:02 -0000
Message-ID: <4BA81FEC.4060201@balister.org>
Date: Mon, 22 Mar 2010 21:57:00 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.8) Gecko/20100301 Fedora/3.0.3-1.fc11 Thunderbird/3.0.3
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1269255790-13046-1-git-send-email-marcin@juszkiewicz.com.pl>
	<1269255790-13046-3-git-send-email-marcin@juszkiewicz.com.pl>
In-Reply-To: <1269255790-13046-3-git-send-email-marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH][STABLE] netbase: add BUG 2.0 support
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
X-List-Received-Date: Tue, 23 Mar 2010 02:00:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Acked-by: Philip Balister <philip@balister.org>


On 03/22/2010 07:03 AM, Marcin Juszkiewicz wrote:
> From: Marcin Juszkiewicz<marcin@buglabs.net>
>
> Signed-off-by: Marcin Juszkiewicz<marcin@juszkiewicz.com.pl>
> ---
>   recipes/netbase/netbase/bug20/hosts      |    3 +++
>   recipes/netbase/netbase/bug20/interfaces |   29 +++++++++++++++++++++++++++++
>   recipes/netbase/netbase_4.21.bb          |    2 +-
>   3 files changed, 33 insertions(+), 1 deletions(-)
>   create mode 100644 recipes/netbase/netbase/bug20/hosts
>   create mode 100644 recipes/netbase/netbase/bug20/interfaces
>
> diff --git a/recipes/netbase/netbase/bug20/hosts b/recipes/netbase/netbase/bug20/hosts
> new file mode 100644
> index 0000000..789d660
> --- /dev/null
> +++ b/recipes/netbase/netbase/bug20/hosts
> @@ -0,0 +1,3 @@
> +127.0.0.1	localhost.localdomain		localhost	bug
> +10.10.10.1	bughost
> +
> diff --git a/recipes/netbase/netbase/bug20/interfaces b/recipes/netbase/netbase/bug20/interfaces
> new file mode 100644
> index 0000000..6e5f74e
> --- /dev/null
> +++ b/recipes/netbase/netbase/bug20/interfaces
> @@ -0,0 +1,29 @@
> +# /etc/network/interfaces -- configuration file for ifup(8), ifdown(8)
> +
> +# The loopback interface
> +auto lo
> +iface lo inet loopback
> +
> +# Ethernet/RNDIS gadget (g_ether)
> +# usbnet and static hwaddr for mac users
> +auto usb0
> +iface usb0 inet static
> +	hwaddress ether A2:80:F4:8A:3C:91
> +	address 10.10.10.10
> +	netmask 255.255.255.0
> +	gateway 10.10.10.1
> +
> +# Wired interface
> +# BUGbase Ethernet which is built into kernel
> +# It is on USB but we rename it by udev rule
> +auto eth0
> +iface eth0 inet dhcp
> +
> +#
> +# wireless interface
> +auto eth1
> +iface eth1 inet dhcp
> +	wireless_mode managed
> +	wireless_essid any
> +	wpa-driver wext
> +	wpa-conf /etc/wpa_supplicant.conf
> diff --git a/recipes/netbase/netbase_4.21.bb b/recipes/netbase/netbase_4.21.bb
> index c8b4d19..04d9623 100644
> --- a/recipes/netbase/netbase_4.21.bb
> +++ b/recipes/netbase/netbase_4.21.bb
> @@ -2,7 +2,7 @@ DESCRIPTION = "This package provides the necessary \
>   infrastructure for basic TCP/IP based networking."
>   SECTION = "base"
>   LICENSE = "GPL"
> -PR = "r37"
> +PR = "r41"
>
>   inherit update-rc.d
>


