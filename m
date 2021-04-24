Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.4889.1619260141111376279
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Apr 2021 03:29:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qjYnjQMs;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: peron.clem@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id i24so544062edy.8
        for <openembedded-devel@lists.openembedded.org>; Sat, 24 Apr 2021 03:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=msAMM2S6V0eay/oRDdQFw/uyLBPao5JW8DjsbfNkVRY=;
        b=qjYnjQMsB7Zvk7Ulrj9zNW6kzFwjhgd2dHlreh4y+Ty9/TnwCS5vup5mDLcIzikdwZ
         GwXwm7+4Q2b2tkkb1moH+LgclfP7gDrs2AMolpogIurLW0rUp6Eih+dkYXvHg1jfTTy1
         v28ztvSGiK/eCepLG2AUQMC9+toSkTxdeFX3OIw3i8Rye1ymAmphy/bfg9szAt8C2GeR
         ENGzdX1Dw/HKUqoDVcFozw4aiQFlzkAzWyrDdAiSPRRe4zNvVmgW5vhOd3lPlnQK8qrl
         hTMMdQumN2fMVulb0bRu50hZbQ0a/uXeFSuq8MtsLVuBASmOZ0Nj7A0W+X5/PJ0uuYcf
         Hk1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=msAMM2S6V0eay/oRDdQFw/uyLBPao5JW8DjsbfNkVRY=;
        b=Zz/Q2/foxUWAGwYcVP9zeLkpZeDRWOi7QOntAQH8KzFVC3CZihnxYTzIK57cwhpNnL
         WHG6Zm3U2/DizvOCddcN+NIROlHdYLy/WYXtEvnjBy0c0cmJBepuSMbnsUkvDn8W0Uqv
         BAGHtDfwSE2H0z6jVmdbxAK6OsoFJ3ESBwKz44JoVHwr2UQXdSZ37kD3dMQbOO6JfEzV
         57w8hF/taUkxe5knEcro+ekrmP+rSvd6V5Kno9OUBHrjaL8N7QX/8PhuyJrwf2EE8fHT
         A7L0B6Ey9jJJZcu/Uk+nEojFEvMdbdbo//Gux8jptTSBxffCvGCecXSWxr8yticmtByT
         QUyA==
X-Gm-Message-State: AOAM532oVwrTE10/cuBNLzfqtOI8t8FuOM1lLNd+OYbWpfPHH+HnJEVi
	hTWC8Z5nMVd2SKC+4b4I00OZo57NrUw9ymQ9N8c4y/XiHTLGHA==
X-Google-Smtp-Source: ABdhPJye7Wle19liJvtfSdfLLdI3TxvsmwVg+zFUfyWedgMT+sGQLQZ29ItH5BDR4nZed5qhZx7766sGlxDHbeKvYSc=
X-Received: by 2002:a05:6402:34c4:: with SMTP id w4mr9738883edc.367.1619260139107;
 Sat, 24 Apr 2021 03:28:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210424102451.885867-1-peron.clem@gmail.com>
In-Reply-To: <20210424102451.885867-1-peron.clem@gmail.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Sat, 24 Apr 2021 12:28:48 +0200
Message-ID: <CAJiuCcf7mOszQNA=+mQmrr0ZrFsew+e_N_=316qgLtsoU0j-Cw@mail.gmail.com>
Subject: Re: [PATCH] [RFC] gator: Add new package
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I have some questions regarding my patch.

On Sat, 24 Apr 2021 at 12:24, Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com=
> wrote:
>
> To communicate with the target device, Streamline requires the
> gator daemon, gatord, to be running on the device.

Is gator the correct name for this package? or would gatord be better?

>
> Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> ---
>  .../gator/0001-gator-don-t-strip-debug.patch  | 24 +++++++++++++++++++
>  meta-oe/recipes-devtools/gator/gator_7.5.0.bb | 22 +++++++++++++++++
>  2 files changed, 46 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/gator/gator/0001-gator-don-t=
-strip-debug.patch
>  create mode 100644 meta-oe/recipes-devtools/gator/gator_7.5.0.bb
>
> diff --git a/meta-oe/recipes-devtools/gator/gator/0001-gator-don-t-strip-=
debug.patch b/meta-oe/recipes-devtools/gator/gator/0001-gator-don-t-strip-d=
ebug.patch
> new file mode 100644
> index 000000000000..8e59fffa1fc2
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/gator/gator/0001-gator-don-t-strip-debug.p=
atch
> @@ -0,0 +1,24 @@
> +From 370e9c97f1bc07a63aa87e954823c0063058aad7 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Cl=3DC3=3DA9ment=3D20P=3DC3=3DA9ron?=3D <cpe@outsight.=
tech>
> +Date: Fri, 16 Apr 2021 15:27:16 +0200
> +Subject: [PATCH] gator: don't strip debug
> +
> +---
> + daemon/Makefile | 2 --
> + 1 file changed, 2 deletions(-)
> +
> +diff --git a/daemon/Makefile b/daemon/Makefile
> +index ba5f29cfeb10..6807948310f9 100644
> +--- a/daemon/Makefile
> ++++ b/daemon/Makefile
> +@@ -26,8 +26,6 @@ ifeq ($(shell expr `$(CXX) -dumpversion | cut -f1 -d.`=
 \>=3D 5),1)
> +       CXXFLAGS +=3D -fno-sized-deallocation
> + endif
> +
> +-# -s strips the binary of debug info
> +-LDFLAGS     +=3D -s
> + LDLIBS      +=3D -lrt -lm -pthread
> + TARGET      :=3D $(OBJ_DIR)gatord
> + ESCAPE_EXE  :=3D $(OBJ_DIR)escape/escape
> +--
> +2.25.1
> diff --git a/meta-oe/recipes-devtools/gator/gator_7.5.0.bb b/meta-oe/reci=
pes-devtools/gator/gator_7.5.0.bb
> new file mode 100644
> index 000000000000..8e15b1ca5fc5
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/gator/gator_7.5.0.bb
> @@ -0,0 +1,22 @@
> +SUMMARY =3D "DS-5 Streamine Gator daemon"
> +DESCRIPTION =3D "Target-side daemon gathering data for ARM Streamline Pe=
rformance Analyzer."
> +
> +LICENSE =3D "GPL-2.0-only"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
> +LICENSE_libsensors =3D "LGPL-2.1-or-later"

Gator git specifies that:

-libsensors source code in daemon/libsensors licensed under LGPL-2.1-or-lat=
er
-mxml source code in daemon/mxml licensed under APACHE-2.0 WITH
Mini-XML-exception
-perf_event.h from Linux userspace kernel headers in daemon/k licensed
under GPL-2.0-only WITH Linux-syscall-note.

I'm not sure how to properly reflect this in the recipe.

Thanks for your help,
Clement

> +
> +SRCREV =3D "6088d3533146d7b7c9700b8e396292053240b25f"
> +SRC_URI =3D "git://github.com/ARM-software/gator.git;protocol=3Dhttp;bra=
nch=3Dmaster \
> +          file://0001-gator-don-t-strip-debug.patch;patchdir=3D.. \
> +         "
> +
> +S =3D "${WORKDIR}/git/daemon"
> +
> +EXTRA_OEMAKE =3D "'CFLAGS=3D${CFLAGS} ${TARGET_CC_ARCH} -D_DEFAULT_SOURC=
E -DETCDIR=3D\"${sysconfdir}\"' \
> +    'LDFLAGS=3D${LDFLAGS} ${TARGET_CC_ARCH}' 'CROSS_COMPILE=3D${TARGET_P=
REFIX}' \
> +    'CXXFLAGS=3D${CXXFLAGS} ${TARGET_CC_ARCH} -fno-rtti' CC=3D'${CC}' CX=
X=3D'${CXX}'"
> +
> +do_install() {
> +       install -d ${D}${sbindir}
> +       install -m 0755 ${S}/gatord ${D}${sbindir}/gatord
> +}
> --
> 2.25.1
>
