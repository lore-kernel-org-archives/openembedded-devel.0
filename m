Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OYwBn-0003ob-4B
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Jul 2010 09:15:33 +0200
Received: by mail-bw0-f47.google.com with SMTP id 10so4402013bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Jul 2010 00:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=AjrjulK4IvBKXyW8wMN2Nu3jPqZA+2ogpW06WGyM6Vk=;
	b=rC0b+ci4H9ow1WaHNWbfIIgWT1rWtLZGseaNNF/8SQgcVkuzUp4zHwwx3IEbsmJMtz
	S6xliu2CmlguTRrNw4Bi1uHgP78qF3iuvhvXVcArSGE3mlaQyz+9gYrr0CzpPDr394aS
	6iVZ1Bi17fflViP62OEBYx6Jxxf+2shKQHQwE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=KHuitxNrEMn1cJu4kxwsuOhKgDkGeq5PzsZGLEf0hiO0VTALUJIS7etVtsUpOA5JW7
	6fn5P8tdpQ/CX/QAqOrP6UGa8jbmZAQLu8MUWA/F+08TWemXNHpSwQl/EdJUps+ieIBl
	4QYmE3cad14+0o1hB1W+i7ri0lrkjyhn/bk5A=
MIME-Version: 1.0
Received: by 10.204.9.146 with SMTP id l18mr13062655bkl.16.1279091728745; Wed, 
	14 Jul 2010 00:15:28 -0700 (PDT)
Received: by 10.204.66.68 with HTTP; Wed, 14 Jul 2010 00:15:28 -0700 (PDT)
In-Reply-To: <1279060140-17856-2-git-send-email-aalonso00@gmail.com>
References: <1279060140-17856-1-git-send-email-aalonso00@gmail.com>
	<1279060140-17856-2-git-send-email-aalonso00@gmail.com>
Date: Wed, 14 Jul 2010 09:15:28 +0200
Message-ID: <AANLkTik9QcxpXjJfy6TfH5cQc5SlRQCDIjT8rcrxoCIu@mail.gmail.com>
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
Subject: Re: [PATCH 2/3 v2] xilinx-virtex5: new file
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
X-List-Received-Date: Wed, 14 Jul 2010 07:15:33 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/7/14 Adrian Alonso <aalonso00@gmail.com>

> * Config machine for virtex5 platforms ml505, ml507, ml510
> * Hardware reference design at
>  http://github.com/aalonso/xilinx-ml507
>
> Signed-off-by: Adrian Alonso <aalonso00@gmail.com>
> ---
>  conf/machine/xilinx-virtex5.conf |   36
> ++++++++++++++++++++++++++++++++++++
>  1 files changed, 36 insertions(+), 0 deletions(-)
>  create mode 100644 conf/machine/xilinx-virtex5.conf
>
> diff --git a/conf/machine/xilinx-virtex5.conf
> b/conf/machine/xilinx-virtex5.conf
> new file mode 100644
> index 0000000..2e11b96
> --- /dev/null
> +++ b/conf/machine/xilinx-virtex5.conf
> @@ -0,0 +1,36 @@
> +# Copyright (C) 2010, Adrian Alonso <aalonso00@gmail.com>
> +# Released under the MIT license (see packages/COPYING)
> +#@TYPE: Machine
> +#@Name: Xilinx Virtex5 FPGA Development Platforms
> +#@DESCRIPTION: Machine configuration for Xilinx Virtex5 boards
> +# Supported boards ML506, ML507, ML510
> +
> +TARGET_ARCH = "powerpc"
> +TARGET_CPU  = "440"
> +TARGET_FPU  = "soft"
> +#tune for the 440 cpu
> +require conf/machine/include/tune-ppc440.inc
> +
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
>

as previous file

> --
> 1.7.1.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

