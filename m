Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAA66C83030
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 04:54:25 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web11.52660.1751864062834889993
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Jul 2025 21:54:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OkVSOLOg;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-708d90aa8f9so22101457b3.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 06 Jul 2025 21:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751864062; x=1752468862; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LNa0osVpTxez+/lIGxvh+f215qUnYkE+pXVCUPBy5zY=;
        b=OkVSOLOglFc5Sx1Y63yHR93Cpmie3a/lTdwj0aAWz6nFJLhOQlxYj06snMDCERcO5m
         I4z4KFkgZNR7vqYvjyfES/qJ685E0S6ZMr8l7whxfemtUbGhL1SF6u6iExKaxns0yzI+
         w5iOn2IA7hGevmlpLY3GjzUvlgVtKbH4hOL3VorUpR3ywn7xCtEkKFjhHDJWxwZb3fK8
         cIyCeQv7Ngx4JvJUaqAR5RvpAhSttdbqxFZkrncTSP6CcRDx8Rfd6BSzPM8BPgJqyT29
         ZbcJWzrKuVzu2aEe/7Xb5d01VBanYOQi8XPgTnKjSCSh3be3F3vMoGlsCYGeZoUqHMN6
         uGJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751864062; x=1752468862;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LNa0osVpTxez+/lIGxvh+f215qUnYkE+pXVCUPBy5zY=;
        b=HNb0rxVN5TrKjRuhVxEwnzXzhMhuOZ3IX/coE7PVJO+OZ1iOp1j6mGPkgLGD29om/o
         MeQK3jb+Me4r8NtWuUB/052AlnJzo8zJg7I+cTl4gP1YE6VQclpIhMpe9cf+UIZDichS
         cg2yC1QfpMxdGOHW0tcplJTYhRGVLzC5U1EjruygIDJ5+KzxebeOUpKtFuQqXQOFNatX
         XeokGGLMOjudXfjPNbHt148H5+gCnRn8FeEvYZsoeoGznstgLyQ+k1UIc+DJNKIYocL6
         YBXXWCwF/HA4m5G0CRUCydmwGxODSlulH7qXYSv9MlpUDZz3pTwo+OHX6VvbwQTC/T8I
         m9IA==
X-Gm-Message-State: AOJu0YxDRz00AQ0nPbY+XHIk11hzdD5zHVGOhN5vdPX2hYfvmTZxG73v
	91e+wRDflK5Vv1ABlWT53bs1T0DCO4gC5ndeumAHB3LyJdPNAiijseAHaFeidqovgPLIYFEbAeC
	cgHfpe1LAS8Mg48SWzdNguCAJIfyJ+Yc=
X-Gm-Gg: ASbGnctkOhKhAlWs2CLvp3Yd7hj0QCeJmhs6CQ0nUH2dFHUYtbm3o8penS4QyI04hZP
	yoI/W3xS4gPHTX3QZi/GSrSzJgv61chBgSxceJB71C4WEWRN+FU4DlNKJWZO+aP6AjBMtilSDEU
	uXogatr7NlJzB585rOJf5HHR0oAEmIy5GP1s9ktKlpag==
X-Google-Smtp-Source: AGHT+IG8Y6tv0c+5Dptf+MfWsQxoZ9zhhr2huIm4buyDkyLliA3e6oi3ETmfDV7XHIrlvQY42YuD2hbF6QZTfdXJb1E=
X-Received: by 2002:a05:690c:61ca:b0:70c:9364:2c62 with SMTP id
 00721157ae682-7176ccd872cmr88576107b3.25.1751864061859; Sun, 06 Jul 2025
 21:54:21 -0700 (PDT)
MIME-Version: 1.0
References: <4441f655-f9aa-48c2-bc39-98aaf3a05c74@gmail.com>
In-Reply-To: <4441f655-f9aa-48c2-bc39-98aaf3a05c74@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 6 Jul 2025 21:53:55 -0700
X-Gm-Features: Ac12FXz1LoKSakmVJHZI9fYkDf-nkPX0EM-9j4pQ9BZuwqmLOLCtP-XX6S7TEYE
Message-ID: <CAMKF1soLxhqAH5RDRe2eNQOSWWJrkW87_H2+0FWGu_VZ43xVdw@mail.gmail.com>
Subject: Re: walnascar merge request: July 6th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Jul 2025 04:54:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118242

merged now thanks Armin.

On Sun, Jul 6, 2025 at 4:41=E2=80=AFPM akuster808 <akuster808@gmail.com> wr=
ote:
>
> The following changes since commit 3c6844219a69d9ca8cb0f1579114efe9a9e2a6=
46:
>
>    postgresql: upgrade 17.4 -> 17.5 (2025-06-20 10:46:50 -0400)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded walnascar-next
>
> for you to fetch changes up to c009244a045923a9dfc32d7f2996cb61629870f6:
>
>    udisks2: Hardening measure of CVE-2025-6019 (2025-07-06 19:23:22 -0400=
)
>
> ----------------------------------------------------------------
> Bastian Krause (2):
>        libsocketcan: use https instead of git protocol
>        canutils: use https instead of git protocol
>
> Changqing Li (3):
>        netcf: remove EXTRA_AUTORECONF
>        libblockdev: fix CVE-2025-6019
>        udisks2: Hardening measure of CVE-2025-6019
>
> Jason Schonberg (1):
>        glade: update 3.22.2 -> 3.36.0
>
> Jiaying Song (2):
>        xmlsec1: avoid hardcoded ${RECIPE_SYSROOT} in xmlsec1-gnutls.pc
>        python3-pycares: fix CVE-2025-48945
>
> Jinfeng Wang (1):
>        postfix: fix rootfs file difference
>
> Richard Leitner (2):
>        python3-moteus: Upgrade 0.3.79 -> 0.3.88
>        python3-can: upgrade 4.4.2 -> 4.5.0
>
> Yoann Congal (2):
>        python3-evdev: Use Yocto kernel headers instead of host's
>        python3-evdev: Fix buildpaths errors and reproducibility
>
> Yogita Urade (1):
>        open-vm-tools: fix CVE-2025-22247
>
> Zhang Peng (1):
>        glade: fix CVE-2020-36774
>
>   .../postfix/files/0006-postfix-add-preliminary-setting.patch    | 31 ++
>   meta-networking/recipes-daemons/postfix/postfix_3.10.1.bb       | 1 +
>   meta-networking/recipes-support/netcf/netcf_0.2.8.bb            | 2 -
>   .../open-vm-tools/open-vm-tools/CVE-2025-22247.patch            | 378
> ++++++++++++++
>   .../recipes-support/open-vm-tools/open-vm-tools_12.5.0.bb       | 1 +
>   meta-oe/recipes-devtools/glade/glade/CVE-2020-36774.patch       | 54 ++
>   meta-oe/recipes-devtools/glade/glade_3.22.2.bb                  | 32 --
>   meta-oe/recipes-devtools/glade/glade_3.36.0.bb                  | 33 ++
>   meta-oe/recipes-extended/libblockdev/files/CVE-2025-6019.patch  | 31 ++
>   meta-oe/recipes-extended/libblockdev/libblockdev_3.2.1.bb       | 1 +
>   meta-oe/recipes-extended/socketcan/canutils_4.0.6.bb            | 2 +-
>   meta-oe/recipes-extended/socketcan/libsocketcan_0.0.12.bb       | 2 +-
>   meta-oe/recipes-support/udisks/udisks2/CVE-2025-6019.patch      | 51 ++
>   meta-oe/recipes-support/udisks/udisks2_2.10.1.bb                | 1 +
>   meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.7.bb                | 7 +-
>   .../python/{python3-can_4.4.2.bb =3D> python3-can_4.5.0.bb} |   5 +-
>   ...001-Add-a-reproducibility-option-for-building-ecodes.c.patch | 116
> +++++
>   meta-python/recipes-devtools/python/python3-evdev_1.9.1.bb      | 5 +-
>   .../{python3-moteus_0.3.79.bb =3D> python3-moteus_0.3.88.bb} |   2 +-
>   .../python/python3-pycares/CVE-2025-48945.patch                 | 733
> ++++++++++++++++++++++++++++
>   meta-python/recipes-devtools/python/python3-pycares_4.6.0.bb    | 1 +
>   21 files changed, 1448 insertions(+), 41 deletions(-)
>   create mode 100644
> meta-networking/recipes-daemons/postfix/files/0006-postfix-add-preliminar=
y-setting.patch
>   create mode 100644
> meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-2025-2224=
7.patch
>   create mode 100644
> meta-oe/recipes-devtools/glade/glade/CVE-2020-36774.patch
>   delete mode 100644 meta-oe/recipes-devtools/glade/glade_3.22.2.bb
>   create mode 100644 meta-oe/recipes-devtools/glade/glade_3.36.0.bb
>   create mode 100644
> meta-oe/recipes-extended/libblockdev/files/CVE-2025-6019.patch
>   create mode 100644
> meta-oe/recipes-support/udisks/udisks2/CVE-2025-6019.patch
>   rename meta-python/recipes-devtools/python/{python3-can_4.4.2.bb =3D>
> python3-can_4.5.0.bb} (83%)
>   create mode 100644
> meta-python/recipes-devtools/python/python3-evdev/0001-Add-a-reproducibil=
ity-option-for-building-ecodes.c.patch
>   rename meta-python/recipes-devtools/python/{python3-moteus_0.3.79.bb
> =3D> python3-moteus_0.3.88.bb} (82%)
>   create mode 100644
> meta-python/recipes-devtools/python/python3-pycares/CVE-2025-48945.patch
>

