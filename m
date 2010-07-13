Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OYYn5-0008IF-6O
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Jul 2010 08:16:28 +0200
Received: by bwz10 with SMTP id 10so3465161bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Jul 2010 23:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=U7aeA+ZtsTJ1msJCxPlaelETGegurbmSImIe7F3PlC8=;
	b=Kz1moq0z5zYaJeyaEHtO/GyIE+kgUU5RhzEZNI1cfzOHaJEaG3oE0wilBvj1HX9o0X
	uK9eKdX0v5Lk+dGC+rpZEyTQYBybGxSDICSM15iyJwz2ZBjsFa7FX7ekgjunJgVW9kG9
	SUYJzEc1fDG/z2zWD/fNwvIYfVE56gzmftfOk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=L6INECNUMLV2FBNIEkNTYOP8o3hdhlGXX2ZSvxCw0DZ8ru61rzKkTKBcTk+2oKn/HX
	xj/j928cnsWUB4F3x3GcMeFvU/qjWnPTCcMxaLLcQt+mZpk/WfFGAsjuX88F12Rivmb3
	Mv6ahLvgPcJI/GcwxM8kTLeQrqEmp61hpIr94=
MIME-Version: 1.0
Received: by 10.204.16.82 with SMTP id n18mr11614294bka.212.1279001491773; 
	Mon, 12 Jul 2010 23:11:31 -0700 (PDT)
Received: by 10.204.66.68 with HTTP; Mon, 12 Jul 2010 23:11:31 -0700 (PDT)
In-Reply-To: <1278963950-2587-2-git-send-email-aalonso00@gmail.com>
References: <1278963950-2587-1-git-send-email-aalonso00@gmail.com>
	<1278963950-2587-2-git-send-email-aalonso00@gmail.com>
Date: Tue, 13 Jul 2010 08:11:31 +0200
Message-ID: <AANLkTinM_d6TL5ixjt_n2A_jApfH6vW9YLIa1BZU1R0u@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH 2/9] xilinx-virtex5: new file
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
X-List-Received-Date: Tue, 13 Jul 2010 06:16:28 -0000
Content-Type: text/plain; charset=ISO-8859-1

Same remarks as on the virtex4 file

2010/7/12 Adrian Alonso <aalonso00@gmail.com>

> * Config machine for virtex5 platforms ml505, ml507, ml510
> * Hardware reference design at
>  http://github.com/aalonso/xilinx-ml507
>
> Signed-off-by: Adrian Alonso <aalonso00@gmail.com>
> ---
>  conf/machine/xilinx-virtex5.conf |   37
> +++++++++++++++++++++++++++++++++++++
>  1 files changed, 37 insertions(+), 0 deletions(-)
>  create mode 100644 conf/machine/xilinx-virtex5.conf
>
> diff --git a/conf/machine/xilinx-virtex5.conf
> b/conf/machine/xilinx-virtex5.conf
> new file mode 100644
> index 0000000..3272f2c
> --- /dev/null
> +++ b/conf/machine/xilinx-virtex5.conf
> @@ -0,0 +1,37 @@
> +# Copyright (C) 2010, Adrian Alonso <aalonso00@gmail.com>
> +# Released under the MIT license (see packages/COPYING)
> +#@TYPE: Machine
> +#@Name: Xilinx ML507 FPGA Development Platform
> +#@DESCRIPTION: Machine configuration for Xilinx ML507
> +
> +TARGET_ARCH ?= "powerpc"
> +TARGET_CPU  ?= "440"
> +TARGET_FPU  ?= "soft"
> +TARGET_TUNE ?= "ppc440"
> +#tune for the 440 cpu
> +require conf/machine/include/tune-${TARGET_TUNE}.inc
> +
> +#ASSUME_PROVIDED += "virtual/kernel"
> +PREFERRED_PROVIDER_virtual/kernel = "linux-xilinx"
> +PREFERRED_VERSION_u-boot_xilinx-virtex5 = "u-boot-xilinx"
> +
> +KERNEL_IMAGETYPE = "uImage"
> +
> +MACHINE_FEATURES = "kernel26 apm ext2 vfat ethernet screen"
> +MACHINE_EXTRA_RECOMMENDS = "kernel-modules"
> +
> +UBOOT_ENTRYPOINT ?= "0x00000000"
> +UBOOT_LOADADDRESS ?= "0x00000000"
> +
> +# Xilinx EDK override hardware  definitions for xilinx-bsp
> +# Include in your local.conf
> +# XILINX_BSP_PATH = "complete path for Xilinx XPS project"
> +# XILINX_BOARD = "ml507"
> +
> +# Don't use tty1
> +# USE_VT = "0"
> +SERIAL_CONSOLE = "9600 ttyS0"
> +
> +# Device nodes add xsa for (system ace)
> +IMAGE_DEVICE_TABLES = "files/device_table-minimal.txt \
> +                       files/device_table_add-xsa.txt"
> --
> 1.7.1.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

