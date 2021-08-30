Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.2747.1630355787579569302
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Aug 2021 13:36:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LuYcJMzZ;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: dbaryshkov@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id me10so33829377ejb.11
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Aug 2021 13:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+q52QpY1JYUxFfML8tritivBePlEK2CEwk4J3DKRIfM=;
        b=LuYcJMzZ68Y1SE/D/fhhrxDHe8ZSMgqaK/G5HLIMF/bMwVQr+0BpG5XUt4gON7AlSo
         tlOA5N9LabzNhhvn7KFjuNRiZxV3vbjVUF7g2N1rUJciONVcf301O7hMv0NdQO4zkxXu
         RPy0f/AB/nrJ+q/X67td9ypbfsrxyn7ses27dEc7twx7KsG8wspXYe9JMmjZq/tud5NR
         +B+WQ0oHEmeNE0i2a7AGEziBWxP83N6Ro8nOCDysSblx+PlVXhGsZzXHK07BdOScwXkj
         /pll/+09UsJDWNjNYlIoPoQRRn23IpTloktmfuoEQ1b/lI2gR6ri/OvjzX43RgzSWkSJ
         ptdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+q52QpY1JYUxFfML8tritivBePlEK2CEwk4J3DKRIfM=;
        b=SWDdeVpcOr+i/QvLuCM1DNaLBARk0rC4tu+r4vgPWVWaHSQmHHugMV3RAveXXBySIq
         Yc6DZnzQ02HWm7XQrJ0UFm8En0QtG/7sX8F2kHpVT9JWAp81tAswoZuqjEY2Cdp2fNi1
         FwXbg7MjPufOvbFS4K6116dCa6BEwkbjLbVW9mdq/rK6GNBst8PjtXIqO3u+JeluGcTA
         bmdjCDWlTYkHnGx5rMK1hZO35dcNgp/JLdjcNX/i4cKsQ6QrExfyIawCV5rq5EnIO+Ky
         49h1FfrS8evbl8jbZVyXUnwp9cMfoKJ1+7D9xKIw2wlYUTGhQpg+qnXhBAfmiskriZIu
         Xtqw==
X-Gm-Message-State: AOAM532TWgVTRtUf4yleAewyk+ObZeuB8ExQ8nhgj1/kyQiMbjsPupmH
	p5mfkzJqQIpxVajHF5sXCOsTJNaiwm861YXUVqI=
X-Google-Smtp-Source: ABdhPJxKu5cvO1fAJa9Gkt2lv4yNB6qDCc/SiJav3er4hvVFrk+VE2Y3Y+Q4q0R1mqnL3Js90oYdSTIKo+3+BeDxBWQ=
X-Received: by 2002:a17:906:4452:: with SMTP id i18mr27520804ejp.374.1630355786032;
 Mon, 30 Aug 2021 13:36:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210818153932.3365328-1-dmitry.baryshkov@linaro.org>
 <CAMKF1sqL1aaJrNr4Fj1kkSb0+Ctd5sC8sUkDYiqKMYvJ3cyLUA@mail.gmail.com>
 <CALT56yMBWzhbyH_exaKPgBZFceYfJFviLd1nX2d+tSs0U0MwqA@mail.gmail.com> <CAMKF1sqmXR2xAc=3SOXKODvaO9BPbe52Y8Ct42V99FcV5Dma5A@mail.gmail.com>
In-Reply-To: <CAMKF1sqmXR2xAc=3SOXKODvaO9BPbe52Y8Ct42V99FcV5Dma5A@mail.gmail.com>
From: "Dmitry Baryshkov" <dbaryshkov@gmail.com>
Date: Mon, 30 Aug 2021 23:36:14 +0300
Message-ID: <CALT56yPOQh2Qi-KxBDj7UhLZP+e1oYBw0dboue_P_A+LQuV1dw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] image_types_sparse: stop using ext2simg
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 20 =D0=B0=D0=B2=D0=B3. 2021 =D0=B3. =D0=B2 21:03, Khem Raj <r=
aj.khem@gmail.com>:
>
>
>
> On Fri, Aug 20, 2021 at 7:43 AM Dmitry Baryshkov <dbaryshkov@gmail.com> w=
rote:
>>
>> =D1=81=D1=80, 18 =D0=B0=D0=B2=D0=B3. 2021 =D0=B3. =D0=B2 21:23, Khem Raj=
 <raj.khem@gmail.com>:
>> >
>> > On Wed, Aug 18, 2021 at 8:39 AM Dmitry Baryshkov <dbaryshkov@gmail.com=
> wrote:
>> > >
>> > > Under some conditions ext2simg can corrupt the file system (see
>> > > https://lore.kernel.org/linux-ext4/CAP71WjwVdqmLEq1NGWK36JkEd-i05YcA=
u4jeY6GFjsk6TS=3DMtg@mail.gmail.com/).
>> > > This has been reproduced with the ext2simg currently found meta-oe's
>> > > android-tools-native). Stop using ext2simg and always use img2simg. =
This
>> > > results in bigger images, but without the risk of image corruption.
>> >
>> > how big are the images ?
>>
>> Just checked. I've 1GB (964 MB) ext4 image. gzipped it takes 227 MB.
>> Given that I got:
>> ext2simg - 518MB
>> img2simg - 655 MB
>
>
> Hmm so Choice is corrupted at times and small or big but not corrupted I =
guess we should take the second option as it seems more stable

Gracious ping.

>>
>>
>>
>> >
>> > >
>> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> > > ---
>> > >  meta-oe/classes/image_types_sparse.bbclass | 12 ++----------
>> > >  1 file changed, 2 insertions(+), 10 deletions(-)
>> > >
>> > > diff --git a/meta-oe/classes/image_types_sparse.bbclass b/meta-oe/cl=
asses/image_types_sparse.bbclass
>> > > index 65d980fd913f..4263593a8dd1 100644
>> > > --- a/meta-oe/classes/image_types_sparse.bbclass
>> > > +++ b/meta-oe/classes/image_types_sparse.bbclass
>> > > @@ -2,15 +2,7 @@ inherit image_types
>> > >
>> > >  CONVERSIONTYPES +=3D "sparse"
>> > >  CONVERSION_CMD:sparse =3D " \
>> > > -    case "${type}" in \
>> > > -        ext*) \
>> > > -            ext2simg "${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}" \
>> > > -                     "${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.spa=
rse" \
>> > > -            ;; \
>> > > -        *) \
>> > > -            img2simg "${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}" \
>> > > -                     "${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.spa=
rse" \
>> > > -            ;; \
>> > > -    esac \
>> > > +    img2simg "${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}" \
>> > > +             "${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sparse" \
>> > >  "
>> > >  CONVERSION_DEPENDS_sparse =3D "android-tools-native"
>> > > --
>> > > 2.30.2
>> > >
>> > >
>> > >=20
>> > >
>>
>>
>>
>> --
>> With best wishes
>> Dmitry



--=20
With best wishes
Dmitry
