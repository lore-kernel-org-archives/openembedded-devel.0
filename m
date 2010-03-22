Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Ntgre-00052x-Cf for openembedded-devel@lists.openembedded.org;
	Mon, 22 Mar 2010 13:36:18 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Ntgoc-00031V-Oo for openembedded-devel@lists.openembedded.org;
	Mon, 22 Mar 2010 13:33:06 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Mar 2010 13:33:06 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Mar 2010 13:33:06 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 22 Mar 2010 13:32:55 +0100
Message-ID: <ho7o1n$nb2$1@dough.gmane.org>
References: <1269255790-13046-1-git-send-email-marcin@juszkiewicz.com.pl>
	<1269255790-13046-3-git-send-email-marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.8) Gecko/20100314 Shredder/3.0.4pre
In-Reply-To: <1269255790-13046-3-git-send-email-marcin@juszkiewicz.com.pl>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
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
X-List-Received-Date: Mon, 22 Mar 2010 12:36:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Acked-by: Koen Kooi <koen@openembedded.org>

On 22-03-10 12:03, Marcin Juszkiewicz wrote:
> From: Marcin Juszkiewicz <marcin@buglabs.net>
> 
> Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
> ---
>  recipes/netbase/netbase/bug20/hosts      |    3 +++
>  recipes/netbase/netbase/bug20/interfaces |   29 +++++++++++++++++++++++++++++
>  recipes/netbase/netbase_4.21.bb          |    2 +-
>  3 files changed, 33 insertions(+), 1 deletions(-)
>  create mode 100644 recipes/netbase/netbase/bug20/hosts
>  create mode 100644 recipes/netbase/netbase/bug20/interfaces
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
>  infrastructure for basic TCP/IP based networking."
>  SECTION = "base"
>  LICENSE = "GPL"
> -PR = "r37"
> +PR = "r41"
>  
>  inherit update-rc.d
>  

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLp2N2MkyGM64RGpERAn5XAKCHnQQ6XeDM0Qhty+F383FM/0/jDgCgqPBO
B57ODgJU0cs/fzmpqyKXxVQ=
=wlyu
-----END PGP SIGNATURE-----



