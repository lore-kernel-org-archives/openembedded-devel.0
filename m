Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@datenfreihafen.org>) id 1QKwrj-00045m-Pm
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 May 2011 20:13:31 +0200
Received: from p4fc7654c.dip.t-dialin.net ([79.199.101.76]
	helo=excalibur.local) by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1QKwoz-0003rr-Hb by authid <stefan@sostec.de> with srv_auth_cram_md5;
	Fri, 13 May 2011 20:10:44 +0200
Received: from stefan by excalibur.local with local (Exim 4.76)
	(envelope-from <stefan@excalibur.local>)
	id 1QKwox-0002C1-O0; Fri, 13 May 2011 20:10:39 +0200
Date: Fri, 13 May 2011 20:10:39 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
Message-ID: <20110513181039.GF29302@excalibur.local>
References: <1305290080.2448.3.camel@gnutoo-laptop>
	<1305290588-7057-4-git-send-email-GNUtoo@no-log.org>
MIME-Version: 1.0
In-Reply-To: <1305290588-7057-4-git-send-email-GNUtoo@no-log.org>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Cc: openembedded-devel@lists.openembedded.org,
	Stefan Schmidt <stefan@buglabs.net>
Subject: Re: [PATCH 04/12] udev-rules-buglabs: sync with buglabs repository
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
X-List-Received-Date: Fri, 13 May 2011 18:13:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Fri, 2011-05-13 at 14:43, Denis 'GNUtoo' Carikli wrote:
> This commit fixes the following issue:
>  * apache felix crashed without the input/user_button on 2.6.35
>    for the bug20 machine

I had this patch locally but not pushed to master yet. I'll drop mine.

Acked-by: Stefan Schmidt <stefan@buglabs.net>


> The changes were taken from https://github.com/buglabs/oe-buglabs.git
>   at commit f6169d03b37d7832ea9372a479469df5f556848b
> 
> Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
> ---
>  recipes/udev-rules-buglabs/bug-udev/00-bug20.rules |    7 ++++---
>  .../udev-rules-buglabs/bug-udev/wlan-trigger.sh    |    7 +++++++
>  recipes/udev-rules-buglabs/bug-udev_0.1.bb         |    9 +++++----
>  3 files changed, 16 insertions(+), 7 deletions(-)
>  create mode 100644 recipes/udev-rules-buglabs/bug-udev/wlan-trigger.sh
> 
> diff --git a/recipes/udev-rules-buglabs/bug-udev/00-bug20.rules b/recipes/udev-rules-buglabs/bug-udev/00-bug20.rules
> index 0722c5c..946c89c 100644
> --- a/recipes/udev-rules-buglabs/bug-udev/00-bug20.rules
> +++ b/recipes/udev-rules-buglabs/bug-udev/00-bug20.rules
> @@ -12,12 +12,13 @@ KERNEL=="ttySC1", SUBSYSTEMS=="platform", SYMLINK+="ttyBMI3"
>  ACTION=="add" KERNEL=="mmcblk1*", RUN+="/sbin/modprobe g_file_storage file=/dev/%k removable=1"
>  ACTION=="remove" KERNEL=="mmcblk1*", RUN+="/sbin/modprobe -r g_file_storage"
>  # For Novatel USB 3G (CDMA) Dongle
> -ATTRS{idVendor}=="1410", ATTRS{idProduct}=="5030", RUN+="/usr/bin/eject %k"
> -ATTRS{idVendor}=="1410", ATTRS{idProduct}=="6000", RUN+="/sbin/modprobe usbserial vendor=0x1410 product=0x6000"
> +SUBSYSTEMS=="scsi",DRIVERS=="sr",ATTRS{vendor}=="Novatel ",ACTION=="add",RUN+="/usr/bin/eject %k"
>  # For Sprint U301 3g/4g
>  ATTRS{idVendor}=="1a40", ATTRS{idProduct}=="0101", RUN+="/usr/bin/eject %k" 
>  ATTRS{idVendor}=="16d8", ATTRS{idProduct}=="6008" RUN+="/sbin/modprobe usbserial vendor=0x16d8 product=0x6008"
>  # For libertas_sdio named eth1
>  SUBSYSTEMS=="sdio", DRIVERS=="libertas_sdio", NAME="wlan0"
>  KERNEL=="event*",ATTRS{name}=="twl4030_pwrbutton",SYMLINK+="input/power_button"
> -KERNEL=="event*",ATTRS{name}=="omap_twl4030keypad",SYMLINK+="input/user_button"
> +KERNEL=="event*",ATTRS{name}=="TWL4030 Keypad",SYMLINK+="input/user_button"
> +# Set eth1assoc as the default trigger for the wifi-green LED
> +SUBSYSTEMS=="sdio", DRIVERS=="libertas_sdio", NAME="wlan0", RUN+="/etc/udev/scripts/wlan-trigger.sh"
> diff --git a/recipes/udev-rules-buglabs/bug-udev/wlan-trigger.sh b/recipes/udev-rules-buglabs/bug-udev/wlan-trigger.sh
> new file mode 100644
> index 0000000..1eb4ca1
> --- /dev/null
> +++ b/recipes/udev-rules-buglabs/bug-udev/wlan-trigger.sh
> @@ -0,0 +1,7 @@
> +#!/bin/sh
> +if [ -e /sys/class/net/eth0 ]; then
> +    echo phy1assoc > /sys/class/leds/omap3bug\:green\:wifi/trigger
> +else
> +    echo phy0assoc > /sys/class/leds/omap3bug\:green\:wifi/trigger
> +fi
> +echo none > /sys/class/leds/omap3bug\:red\:wifi/trigger
> diff --git a/recipes/udev-rules-buglabs/bug-udev_0.1.bb b/recipes/udev-rules-buglabs/bug-udev_0.1.bb
> index b9238fa..35db9e3 100644
> --- a/recipes/udev-rules-buglabs/bug-udev_0.1.bb
> +++ b/recipes/udev-rules-buglabs/bug-udev_0.1.bb
> @@ -3,14 +3,15 @@ LICENSE = "GPL"
>  SECTION = "x11"
>  PRIORITY = "optional"
>  RDEPENDS_${PN} = "udev"
> -PR = "r25"
> +PR = "r26"
>  
>  SRC_URI = "file://00-bug20.rules \
> -	   file://bmi_eventpipe.sh \
> -	   file://bt_init.sh \
> -	   file://working.psr \
> +           file://bmi_eventpipe.sh \
> +           file://bt_init.sh \
> +           file://working.psr \
>             file://mbkb-stop.sh \
>             file://mbkb-start.sh \
> +           file://wlan-trigger.sh \
>             "
>  
>  S = "${WORKDIR}"
> -- 
> 1.7.0.4
> 


