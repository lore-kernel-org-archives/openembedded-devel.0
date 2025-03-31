Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4547C36014
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 20:09:26 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web10.2442.1743451760686280282
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Mar 2025 13:09:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S2hZaUdE;
 spf=pass (domain: gmail.com, ip: 209.85.210.45, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-72bbc03d436so3022003a34.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 13:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743451760; x=1744056560; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+akVA0EsWjb2dooLg1rbdQntj3+hOpup+mIifDn9+7M=;
        b=S2hZaUdEJPkmQGNsTnsNrl+oiPh9XoWy9uYlzSjnS9zvI9+Uuc1EQlPyaSOVacj//+
         TkNooh1V14YS6G7cA03ydhVxXPYP/ZfwdQbaPEA98I5UtE37lRq48wGLzCZg/UJcAE7U
         CaNnejsgYoOerEfTKCaALJrxOFO0EvgzdfTwgFuEs9UumdGwkMtvcMFtT+DC+EcZw+ZW
         xmz6Yu6do4CSmsT8iQ9L/4v0nqlXZgnmVr+5QJcWHFiZqesl2zqRQY+lCpxHWA+kNhoY
         Ve3dtfTnX3kFVASIP67aLz+J0XqCnpXl1BWERPjFFsiTUj4u8gcykOdX10wAEEy4Oqna
         G3bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743451760; x=1744056560;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+akVA0EsWjb2dooLg1rbdQntj3+hOpup+mIifDn9+7M=;
        b=kBVRPBeGZK0pNwD+NEiyjNYStZRmM1SvKYoS/R9ayEMiV0gpRgOEXL8zPau74iaiXM
         Q8D/Yu2Z8gzuwnLsDJ3uRClKIzlCRNd/DEw5cjajseIreVG1N2lBozOCUWiT/5m8BnlO
         l1PxBZq5YWHxX7mHEBoqccU/Pgkhv+LAPPe2yAmRf/NM4aSNeDBC2sagNmZQBr3BBqST
         sefvKbYnnYKYbMii6qqJOHjtxWYxhNTZTrCdN3tvUg1Ujjdltc3stQSds7qPyVGVJ5xE
         ndDfB4YL0Frjaww/0u4VEkMPMIfOrVeFumXEGFIZjZI6bKkJK7lBCNDiRZvnbIy558tg
         ISIA==
X-Gm-Message-State: AOJu0YxP45a5uZ7/HhswYgXPGk8Pw0yaQJMmr0i5Xm24iCb7CBd9SHfX
	J4K9lBZVl1N7twNMjYpGcl7tgnQwSnPgOLooh+BI7D67mcoVPsLx7IND6rgzopnKKfP63rZhkmv
	3AIlpm6mz6Y3ClFcrOB3KoGXoSwo=
X-Gm-Gg: ASbGncsymIC+9pSBaN6msVxJfZIAEaJlClARDwCTo2tRiQM7hwJcB9qC2O/q9TaErlt
	bcw8uJXyOq8XcPDVtEOm6z4YxwtDt4gCdi3arqIVUYQ5AKK0c1+TM5hX23aaFt7ajQSe6Kt1kKY
	j170nqyPKDZapIqjKJ5nvJBQPz
X-Google-Smtp-Source: AGHT+IFK0xFsWbCJ5LSj+VYJYYHzCucbvvNC+5aClHhNOyZ9nl51ri3NpKSySs3OrmJ6NAqOuDPNuFNikBYjamMF8Dg=
X-Received: by 2002:a05:6830:620c:b0:72a:1ec6:d47b with SMTP id
 46e09a7af769-72dae738b82mr375448a34.22.1743451759789; Mon, 31 Mar 2025
 13:09:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250331094632.2373216-1-mingli.yu@eng.windriver.com>
In-Reply-To: <20250331094632.2373216-1-mingli.yu@eng.windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 31 Mar 2025 13:08:54 -0700
X-Gm-Features: AQ5f1JqG4dD50c4MSOIWC8VaR9zgcVILrHm3aqUGGHvifRoTsJzAJ4j7QpmaLIc
Message-ID: <CAMKF1spGaanZEkvH550Hgxno+vspkeTO+_swQkY5PDktzYGp_Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2 1/3] minizip-ng: Add new recipe
To: mingli.yu@eng.windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 20:09:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116435

fails with clang - https://errors.yoctoproject.org/Errors/Details/850095/

On Mon, Mar 31, 2025 at 2:46=E2=80=AFAM Yu, Mingli via lists.openembedded.o=
rg
<mingli.yu=3Deng.windriver.com@lists.openembedded.org> wrote:
>
> From: Mingli Yu <mingli.yu@windriver.com>
>
> minizip-ng is a zip manipulation library written in C that is supported
> on Windows, macOS, and Linux.
>
> minizip-ng has new features and bug fixes compared to the original librar=
y
> minizip [1] which had not been maintained for a long period of time.
>
> [1] https://github.com/madler/zlib/tree/master/contrib/minizip
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  .../minizip-ng/minizip-ng_4.0.8.bb            | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 meta-oe/recipes-core/minizip-ng/minizip-ng_4.0.8.bb
>
> diff --git a/meta-oe/recipes-core/minizip-ng/minizip-ng_4.0.8.bb b/meta-o=
e/recipes-core/minizip-ng/minizip-ng_4.0.8.bb
> new file mode 100644
> index 0000000000..90882a1e58
> --- /dev/null
> +++ b/meta-oe/recipes-core/minizip-ng/minizip-ng_4.0.8.bb
> @@ -0,0 +1,34 @@
> +SUMMARY =3D "Zlib manipulation Library"
> +DESCRIPTION =3D "minizip-ng is a zip manipulation library written in C t=
hat is supported \
> +on Windows, macOS, and Linux."
> +HOMEPAGE =3D "https://github.com/zlib-ng/minizip-ng"
> +SECTION =3D "libs"
> +LICENSE =3D "Zlib"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D36964f044224efeedd694983c34e7=
16f"
> +
> +SRC_URI =3D "git://github.com/zlib-ng/minizip-ng.git;protocol=3Dhttps;br=
anch=3Dmaster"
> +
> +SRCREV =3D "55db144e03027b43263e5ebcb599bf0878ba58de"
> +
> +S =3D "${WORKDIR}/git"
> +
> +RCONFLICTS:${PN} +=3D "minizip"
> +
> +DEPENDS =3D "xz openssl bzip2"
> +
> +inherit cmake pkgconfig
> +
> +EXTRA_OECMAKE =3D "-DMZ_FORCE_FETCH_LIBS=3DOFF \
> +                 -DBUILD_SHARED_LIBS=3DON \
> +"
> +
> +PACKAGECONFIG ??=3D "zlib"
> +PACKAGECONFIG[zlib] =3D "-DMZ_ZLIB=3DON,-DMZ_ZLIB=3DOFF, zlib"
> +PACKAGECONFIG[zlib-ng] =3D "-DMZ_ZLIB=3DON,-DMZ_ZLIB=3DOFF, zlib-ng"
> +
> +
> +do_install:append () {
> +    # remove absolute paths
> +    sed -i -e 's|${RECIPE_SYSROOT}||g' ${D}${libdir}/cmake/minizip/miniz=
ip.cmake
> +}
> +
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116428): https://lists.openembedded.org/g/openembedde=
d-devel/message/116428
> Mute This Topic: https://lists.openembedded.org/mt/112001051/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

