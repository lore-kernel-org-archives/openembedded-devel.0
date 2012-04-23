Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SMIvx-0000Ex-4U
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Apr 2012 15:04:01 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 23 Apr 2012 05:54:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="157067425"
Received: from unknown (HELO helios.localnet) ([10.252.120.11])
	by fmsmga002.fm.intel.com with ESMTP; 23 Apr 2012 05:54:26 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Andrea Adami <andrea.adami@gmail.com>
Date: Mon, 23 Apr 2012 13:54:25 +0100
Message-ID: <1608452.7uT0aEl2Cb@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.2 (Linux/3.0.0-17-generic-pae; KDE/4.8.2; i686; ; )
In-Reply-To: <1334964879-24189-1-git-send-email-andrea.adami@gmail.com>
References: <1334964879-24189-1-git-send-email-andrea.adami@gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-handheld][PATCH] linux-kexecboot_3.2: set console to tty1 to hide cursor
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
X-List-Received-Date: Mon, 23 Apr 2012 13:04:01 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday 21 April 2012 01:34:39 Andrea Adami wrote:
> * revert accidental change
> 
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  recipes-kernel/linux/linux-kexecboot_3.2.bbappend |   12 ++++++------
>  1 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/recipes-kernel/linux/linux-kexecboot_3.2.bbappend
> b/recipes-kernel/linux/linux-kexecboot_3.2.bbappend index b3f98b1..909bf9e
> 100644
> --- a/recipes-kernel/linux/linux-kexecboot_3.2.bbappend
> +++ b/recipes-kernel/linux/linux-kexecboot_3.2.bbappend
> @@ -7,12 +7,12 @@ PR = "${INC_PR}.1"
>  COMPATIBLE_MACHINE = "(akita|c7x0|collie|poodle|tosa|spitz)"
> 
>  # Note we set loglevel=3 and master console on serial to protect bootlogo.
> -CMDLINE_c7x0 = "console=tty0 console=ttyS0,115200n8"
> -CMDLINE_tosa = "console=tty0 console=ttyS0,115200n8"
> -CMDLINE_poodle = "console=tty0 console=ttyS0,115200n8 fbcon=rotate:1"
> -CMDLINE_akita = "console=tty0 console=ttyS0,115200n8 fbcon=rotate:1"
> -CMDLINE_collie = "console=tty0 console=ttySA0,115200n8 fbcon=rotate:1
> mem=64M" -CMDLINE_spitz = "console=tty0 console=ttyS0,115200n8
> fbcon=rotate:1" +CMDLINE_c7x0 = "console=tty1 console=ttyS0,115200n8"
> +CMDLINE_tosa = "console=tty1 console=ttyS0,115200n8"
> +CMDLINE_poodle = "console=tty1 console=ttyS0,115200n8 fbcon=rotate:1"
> +CMDLINE_akita = "console=tty1 console=ttyS0,115200n8 fbcon=rotate:1"
> +CMDLINE_collie = "console=tty1 console=ttySA0,115200n8 fbcon=rotate:1
> mem=64M" +CMDLINE_spitz = "console=tty1 console=ttyS0,115200n8
> fbcon=rotate:1"
> 
>  # Zaurus machines need kernel size-check.
>  KERNEL_IMAGE_MAXSIZE_akita = "1294336"

Merged to meta-handheld master, thanks!

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


