Received: from smtp-out13.alice.it ([85.33.2.18])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1NMpjV-0007bX-0M
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Dec 2009 22:24:04 +0100
Received: from FBCMMO01.fbc.local ([192.168.68.195]) by smtp-out13.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 21 Dec 2009 22:22:08 +0100
Received: from FBCMCL01B06.fbc.local ([192.168.69.87]) by FBCMMO01.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 21 Dec 2009 22:22:08 +0100
Received: from [192.168.1.116] ([79.54.158.130]) by FBCMCL01B06.fbc.local with
	Microsoft SMTPSVC(6.0.3790.3959); Mon, 21 Dec 2009 22:22:08 +0100
From: GNUtoo <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1261091322-11271-2-git-send-email-GNUtoo@no-log.org>
References: <1261091322-11271-1-git-send-email-GNUtoo@no-log.org>
	<1261091322-11271-2-git-send-email-GNUtoo@no-log.org>
Date: Mon, 21 Dec 2009 22:22:08 +0100
Message-Id: <1261430528.3714.0.camel@gnutoo-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.1 
X-OriginalArrivalTime: 21 Dec 2009 21:22:08.0393 (UTC)
	FILETIME=[A6C7F790:01CA8283]
X-SA-Exim-Connect-IP: 85.33.2.18
X-SA-Exim-Mail-From: GNUtoo@no-log.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 1/2] udev-141: added support for buglabs's bug device
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
X-List-Received-Date: Mon, 21 Dec 2009 21:24:04 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

ping:
On Fri, 2009-12-18 at 00:08 +0100, Denis 'Gnutoo' Carikli wrote:
> The udev configurations files are needed for Xorg configuration
>   for buglabs's bug device that will be commited later,
>   in order to find the right device nodes for the touchscreens
> 
> Note that the script creating the bmi(Bug module interface)
>   event pipe has not been commented out,because it will be needed
>   when the java bindings for the bug device will be in openembedded
> 
> Signed-off-by: Denis 'Gnutoo' Carikli <GNUtoo@no-log.org>
> ---
>  recipes/udev/udev-141/bug/10-mx31.rules    |   49 ++++++++++++++++++++++++++++
>  recipes/udev/udev-141/bug/30-BUG.rules     |   26 +++++++++++++++
>  recipes/udev/udev-141/bug/bmi_eventpipe.sh |    8 ++++
>  recipes/udev/udev_141.bb                   |   16 ++++++++-
>  4 files changed, 98 insertions(+), 1 deletions(-)
>  create mode 100644 recipes/udev/udev-141/bug/10-mx31.rules
>  create mode 100644 recipes/udev/udev-141/bug/30-BUG.rules
>  create mode 100644 recipes/udev/udev-141/bug/bmi_eventpipe.sh
> 
> diff --git a/recipes/udev/udev-141/bug/10-mx31.rules b/recipes/udev/udev-141/bug/10-mx31.rules
> new file mode 100644
> index 0000000..de427fc
> --- /dev/null
> +++ b/recipes/udev/udev-141/bug/10-mx31.rules
> @@ -0,0 +1,49 @@
> +KERNEL=="ttyS[0-9]",	NAME="tts/%n",		SYMLINK+="tts%n"
> +KERNEL=="ttymxc[0-9]",	NAME="ttymxc/%n",	SYMLINK+="ttymxc%n"
> +
> +KERNEL=="mxc_mu[0-9]",	NAME="mxc_mu/%n",	SYMLINK+="mxc_mu%n"
> +KERNEL=="fb*",		NAME="fb/%n",		SYMLINK+="fb%n"
> +KERNEL=="i2c*",		NAME="i2c/%n"
> +KERNEL=="mxc_ipc*",	NAME="mxc_ipc/%n"
> +KERNEL=="video*",	NAME="v4l/video%n"
> +
> +KERNEL=="rtc",		NAME="misc/rtc"
> +KERNEL=="watchdog",	NAME="misc/watchdog"
> +
> +KERNEL=="mc13783_adc",	NAME="mc13783_adc",	SYMLINK+="ts"
> +KERNEL=="pmic_adc",	NAME="pmic_adc",	SYMLINK+="ts"
> +
> +# The long class name gets cut off to be mc13783_connectiv in 
> +# /sys/class/mc13783_connectivity/mc13783_connectivit
> +KERNEL=="mc13783_connectiv*",	NAME="mc13783_connectivity"
> +
> +KERNEL=="mxc_ssi[0-9]*",	NAME="mxc_ssi/%n",	SYMLINK+="mxc_ssi%n"
> +KERNEL=="spi[0-9]*",	NAME="spi/%n",		SYMLINK+="spi%n"
> +
> +KERNEL=="mtdblock*",	NAME="mtdblock/%n"	SYMLINK+="mtdblock%n"
> +KERNEL=="mtd[0-9]",	NAME="mtd/%n"
> +
> +# A more elegant way of doing this must exist...
> +KERNEL=="mtd0ro",	NAME="mtd/0ro"
> +KERNEL=="mtd1ro",	NAME="mtd/1ro"
> +KERNEL=="mtd2ro",	NAME="mtd/2ro"
> +KERNEL=="mtd3ro",	NAME="mtd/3ro"
> +KERNEL=="mtd4ro",	NAME="mtd/4ro"
> +KERNEL=="mtd5ro",	NAME="mtd/5ro"
> +KERNEL=="mtd6ro",	NAME="mtd/6ro"
> +KERNEL=="mtd7ro",	NAME="mtd/7ro"
> +KERNEL=="mtd8ro",	NAME="mtd/8ro"
> +KERNEL=="mtd9ro",	NAME="mtd/9ro"
> +
> +# Note that we want /dev/dsp linked to /dev/sound/dsp1...
> +KERNEL=="dsp",		NAME="sound/dsp"
> +KERNEL=="dspW",		NAME="sound/dspW"
> +KERNEL=="dsp1",		NAME="sound/dsp1",	SYMLINK+="dsp"
> +KERNEL=="mixer",		NAME="sound/mixer",	SYMLINK+="mixer"
> +KERNEL=="sequencer",	NAME="sound/sequencer"
> +KERNEL=="sequencer2",	NAME="sound/sequencer2"
> +
> +KERNEL=="ram[0-9]*",	NAME="ram/%n",		SYMLINK+="ram%n"
> +
> +KERNEL=="dvfs_dptc",	NAME="dvfs_dptc",	SYMLINK+="dptc dvfs"
> +
> diff --git a/recipes/udev/udev-141/bug/30-BUG.rules b/recipes/udev/udev-141/bug/30-BUG.rules
> new file mode 100644
> index 0000000..06faa6b
> --- /dev/null
> +++ b/recipes/udev/udev-141/bug/30-BUG.rules
> @@ -0,0 +1,26 @@
> +##
> +## BUG/BMI specific
> +##
> +KERNEL=="event*", ATTRS{name}=="bugnav", SYMLINK+="input/bugnav"
> +KERNEL=="event*", ATTRS{name}=="bmi_motion", SYMLINK+="input/bmi_motion"
> +KERNEL=="event*", ATTRS{name}=="bug_cam", SYMLINK+="input/bmi_cam"
> +KERNEL=="event*", ATTRS{name}=="bmi_audio_status_m1", SYMLINK+="input/bmi_audio_m1"
> +KERNEL=="event*", ATTRS{name}=="bmi_audio_status_m2", SYMLINK+="input/bmi_audio_m2"
> +KERNEL=="event*", ATTRS{name}=="bmi_audio_status_m3", SYMLINK+="input/bmi_audio_m3"
> +KERNEL=="event*", ATTRS{name}=="bmi_audio_status_m4", SYMLINK+="input/bmi_audio_m4"
> +DEVPATH=="/devices/platform/bugfb.0", SYMLINK+="bugfb"
> +KERNEL=="rtc0", SYMLINK+="rtc"
> +KERNEL=="event*", ATTRS{name}=="bmi_lcd_ts0", SYMLINK+="input/bmi_lcd_ts0"
> +KERNEL=="event*", ATTRS{name}=="bmi_lcd_ts1", SYMLINK+="input/bmi_lcd_ts1"
> +KERNEL=="event*", ATTRS{name}=="bmi_lcd_ts2", SYMLINK+="input/bmi_lcd_ts2"
> +KERNEL=="event*", ATTRS{name}=="bmi_lcd_ts3", SYMLINK+="input/bmi_lcd_ts3"
> +KERNEL=="event*", ATTRS{name}=="bmi_lcd_ts4", SYMLINK+="input/bmi_lcd_ts4"
> +KERNEL=="event*", ATTRS{name}=="bmi_lcd_ts5", SYMLINK+="input/bmi_lcd_ts5"
> +KERNEL=="event*", ATTRS{name}=="bmi_lcd_ts6", SYMLINK+="input/bmi_lcd_ts6"
> +ACTION=="add", DEVPATH=="/devices/conn*", RUN+="/bin/sh /etc/udev/scripts/bmi_eventpipe.sh"
> +ACTION=="remove", DEVPATH=="/devices/conn*", RUN+="/bin/sh /etc/udev/scripts/bmi_eventpipe.sh"
> +#
> +# For USB PBPSD, which we've arbitrarily decided will be module F001
> +#
> +ACTION=="remove", SUBSYSTEM=="usb", DRIVERS=="psd_driver", ENV{BMIBUS_PRODUCT}="F001", ENV{BMIBUS_SLOT}="%n", RUN+="/bin/sh /etc/udev/scripts/bmi_eventpipe.sh"
> +ACTION=="add", SUBSYSTEM=="usb", DRIVERS=="psd_driver", ENV{BMIBUS_PRODUCT}="F001", ENV{BMIBUS_SLOT}="%n", RUN+="/bin/sh /etc/udev/scripts/bmi_eventpipe.sh"
> diff --git a/recipes/udev/udev-141/bug/bmi_eventpipe.sh b/recipes/udev/udev-141/bug/bmi_eventpipe.sh
> new file mode 100644
> index 0000000..acbae56
> --- /dev/null
> +++ b/recipes/udev/udev-141/bug/bmi_eventpipe.sh
> @@ -0,0 +1,8 @@
> +#!/bin/sh
> +#
> +# This script passes BMI state variables to the running JVM.
> +#
> +if [ ${BMIBUS_PRODUCT} != "" ] && [ ${BMIBUS_SLOT} != "" ] && [ ${ACTION} != "" ];
> +then                                                                            
> +        echo $BMIBUS_PRODUCT 0 $BMIBUS_SLOT $ACTION > /tmp/eventpipe            
> +fi
> diff --git a/recipes/udev/udev_141.bb b/recipes/udev/udev_141.bb
> index e07150d..00ba971 100644
> --- a/recipes/udev/udev_141.bb
> +++ b/recipes/udev/udev_141.bb
> @@ -6,7 +6,7 @@ LICENSE = "GPL"
>  # Untested
>  DEFAULT_PREFERENCE = "-1"
>  
> -PR = "r18"
> +PR = "r19"
>  
>  # needed for init.d script
>  RDEPENDS_${PN} += "udev-utils"
> @@ -29,6 +29,14 @@ SRC_URI += " \
>  SRC_URI_append_h2200 = " file://50-hostap_cs.rules "
>  PACKAGE_ARCH_h2200 = "h2200"
>  
> +#buglabs's bug device
> +SRC_URI_append_bug = " \
> +       file://30-BUG.rules \
> +       file://10-mx31.rules \
> +       file://bmi_eventpipe.sh "
> +
> +PACKAGE_ARCH_bug = "bug"
> +
>  inherit update-rc.d autotools_stage
>  
>  # Put stuff in /lib and /sbin
> @@ -98,6 +106,12 @@ do_install_append_h2200() {
>  	install -m 0644 ${WORKDIR}/50-hostap_cs.rules         ${D}${sysconfdir}/udev/rules.d/50-hostap_cs.rules
>  }
>  
> +do_install_append_bug() {
> +	install -m 0644 ${WORKDIR}/30-BUG.rules ${D}${sysconfdir}/udev/rules.d/30-BUG.rules
> +	install -m 0644 ${WORKDIR}/10-mx31.rules ${D}${sysconfdir}/udev/rules.d/10-mx31.rules
> +	install -m 0644 ${WORKDIR}/bmi_eventpipe.sh ${D}${sysconfdir}/udev/scripts/bmi_eventpipe.sh
> +}
> +
>  pkg_postinst_${PN}_append() {
>  if [ -d $D/lib/udev/rules.d ] ; then
>  	echo "$D/lib/udev/rules.d is not a symlink, fixing that"



