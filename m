Received: from li19-45.members.linode.com ([64.22.125.45] helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koansoftware@gmail.com>) id 1O3Qaw-0006iA-Is
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Apr 2010 11:15:15 +0200
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id 22AFC2C7F5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Apr 2010 09:10:35 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VBihGTfRZ8L1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Apr 2010 09:10:31 +0000 (UTC)
Received: from [10.1.10.2] (host61-87-static.14-79-b.business.telecomitalia.it
	[79.14.87.61]) by wiki.koala.it (Postfix) with ESMTPSA id C2C4F2C7DE
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Apr 2010 09:10:30 +0000 (UTC)
Message-ID: <4BCACCE4.5040600@gmail.com>
Date: Sun, 18 Apr 2010 11:12:04 +0200
From: Marco Cavallini <koansoftware@gmail.com>
Organization: KOAN sas - Bergamo - Italia
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <alpine.LNX.2.00.1004161842100.28729@asterix.crazy-teaparty.dyndns.org>
	<alpine.DEB.1.10.1004161852390.13187@vitus.devnet.local>
In-Reply-To: <alpine.DEB.1.10.1004161852390.13187@vitus.devnet.local>
X-SA-Exim-Connect-IP: 64.22.125.45
X-SA-Exim-Mail-From: koansoftware@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=AWL,BAYES_00,SPF_NEUTRAL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 3/5] netbase: add tb5200l specific /etc/network/interfaces
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
X-List-Received-Date: Sun, 18 Apr 2010 09:15:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Vitus Jensen ha scritto, Il 16/04/2010 18:53:
> * eth0, usb for host connectivity
> * can0, can1 to control CAN devices
>=20
> Signed-off-by: Vitus Jensen <vjensen@gmx.de>
> ---
>  recipes/netbase/netbase/tb5200l/interfaces |   33 ++++++++++++++++++++=
++++++++
>  1 files changed, 33 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/netbase/netbase/tb5200l/interfaces
>=20
> diff --git a/recipes/netbase/netbase/tb5200l/interfaces b/recipes/netba=
se/netbase/tb5200l/interfaces
> new file mode 100644
> index 0000000..9b27ef0
> --- /dev/null
> +++ b/recipes/netbase/netbase/tb5200l/interfaces
> @@ -0,0 +1,33 @@
> +# /etc/network/interfaces -- configuration file for ifup(8), ifdown(8)
> +
> +# The loopback interface
> +auto lo
> +iface lo inet loopback
> +
> +
> +# Wired ethernet interface of "tiny box"
> +auto eth0
> +iface eth0 inet dhcp
> +
> +
> +# Ethernet/RNDIS gadget (g_ether)
> +# ... or on host side, usbnet and random hwaddr
> +iface usb0 inet static
> +	address 192.168.0.202
> +	netmask 255.255.255.0
> +	network 192.168.0.0
> +	gateway 192.168.0.200
> +
> +# CAN interfaces
> +auto can0
> +iface can0 inet manual
> +	pre-up ip link set $IFACE type can bitrate 125000 listen-only off
> +	up /sbin/ifconfig $IFACE up
> +	down /sbin/ifconfig $IFACE down
> +
> +auto can1
> +iface can1 inet manual
> +	pre-up ip link set $IFACE type can bitrate 125000 listen-only off
> +	up /sbin/ifconfig $IFACE up
> +	down /sbin/ifconfig $IFACE down
> +


Acked-by: Marco Cavallini <m.cavallini@koansoftware.com>


Cordiali Saluti / Kindest Regards / mit freundlichen Gr=C3=BCssen
--
Marco Cavallini | KOAN sas | Bergamo - Italia
 embedded and real-time software engineering
   Atmel third party certified consultant
Phone:+39-035-255.235 - Fax:+39-178-22.39.748
      http://www.KoanSoftware.com
        http://www.KaeilOS.com


