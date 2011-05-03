Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QHA2r-0001ZN-OE for openembedded-devel@lists.openembedded.org;
	Tue, 03 May 2011 09:29:21 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QHA0A-00073Z-3i for openembedded-devel@lists.openembedded.org;
	Tue, 03 May 2011 09:26:34 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 May 2011 09:26:34 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 May 2011 09:26:34 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 03 May 2011 09:26:12 +0200
Message-ID: <ipoamp$7ls$1@dough.gmane.org>
References: <1304370168-4354-1-git-send-email-schnitzeltony@gmx.de>
	<1304370168-4354-2-git-send-email-schnitzeltony@gmx.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1304370168-4354-2-git-send-email-schnitzeltony@gmx.de>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH 1/4] mx28evk: Add new machine definition
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
X-List-Received-Date: Tue, 03 May 2011 07:29:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Can you make this 4/4, otherwise bisecting will be broken since this
machines lacks uboot and kernel.

On 02-05-11 23:02, Andreas Mueller wrote:
> 
> Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
> ---
>  conf/machine/include/imx28.inc |   19 +++++++++++++++++++
>  conf/machine/mx28evk.conf      |   23 +++++++++++++++++++++++
>  2 files changed, 42 insertions(+), 0 deletions(-)
>  create mode 100644 conf/machine/include/imx28.inc
>  create mode 100644 conf/machine/mx28evk.conf
> 
> diff --git a/conf/machine/include/imx28.inc b/conf/machine/include/imx28.inc
> new file mode 100644
> index 0000000..38248a8
> --- /dev/null
> +++ b/conf/machine/include/imx28.inc
> @@ -0,0 +1,19 @@
> +SOC_FAMILY = "mx28"
> +TARGET_ARCH = "arm"
> +
> +require conf/machine/include/tune-arm926ejs.inc
> +
> +PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
> +
> +# Increase this everytime you change something in the kernel
> +MACHINE_KERNEL_PR = "r0"
> +
> +KERNEL_IMAGETYPE = "uImage"
> +
> +UBOOT_ENTRYPOINT = "0x8000"
> +UBOOT_LOADADDRESS = "0x8000"
> +
> +EXTRA_IMAGEDEPENDS += "u-boot"
> +
> +IMAGE_FSTYPES += "jffs2 tar.bz2"
> +
> diff --git a/conf/machine/mx28evk.conf b/conf/machine/mx28evk.conf
> new file mode 100644
> index 0000000..e093ffa
> --- /dev/null
> +++ b/conf/machine/mx28evk.conf
> @@ -0,0 +1,23 @@
> +#@Name: Freescale i.MX28 Evaluation Kit
> +#@DESCRIPTION: Machine configuration for Freescale i.MX28 Evaluation Kit
> +#@Homepage: http://www.freescale.com/webapp/sps/site/prod_summary.jsp?code=MCIMX28EVKJ&fr=g
> +
> +UBOOT_MACHINE = "mx28_evk_config"
> +
> +PREFERRED_PROVIDER_virtual/kernel = "linux-imx"
> +
> +MACHINE_FEATURES = "kernel26 apm alsa ext2 usbhost usbgadget screen"
> +
> +MACHINE_GUI_CLASS = "bigscreen"
> +LOGO_SIZE = "vga"
> +
> +PREFERRED_PROVIDER_virtual/xserver = "xserver-kdrive"
> +XSERVER = "xserver-kdrive-fbdev"
> +
> +require conf/machine/include/imx28.inc
> +
> +# used by sysvinit_2
> +SERIAL_CONSOLE = "115200 ttymxc0"
> +
> +ROOT_FLASH_SIZE = "128"
> +

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNv64UMkyGM64RGpERAnLbAJ428QinP3RjRJfULPVwSBoJDzzmWQCfcK+p
eIXHu+QuINATlNrAQ9LH+pI=
=UwFn
-----END PGP SIGNATURE-----



