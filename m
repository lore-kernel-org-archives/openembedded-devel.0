Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web10.750.1588397238545866159
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 May 2020 22:27:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HthNf5DD;
 spf=pass (domain: gmail.com, ip: 209.85.160.195, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f195.google.com with SMTP id x12so9620664qts.9
        for <openembedded-devel@lists.openembedded.org>; Fri, 01 May 2020 22:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=tCTgG+n0kxd6tYE3SPmbiot5IzvG9RlzjVN5e5rwkZc=;
        b=HthNf5DDw/Lyr6fAPAPEna930guPFCWyPRXDrRxfcdRqQ18VPLy+cFhBYLPk1KLn5h
         KcY1MF60W+qGfNyyrbTj+KemMfWp0RCUKDO5ikv7SN8QtRff/ZMYRt4aIaXCc7Gaey3H
         nMi2lh5L+Bu7Xyv7InRxU69ivR/KhtLdjht6UKmBioFca+Xu0LieSYclfwQ9euGVqAV8
         1hQ4b4nd+OZ5tGI4vlQW4a3wSveViS4hY/eteHg80M8PfkKrMdL/aVLAXNpCaUu03Awp
         Frdk8bTiSocsOZdcOrVSQOJhdmhQSZUsQom25lJNwp4G+ChW+/RaGd+34moL38Tqh/uQ
         3XGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=tCTgG+n0kxd6tYE3SPmbiot5IzvG9RlzjVN5e5rwkZc=;
        b=dBpi2kaYMrVYPBhjPMM7AyPk4Dua5svu0IBt9yggYlJrl7Ale9rT6OLbq80DmaLmqQ
         BUPqISEtx1aoeJmR5QUddk20V5po+Yz3ZM3MMFpBmLzmHChD5y9RREZL4A8I/vSy7hT0
         eyhTfx/xWEQX32jp0OXD6WAQrdc0cmg5DV32RANRkdCSy2mM49tn25V51nBdzywv43y3
         L4UKQKqJ4vyn1zqoEn8J9L1tF/L/0gUn24A3SKvLU/4Sq6oKQ+AXZQB76IwMWzuX4iCM
         MRR9EyzJNEcQpqc6TfArbp/vxPWf46gvftO+Xljp2qTpERm4C+xpoBTiUPleDpb7dlX9
         sFJg==
X-Gm-Message-State: AGi0Puaf8pAAZ1mIYXEB10Iy/nv38mrnuzdMZx2xP+cTCR5fHCdYBQ+6
	rOHJTDzhsjEaCEXErkF2nj+mLOdQg/B+0/YpQM581mo5AvQ=
X-Google-Smtp-Source: APiQypLld8QLEcouuyB23ZIEJOoj16JihbzCSkiYW/faAI/7KlrAEmi7E5jjS8QdS2irvgtgz2EtrkuYqAg5nbn/H5s=
X-Received: by 2002:ac8:4e8d:: with SMTP id 13mr7071589qtp.293.1588397237396;
 Fri, 01 May 2020 22:27:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200501113534.16030-1-schnitzeltony@gmail.com> <20200501113534.16030-2-schnitzeltony@gmail.com>
In-Reply-To: <20200501113534.16030-2-schnitzeltony@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 1 May 2020 22:26:51 -0700
Message-ID: <CAMKF1sqAMsnsTqMrn_EGnL8J5qYrzD6N2rdnJcPY_uNhmS8pfA@mail.gmail.com>
Subject: Re: [oe] [PATCH 02/10] file-roller: upgrade 3.32.4 -> 3.32.5
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

fails in fetch

https://errors.yoctoproject.org/Errors/Details/409857/

On Fri, May 1, 2020 at 4:35 AM Andreas M?ller <schnitzeltony@gmail.com> wr=
ote:
>
> version 3.32.5
> --------------
>
>  Bugs fixed:
>
>   * libarchive: do not follow external links when extracting files.
>   * libarchive: overwrite symbolic links as well if requested by the use=
r.
>
>  New or updated application translations:
>
>   * Kurdish (Sorani) (Jwtiyar Nariman)
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  .../file-roller/{file-roller_3.32.4.bb =3D> file-roller_3.32.5.bb}  | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename meta-gnome/recipes-gnome/file-roller/{file-roller_3.32.4.bb =3D>=
 file-roller_3.32.5.bb} (100%)
>
> diff --git a/meta-gnome/recipes-gnome/file-roller/file-roller_3.32.4.bb =
b/meta-gnome/recipes-gnome/file-roller/file-roller_3.32.5.bb
> similarity index 100%
> rename from meta-gnome/recipes-gnome/file-roller/file-roller_3.32.4.bb
> rename to meta-gnome/recipes-gnome/file-roller/file-roller_3.32.5.bb
> --
> 2.21.1
>
>=20
