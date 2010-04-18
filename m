Received: from li19-45.members.linode.com ([64.22.125.45] helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koansoftware@gmail.com>) id 1O3PmH-0005Tn-QV
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Apr 2010 10:22:55 +0200
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id C480E1DB9A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Apr 2010 08:18:13 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zT4psfpsGLbI
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Apr 2010 08:18:09 +0000 (UTC)
Received: from [10.1.10.2] (host61-87-static.14-79-b.business.telecomitalia.it
	[79.14.87.61]) by wiki.koala.it (Postfix) with ESMTPSA id 462872C7DE
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Apr 2010 08:18:09 +0000 (UTC)
Message-ID: <4BCAC09E.2040801@gmail.com>
Date: Sun, 18 Apr 2010 10:19:42 +0200
From: Marco Cavallini <koansoftware@gmail.com>
Organization: KOAN sas - Bergamo - Italia
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <alpine.LNX.2.00.1004161842100.28729@asterix.crazy-teaparty.dyndns.org>
	<alpine.DEB.1.10.1004161850310.13187@vitus.devnet.local>
In-Reply-To: <alpine.DEB.1.10.1004161850310.13187@vitus.devnet.local>
X-SA-Exim-Connect-IP: 64.22.125.45
X-SA-Exim-Mail-From: koansoftware@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=AWL,BAYES_00,SPF_NEUTRAL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/5] tb5200l: add machine configuration for TQ TB5200L 'tinyBox'
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
X-List-Received-Date: Sun, 18 Apr 2010 08:22:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Vitus Jensen ha scritto, Il 16/04/2010 18:51:
> [PATCH 1/5] tb5200l: add machine configuration for TQ TB5200L 'tinyBox'
>=20
> Signed-off-by: Vitus Jensen <vjensen@gmx.de>
> ---
>  conf/machine/tb5200l.conf |   28 ++++++++++++++++++++++++++++
>  1 files changed, 28 insertions(+), 0 deletions(-)
>  create mode 100644 conf/machine/tb5200l.conf
>=20
> diff --git a/conf/machine/tb5200l.conf b/conf/machine/tb5200l.conf
> new file mode 100644
> index 0000000..5601397
> --- /dev/null
> +++ b/conf/machine/tb5200l.conf
> @@ -0,0 +1,28 @@
> +#@TYPE: Machine
> +#@NAME: TQ Components' Tiny Box TB5200L
> +#@DESCRIPTION: Mini industrial control
> +
> +TARGET_ARCH =3D "powerpc"
> +PACKAGE_EXTRA_ARCHS =3D "ppc"
> +
> +MACHINE_FEATURES                =3D "kernel26 usbhost ext2"
> +MACHINE_TASK_PROVIDER           =3D "task-base"
> +MACHINE_EXTRA_RRECOMMENDS       =3D "u-boot-utils iproute2 canutils"
> +
> +USE_DEVFS =3D "0"
> +
> +PREFERRED_PROVIDER_virtual/kernel =3D "linux"
> +PREFERRED_VERSION_linux =3D "2.6.32"
> +PREFERRED_VERSION_linux-libc-headers =3D "2.6.32"
> +
> +# don't try to access tty1 (used for application code)
> +USE_VT =3D "0"
> +
> +SERIAL_CONSOLE =3D "115200 ttyPSC0"
> +KERNEL_DEVICETREE_tb5200l =3D "arch/${ARCH}/boot/dts/tqm5200.dts"
> +EXTRA_IMAGECMD_jffs2 =3D "--big-endian -e 0x20000"
> +
> +# TB5200L carries kernel in separate flash partition
> +ROOTFS_POSTPROCESS_COMMAND +=3D "rm -f ${IMAGE_ROOTFS}/boot/*Image*"
> +
> +require conf/machine/include/tune-ppc603e.inc


Acked-by: Marco Cavallini <m.cavallini@koansoftware.com>


Cordiali Saluti / Kindest Regards / mit freundlichen Gr=C3=BCssen
--
Marco Cavallini | KOAN sas | Bergamo - Italia
 embedded and real-time software engineering
   Atmel third party certified consultant
Phone:+39-035-255.235 - Fax:+39-178-22.39.748
      http://www.KoanSoftware.com
        http://www.KaeilOS.com



