Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D7CCC3DA6E
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 18:39:29 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.web10.5382.1704739164734332236
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jan 2024 10:39:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O4z2vWGY;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-204ec50010eso1194283fac.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 10:39:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704739164; x=1705343964; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VHgc4T8aatDa0qc4883hYTnMR4ftf30V1jJc8JIUIew=;
        b=O4z2vWGYfkCoLuyNuO6Bn9ziGkCjP+vKwM4wKyCtvsv6bE20++t6HtAny0Fwix6stp
         OGoqOcrcfW0zZGS6O8T0rFZ+y9/RmAmDFN/Qb9xZbfVlgGo4H9dXvX3vP67rw7flpZ04
         /aUPBlJzgeoNPrsR/fTiR0BAv5Zu1/DEAcPyjO1qdFRJo9Orfbkob0i5N8utRj/QL3NG
         zrEPo1f1XZPnb4ApMW4GRGrbQz9fMXtiZwJ45vwNLy0yHr7/sWUsdtv/DVmf6i6u4UHw
         fWHG7NYqhq9TjNO1tkeTLRvhY39ahHZSgIN3jZCe/7qUKPeN29cts25pLYeIofL7r1GP
         /0PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704739164; x=1705343964;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VHgc4T8aatDa0qc4883hYTnMR4ftf30V1jJc8JIUIew=;
        b=AYQQOybR2YasydGoDMs5/MncETHDMRt4EVcN6wAEiwNhXmzH6nag6fqXGnE0wzCQIA
         jzSKy8ApY0JuJoUELcjNi53fP3jFGU2uSDJOZo4NZzWKVtnHcnHmm3j8tprEfOnhTexf
         kIJ17VVDJ0StJqrLLGeSCCDfrQboAkC2/eBmLUCelyje6YTP3piRFxd0vxpy+RUNZaUr
         1yzbl5ZlmntxgJlp4oojlNnzpFpuzzgeDxzkVRFZTNjf7YHS3R4ZCL+9QiCZ58Zdi7Ko
         hr6rtJ6m3ogesF4jOcOmtin+eiIYpasmBRMCmge/8Ltp8KwBofzW7fuwOj8grwPaRsfl
         oTzA==
X-Gm-Message-State: AOJu0Ywo+20TJzsBBRN8nN71SkblN1IDHcWG5I5LD9AT/h3/2gbZB8NU
	suLXxuDrfYTZ4NHL70S/E+QLGX9FMwO6PkT1BqNu1UnHxbU=
X-Google-Smtp-Source: AGHT+IFSw2+E495feNSO5Ga+CgGvPYmLWlNafk9sRE0t0HJwz9YErBOla7q4VMEzOOG6sJH5PLqxLKDZp+NfzMWOkAE=
X-Received: by 2002:a05:6870:d0c9:b0:1fb:75b:99a0 with SMTP id
 k9-20020a056870d0c900b001fb075b99a0mr5131624oaa.79.1704739163514; Mon, 08 Jan
 2024 10:39:23 -0800 (PST)
MIME-Version: 1.0
References: <20240108135018.2967504-1-joaomarcos.costa@bootlin.com>
In-Reply-To: <20240108135018.2967504-1-joaomarcos.costa@bootlin.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 8 Jan 2024 10:38:57 -0800
Message-ID: <CAMKF1sqAdy7VaUWqtyGN0JTzTxfgY21qk9mjTi6pKLPzsnne=g@mail.gmail.com>
Subject: Re: [meta-oe][PATCH v1] iwd: upgrade 2.8 -> 2.9
To: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Cc: openembedded-devel@lists.openembedded.org, thomas.petazzoni@bootlin.com, 
	alexandre.belloni@bootlin.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 18:39:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108172

there is another patch which bumps it to 2.12 see
https://patchwork.yoctoproject.org/project/oe/patch/1704720002-29880-1-git-=
send-email-wangmy@fujitsu.com/

On Mon, Jan 8, 2024 at 5:50=E2=80=AFAM Joao Marcos Costa
<joaomarcos.costa@bootlin.com> wrote:
>
> Tested in station and access point modes, running on a iMX93 evaluation
> kit with U-Blox's Jody-W3 wireless module.
>
> ver 2.9:
>         Fix issue with handling certain FT failures.
>         Fix issue with handling user-disabled bands.
>         Fix issue with handling roam on beacon loss event.
>         Add support for PKEX configurator.
>         Add support for PKEX enrollee.
>
> Signed-off-by: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
> ---
>  meta-oe/recipes-connectivity/iwd/{iwd_2.8.bb =3D> iwd_2.9.bb} | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>  rename meta-oe/recipes-connectivity/iwd/{iwd_2.8.bb =3D> iwd_2.9.bb} (88=
%)
>
> diff --git a/meta-oe/recipes-connectivity/iwd/iwd_2.8.bb b/meta-oe/recipe=
s-connectivity/iwd/iwd_2.9.bb
> similarity index 88%
> rename from meta-oe/recipes-connectivity/iwd/iwd_2.8.bb
> rename to meta-oe/recipes-connectivity/iwd/iwd_2.9.bb
> index ee310d295..82a294909 100644
> --- a/meta-oe/recipes-connectivity/iwd/iwd_2.8.bb
> +++ b/meta-oe/recipes-connectivity/iwd/iwd_2.9.bb
> @@ -5,10 +5,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfb504b67c5033=
1fc78734fed90fb0e09"
>
>  DEPENDS =3D "ell"
>
> -SRC_URI =3D "https://www.kernel.org/pub/linux/network/wireless/${BP}.tar=
.xz \
> -           file://0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-fo=
r-e.patch \
> -           "
> -SRC_URI[sha256sum] =3D "a90e621f45b9c2f9021beea0fa6477ee0334fcd2ee34beaa=
b42e31ea0fd3be29"
> +SRC_URI =3D "https://www.kernel.org/pub/linux/network/wireless/${BP}.tar=
.xz"
> +SRC_URI[sha256sum] =3D "ec02ae5750e47204f4b91791cbab7cde670e3035f884f414=
3f6d00f400089d4c"
>
>  inherit autotools manpages pkgconfig python3native systemd
>
> --
> 2.43.0
>

