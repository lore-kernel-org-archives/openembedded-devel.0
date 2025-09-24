Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B356CAC5AE
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 17:53:50 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web10.20845.1758736419852759295
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 10:53:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PsFvIa0z;
 spf=pass (domain: gmail.com, ip: 209.85.160.51, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-34049023e98so3283fac.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 10:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758736419; x=1759341219; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gyj3FikHG4yYt05AaBlqxNOk6/+ieU1xaYoKEhiXktQ=;
        b=PsFvIa0zsx2X6DOOuckoWNt2h9ZrkqpdYG/L1I5Jfi4hZZPwjLkkDuz3DB3P9fKcwk
         o4D9GlmhgWumHFWRFrbe5j6/1SBkFlNEmFVP34cAs7Dus50fwRncS9rYvbJDYazL3EgP
         RFMjpepvvWh8ulJqHn5uHaWGblLwvJdMOwDtQhOWLV9/s3aYJFkbbqhUxuqGGTonMZWu
         ke8/wfNzxp/5sVvzj5NCvW0UZIBftf4czUtyIFyWbeO2+nFZUgsHlNLFIamuysNJySoC
         uhucGfM8Lum+gkzUu3bPjSzrtFAZ4t/Ygw0ek0Z9EMWfW2ItC64El0c/Bu4sORbv/shn
         gNPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758736419; x=1759341219;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gyj3FikHG4yYt05AaBlqxNOk6/+ieU1xaYoKEhiXktQ=;
        b=L+T8f+ukZcj9iJHos+KPoJZCijbtQ/gg/aWhfKGc0O+m+9NkodJMYj+JcIRGeCBWHb
         6RkLnyOorMpeWFEKZCzKP3tedMItUa7A/dBQPAoEmqxpchcnx6SMOrZUb/54adcpFkiD
         hzviA1A67gyZMH0YnXIOZPdljnDfFLjWruVZZ7VAQO/mb6ApCeNdu5tf2p++z5dDg/Zh
         aXiKebv9mwehwb6rbfZs479mu+0RzH8eszrxBAlz4u/mKT9ZQeRKadizLgZ4PdRYPK+p
         DWwyWXmaK3Le0si/rgL5NU8DlRbAuxNyYQT+r53C3QdUtEwux2InkG5EwYglJou6RX/s
         rJqw==
X-Gm-Message-State: AOJu0YymjA8w5RkoIQDfuT6y2g6phfkEcYcHsRApWzTKYAJGsH6p+gnL
	yDBPJVFwpEEa1daOoY3aUqdiV/BsY8SdZSAiRMwTy/lxZY5Jgd4DV/9Ve85H077W7mYAk9E/E9S
	h/n1E8wrCmI86PRIbG/tcgH4ETG8yOn+SbQ==
X-Gm-Gg: ASbGnctU/JVpr98ODPgCjBI6VXptiqXyBvT14hDHZmkJtuktJ/7W88dgtKuXnbIEeQh
	UPqUHJLhmYb58v/1DvZtRU3rJRAh35XKQWnmBX2WzV3DaP6r6Jxx7cOpipHcZLy5oF2EaP/Lle2
	iKTm5KG4BW75+N336Ad1DCqKeKX5Kldjp920+1ggaI8QVQ/mutluHDRR1CHIlVHGvsCbkrruVia
	4tVV4im2A==
X-Google-Smtp-Source: AGHT+IHKXK98Zo44Fv/r8fjLBq/RBhyk7uKQvWCrsVLKewFtzEyUojPtvb5m5Me2aZFN3FrHEY6tXtSUFk5GUadq6Ko=
X-Received: by 2002:a05:6808:4fde:b0:43d:25a2:e28c with SMTP id
 5614622812f47-43f4cf464f3mr392902b6e.49.1758736418876; Wed, 24 Sep 2025
 10:53:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250924075643.2047506-1-ankur.tyagi85@gmail.com>
 <20250924075643.2047506-6-ankur.tyagi85@gmail.com> <2dbed234-0810-49d1-b7f1-570f9cfc9882@gmail.com>
In-Reply-To: <2dbed234-0810-49d1-b7f1-570f9cfc9882@gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Thu, 25 Sep 2025 05:53:27 +1200
X-Gm-Features: AS18NWD0aUbXqqRRVLnviacgpIPSJ9lZj67Zu98fAkqvZQCLx3n38DBtOkffEuo
Message-ID: <CADySD0Evjj7CE=mdzxTHnQDOh0zXquDAuCVcsnLM-WVOHuik5w@mail.gmail.com>
Subject: Re: [oe][meta-oe][walnascar][PATCH 5/6] ledmon: upgrade 0.97 -> 1.1.0
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 17:53:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119827

On Wed, Sep 24, 2025 at 10:22=E2=80=AFPM Gyorgy Sarvari <skandigraun@gmail.=
com> wrote:
>
> This update does some api refactoring[1] - at least one library function
> is removed and another has a different return type. This version bump
> looks too big for stable branch - if it fixes something important, a
> separate patch would be better IMO.
>
> [1]:
> https://github.com/intel/ledmon/commit/fec14ba294307eb98798941d5e3ca04ff2=
a501fb
>

Thanks for the review, I made dumb mistakes this time around.

> On 9/24/25 09:56, Ankur Tyagi wrote:
> > From: Gyorgy Sarvari <skandigraun@gmail.com>
> >
> > Dropped 0001-fix-build-with-clang.patch, because it is included in this=
 release.
> >
> > This update also fixes building for x86 platform.
> >
> > Changelog:
> > https://github.com/intel/ledmon/blob/main/CHANGELOG.md
> >
> > Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > (cherry picked from commit 219f5c96cc744c73b732ddfb7c62d0448aa565ae)
> > Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > ---
> >  .../ledmon/0001-fix-build-with-clang.patch    | 90 -------------------
> >  ...nclude-sys-select.h-and-sys-types.h.patch} | 27 ++----
> >  .../{ledmon_0.97.bb =3D> ledmon_1.1.0.bb}       | 10 +--
> >  3 files changed, 13 insertions(+), 114 deletions(-)
> >  delete mode 100644 meta-oe/recipes-bsp/ledmon/ledmon/0001-fix-build-wi=
th-clang.patch
> >  rename meta-oe/recipes-bsp/ledmon/ledmon/{0002-include-sys-select.h-an=
d-sys-types.h.patch =3D> 0001-include-sys-select.h-and-sys-types.h.patch} (=
56%)
> >  rename meta-oe/recipes-bsp/ledmon/{ledmon_0.97.bb =3D> ledmon_1.1.0.bb=
} (79%)
> >
> > diff --git a/meta-oe/recipes-bsp/ledmon/ledmon/0001-fix-build-with-clan=
g.patch b/meta-oe/recipes-bsp/ledmon/ledmon/0001-fix-build-with-clang.patch
> > deleted file mode 100644
> > index f1e1d6f780..0000000000
> > --- a/meta-oe/recipes-bsp/ledmon/ledmon/0001-fix-build-with-clang.patch
> > +++ /dev/null
> > @@ -1,90 +0,0 @@
> > -From 28fd86fb4e18af181174176530a80672de4449d2 Mon Sep 17 00:00:00 2001
> > -From: alperak <alperyasinak1@gmail.com>
> > -Date: Sat, 18 Nov 2023 12:27:17 +0300
> > -Subject: [PATCH] fix build with clang
> > -
> > -struct ibpi2value is a structure which contains 2 unsigned integers.  =
In
> > -a number of cases the code was not initializing a value for the last v=
alue
> > -in the pair in struct ibpi2value ibpi_to_attention.  This was raised w=
hen
> > -using clang compiler.
> > -
> > -vmdssd.c:49:27: error: missing field 'value' initializer
> > -[-Werror,-Wmissing-field-initializers]
> > -        {LED_IBPI_PATTERN_UNKNOWN}
> > -
> > -dellssd.c:74:27: error: missing field 'value' initializer
> > -[-Werror,-Wmissing-field-initializers]
> > -        {LED_IBPI_PATTERN_UNKNOWN}
> > -
> > -amd_ipmi.c:57:27: error: missing field 'value'
> > -initializer [-Werror,-Wmissing-field-initializers]
> > -        {LED_IBPI_PATTERN_UNKNOWN}
> > -
> > -npem.c:76:27: error: missing field 'value'
> > -initializer [-Werror,-Wmissing-field-initializers]
> > -        {LED_IBPI_PATTERN_UNKNOWN}
> > -
> > -Upstream-Status: Submitted [https://github.com/intel/ledmon/pull/179]
> > -Signed-off-by: alperak <alperyasinak1@gmail.com>
> > ----
> > - src/amd_ipmi.c | 2 +-
> > - src/dellssd.c  | 2 +-
> > - src/npem.c     | 2 +-
> > - src/vmdssd.c   | 2 +-
> > - 4 files changed, 4 insertions(+), 4 deletions(-)
> > -
> > -diff --git a/src/amd_ipmi.c b/src/amd_ipmi.c
> > -index 726f77d..ad36e9e 100644
> > ---- a/src/amd_ipmi.c
> > -+++ b/src/amd_ipmi.c
> > -@@ -53,7 +53,7 @@ const struct ibpi2value ibpi2amd_ipmi[] =3D {
> > -     {IBPI_PATTERN_FAILED_ARRAY, 0x45},
> > -     {IBPI_PATTERN_REBUILD, 0x46},
> > -     {IBPI_PATTERN_HOTSPARE, 0x47},
> > --    {IBPI_PATTERN_UNKNOWN}
> > -+    {IBPI_PATTERN_UNKNOWN, 0}
> > - };
> > -
> > - #define MG9098_CHIP_ID_REG  0x63
> > -diff --git a/src/dellssd.c b/src/dellssd.c
> > -index 3c10ec7..7f02ea1 100644
> > ---- a/src/dellssd.c
> > -+++ b/src/dellssd.c
> > -@@ -71,7 +71,7 @@ static const struct ibpi2value ibpi2ssd[] =3D {
> > -     {IBPI_PATTERN_FAILED_DRIVE, BP_FAULT | BP_ONLINE},
> > -     {IBPI_PATTERN_LOCATE, BP_IDENTIFY | BP_ONLINE},
> > -     {IBPI_PATTERN_LOCATE_OFF, BP_ONLINE},
> > --    {IBPI_PATTERN_UNKNOWN}
> > -+    {IBPI_PATTERN_UNKNOWN, 0}
> > - };
> > -
> > - #define DELL_OEM_NETFN                      0x30
> > -diff --git a/src/npem.c b/src/npem.c
> > -index c21276d..3499169 100644
> > ---- a/src/npem.c
> > -+++ b/src/npem.c
> > -@@ -72,7 +72,7 @@ const struct ibpi2value ibpi_to_npem_capability[] =
=3D {
> > -     {IBPI_PATTERN_FAILED_DRIVE, PCI_NPEM_FAIL_CAP},
> > -     {IBPI_PATTERN_LOCATE, PCI_NPEM_LOCATE_CAP},
> > -     {IBPI_PATTERN_LOCATE_OFF, PCI_NPEM_OK_CAP},
> > --    {IBPI_PATTERN_UNKNOWN}
> > -+    {IBPI_PATTERN_UNKNOWN, 0}
> > - };
> > -
> > - static struct pci_access *get_pci_access()
> > -diff --git a/src/vmdssd.c b/src/vmdssd.c
> > -index 51af591..9c63d90 100644
> > ---- a/src/vmdssd.c
> > -+++ b/src/vmdssd.c
> > -@@ -45,7 +45,7 @@ struct ibpi2value ibpi_to_attention[] =3D {
> > -     {IBPI_PATTERN_REBUILD, ATTENTION_REBUILD},
> > -     {IBPI_PATTERN_LOCATE_OFF, ATTENTION_OFF},
> > -     {IBPI_PATTERN_ONESHOT_NORMAL, ATTENTION_OFF},
> > --    {IBPI_PATTERN_UNKNOWN}
> > -+    {IBPI_PATTERN_UNKNOWN, 0}
> > - };
> > -
> > - #define SYSFS_PCIEHP         "/sys/module/pciehp"
> > ---
> > -2.25.1
> > -
> > diff --git a/meta-oe/recipes-bsp/ledmon/ledmon/0002-include-sys-select.=
h-and-sys-types.h.patch b/meta-oe/recipes-bsp/ledmon/ledmon/0001-include-sy=
s-select.h-and-sys-types.h.patch
> > similarity index 56%
> > rename from meta-oe/recipes-bsp/ledmon/ledmon/0002-include-sys-select.h=
-and-sys-types.h.patch
> > rename to meta-oe/recipes-bsp/ledmon/ledmon/0001-include-sys-select.h-a=
nd-sys-types.h.patch
> > index 75bf2b4f5e..833f38a042 100644
> > --- a/meta-oe/recipes-bsp/ledmon/ledmon/0002-include-sys-select.h-and-s=
ys-types.h.patch
> > +++ b/meta-oe/recipes-bsp/ledmon/ledmon/0001-include-sys-select.h-and-s=
ys-types.h.patch
> > @@ -9,16 +9,19 @@ sys/types.h is needed for ssize_t
> >  Upstream-Status: Pending
> >
> >  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +
> > +Adapted to latest release - sys/types.h is already included in the pro=
ject.
> > +
> > +Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> >  ---
> >   src/dellssd.c | 1 +
> > - src/utils.h   | 1 +
> > - 2 files changed, 2 insertions(+)
> > + 1 file changed, 1 insertion(+)
> >
> > -diff --git a/src/dellssd.c b/src/dellssd.c
> > +diff --git a/src/lib/dellssd.c b/src/lib/dellssd.c
> >  index 7b8d431..e97fe45 100644
> > ---- a/src/dellssd.c
> > -+++ b/src/dellssd.c
> > -@@ -27,6 +27,7 @@
> > +--- a/src/lib/dellssd.c
> > ++++ b/src/lib/dellssd.c
> > +@@ -13,6 +13,7 @@
> >   #include <unistd.h>
> >
> >   #include <sys/ioctl.h>
> > @@ -26,18 +29,6 @@ index 7b8d431..e97fe45 100644
> >   #include <linux/ipmi.h>
> >
> >   #if _HAVE_DMALLOC_H
> > -diff --git a/src/utils.h b/src/utils.h
> > -index 720447a..c106529 100644
> > ---- a/src/utils.h
> > -+++ b/src/utils.h
> > -@@ -21,6 +21,7 @@
> > - #define _UTILS_H_INCLUDED_
> > -
> > - #include <getopt.h>
> > -+#include <sys/types.h>
> > - #include "config_file.h"
> > - #include "stdlib.h"
> > - #include "stdint.h"
> >  --
> >  2.21.0
> >
> > diff --git a/meta-oe/recipes-bsp/ledmon/ledmon_0.97.bb b/meta-oe/recipe=
s-bsp/ledmon/ledmon_1.1.0.bb
> > similarity index 79%
> > rename from meta-oe/recipes-bsp/ledmon/ledmon_0.97.bb
> > rename to meta-oe/recipes-bsp/ledmon/ledmon_1.1.0.bb
> > index 23a49a7d1b..eba5428856 100644
> > --- a/meta-oe/recipes-bsp/ledmon/ledmon_0.97.bb
> > +++ b/meta-oe/recipes-bsp/ledmon/ledmon_1.1.0.bb
> > @@ -8,18 +8,16 @@ HOMEPAGE =3D "https://github.com/intel/ledmon"
> >  LICENSE =3D "LGPL-2.0-only"
> >  LIC_FILES_CHKSUM =3D "file://COPYING.LIB;md5=3D4fbd65380cdd25595107900=
8b364516c"
> >
> > -DEPENDS =3D "sg3-utils udev pciutils"
> > +DEPENDS =3D "autoconf-archive-native sg3-utils udev pciutils"
> >
> >  inherit autotools systemd pkgconfig
> >
> >  SYSTEMD_SERVICE:${PN} =3D "ledmon.service"
> >
> > -SRC_URI =3D "git://github.com/intel/ledmon;branch=3Dmaster;protocol=3D=
https \
> > -        file://0002-include-sys-select.h-and-sys-types.h.patch \
> > -        file://0001-fix-build-with-clang.patch \
> > -        file://Correct-get_uint64.patch"
> > +SRC_URI =3D "git://github.com/intel/ledmon;branch=3Dmaster;protocol=3D=
https;tag=3Dv${PV} \
> > +        file://0001-include-sys-select.h-and-sys-types.h.patch"
> >
> > -SRCREV =3D "b0edae14e8660b80ffe0384354038a9f62e2978d"
> > +SRCREV =3D "f70201d255b667de00f15880e99732699df6dce0"
> >
> >  COMPATIBLE_HOST =3D "(i.86|x86_64).*-linux"
> >  COMPATIBLE_HOST:libc-musl =3D "null"
>

