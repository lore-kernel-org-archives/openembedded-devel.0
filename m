Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OYwBM-0003ob-4x
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Jul 2010 09:15:05 +0200
Received: by bwz10 with SMTP id 10so4402013bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Jul 2010 00:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=gefwiAlfygOHunZlxrxZ5+fT4S41zOzDgp+lPBKyW+g=;
	b=wmRSNIhGYO4ZLKEOb2PobKG+1/yXxmZh6WDErr/XjSqs/dqOMQOhpgegnELMYMvafV
	pS93lf2y90thbdi0bUbz9yZB71DV7DHz9a41MYTQ4eiBgyQvSM0B9hNeJibkc3AVixxV
	+TJW632zmT1VqIRP4GVd/i2y9SRluedpsfXl0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=kYVTHwuw/1U7qIDXSI5BpaVC1glBMFIexiqztJiT8W34UhapgpLEfai989/d08X+XY
	+nWbIY3ielcWOeXaj7uJGOBFArDzVQf6AMj9X/35okNHLVLVHaghuPDr7dsHJutAIZ/W
	9J8jP2G/fgckN0TPE96ZRkrSkF+/Xd221Auzk=
MIME-Version: 1.0
Received: by 10.204.46.129 with SMTP id j1mr7302211bkf.144.1279091702230; Wed, 
	14 Jul 2010 00:15:02 -0700 (PDT)
Received: by 10.204.66.68 with HTTP; Wed, 14 Jul 2010 00:15:02 -0700 (PDT)
In-Reply-To: <1279060140-17856-1-git-send-email-aalonso00@gmail.com>
References: <1279060140-17856-1-git-send-email-aalonso00@gmail.com>
Date: Wed, 14 Jul 2010 09:15:02 +0200
Message-ID: <AANLkTikVmldXgiiXObLbE5sPWAvFsfEqCuQZZzzmazBw@mail.gmail.com>
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
Subject: Re: [PATCH 1/3 v2] xilinx-virtex4: new file
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
X-List-Received-Date: Wed, 14 Jul 2010 07:15:05 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/7/14 Adrian Alonso <aalonso00@gmail.com>

> * New config machine, generic support for Xilinx
>  Virtex4 platforms ml401, ml403, ml405, ml410
> * Tested on ml405 target board, powerpc based ref
>  design at http://github.com/aalonso/xilinx-ml405
> * Target configuration handled in xilinx-bsp.bbclass
>
> Signed-off-by: Adrian Alonso <aalonso00@gmail.com>
> ---
>  conf/machine/xilinx-virtex4.conf |   37
> +++++++++++++++++++++++++++++++++++++
>  1 files changed, 37 insertions(+), 0 deletions(-)
>  create mode 100644 conf/machine/xilinx-virtex4.conf
>
> diff --git a/conf/machine/xilinx-virtex4.conf
> b/conf/machine/xilinx-virtex4.conf
> new file mode 100644
> index 0000000..eeea44e
> --- /dev/null
> +++ b/conf/machine/xilinx-virtex4.conf
> @@ -0,0 +1,37 @@
> +# Copyright (C) 2010, Adrian Alonso <aalonso00@gmail.com>
> +# Released under the MIT license (see packages/COPYING)
> +#@TYPE: Machine
> +#@Name: Xilinx Virtex4 FPGA Development Platform
> +#@DESCRIPTION: Machine configuration for Xilinx Virtex4 family
> +# Supported targets
> +# ML403, ML405, ML410
> +
> +TARGET_ARCH = "powerpc"
> +TARGET_CPU  = "405"
> +TARGET_FPU  = "soft"
> +#tune for the selected cpu
> +require conf/machine/include/tune-ppc405.inc
> +
> +PREFERRED_PROVIDER_virtual/kernel = "linux-xilinx"
> +PREFERRED_VERSION_u-boot_xilinx-virtex4 = "u-boot-xilinx"
> +
> +KERNEL_IMAGETYPE = "uImage"
> +
> +MACHINE_FEATURES = "kernel26 apm ext2 vfat ethernet"
> +MACHINE_EXTRA_RECOMMENDS = "kernel-modules"
> +
> +UBOOT_ENTRYPOINT ?= "0x00000000"
> +UBOOT_LOADADDRESS ?= "0x00000000"
> +
> +# Xilinx EDK override hardware definitions for xilinx-bsp
> +# Include in your local.conf
> +# XILINX_BSP_PATH = "complete path for Xilinx XPS project"
> +# XILINX_BOARD = "ml410"
> +
> +# Don't use tty1
> +USE_VT = "0"
> +SERIAL_CONSOLE = "9600 ttyS0"
> +
> +# Device nodes add xsa for (system ace)
> +IMAGE_DEVICE_TABLES = "files/device_table-minimal.txt \
> +                       files/device_table_add-xsa.txt"
>

I think these are normally not put in machine files.
(at least I normally put them in my image recipe's not in the machine file).

--
> 1.7.1.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

