Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@dresearch.de>) id 1P2jws-00040e-Hr
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Oct 2010 14:15:19 +0200
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 7B3A0491286
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Oct 2010 14:15:02 +0200 (CEST)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.4675); Mon, 4 Oct 2010 14:15:02 +0200
Message-ID: <4CA9C546.5080406@dresearch.de>
Date: Mon, 04 Oct 2010 14:15:02 +0200
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de;
	rv:1.9.2.9) Gecko/20100915 Lightning/1.0b2 Thunderbird/3.1.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <i8cf7aMAN_POSIXLY_CORRECT=1@dough.gmane.org>
	<1286194192-22256-1-git-send-email-sledz@dresearch.de>
In-Reply-To: <1286194192-22256-1-git-send-email-sledz@dresearch.de>
X-OriginalArrivalTime: 04 Oct 2010 12:15:02.0249 (UTC)
	FILETIME=[C56E2590:01CB63BD]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@dresearch.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v4] epiphany-2.30.2: unbreak build by adding ca-certificates dependencies
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
X-List-Received-Date: Mon, 04 Oct 2010 12:15:19 -0000
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

Am 04.10.2010 14:09, schrieb Steffen Sledz:
> Signed-off-by: Steffen Sledz <sledz@dresearch.de>
> ---
>  recipes/gnome/epiphany_2.30.2.bb |    6 ++++--
>  1 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes/gnome/epiphany_2.30.2.bb b/recipes/gnome/epiphany_2.30.2.bb
> index 426d468..6422c74 100644
> --- a/recipes/gnome/epiphany_2.30.2.bb
> +++ b/recipes/gnome/epiphany_2.30.2.bb
> @@ -1,7 +1,9 @@
>  DESCRIPTION = "GNOME default webbrowser"
> -DEPENDS = "libsoup-2.4 gnome-desktop gnome-vfs libgnomeui webkit-gtk iso-codes startup-notification"
> +LICENSE = "GPLv2"
> +DEPENDS = "libsoup-2.4 gnome-desktop gnome-vfs libgnomeui webkit-gtk iso-codes startup-notification ca-certificates"
>  RDEPENDS_${PN} = "gnome-vfs-plugin-http iso-codes"
> -PR = "r2"
> +RRECOMMENDS_${PN} = "ca-certificates"
> +PR = "r3"
>  
>  inherit gnome
>  




