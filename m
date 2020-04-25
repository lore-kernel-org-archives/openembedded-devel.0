Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
 by mx.groups.io with SMTP id smtpd.web12.5864.1587820205228927112
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Apr 2020 06:10:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PzhjoQ/w;
 spf=pass (domain: gmail.com, ip: 209.85.214.194, mailfrom: andrea.adami@gmail.com)
Received: by mail-pl1-f194.google.com with SMTP id g2so4837053plo.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 25 Apr 2020 06:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TLz2S93KNMpyTTw9xItSsd5bcP7s33bG+5qA5OlZOx4=;
        b=PzhjoQ/woKNyXp0lIh+6dVOqnR5jzm28bDsrRpH9JGbQo+TVW8ZuDGnOMV5U2mLdid
         HzKBOAllSuhDcP6EWHL7b0fMhFY4yvbqHtLUBuLpCdRVojJ4C3ThlkqHpBvfgSE+5PAY
         3uRFvD6nncjMDcNUhyBLZZ5zb2ostuo5MwSTsc1oupHUPGGaRZ6c4eCwoWn6enXF7nk8
         BSsWY7800Nk4oczM51nsuCjxeiYiSoWtFtUWzyBVxpdAHgKICb9IF3GmjblSGLowenyD
         V8oM1oGhDMmNwdheTeF8vCCmgpe1dDlq7ZFr/Qdd8b1RVecCczrsrIivy6xyHQVojS7O
         zS5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TLz2S93KNMpyTTw9xItSsd5bcP7s33bG+5qA5OlZOx4=;
        b=OmfsqleilHl9JlaSn+MrS5CnpuLWErMsIFAiOBk1aTvb9e14LaG+Td2JgnqIyMlfmb
         iTPP/LtltnZZW0LeWImkt85HVPjlYx6V3eOwUoFVY+CGZ6Ldfonqw9A6J+qgB5cqIWDF
         luAYp0de8FXAyC2IlUpBPu0DbrgzCt73FdLohYNPTpIH6QLxyfe0kmcwGWXZPExSto0D
         jDV0yY78R0OKkn+Ru3Lz8jTbQahNA8odoPtHKYGizKK2h3KxRNgSIspobTDx75Kt2fvf
         TLQZRRLYNFlPgFaYxyatKzsOQ4xAzjXRJ8aAjRzKhUAG7/j6NfoB/2m+BbIF0qiA+Z95
         KNgQ==
X-Gm-Message-State: AGi0PubS/9QLLBvtzdeOI8KZo78+5EeS4A76CfxnluaF8/ssIrkDKPyr
	ZWJqlIqfk+8tm46NqDVUqLn8XkKnJLWT1Fbz7tY=
X-Google-Smtp-Source: APiQypKab0BdFp7W2tNC+wdVAuSmt90CWe1G+NEOZTavdHBnv8CfJRmAuay4SIKcM4uQXoW9ZqDPIFpqZsChuL1/IqA=
X-Received: by 2002:a17:90a:290f:: with SMTP id g15mr12418838pjd.93.1587820204674;
 Sat, 25 Apr 2020 06:10:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200423235535.6706-1-andrea.adami@gmail.com> <CAMKF1sqKwNGX8uSV=HqgXQDEHJs3qSZ-5NKQeZaaNHBT-fMeVQ@mail.gmail.com>
In-Reply-To: <CAMKF1sqKwNGX8uSV=HqgXQDEHJs3qSZ-5NKQeZaaNHBT-fMeVQ@mail.gmail.com>
From: "Andrea Adami" <andrea.adami@gmail.com>
Date: Sat, 25 Apr 2020 15:09:53 +0200
Message-ID: <CAAQYJAs8Q7Y9o_03gdj2VFTRZ-QvyOtHPY_HmBMkpOTCzP3NTw@mail.gmail.com>
Subject: Re: [oe] [meta-initramfs][PATCH] meta-initramfs-image: remove klibc utilities
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, Apr 25, 2020 at 12:30 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Thu, Apr 23, 2020 at 4:55 PM Andrea Adami <andrea.adami@gmail.com> wrote:
> >
> > klibc utils have no update-alternatives because these live ideally alone
> > in th einitramfs. This image is not minimal having busybox, linux-utils,
> > coreutils so to resolve the conflict we just remove the shared klibc utils
> > and replace the klibc kexec and vmcore-dmesg.
> >
> > Finally, remove EXCLUDE_FROM_WORLD.
> >
> > Fix:
> > ERROR: meta-initramfs-image-1.0-r0 do_rootfs:
> > Postinstall scriptlets of ['busybox', 'util-linux-umount', 'util-linux-dmesg',
> >  'coreutils', 'util-linux-mount', 'cpio', 'util-linux-kill',
> >  'util-linux-losetup'] have failed.
> >
> > Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> > ---
> >  .../packagegroups/packagegroup-meta-initramfs.bb | 16 ++--------------
> >  1 file changed, 2 insertions(+), 14 deletions(-)
> >
> > diff --git a/meta-initramfs/recipes-core/packagegroups/packagegroup-meta-initramfs.bb b/meta-initramfs/recipes-core/packagegroups/packagegroup-meta-initramfs.bb
> > index bfede5a74..dc4928b5a 100644
> > --- a/meta-initramfs/recipes-core/packagegroups/packagegroup-meta-initramfs.bb
> > +++ b/meta-initramfs/recipes-core/packagegroups/packagegroup-meta-initramfs.bb
> > @@ -15,22 +15,10 @@ RDEPENDS_packagegroup-meta-initramfs = "\
> >  "
> >
> >  RDEPENDS_packagegroup-meta-initramfs-devtools = "\
> > -    libklibc  dracut \
> > -    klibc-utils-cat klibc-utils-losetup klibc-utils-readlink klibc-utils-chroot \
> > -    klibc-utils-ls klibc-utils-reboot klibc-utils-cpio klibc-utils-minips \
> > -    klibc-utils-resume klibc-utils-dd klibc-utils-mkdir klibc-utils-run-init \
> > -    klibc-utils-dmesg klibc-utils-mkfifo klibc-utils-sh.shared klibc-utils-false \
> > -    klibc-utils-mknod klibc-utils-sleep klibc-utils-fstype klibc-utils-mount \
> > -    klibc-utils-sync klibc-utils-halt klibc-utils-mv klibc-utils-true klibc-utils-ipconfig \
> > -    klibc-utils-nfsmount klibc-utils-umount klibc-utils-kill klibc-utils-nuke klibc-utils-uname \
> > -    mtdinfo-klibc ubiattach-klibc ubiblock-klibc ubicrc32-klibc ubidetach-klibc \
> > -    ubiformat-klibc ubimkvol-klibc ubinfo-klibc ubinize-klibc ubirename-klibc \
> > -    ubirmvol-klibc ubirsvol-klibc ubiupdatevol-klibc \
> > +    dracut \
> >      ${@bb.utils.contains_any("TRANSLATED_TARGET_ARCH", "i586 x86-64", "grubby", "", d)} \
> >      "
> >
> >  RDEPENDS_packagegroup-meta-initramfs-kernel = "\
> > -    kexec-klibc vmcore-dmesg-klibc \
> > +    kexec vmcore-dmesg \
>
> this creates a dependency on kexec-tools from oe-core, this however is
> not buildable on some arches e.g. riscv
> so this change does not work as such, I think you can only add it as
> dependency where its supported.
>

Well, the problem was already there, kexec-tools klibc and oe-core both have

COMPATIBLE_HOST =
'(x86_64.*|i.86.*|arm.*|aarch64.*|powerpc.*|mips.*)-(linux|freebsd.*)'


I really have no idea about the image purposes, I see there is dracut
which seems to be buildable for most archs and does not have runtime
deps on kexec-tools.
Maybe we can just remove kexec and vmcore-dmesg

Cheers
Andrea



> >      "
> > -
> > -EXCLUDE_FROM_WORLD = "1"
> > --
> > 2.17.1
> >
> > 
