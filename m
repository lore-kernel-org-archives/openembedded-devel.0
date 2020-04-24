Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web10.1686.1587767447216877369
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Apr 2020 15:30:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fquHGxRa;
 spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id o19so11934784qkk.5
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 Apr 2020 15:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zQc+NzDOqzb3yUB3nlnv8Rq/GgCdyN17/21nf96C4Y4=;
        b=fquHGxRaEZs1PZ8lTvKbVMGlG46W7NhPVH/J2BOYsnnFP3r4ktw0Mlm1iiJnD427mu
         rH3VixnnQcDhv/d4l86S1tq9/WT3OoI+Y2i/JaCsQmEHcOU0R1W5m8bxK3DFpsv9jZdh
         z+PjNMRGwfLeTAafMudVQwWhGIhYdczt50OlnL6xOVfXt82AWbmQmKsmOAQVSZgIzB/8
         26SqCgM7dsB0810ygW3ec+I3BAgGLZMINA+aVB2mRrwQO81JNPMr92XHjgvVB6YJALbm
         PnjtFO4Lxi5uz/8oTGhmCuWtzNYcqY9tcwvrbvSpanYpRu67C87BEXSWXkmfidAJzIrH
         6/Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zQc+NzDOqzb3yUB3nlnv8Rq/GgCdyN17/21nf96C4Y4=;
        b=G/iHGYaRL8XTVZ35lK4lZJRhEssvoE3rUhebePlmOoh7lRs2msHzeilrb9BPWAd01g
         d+QPiqmaHRGPxFxrCnOw7xEhPKGx5VcHa3TEY3B0VVpgQQLni4BHW1EAAYcDW4Ea2deA
         56TFtAQLiSOyuw3+bBqJeCeesn7ZxOHRgHo/Lf6zcsXLK565YL6AaXkaxf9LirtIsley
         VfQCmuO+PwRf46FBVTu7zOSEge6Bg7zAb+pmAbhgA9RA0UlN83+6KStACjKpmiFDBn03
         2hrp+kaFu0usbDa5Mp4cfkSiXZncy8O9d7q/atuaW9yH0BEdhwq0yznqbcB9k9dZhNBJ
         hslQ==
X-Gm-Message-State: AGi0PuYvGjiRlzbUuKccgy/HZUwA+5/kZTX8HXYq2uIMSEQSnGv+qMZA
	9hG3Nkmv0QfRj1kGG24/ng2Csh09DlMu9iG9Rgo=
X-Google-Smtp-Source: APiQypLpDaj/HmzRKp1YF8r/bAU3U9K03jTSRExFxc4LbLu0Ayr18mdAcTGDsBfcwq+xAdYyD3rz3nrplkOF+63uJww=
X-Received: by 2002:a37:8d81:: with SMTP id p123mr10755467qkd.17.1587767446139;
 Fri, 24 Apr 2020 15:30:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200423235535.6706-1-andrea.adami@gmail.com>
In-Reply-To: <20200423235535.6706-1-andrea.adami@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 24 Apr 2020 15:30:18 -0700
Message-ID: <CAMKF1sqKwNGX8uSV=HqgXQDEHJs3qSZ-5NKQeZaaNHBT-fMeVQ@mail.gmail.com>
Subject: Re: [oe] [meta-initramfs][PATCH] meta-initramfs-image: remove klibc utilities
To: Andrea Adami <andrea.adami@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 23, 2020 at 4:55 PM Andrea Adami <andrea.adami@gmail.com> wrote:
>
> klibc utils have no update-alternatives because these live ideally alone
> in th einitramfs. This image is not minimal having busybox, linux-utils,
> coreutils so to resolve the conflict we just remove the shared klibc utils
> and replace the klibc kexec and vmcore-dmesg.
>
> Finally, remove EXCLUDE_FROM_WORLD.
>
> Fix:
> ERROR: meta-initramfs-image-1.0-r0 do_rootfs:
> Postinstall scriptlets of ['busybox', 'util-linux-umount', 'util-linux-dmesg',
>  'coreutils', 'util-linux-mount', 'cpio', 'util-linux-kill',
>  'util-linux-losetup'] have failed.
>
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  .../packagegroups/packagegroup-meta-initramfs.bb | 16 ++--------------
>  1 file changed, 2 insertions(+), 14 deletions(-)
>
> diff --git a/meta-initramfs/recipes-core/packagegroups/packagegroup-meta-initramfs.bb b/meta-initramfs/recipes-core/packagegroups/packagegroup-meta-initramfs.bb
> index bfede5a74..dc4928b5a 100644
> --- a/meta-initramfs/recipes-core/packagegroups/packagegroup-meta-initramfs.bb
> +++ b/meta-initramfs/recipes-core/packagegroups/packagegroup-meta-initramfs.bb
> @@ -15,22 +15,10 @@ RDEPENDS_packagegroup-meta-initramfs = "\
>  "
>
>  RDEPENDS_packagegroup-meta-initramfs-devtools = "\
> -    libklibc  dracut \
> -    klibc-utils-cat klibc-utils-losetup klibc-utils-readlink klibc-utils-chroot \
> -    klibc-utils-ls klibc-utils-reboot klibc-utils-cpio klibc-utils-minips \
> -    klibc-utils-resume klibc-utils-dd klibc-utils-mkdir klibc-utils-run-init \
> -    klibc-utils-dmesg klibc-utils-mkfifo klibc-utils-sh.shared klibc-utils-false \
> -    klibc-utils-mknod klibc-utils-sleep klibc-utils-fstype klibc-utils-mount \
> -    klibc-utils-sync klibc-utils-halt klibc-utils-mv klibc-utils-true klibc-utils-ipconfig \
> -    klibc-utils-nfsmount klibc-utils-umount klibc-utils-kill klibc-utils-nuke klibc-utils-uname \
> -    mtdinfo-klibc ubiattach-klibc ubiblock-klibc ubicrc32-klibc ubidetach-klibc \
> -    ubiformat-klibc ubimkvol-klibc ubinfo-klibc ubinize-klibc ubirename-klibc \
> -    ubirmvol-klibc ubirsvol-klibc ubiupdatevol-klibc \
> +    dracut \
>      ${@bb.utils.contains_any("TRANSLATED_TARGET_ARCH", "i586 x86-64", "grubby", "", d)} \
>      "
>
>  RDEPENDS_packagegroup-meta-initramfs-kernel = "\
> -    kexec-klibc vmcore-dmesg-klibc \
> +    kexec vmcore-dmesg \

this creates a dependency on kexec-tools from oe-core, this however is
not buildable on some arches e.g. riscv
so this change does not work as such, I think you can only add it as
dependency where its supported.

>      "
> -
> -EXCLUDE_FROM_WORLD = "1"
> --
> 2.17.1
>
> 
