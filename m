Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QK2n3-0007Rv-MO for openembedded-devel@lists.openembedded.org;
	Wed, 11 May 2011 08:20:57 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QK2kM-0005Ow-T5 for openembedded-devel@lists.openembedded.org;
	Wed, 11 May 2011 08:18:10 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 May 2011 08:18:10 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 May 2011 08:18:10 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 11 May 2011 08:17:57 +0200
Message-ID: <iqd9ml$t2p$1@dough.gmane.org>
References: <1305088881-3527-1-git-send-email-heroor@gmail.com>
	<1305088881-3527-2-git-send-email-heroor@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1305088881-3527-2-git-send-email-heroor@gmail.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH 2/2] ti816x machine: Update for latest kernel version
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
X-List-Received-Date: Wed, 11 May 2011 06:20:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 11-05-11 06:41, Siddharth Heroor wrote:
> From: Siddharth Heroor <heroor@ti.com>
> 
> * In 2.6.37 the console is tied to ttyO2.
> * Bump PR.
> 
> Signed-off-by: Siddharth Heroor <heroor@ti.com>
> ---
>  conf/machine/include/ti816x.inc |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/conf/machine/include/ti816x.inc b/conf/machine/include/ti816x.inc
> index 9db1df8..ca0b4f5 100644
> --- a/conf/machine/include/ti816x.inc
> +++ b/conf/machine/include/ti816x.inc
> @@ -7,7 +7,7 @@ PREFERRED_PROVIDER_virtual/kernel = "linux-omap3"
>  PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
>  
>  # Increase this everytime you change something in the kernel
> -MACHINE_KERNEL_PR = "r1"
> +MACHINE_KERNEL_PR = "r2"

for the tty change you need to change the PR of sysvinit, not
machine_kernel_pr.

regards,

Koen

>  
>  KERNEL_IMAGETYPE = "uImage"
>  
> @@ -22,5 +22,5 @@ EXTRA_IMAGEDEPENDS += "u-boot"
>  # Ship all kernel modules
>  IMAGE_FSTYPES += "jffs2 tar.bz2"
>  EXTRA_IMAGECMD_jffs2 = "-lqn -e 128"
> -SERIAL_CONSOLE = "115200 ttyS2"
> +SERIAL_CONSOLE = "115200 ttyO2"
>  MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 ethernet"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNyioUMkyGM64RGpERAkIPAJ42UkTECbOnuCaCb5ryHnRkztoMbQCdFXFK
w+/QLkyjus44CRHnATQU2og=
=JoQj
-----END PGP SIGNATURE-----



