Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QlaG5-0002Gw-Dg for openembedded-devel@lists.openembedded.org;
	Tue, 26 Jul 2011 07:32:45 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QlaC1-0003zj-F3 for openembedded-devel@lists.openembedded.org;
	Tue, 26 Jul 2011 07:28:33 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jul 2011 07:28:33 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jul 2011 07:28:33 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 26 Jul 2011 07:28:20 +0200
Message-ID: <j0lj9k$623$1@dough.gmane.org>
References: <1311636070-13650-1-git-send-email-agnel.joel@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
In-Reply-To: <1311636070-13650-1-git-send-email-agnel.joel@gmail.com>
X-Enigmail-Version: 1.2
Subject: Re: [meta-texasinstruments] [PATCH v2] linux-omap: Fix MMC timeout Errors
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
X-List-Received-Date: Tue, 26 Jul 2011 05:32:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Missing SOB

Op 26-07-11 01:21, Joel A Fernandes schreef:
> This fixes MMC errors due to timeouts on certain SD Cards following suggestions to set dto to 14 by Jason Kridner and Steven Kipisz
> 
> Details of the issue: http://talk.maemo.org/showthread.php?p=1000707#post1000707
> 
> This fix proposed by Sukumar Ghoral of TI. --- Generated a patch that applies to meta-texasinstruments as suggested by Koen in the post at [1]
> 
> Changes since earlier patch: * Bumped PR
> 
> [1] http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg19995.html
> 
> ...mc-Adjust-dto-to-eliminate-timeout-errors.patch |   33 ++++++++++++++++++++ recipes-kernel/linux/linux-omap_2.6.39.bb          |    3 +- 2 files changed, 35 insertions(+), 1 deletions(-) create mode 100644
> recipes-kernel/linux/linux-omap-2.6.39/beagle/0007-omap-mmc-Adjust-dto-to-eliminate-timeout-errors.patch
> 
> diff --git a/recipes-kernel/linux/linux-omap-2.6.39/beagle/0007-omap-mmc-Adjust-dto-to-eliminate-timeout-errors.patch b/recipes-kernel/linux/linux-omap-2.6.39/beagle/0007-omap-mmc-Adjust-dto-to-eliminate-timeout-errors.patch new file mode 100644 index 0000000..8cd314c --- /dev/null +++
> b/recipes-kernel/linux/linux-omap-2.6.39/beagle/0007-omap-mmc-Adjust-dto-to-eliminate-timeout-errors.patch @@ -0,0 +1,33 @@ +From bd0b2f97c48aa6aac0c6a494f1c6ba5af5de486b Mon Sep 17 00:00:00 2001 +From: Steve Sakoman <steve@sakoman.com> +Date: Mon, 18 Jul 2011 23:13:41 -0500 +Subject: [PATCH]
> omap_hsmmc: Set dto to max value of 14 to avoid SD Card timeouts + +This fixes MMC errors due to timeouts on certain SD Cards following suggestions +to set dto to 14 by Jason Kridner and Steven Kipisz + +Details of the issue: +http://talk.maemo.org/showthread.php?p=1000707#post1000707 + +This fix
> was originally proposed by Sukumar Ghoral of TI. +--- + drivers/mmc/host/omap_hsmmc.c |    3 +++ + 1 files changed, 3 insertions(+), 0 deletions(-) + +diff --git a/drivers/mmc/host/omap_hsmmc.c b/drivers/mmc/host/omap_hsmmc.c +index 9646a75..7443647 100644 +--- a/drivers/mmc/host/omap_hsmmc.c 
> ++++ b/drivers/mmc/host/omap_hsmmc.c +@@ -1049,6 +1049,9 @@ static void set_data_timeout(struct omap_hsmmc_host *host, + 			dto = 14; + 	} + ++	/* Set dto to max value of 14 to avoid SD Card timeouts */ ++	dto = 14; ++ + 	reg &= ~DTO_MASK; + 	reg |= dto << DTO_SHIFT; +
> OMAP_HSMMC_WRITE(host->base, SYSCTL, reg); +-- +1.7.0.4 + diff --git a/recipes-kernel/linux/linux-omap_2.6.39.bb b/recipes-kernel/linux/linux-omap_2.6.39.bb index c92846d..a22e81f 100644 --- a/recipes-kernel/linux/linux-omap_2.6.39.bb +++ b/recipes-kernel/linux/linux-omap_2.6.39.bb @@ -7,7 +7,7
> @@ COMPATIBLE_MACHINE = "(beagleboard)"
> 
> # The main PR is now using MACHINE_KERNEL_PR, for omap3 see conf/machine/include/omap3.inc SRCREV_pn-${PN} = "v2.6.39" -MACHINE_KERNEL_PR_append = "n" +MACHINE_KERNEL_PR_append = "o"
> 
> FILESPATHPKG_prepend = "linux-omap-2.6.39:"
> 
> @@ -54,6 +54,7 @@ SRC_URI_append = " \ file://beagle/0004-OMAP3-beagle-add-regulators-for-camera-interface.patch \ file://beagle/0005-OMAP3-beagle-HACK-add-in-1GHz-OPP.patch \ file://beagle/0006-OMAP3-BEAGLE-fix-RTC.patch \ +
> file://beagle/0007-omap-mmc-Adjust-dto-to-eliminate-timeout-errors.patch \ \ file://camera/0001-Add-driver-for-Aptina-Micron-mt9p031-sensor.patch \ file://camera/0002-v4l-Add-mt9v032-sensor-driver.patch \

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOLlB0MkyGM64RGpERAn7nAKC32iAk1azm7DjDa7+44xJduirEAACgmjOe
Lm0BwTLuty3oY2Fyewy4meE=
=VFFR
-----END PGP SIGNATURE-----



