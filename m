Return-Path: <andrea.adami@gmail.com>
Received: from mail-vk0-f47.google.com (mail-vk0-f47.google.com
	[209.85.213.47])
	by mail.openembedded.org (Postfix) with ESMTP id A0D6B77140
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Feb 2016 22:50:24 +0000 (UTC)
Received: by mail-vk0-f47.google.com with SMTP id k196so119477532vka.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Feb 2016 14:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=Di3dA7SgmhhttzmDG4xL5l3q8I2sV5zguc3kiRVPMKw=;
	b=VEgLP5c0v5mF+b0N2N99M0pv2PB4zlqtKIqmrHiWoxhQhaInc3scs4Yg+gNZkjY+vx
	Wf7ZkbZcs8POGPNr5Wc38siv8ez5iCmHSEns0jSsadG14Nr5VS4qEMZGVontXBSmf7RM
	d7DRhHiSBL6y5FQSQN6oQqr7u87Zf/lzf79I2HnjgpJAoLvs0ZbRuaBM0zehaePBm6w4
	saAkBIA5y52gGK0S7aeD1SCNbFcfwf71swkNbg9gdB561JYEyJktE7CqvVkSAiDsNcV8
	aD8he0gYHHbmZVA56ifItVOINdDpzrLjG3Nzl5IOqGc/4ZozeDwJrsgMkvQeuVhSPkH/
	2x4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=Di3dA7SgmhhttzmDG4xL5l3q8I2sV5zguc3kiRVPMKw=;
	b=DbAcBc/SVCFPYBgr6NxIuX+8zQwP2j6DY8/Ycwsg942Y+w3y1L7ri79mTiLienHC8T
	h8HL14yVQPINj2w2/AL6PEIDeVAJKWP21kD1AEux726MBjDov/72thlrxCPKBrdCWRKT
	yYKcey+drijJaU6siqwBZhuYpUJ2e/P7AtK3DiZv3i+RESt3/T2gTsvntDCGfrWkTpaP
	cVtA6FMXrK4fx8qyVE488aHtINs0eVVdmwPYuSdtF4nq52+vtIxWmwCAIfrvkWteRyQU
	M1e4uMaMoZSOn2fbPo5M/+FJ+/gX7wflfcO3q/or2i1y8PihMDUBU3iRavLBfQ4KTsjO
	1ICA==
X-Gm-Message-State: AD7BkJIZWkDttsDNq+YCyz8NZka/LOe9GhzdM6er0dt6aFi42g+I/9rIlSDfjSeoEjd3dtN2fAeRKy7Niw1IAA==
MIME-Version: 1.0
X-Received: by 10.31.47.88 with SMTP id v85mr9251594vkv.118.1456699824701;
	Sun, 28 Feb 2016 14:50:24 -0800 (PST)
Received: by 10.176.1.7 with HTTP; Sun, 28 Feb 2016 14:50:24 -0800 (PST)
In-Reply-To: <1456699351-9561-1-git-send-email-andrea.adami@gmail.com>
References: <1456699351-9561-1-git-send-email-andrea.adami@gmail.com>
Date: Sun, 28 Feb 2016 23:50:24 +0100
Message-ID: <CAAQYJAu45YD_eVi1x1VOLO663KZXw_wda3VWnobfs3AW0ucaEQ@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-initramfs][PATCH] linux-yocto-tiny-kexecboot: revert Yocto specific console check
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 28 Feb 2016 22:50:24 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Feb 28, 2016 at 11:42 PM, Andrea Adami <andrea.adami@gmail.com> wrote:
> Revert Yocto-specific : "check console device file on fs when booting".
> Fix kernel panic at boot because of the missing /dev/console.
>
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  .../revert-check-console.patch                     | 47 ++++++++++++++++++++++
>  .../linux/linux-yocto-tiny-kexecboot_4.4.bb        |  2 +
>  2 files changed, 49 insertions(+)
>  create mode 100644 meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot/revert-check-console.patch
>
> diff --git a/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot/revert-check-console.patch b/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot/revert-check-console.patch
> new file mode 100644
> index 0000000..5e5e8d9
> --- /dev/null
> +++ b/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot/revert-check-console.patch
> @@ -0,0 +1,47 @@
> +From a74e0bf51adcc867b73fc44050eb9bde985c9cba Mon Sep 17 00:00:00 2001
> +From: Andrea Adami <andrea.adami@gmail.com>
> +Date: Sun, 28 Feb 2016 01:09:19 +0100
> +Subject: [PATCH] main.c: revert check on console device
> +
> +Fix kernel panic because of the missing /dev/console.
> +
> +Revert Yocto-specific : "check console device file on fs when booting".
> +
> +The initramfs used in this kernel needs to be of the smallest possible
> +size so we save a few kb by deploying an empty /dev which is populated
> +after boot by the init (kexecboot checks and recreates the devices
> +with or without devtmpfs).
> +
> +Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> +---
> + init/main.c | 7 -------
> + 1 file changed, 7 deletions(-)
> +
> +diff --git a/init/main.c b/init/main.c
> +index d191d2a..9e64d70 100644
> +--- a/init/main.c
> ++++ b/init/main.c
> +@@ -976,7 +976,6 @@ static int __ref kernel_init(void *unused)
> +
> + static noinline void __init kernel_init_freeable(void)
> + {
> +-      struct stat console_stat;
> +       /*
> +        * Wait until kthreadd is all set-up.
> +        */
> +@@ -1008,12 +1007,6 @@ static noinline void __init kernel_init_freeable(void)
> +
> +       do_basic_setup();
> +
> +-      /* Use /dev/console to infer if the rootfs is setup properly */
> +-      if (sys_newlstat((char __user *) "/dev/console", (struct stat __user *) &console_stat)
> +-                      || !S_ISCHR(console_stat.st_mode)) {
> +-              panic("/dev/console is missing or not a character device!\nPlease ensure your rootfs is properly configured\n");
> +-      }
> +-
> +       /* Open the /dev/console on the rootfs, this should never fail */
> +       if (sys_open((const char __user *) "/dev/console", O_RDWR, 0) < 0)
> +               pr_err("Warning: unable to open an initial console.\n");
> +--
> +1.9.1
> +
> diff --git a/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_4.4.bb b/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_4.4.bb
> index e6c6d9d..e3c7144 100644
> --- a/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_4.4.bb
> +++ b/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_4.4.bb
> @@ -1,6 +1,8 @@
>  require recipes-kernel/linux/linux-yocto-tiny_${PV}.bb
>  SUMMARY = "Yocto tiny kernel embedding a minimalistic kexecboot initramfs"
>
> +SRC_URI += "file://revert-check-on-console-device.patch"
> +
>  PACKAGES = ""
>  PROVIDES = ""
>
> --
> 1.9.1
>

Please ignore this one. Missing rename...sob
V2 following

Sorry
Andrea

