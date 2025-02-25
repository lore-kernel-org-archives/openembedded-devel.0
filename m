Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A1DFC021B2
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 18:57:59 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web11.17189.1740509878574169344
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Feb 2025 10:57:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e59Durdi;
 spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3f3fa7ba7f4so73658b6e.0;
        Tue, 25 Feb 2025 10:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740509878; x=1741114678; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3KRO6xrnMy7P0ZDo2iBNwMgCE6r86SSQ5FBbif6DbRE=;
        b=e59DurdiU9+g98G50q6tVHAk/JtxOyIIsWsnXr+SsYMlDt3mK1MpmQbxDfT7fn0WSq
         8uXkvMK0my8yiTxEshViCJA3cStrDgt6KIIgSL0wrrlbTK2Lpyxu/wD8mO1OfHr1MYMJ
         Q2MBeCe2uvqt332q18t68jfbi76gnG1h+Q0N5KJyU4C9b2Whi9/3YovEcUvu0bngrLVQ
         df6Tdtdoxc1yXNKWMfqVuZyWhYL+N07z1MRUvPTYyYq41NUb5wiAi1aUKk2DCOIAZN+N
         IaIcvZfnSWBdENWZNmJFXbPvmkeuTxeeZ+DTVKOLM2VvOtJs20jcX8NX+oSeLdm13qWX
         XWNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740509878; x=1741114678;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3KRO6xrnMy7P0ZDo2iBNwMgCE6r86SSQ5FBbif6DbRE=;
        b=iYMgwGYbimjNxsPKS4tyYUv/K9VGUNvnKAv7sU53GJ2nIvGIfVos9Yy3yfFycuTIe9
         WXkQ5q0ImH8HDFkoNMutZH/ovt1NeUDyaftI15rP9ATLMAkSaIzrXUeKeNcMp/Ggfx0Q
         9KYq72QjJtpphgm4g1MQwILsStbhk/rTD7l81p0APITfxwfrHi8WlAzY2Pl2BFalFClw
         xV8hVegFGDK+lGz/zql4ER4Hf9vKPGC6BTcBcGJMCHE+UgUMnnWroqeCwQm8cwh8bVHt
         A2/GY974lhun3+abpka8dzu0aoFhtOFd8EIgPOC7kZGpGfk5rlrfsjtG8rZAZ6lyex4T
         2Tcg==
X-Forwarded-Encrypted: i=1; AJvYcCVFd7bEMSfV3bhJ9owqAy8d0nfq5dlPaWOPiQhp/0yXrzt0Gz0IFHxAY2Py5ulogu99dGRzJ8zcd6j7jdWfSEm0p8c=@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywr/Oto0XR2hfQMr/LHMxyt+mASKAgCMjdDwZ5Y9JJBSHT8/e8u
	b28fxClwQtzuVA/28DEklzxpnduvziYNquyh2by0FN9khGLpcVaogNVv/5a7UP2NhUjRbBSoJl3
	oaL33dR4Lc+LX9c/nN24e3V/j8+opi5xH
X-Gm-Gg: ASbGnct34Xr+bCNMLJhVzDbSvggkXxJ2ySjOiAHmeNrmB5L+VGdBbc4YQ/N3Bd7pfV2
	EetvUIdn49wtpD5RYn863n/Gr0LH79jucxj9C8oTBYPJPAdK+l/1bXP/kAzl19Y8ouEogKj5Yft
	/3NLqLVlzK24PrVwjwbWY7N9kxxjwXHYTbD6Vr
X-Google-Smtp-Source: AGHT+IHU1VI5by1G2XTXdLUJLo5h1r9R/8dOh0AUQqGGxpU8tt1zabo3oCoZjjLzpV2W2RpKbP922+UYmB3lh72S0Qs=
X-Received: by 2002:a05:6808:3c94:b0:3e6:54c8:fad3 with SMTP id
 5614622812f47-3f424cf4725mr13705517b6e.19.1740509877737; Tue, 25 Feb 2025
 10:57:57 -0800 (PST)
MIME-Version: 1.0
References: <20250225134937.2085793-1-f_l_k@t-online.de> <20250225134937.2085793-4-f_l_k@t-online.de>
 <CAMKF1spA7v-Bv-HcyPcS2TLJg5TDEfs6Bbqsk-rVchuXAif52w@mail.gmail.com> <T149SS.QTMO47WSVCIR1@t-online.de>
In-Reply-To: <T149SS.QTMO47WSVCIR1@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 25 Feb 2025 10:57:32 -0800
X-Gm-Features: AWEUYZmsFuS9ILA0iBt1kKECoHUno-tfSH7q8zrQKl779wznhewoY_w6LIUPAyQ
Message-ID: <CAMKF1srWT0ZF82eAKPZNU18frx=dYrhwcrfXumf5mKtp5odSgA@mail.gmail.com>
Subject: Re: [oe] [RFC][meta-gnome][PATCH 4/7] gnome-software_: update 47.2 -> 48.beta
To: Markus Volk <f_l_k@t-online.de>
Cc: "Khem Raj via lists.openembedded.org" <raj.khem=gmail.com@lists.openembedded.org>, 
	openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 18:57:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115596

On Tue, Feb 25, 2025 at 10:14=E2=80=AFAM Markus Volk <f_l_k@t-online.de> wr=
ote:
>
> I think so. This patchset would also require another set of patches for o=
e-core.
> I sent both marked as RFC in case someone wants to try them. Alexander Ka=
navin stated that this will not make it in time for the release.
> I only built the beta to see what needed to be updated for gnome 48. It i=
s already running quite well

OK thanks for filling in. I think it makes sense to test them out, I
will give it a whirl on CI as well to catch any issues,  but wait for
final release to apply them

>
> On Tue, Feb 25 2025 at 09:15:00 -08:00:00, Khem Raj via lists.openembedde=
d.org <raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
>
> Should we wait for final 48 release ?
>
> On Tue, Feb 25, 2025 at 5:49=E2=80=AFAM Markus Volk via lists.openembedde=
d.org <f_l_k=3Dt-online.de@lists.openembedded.org> wrote:
>>
>> Version 48~beta
>> ~~~~~~~~~~~~~~~
>> Released: 2025-01-31
>> This is an unstable release with the following changes:
>>  * Support installing flatpaks via a flatpak+https: link
>>  * Fix notifying about outdated updates when in power saver mode or offl=
ine
>>  * Prioritise verified apps in source list
>> This release also updates translations:
>>  * Bulgarian (twlvnn kraftwerk)
>>  * Czech (Daniel Rusek)
>>  * Russian (Artur S0)
>>  * Slovenian (Martin)
>> Version 48~alpha3
>> ~~~~~~~~~~~~~~~~~
>> Released: 2025-01-14
>> This is an unstable release with the following changes:
>>  * Fix downloads of firmware updates
>>  * Fix the release process
>> This release also updates translations:
>>  * Belarusian (Vasil Pupkin)
>>  * Slovenian (Martin)
>> Version 48~alpha2
>> ~~~~~~~~~~~~~~~~~
>> Released: 2025-01-04
>> This is an unstable release with the following changes:
>>  * Fix the release process
>> Version 48~alpha
>> ~~~~~~~~~~~~~~~~
>> Released: 2025-01-04
>> This is an unstable release with the following changes:
>>  * Include dependencies in estimated download size
>>  * Improve performance when loading updates
>>  * Fix interface freeze when upvoting/downvoting reviews
>>  * Various minor interface improvements for keyboard navigation and smal=
l screens
>>  * Fix crash when uninstalling snaps
>>  * Add experimental systemd-sysupdate plugin
>>  * Warn about microphone permissions if an app has PipeWire access
>> This release also updates translations:
>>  * Belarusian (Vasil Pupkin)
>>  * Catalan (Jordi Mas i Hernandez, Jordi Mas)
>>  * Dutch (Nathan Follens)
>>  * French (Vincent Chatelain)
>>  * Friulian (Fabio Tomat)
>>  * German (J=C3=BCrgen Benvenuti)
>>  * Hebrew (Yaron Shahrabani)
>>  * Kabyle (Athmane MOKRAOUI)
>>  * Latvian (R=C5=ABdolfs Mazurs)
>>  * Portuguese (Hugo Carvalho)
>>  * Portuguese (Brazil) (Rafael Fontenelle)
>>  * Russian (Artur S0)
>>  * Serbian (=D0=9C=D0=B0=D1=80=D0=BA=D0=BE =D0=9A=D0=BE=D1=81=D1=82=D0=
=B8=D1=9B, =D0=9C=D0=B8=D0=BB=D0=BE=D1=88 =D0=9F=D0=BE=D0=BF=D0=BE=D0=B2=D0=
=B8=D1=9B)
>>  * Slovak (Jose Riha)
>>  * Slovenian (Martin)
>>  * Thai (Aefgh Threenine)
>>  * Turkish (Sabri =C3=9Cnal)
>>  * Ukrainian (Yuri Chornoivan)
>>
>> Signed-off-by: Markus Volk <f_l_k@t-online.de>
>> ---
>>  .../{gnome-software_47.2.bb =3D> gnome-software_48.beta.bb}     | 4 ++-=
-
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>  rename meta-gnome/recipes-gnome/gnome-software/{gnome-software_47.2.bb =
=3D> gnome-software_48.beta.bb} (90%)
>>
>> diff --git a/meta-gnome/recipes-gnome/gnome-software/gnome-software_47.2=
.bb b/meta-gnome/recipes-gnome/gnome-software/gnome-software_48.beta.bb
>> similarity index 90%
>> rename from meta-gnome/recipes-gnome/gnome-software/gnome-software_47.2.=
bb
>> rename to meta-gnome/recipes-gnome/gnome-software/gnome-software_48.beta=
.bb
>> index 31b13accf8..1b48708595 100644
>> --- a/meta-gnome/recipes-gnome/gnome-software/gnome-software_47.2.bb
>> +++ b/meta-gnome/recipes-gnome/gnome-software/gnome-software_48.beta.bb
>> @@ -26,9 +26,9 @@ DEPENDS +=3D " \
>>
>>  RDEPENDS:${PN} =3D "iso-codes"
>>
>> -EXTRA_OEMESON +=3D "-Dtests=3Dfalse -Dsoup2=3Dfalse"
>> +EXTRA_OEMESON +=3D "-Dtests=3Dfalse"
>>
>> -SRC_URI[archive.sha256sum] =3D "112338f8a98e7e5125de3f57229873534215b77=
eeef37d3fd4262f02151c7cea"
>> +SRC_URI[archive.sha256sum] =3D "798c48912788b3ff700fd483fe805f3e0f0912c=
f2e46b7f7334c8a9c6f883296"
>>
>>  PACKAGECONFIG ?=3D "flatpak"
>>  PACKAGECONFIG[flatpak] =3D "-Dflatpak=3Dtrue,-Dflatpak=3Dfalse,flatpak =
ostree"
>> --
>> 2.48.1
>>
>>
>>
>>

