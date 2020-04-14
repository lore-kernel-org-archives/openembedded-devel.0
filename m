Received: from mail-il1-f196.google.com (mail-il1-f196.google.com [209.85.166.196])
 by mx.groups.io with SMTP id smtpd.web10.7522.1586855228045073911
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Apr 2020 02:07:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=sVjPDyFX;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.166.196, mailfrom: brgl@bgdev.pl)
Received: by mail-il1-f196.google.com with SMTP id c17so7511998ilk.6
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2020 02:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=J+F6X2HhdewXiH4dQJFoTfe4HqmM0cu9EMeKB4wdsrQ=;
        b=sVjPDyFX4qPzfRHZqXCoKWWRYvktET0whGjzqWMUn9QA4R/4V5D2Bn+QQVxsAem11J
         s2neAEh7ViiPNK7nS3ZQLDadmYM1cDWNJra1buqaK1mGR4LeK40emkRfJI9yu5kbPRIS
         ZCbH8bNnjZzVF6KPuLcj1tBpAJ3bIur4WKmGxq6vmgjhOeDO3uczyaQPsBtq7/BEy03o
         6ondGLndv6NGEi2jCiZ2uleBzAn1iU1syqOphe8WpYI03SZIkcicmJOB5q7wsa3zahpm
         n5mlZ4Ix/J6uokcAgh5QjMhB8ywYxsJRw8sJUmdlmfQ/j0RWSJb8l1PoCHhGnYCEKk7R
         vQSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=J+F6X2HhdewXiH4dQJFoTfe4HqmM0cu9EMeKB4wdsrQ=;
        b=CpYtd8d16YMpAgqHNqXBUeySCgNnPOazBDsZOXpSPvQPN4xpRrvuY67mfmzCBAmjSa
         nb/5i/M+vMXjvXYv81j/7gSc0T1lxuh352a4UzE0ZgN3iZkaN503x8f6vNrTGm4URfbG
         9a2ZMcxhD5sNBIQ7eBmOFDUm1fFpV6gQWnrJQow/nNpAqnbc0XuX/xomKC9g7y+mVBgg
         OWw5FLrTeHviTyPPpHnJIA/86OeZKWCC2qOwK/Z91EgEFlwAQflUO8+BV2NBPcMCewVQ
         U1zwz9lSJgTH38AYUgWmr2jpWj4TrY4kg4aQGKrd9Sni/Jv68UG0M3n1Exb7nAZf5hDj
         bYIQ==
X-Gm-Message-State: AGi0PubzrQZnLBIuFzHgjBqgZAtZd5PtKtzPYIpP83F2toMzqUeBsLTr
	zHstIxAWHjv1Q+l9vC3K4G4dPdlCxUlqjZvG7bSZZbm3
X-Google-Smtp-Source: APiQypJ79PQIdN9JpO9WeaMO3xcJ7YVBaiVUTGTcH6eD2Lqhf+jYJfRMi08C3e7TbgO79iUqzL9jrAaqWt4P40tz1j4=
X-Received: by 2002:a92:ba87:: with SMTP id t7mr21514718ill.287.1586855227273;
 Tue, 14 Apr 2020 02:07:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200410124135.24217-1-brgl@bgdev.pl> <20200410124135.24217-3-brgl@bgdev.pl>
 <c4b7d539-f7ce-0ab6-7b53-3d7e07a93897@embexus.com>
In-Reply-To: <c4b7d539-f7ce-0ab6-7b53-3d7e07a93897@embexus.com>
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
Date: Tue, 14 Apr 2020 11:06:56 +0200
Message-ID: <CAMRc=MdcQ7UsoPajv=fwLKdpGNX9RRK8SEb9+EUhs-qMUrbfLw@mail.gmail.com>
Subject: Re: [oe] [meta-security][RFC 2/2] dm-verity: add a working example for BeagleBone Black
To: Ayoub Zaki <ayoub.zaki@embexus.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

pon., 13 kwi 2020 o 12:53 Ayoub Zaki <ayoub.zaki@embexus.com> napisa=C5=82(=
a):
>
> Hi,
>
>
> On 10.04.20 14:41, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > This adds various bits and pieces to enable generating a working exampl=
e
> > of a full chain of trust up to dm-verity-protected rootfs level on Beag=
le
> > Bone Black.
> >
> > The new initramfs is quite generic and should work for other SoCs as we=
ll
> > when using fitImage.
> >
> > The following config can be used with current master poky,
> > meta-openembedded & meta-security to generate a BBB image using verifie=
d
> > boot and dm-verity.
> >
> >    UBOOT_SIGN_KEYDIR =3D "/tmp/test-keys/"
> >    UBOOT_SIGN_KEYNAME =3D "dev"
> >    UBOOT_SIGN_ENABLE =3D "1"
> >    UBOOT_MKIMAGE_DTCOPTS =3D "-I dts -O dtb -p 2000"
> >    UBOOT_MACHINE_beaglebone-yocto =3D "am335x_boneblack_vboot_config"
> >
> >    IMAGE_CLASSES +=3D "dm-verity-img"
> >    IMAGE_FSTYPES +=3D "wic.xz ext4"
> >
> >    DM_VERITY_IMAGE =3D "core-image-full-cmdline"
> >    DM_VERITY_IMAGE_TYPE =3D "ext4"
> >
> >    KERNEL_CLASSES +=3D "kernel-fitimage"
> >    KERNEL_IMAGETYPE_beaglebone-yocto =3D "fitImage"
> >
> >    IMAGE_INSTALL_remove =3D " kernel-image-zimage"
> >    IMAGE_BOOT_FILES_remove =3D " zImage"
> >    IMAGE_BOOT_FILES_append =3D " fitImage-${INITRAMFS_IMAGE}-${MACHINE}=
-${MACHINE};fitImage"
> >
> >    # Using systemd is not strictly needed but deals nicely with read-on=
ly
> >    # filesystem by default.
> >    DISTRO_FEATURES_append =3D " systemd"
> >    DISTRO_FEATURES_BACKFILL_CONSIDERED +=3D "sysvinit"
> >    VIRTUAL-RUNTIME_init_manager =3D "systemd"
> >    VIRTUAL-RUNTIME_initscripts =3D "systemd-compat-units"
> >
> >    INITRAMFS_IMAGE =3D "dm-verity-image-initramfs"
> >    INITRAMFS_FSTYPES =3D "cpio.gz"
> >    INITRAMFS_IMAGE_BUNDLE =3D "1"
> >
> >    WKS_FILE =3D "beaglebone-yocto-verity.wks.in"
> >
> >    KERNEL_FEATURES_append =3D " features/device-mapper/dm-verity.scc"
> >
> > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
>
> Not sure if it's a working example...so where does the fitImage goes ?
>
> How did you solve the circular dependency ?
>
>

Please refer to the cover letter - it points to a patch series for
OE-core where I fixed the problem in image and sstate bbclasses.

Bart
