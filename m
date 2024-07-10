Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6997C3DA41
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 14:47:51 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web11.16425.1720622861316929726
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jul 2024 07:47:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jgKYgvX/;
 spf=pass (domain: gmail.com, ip: 209.85.160.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-25e076f79d5so3039860fac.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Jul 2024 07:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720622860; x=1721227660; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JVeyZ+RGwuNcjjYa1/6KZuV/rc6Llt7H/+QlGfZM1+0=;
        b=jgKYgvX/q9JqvRxuKqssuZ1n2jycl5hxejTazxhoKQByMZyeIbtzHa3KGNtGpnA7x7
         3sAv2te0dXxMOxKmY8WUx0z8M8+OCQ3Q+rf1qOQsCHBABsq4W0g0yqzANZ2M66Z9oVF0
         r6nOtreKBSwoZPU8/GY1ro6+aHMHlwoDNInv7JJe6W5SsPh6VZflBhaeIIvgTT/A+1Lu
         KfntnYxhxsnmqqDOeTxpRcp2fprWrcAErN9kLW66YTKOhXEBbsJb43fI++ElDi86JoRd
         BwQ29DL+lkfSGDqWPCk9oz8CiQROHhcTxWzhcvRmViouVmAwGH5FyFCDBG3mviMoKgru
         gzxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720622860; x=1721227660;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JVeyZ+RGwuNcjjYa1/6KZuV/rc6Llt7H/+QlGfZM1+0=;
        b=nmw9NtYNO+jxw38azjtTOHbgug22LnBpzZb6YSmBFwGHXo30yfgrXW5Styh7fRvw8Z
         ugIkgri4pTUpm3ml3D864dF10KjzjE9UfqeHKL58OlfRI2bnmmjtRxqeMYsZ+ouImPeZ
         P/Z1lFf1zTvvT19HqG0a6uy7fZLqCpMOPKwXvf4a9/3hCPdny/XSkk2J25UGVog+hMMQ
         W1j5c3EDklZzBBStzHhCTNUmvYtmU2IZ5XgxJr7WEn79d8JfpUblIC4fh9usj449stRa
         6yLbojlUaSU1m6NwInzag7YKPRK0gFuZwiRLNC6OfFQmSIHT16nc8ghH+qB47NNSzA+Z
         DaMg==
X-Gm-Message-State: AOJu0YxhYCh7NnTgaRJduQ6E8+nsz2F68vdJthAeJryeXBjKG5IXOHdU
	/y+lrWd1x5fv9Yv/fIny+WIxE1DiZYm+dALWLO5GwDjWgQZrrkQRwwICo6tWaqeR+OtZMifQM1z
	U0WSz7hSw5CGuUan7KrvXw3bMK2g=
X-Google-Smtp-Source: AGHT+IGTOIa77CKyA1LqY7/oagvZNz5qZ4OOJw0ODJzIFIxlEj9BUBcO45Ibvb1d4rbx6WmOzhbup6CocRHd5PI0uu8=
X-Received: by 2002:a05:6871:5827:b0:25b:3e23:e5ef with SMTP id
 586e51a60fabf-25eae76454fmr4527724fac.3.1720622860571; Wed, 10 Jul 2024
 07:47:40 -0700 (PDT)
MIME-Version: 1.0
References: <fac02277-c377-4377-974b-0ec817b108f9@3mdeb.com>
In-Reply-To: <fac02277-c377-4377-974b-0ec817b108f9@3mdeb.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 10 Jul 2024 07:47:13 -0700
Message-ID: <CAMKF1srQFVzXoRQw4AGfAproReiJb2M_qASoaEFxkr6a8VBPZw@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH v2] meta-networking:
 recipes-support: miniocli: add
To: daniil.klimuk@3mdeb.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Jul 2024 14:47:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111301

still the patch is corrupted.

On Wed, Jul 10, 2024 at 7:32=E2=80=AFAM Danik via lists.openembedded.org
<daniil.klimuk=3D3mdeb.com@lists.openembedded.org> wrote:
>
> meta-networking: recipes-support: miniocli: add
>
> Adds CLI tool to manage MinIO S3 deployments.
>
> Signed-off-by: Daniil Klimuk <daniil.klimuk@3mdeb.com>
>
> diff --git a/meta-networking/recipes-support/miniocli/miniocli_git.bb
> b/meta-networking/recipes-support/miniocli/miniocli_git.bb
> new file mode 100644
> index 000000000000..5207acf9891c
> --- /dev/null
> +++ b/meta-networking/recipes-support/miniocli/miniocli_git.bb
> @@ -0,0 +1,20 @@
> +SUMMARY =3D "Simple and fast CLI tool to manage MinIO deployments."
> +HOMEPAGE =3D "https://min.io/docs/minio/linux/reference/minio-mc.html"
> +SECTION =3D "net"
> +
> +GO_IMPORT =3D "github.com/minio/mc"
> +
> +inherit go-mod
> +
> +LICENSE =3D "AGPL-3.0"
> +LIC_FILES_CHKSUM =3D
> "file://src/${GO_IMPORT}/LICENSE;md5=3Deb1e647870add0502f8f010b19de32af"
> +
> +SRC_URI =3D "git://${GO_IMPORT};protocol=3Dhttps;branch=3Dmaster"
> +SRCREV =3D "e7c9a733c680fe62066d24e8718f81938b4f6606"
> +
> +FILES:${PN} +=3D "${bindir}/mc"
> +
> +# MinIO CLI depends on getent which is a part of glibc-utils.
> +RDEPENDS:${PN} =3D "glibc-utils"
> +# github.com/minio/mc has some Bash scripts.
> +RDEPENDS:${PN}-dev =3D "bash"
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111300): https://lists.openembedded.org/g/openembedde=
d-devel/message/111300
> Mute This Topic: https://lists.openembedded.org/mt/107143600/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

