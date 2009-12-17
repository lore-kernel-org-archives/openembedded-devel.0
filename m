Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1NLNfF-0002bt-Qw
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Dec 2009 22:13:41 +0100
Received: (qmail 28503 invoked by uid 1003); 17 Dec 2009 21:11:48 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 17 Dec 2009 21:11:47 -0000
Message-ID: <4B2A9E92.9060904@balister.org>
Date: Thu, 17 Dec 2009 16:11:46 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.5) Gecko/20091209 Fedora/3.0-3.fc11 Thunderbird/3.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <> <1261080453-12752-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1261080453-12752-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] conf/machine: Add x86_64 machine.
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
X-List-Received-Date: Thu, 17 Dec 2009 21:13:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/17/2009 03:07 PM, Khem Raj wrote:
> * This is not supporting multilib
> * Only 64-bit userspace can be built.
>
> Signed-off-by: Khem Raj<raj.khem@gmail.com>
> ---
>   conf/machine/include/tune-x86_64.inc |    4 ++++
>   conf/machine/x86_64-generic.conf     |   31 +++++++++++++++++++++++++++++++
>   recipes/gcc/gcc-common.inc           |    4 ++++
>   3 files changed, 39 insertions(+), 0 deletions(-)
>   create mode 100644 conf/machine/include/tune-x86_64.inc
>   create mode 100644 conf/machine/x86_64-generic.conf
>
> diff --git a/conf/machine/include/tune-x86_64.inc b/conf/machine/include/tune-x86_64.inc
> new file mode 100644
> index 0000000..db2a560
> --- /dev/null
> +++ b/conf/machine/include/tune-x86_64.inc
> @@ -0,0 +1,4 @@
> +TARGET_CC_ARCH = "-mtune=generic"
> +BASE_PACKAGE_ARCH = "x86_64"
> +FEED_ARCH = "x86_64"
> +PACKAGE_EXTRA_ARCHS += "x86 i386 i486 i586 i686"
> diff --git a/conf/machine/x86_64-generic.conf b/conf/machine/x86_64-generic.conf
> new file mode 100644
> index 0000000..0dad0ff
> --- /dev/null
> +++ b/conf/machine/x86_64-generic.conf


Any chance bitbake will find the underscore confusing in the machine name?

Philip


> @@ -0,0 +1,31 @@
> +# Copyright (C) 2007,2009 Stelios Koroneos - Digital OPSiS, All Rights Reserved
> +# Released under the MIT license (see packages/COPYING)
> +#@TYPE: Machine
> +#@NAME: x86_64-generic
> +#@DESCRIPTION: Machine configuration for a generic x86_64 machine
> +
> +
> +TARGET_ARCH = "x86_64"
> +
> +PREFERRED_PROVIDER_virtual/kernel = "linux"
> +PREFERRED_PROVIDER_virtual/xserver = "xserver-kdrive"
> +XSERVER="xserver-kdrive-vesa"
> +
> +KERNEL_IMAGETYPE = "bzImage"
> +
> +GLIBC_ADDONS = "nptl"
> +GLIBC_EXTRA_OECONF = "--with-tls"
> +
> +IMAGE_FSTYPES ?= "ext2.gz"
> +IMAGE_DEVICE_TABLES = " \
> +  files/device_table-minimal.txt \
> +  files/device_table_add-loop.txt \
> +  files/device_table_add-scsi.txt \
> +"
> +
> +MACHINE_FEATURES = "kernel26 screen keyboard pci usbhost acpi ext2 x86"
> +MACHINE_EXTRA_RRECOMMENDS = " kernel-modules"
> +
> +#tune for x86_64
> +require conf/machine/include/tune-x86_64.inc
> +
> diff --git a/recipes/gcc/gcc-common.inc b/recipes/gcc/gcc-common.inc
> index 6e777e6..772e7a7 100644
> --- a/recipes/gcc/gcc-common.inc
> +++ b/recipes/gcc/gcc-common.inc
> @@ -15,6 +15,10 @@ def get_gcc_fpu_setting(bb, d):
>           return "--with-float=soft"
>       return ""
>
> +EXTRA_OECONF_append_x86_64	= " --disable-multilib"
> +EXTRA_OECONF_append_mips64	= " --disable-multilib"
> +EXTRA_OECONF_append_powerpc64	= " --disable-multilib"
> +
>   # We really need HOST_SYS here for some packages and TARGET_SYS for others.
>   # For now, libgcc is most important so we fix for that - RP.
>   SHLIBSDIR = "${STAGING_DIR_TARGET}/shlibs"


