Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web12.10709.1628702640609404846
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Aug 2021 10:24:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AJM6n8ju;
 spf=pass (domain: gmail.com, ip: 209.85.222.179, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id a19so3207298qkg.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Aug 2021 10:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=miRxJFCA61ITghlygMJe4Exr673xdgmV8hx09k+PBDI=;
        b=AJM6n8juN3w8/xn1XMb2TivedCDYcWa4XNJ89Hw5E/8otzi8jc5iLHEOL/9LlFpk41
         BqDW4QEoTizkd97rNA+a9nUHn98IS3aA3u44FhJWDwt21xZ1ScfMp+LwXPQ57rz5w39L
         YqqccImDbzoaW/7KMHFsbIrGanwwKovHatrZ++pj1roMn/64cG+qLnuDM1NG7bYJu6VS
         Z/4WnF4NzcR4vtFYK7QONMNt4jMyiLzJ8MdvrDWrO3D6xnL/CkbDY1ldY///5F3m8xKd
         wXiT+iOiCQRBkdbpn/RwCKgBd2Nm+nTqy+C3Ku5GQtjbdPY72adGwfq98Gyt6tNSCjJc
         FTGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=miRxJFCA61ITghlygMJe4Exr673xdgmV8hx09k+PBDI=;
        b=W3hRXudKW9dqVqIKQ5WPTaCNUtMMPz1ClnXQ3tlRuv4Wilo0t+zOBF6YV9pWnWzoKm
         XptwZahtUz9Y7OG/27QYQfcfut0EQxGL1mTMUkprGOMjm+/JZ2bOaKlHP8X0nDMTlaE2
         fYfKs0rSp4srqwf646iY183ho+NDvhHGfnFddacbIbKDnb81PnXXLsWC4e4kLfgkj665
         pTRWqzeQUrDtPQBWbj7xyPqQaegbACxcURwbHsADIl4txfBhu/VXDCwFHVlbT4UG/U1M
         oV2WW2kYteVIDy3tUg8xq+I2NQ7yy6tijQH8TRNjIC+sUPXa3bHwZ6RHauUbspY6C93b
         BAMQ==
X-Gm-Message-State: AOAM530XNHDfHCnLlUV3cnZg9od+NULmE3BZ8cHB9bqL01H/4ddSPHMW
	Zj+HMTF7Todw6AmtHQhr5oB6RGSv7sSwR45G9bBrxnnUAhvsHA==
X-Google-Smtp-Source: ABdhPJzVBISSloPrZ8voAP5TScKU9ydMmrh6U4jT+EECozqRu2L55N9nu5LUb60EYRirWWDBTK9foK36vETEtYXMBdk=
X-Received: by 2002:a05:620a:88d:: with SMTP id b13mr60345qka.125.1628702639607;
 Wed, 11 Aug 2021 10:23:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210810131836.137934-1-michael.opdenacker@bootlin.com>
In-Reply-To: <20210810131836.137934-1-michael.opdenacker@bootlin.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 11 Aug 2021 10:23:33 -0700
Message-ID: <CAMKF1soq0fjOp8piavjppYcCOoAesQuyb+idC3NNX-yWBjOiFw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] opus-tools: update to 0.2 and fix license
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 10, 2021 at 6:18 AM Michael Opdenacker
<michael.opdenacker@bootlin.com> wrote:
>
> The license in version 0.1.8 was already BSD-2-Clause and GPLv2
> (for the "opusinfo" command).
>
> The license checksum change is due to trivial changes on the license
> text ("https" instead of "http" and whitespace changes).
>
> This new version now DEPENDs on "libopusenc" and "opusfile" too.
>

Thanks for this patch, it brings up a YP compatibility issue to front see
https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1455

I think it would be better to move this recipe to meta-multimedia
which should fix it.

> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>  .../opus-tools/opus-tools_0.1.8.bb                | 15 ---------------
>  .../opus-tools/opus-tools_0.2.bb                  | 15 +++++++++++++++
>  2 files changed, 15 insertions(+), 15 deletions(-)
>  delete mode 100644 meta-oe/recipes-multimedia/opus-tools/opus-tools_0.1.8.bb
>  create mode 100644 meta-oe/recipes-multimedia/opus-tools/opus-tools_0.2.bb
>
> diff --git a/meta-oe/recipes-multimedia/opus-tools/opus-tools_0.1.8.bb b/meta-oe/recipes-multimedia/opus-tools/opus-tools_0.1.8.bb
> deleted file mode 100644
> index a84f2bf07..000000000
> --- a/meta-oe/recipes-multimedia/opus-tools/opus-tools_0.1.8.bb
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -SUMMARY = "Opus Audio Tools"
> -HOMEPAGE = "http://www.opus-codec.org/"
> -
> -LICENSE = "BSD-2-Clause"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=843a066da9f1facfcc6ea6f616ffecb1"
> -
> -SRC_URI = "http://downloads.xiph.org/releases/opus/opus-tools-${PV}.tar.gz"
> -SRC_URI[md5sum] = "b424790eda9357a4df394e2d7ca19eac"
> -SRC_URI[sha256sum] = "e4e188579ea1c4e4d5066460d4a7214a7eafe3539e9a4466fdc98af41ba4a2f6"
> -
> -S = "${WORKDIR}/opus-tools-${PV}"
> -
> -DEPENDS = "libopus flac"
> -
> -inherit autotools pkgconfig
> diff --git a/meta-oe/recipes-multimedia/opus-tools/opus-tools_0.2.bb b/meta-oe/recipes-multimedia/opus-tools/opus-tools_0.2.bb
> new file mode 100644
> index 000000000..b5e6ed947
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/opus-tools/opus-tools_0.2.bb
> @@ -0,0 +1,15 @@
> +SUMMARY = "Opus Audio Tools"
> +HOMEPAGE = "http://www.opus-codec.org/"
> +
> +LICENSE = "BSD-2-Clause & GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=79f6fc2a6239fbe5f6e52f20ac76698c"
> +
> +SRC_URI = "http://downloads.xiph.org/releases/opus/opus-tools-${PV}.tar.gz"
> +SRC_URI[md5sum] = "ff2d0536e960cabbfb8ca7c8c1759b6c"
> +SRC_URI[sha256sum] = "b4e56cb00d3e509acfba9a9b627ffd8273b876b4e2408642259f6da28fa0ff86"
> +
> +S = "${WORKDIR}/opus-tools-${PV}"
> +
> +DEPENDS = "libopus libopusenc flac opusfile"
> +
> +inherit autotools pkgconfig
> --
> 2.25.1
>
>
> 
>
