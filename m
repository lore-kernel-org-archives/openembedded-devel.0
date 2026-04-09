Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CBB210FC466
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 01:45:08 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.122045.1775699104819680162
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Apr 2026 18:45:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=D4CCSw78;
 spf=pass (domain: gmail.com, ip: 209.85.210.41, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7d4be94eeacso408933a34.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Apr 2026 18:45:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775699104; cv=none;
        d=google.com; s=arc-20240605;
        b=ea/fz7zns2xABOaclRzQaWyDEBQ8wJYygpd3DD1Nw4MjYNfQNBhimM+nV+BJ3ZoboK
         RJUTH+sBFZQOqtYjTKCoM4roFv+eZZLFCjYIGQVnrfsZUWBRL1RLf8N3eq50jOlgO7wg
         FBmILflxhmO78awU8parZN3sRSrWNXz9HXN5WGYjrRF0ilSSqmjmsoTY9rILk2X6iwR+
         ZpTFwMdulLjaYShFpesnZSUJ+p8DnkD/kR7O5UYo0RkKhVlQAJDO8DaywIg97p5zLK4K
         lzbYfurcwabfOAS6/IjPOSwjP6JPMFymE2ade1UCRc3Uc/zuX12/Hmvnar0ZQXaXFCbG
         W25Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=R2k/BcuQOUvy16wFpayR9RqLjnpyseoY/WWpkyajNSI=;
        fh=PqrvWOQDuMW7DBEZMtJk4sUef2SPa7RI/TJA4C6UjCM=;
        b=fvKILp44py7gA7YHzzFMX/rvSE8K13qL+eveiK0Q4t1r6zzKDt35wB5CARiHBbwgY/
         EkNM9h4rdd3GpJdCNbOw8fKunNFKRUa2l3iOsfH5QdYUQoEuXREi3uPzONXFQOyc1agb
         mgN3umZbIS+uJN/gHfa/bicnr34qQqcIjrpPVDCr4TiK+wmaGX+lHKLL9vOCygCMQzAK
         ZTKghyEQrMS72YPvJlZKvqhwBuB1Am0IPttkwgu4ewAWxcc0PQm15cV3d6hi3GojRyeg
         6D+OwKL+sgPADMvzS8zyJa+VbR1xUiUGgo/ae7SivIV7cSpu39YILLOlcJntpwgj2XcN
         8oow==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775699104; x=1776303904; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R2k/BcuQOUvy16wFpayR9RqLjnpyseoY/WWpkyajNSI=;
        b=D4CCSw78AYTkY8qRbHvXcStdwzB3aV+DYBl0AScDK5OZVk8C2ZinbzTO58v3KT3rDD
         ai9e1UopHxUcR8VxvihdiygHwhYUR+BcGsZeqMpzR4z0mxhVZkmTfTXGUlWlzlfMwWrL
         XNwxqLI+B4aJot8oflYAXhAZxrfZiIWAu+rJtzsLHGG1Q8Jdh+vMKQ9PMaSW9xVDpXSw
         opCSezNF1uZRYIp95TWAlHXFEeJlKk5RjmMVqHdzLPqj1t2XOCkO+aIr7oGEvbxawoOk
         p6H2D5K6wn0igF0lrkNvRd86GWaWFPVSQHMW7hA990TFfjAFkYMYogvrS+4101/7L5ve
         RSEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775699104; x=1776303904;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R2k/BcuQOUvy16wFpayR9RqLjnpyseoY/WWpkyajNSI=;
        b=KMCC3aYJc+Xn7+ZZBLkzd/BuwNzXtefoVbEYYKnfJp7FVWvP+C8t14r8PVB12a6LU9
         kMYu22zHCrL2UaG4ZdBRnrNcWDdvjROdDZBTu8X2vfPLdFNh0ZnJfC88cQhlWTTohoGM
         m7YStuofTv978bEr3rIHUZ+WePncfwrRbnFZOmmVQ49zlyhpXGP0js9OkFghbrbG3CTG
         DEM2dm0HXi+wERUSLjJ1ryYqOu6NN/dVdXbU1tzV9ccoYuP+BdUx7hUK2+RuZP4Xvy0L
         ynxAiDa3MGnticumE92PvKe8nHWzIjgcty03MqIZvatafj+oCNCvwiXBs+oPJpFBz4pT
         WVPg==
X-Gm-Message-State: AOJu0YxxSt0NDfs4KSpKSU2CAN5Z8Ogf5whQ9rxAQmAfQ+Ke3LOMbOde
	3xQUtFu7q5dY073AaWsYLL5eIxhU0m7Ph3SV16g5s2v7gmUrB6NF4x1wSvON+6ZPyHTs/4kyjok
	JT1toIpWX088euxbgQBw6pI3JI+qtIRM=
X-Gm-Gg: AeBDievQTy0BxsGdn0/BAHURykveKp0ZvtwNTb3doIwuZiyjtuQbCG8fF7mNMPb+Arf
	X4qLwPzv/u7fERixRwDO+CDgxUDakzBKsWIUpiRF3Tv/2cczbNWJN+4XqY9E9qDtrJD3vYdOwLo
	/0Ikjip+wlb/Lz/hJauPwvgrx6RVTTiSLITOT+li9lxQEEGLFc0VANBR5QBWEIdnh5D4vbye/YB
	Bi7mnc8c9Det/ZU18TYk/nhvoXWIbiJSI2XLOcuk0kvCLJR5zXgIedCodvqRJVPQEJQB8I7o5Eh
	9kOGxPu0
X-Received: by 2002:a05:6820:f022:b0:685:8cf:7889 with SMTP id
 006d021491bc7-68508cf7a9bmr8453471eaf.29.1775699103849; Wed, 08 Apr 2026
 18:45:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260406194141.3893319-1-skandigraun@gmail.com> <20260406194141.3893319-2-skandigraun@gmail.com>
In-Reply-To: <20260406194141.3893319-2-skandigraun@gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Thu, 9 Apr 2026 13:44:51 +1200
X-Gm-Features: AQROBzB0a_RUVjh886hMWRm4EqA_UIE5JGPCkx3ygLg4_HWm4hx-zTSYCU6vhzU
Message-ID: <CADySD0Fke+mQNXMpixSrhxS0Ku+Z2YmZyAQ_Lox5S0+EgKO_cQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][whinlatter][PATCH 2/2] gitlib: patch CVE-2025-31344
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 01:45:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126109

typo in the commit message "gitlib" -> "giflib"


On Tue, Apr 7, 2026 at 7:41=E2=80=AFAM Gyorgy Sarvari via
lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Details: https://nvd.nist.gov/vuln/detail/CVE-2025-31344
>
> Backport the commit that mentions this CVE ID explicitly
> in its message.
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  .../giflib/giflib/CVE-2025-31344.patch        | 28 +++++++++++++++++++
>  .../recipes-devtools/giflib/giflib_5.2.2.bb   |  3 +-
>  2 files changed, 30 insertions(+), 1 deletion(-)
>  create mode 100644 meta-oe/recipes-devtools/giflib/giflib/CVE-2025-31344=
.patch
>
> diff --git a/meta-oe/recipes-devtools/giflib/giflib/CVE-2025-31344.patch =
b/meta-oe/recipes-devtools/giflib/giflib/CVE-2025-31344.patch
> new file mode 100644
> index 0000000000..8f52154955
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/giflib/giflib/CVE-2025-31344.patch
> @@ -0,0 +1,28 @@
> +From 949bf7ded2c23449439e2c3e1f63368cf7985800 Mon Sep 17 00:00:00 2001
> +From: "Eric S. Raymond" <esr@thyrsus.com>
> +Date: Wed, 18 Feb 2026 18:06:50 -0500
> +Subject: [PATCH] Resolve SourceForge bug #187: CVE-2025-31344
> +
> +CVE: CVE-2025-31344
> +Upstream-Status: Backport [https://sourceforge.net/p/giflib/code/ci/7bbe=
8ea1a595bb7509ffa0a86b076e9b720e85af]
> +Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> +---
> + gif2rgb.c | 5 +++++
> + 1 file changed, 5 insertions(+)
> +
> +diff --git a/gif2rgb.c b/gif2rgb.c
> +index d51226d..4ce2104 100644
> +--- a/gif2rgb.c
> ++++ b/gif2rgb.c
> +@@ -329,6 +329,11 @@ static void DumpScreen2RGB(char *FileName, int OneF=
ileFlag,
> +                       GifRow =3D ScreenBuffer[i];
> +                       GifQprintf("\b\b\b\b%-4d", ScreenHeight - i);
> +                       for (j =3D 0; j < ScreenWidth; j++) {
> ++                              /* Check if color is within color palete =
*/
> ++                              if (GifRow[j] >=3D ColorMap->ColorCount) =
{
> ++                                      GIF_EXIT(GifErrorString(
> ++                                          D_GIF_ERR_IMAGE_DEFECT));
> ++                              }
> +                               ColorMapEntry =3D &ColorMap->Colors[GifRo=
w[j]];
> +                               Buffers[0][j] =3D ColorMapEntry->Red;
> +                               Buffers[1][j] =3D ColorMapEntry->Green;
> diff --git a/meta-oe/recipes-devtools/giflib/giflib_5.2.2.bb b/meta-oe/re=
cipes-devtools/giflib/giflib_5.2.2.bb
> index 8226e9b6c7..c26f3cf160 100644
> --- a/meta-oe/recipes-devtools/giflib/giflib_5.2.2.bb
> +++ b/meta-oe/recipes-devtools/giflib/giflib_5.2.2.bb
> @@ -11,7 +11,8 @@ SRC_URI =3D "${SOURCEFORGE_MIRROR}/giflib/${BP}.tar.gz =
\
>             https://sourceforge.net/p/giflib/code/ci/d54b45b0240d455bbaed=
ee4be5203d2703e59967/tree/doc/giflib-logo.gif?format=3Draw;subdir=3D${BP}/d=
oc;name=3Dlogo;downloadfilename=3Dgiflib-logo.gif \
>             file://0001-Makefile-fix-typo-in-soname-argument.patch \
>             file://CVE-2026-23868.patch \
> -"
> +           file://CVE-2025-31344.patch \
> +           "
>
>  SRC_URI[logo.sha256sum] =3D "1a54383986adad1521d00e003b4c482c27e8bc60690=
be944a1f3319c75abc2c9"
>  SRC_URI[sha256sum] =3D "be7ffbd057cadebe2aa144542fd90c6838c6a083b5e8a904=
8b8ee3b66b29d5fb"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#126066): https://lists.openembedded.org/g/openembedde=
d-devel/message/126066
> Mute This Topic: https://lists.openembedded.org/mt/118696569/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

