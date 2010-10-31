Received: from smtp204.alice.it ([82.57.200.100])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1PCThX-00080r-Vr
	for openembedded-devel@lists.openembedded.org;
	Sun, 31 Oct 2010 09:55:44 +0100
Received: from [192.168.1.178] (95.244.131.108) by smtp204.alice.it
	(8.5.124.08) (authenticated as editempo)
	id 4C88E33B03FE4F57 for openembedded-devel@lists.openembedded.org;
	Sun, 31 Oct 2010 09:54:56 +0100
From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1287427884-1517-5-git-send-email-morphis@gravedo.de>
References: <1287427884-1517-1-git-send-email-morphis@gravedo.de>
	<1287427884-1517-5-git-send-email-morphis@gravedo.de>
Date: Sun, 31 Oct 2010 09:54:48 +0100
Message-ID: <1288515288.2232.0.camel@gnutoo-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-SA-Exim-Connect-IP: 82.57.200.100
X-SA-Exim-Mail-From: GNUtoo@no-log.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 04/15] netbase: powerup usb0 interface automatically on palmpre machine
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
X-List-Received-Date: Sun, 31 Oct 2010 08:55:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2010-10-18 at 20:51 +0200, Simon Busch wrote:
> Signed-off-by: Simon Busch <morphis@gravedo.de>
> ---
>  recipes/netbase/netbase/palmpre/interfaces |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/recipes/netbase/netbase/palmpre/interfaces b/recipes/netbase/netbase/palmpre/interfaces
> index ca2e007..17416c1 100644
> --- a/recipes/netbase/netbase/palmpre/interfaces
> +++ b/recipes/netbase/netbase/palmpre/interfaces
> @@ -6,6 +6,7 @@ iface lo inet loopback
>  
>  # Ethernet/RNDIS gadget (g_ether)
>  # ... or on host side, usbnet and random hwaddr
> +auto usb0
>  iface usb0 inet static
>  	address 192.168.0.202
>  	netmask 255.255.255.0
what about PR bump?

Denis.




