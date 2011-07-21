Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Qjmuc-0008Gj-KE for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jul 2011 08:39:10 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Qjmqf-00063s-Ee for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jul 2011 08:35:05 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jul 2011 08:35:05 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jul 2011 08:35:05 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 21 Jul 2011 08:29:51 +0200
Message-ID: <j08h0v$tdv$3@dough.gmane.org>
References: <1311199325-7532-1-git-send-email-agnel.joel@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
In-Reply-To: <1311199325-7532-1-git-send-email-agnel.joel@gmail.com>
X-Enigmail-Version: 1.2
Subject: Re: [PATCH v2] linux-omap-psp, linux-omap: Added patch to fix MMC timeout errors
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
X-List-Received-Date: Thu, 21 Jul 2011 06:39:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 21-07-11 00:02, Joel A Fernandes schreef:
> This fixes MMC errors due to timeouts on certain SD Cards following suggestions to set dto to 14 by Jason Kridner and Steven Kipisz
> 
> Details of the issue: http://talk.maemo.org/showthread.php?p=1000707#post1000707 --- Changes since v1: * Made patch to apply to org.openembedded.dev branch * Bumped PR of respective recipes
> 
> ...mc-Adjust-dto-to-eliminate-timeout-errors.patch |   27 ++++++++++++++ ...mc-Adjust-dto-to-eliminate-timeout-errors.patch |   39 +++++++++++--------- recipes/linux/linux-omap-psp_2.6.32.bb             |    2 +- recipes/linux/linux-omap_2.6.39.bb                 |    3 +-

Could you please split that in 2? And for the .39 kernel, the master recipe is in meta-ti, not in .dev: http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/meta-texasinstruments/tree/recipes-kernel/linux/linux-omap_2.6.39.bb?id=7018fe0a81fa33c6d73d6296d25517b5d427d0a7


> 4 files changed, 52 insertions(+), 19 deletions(-) create mode 100644 recipes/linux/linux-omap-2.6.39/beagle/0006-omap-mmc-Adjust-dto-to-eliminate-timeout-errors.patch
> 
> diff --git a/recipes/linux/linux-omap-2.6.39/beagle/0006-omap-mmc-Adjust-dto-to-eliminate-timeout-errors.patch b/recipes/linux/linux-omap-2.6.39/beagle/0006-omap-mmc-Adjust-dto-to-eliminate-timeout-errors.patch new file mode 100644 index 0000000..7a563b7 --- /dev/null +++
> b/recipes/linux/linux-omap-2.6.39/beagle/0006-omap-mmc-Adjust-dto-to-eliminate-timeout-errors.patch @@ -0,0 +1,27 @@ +From bd0b2f97c48aa6aac0c6a494f1c6ba5af5de486b Mon Sep 17 00:00:00 2001 +From: Joel A Fernandes <agnel.joel@gmail.com> +Date: Mon, 18 Jul 2011 23:13:41 -0500 +Subject: [PATCH]
> omap_hsmmc: Set dto to max value of 14 to avoid SD Card timeouts + +Signed-off-by: Joel A Fernandes <agnel.joel@gmail.com> +--- + drivers/mmc/host/omap_hsmmc.c |    3 +++ + 1 files changed, 3 insertions(+), 0 deletions(-) + +diff --git a/drivers/mmc/host/omap_hsmmc.c
> b/drivers/mmc/host/omap_hsmmc.c +index 9646a75..7443647 100644 +--- a/drivers/mmc/host/omap_hsmmc.c ++++ b/drivers/mmc/host/omap_hsmmc.c +@@ -1049,6 +1049,9 @@ static void set_data_timeout(struct omap_hsmmc_host *host, + 			dto = 14; + 	} + ++	/* Set dto to max value of 14 to avoid SD Card
> timeouts */ ++	dto = 14; ++ + 	reg &= ~DTO_MASK; + 	reg |= dto << DTO_SHIFT; + 	OMAP_HSMMC_WRITE(host->base, SYSCTL, reg); +-- +1.7.0.4 + diff --git a/recipes/linux/linux-omap-psp-2.6.32/0047-omap-mmc-Adjust-dto-to-eliminate-timeout-errors.patch
> b/recipes/linux/linux-omap-psp-2.6.32/0047-omap-mmc-Adjust-dto-to-eliminate-timeout-errors.patch index 4867d3f..7a563b7 100644 --- a/recipes/linux/linux-omap-psp-2.6.32/0047-omap-mmc-Adjust-dto-to-eliminate-timeout-errors.patch +++
> b/recipes/linux/linux-omap-psp-2.6.32/0047-omap-mmc-Adjust-dto-to-eliminate-timeout-errors.patch @@ -1,22 +1,27 @@ -From 26a79f408bd41ad7b4a47f2683909d3fc1575eab Mon Sep 17 00:00:00 2001 -From: Steve Sakoman <steve@sakoman.com> -Date: Wed, 12 Jan 2011 05:54:55 -0800 -Subject: [PATCH] omap: mmc:
> Adjust dto to eliminate timeout errors +From bd0b2f97c48aa6aac0c6a494f1c6ba5af5de486b Mon Sep 17 00:00:00 2001 +From: Joel A Fernandes <agnel.joel@gmail.com> +Date: Mon, 18 Jul 2011 23:13:41 -0500 +Subject: [PATCH] omap_hsmmc: Set dto to max value of 14 to avoid SD Card timeouts
> 
> -A number of SD card types were experiencing timeout errors.  This -could also lead to data corruption in some cases. - -This fix proposed by Sukumar Ghoral of TI. +Signed-off-by: Joel A Fernandes <agnel.joel@gmail.com> --- + drivers/mmc/host/omap_hsmmc.c |    3 +++ + 1 files changed, 3
> insertions(+), 0 deletions(-) + diff --git a/drivers/mmc/host/omap_hsmmc.c b/drivers/mmc/host/omap_hsmmc.c -index 9646a75..ef458d6 100644 +index 9646a75..7443647 100644 --- a/drivers/mmc/host/omap_hsmmc.c +++ b/drivers/mmc/host/omap_hsmmc.c -@@ -1032,6 +1032,7 @@ static void
> set_data_timeout(struct omap_hsmmc_host *host, - 	cycle_ns = 1000000000 / (clk_get_rate(host->fclk) / clkd); - 	timeout = timeout_ns / cycle_ns; - 	timeout += timeout_clks; -+	timeout *= 2; - 	if (timeout) { - 		while ((timeout & 0x80000000) == 0) { - 			dto += 1; +@@ -1049,6 +1049,9 @@ static
> void set_data_timeout(struct omap_hsmmc_host *host, + 			dto = 14; + 	} + ++	/* Set dto to max value of 14 to avoid SD Card timeouts */ ++	dto = 14; ++ + 	reg &= ~DTO_MASK; + 	reg |= dto << DTO_SHIFT; + 	OMAP_HSMMC_WRITE(host->base, SYSCTL, reg); +-- +1.7.0.4 + diff --git
> a/recipes/linux/linux-omap-psp_2.6.32.bb b/recipes/linux/linux-omap-psp_2.6.32.bb index 91de194..31de659 100644 --- a/recipes/linux/linux-omap-psp_2.6.32.bb +++ b/recipes/linux/linux-omap-psp_2.6.32.bb @@ -9,7 +9,7 @@ COMPATIBLE_MACHINE =
> "am3517-crane|beagleboard|omap3evm|am3517-evm|dm37x-evm|am3 SRCREV = "5fc29e7b2a76a64a739f857858ef0b98294aa155"
> 
> # The main PR is now using MACHINE_KERNEL_PR, for omap3 see conf/machine/include/omap3.inc -MACHINE_KERNEL_PR_append = "f+gitr${SRCREV}" +MACHINE_KERNEL_PR_append = "g+gitr${SRCREV}"
> 
> SRC_URI = "git://arago-project.org/git/projects/linux-omap3.git;protocol=http;branch=master \ file://0001-Added-Crane-Board-support.patch \ diff --git a/recipes/linux/linux-omap_2.6.39.bb b/recipes/linux/linux-omap_2.6.39.bb index 5b1c797..5566c0d 100644 --- a/recipes/linux/linux-omap_2.6.39.bb 
> +++ b/recipes/linux/linux-omap_2.6.39.bb @@ -7,7 +7,7 @@ COMPATIBLE_MACHINE = "(beagleboard)"
> 
> # The main PR is now using MACHINE_KERNEL_PR, for omap3 see conf/machine/include/omap3.inc SRCREV_pn-${PN} = "v2.6.39" -MACHINE_KERNEL_PR_append = "h" +MACHINE_KERNEL_PR_append = "i"
> 
> FILESPATHPKG_prepend = "linux-omap-2.6.39:"
> 
> @@ -52,6 +52,7 @@ SRC_URI_append = " \ file://beagle/0003-OMAP3-beagle-add-MADC-support.patch \ file://beagle/0004-OMAP3-beagle-add-regulators-for-camera-interface.patch \ file://beagle/0005-OMAP3-beagle-HACK-add-in-1GHz-OPP.patch \ +
> file://beagle/0006-omap-mmc-Adjust-dto-to-eliminate-timeout-errors.patch \ \ file://camera/0001-Add-driver-for-Aptina-Micron-mt9p031-sensor.patch \ file://camera/0002-v4l-Add-mt9v032-sensor-driver.patch \

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOJ8dfMkyGM64RGpERAtMmAJ9E1pKW0VA3ofR/v7R0UoUGoUhjDwCeIIko
hOGT22eesWJbF9RNYcCaKSs=
=xXhT
-----END PGP SIGNATURE-----



