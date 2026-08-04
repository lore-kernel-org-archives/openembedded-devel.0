Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63A03C55184
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 00:24:31 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6540.1785803066612776276
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2026 17:24:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=jb07ng5s;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-44aeefa1c00so363164fac.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 Aug 2026 17:24:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785803066; cv=none;
        d=google.com; s=arc-20260327;
        b=bdvhHNlEGhyxsd1YKGeIkTox4UmxgqxJ/l/PmrxwmeGgitR+2mVy+rLGHJUBEKGtlk
         z7bOesXkiMjj32v4O8aXZGw4m5WQjbihv5GyzX6hRwojv0336iNgnQ1IWK+IOJ5Bcf9X
         UTCPH3SCxOXepRdqM0t3uzMRmnXCzKn6xD0atALdoBMX5SvHcw05f72ffD4afytgPNKD
         0im8YQF3d47ks9Tj0r6Pl8PEanYdQ0q28TlJXYNeZ/oLnc/x1ysgbGAH5mbyXiLWQrJm
         cwiQzRJ7/AEUi7o6zH85a30Mga3w56OnFOdy+kI/dFEAKyVZ5mksKwkaxIkzi5RP56LU
         VOMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=H9UL/fnDvr/NnpDoxnYKpay7FG55E/EYaPMGoObloF8=;
        fh=kqtH9RvdTS8z4R7bH+N1q4tJTvX5kZFkdgAseXKYH84=;
        b=lD3wAT+vqaMziyccf2S0ZFyJ3YGC8ON0bySb82AD5DtsnvWyoKu6ZOKGuXLVrau+HI
         La8iTV3vL9SeFd3ndGNvXuMCz1l1yKmxzTTv4KLUgB4qyz+QRfTLEnBphiVEVopYeE8s
         +jYxbMVyGI+V9Epcxc5Gs/4T0faEc2iyjGAFafqGcVzKMp/6+gNR5D8xlA1gWK8ASLSe
         +nW9nFMV6GYH9a4kLge5EisjDcS4AuSN60LoavGuLXWRE9hsGUrDx8rCwEByBwF8DrPg
         n5hVNxhkdW4qboGxWRA1+Q4v3i8h1KWCPXlUeevmLSBgptB9C+dwLTdCTryifRzYxkD6
         uSiA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785803066; x=1786407866; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=H9UL/fnDvr/NnpDoxnYKpay7FG55E/EYaPMGoObloF8=;
        b=jb07ng5sZVFhZX1TobKkip3eZ9xNMceXi6eMD8DGylcrRu5d41IuGbEGKUq1FQL1xR
         8vOofxmoMfXb8rQeQgrXLFb7Oi5JuGUgm1O8yx2CAGTKGE/ZPRtfZ/TmnZk8ZJVVh6El
         TQ4alBOpo3qfU91I8I9wOEMw3noL5mkO6s8nofGd8v9z61TRavElgG/wlu7f+3f7OcJN
         4W3U0lBxR8e8aRzftjHKdr0QEjXRP8krfCDdcVtVpBUcsqyGd6HPiEMjSxosDOX3ZwRj
         0T4manU+s1o0RXB7hCqt76bvAbLT4gYSzLN8HHp7F5vjRIZKmAe/VGkLquR4EwQgG77L
         GVXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785803066; x=1786407866;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H9UL/fnDvr/NnpDoxnYKpay7FG55E/EYaPMGoObloF8=;
        b=SC8e86cK7eQVasDVileTW2GRgeTvKEf90p5PE6SrzDa7wMIRkkCrrNtImWJBsiPztl
         SDMeWSWGaPTb/yW5liUwfDql0kzGOv21PeFf86knMb1+1mBfXINIcBarJDesTN3YWfYS
         MNaBIEx6LQB2qvluyXt3IcyelBAMotRiNXjlF7Y2fTl/G2Q6o1HI4+Jm6t6ff7JSrFlo
         snRlLJDw+9zGWgZ8241xW0852zanQ2lQbNq1pMt+tKRlun2S2a6CVkA7902oeaEbY1hz
         kawvtt4eeXlOSGc5bgyesDzyK7xHJi/Z9fC52x4jVczY8IKvm3VDU1MVxX1WpCQEy4nV
         c70g==
X-Gm-Message-State: AOJu0Yy3QLS3kbiquXlJF3Wf/1XHaVo/tqks82eGqZ1rgaf1ueRndddc
	AbCX1NXngMYsXtFRkSUKy6yYFWpsuBty7tEdZa8d3pG3lQpKDIlOxzmJraXJCZR61bLGXnC/YWq
	GeVr+YHAkWFeB0wND3sVWHY4/b8JeQLzn6A9P
X-Gm-Gg: AR+sD12eRIBBaSZqtwIzvZBAPjfLtzNck+01H8+FkLSEOmEJxtiS8z2CIPcfwYtYnz0
	0Bog9Vkho53MV+UQyNaBmqdFY/cNZUM/DqHQbaIGM1NZyhfDaBVdGTou0uGQmcAGZ3Ri5I00oKF
	E9HFj3Mm0qlgCicdSeowd/z+wPz3wDRNQhUkvrnPz8xPEbOMDhNqzGcBDMdWmwSBIe1Q8WaYb23
	j9+3KRA+uAKJRgm1WhT7MmJ9KeyUxceJPfwRlCQZN4hszb8YvQ/E9y5icaZKO/2s9vMfh/FE6Kj
	nEhoNXtrBI42QvD9jy9o3GgfFQ7jRegY+s/hq2G+kw6lssU=
X-Received: by 2002:a05:6870:d40f:b0:43b:c04f:7a11 with SMTP id
 586e51a60fabf-45978ad4a9fmr2626122fac.4.1785803065711; Mon, 03 Aug 2026
 17:24:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260803112055.3926085-1-ankur.tyagi85@gmail.com>
 <20260803112055.3926085-2-ankur.tyagi85@gmail.com> <CAMKF1srBrKe=4Qw0EQKJ11eT2Y6rKSEwia68JQo2RL9yrpSwzQ@mail.gmail.com>
In-Reply-To: <CAMKF1srBrKe=4Qw0EQKJ11eT2Y6rKSEwia68JQo2RL9yrpSwzQ@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Tue, 4 Aug 2026 12:24:13 +1200
X-Gm-Features: AUfX_mzNytp9qASyiggLnCIt5mlaf48kA4Hx9vyXwR0r6FrrPsDAPKM-LG0kYl0
Message-ID: <CADySD0H52Gdg41po1T0=2eOnVR83g-ytS=hHJG4KF6Bf6L9TyA@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH 2/6] gtkwave: upgrade 3.3.127 -> 3.3.128
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 00:24:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128700

On Tue, Aug 4, 2026 at 4:03=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote:
>
>
>
> On Mon, Aug 3, 2026 at 4:21=E2=80=AFAM Ankur Tyagi via lists.openembedded=
.org <ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
>>
>> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>>
>> License-Update: update md5sum
>
>
> we need to mention what is the reason for the checksum update.

Ok, I will send v2 with additional information

>
>>
>>
>> Changelog:
>> - Hurd compile fix.
>> - Update lz4 to 1.10.0.
>>
>> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
>> ---
>>  .../gtkwave/{gtkwave_3.3.127.bb =3D> gtkwave_3.3.128.bb}        | 4 ++-=
-
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>  rename meta-oe/recipes-graphics/gtkwave/{gtkwave_3.3.127.bb =3D> gtkwav=
e_3.3.128.bb} (89%)
>>
>> diff --git a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.127.bb b/meta-=
oe/recipes-graphics/gtkwave/gtkwave_3.3.128.bb
>> similarity index 89%
>> rename from meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.127.bb
>> rename to meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.128.bb
>> index 774a30e1a4..62ffafe08d 100644
>> --- a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.127.bb
>> +++ b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.128.bb
>> @@ -3,10 +3,10 @@ DESCRIPTION =3D "gtkwave is a viewer for VCD (Value Ch=
ange Dump) files which are u
>>  HOMEPAGE =3D "http://gtkwave.sourceforge.net/"
>>
>>  LICENSE =3D "GPL-2.0-only"
>> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D75859989545e37968a99b631ef42=
722e"
>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc5b1819073ecce49dec65a690b63=
8c48"
>>
>>  SRC_URI =3D "http://gtkwave.sourceforge.net/gtkwave-gtk3-${PV}.tar.gz"
>> -SRC_URI[sha256sum] =3D "f19da2db43b27bbcc669725843451945a68c3a4ce232562=
e341d6f63b80b55e4"
>> +SRC_URI[sha256sum] =3D "817e197fc1808f8aac3543c2c2f9683cb01368c91192b8e=
ae5af58070ef1d1f8"
>>  S =3D "${UNPACKDIR}/${BPN}-gtk3-${PV}"
>>
>>  DEPENDS =3D " \
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#128677): https://lists.openembedded.org/g/openembedd=
ed-devel/message/128677
>> Mute This Topic: https://lists.openembedded.org/mt/120575195/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [=
raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

