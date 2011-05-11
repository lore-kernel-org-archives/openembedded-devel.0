Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QK2ou-0007cm-8A for openembedded-devel@lists.openembedded.org;
	Wed, 11 May 2011 08:22:52 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QK2mC-00065B-0X for openembedded-devel@lists.openembedded.org;
	Wed, 11 May 2011 08:20:04 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 May 2011 08:20:04 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 May 2011 08:20:04 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 11 May 2011 08:18:17 +0200
Message-ID: <iqd9n9$t2p$2@dough.gmane.org>
References: <1305088881-3527-1-git-send-email-heroor@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1305088881-3527-1-git-send-email-heroor@gmail.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH 1/2] ti816x machine: Fix JFFS Image command
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
X-List-Received-Date: Wed, 11 May 2011 06:22:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 11-05-11 06:41, Siddharth Heroor wrote:
> From: Siddharth Heroor <heroor@ti.com>
> 
> * Fixes a bug in the command passed for JFFS2 Image creation.
> 
> Signed-off-by: Siddharth Heroor <heroor@ti.com>

Acked-by: Koen Kooi <k-kooi@ti.com>

> ---
>  conf/machine/include/ti816x.inc |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/conf/machine/include/ti816x.inc b/conf/machine/include/ti816x.inc
> index ebf5166..9db1df8 100644
> --- a/conf/machine/include/ti816x.inc
> +++ b/conf/machine/include/ti816x.inc
> @@ -21,6 +21,6 @@ EXTRA_IMAGEDEPENDS += "u-boot"
>  
>  # Ship all kernel modules
>  IMAGE_FSTYPES += "jffs2 tar.bz2"
> -EXTRA_IMAGECMD_jffs2 = "-lnp -e 0x20000 -s 2048"
> +EXTRA_IMAGECMD_jffs2 = "-lqn -e 128"
>  SERIAL_CONSOLE = "115200 ttyS2"
>  MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 ethernet"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNyiopMkyGM64RGpERAvikAJ9ghRVs9zogRL5oPngH2sWqQgdgZwCghWQV
ZgT3ZyLK7lrODEBC0l525N8=
=XXt9
-----END PGP SIGNATURE-----



