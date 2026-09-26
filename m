Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8407C98328
	for <webhook@archiver.kernel.org>; Sat, 26 Sep 2026 06:30:22 +0000 (UTC)
Received: from mail-oo2-f42.google.com (mail-oo2-f42.google.com [74.125.231.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14994.1790404213328062977
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Sep 2026 23:30:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=mtmPx1kg;
 spf=pass (domain: gmail.com, ip: 74.125.231.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oo2-f42.google.com with SMTP id 006d021491bc7-6d78c92b8f1so69704eaf.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 25 Sep 2026 23:30:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790404212; cv=none;
        d=google.com; s=arc-20260327;
        b=ZCzpv6UKGtkEUhE2O8yMVWfTyEHdc8Z3DnMTdWPajd6flRSSS66uDCAiHZ/eRJJBBI
         WKYjljlz121UvOfq4HMLLoyMwb8RWKoFyrMTXBbPYstdFzRUqBR/Hkfx07lyhhPaeJok
         TRB0ghsRM4jix5BVMd+Rg1Vs9n0ZA55A51eBfKhUO9enUTxh/Q2p7eWPJVokl/+V0hgk
         ThwvJNvasUM4jvT8dsuezZlPMzN/hzWWDVpoj0aG3C0ZwUeJTrxuTAhFbhy/mCIlF3eo
         HCeoEpJbnTQwJ9hKbNXvEYIWPRWs2k7BDz6Fk5NCt14Bej5zRXOLQKFLPMRASVYsi25r
         CMAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=003QhAeeONoMJHJ6XgHwQY2XelqOrV9aZOZB7q4E5EA=;
        fh=K8FfOEojjfw9ooM+LD1i4ltMFKj/kVaXFr4bXtObaDo=;
        b=dhV1xhUOrUqAvk+Sd5nQVyDMfEJi60LXBNsD75DFkWaqL5RFy7BOemeV6LP6rsAO9c
         +jNFdTHN3qmfxYKfGY15obHw8IJJRcW6zrzq1LOeqhDdU4Y3f3AAC0gNMRSqSf1oBzHn
         ytNUEvMFei457QRjYVcqlJQRLFI6RSXPv63Hdzqcz+p1W1TmH0eQ8ufNrI8Q8fLC5x4E
         ZVy2l3rsCW9/UATPUyVMzgTTHXZ96MaB/x+x3eobCmitYD9q3nWq8CLhfSeeQptP6mPT
         NZF7oXC0Ao2YF6J7aIzZ4SZyQMYaQWH4J+0T2ynPh7Y2DOba6HEB/sqrbT6XnFrJ+DD8
         F43g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790404212; x=1791009012; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=003QhAeeONoMJHJ6XgHwQY2XelqOrV9aZOZB7q4E5EA=;
        b=mtmPx1kg1KCcTFWggVfPyjuUKjFIlgdIo2JuvkG3QRxHAewI1iClYQ0bBs50/u74hq
         7qQJH01NQBi0VGktFK4MjTmlKJ3zA4PoWeqRfkQK45VGwJUjIOfgNxbwVeGTu9R8csrg
         TpMhYLU3YVie+OaipSWFCqv3FGHHi45UIakHl0me7nyo+Sld3k/kSUuwaWEYBduh3Q10
         axzCDb6CJtwQK3kAyNq0dPeyL1HVonRb27ZHvfH5aYAOXhJ6mfS5yNNJastkBd1EXtFu
         egP6KH/AzFPvnjoWYqbxWrLwgC7RVCJ2SrshljI56Qkfc/wHvrDiumkRCcCZPISCGTaw
         NW5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790404212; x=1791009012;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=003QhAeeONoMJHJ6XgHwQY2XelqOrV9aZOZB7q4E5EA=;
        b=mFWEprYJticLYAJyH0Fx0zpElCWGLLNa1Zu4autoEa30ZXK0xct4hx1nPfIF/LMaPX
         XB9TqkAlXWmUVEQg/TrmHtEj/V9SI15UR628rirttlo2A21IUcuHV4+/ObAdgoy4lusn
         mXuQ6TS2w+hgFyBBSRFZIO4gHnUIIwXuDNA/+se4g7tadJAewnTIay6vjoUIfHxV+fze
         Wp15BixnIs0PVuEk6Pryb+Ouf6qbykLdyDBdK9dn6Q9Ykg7LfZBywFZn9PG8DdY1KtUv
         LQKozaJUmlueq/OHPhXc6lrIsBGqHYVhtpHoqSuwLk+cWf7YCKAfXewLQ4b6kFRhC9FG
         K83Q==
X-Gm-Message-State: AFuF++l2T8ueHy/qUqxYiGvrmF3y3Z1fY75gXET9CmAURmpEEZM2xwy+
	lQuKFD6Q4GkHrHeT5Iei7tFh0nPxYA01TBU2KpfWTFzzriaJu9aMJEHXCxz3wpTRMvxfxOTBgUJ
	VIaggmXqphTRD3Dv0+gvuUispjYTD3Zc=
X-Gm-Gg: AYBFou0ZEwpIsUWD9SHUrwOmrJlrwXaBoTHIqvWewyWIOe47m0zXRAt3d5QkmYFLK8k
	7kPhSaXXooh1Fo6O6yBd6TrOspp2/fhUsRY5D7vNb5oOk6UmwTC8g9bfDUngXZ6R3nHMNzAWReI
	zK28MQfCSjxOdJCHUJUh/qmNq/if3giLDRiFLbp3gTdnMlutAMrlbmB7Fe8E1Z7VHoAK249T3ID
	u58kls64SNDqp58Mdr079Ew+bEFspk+pmtIntsA5K5rcO10ucR8yxr58cLFKt8Nn5tHHkrQX/gJ
	S+ilT7bI+OP5HEPX6H97DVfL0VXnU/zw7JkBxMSrBV7XaeRJKB5kZcG4CFchbjByYoZI3g==
X-Received: by 2002:a05:6820:f008:b0:6d7:ac25:a75b with SMTP id
 006d021491bc7-6d7ac25a836mr98226eaf.18.1790404212365; Fri, 25 Sep 2026
 23:30:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260925172316.2588209-1-leon.anavi@konsulko.com>
In-Reply-To: <20260925172316.2588209-1-leon.anavi@konsulko.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Sat, 26 Sep 2026 18:30:01 +1200
X-Gm-Features: AclHuK8nWb6bLFkwua0-Q69C3E4DIwddY0qt0X3rX-Nz7iwcz3Fbv98QpWgPeJ8
Message-ID: <CADySD0FCSKDSp-go6skuM9i67pja1zs_wxqdn9EnOFPC7VbB2g@mail.gmail.com>
Subject: Re: [meta-python][PATCH] python3-pydantic: Minor improvements
To: Leon Anavi <leon.anavi@konsulko.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Sep 2026 06:30:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130317

On Sat, Sep 26, 2026 at 5:23=E2=80=AFAM Leon Anavi <leon.anavi@konsulko.com=
> wrote:
>
> Apply minor improvements:
>
> - Do not explicitly set PV
> - Use oe.utils.trim_version('${PV}', 2) in the SRC_URI
>
> This work was sponsored by GOVCERT.LU.
>
> Suggested-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  meta-python/recipes-devtools/python/python3-pydantic_2.13.5.bb | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pydantic_2.13.5.=
bb b/meta-python/recipes-devtools/python/python3-pydantic_2.13.5.bb
> index 7c5dcdcb26..4ad7df88de 100644
> --- a/meta-python/recipes-devtools/python/python3-pydantic_2.13.5.bb
> +++ b/meta-python/recipes-devtools/python/python3-pydantic_2.13.5.bb
> @@ -12,8 +12,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D09280955509d=
1c4ca14bae02f21d49a6"
>  inherit python_hatchling ptest-python-pytest
>
>  SRCREV =3D "001dea020e0809844e5b17666432c9135a976f46"
> -PV .=3D "+git"
> -SRC_URI =3D "git://github.com/pydantic/pydantic;protocol=3Dhttps;branch=
=3Dv2.13-fixes"
> +SRC_URI =3D "git://github.com/pydantic/pydantic;protocol=3Dhttps;branch=
=3Dv${@oe.utils.trim_version('${PV}', 2)}-fixes"

Thanks for the improvements, can please also include tag in the SRC_URI

>  DEPENDS +=3D "python3-hatch-fancy-pypi-readme-native"
>
>  CVE_PRODUCT =3D "pydantic:pydantic"
> --
> 2.47.3
>

