Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FF98EB64DA
	for <webhook@archiver.kernel.org>; Sun,  2 Jul 2023 15:54:36 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.web11.8169.1688313273175263575
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Jul 2023 08:54:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=OSlh90Vl;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-1b06a46e1a9so3270337fac.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 02 Jul 2023 08:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688313272; x=1690905272;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oljajSBihcY67GPZq+GRlKRCe3E6A1gF1c6Xde97xR0=;
        b=OSlh90Vlxn93E+76QhDeyQsbfHz9y6b8AhcYLoV6xc1dYRFv/1AfR60x8zQf+1IcNV
         OQejh/7bQ2SicZo8mk8S1zY3mDtT3Yr4Z04yLy/gnpg+WKsZLGr9erZSElE0cAs76o9K
         fJcUG9yU9RPRtanIPSrHgmFDjuYW0O0tVjtSDZ7NfGoAtFuHr7MKC5oA6YHZp3fOrSik
         XFj6J3UlxuOHOD+CHyu67Vi1Gu6YTzIsu9WReB4GwCo4Vz4DSRnLZ4STxERk4hsKzT6u
         +7tNsdwNyIV8y2Zy9IHoXoIUcyZUx9A08Al/ZN4GfGmrWm3g4QZ8x9oBT87UDlGeJPbU
         T2HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688313272; x=1690905272;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oljajSBihcY67GPZq+GRlKRCe3E6A1gF1c6Xde97xR0=;
        b=Qv9W7SzrI0s3+2y9KtQNc9+UT9h1YbJX4n5qHxhw4PdKDSutb9CkIhLyRh2hrdgZIL
         ugDX39M/3qK7fe5RkxcGNJcNZ3Ik/Cbt6lVlCEjLK+ShcKNPYRBz2CQwRAbfaZmskfyl
         d/wJR9/twDs4gOGsw05q7q+Gll0ddCNgicDoGHINbCE7wfleKjJDgrP9cxKgRVI9Avz8
         CdVyt3Cf7Si6+hsbAOMuzG4SVhhgKi7zB+2Rp0cnWwaDUe/8/3uaShQV1MUbrwFIJWf8
         m0v7P8p/L6BJsATDO2BTiU55SSbEbTKqn+HJlHMlXSNXuCGJ3+qwCcXiyenri/J5RrSh
         WuLg==
X-Gm-Message-State: AC+VfDxAa8/wF5TD6zpiXy0De4RXkJxHM91XyscfntTzFhBzuysLgtXe
	5oMDHhNxQ0GJPSZGBwN41HGBnItAFhutSjERKCQ=
X-Google-Smtp-Source: ACHHUZ4eD0WXhj3Jk397oCzCE1LWCowokCpt6xWqChIwm+VqCSW7N60BMSzaVevVTBLdoTrH6ZwmE6Gm7cLrHjl+16k=
X-Received: by 2002:a54:4796:0:b0:3a1:f0dc:def3 with SMTP id
 o22-20020a544796000000b003a1f0dcdef3mr6364508oic.41.1688313272229; Sun, 02
 Jul 2023 08:54:32 -0700 (PDT)
MIME-Version: 1.0
References: <58ea60fc-5580-0bb6-edb5-6d403c5900a9@gmail.com>
In-Reply-To: <58ea60fc-5580-0bb6-edb5-6d403c5900a9@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 2 Jul 2023 08:54:06 -0700
Message-ID: <CAMKF1spS8A7_my5dZ=_FrLKvvgiLrcM7Wn7dpp6=XorPSEcVOw@mail.gmail.com>
Subject: Re: mickledore merge request: July 2nd
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 02 Jul 2023 15:54:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103651

merged now thanks Armin.

On Sun, Jul 2, 2023 at 8:10=E2=80=AFAM akuster808 <akuster808@gmail.com> wr=
ote:
>
> The following changes since commit 5a01ab461c9bcabcbb2298236602373948f8f0=
73:
>
>    wireshark: CVE-2023-2952 XRA dissector infinite loop (2023-06-17
> 13:15:57 -0400)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded mickledore-next
>
> for you to fetch changes up to d71a08b3d8fc69d3213c10885af9cc693056a8bd:
>
>    mbedtls: upgrade 2.28.2 -> 2.28.3 (2023-06-28 16:28:35 -0400)
>
> ----------------------------------------------------------------
> Hitendra Prajapati (1):
>        wireshark: Fix Multiple CVEs
>
> Joe Slater (1):
>        python3-sqlparse: fix CVE-2023-30608
>
> Polampalli, Archana (1):
>        tcpreplay: upgrade 4.4.3 -> 4.4.4
>
> Sandeep Gundlupet Raju 837 (1):
>        opencv: Revert fix runtime dependencies
>
> Soumya via (1):
>        opencv: Fix for CVE-2023-2617
>
> Wang Mingyu (1):
>        python3-django: upgrade 4.1.7 -> 4.2.1
>
> Yi Zhao (2):
>        frr: upgrade 8.4.2 -> 8.4.4
>        mbedtls: upgrade 2.28.2 -> 2.28.3
>
>   .../mbedtls/{mbedtls_2.28.2.bb =3D> mbedtls_2.28.3.bb} |   8 +-
>   .../recipes-protocols/frr/{frr_8.4.2.bb =3D> frr_8.4.4.bb} |   2 +-
>   .../tcpreplay/{tcpreplay_4.4.3.bb =3D> tcpreplay_4.4.4.bb} |   2 +-
>   .../recipes-support/wireshark/files/CVE-2023-0666.patch         | 122
> ++++++++++++++++++++++++++++
>   .../recipes-support/wireshark/files/CVE-2023-0667.patch         | 66
> +++++++++++++++
>   .../recipes-support/wireshark/files/CVE-2023-0668.patch         | 33
> ++++++++
>   meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb   | 3 +
>   meta-oe/recipes-support/opencv/opencv/CVE-2023-2617.patch       | 88
> ++++++++++++++++++++
>   meta-oe/recipes-support/opencv/opencv_4.7.0.bb                  | 3 +-
>   .../python/{python3-django_4.1.7.bb =3D> python3-django_4.2.1.bb} |   2=
 +-
>   .../python/python3-sqlparse/CVE-2023-30608.patch                | 51
> ++++++++++++
>   meta-python/recipes-devtools/python/python3-sqlparse_0.4.3.bb   | 1 +
>   12 files changed, 376 insertions(+), 5 deletions(-)
>   rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_2.28.2.bb
> =3D> mbedtls_2.28.3.bb} (93%)
>   rename meta-networking/recipes-protocols/frr/{frr_8.4.2.bb =3D>
> frr_8.4.4.bb} (98%)
>   rename meta-networking/recipes-support/tcpreplay/{tcpreplay_4.4.3.bb
> =3D> tcpreplay_4.4.4.bb} (88%)
>   create mode 100644
> meta-networking/recipes-support/wireshark/files/CVE-2023-0666.patch
>   create mode 100644
> meta-networking/recipes-support/wireshark/files/CVE-2023-0667.patch
>   create mode 100644
> meta-networking/recipes-support/wireshark/files/CVE-2023-0668.patch
>   create mode 100644
> meta-oe/recipes-support/opencv/opencv/CVE-2023-2617.patch
>   rename meta-python/recipes-devtools/python/{python3-django_4.1.7.bb =3D=
>
> python3-django_4.2.1.bb} (58%)
>   create mode 100644
> meta-python/recipes-devtools/python/python3-sqlparse/CVE-2023-30608.patch
>

