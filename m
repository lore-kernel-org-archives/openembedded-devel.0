Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA16CC77B7C
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 19:45:50 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web11.4239.1750707945621877416
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Jun 2025 12:45:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B0lhBSBA;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: jan.vermaete@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-70e767ce72eso39771457b3.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 12:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750707945; x=1751312745; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZDhz1lvuFHxdBr6tHQB9nvkl6N+cMvBOR1Pfb6G1a80=;
        b=B0lhBSBA4eWTZkS8UuPt9DdKWd+ZB1HN8KCKpidxSUlwCR5RCv/CI0U1xpQ6w8UbxI
         usdKFTdUCaCGXQvcS7uozencocLCULm6SCfFvqJN68uRgRNKgIBOEEhADUiKAr7QuTgR
         9KXlEV2Z3KmemJNZKNXhPpmrQG1G//C6waarAXhbdHds607kIX3mJBpS+SdhIy7xvT+I
         CdtlMIDubt9RJTDS9y8X1Oogw8/AsL4MIHPXF7z+P6qiTiXvDhBSpTbV+eB/1GQD4k4X
         /pjxXaJNgUBsfAXKN7HFg+4o0dPBMf/cnRDbrhBor15xftF0gtiAxdGkggW/H7HUWBnV
         7B7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750707945; x=1751312745;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZDhz1lvuFHxdBr6tHQB9nvkl6N+cMvBOR1Pfb6G1a80=;
        b=XmOD5zGEzkpP3yHHa1EbDGw1MqyjE7ay9Oj1DEwdOoWFmagc7P2zexzW2EZQpbDsKV
         5l7bizpsmNGizyylzLkGi8SdKdSs6yF3tBK1aLSafan6agPMj84DVw0St0aNbqz4bM9p
         aqUYBDkqQrDD70+yjUC4bkOQvUgpLOSxG4w6y8893jYkQ+0vey0JKPOlg1RfP5rQ/OVo
         Bt4AMjQp8imAdqSX4GH9tIZHYrSu18OtQU/FnS4Uw02RbDuv2VD1JR28RUNvLqXo2KRC
         Gdr6sIBBL/uet9YjJ1Glc1ZNE8mDYGGXSXZ//Lt++I/36P8gCMyBa4/KsltPBJkWvlgu
         qGGg==
X-Gm-Message-State: AOJu0YxYJ9atwTpSgrdZFimsQ6uTpeEAEXZOv1tUjpr4k5cEPAg/mI1e
	PoAdJGPILreNEeTafOCEkZ1F50lf1xbIy5pmC88Uv9eSnEmOrBXe0IyTXm/gdjVXn7cAYmQE+KP
	STAdaoizmeqh4+KMwD2up3Xrqk322JPU=
X-Gm-Gg: ASbGnctQnxwJcZeGsshpECRTrwmC0NRIB+/6wjsdWZZb9/n9zpNb9YPf38IAM9TLvmz
	NBBp8VOEMNLoZvqqFHnjmKEbY/l2ieLUCU62vkRELDlFjUPkv3y1KheSZ9902wHGEjQ3edoijBK
	JJHxw9vMWlT1KVwGtKnNiS0VntENSuUxHDyKgtya4xsVdgAp0Ycfo1+cKxdn9uRtanmXnTSNffK
	fZ8
X-Google-Smtp-Source: AGHT+IHW8vXW1pHq5jdw6F9Nf8OpWRg5m0R+gCkY5lYB9YHdT4KjP1uHM7I+Sd5CFW610VwOHtD35OGMeItBvzCwX3E=
X-Received: by 2002:a05:690c:7207:b0:70e:6333:64ac with SMTP id
 00721157ae682-712c63c581bmr203206457b3.10.1750707944659; Mon, 23 Jun 2025
 12:45:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250623191048.488812-1-alperyasinak1@gmail.com>
In-Reply-To: <20250623191048.488812-1-alperyasinak1@gmail.com>
From: jan vermaete <jan.vermaete@gmail.com>
Date: Mon, 23 Jun 2025 21:45:32 +0200
X-Gm-Features: AX0GCFuYXItblU4H8z28RG9R5pIdmCRhiU9hRkhYHtmIOwEUUx3CBcCgSV3a9Tk
Message-ID: <CABF_=yia4NmdasTLkJNs+t10Z3YZL3pXkOpjN+WLw42=JyiPQw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] tk: Fix compile error
To: alperyasinak1@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 19:45:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118089

Could the variable PV not be used in the directory name to replace the
hard code version number?

Br

On Mon, Jun 23, 2025 at 9:11=E2=80=AFPM Alper Ak via lists.openembedded.org
<alperyasinak1=3Dgmail.com@lists.openembedded.org> wrote:
>
> tk9.0.1/unix/../generic/tk.h:19:10: fatal error: tcl.h: No such file or d=
irectory
> |    19 | #include <tcl.h>
> |       |          ^~~~~~~
>
> Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
> ---
>  meta-oe/recipes-devtools/tcltk/tk_9.0.1.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-oe/recipes-devtools/tcltk/tk_9.0.1.bb b/meta-oe/recipes=
-devtools/tcltk/tk_9.0.1.bb
> index 504b40927e..230a244a6b 100644
> --- a/meta-oe/recipes-devtools/tcltk/tk_9.0.1.bb
> +++ b/meta-oe/recipes-devtools/tcltk/tk_9.0.1.bb
> @@ -30,6 +30,8 @@ S =3D "${UNPACKDIR}/${BPN}${PV}"
>  # Short version format: "8.6"
>  VER =3D "${@os.path.splitext(d.getVar('PV'))[0]}"
>
> +CFLAGS +=3D "-I${STAGING_INCDIR}/tcl9.0.1/generic"
> +
>  LDFLAGS +=3D "-Wl,-rpath,${libdir}/tcltk/${PV}/lib"
>
>  inherit autotools features_check pkgconfig
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#118088): https://lists.openembedded.org/g/openembedde=
d-devel/message/118088
> Mute This Topic: https://lists.openembedded.org/mt/113794949/2167232
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [j=
an.vermaete@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
Jan Vermaete
=E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Hamel

