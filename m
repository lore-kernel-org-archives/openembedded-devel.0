Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46B47CAC5BB
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 01:34:41 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web10.44327.1759109673547393146
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Sep 2025 18:34:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cHW1A27g;
 spf=pass (domain: gmail.com, ip: 209.85.210.42, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7827025e548so2383337a34.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Sep 2025 18:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759109673; x=1759714473; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZKTPQ+9xN7oi8ROLfEvPonTB4iFAMfGK1p+n4R6z4no=;
        b=cHW1A27gTZEyVz2Jg/UstTaLKbQ7I9FYJMHFxYX6y4GOqE1VGY78KVPKVgaQuPvo6x
         CUzhjMhPRacEVSSJnfQxjobVACJXi2piWHYSV9mZzaE++FM0a3Rx4IZfSs/SGJ79pXmf
         eyawK6g5sMR49hqLU9SZnVhH4sI5F3XEOZFZsSBPQ5qC2LBWwF3ubteZuDTTGnxij6jh
         Twm2RjZTwq1xH8221X3PNxVECXsXF9ruL77ScRMuXymGi8vV5oa1hK9AATNWqd/NuVVh
         PpvY1tIitngrOX4RTrvCN7HQKs9r/guYS5MOmrK/cyGUq7tqPQ8B/h5I8DDfRQnLLMKl
         OYDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759109673; x=1759714473;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZKTPQ+9xN7oi8ROLfEvPonTB4iFAMfGK1p+n4R6z4no=;
        b=rOND4fvN5G3oYQ9wRVebeaDSb2i2iMql2naa638YzlyNsOWVV2/HDG6yLaz3h+v+/q
         eyPDe+qXxHZCRsZlj/VTkC4xAarKPCwpgsJ8BaX+0Y/KHsTXeU9gGllK7XhVxBqNbPRx
         /2k1MoazMjMfJxyDqte6ZVhyQV8Z5LzWiuDphMpdxx/4ZdvN+ZXOvhCw8vtqBiXFltb4
         FWRsgMrNIbG1g8RZP4JHSZuNUzNHIcNFcm8jSpwJU0ecIjVc5chkZV1ZWQ7B0Bjy6uEA
         kkfyYUv1t4XFWH5xvnBdGuQZSq/0D9TtDvzHlyLz7A4KeVWG9rnU2Ppti44lbWuB0Wjp
         b4fw==
X-Gm-Message-State: AOJu0YxW//0Ab6/yrVb7HCmSe71t8y3nZyJ4IR71k01BdzBu7Mk8rI4z
	aTUV9l65K2Mch7v1SGwLOajQO02tdsAfQnCywF2VInU9VhKcWWMX8EaBBou/v0hELDm1sLpaZiV
	dvSp+P84ayi1dcHwkqCVK0tDjXtHNRuE=
X-Gm-Gg: ASbGncsPYxtqAgUFxp58In9g4sJUxo9XzHAJSkd6zz5b9GrEJWVY/P/GdOlHXzzoU1Y
	5ZHWJnYt66pR6HE2xcv+VkN/igIdEDB9W6tf2awY/klNwfXBYKhZqT8izVHID5SN1jw3uHHDk88
	9i53tqBu1km3e3aaVmbUFbNTYOGa6qt5CEBCG0XHa0VvqoO813VM19O5HktmCBspGtS2bw5Se1u
	zkgbHHnh1SeKmSs98A=
X-Google-Smtp-Source: AGHT+IFYIuOB9VQXo3gc8RiJ6LilCQgOqWZABdMDnaMb2qJjBphRTd5CwM3NGEyGkPoUpA5Xt3cjt6/idqF7MhPg5NE=
X-Received: by 2002:a05:6830:270e:b0:7ab:e111:1a57 with SMTP id
 46e09a7af769-7abe1111eb6mr4937492a34.31.1759109672657; Sun, 28 Sep 2025
 18:34:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250928165143.16664-1-schonm@gmail.com>
In-Reply-To: <20250928165143.16664-1-schonm@gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Mon, 29 Sep 2025 14:34:21 +1300
X-Gm-Features: AS18NWCHkUovuyJl4ovkyoRczvBFs4oe7LEjxE4LTligjGaaoCacSQiKN-qce1s
Message-ID: <CADySD0Gt8zdHKn-gnbt7z4eZMMeTm3aUv25sfZ7kyJnjZvLL2Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] webkitgtk3: upgrade 2.48.3 -> 2.48.7
To: schonm@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 01:34:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120003

Seems good improvements that release branches (walnascar, scarthgap,
kirkstone) can also benefit from

On Mon, Sep 29, 2025 at 5:52=E2=80=AFAM J. S. via lists.openembedded.org
<schonm=3Dgmail.com@lists.openembedded.org> wrote:
>
> WebKitGTK 2.48.7 release:
>
>     Fix a number of GStreamer memory leaks.
>     Fix several crashes and rendering issues.
>
> WebKitGTK 2.48.6 release:
>
>     Fix emojis incorrectly rendered in their text variant.
>     Add support for font collection / fragment identifiers.
>     Fix web process deadlock on exit.
>     Fix stuttering when playing WebP animations.
>     Fix CSS animations with cubic-bezier timing function.
>     Do not start the MemoryPressureMonitor if it=E2=80=99s disabled.
>     Fix several crashes and rendering issues.
>
> WebKitGTK 2.48.5 release:
>
>     Fix several crashes.
>
> WebKitGTK 2.48.4 release:
>
>     Improve emoji font selection with USE_SKIA=3DON.
>     Improve playback of multimedia streams from blob URLs.
>     Fix the build with USE_SKIA_OPENTYPE_SVG=3DON and USE_SYSPROF_CAPTURE=
=3DON.
>     Fix the build on LoongArch with USE_SKIA=3DON.
>     Fix crash when using a WebKitWebView widget in an offscreen window.
>     Fix several crashes and rendering issues.
>
> Signed-off-by: Jason Schonberg <schonm@gmail.com>
> ---
>  .../webkitgtk/{webkitgtk3_2.48.3.bb =3D> webkitgtk3_2.48.7.bb}    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-support/webkitgtk/{webkitgtk3_2.48.3.bb =3D> webk=
itgtk3_2.48.7.bb} (98%)
>
> diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.3.bb b/met=
a-oe/recipes-support/webkitgtk/webkitgtk3_2.48.7.bb
> similarity index 98%
> rename from meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.3.bb
> rename to meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.7.bb
> index b848008910..6c105e7bb1 100644
> --- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.3.bb
> +++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.7.bb
> @@ -22,7 +22,7 @@ SRC_URI =3D "https://www.webkitgtk.org/releases/webkitg=
tk-${PV}.tar.xz \
>             file://fix-ftbfs-riscv64.patch \
>             file://0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAY=
S_I.patch \
>             "
> -SRC_URI[sha256sum] =3D "d4dc5970f0fc6a529ff7fd67bcbfab2bbb5e91be789b2e92=
79640b3217a782c3"
> +SRC_URI[sha256sum] =3D "2c62aebb608e09f930a539f3623a5cc8023b5068029f42a2=
08f45f9124da6e30"
>
>  inherit cmake pkgconfig gobject-introspection perlnative features_check =
upstream-version-is-even gi-docgen
>
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119999): https://lists.openembedded.org/g/openembedde=
d-devel/message/119999
> Mute This Topic: https://lists.openembedded.org/mt/115481606/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

