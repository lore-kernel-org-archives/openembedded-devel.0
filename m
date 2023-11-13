Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 683BAC4332F
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 18:47:52 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web10.3514.1699901269932478448
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Nov 2023 10:47:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ClE2H440;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-1eb7a8e9dd0so2829665fac.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 10:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699901269; x=1700506069; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/h5sjUTrFQM37CNTQzsx8+1gDC0ySXF2ia+/f+bySe8=;
        b=ClE2H440Ew4G0/qW4KfK+O6MSiMnKLrv9PcbW5PFGFPtty2n22ri9MOJXixOUscjH7
         5WnnvqjbY6j5QrOLtNo8loVTQb3IgrfM1cRwjxgMkDtE+48V1feEU72v9aPTdfr+pheC
         P5mo80KUId8mtqiW+1aNfqt8duxCtYn8QZ2eyJKfOCN06T9ray75QvSdLOdh2hiuhqYa
         mIRSjnUa+OF4HcpBHnljiXxvGpxL7EZ6XMM6TMu6xUwFkLAxMeORDlDeNj/n4jujKRBJ
         +C8OJV19j7vRlgykzrpTC5Jpga7VKRwIrfBDvuUAkkISdaj7v7Y09FsVGf3u8Brdtbm/
         /tyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699901269; x=1700506069;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/h5sjUTrFQM37CNTQzsx8+1gDC0ySXF2ia+/f+bySe8=;
        b=K9t7OaQoxivw5nZCCpdfkmV/vIjlsKKJjAQax4SrfDYbEp5nG7O4n3d0vmF+gLP3Bk
         2bI+xAV1n1X1I2EeyyLOxlHEKGe60xGc5nmkyvSpVQP5wRM9roCxDZ0F+zkTfjE3f1/3
         hMqL9hR24weEglZxZEQ3W43rzGo63MIOu4+fQyQwc4izPk4AyDb0GobRNJM0FkVoJV4o
         +58P4/nDzibbUbwyQKaInOahkbKu7AOKEkTifFALsP9tYYfiXA9D3fOsWLoBiV1Wzdgs
         5Kn1w+RQOTnMrLMaAEz/ECQEunnxAr//6K+FDF6MPoD+oJlRN5OpcmJiG7xdx+i03cDJ
         Oanw==
X-Gm-Message-State: AOJu0YywWaZWU9whcbmLXmkcudTWiP/4AwjM7PlogFctfYqhpoQEpJbD
	VVwTzGT84Jl0QXngU+M11f6UUaMW9YnZwKV6ai8=
X-Google-Smtp-Source: AGHT+IFCIPw+0i9BOgkTq6p1uu2JYu85Kx3uyzopfyev40fI1k7YV9jXgKH7cAWY2LWa2QMGwbV1MuFP7JWKtiUHzTo=
X-Received: by 2002:a05:6870:fb87:b0:1e9:bd5c:ae40 with SMTP id
 kv7-20020a056870fb8700b001e9bd5cae40mr10519620oab.38.1699901267662; Mon, 13
 Nov 2023 10:47:47 -0800 (PST)
MIME-Version: 1.0
References: <20231113115159.73164-1-alperyasinak1@gmail.com>
In-Reply-To: <20231113115159.73164-1-alperyasinak1@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 13 Nov 2023 10:47:21 -0800
Message-ID: <CAMKF1so2rWK=QJ4hp6J6ReqCHG_uUrDbNtaG_BL-BQ3KtmmrHA@mail.gmail.com>
Subject: Re: [oe] [meta-filesystems][PATCHv2] fuse-exfat: upgrade 1.3.0 -> 1.4.0
To: Alper Ak <alperyasinak1@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 18:47:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106672

v1 got applied, can you rebase this on latest master and resend please

On Mon, Nov 13, 2023 at 3:52=E2=80=AFAM Alper Ak <alperyasinak1@gmail.com> =
wrote:
>
> Changelog:
>
> * Added exfatattrib utility which prints or changes file attributes [Will
> Thompson].
> * Added FUSE 3 support. FUSE 2 continues to be supported.
> * Added support for timezone offsets [Nathan Hunsperger].
> * Fixed device opening error being reported as FS error.
> * Fixed possible data leakage when uninitialized clusters were allocated =
using
> NtSetInformationFile() call under Windows and FS was not unmounted correc=
tly.
> * Improved compatibility with autoconf 2.70.
> * Fixed disk size reading on NetBSD [Dave Vasilevsky].
> * Fixed "automounted" option handling on FreeBSD [Iouri V. Ivliev].
> * Allowed to specify the "nonempty" mount option.
> * Fixed file data contiguity handling bug which could cause performance
> degradation [noctis].
> * Fixed possible crashes on invalid UTF-8 sequences.
> * Fixed a situation when FS could be erroneously marked as dirty (not cle=
anly
> unmounted).
>
> Signed-off-by: alperak <alperyasinak1@gmail.com>
> ---
>  Dropped md5sum, no need anymore.
>
>  .../fuse-exfat/{fuse-exfat_1.3.0.bb =3D> fuse-exfat_1.4.0.bb}    | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>  rename meta-filesystems/recipes-filesystems/fuse-exfat/{fuse-exfat_1.3.0=
.bb =3D> fuse-exfat_1.4.0.bb} (83%)
>
> diff --git a/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1=
.3.0.bb b/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.4.0.=
bb
> similarity index 83%
> rename from meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.=
3.0.bb
> rename to meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.4.=
0.bb
> index ac18fe90f..48e3d7af5 100644
> --- a/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.3.0.bb
> +++ b/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.4.0.bb
> @@ -16,7 +16,6 @@ RRECOMMENDS:${PN} =3D "util-linux-mount"
>
>  inherit autotools pkgconfig
>
> -SRC_URI[md5sum] =3D "846b8c36bfa4684719f9e08e9d3a6bff"
> -SRC_URI[sha256sum] =3D "07652136064da5e4d32df5555f88c138ffa4835a23b88a5b=
ae2015f21006e0d3"
> +SRC_URI[sha256sum] =3D "a1cfedc55e0e7a12c184605aa0f0bf44b24a3fb272449b20=
b2c8bbe6edb3001e"
>
>  EXTRA_OECONF +=3D "sbindir=3D${base_sbindir}"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#106639): https://lists.openembedded.org/g/openembedde=
d-devel/message/106639
> Mute This Topic: https://lists.openembedded.org/mt/102559678/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

