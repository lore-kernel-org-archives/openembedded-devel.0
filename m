Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1NpNun-0000lg-Bb
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Mar 2010 16:33:46 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1NpNru-0003VS-V9 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Mar 2010 07:30:42 -0800
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Wed, 10 Mar 2010 07:30:42 -0800
Received: from 172.30.33.172 ([172.30.33.172]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Wed, 10 Mar 2010 15:29:58 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	10 Mar 2010 08:29:56 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100310135425.31263.61632.stgit@ES-J7S4D2J.amer.consind.ge.com>
References: <20100310135425.31263.61632.stgit@ES-J7S4D2J.amer.consind.ge.com>
Organization: Mentor Graphics Corporation
Date: Wed, 10 Mar 2010 08:29:54 -0700
Message-ID: <1268234994.16526.170.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 10 Mar 2010 15:30:42.0363 (UTC)
	FILETIME=[A52960B0:01CAC066]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Add Freescale P2020DS Demo Board
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
X-List-Received-Date: Wed, 10 Mar 2010 15:33:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2010-03-10 at 13:54 +0000, Martyn Welch wrote:
> This patch adds the Freescale P2020DS demo board, which is based on the
> p2020 SOC.
>=20
> Signed-off-by: Martyn Welch <martyn.welch@gefanuc.com>
> ---
>=20
>  conf/machine/p2020ds.conf     |   23 +++++++++++++++++++++++
>  recipes/linux/linux.inc       |    1 +
>  recipes/linux/linux_2.6.33.bb |    5 +++++
>  recipes/u-boot/u-boot_git.bb  |    1 +
>  4 files changed, 30 insertions(+), 0 deletions(-)
>=20
> diff --git a/conf/machine/p2020ds.conf b/conf/machine/p2020ds.conf
> new file mode 100644
> index 0000000..48ab353
> --- /dev/null
> +++ b/conf/machine/p2020ds.conf
> @@ -0,0 +1,23 @@
> +#@TYPE: Machine
> +#@Name: P2020ds
> +#@DESCRIPTION: Machine configuration for the freescale p2020ds developme=
nt board
> +
> +TARGET_ARCH =3D "powerpc"
> +
> +PREFERRED_PROVIDER_virtual/kernel ?=3D "linux"
> +
> +MACHINE_FEATURES =3D "kernel26 usbhost pci pcmcia ext2 vfat nfs uboot"

Do you really want pcmcia in there?

> +
> +KERNEL_IMAGETYPE =3D "uImage"
> +UBOOT_ENTRYPOINT =3D "0"
> +
> +UBOOT_MACHINE =3D "P2020DS_config"
> +
> +# Need to create jffs2 images with the correct endianess
> +EXTRA_IMAGECMD_jffs2 =3D " --big-endian -e 0x40000"

A guess, --no-cleanmarkers as well?

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


