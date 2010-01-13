Received: from vms173015pub.verizon.net ([206.46.173.15])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1NV7fp-0000aa-NU
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jan 2010 19:10:32 +0100
Received: from gandalf.denix.org ([unknown] [71.255.235.232])
	by vms173015.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0KW700BT33LDP683@vms173015.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	13 Jan 2010 11:08:02 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 6235914AF60; Wed,
	13 Jan 2010 12:08:01 -0500 (EST)
Date: Wed, 13 Jan 2010 12:08:01 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100113170801.GA24151@denix.org>
References: <1263401193-12161-1-git-send-email-marcin@juszkiewicz.com.pl>
	<1263401193-12161-2-git-send-email-marcin@juszkiewicz.com.pl>
MIME-version: 1.0
In-reply-to: <1263401193-12161-2-git-send-email-marcin@juszkiewicz.com.pl>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.15
X-SA-Exim-Mail-From: denis@denix.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Marcin Juszkiewicz <marcin@buglabs.net>
Subject: Re: [STABLE][PATCH 1/2] bug: use full X.org
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
X-List-Received-Date: Wed, 13 Jan 2010 18:10:32 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Jan 13, 2010 at 05:46:32PM +0100, Marcin Juszkiewicz wrote:
> From: Marcin Juszkiewicz <marcin@buglabs.net>
> 
> 
> Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>

Acked-by: Denys Dmytriyenko <denis@denix.org>

> ---
>  conf/machine/bug.conf |    8 ++++++++
>  1 files changed, 8 insertions(+), 0 deletions(-)
> 
> diff --git a/conf/machine/bug.conf b/conf/machine/bug.conf
> index 3e0389a..d79cf15 100644
> --- a/conf/machine/bug.conf
> +++ b/conf/machine/bug.conf
> @@ -14,3 +14,11 @@ CPU_FEATURES += "vfp"
>  require conf/machine/include/tune-arm1136jf-s.inc
>  
>  KERNEL_IMAGETYPE = "uImage"
> +
> +PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
> +XSERVER = "xserver-xorg \
> +           xf86-input-evdev \
> +           xf86-input-tslib \
> +           xf86-input-mouse \
> +           xf86-video-fbdev \
> +           xf86-input-keyboard"
> -- 
> 1.6.6
> 
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


