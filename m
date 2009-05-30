Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1MAVUZ-00060r-Uj
	for openembedded-devel@openembedded.org; Sat, 30 May 2009 22:49:24 +0200
Received: (qmail 27969 invoked from network); 30 May 2009 20:40:48 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 30 May 2009 13:40:48 -0700
Date: Sat, 30 May 2009 13:40:47 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090530204047.GM23842@smtp.west.cox.net>
References: <1243189985-19060-1-git-send-email-ihar.hrachyshka@gmail.com>
	<1243198440-8833-1-git-send-email-ihar.hrachyshka@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1243198440-8833-1-git-send-email-ihar.hrachyshka@gmail.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH 1/4] udev: fixed obsolete udevadm syntax for udev	init.d script.
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
X-List-Received-Date: Sat, 30 May 2009 20:49:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, May 24, 2009 at 11:54:00PM +0300, Ihar Hrachyshka wrote:

> Fixed the following warning message when executing udev init script:
> "udevadm control commands requires the --<command> format, this will
> stop working in a future release."
> 
> Signed-off-by: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>

So, while I would have preferred we fixup both, looking more long-term I
think dev is going to move towards dropping some old programs, so..:

Acked-by: Tom Rini <trini@embeddedalley.com>

> ---
>  recipes/udev/udev-141/init |    4 ++--
>  recipes/udev/udev_141.bb   |    2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes/udev/udev-141/init b/recipes/udev/udev-141/init
> index efe4470..7188b5a 100644
> --- a/recipes/udev/udev-141/init
> +++ b/recipes/udev/udev-141/init
> @@ -56,10 +56,10 @@ kill_udevd > "/dev/null" 2>&1
>          echo -e '\000\000\000\000' > /proc/sys/kernel/hotplug
>          /sbin/udevd -d
>  
> -        /sbin/udevadm control env STARTUP=1
> +        /sbin/udevadm control --env STARTUP=1
>  		if [ "$not_first_boot" != "" ];then
>  			/sbin/udevadm trigger --subsystem-nomatch=tty --subsystem-nomatch=mem --subsystem-nomatch=vc --subsystem-nomatch=vtconsole --subsystem-nomatch=misc --subsystem-nomatch=dcon --subsystem-nomatch=pci_bus  --subsystem-nomatch=graphics  --subsystem-nomatch=backlight --subsystem-nomatch=video4linux  --subsystem-nomatch=platform
> -			(/sbin/udevadm settle --timeout=3; /sbin/udevadm control env STARTUP=)&
> +			(/sbin/udevadm settle --timeout=3; /sbin/udevadm control --env STARTUP=)&
>  			if [ "$DEVCACHE" != "" ]; then
>  				rm -f /tmp/uname
>  				rm -f /tmp/cmdline
> diff --git a/recipes/udev/udev_141.bb b/recipes/udev/udev_141.bb
> index e7438fb..7e26798 100644
> --- a/recipes/udev/udev_141.bb
> +++ b/recipes/udev/udev_141.bb
> @@ -6,7 +6,7 @@ LICENSE = "GPL"
>  # Untested
>  DEFAULT_PREFERENCE = "-1"
>  
> -PR = "r6"
> +PR = "r7"
>  
>  SRC_URI = "http://kernel.org/pub/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
>  	   file://mount.blacklist \
> -- 
> 1.6.3.1
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 

-- 
Tom Rini


