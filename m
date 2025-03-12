Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93568C28B28
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 03:45:36 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web11.29209.1741751134719963900
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Mar 2025 20:45:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OiZzrbBM;
 spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3fa58dc37c5so262428b6e.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 20:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741751134; x=1742355934; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c6sHTafEXEwYLNhS6WcZdi/En4kqivbpfhI1IRv6uk8=;
        b=OiZzrbBMsjvDOsZn798NX7+XhvLSeOmJ/giO9P1RvszA/+rXJk+0Da1YqZgEWCZfce
         +nRu/Je/stFYD7GSqk7k9wOJ7Bk4lmjOmk+06Mtw/UUOd3D2BCzflSI2dYcsj/18iyVx
         GXMC0IqZqOIf12aObjQqQe0fajJ4zaAp3m3Qh8UpXskWSESA3eluY+ZoIPPWRI3PvL7n
         tFbNFehXqcJawKmMWrHIDZ+KIbBUn85qlBB2fSWVUWG2vZbPpXTW8himpI6mhqoTFxD5
         9mOUhWe9q0V0zo2Kj0VhDJMVissQ3UMWEK+fYeO3Ooe/INxMpNJ7GHGeWSrUzrBFPZhr
         UeWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741751134; x=1742355934;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c6sHTafEXEwYLNhS6WcZdi/En4kqivbpfhI1IRv6uk8=;
        b=YYs7TbGN+VQwxYnBzGhC5KVuX3u914luHcCRiSq62kzChT2PpsyUp1sijt660FJgcv
         gBi6wL7GRI6BTWY8wpDqsvghuJzGJg2jUahQyTGioJJ93PsLurmKr+b97Eijlo0FzK5t
         j8yn0dZmZHNsiv9i3+KAfELgrFu4KYUTdJNJeE4kdT8EYiEBvVxZcFja4ifIKkoPMyfO
         8Lu0vVkTh15G2KNxtXV4oVWBuohlJSrdZ1bMTZWFYHxlXJ8+gjZptFQ1FsAEjjcN7dKx
         oDhctUjMNiU3cYaLkB/O9NTaUy1xryLYd2hRnw/sFUdr9DHQICX43FYs6bEwo5IXE/ha
         c/BQ==
X-Gm-Message-State: AOJu0YzQIe+y7SmyKk+hm94mVFeO4w0SOt7RNz51nBG4IcEHbP4o+WgS
	j4DQ6/Ub5gIv6szV15w2GMybWPgf370Xr3R3E9COBEmfvHEyzJtSNhriPJhK+PEbIivwc7+6JsX
	cQ5NEVCAwqldu+4BLbyENDPsCIoE=
X-Gm-Gg: ASbGncvRSkB8CJT3TzxVLdk8GnKQhCuwnIAO45pjK3ALQFJg7kFMcnF+a9q3DuU/BQh
	4fiMckdz46qHZURjjO1yB8S+19SsJmpNXJlUJWZMn1YhVKphI1R1SV2mL2GyACJ9nO7kEISb29h
	NKIVN59lEt6h7+F71aVxWv/9WZ
X-Google-Smtp-Source: AGHT+IEaChjnRv9AiC+SIaaVzdLxoTsm2jbhjAUhYSrherqZbfELkv28OXjZqJ1iou3YDDw3Ob/wIuNba9QrxVXhUdA=
X-Received: by 2002:a05:6808:15a9:b0:3fa:1d22:6d28 with SMTP id
 5614622812f47-3fa2c97e2b7mr2943654b6e.18.1741751133784; Tue, 11 Mar 2025
 20:45:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250312033439.2958141-1-mingli.yu@eng.windriver.com>
In-Reply-To: <20250312033439.2958141-1-mingli.yu@eng.windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 11 Mar 2025 20:45:07 -0700
X-Gm-Features: AQ5f1Jqq9naWX1N9Xln1wY6n9_I1_PN7bxIvVWkRjvFNeeKXw7g3W5Cy0BusboU
Message-ID: <CAMKF1srf3Gs+TesLXd=oC-pL95SQq5-UBP5HREWcmaicM1N3=Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] minizip: Add new recipe
To: mingli.yu@eng.windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 03:45:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115909

its in meta-qt6, why do we want to promote it here into meta-oe ?

On Tue, Mar 11, 2025 at 8:34=E2=80=AFPM Yu, Mingli via lists.openembedded.o=
rg
<mingli.yu=3Deng.windriver.com@lists.openembedded.org> wrote:
>
> From: Mingli Yu <mingli.yu@windriver.com>
>
> minizip [1] uses zlib [2] to support compressed archives.
>
> minizip is not part of zlib, but is included in the zlib
> distribution [1] as a third-party contribution in the contrib
> directory.
>
> [1] https://github.com/madler/zlib/tree/master/contrib/minizip
> [2] https://github.com/madler/zlib/tree/master
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  meta-oe/recipes-core/minizip/minizip_1.3.1.bb | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 meta-oe/recipes-core/minizip/minizip_1.3.1.bb
>
> diff --git a/meta-oe/recipes-core/minizip/minizip_1.3.1.bb b/meta-oe/reci=
pes-core/minizip/minizip_1.3.1.bb
> new file mode 100644
> index 0000000000..c9c92ad6bd
> --- /dev/null
> +++ b/meta-oe/recipes-core/minizip/minizip_1.3.1.bb
> @@ -0,0 +1,23 @@
> +SUMMARY =3D "Minizip Compression Library"
> +DESCRIPTION =3D "Minizip is a general-purpose, patent-free, lossless dat=
a compression \
> +library which is used by many different programs."
> +HOMEPAGE =3D "http://www.winimage.com/zLibDll/minizip.html"
> +SECTION =3D "libs"
> +LICENSE =3D "Zlib"
> +LIC_FILES_CHKSUM =3D "file://zip.h;beginline=3D14;endline=3D30;md5=3D8ea=
a8535a3a1a2296b303f40f75385e7"
> +
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/libpng/zlib/${PV}/zlib-${PV}.tar.gz"
> +UPSTREAM_CHECK_URI =3D "http://zlib.net/"
> +
> +S =3D "${WORKDIR}/zlib-${PV}/contrib/minizip"
> +
> +SRC_URI[sha256sum] =3D "9a93b2b7dfdac77ceba5a558a580e74667dd6fede4585b91=
eefb60f03b72df23"
> +
> +PACKAGECONFIG ??=3D "demos"
> +PACKAGECONFIG[demos] =3D "--enable-demos=3Dyes,,,"
> +
> +DEPENDS =3D "zlib"
> +
> +inherit autotools
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#115908): https://lists.openembedded.org/g/openembedde=
d-devel/message/115908
> Mute This Topic: https://lists.openembedded.org/mt/111654243/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

