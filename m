Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web12.8266.1587828526790657894
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Apr 2020 08:28:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QDECNa0M;
 spf=pass (domain: gmail.com, ip: 209.85.160.195, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f195.google.com with SMTP id z90so10508461qtd.10
        for <openembedded-devel@lists.openembedded.org>; Sat, 25 Apr 2020 08:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XdGMLoZAA39myXrs6tE4NdxaHiwdAZULP9sTlA9ItZU=;
        b=QDECNa0MtRKoDYhv+N6qLuV8n0tZwwE5WQqDejNGMJsGvSiEJEjQDA/hhVA3+20r/5
         yvhu9tZIjbGjkm0nl0D2rCjv4RXNnJyGLEFeSoozXjbzHSwASqWN7xg1r+4Dq80Kl4HL
         585fYQAmDxP+hmLVdXTGBGoyCy2d5wTvk258/g3fa5KMkGh1bKPzJux5NJm4iR9nVoLZ
         VAp7j6egUilFHPBrOewYrMton6CWoEVyQVj1VwbAMtkhu3Tv8tEqBEal2bm8+PlxIJd+
         M8pEeVH7FJacG36MEmqFRrm2MWhaTHyE4UGwwgZd13WvsZV3uTfO4b0w8mZcZK9Jr8El
         lrmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XdGMLoZAA39myXrs6tE4NdxaHiwdAZULP9sTlA9ItZU=;
        b=bSnGnzM1OWT7gHTtPK6y4tPAXxH7qztizfxwa8D19OxLTpT/ylnT4cIpIZUa9EpLk8
         32Tj5CtzhD7LJRdWvcnXHXSQrbJ7M4HXGmwa+PAGoaggFA4NyAmmo36pfjNBL6Zkd7+J
         2AA0a632ZmWZ3g20AgVjVxHPd0hFEFWZePu9XwTqblbiKZhttvDuIWBIvSTAq5COBes6
         5gXTBxPtoRD02PJKNFKme9mapOBeIYPyUU4jXIOJAIjDKqgY9go0nDIXyE+sGhMqPVc+
         Gib6OljrgC8NANUY8XZ40iXvenyEcx2H4bIJsKcyoo6xYwcvcTEmf2CUuvVAsRx6RBjo
         GchQ==
X-Gm-Message-State: AGi0PuZSllBUMkVxrWnKnLw+63e3Dj+ReAMONd+Wr9NWoeFrKd7Yr5YL
	FkVys9d5ML4a5UBn/KB7B1y0k1IZi/KvDylBk+w=
X-Google-Smtp-Source: APiQypJ0ZGXrJf4MpfKnWWV8+vjTbrUkJp58Tkn3JQ14iXZ7jWngTXBB45Ropzqm2cYAslwHk+O7lfFoeKDdJERBVkk=
X-Received: by 2002:ac8:66cf:: with SMTP id m15mr15060016qtp.146.1587828525784;
 Sat, 25 Apr 2020 08:28:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200423235535.6706-1-andrea.adami@gmail.com> <CAMKF1sqKwNGX8uSV=HqgXQDEHJs3qSZ-5NKQeZaaNHBT-fMeVQ@mail.gmail.com>
 <CAAQYJAs8Q7Y9o_03gdj2VFTRZ-QvyOtHPY_HmBMkpOTCzP3NTw@mail.gmail.com>
In-Reply-To: <CAAQYJAs8Q7Y9o_03gdj2VFTRZ-QvyOtHPY_HmBMkpOTCzP3NTw@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 25 Apr 2020 08:28:19 -0700
Message-ID: <CAMKF1soQ4Sy-XR4uhq0CD2Jvwv8tAGru6pX75-jZ6zGucMTnXw@mail.gmail.com>
Subject: Re: [oe] [meta-initramfs][PATCH] meta-initramfs-image: remove klibc utilities
To: Andrea Adami <andrea.adami@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, Apr 25, 2020 at 6:10 AM Andrea Adami <andrea.adami@gmail.com> wrote:
>
> On Sat, Apr 25, 2020 at 12:30 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Thu, Apr 23, 2020 at 4:55 PM Andrea Adami <andrea.adami@gmail.com> wrote:
> > >
> > > klibc utils have no update-alternatives because these live ideally alone
> > > in th einitramfs. This image is not minimal having busybox, linux-utils,
> > > coreutils so to resolve the conflict we just remove the shared klibc utils
> > > and replace the klibc kexec and vmcore-dmesg.
> > >
> > > Finally, remove EXCLUDE_FROM_WORLD.
> > >
> > > Fix:
> > > ERROR: meta-initramfs-image-1.0-r0 do_rootfs:
> > > Postinstall scriptlets of ['busybox', 'util-linux-umount', 'util-linux-dmesg',
> > >  'coreutils', 'util-linux-mount', 'cpio', 'util-linux-kill',
> > >  'util-linux-losetup'] have failed.
> > >
> > > Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> > > ---
> > >  .../packagegroups/packagegroup-meta-initramfs.bb | 16 ++--------------
> > >  1 file changed, 2 insertions(+), 14 deletions(-)
> > >
> > > diff --git a/meta-initramfs/recipes-core/packagegroups/packagegroup-meta-initramfs.bb b/meta-initramfs/recipes-core/packagegroups/packagegroup-meta-initramfs.bb
> > > index bfede5a74..dc4928b5a 100644
> > > --- a/meta-initramfs/recipes-core/packagegroups/packagegroup-meta-initramfs.bb
> > > +++ b/meta-initramfs/recipes-core/packagegroups/packagegroup-meta-initramfs.bb
> > > @@ -15,22 +15,10 @@ RDEPENDS_packagegroup-meta-initramfs = "\
> > >  "
> > >
> > >  RDEPENDS_packagegroup-meta-initramfs-devtools = "\
> > > -    libklibc  dracut \
> > > -    klibc-utils-cat klibc-utils-losetup klibc-utils-readlink klibc-utils-chroot \
> > > -    klibc-utils-ls klibc-utils-reboot klibc-utils-cpio klibc-utils-minips \
> > > -    klibc-utils-resume klibc-utils-dd klibc-utils-mkdir klibc-utils-run-init \
> > > -    klibc-utils-dmesg klibc-utils-mkfifo klibc-utils-sh.shared klibc-utils-false \
> > > -    klibc-utils-mknod klibc-utils-sleep klibc-utils-fstype klibc-utils-mount \
> > > -    klibc-utils-sync klibc-utils-halt klibc-utils-mv klibc-utils-true klibc-utils-ipconfig \
> > > -    klibc-utils-nfsmount klibc-utils-umount klibc-utils-kill klibc-utils-nuke klibc-utils-uname \
> > > -    mtdinfo-klibc ubiattach-klibc ubiblock-klibc ubicrc32-klibc ubidetach-klibc \
> > > -    ubiformat-klibc ubimkvol-klibc ubinfo-klibc ubinize-klibc ubirename-klibc \
> > > -    ubirmvol-klibc ubirsvol-klibc ubiupdatevol-klibc \
> > > +    dracut \
> > >      ${@bb.utils.contains_any("TRANSLATED_TARGET_ARCH", "i586 x86-64", "grubby", "", d)} \
> > >      "
> > >
> > >  RDEPENDS_packagegroup-meta-initramfs-kernel = "\
> > > -    kexec-klibc vmcore-dmesg-klibc \
> > > +    kexec vmcore-dmesg \
> >
> > this creates a dependency on kexec-tools from oe-core, this however is
> > not buildable on some arches e.g. riscv
> > so this change does not work as such, I think you can only add it as
> > dependency where its supported.
> >
>
> Well, the problem was already there, kexec-tools klibc and oe-core both have
>
> COMPATIBLE_HOST =
> '(x86_64.*|i.86.*|arm.*|aarch64.*|powerpc.*|mips.*)-(linux|freebsd.*)'
>
>
> I really have no idea about the image purposes, I see there is dracut
> which seems to be buildable for most archs and does not have runtime
> deps on kexec-tools.
> Maybe we can just remove kexec and vmcore-dmesg
>

these were mainly for testing builds of the given layer. So I think
removing kexec and vmcore-dmesg is ok

> Cheers
> Andrea
>
>
>
> > >      "
> > > -
> > > -EXCLUDE_FROM_WORLD = "1"
> > > --
> > > 2.17.1
> > >
> > > 
