Received: from mail-out.m-online.net ([212.18.0.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mok@mnet-online.de>) id 1PO9Rx-0006bm-M7
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Dec 2010 14:43:54 +0100
Received: from frontend1.mail.m-online.net (unknown [192.168.8.180])
	by mail-out.m-online.net (Postfix) with ESMTP id 500471C08CE5
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Dec 2010 14:42:31 +0100 (CET)
Received: from gonzales.localnet (ppp-188-174-87-224.dynamic.mnet-online.de
	[188.174.87.224])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPS id 3A01C1C00214
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Dec 2010 14:42:31 +0100 (CET)
From: Klaus Kurzmann <mok@mnet-online.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 2 Dec 2010 14:42:32 +0100
User-Agent: KMail/1.13.5 (Linux/2.6.36-ARCH; KDE/4.5.3; x86_64; ; )
References: <1291284734-27056-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1291284734-27056-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Message-Id: <201012021442.33112.mok@mnet-online.de>
X-SA-Exim-Connect-IP: 212.18.0.9
X-SA-Exim-Mail-From: mok@mnet-online.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] nokia900.conf: MACHINE_EXTRA_RRECOMMENDS add needed kernel-modules
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
X-List-Received-Date: Thu, 02 Dec 2010 13:43:54 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Am Donnerstag, 2. Dezember 2010, 11:12:14 schrieb Martin Jansa:
> * list all which are loaded after boot (ie with udev)
> * remove those which are handled by some task-base-* anyways (like g-ether,
> vfat etc) * remove those which are in RDEPENDS of some already listed
> module here ---
>  conf/machine/nokia900.conf |   36 +++++++++++++++++++++++++++++++++++-
>  recipes/tasks/task-base.bb |    2 +-
>  2 files changed, 36 insertions(+), 2 deletions(-)
> 
> diff --git a/conf/machine/nokia900.conf b/conf/machine/nokia900.conf
> index caeb00a..5ed0dae 100644
> --- a/conf/machine/nokia900.conf
> +++ b/conf/machine/nokia900.conf
> @@ -14,7 +14,41 @@ XSERVER = "xserver-xorg \
>             xf86-input-keyboard \
>             xf86-video-omapfb "
> 
> -MACHINE_EXTRA_RRECOMMENDS = "watchdog"
> +MACHINE_EXTRA_RRECOMMENDS = "watchdog \
> +# common \
> +  kernel-module-tsl2563 \
> +  kernel-module-smc91x \
> +  kernel-module-leds-lp5523 \
> +# 2.6.28 \
> +  kernel-module-adp1653 \
> +  kernel-module-ad5820 \
> +  kernel-module-et8ek8 \
> +  kernel-module-fmtx-si4713 \
> +  kernel-module-leds-twl4030-vibra \
> +  kernel-module-lis302dl \
> +  kernel-module-nokia-av \
> +  kernel-module-omap-ssi \
> +  kernel-module-omap-wdt \
> +  kernel-module-phonet \
> +  kernel-module-radio-bcm2048 \
> +  kernel-module-rtc-twl4030 \
> +  kernel-module-smia-sensor \
> +  kernel-module-ssi-mcsaab-imp \
> +  kernel-module-tsc2005 \
> +  kernel-module-twl4030-wdt \
> +  kernel-module-wl12xx \
> +# 2.6.35 \
> +  kernel-module-cmt-speech \
> +  kernel-module-gpio-keys \
> +  kernel-module-hci-h4p \
> +  kernel-module-hsi-char \
> +  kernel-module-isp1704-charger \
> +  kernel-module-lis3lv02d-i2c \
> +  kernel-module-mailbox-mach \
> +  kernel-module-rtc-twl \
> +  kernel-module-twl4030-pwrbutton \
> +  kernel-module-wl1251-spi \
> +"
> 
>  GUI_MACHINE_CLASS = "bigscreen"
>  MACHINE_DISPLAY_WIDTH_PIXELS = "800"
> diff --git a/recipes/tasks/task-base.bb b/recipes/tasks/task-base.bb
> index 6e2d9f0..32d871d 100644
> --- a/recipes/tasks/task-base.bb
> +++ b/recipes/tasks/task-base.bb
> @@ -1,5 +1,5 @@
>  DESCRIPTION = "Merge machine and distro options to create a basic machine
> task/package" -PR = "r91"
> +PR = "r92"
> 
>  inherit task

Acked-by: Klaus Kurzmann <mok@fluxnetz.de>
(for the parsing fixed version of couse :P)

-- 
Klaus 'mrmoku' Kurzmann


