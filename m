Return-Path: <andrea.adami@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6CEDF60102
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Jan 2019 17:53:58 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id c123so9277878pfb.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Jan 2019 09:53:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ZEyc/eov8fXIP7HK6Mh3Otap6ePOWvjXSRjnxL/fRiA=;
	b=mvhFUbhmAl7Cq51uYVJ9UjQkltSeMUr5+qlclbxPmxSHfrjmb4KUyZudIZOgVpQp3G
	Y+FFRHiQoxFIPZm0aZCWYBinQIfcQNZG0HwXCC8X2ajnU8hjSlu0Xizi0gNnQGYcGXLi
	bJatfZicMoWii6YH+A9cKzn5jNYlkXU51KZdNaR1dldR6m/n6cruj5f7oNtZE7TheUem
	zPF5zYV3YoisJZD+iX5sEzJR3fLmPdTBCX4uoJP/FjaiFEFLSCSDmQMaiaM33t4Zy2n4
	FHii6ELptQtwPplSjhPbelSJbcyEGNBqFkucIVp84iCkGZ9RLeTiBBfgB8KNbbToZNDX
	vcgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZEyc/eov8fXIP7HK6Mh3Otap6ePOWvjXSRjnxL/fRiA=;
	b=MlufZgAFqW1QWNirIRjH4ip4n1AIhEo3/E+u3rz8P0O5mvVq92Mg65dJvdDy6Z3qff
	Ccta5qO7bpdcD/TEDYb6NV9OVrWsDWvenVGmOQALHp9f6S34guVU8xt7lyaQ3kuQKlCu
	2XzGk9UzODtSDEg1a0rXbizazZHyiyytomtjfSWB6xrUOPX5/kueK2uzXotIBizUMBMI
	SDX4ONueYzqmsJFzLqoGnlaAvUCvfvG5/KW9zzYjNrscX/BmylFBW1p2Xd7c0H3LyfBr
	gz8psVCEElL7xySJvXQhOR3qO0hOHpg21JHUv062yOqJvthlEHenzIn1JxZxVciIAp5W
	oyyQ==
X-Gm-Message-State: AJcUukddjpr1L3Skas0tMFBU7ac021h4acQyjP7RHxmmtgc7gn7vkGQ8
	A//59MBAhownllzFjE5gcNjGMeBBGHPSb6nvo9s=
X-Google-Smtp-Source: ALg8bN5HlxbLqjEK19Uiy7p7GfLaKKSDeWJ68nIBBFQs+Xb2HAubwPK/igv4lZZSoJ8tCiqt3+gf9hvzxcphmzMteNw=
X-Received: by 2002:a63:eb0e:: with SMTP id t14mr20578611pgh.445.1547402039221;
	Sun, 13 Jan 2019 09:53:59 -0800 (PST)
MIME-Version: 1.0
References: <20190112213132.2501-1-akuster808@gmail.com>
	<20190112213132.2501-8-akuster808@gmail.com>
In-Reply-To: <20190112213132.2501-8-akuster808@gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Sun, 13 Jan 2019 18:53:48 +0100
Message-ID: <CAAQYJAts5xaLN8NRFx=fBPeiyd-_rRpCq204XGW=mNWrDHNZfw@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 8/9] meta-initramfs: add pkg group and image
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
X-List-Received-Date: Sun, 13 Jan 2019 17:53:58 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Jan 12, 2019 at 10:33 PM Armin Kuster <akuster808@gmail.com> wrote:
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  .../images/meta-initramfs-image.bb            |  8 +++++
>  .../packagegroup-meta-initramfs.bb            | 36 +++++++++++++++++++
>  2 files changed, 44 insertions(+)
>  create mode 100644 meta-initramfs/recipes-core/images/meta-initramfs-image.bb
>  create mode 100644 meta-initramfs/recipes-core/packagegroups/packagegroup-meta-initramfs.bb
>
> diff --git a/meta-initramfs/recipes-core/images/meta-initramfs-image.bb b/meta-initramfs/recipes-core/images/meta-initramfs-image.bb
> new file mode 100644
> index 0000000000..9d70d6d02d
> --- /dev/null
> +++ b/meta-initramfs/recipes-core/images/meta-initramfs-image.bb
> @@ -0,0 +1,8 @@
> +SUMMARY = "meta-initramfs build test image"
> +
> +IMAGE_INSTALL = "packagegroup-core-boot \
> +                 packagegroup-meta-initramfs"
> +
> +LICENSE = "MIT"
> +
> +inherit core-image
> diff --git a/meta-initramfs/recipes-core/packagegroups/packagegroup-meta-initramfs.bb b/meta-initramfs/recipes-core/packagegroups/packagegroup-meta-initramfs.bb
> new file mode 100644
> index 0000000000..bfede5a749
> --- /dev/null
> +++ b/meta-initramfs/recipes-core/packagegroups/packagegroup-meta-initramfs.bb
> @@ -0,0 +1,36 @@
> +SUMMARY = "Meta-initramfs packagegroups"
> +
> +inherit packagegroup
> +
> +PROVIDES = "${PACKAGES}"
> +PACKAGES = ' \
> +    packagegroup-meta-initramfs \
> +    packagegroup-meta-initramfs-devtools \
> +    packagegroup-meta-initramfs-kernel \
> +'
> +
> +RDEPENDS_packagegroup-meta-initramfs = "\
> +    packagegroup-meta-initramfs-devtools \
> +    packagegroup-meta-initramfs-kernel \
> +"
> +
> +RDEPENDS_packagegroup-meta-initramfs-devtools = "\
> +    libklibc  dracut \
> +    klibc-utils-cat klibc-utils-losetup klibc-utils-readlink klibc-utils-chroot \
> +    klibc-utils-ls klibc-utils-reboot klibc-utils-cpio klibc-utils-minips \
> +    klibc-utils-resume klibc-utils-dd klibc-utils-mkdir klibc-utils-run-init \
> +    klibc-utils-dmesg klibc-utils-mkfifo klibc-utils-sh.shared klibc-utils-false \
> +    klibc-utils-mknod klibc-utils-sleep klibc-utils-fstype klibc-utils-mount \
> +    klibc-utils-sync klibc-utils-halt klibc-utils-mv klibc-utils-true klibc-utils-ipconfig \
> +    klibc-utils-nfsmount klibc-utils-umount klibc-utils-kill klibc-utils-nuke klibc-utils-uname \
> +    mtdinfo-klibc ubiattach-klibc ubiblock-klibc ubicrc32-klibc ubidetach-klibc \
> +    ubiformat-klibc ubimkvol-klibc ubinfo-klibc ubinize-klibc ubirename-klibc \
> +    ubirmvol-klibc ubirsvol-klibc ubiupdatevol-klibc \
> +    ${@bb.utils.contains_any("TRANSLATED_TARGET_ARCH", "i586 x86-64", "grubby", "", d)} \
> +    "
> +
> +RDEPENDS_packagegroup-meta-initramfs-kernel = "\
> +    kexec-klibc vmcore-dmesg-klibc \
> +    "
> +
> +EXCLUDE_FROM_WORLD = "1"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



Armin,

nice work, we had something similar once in oe-classic.

About the klibc utilities, I fear there might be some runtime bugs
because there are many uncommitted patches around.
See i.e. the last one of Ben  https://salsa.debian.org/kernel-team/klibc
Let's hope for a new release.

Cheers
Andrea

