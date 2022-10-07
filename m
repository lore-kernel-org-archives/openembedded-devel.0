Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D9D0C433FE
	for <webhook@archiver.kernel.org>; Fri,  7 Oct 2022 16:53:26 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web10.6957.1665161600449802327
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Oct 2022 09:53:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=gkyMrYXm;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.42,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f42.google.com with SMTP id x59so7846072ede.7
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Oct 2022 09:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/ERfK00V1oBT79svd+cEfKGdO8L3R71CHFxVcPVqYXE=;
        b=gkyMrYXmOtYrDysBXRmjNoa7GSRQdvYglhiq34pFfszJUfdu/D+PiXAI1XuOI8g6bX
         50QwtJTim8pCD8h6s8QOWelsorRu++aa1zuITGsH+dC4A3U3Pauo6ZIiebeNCbqfGMwM
         Rjs/IgUdkyMxQkf3wHxlaRI0Sat4fbYqAWUKdQaqrfRBCevbnNnh/HCUUR7vBoqwXCPf
         Ccp3JHj3Jpa+i8ymuVTlSC+JCqCPp2AMFVjaCdn5mwOvuq3DHjI4y1cWlMkOEHeHPRTd
         /wH6qfDqQsn3gjjPzEjGYqd7E29+0Qa02ym/AY9M85FW6KQ3Y6tkpJvYCU1Sqq2TwxTk
         nIaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ERfK00V1oBT79svd+cEfKGdO8L3R71CHFxVcPVqYXE=;
        b=qYIthe/hhjzy7+xiZy64dOQxA5Y5FHlnU1LeUR0/G9Wn8UPiI8Kzoe2K2R8Utem4oF
         b9HoOm5MyzC4Z2baao5zb2d/L62SKp8h74+3UocnTDZ6m1R//U99PWLEYrrx85JvBZZf
         h6qnYWb/+6pbraRNNCvrdiJmN9CIilh/Ogh9Eg08h0oH+B10exlB6LQCud/qTjuj5y2+
         kKqWfiq0E5jnKeWpLeSyIP9GifWuw5SrjkR4RnK9jbf9oGrVqMp24rZ3Uqh/y/9pu4oW
         bYAj//qzUbWZkAvC+ExXOy4DOMQAag8TifGJ1kn3Kfq/s4DaS21izxCm+4PIRecFzHSd
         lDdw==
X-Gm-Message-State: ACrzQf1dZqcgdf71vP81yNEiS61lT8SWO9k6ot84qyukGtZk9im1OAev
	obfKfqvoTHDEWChy9xXGkh1lLSlsSJnahx4tcrRDLQ==
X-Google-Smtp-Source: 
 AMsMyM4RcocbaDE/PM+QDl5g5AjtPxSTE+Y6GBupGadYHfR+Sx/vWwOOjsZ6UZdTZC5tR6YrtrRLeBrGOEZLH+dOdt4=
X-Received: by 2002:a50:eb05:0:b0:457:c6f5:5f65 with SMTP id
 y5-20020a50eb05000000b00457c6f55f65mr5303829edp.311.1665161598156; Fri, 07
 Oct 2022 09:53:18 -0700 (PDT)
MIME-Version: 1.0
References: <20221007054047.26280-1-vkumbhar@mvista.com>
In-Reply-To: <20221007054047.26280-1-vkumbhar@mvista.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 7 Oct 2022 06:53:07 -1000
Message-ID: 
 <CAOSpxdbzGzrWA4xt-=sSZ9bNSFAzKyVifxHV+3Q22cf+it35Ug@mail.gmail.com>
Subject: Re: [oe] [OE-core][dunfell][PATCH] CVE-2021-3638 QEMU: ati-vga:
 inconsistent check in ati_2d_blt() may lead to out-of-bounds write
To: vkumbhar <vkumbhar@mvista.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Oct 2022 16:53:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99088

Hi Vivek,

First of all, thanks for helping with CVEs!

Now for the feedback:

1.  You sent this to the wrong list!  It should be sent to
openembedded-core@lists.openembedded.org

2. A more standard subject/shortlog would be something like:
[OE-core][dunfell][PATCH] qemu: fix CVE-2021-3638
    You give a detailed description in the commit message, so you just
need the top level info in the subject line. And it should always
start with the package/recipe name.

Thanks!

Steve

On Fri, Oct 7, 2022 at 2:32 AM vkumbhar <vkumbhar@mvista.com> wrote:
>
> Source: https://lists.nongnu.org/archive/html/qemu-devel/2021-09/msg01682.html
> MR: 116345
> Type: Security Fix
> Disposition: Backport from https://lists.nongnu.org/archive/html/qemu-devel/2021-09/msg01682.html
> ChangeID: b3d3994010d6c7831db1c34a5a2f71923fcd157b
> Description:
>     When building QEMU with DEBUG_ATI defined then running with
>     '-device ati-vga,romfile="" -d unimp,guest_errors -trace ati\*'
>     we get:
>
>       ati_mm_write 4 0x16c0 DP_CNTL <- 0x1
>       ati_mm_write 4 0x146c DP_GUI_MASTER_CNTL <- 0x2
>       ati_mm_write 4 0x16c8 DP_MIX <- 0xff0000
>       ati_mm_write 4 0x16c4 DP_DATATYPE <- 0x2
>       ati_mm_write 4 0x224 CRTC_OFFSET <- 0x0
>       ati_mm_write 4 0x142c DST_PITCH_OFFSET <- 0xfe00000
>       ati_mm_write 4 0x1420 DST_Y <- 0x3fff
>       ati_mm_write 4 0x1410 DST_HEIGHT <- 0x3fff
>       ati_mm_write 4 0x1588 DST_WIDTH_X <- 0x3fff3fff
>       ati_2d_blt: vram:0x7fff5fa00000 addr:0 ds:0x7fff61273800 stride:2560 bpp:32
>     rop:0xff
>       ati_2d_blt: 0 0 0, 0 127 0, (0,0) -> (16383,16383) 16383x16383 > ^
>       ati_2d_blt: pixman_fill(dst:0x7fff5fa00000, stride:254, bpp:8, x:16383,
>     y:16383, w:16383, h:16383, xor:0xff000000)
>       Thread 3 "qemu-system-i38" received signal SIGSEGV, Segmentation fault.
>       (gdb) bt
>       #0  0x00007ffff7f62ce0 in sse2_fill.lto_priv () at /lib64/libpixman-1.so.0
>       #1  0x00007ffff7f09278 in pixman_fill () at /lib64/libpixman-1.so.0
>       #2  0x0000555557b5a9af in ati_2d_blt (s=0x631000028800) at
>     hw/display/ati_2d.c:196
>       #3  0x0000555557b4b5a2 in ati_mm_write (opaque=0x631000028800, addr=5512,
>     data=1073692671, size=4) at hw/display/ati.c:843
>       #4  0x0000555558b90ec4 in memory_region_write_accessor (mr=0x631000039cc0,
>     addr=5512, ..., size=4, ...) at softmmu/memory.c:492
>
>     Commit 584acf34cb0 ("ati-vga: Fix reverse bit blts") introduced
>     the local dst_x and dst_y which adjust the (x, y) coordinates
>     depending on the direction in the SRCCOPY ROP3 operation, but
>     forgot to address the same issue for the PATCOPY, BLACKNESS and
>     WHITENESS operations, which also call pixman_fill().
>
>     Fix that now by using the adjusted coordinates in the pixman_fill
>     call, and update the related debug printf().
>
> Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> ---
>  meta/recipes-devtools/qemu/qemu.inc           |  1 +
>  .../qemu/qemu/0001-CVE-2021-3638.patch        | 42 +++++++++++++++++++
>  2 files changed, 43 insertions(+)
>  create mode 100644 meta/recipes-devtools/qemu/qemu/0001-CVE-2021-3638.patch
>
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
> index 7a963ad57c..b9ac4c663c 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -52,6 +52,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
>            file://CVE-2019-20175.patch \
>            file://CVE-2020-24352.patch \
>            file://CVE-2020-25723.patch \
> +          file://0001-CVE-2021-3638.patch \
>            "
>  UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
>
> diff --git a/meta/recipes-devtools/qemu/qemu/0001-CVE-2021-3638.patch b/meta/recipes-devtools/qemu/qemu/0001-CVE-2021-3638.patch
> new file mode 100644
> index 0000000000..c4be2b0d33
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/0001-CVE-2021-3638.patch
> @@ -0,0 +1,42 @@
> +From a4f43e9d91e4dbfab407d9ca10932c9c490b32a9 Mon Sep 17 00:00:00 2001
> +From: Vivek Kumbhar <vkumbhar@mvista.com>
> +Date: Fri, 7 Oct 2022 05:19:08 +0000
> +Subject: [PATCH] CVE-2021-3638
> +
> +Upstream-Status: Inappropriate[https://lists.nongnu.org/archive/html/qemu-devel/2021-09/msg01682.html]
> +CVE: CVE-2021-3638
> +Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> +---
> + hw/display/ati_2d.c | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/hw/display/ati_2d.c b/hw/display/ati_2d.c
> +index 23a8ae0c..395b523b 100644
> +--- a/hw/display/ati_2d.c
> ++++ b/hw/display/ati_2d.c
> +@@ -83,7 +83,7 @@ void ati_2d_blt(ATIVGAState *s)
> +     DPRINTF("%d %d %d, %d %d %d, (%d,%d) -> (%d,%d) %dx%d %c %c\n",
> +             s->regs.src_offset, s->regs.dst_offset, s->regs.default_offset,
> +             s->regs.src_pitch, s->regs.dst_pitch, s->regs.default_pitch,
> +-            s->regs.src_x, s->regs.src_y, s->regs.dst_x, s->regs.dst_y,
> ++            s->regs.src_x, s->regs.src_y, dst_x, dst_y,
> +             s->regs.dst_width, s->regs.dst_height,
> +             (s->regs.dp_cntl & DST_X_LEFT_TO_RIGHT ? '>' : '<'),
> +             (s->regs.dp_cntl & DST_Y_TOP_TO_BOTTOM ? 'v' : '^'));
> +@@ -178,11 +178,11 @@ void ati_2d_blt(ATIVGAState *s)
> +         dst_stride /= sizeof(uint32_t);
> +         DPRINTF("pixman_fill(%p, %d, %d, %d, %d, %d, %d, %x)\n",
> +                 dst_bits, dst_stride, bpp,
> +-                s->regs.dst_x, s->regs.dst_y,
> ++                dst_x, dst_y,
> +                 s->regs.dst_width, s->regs.dst_height,
> +                 filler);
> +         pixman_fill((uint32_t *)dst_bits, dst_stride, bpp,
> +-                    s->regs.dst_x, s->regs.dst_y,
> ++                    dst_x, dst_y,
> +                     s->regs.dst_width, s->regs.dst_height,
> +                     filler);
> +         if (dst_bits >= s->vga.vram_ptr + s->vga.vbe_start_addr &&
> +--
> +2.18.2
> +
> --
> 2.18.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99087): https://lists.openembedded.org/g/openembedded-devel/message/99087
> Mute This Topic: https://lists.openembedded.org/mt/94178238/3620601
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

