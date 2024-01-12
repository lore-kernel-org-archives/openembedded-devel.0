Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00183C4707C
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 22:10:25 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web11.7186.1705097423248121494
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jan 2024 14:10:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ey60XqfL;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-203fbbff863so3073362fac.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jan 2024 14:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705097422; x=1705702222; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l/VdKFzUIHDWSe0gPDwJJlzVNjHFGNGK5fW0oXpLBdw=;
        b=ey60XqfLON2L3z+dw9pyofbeFzRdgnAu29OeHE2iwH0fZ7GpX7sAXAcFK7tuTjKM+p
         F5yi9ifHV/p2GV14ZAnmjZyDqv6nM5YIel4/kvdnmYTN3syEKedi4iHjPBiTLCI9WbV4
         QbGPJS6a19k+8IrxHGGQwhCmDNjYUNafWNd2SYJr6P0lrIBF+2AsJ2YYyyCcMIaxpUon
         Co0Vuk5x5dGd/L8lT8vKSzGT38wYWsExFg9nZa72rGvLGAbXsLYNiEnN2QBY5GIKkwsg
         iIjts3zyhbWV6eRWSIP5QBxxRW6BVvrHY5Ai0kPvIzQtjvnlH/uZlhp81UBInYhQfwK7
         1wUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705097422; x=1705702222;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l/VdKFzUIHDWSe0gPDwJJlzVNjHFGNGK5fW0oXpLBdw=;
        b=RSJAznS6JuxVc4+CRgGqzv/qNncaUH9M4kJ7/Vfei91cDx0fw4nirv9zFJk44tJ7hB
         /sHkOTfbnga6a1gL4HPGIEeEcg65bVl6qLR9KgLmTBwiNs8Zu15cRP00NeAanWuZY2O1
         KDL9vXrd5hfbv/kAJnLnDxW4IPURzb5QnwG+hy6Qlh8raBMjSj+ui5YKf8IT3x58Gs56
         Y3UIeCJPfPJ9W9iEOHwT+M0yEdUzXjAvAg/YFPi32n97dK+UFR7OrSJU9UZuuYgwX2Sw
         fhAqBWtP71L7QVUrv5cH6FOPF9ZKlXgew/NB90O4dIaZ6d7MbTzb0dODjwn3H8xq0vQ2
         SACw==
X-Gm-Message-State: AOJu0YwiBdX3KurDqw+BWQ3e6LOACD7c+YT1VB+vBRhdu9YTSEYezrkn
	c8INw7WpWLMT4KHT55q9yA38Z6tABaOSUN/FAYiM1J0ZkCE=
X-Google-Smtp-Source: AGHT+IFnDwwJFVUq31K+qVPptNBki2m8Z/7mZn1RYmn9xcJGpubyYx4L7GNgmDWl10JlaGuykkxevGIzfop5FcO4ttQ=
X-Received: by 2002:a05:6871:7a2:b0:204:305c:c63e with SMTP id
 o34-20020a05687107a200b00204305cc63emr1492661oap.39.1705097422514; Fri, 12
 Jan 2024 14:10:22 -0800 (PST)
MIME-Version: 1.0
References: <20240112191004.3024700-1-derek@asterius.io>
In-Reply-To: <20240112191004.3024700-1-derek@asterius.io>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 12 Jan 2024 14:09:56 -0800
Message-ID: <CAMKF1soDBkQW+oqYV48uxa9V51zWRzJObSqHAgX+VMpQHDD4Lw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-eth-keys: update version to 0.5.0
To: Derek Straka <derek@asterius.io>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Jan 2024 22:10:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108258

On Fri, Jan 12, 2024 at 11:10=E2=80=AFAM Derek Straka <derek@asterius.io> w=
rote:
>
> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>  .../{python3-eth-keys_0.4.0.bb =3D> python3-eth-keys_0.5.0.bb}  | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-python/recipes-devtools/python/{python3-eth-keys_0.4.0.bb =
=3D> python3-eth-keys_0.5.0.bb} (59%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-eth-keys_0.4.0.b=
b b/meta-python/recipes-devtools/python/python3-eth-keys_0.5.0.bb
> similarity index 59%
> rename from meta-python/recipes-devtools/python/python3-eth-keys_0.4.0.bb
> rename to meta-python/recipes-devtools/python/python3-eth-keys_0.5.0.bb
> index b0b1aad76..aabfff1b1 100644
> --- a/meta-python/recipes-devtools/python/python3-eth-keys_0.4.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-eth-keys_0.5.0.bb
> @@ -2,9 +2,9 @@ SUMMARY =3D "A common API for Ethereum key operations wit=
h pluggable backends."
>  HOMEPAGE =3D "https://github.com/ethereum/eth-keys"
>  SECTION =3D "devel/python"
>  LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2beaef1b1764f4d6b46084c885b4b=
cad"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D6749008d847c14b9718949c2e24d5=
c0a"

What changed here ?

>
> -SRC_URI[sha256sum] =3D "7d18887483bc9b8a3fdd8e32ddcb30044b9f08fcb24a380d=
93b6eee3a5bb3216"
> +SRC_URI[sha256sum] =3D "a0abccb83f3d84322591a2c047a1e3aa52ea86b185fa3e82=
ce311d120ca2791e"
>
>  inherit pypi setuptools3
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108250): https://lists.openembedded.org/g/openembedde=
d-devel/message/108250
> Mute This Topic: https://lists.openembedded.org/mt/103689608/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

