Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B447C77B7A
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 17:51:10 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.web11.567.1685123466679519574
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 May 2023 10:51:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=nrM7aXBY;
 spf=pass (domain: gmail.com, ip: 209.85.210.48, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-6af70ff2761so495707a34.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 May 2023 10:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685123466; x=1687715466;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4eu//FaXM4R7Cajsm6GUBS4JeCjWlCk19n2LI6rJykk=;
        b=nrM7aXBYXpV1trqCmrP9+qgME9Jf54yGhVo4/U7QIU4dip0H8ZvskjwsinH0zi8E5o
         QlQvcvznoAJU+IIerOQDUo67jMj1VJTq6Sq8C7nmJt1W67u51DwZz5N+fGHuMwJPJ0IJ
         3ZAsg+avmMFs2/fANieiyxTck4XGI9IUqfL4ykeT/ZvZoeOnOzUv/Dw8cXslVklnhd9p
         cU7Jfc9yGs33mUGiA+SNgDzFC+TKbDOF23l4s9KeKK+fF0q7S/k0UinCnWDg6sK2DoMH
         sp4mQGwwlfuLiwkB7aALX24u5OQJXlIgm7zhlwiJcZevyoqmrkPPPf10WojBpKAiBxzP
         p5og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685123466; x=1687715466;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4eu//FaXM4R7Cajsm6GUBS4JeCjWlCk19n2LI6rJykk=;
        b=SKh2doJe7yKNG+RRWpFnX/OPmolSDrKNtsC1a/aZ0ojlI7l2+XrOT88CES/crLcn4d
         sm0FFz2N93Q8JhVv7/2Faz5Mt6Y898YTFEtf2pMZ6eJSqR4yceFd3pKbB5zPybGG/TtN
         wOUJluqCJ/XuVEMBBT7iP3GwLAwcAKg62yWQiFL+coh6rjr5ts4JFdf6lYIo/UvpDtlJ
         rFd3e/9o+ST3KgwEWqQM43PoQ0ohEw2eV21k17MEAc9DC7mwX3kFmVht7AhveBIe80DY
         2UgOqNvI2DqxnkrsCp3UvKp0mmsonjU5GLrz2Ls0x9q5HhwQw2rzfOxdNx5Vny1W7itV
         Tmvg==
X-Gm-Message-State: AC+VfDwpqK0aOmKmU/3V/QpyHWBvZ9ys2P51lKmWpx1piZmA2LbP30Wj
	H1NxBzN/MVcRFY1lph/mJgAv+mIe/2BS+5goTOA=
X-Google-Smtp-Source: ACHHUZ4r/OauEiYKBBZzncPWa6TKRSzSilrDfnQ+8vmYQ9kqFEJhZ0wVVZlEbBtwD/W5PUHrSBPxEP4rqYlEeJt4U1k=
X-Received: by 2002:a05:6808:238a:b0:394:41e7:5719 with SMTP id
 bp10-20020a056808238a00b0039441e75719mr1639483oib.40.1685123465597; Fri, 26
 May 2023 10:51:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230525121357.245812-1-ross.burton@arm.com> <CA+chaQcqPZU7MwS62NbZEAvRjCxApZZTe1nJOAU8zb1kE0CCpw@mail.gmail.com>
In-Reply-To: <CA+chaQcqPZU7MwS62NbZEAvRjCxApZZTe1nJOAU8zb1kE0CCpw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 26 May 2023 10:50:39 -0700
Message-ID: <CAMKF1srXAOHYRdLsGq4Non+3AckqGQfsxLcq_cXk0hHc4KQJuA@mail.gmail.com>
Subject: Re: [oe] [PATCH 01/14] libpeas: requires gobject-introspection-data DISTRO_FEATURE
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: Ross Burton <ross.burton@arm.com>, openembedded-devel@lists.openembedded.org, 
	nd@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 May 2023 17:51:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102872

On Thu, May 25, 2023 at 11:14=E2=80=AFPM Martin Jansa <Martin.Jansa@gmail.c=
om> wrote:
>
> There is this line already from your previous patch:
> https://lists.openembedded.org/g/openembedded-devel/message/102683

Good catch, I took the comment piece in though and dropped the
duplicate setting.

>
> On Thu, May 25, 2023 at 2:14=E2=80=AFPM Ross Burton <ross.burton@arm.com>=
 wrote:
>>
>> From: Ross Burton <ross.burton@arm.com>
>>
>> Until libpeas 2 is released, g-i is a hard requirement.
>>
>> Signed-off-by: Ross Burton <ross.burton@arm.com>
>> ---
>>  meta-oe/recipes-gnome/libpeas/libpeas_1.36.0.bb | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/meta-oe/recipes-gnome/libpeas/libpeas_1.36.0.bb b/meta-oe/r=
ecipes-gnome/libpeas/libpeas_1.36.0.bb
>> index 3bc975a6fa..1e3b0021c3 100644
>> --- a/meta-oe/recipes-gnome/libpeas/libpeas_1.36.0.bb
>> +++ b/meta-oe/recipes-gnome/libpeas/libpeas_1.36.0.bb
>> @@ -11,6 +11,8 @@ GTKDOC_MESON_OPTION =3D "gtk_doc"
>>  inherit gnomebase gobject-introspection gtk-doc gtk-icon-cache features=
_check
>>
>>  ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
>> +# FIXME: When upgrading to libpeas 2, g-i is no longer needed.
>> +REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
>>
>>  SRC_URI +=3D "file://0001-Remove-builddir-and-srcdir-paths-from-test-bi=
naries.patch"
>>  SRC_URI[archive.sha256sum] =3D "297cb9c2cccd8e8617623d1a3e8415b4530b8e5=
a893e3527bbfd1edd13237b4c"
>> --
>> 2.34.1
>>
>>
>>
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#102862): https://lists.openembedded.org/g/openembedde=
d-devel/message/102862
> Mute This Topic: https://lists.openembedded.org/mt/99128559/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

