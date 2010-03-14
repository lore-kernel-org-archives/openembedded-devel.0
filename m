Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NqqBT-0000l2-LP for openembedded-devel@lists.openembedded.org;
	Sun, 14 Mar 2010 16:57:00 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Nqq8Z-0007ae-GH for openembedded-devel@lists.openembedded.org;
	Sun, 14 Mar 2010 16:53:55 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Mar 2010 16:53:55 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Mar 2010 16:53:55 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 14 Mar 2010 16:53:41 +0100
Message-ID: <hnj0q5$luv$1@dough.gmane.org>
References: <1268482329.11170.31.camel@mattotaupa>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.8) Gecko/20100223 Shredder/3.0.3pre
In-Reply-To: <1268482329.11170.31.camel@mattotaupa>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] linux-omap*/beagleboard/defconfig: Compile Ext4 support into Linux.
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
X-List-Received-Date: Sun, 14 Mar 2010 15:57:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi Paul,

Thanks for the patch! I have a huuuuge stack of changed queued for TI
platforms (beagle, hawk, omap3evm etc) that will be merged next week, so
I recreated your patch on top of that:

http://gitorious.org/angstrom/openembedded/commit/3891af0d4838f1445ee27f6be4258d558731f3ea

And the branch:

http://gitorious.org/angstrom/openembedded/commits/ti/staging

Please let me know if that commit matches your intent.

regards,

Koen

On 13-03-10 13:12, Paul Menzel wrote:
> Currently Ext4 support is only build as a loadable kernel module. Therefore Ext4 partitions cannot be used for the rootfs. To fix this compile Ext4 support directly into Linux.
> 
> I used the following command
> 
>     $ find . -name defconfig | grep "beagleboard" | xargs sed -i 's/CONFIG_EXT4_FS=m/CONFIG_EXT4_FS=y/'
> 
> and increased `MACHINE_KERNEL_PR`. I took commit 9a3aceee4861e3b79ad8c73a01b4e4a93e421c0b as an example.
> 
> Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
> ---
>  conf/machine/include/omap3.inc                     |    2 +-
>  .../linux/linux-omap-2.6.28/beagleboard/defconfig  |    2 +-
>  .../linux/linux-omap-2.6.29/beagleboard/defconfig  |    2 +-
>  .../linux/linux-omap-2.6.31/beagleboard/defconfig  |    2 +-
>  .../linux/linux-omap-2.6.32/beagleboard/defconfig  |    2 +-
>  .../linux-omap-pm-2.6.28/beagleboard/defconfig     |    2 +-
>  .../linux-omap-pm-2.6.29/beagleboard/defconfig     |    2 +-
>  .../linux-omap-pm-2.6.31/beagleboard/defconfig     |    2 +-
>  recipes/linux/linux-omap-pm/beagleboard/defconfig  |    2 +-
>  .../linux-omap-psp-2.6.32/beagleboard/defconfig    |    2 +-
>  recipes/linux/linux-omap/beagleboard/defconfig     |    2 +-
>  11 files changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/conf/machine/include/omap3.inc b/conf/machine/include/omap3.inc
> index dd1188b..d96b189 100644
> --- a/conf/machine/include/omap3.inc
> +++ b/conf/machine/include/omap3.inc
> @@ -3,7 +3,7 @@ SOC_FAMILY = "omap3"
>  require conf/machine/include/tune-cortexa8.inc
>  PREFERRED_PROVIDER_virtual/kernel = "linux-omap"
>  # Increase this everytime you change something in the kernel
> -MACHINE_KERNEL_PR = "r51"
> +MACHINE_KERNEL_PR = "r52"
>  
>  KERNEL_IMAGETYPE = "uImage"
>  
> diff --git a/recipes/linux/linux-omap-2.6.28/beagleboard/defconfig b/recipes/linux/linux-omap-2.6.28/beagleboard/defconfig
> index 2c95d76..51a598a 100644
> --- a/recipes/linux/linux-omap-2.6.28/beagleboard/defconfig
> +++ b/recipes/linux/linux-omap-2.6.28/beagleboard/defconfig
> @@ -1817,7 +1817,7 @@ CONFIG_EXT2_FS=y
>  # CONFIG_EXT2_FS_XIP is not set
>  CONFIG_EXT3_FS=y
>  # CONFIG_EXT3_FS_XATTR is not set
> -CONFIG_EXT4_FS=m
> +CONFIG_EXT4_FS=y
>  # CONFIG_EXT4DEV_COMPAT is not set
>  CONFIG_EXT4_FS_XATTR=y
>  # CONFIG_EXT4_FS_POSIX_ACL is not set
> diff --git a/recipes/linux/linux-omap-2.6.29/beagleboard/defconfig b/recipes/linux/linux-omap-2.6.29/beagleboard/defconfig
> index b79f279..f6d8daf 100644
> --- a/recipes/linux/linux-omap-2.6.29/beagleboard/defconfig
> +++ b/recipes/linux/linux-omap-2.6.29/beagleboard/defconfig
> @@ -2308,7 +2308,7 @@ CONFIG_EXT2_FS=y
>  # CONFIG_EXT2_FS_XIP is not set
>  CONFIG_EXT3_FS=y
>  # CONFIG_EXT3_FS_XATTR is not set
> -CONFIG_EXT4_FS=m
> +CONFIG_EXT4_FS=y
>  # CONFIG_EXT4DEV_COMPAT is not set
>  CONFIG_EXT4_FS_XATTR=y
>  # CONFIG_EXT4_FS_POSIX_ACL is not set
> diff --git a/recipes/linux/linux-omap-2.6.31/beagleboard/defconfig b/recipes/linux/linux-omap-2.6.31/beagleboard/defconfig
> index 4856361..d4e4875 100644
> --- a/recipes/linux/linux-omap-2.6.31/beagleboard/defconfig
> +++ b/recipes/linux/linux-omap-2.6.31/beagleboard/defconfig
> @@ -2321,7 +2321,7 @@ CONFIG_EXT2_FS=y
>  CONFIG_EXT3_FS=y
>  # CONFIG_EXT3_DEFAULTS_TO_ORDERED is not set
>  # CONFIG_EXT3_FS_XATTR is not set
> -CONFIG_EXT4_FS=m
> +CONFIG_EXT4_FS=y
>  # CONFIG_EXT4DEV_COMPAT is not set
>  CONFIG_EXT4_FS_XATTR=y
>  # CONFIG_EXT4_FS_POSIX_ACL is not set
> diff --git a/recipes/linux/linux-omap-2.6.32/beagleboard/defconfig b/recipes/linux/linux-omap-2.6.32/beagleboard/defconfig
> index 7857e2d..cebe1f5 100644
> --- a/recipes/linux/linux-omap-2.6.32/beagleboard/defconfig
> +++ b/recipes/linux/linux-omap-2.6.32/beagleboard/defconfig
> @@ -2427,7 +2427,7 @@ CONFIG_EXT2_FS=y
>  CONFIG_EXT3_FS=y
>  # CONFIG_EXT3_DEFAULTS_TO_ORDERED is not set
>  # CONFIG_EXT3_FS_XATTR is not set
> -CONFIG_EXT4_FS=m
> +CONFIG_EXT4_FS=y
>  CONFIG_EXT4_FS_XATTR=y
>  # CONFIG_EXT4_FS_POSIX_ACL is not set
>  # CONFIG_EXT4_FS_SECURITY is not set
> diff --git a/recipes/linux/linux-omap-pm-2.6.28/beagleboard/defconfig b/recipes/linux/linux-omap-pm-2.6.28/beagleboard/defconfig
> index 83327b4..7f2f0e8 100644
> --- a/recipes/linux/linux-omap-pm-2.6.28/beagleboard/defconfig
> +++ b/recipes/linux/linux-omap-pm-2.6.28/beagleboard/defconfig
> @@ -2028,7 +2028,7 @@ CONFIG_EXT2_FS=y
>  # CONFIG_EXT2_FS_XIP is not set
>  CONFIG_EXT3_FS=y
>  # CONFIG_EXT3_FS_XATTR is not set
> -CONFIG_EXT4_FS=m
> +CONFIG_EXT4_FS=y
>  # CONFIG_EXT4DEV_COMPAT is not set
>  CONFIG_EXT4_FS_XATTR=y
>  # CONFIG_EXT4_FS_POSIX_ACL is not set
> diff --git a/recipes/linux/linux-omap-pm-2.6.29/beagleboard/defconfig b/recipes/linux/linux-omap-pm-2.6.29/beagleboard/defconfig
> index 9cb8ab5..e36b945 100644
> --- a/recipes/linux/linux-omap-pm-2.6.29/beagleboard/defconfig
> +++ b/recipes/linux/linux-omap-pm-2.6.29/beagleboard/defconfig
> @@ -2296,7 +2296,7 @@ CONFIG_EXT2_FS=y
>  # CONFIG_EXT2_FS_XIP is not set
>  CONFIG_EXT3_FS=y
>  # CONFIG_EXT3_FS_XATTR is not set
> -CONFIG_EXT4_FS=m
> +CONFIG_EXT4_FS=y
>  # CONFIG_EXT4DEV_COMPAT is not set
>  CONFIG_EXT4_FS_XATTR=y
>  # CONFIG_EXT4_FS_POSIX_ACL is not set
> diff --git a/recipes/linux/linux-omap-pm-2.6.31/beagleboard/defconfig b/recipes/linux/linux-omap-pm-2.6.31/beagleboard/defconfig
> index f43c8f5..615b0c1 100644
> --- a/recipes/linux/linux-omap-pm-2.6.31/beagleboard/defconfig
> +++ b/recipes/linux/linux-omap-pm-2.6.31/beagleboard/defconfig
> @@ -2296,7 +2296,7 @@ CONFIG_EXT2_FS=y
>  CONFIG_EXT3_FS=y
>  # CONFIG_EXT3_DEFAULTS_TO_ORDERED is not set
>  # CONFIG_EXT3_FS_XATTR is not set
> -CONFIG_EXT4_FS=m
> +CONFIG_EXT4_FS=y
>  # CONFIG_EXT4DEV_COMPAT is not set
>  CONFIG_EXT4_FS_XATTR=y
>  # CONFIG_EXT4_FS_POSIX_ACL is not set
> diff --git a/recipes/linux/linux-omap-pm/beagleboard/defconfig b/recipes/linux/linux-omap-pm/beagleboard/defconfig
> index 5e0a85a..4cb5592 100644
> --- a/recipes/linux/linux-omap-pm/beagleboard/defconfig
> +++ b/recipes/linux/linux-omap-pm/beagleboard/defconfig
> @@ -2249,7 +2249,7 @@ CONFIG_EXT2_FS=y
>  # CONFIG_EXT2_FS_XIP is not set
>  CONFIG_EXT3_FS=y
>  # CONFIG_EXT3_FS_XATTR is not set
> -CONFIG_EXT4_FS=m
> +CONFIG_EXT4_FS=y
>  # CONFIG_EXT4DEV_COMPAT is not set
>  CONFIG_EXT4_FS_XATTR=y
>  # CONFIG_EXT4_FS_POSIX_ACL is not set
> diff --git a/recipes/linux/linux-omap-psp-2.6.32/beagleboard/defconfig b/recipes/linux/linux-omap-psp-2.6.32/beagleboard/defconfig
> index 461c854..7450bbc 100644
> --- a/recipes/linux/linux-omap-psp-2.6.32/beagleboard/defconfig
> +++ b/recipes/linux/linux-omap-psp-2.6.32/beagleboard/defconfig
> @@ -2456,7 +2456,7 @@ CONFIG_EXT2_FS=y
>  CONFIG_EXT3_FS=y
>  # CONFIG_EXT3_DEFAULTS_TO_ORDERED is not set
>  # CONFIG_EXT3_FS_XATTR is not set
> -CONFIG_EXT4_FS=m
> +CONFIG_EXT4_FS=y
>  CONFIG_EXT4_FS_XATTR=y
>  # CONFIG_EXT4_FS_POSIX_ACL is not set
>  # CONFIG_EXT4_FS_SECURITY is not set
> diff --git a/recipes/linux/linux-omap/beagleboard/defconfig b/recipes/linux/linux-omap/beagleboard/defconfig
> index f6c503c..e6b3ace 100644
> --- a/recipes/linux/linux-omap/beagleboard/defconfig
> +++ b/recipes/linux/linux-omap/beagleboard/defconfig
> @@ -1845,7 +1845,7 @@ CONFIG_EXT2_FS=y
>  # CONFIG_EXT2_FS_XIP is not set
>  CONFIG_EXT3_FS=y
>  # CONFIG_EXT3_FS_XATTR is not set
> -CONFIG_EXT4_FS=m
> +CONFIG_EXT4_FS=y
>  # CONFIG_EXT4DEV_COMPAT is not set
>  CONFIG_EXT4_FS_XATTR=y
>  # CONFIG_EXT4_FS_POSIX_ACL is not set
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLnQaFMkyGM64RGpERArwFAJwJPeQCCqitZV3C6xsW1MkMM3YK0wCfZJsf
Lk3OomZUcezOfhMw7yY1vqI=
=BBiP
-----END PGP SIGNATURE-----



