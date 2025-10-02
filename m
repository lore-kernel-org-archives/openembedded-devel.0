Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B7AECAC5B0
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 17:11:09 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web11.14626.1759425068094764062
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Oct 2025 10:11:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ghzf4JCD;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-330d1565844so853000fac.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 10:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759425067; x=1760029867; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SljB1G73zrN9MCeTaN7kl6JAA8As4aezWkJCK+GIFTo=;
        b=Ghzf4JCDN53svVMYBIxiRmLN8N2lNDwOAQUubfwBeabQOiE5QAau9R1OHwvgolfGeL
         eJvvshJD+3C7CxhzgSeoqktVclX0nOW1/IdVMdRahFPoxnFJ82zp7fK0Jc1yPfhddoeo
         uxjgdyqGTTKNVT/9aXUDDfdPpuKm58pLOLdkY/ivOLsFnKppnUqiKCrJlzAopHDZCdbX
         3TMNylIBT2eMz0IkL/OGVJgt+X0uIeJcG7UrQ/NQuI+yZ1j0V1rP8TEX4TCMMdlZG8mI
         JZsaMkA5F0gP+hXFJB1b2b3O5I0+N/wpyO2ePCSxMVza1jvGbFs/eAWqJQt2oItfqKuU
         6xnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759425067; x=1760029867;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SljB1G73zrN9MCeTaN7kl6JAA8As4aezWkJCK+GIFTo=;
        b=QE2XPfpk3mh747KbKLUtWi2ChnV3ebXBL0rEPbgFYfZxm9koEbLjnMf45tfBl7mgUW
         fUVa4Ugg+B3ANgjODjHuJSQeHncVskYGNOtllLK2xE/wwGAgKBybsdXzLEYQ8RHFikFU
         KNp3r+8egQqIWPqYzSRhQjs81TsduGyORNbjOIooB/avcSh9dGqu5FkBozeH7qcamQa6
         bWypBNDv8ItCyBJwscCgARhAjSbI0Rj7MsnMRdQW1CibmrJp5nHL74i8mRMjnVv2iDkL
         4QVdGQd8znxsdyta0HvkWaUJdNBO26oyqw+BxubPwAizXOY64Fs6kC0WshRRl8NAx/6Y
         EGEQ==
X-Gm-Message-State: AOJu0YxAsaJ3X27ko2XrZpWqoDuBcWHquAlOdO5OnIuujCmgI0y6qFPg
	QTrPI8BAl1U2bG8T7A1RZRVI+Wh0CyyTDF5bj+LuuWiFrFsxM14ZWx6Kj4LzXhON0NB6H6P7LoO
	B4sdfVc5j9aKrBgpRJf17grrBT1938SyqUQLS
X-Gm-Gg: ASbGncu1ngn3Nvq95E5v+QTCHV5B/umxhiGme3RbAmxlg1tIEE2X/wdYPBeVP3hu7xX
	IcqdHuXSXQNqEGosYvm2zFHZsctA9/6D799FYLGGaEozZEHVeuOhSK5h8beKhS5MIgirqraRlWi
	JtI07PEodEksW2DIAcox4HueTqXAh5cstp9SDyEDcAmjmTmB+ui9RW/ysSsJhwvyrrRJfLlCv2e
	DNDeTBTAGGuj9fGaYbtWt0rY4a9M5yRciVwKbqM09pFrozUGSVgLXAEmF59MCsAcaByDhiz77+F
	csZ+5rXcQh4vn6dw7SL4waWCsyuyR1VHHDXKwKQ8a/S97FdwuPw3UAYeuNrUTEehngERREOlt6a
	kqbfyAQ==
X-Google-Smtp-Source: AGHT+IHKyL+3E6KTEk5RJIaUVKfJpTlGuNnrlKZX43Urh+swXkENX3+cjfiC2UPXdgH8fk7pxxXJkKHFWJhf+Nr/UHs=
X-Received: by 2002:a53:c646:0:b0:636:1985:56c0 with SMTP id
 956f58d0204a3-63b6ff8527emr7871724d50.39.1759424558568; Thu, 02 Oct 2025
 10:02:38 -0700 (PDT)
MIME-Version: 1.0
References: <20251002125926.2624522-1-skandigraun@gmail.com> <20251002125926.2624522-9-skandigraun@gmail.com>
In-Reply-To: <20251002125926.2624522-9-skandigraun@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 2 Oct 2025 10:02:11 -0700
X-Gm-Features: AS18NWAAF6VgBOIiHqwK2MsVIbgRuvd5elFonWIeSxSGtp--ug5gTbrXIHn6KoY
Message-ID: <CAMKF1spod2Csu2y1qwJ=aCwBszbShkMFkzutYyWtanjpozoEug@mail.gmail.com>
Subject: Re: [oe] [meta-oe][kirkstone][PATCH 08/26] ne10: append +git instead
 of gitr+
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 17:11:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120205

On Thu, Oct 2, 2025 at 6:00=E2=80=AFAM Gyorgy Sarvari via
lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
wrote:
>
> From: Martin Jansa <martin.jansa@gmail.com>
>
> * looks like a typo introduced in:
>   https://git.openembedded.org/meta-openembedded/commit/?id=3D6e431331d18=
ded23a78e238ed40d03434e7719d9
> * use +git as most other recipes are using
>
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> (cherry picked from commit 10703e5c6a51ef14b357c5c2021979ecedcaeb13)
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  meta-oe/recipes-support/ne10/ne10_1.2.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-support/ne10/ne10_1.2.1.bb b/meta-oe/recipes=
-support/ne10/ne10_1.2.1.bb
> index 0e16b15c97..9d0db23bf8 100644
> --- a/meta-oe/recipes-support/ne10/ne10_1.2.1.bb
> +++ b/meta-oe/recipes-support/ne10/ne10_1.2.1.bb
> @@ -11,7 +11,7 @@ SRC_URI =3D "git://github.com/projectNe10/Ne10.git;bran=
ch=3Dmaster;protocol=3Dhttps \
>  SRCREV =3D "18c4c982a595dad069cd8df4932aefb1d257591f"
>
>  S =3D "${WORKDIR}/git"
> -PV .=3D "gitr+${SRCPV}"
> +PV .=3D "+git${SRCPV}"

Please check if this sorts in increasing order as expected

>
>  inherit cmake
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#120177): https://lists.openembedded.org/g/openembedde=
d-devel/message/120177
> Mute This Topic: https://lists.openembedded.org/mt/115551534/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

