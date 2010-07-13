Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OYYdb-0007oQ-CV
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Jul 2010 08:06:43 +0200
Received: by bwz10 with SMTP id 10so3459028bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Jul 2010 23:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=JKUbuIYnJIxvqnqE/F3zi4WFBZ6dwRhN/Dbd1iDG0Qs=;
	b=dhiOZ2tDa8Xpt7UVcq7oj5keIllTWIv1jN+jBHCThNNNBHmQ6xh7wZnovb7CQ2YQKN
	sLX6HZaZDYFWltuvsq5Zqz8SBWUl0ApYqVQ04uKHlYvasEyfnBsLCjdAAbrbKSz703pl
	VO6k8ALCf31FGMTnzbIFjWR7zqY2lzLJog09c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=ef4Tgm+dadKjIcUJsK4MG6fmpEIPP0ZCpT3QfI2wVrFwTHdb6gSAQQkGx2Lx4nW5LU
	AifX23LBOemjVS+7NCEDANZkBUwGKmUzEgiSRx4dmgXMjsyJxCa/qzjZxP3pbf3v6erZ
	ZYxA3dnsPqERxh5quXSDL41Sj65+3nzKtYzoU=
MIME-Version: 1.0
Received: by 10.204.70.140 with SMTP id d12mr11660984bkj.37.1279000904207; 
	Mon, 12 Jul 2010 23:01:44 -0700 (PDT)
Received: by 10.204.66.68 with HTTP; Mon, 12 Jul 2010 23:01:44 -0700 (PDT)
In-Reply-To: <1278963950-2587-1-git-send-email-aalonso00@gmail.com>
References: <1278963950-2587-1-git-send-email-aalonso00@gmail.com>
Date: Tue, 13 Jul 2010 08:01:44 +0200
Message-ID: <AANLkTilt38IIysypXu4t6DweZkrLBZJB5dSL2_m_cAF4@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/9] xilinx-virtex4: new file
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
X-List-Received-Date: Tue, 13 Jul 2010 06:06:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/7/12 Adrian Alonso <aalonso00@gmail.com>:
> * New config machine, generic support for Xilinx
> =A0Virtex4 platforms ml401, ml403, ml405, ml410
> * Tested on ml405 target board, powerpc based ref
> =A0design at http://github.com/aalonso/xilinx-ml405
> * Target configuration handled in xilinx-bsp.bbclass
>
> Signed-off-by: Adrian Alonso <aalonso00@gmail.com>
> ---
> =A0conf/machine/xilinx-virtex4.conf | =A0 40 ++++++++++++++++++++++++++++=
++++++++++
> =A01 files changed, 40 insertions(+), 0 deletions(-)
> =A0create mode 100644 conf/machine/xilinx-virtex4.conf
>
> diff --git a/conf/machine/xilinx-virtex4.conf b/conf/machine/xilinx-virte=
x4.conf
> new file mode 100644
> index 0000000..942b63f
> --- /dev/null
> +++ b/conf/machine/xilinx-virtex4.conf
> @@ -0,0 +1,40 @@
> +# Copyright (C) 2010, Adrian Alonso <aalonso00@gmail.com>
> +# Released under the MIT license (see packages/COPYING)
> +#@TYPE: Machine
> +#@Name: Xilinx Virtex4 FPGA Development Platform
> +#@DESCRIPTION: Machine configuration for Xilinx Virtex4 family
> +# Supported targets
> +# ML403, ML405, ML410
> +
> +# Default arch can be overrided in local.conf
> +TARGET_ARCH ?=3D "powerpc"

Do we expect to be this machine to be powerpc only or would there be
any chance that someone puts linux on microblaze on it?
If so is this going to be in this file?
If we think microblaze linux on this board will happen and not in this
file perhaps make explicit in the machine name that it is ppc only.
If microblaze on this board is unlikely it is afaik ok as it is.

> +TARGET_CPU =A0?=3D "405"
> +TARGET_FPU =A0?=3D "soft"
> +TARGET_TUNE ?=3D "ppc405"
> +#tune for the selected cpu
> +require conf/machine/include/tune-${TARGET_TUNE}.inc
> +
> +#ASSUME_PROVIDED +=3D "virtual/kernel"

I'd say remove the line above. It is harmless as it is comment but
could lead to confusion.
(or if it is useful for people to have this perhaps have a line or two
of comment)

> +PREFERRED_PROVIDER_virtual/kernel =3D "linux-xilinx"
> +PREFERRED_VERSION_u-boot_xilinx-virtex4 =3D "u-boot-xilinx"
> +
> +KERNEL_IMAGETYPE =3D "uImage"
> +
> +MACHINE_FEATURES =3D "kernel26 apm ext2 vfat ethernet"
> +MACHINE_EXTRA_RECOMMENDS =3D "kernel-modules"
> +
> +UBOOT_ENTRYPOINT ?=3D "0x00000000"
> +UBOOT_LOADADDRESS ?=3D "0x00000000"
> +
> +# Xilinx EDK override hardware =A0definitions for xilinx-bsp
> +# Include in your local.conf
> +# XILINX_BSP_PATH =3D "complete path for Xilinx XPS project"
> +# XILINX_BOARD =3D "ml410"
> +
> +# Don't use tty1
> +USE_VT =3D "0"
> +SERIAL_CONSOLE =3D "9600 ttyS0"
> +
> +# Device nodes add xsa for (system ace)
> +IMAGE_DEVICE_TABLES =3D "files/device_table-minimal.txt \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 files/device_table_add-xsa.=
txt"
> --
> 1.7.1.1


