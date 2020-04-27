Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
 by mx.groups.io with SMTP id smtpd.web10.175.1588020030186007195
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Apr 2020 13:40:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=A/O7aThz;
 spf=pass (domain: gmail.com, ip: 209.85.214.193, mailfrom: andrea.adami@gmail.com)
Received: by mail-pl1-f193.google.com with SMTP id h11so7415251plr.11
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Apr 2020 13:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MLoYlvci/bgHQveQkF1Aw6rkkVJvAKY4i2eXmBTHD7I=;
        b=A/O7aThz27CnX8T4/oCBctZDXNTm6N7cFxbDYz9Mq5dR+Ja4ABL4jcHb7zhG5mKTea
         87O8eXU0MFAVi0hjKkmEWXIHqj8CwuLh/36BowaMMcoBbTKKeOmbfUjfbaDth/NDMpeQ
         LjjZbsvkBbdtDBneHovIbS+xUJuBf4UZK/tgutP/AwSM1GOMqa4y/nJkv0zceVJYieI+
         50kMPQ7+e9oKPtLbtUu7i1bGssuiE4MMQ3yWO13kWkYGqqV4KGuwLxZ7jMxJoHAFRAsg
         /4EioXN8Q7JCCHNUia0vnaMxM2Qead6uAKQogH+8tyDI3C+Vfd6I/H1NBvWKek92Sigp
         vH6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MLoYlvci/bgHQveQkF1Aw6rkkVJvAKY4i2eXmBTHD7I=;
        b=WP4O9GWALFeeowsNTEm+MQKVk8czEUR0yJpF+2M7f6DLtVfzfQcNveo3AJM3KZsvSJ
         3siHdMrPKosBpuHyuWYTDkcauMEv3ICCX/jbH25haNtDpu/kNVzhtMLBxi///hYBSa5L
         0J6RMH3sL3M3ERFfLOD0A2IBMN1VvvVgMufsIyqqJ9VRM19RtHZ8rskbuspPZXyLIMli
         s6ncbLXFtOoar/CaG1gggyPbhB2x1JbC2g4SvcEQhAO+ilcfIaXT3XQmvWmBK4mTlWSZ
         SEe8Qk4TOTXYHQyCclpNFhK0Q+jtwvi/JZwWZZQzZnZRjwcEinR9XcAGQHjZ2E6Lrlin
         WbHQ==
X-Gm-Message-State: AGi0PubQI5wBFEfcXkKus1bHpyPT1rr9QYqeGXVUIx7rY4/yPrA4WTrm
	W9RBgu0GNs8UWBjZjd8xYMzVEu66B8vvpc0Oepg=
X-Google-Smtp-Source: APiQypK8zrFsnpdCAA20Go3wHwoIdCnQ11rdUt5Zt9RGOEHxHTn/1lso5I5cADGL/HsiYvfbf9f3xhtytMbkcK56zsM=
X-Received: by 2002:a17:90a:64cc:: with SMTP id i12mr571430pjm.65.1588020029450;
 Mon, 27 Apr 2020 13:40:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200423235535.6706-1-andrea.adami@gmail.com> <CAMKF1sqKwNGX8uSV=HqgXQDEHJs3qSZ-5NKQeZaaNHBT-fMeVQ@mail.gmail.com>
 <CAAQYJAs8Q7Y9o_03gdj2VFTRZ-QvyOtHPY_HmBMkpOTCzP3NTw@mail.gmail.com> <CAMKF1soQ4Sy-XR4uhq0CD2Jvwv8tAGru6pX75-jZ6zGucMTnXw@mail.gmail.com>
In-Reply-To: <CAMKF1soQ4Sy-XR4uhq0CD2Jvwv8tAGru6pX75-jZ6zGucMTnXw@mail.gmail.com>
From: "Andrea Adami" <andrea.adami@gmail.com>
Date: Mon, 27 Apr 2020 22:40:18 +0200
Message-ID: <CAAQYJAuja6O_O879-trkyDX0Ms4aaE8NwCYikKf+_Gt3G8uiNQ@mail.gmail.com>
Subject: Re: [oe] [meta-initramfs][PATCH] meta-initramfs-image: remove klibc utilities
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Khem,
please disregard this patch as superseded, a new one specific for the
packagegroup is coming.

Thanks!
Andres

On Sat, Apr 25, 2020 at 5:28 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Sat, Apr 25, 2020 at 6:10 AM Andrea Adami <andrea.adami@gmail.com> wrote:
> >
> > On Sat, Apr 25, 2020 at 12:30 AM Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > On Thu, Apr 23, 2020 at 4:55 PM Andrea Adami <andrea.adami@gmail.com> wrote:
> > > >
> > > > klibc utils have no update-alternatives because these live ideally alone
> > > > in th einitramfs. This image is not minimal having busybox, linux-utils,
> > > > coreutils so to resolve the conflict we just remove the shared klibc utils
> > > > and replace the klibc kexec and vmcore-dmesg.
> > > >
> > > > Finally, remove EXCLUDE_FROM_WORLD.
> > > >
> > > > Fix:
> > > > ERROR: meta-initramfs-image-1.0-r0 do_rootfs:
> > > > Postinstall scriptlets of ['busybox', 'util-linux-umount', 'util-linux-dmesg',
> > > >  'coreutils', 'util-linux-mount', 'cpio', 'util-linux-kill',
> > > >  'util-linux-losetup'] have failed.
> > > >
> > > > Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> > > > ---
> > > >  .../packagegroups/packagegroup-meta-initramfs.bb | 16 ++--------------
> > > >  1 file changed, 2 insertions(+), 14 deletions(-)
> > > >
> > > > diff --git a/meta-initramfs/recipes-core/packagegroups/packagegroup-meta-initramfs.bb b/meta-initramfs/recipes-core/packagegroups/packagegroup-meta-initramfs.bb
> > > > index bfede5a74..dc4928b5a 100644
> > > > --- a/meta-initramfs/recipes-core/packagegroups/packagegroup-meta-initramfs.bb
> > > > +++ b/meta-initramfs/recipes-core/packagegroups/packagegroup-meta-initramfs.bb
> > > > @@ -15,22 +15,10 @@ RDEPENDS_packagegroup-meta-initramfs = "\
> > > >  "
> > > >
> > > >  RDEPENDS_packagegroup-meta-initramfs-devtools = "\
> > > > -    libklibc  dracut \
> > > > -    klibc-utils-cat klibc-utils-losetup klibc-utils-readlink klibc-utils-chroot \
> > > > -    klibc-utils-ls klibc-utils-reboot klibc-utils-cpio klibc-utils-minips \
> > > > -    klibc-utils-resume klibc-utils-dd klibc-utils-mkdir klibc-utils-run-init \
> > > > -    klibc-utils-dmesg klibc-utils-mkfifo klibc-utils-sh.shared klibc-utils-false \
> > > > -    klibc-utils-mknod klibc-utils-sleep klibc-utils-fstype klibc-utils-mount \
> > > > -    klibc-utils-sync klibc-utils-halt klibc-utils-mv klibc-utils-true klibc-utils-ipconfig \
> > > > -    klibc-utils-nfsmount klibc-utils-umount klibc-utils-kill klibc-utils-nuke klibc-utils-uname \
> > > > -    mtdinfo-klibc ubiattach-klibc ubiblock-klibc ubicrc32-klibc ubidetach-klibc \
> > > > -    ubiformat-klibc ubimkvol-klibc ubinfo-klibc ubinize-klibc ubirename-klibc \
> > > > -    ubirmvol-klibc ubirsvol-klibc ubiupdatevol-klibc \
> > > > +    dracut \
> > > >      ${@bb.utils.contains_any("TRANSLATED_TARGET_ARCH", "i586 x86-64", "grubby", "", d)} \
> > > >      "
> > > >
> > > >  RDEPENDS_packagegroup-meta-initramfs-kernel = "\
> > > > -    kexec-klibc vmcore-dmesg-klibc \
> > > > +    kexec vmcore-dmesg \
> > >
> > > this creates a dependency on kexec-tools from oe-core, this however is
> > > not buildable on some arches e.g. riscv
> > > so this change does not work as such, I think you can only add it as
> > > dependency where its supported.
> > >
> >
> > Well, the problem was already there, kexec-tools klibc and oe-core both have
> >
> > COMPATIBLE_HOST =
> > '(x86_64.*|i.86.*|arm.*|aarch64.*|powerpc.*|mips.*)-(linux|freebsd.*)'
> >
> >
> > I really have no idea about the image purposes, I see there is dracut
> > which seems to be buildable for most archs and does not have runtime
> > deps on kexec-tools.
> > Maybe we can just remove kexec and vmcore-dmesg
> >
>
> these were mainly for testing builds of the given layer. So I think
> removing kexec and vmcore-dmesg is ok
>
> > Cheers
> > Andrea
> >
> >
> >
> > > >      "
> > > > -
> > > > -EXCLUDE_FROM_WORLD = "1"
> > > > --
> > > > 2.17.1
> > > >
> > > > 
