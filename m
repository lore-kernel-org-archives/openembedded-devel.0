Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1Nh5V2-0006X5-GJ
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Feb 2010 19:16:51 +0100
Received: (qmail 31756 invoked by uid 1003); 15 Feb 2010 18:14:09 -0000
Received: from localhost (HELO ?192.168.1.182?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 15 Feb 2010 18:14:09 -0000
Message-ID: <4B798EEF.6000503@balister.org>
Date: Mon, 15 Feb 2010 10:14:07 -0800
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.7) Gecko/20100120 Fedora/3.0.1-1.fc11 Thunderbird/3.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1266255767-4031-1-git-send-email-aalonso00@gmail.com>
In-Reply-To: <1266255767-4031-1-git-send-email-aalonso00@gmail.com>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] add xilinx ml507 machine
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
X-List-Received-Date: Mon, 15 Feb 2010 18:16:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Can you make the commit log examples look like this:

http://wiki.openembedded.net/index.php/Commit_log_example

Do you know of any guides that could help me test this on my ml403? I 
would love to test this stuff!

Philip

On 02/15/2010 09:42 AM, Adrian Alonso wrote:
> From: aalonso<aalonso00@gmail.com>
>
> ---
>   conf/machine/include/tune-ppc440.inc |    2 +-
>   conf/machine/xilinx-ml507.conf       |   33 +++++++++++++++++++++++++++++++++
>   2 files changed, 34 insertions(+), 1 deletions(-)
>   create mode 100644 conf/machine/xilinx-ml507.conf
>
> diff --git a/conf/machine/include/tune-ppc440.inc b/conf/machine/include/tune-ppc440.inc
> index feca186..6a56bfa 100644
> --- a/conf/machine/include/tune-ppc440.inc
> +++ b/conf/machine/include/tune-ppc440.inc
> @@ -1,4 +1,4 @@
>   TARGET_CC_ARCH = "-mcpu=440"
>   BASE_PACKAGE_ARCH = "ppc440"
>   FEED_ARCH = "ppc440"
> -PACKAGE_EXTRA_ARCHS += "ppc440e"
> +PACKAGE_EXTRA_ARCHS += "ppc440"
> diff --git a/conf/machine/xilinx-ml507.conf b/conf/machine/xilinx-ml507.conf
> new file mode 100644
> index 0000000..c376cfe
> --- /dev/null
> +++ b/conf/machine/xilinx-ml507.conf
> @@ -0,0 +1,33 @@
> +# Copyright (C) 2010, Adrian Alonso<aalonso00@gmail.com>
> +# Released under the MIT license (see packages/COPYING)
> +#@TYPE: Machine
> +#@Name: Xilinx ML507 FPGA Development Platform
> +#@DESCRIPTION: Machine configuration for Xilinx ML507
> +
> +TARGET_ARCH = "powerpc"
> +TARGET_CPU = "440"
> +TARGET_FPU = "soft"
> +#tune for the 440 cpu
> +require conf/machine/include/tune-ppc440.inc
> +
> +#ASSUME_PROVIDED += "virtual/kernel"
> +PREFERRED_PROVIDER_virtual/kernel = "linux"
> +
> +KERNEL_IMAGETYPE = "uImage"
> +
> +MACHINE_FEATURES = "kernel26 ext2 usbhost udev"
> +MACHINE_EXTRA_RECOMMENDS = "kernel-modules"
> +
> +UBOOT_ARCH = "ppc"
> +UBOOT_MACHINE = "ml507_defconfig"
> +
> +# Xilinx EDK override paramater definitions for xilinx-bsp
> +# Include in your local.conf
> +# XILINX_BSP_PATH = "complete path for Xilinx EDK project"
> +# XILINX_BOARD = "ml507"
> +
> +# Don't use tty1
> +USE_VT = "0"
> +SERIAL_CONSOLE = "115200 ttyS0"
> +
> +


