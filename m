Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web12.26307.1611139743209888473
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Jan 2021 02:49:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=o7awbRMm;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: peron.clem@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id b5so16448891ejv.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Jan 2021 02:49:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=wT+cwbgUxG42tWOmlJzyThjvNaUmqlIg9973cvZMZyA=;
        b=o7awbRMmyZDvtdVPeFHfQEjSkGOnBs+EgBDKLwxL3bRoTZ8E5my5wm505Z9AtdPOAH
         +DBwVI2/DuEh7EYUoN+PvQ1Fwjh+EbQjm+oV1VwjPewiCZqYwusIMf9QpjglpZ2YepHL
         ja3GgnrOHTBIT/X6RQF4iFM9IB/RiBjUeh1PRyVE5WPE6K+U7eUQ/kH83acVkLWuKuUB
         3YXk0RAFAqfxW8VTyEBO8avk4UqhJP7fGK01GnbLvG7LBxJ5GZn8M7/BilcDl75ZKHHg
         I4sHGOkVMpqwwFjOa1a6j/FVct0abpFct2S08pcf/FaZpqiuaycJ+yQ281z6oXJYJcND
         3gnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=wT+cwbgUxG42tWOmlJzyThjvNaUmqlIg9973cvZMZyA=;
        b=Ojdn0syK7wMq/Krt1DcJ7i9i9hzHVNgyNZCiWjR6FODyIjfNj6YAxdiZRbnlIjdvL0
         AP95bHldWFUhDt3nehI2OPT/Wy2bgSy5zBhltICpuAvHNl66MWUtLMy2VqkRThivDaLW
         nNmN8VUK+XISUetZwbiLDjP4pQpVf0NSCskQAhn1DohFFYA5GpKYbgVfyQhgGGybqXwI
         6G1/Hf+CCLTV7PxahACG7NPAOXFy2/bVTyog/QAylRx2dUdHUrVLIKD5K63+hjgO2bcC
         WedSSrRPQ5Xh2VwkEAq6ajw79uiRVgtU+U6wXIo3u8NHSdoYdpi3/qHFDbFc7C6LNkSm
         6Kmw==
X-Gm-Message-State: AOAM532Y3G0pPIsF6dum0klXMTVzx1G44v1yOokx0uZWyfFOiYi3T6E8
	r/IEwaigez+5Etw7i7kf9q2bp2RhhINzqnQJiWQ=
X-Google-Smtp-Source: ABdhPJzhgm6dcI4YcYzYSccMqSFwWydYVTgDbPn0grhah9v0I7gBiU53WhSBXHX1thxqRguPsKjqNaS6f0HAjSmSnPA=
X-Received: by 2002:a17:906:70d4:: with SMTP id g20mr5974454ejk.361.1611139741613;
 Wed, 20 Jan 2021 02:49:01 -0800 (PST)
MIME-Version: 1.0
References: <20210120091836.2714687-1-peron.clem@gmail.com> <CAM9ZRVvAoWg_M3iVRq_RMz18TtCZaUBN-tDEyKFo1BrY9b4eKw@mail.gmail.com>
In-Reply-To: <CAM9ZRVvAoWg_M3iVRq_RMz18TtCZaUBN-tDEyKFo1BrY9b4eKw@mail.gmail.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Wed, 20 Jan 2021 11:48:50 +0100
Message-ID: <CAJiuCccp3YirjjTC=xHdJB7_ziESHtGE0C0u0thx93Lc6CuDxw@mail.gmail.com>
Subject: Re: [oe] [PATCH] Add Google RE2 library
To: Paul Barker <pbarker@konsulko.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Wed, 20 Jan 2021 at 11:23, Paul Barker <pbarker@konsulko.com> wrote:
>
> On Wed, 20 Jan 2021 at 09:18, Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.c=
om> wrote:
> >
> > Add Google RE2 regular expression library.
> >
> > This is used in new version of gRPC.
> >
> > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > ---
> >
> > Hi,
> >
> > This is my first contribution to meta-openembedded.
> >
> > I would like to bump gRPC to new version but re2 library is required.
> >
> > I'm not sure if i should call the package re2 or libre2.
>
> Hi Cl=C3=A9ment,
>
> I'd use "re2" if that's the upstream name of the project.
>
> You should also modify the commit summary to follow the format shown
> in https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines.
> So it'd be something like "re2: Add recipe for Google RE2 library".

Thanks for the review, I will send a v2,
Regards,
Clement

>
> Thanks,
>
> --
> Paul Barker
> Konsulko Group
