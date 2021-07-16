Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.5639.1626439475151310347
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Jul 2021 05:44:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=AC4/rGdo;
 spf=pass (domain: burtonini.com, ip: 209.85.128.49, mailfrom: ross@burtonini.com)
Received: by mail-wm1-f49.google.com with SMTP id a23-20020a05600c2257b0290236ec98bebaso3323750wmm.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Jul 2021 05:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9lnV15wrf9j9cLt3Uo6IuN9asFvNArke76h3rccoDj4=;
        b=AC4/rGdogc3hcMqmZKM5s3Ji909EkgMSv1pFwrjDVftD6ODsgjY+b2rW027zccST3y
         wuyRSnH2fbQs+WmSGp30XFL1dc/m4IpKBMFNuzMHBwy3oE4G22hfQmUqyvbUSGXGZFc+
         +zohR2GxiVdfXzzcEo11w4vd0MvRPKr/G9hovqPPBrPQ+HxVzQIZByO0+O0FMKc3Pv2H
         LA7dULoVQU8aaXzz6lDiWmiTvaYnzzPN02A6SVodfNocAw4kHwPRxCLwtZnxyT+14O0H
         HiaQCG677B47LyYsNB9JNH6XPt/aCxAenFLzLmJtKq0x9EGruhPoVKwF5ghiHXeW83K6
         VQAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9lnV15wrf9j9cLt3Uo6IuN9asFvNArke76h3rccoDj4=;
        b=DqFmn62GL5vbySf3VnhhVsjdcb4UTCtwzBjYTjRjJxJHaOTyPZYA0F2HkJYJKCqP2s
         WBNW2qWpPRxEnJkFxJiP/mvbcRhsPxJOy8qtDNY6tav7YYpqFNwdz+KrsDffNan9qAZo
         PZqfH/9PTV5YSIauXCiHRbi4jiGk4mAAHvnFxCAUFtJvraw0OgeUJJ6Y7qC+lmz7UuK4
         SvA3PGcayWsetvx+Oihbzb9yRNzt1SwSVqVDWpiOb57zYA8ZCRPGAULFc6Z/ymALEpkB
         t+fvlvw3C1qVBNTXJZUOFE9Z1chSQd6wWsQFqNFXvz7xCyClcAzRI9l1hJXqSq34ZDtu
         N54Q==
X-Gm-Message-State: AOAM533SvNqvKgk/3IdTsM1IbhjhZeODAeWGKCaHwvktUDHIy785UyHM
	YgAxafupuo/iRkmz10D4HCBv9iccmUtz7aQ7cwVZAg==
X-Google-Smtp-Source: ABdhPJwEaVNw51GFQSUEH/iTRvi4GJeCmXgA7wSDR9SVJWU/c4qJiLNFC4xSDUs7JoKgHSampzpl55Th+faY0QnrGvw=
X-Received: by 2002:a05:600c:1d11:: with SMTP id l17mr10499110wms.169.1626439473439;
 Fri, 16 Jul 2021 05:44:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210716123807.23101-1-ben.horgan@arm.com>
In-Reply-To: <20210716123807.23101-1-ben.horgan@arm.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Fri, 16 Jul 2021 13:44:22 +0100
Message-ID: <CAAnfSTvrFfU_PJD6ZY04bjMbd9dEv24bNwo41h07khRobPiv4w@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2] cpputest: Add initial recipe. Version 4.0.
To: Ben Horgan <ben.horgan@arm.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Looks good to me, cheers.

On Fri, 16 Jul 2021 at 13:38, Ben Horgan <ben.horgan@arm.com> wrote:
>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
>  meta-oe/recipes-test/cpputest/cpputest_4.0.bb | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 meta-oe/recipes-test/cpputest/cpputest_4.0.bb
>
> diff --git a/meta-oe/recipes-test/cpputest/cpputest_4.0.bb b/meta-oe/rec=
ipes-test/cpputest/cpputest_4.0.bb
> new file mode 100644
> index 000000000..a17c0658c
> --- /dev/null
> +++ b/meta-oe/recipes-test/cpputest/cpputest_4.0.bb
> @@ -0,0 +1,21 @@
> +SUMMARY =3D "CppUTest unit testing and mocking framework for C/C++"
> +HOMEPAGE =3D "http://cpputest.github.io/"
> +SECTION =3D "devel"
> +
> +LICENSE =3D "BSD-3-Clause"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dce5d5f1fe02bcd1343ced64a06fd=
4177"
> +
> +SRC_URI =3D "git://github.com/cpputest/cpputest.git;protocol=3Dhttps"
> +SRCREV =3D "67d2dfd41e13f09ff218aa08e2d35f1c32f032a1"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit cmake
> +
> +EXTRA_OECMAKE =3D "-DLONGLONG=3DON \
> +                 -DC++11=3DON \
> +                 -DTESTS=3DOFF \
> +                 -DEXTENSIONS=3DOFF \
> +                 "
> +
> +FILES_${PN}-dev +=3D "${libdir}/CppUTest/cmake/*"
> --
> 2.17.1
>
> IMPORTANT NOTICE: The contents of this email and any attachments are con=
fidential and may also be privileged. If you are not the intended recipient=
, please notify the sender immediately and do not disclose the contents to =
any other person, use it for any purpose, or store or copy the information =
in any medium. Thank you.
>
>=20
>
