Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.2970.1630356551717337762
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Aug 2021 13:49:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hzf2BUt3;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: dbaryshkov@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id s25so23642139edw.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Aug 2021 13:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=CuEp8/JFzGBg2bvXb97BXEJ9+jL+SERTcaZM8lYQYX8=;
        b=hzf2BUt3RNXGpMUnNMzbN9vdYbN1I11k9Q4nNndg+0pdOoBZwe9atuCBIPz5P3k2kk
         LQCgE3ZQrKK++LE541JWgrc9/eW1bXg33X6MlpGn+PpWv+9cJsKJyPkbOqkC9SIiforH
         iYO02GK6hPjUiePgM/Wf6nJBZlvHdd9WoUOOs2TvfZkbBf/o2b09tiYtlBz1VEqkU2fb
         IRoZt2FzAo3EkX75iMTj6961GX3A1hJncr+7HCdXHa0pq/1rYsWGpcJtukdlhA9cfpzU
         8v65DK5XTWIFmzqY2/u10RR2ij5h969lqZvBUzjv/bHOJ5X4K4m4zWw1WhLIVbVeuYfT
         ksFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=CuEp8/JFzGBg2bvXb97BXEJ9+jL+SERTcaZM8lYQYX8=;
        b=o8guH9fzxpdlaODkL6nFzqZMvb6p14ppE+LgpvZXN8GLAKZ6oqHqnUOFRnCFUlcwFp
         qVttrk0dpyyBmlb5j3XPNbS5+seLJQxXa7UR1l/rhBqUqOKLp40xFJK7P9nNgf1kCglK
         Ud436Ym4T4WfsTMkK1wJW4+AJBG3Yppv2Rlxf2iIYcgJ7GFVvbSH+IZT2bO9ABlqHz3z
         yKmkOtUgvZ1XTCz+qNlcmp5tZDXWyNmJuR0Yx5ePihcSNqP4V3UzlAyA8VaUm4Wq9N4D
         my4F580mvcJVH4/t01xQnLMbASX/vSMzDU/emRkt8+y+zTeq7KPy73w2y5nyUhVVjp8W
         B4Gw==
X-Gm-Message-State: AOAM530iT9i8obzn0FifELgVTAj8FYxmwlbNaXdIkYCc+T1PDmPkqYct
	9OMbIDCxXPUA7yy9z+eg7iMJ4kQfCv+at9gkuYE=
X-Google-Smtp-Source: ABdhPJwmuq5OJwwfzOj7GtDmGoyDckOYdwJdPqG9wtPWbQSf1+L7bEnBbWarHKFPLN7Zf68OpCnU6Dfo6yhu6zp1Oao=
X-Received: by 2002:a05:6402:1512:: with SMTP id f18mr25996273edw.303.1630356550179;
 Mon, 30 Aug 2021 13:49:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210818153932.3365328-1-dmitry.baryshkov@linaro.org>
 <CAMKF1sqL1aaJrNr4Fj1kkSb0+Ctd5sC8sUkDYiqKMYvJ3cyLUA@mail.gmail.com>
 <CALT56yMBWzhbyH_exaKPgBZFceYfJFviLd1nX2d+tSs0U0MwqA@mail.gmail.com>
 <CAMKF1sqmXR2xAc=3SOXKODvaO9BPbe52Y8Ct42V99FcV5Dma5A@mail.gmail.com>
 <CALT56yPOQh2Qi-KxBDj7UhLZP+e1oYBw0dboue_P_A+LQuV1dw@mail.gmail.com> <6911b68f-03f7-a1e7-0ba0-a3bdb538ba6f@gmail.com>
In-Reply-To: <6911b68f-03f7-a1e7-0ba0-a3bdb538ba6f@gmail.com>
From: "Dmitry Baryshkov" <dbaryshkov@gmail.com>
Date: Mon, 30 Aug 2021 23:48:59 +0300
Message-ID: <CALT56yO26_DUccgw8iDA+0yaMMJMDVmKu5mGqe+ZjxtHGd9XJg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] image_types_sparse: stop using ext2simg
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 30 =D0=B0=D0=B2=D0=B3. 2021 =D0=B3. =D0=B2 23:45, Khem Raj <r=
aj.khem@gmail.com>:
>
>
>
> On 8/30/21 1:36 PM, Dmitry Baryshkov wrote:
> > =D0=BF=D1=82, 20 =D0=B0=D0=B2=D0=B3. 2021 =D0=B3. =D0=B2 21:03, Khem Ra=
j <raj.khem@gmail.com>:
> >>
> >>
> >>
> >> On Fri, Aug 20, 2021 at 7:43 AM Dmitry Baryshkov <dbaryshkov@gmail.com=
> wrote:
> >>>
> >>> =D1=81=D1=80, 18 =D0=B0=D0=B2=D0=B3. 2021 =D0=B3. =D0=B2 21:23, Khem =
Raj <raj.khem@gmail.com>:
> >>>>
> >>>> On Wed, Aug 18, 2021 at 8:39 AM Dmitry Baryshkov <dbaryshkov@gmail.c=
om> wrote:
> >>>>>
> >>>>> Under some conditions ext2simg can corrupt the file system (see
> >>>>> https://lore.kernel.org/linux-ext4/CAP71WjwVdqmLEq1NGWK36JkEd-i05Yc=
Au4jeY6GFjsk6TS=3DMtg@mail.gmail.com/).
> >>>>> This has been reproduced with the ext2simg currently found meta-oe'=
s
> >>>>> android-tools-native). Stop using ext2simg and always use img2simg.=
 This
> >>>>> results in bigger images, but without the risk of image corruption.
> >>>>
> >>>> how big are the images ?
> >>>
> >>> Just checked. I've 1GB (964 MB) ext4 image. gzipped it takes 227 MB.
> >>> Given that I got:
> >>> ext2simg - 518MB
> >>> img2simg - 655 MB
> >>
> >>
> >> Hmm so Choice is corrupted at times and small or big but not corrupted=
 I guess we should take the second option as it seems more stable
> >
> > Gracious ping.
> >
>
> thanks for reminder, it fell through cracks. I have it in master-next now=
.

Thank you!

>
> >>>
> >>>
> >>>
> >>>>
> >>>>>
> >>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>>>> ---
> >>>>>   meta-oe/classes/image_types_sparse.bbclass | 12 ++----------
> >>>>>   1 file changed, 2 insertions(+), 10 deletions(-)
> >>>>>
> >>>>> diff --git a/meta-oe/classes/image_types_sparse.bbclass b/meta-oe/c=
lasses/image_types_sparse.bbclass
> >>>>> index 65d980fd913f..4263593a8dd1 100644
> >>>>> --- a/meta-oe/classes/image_types_sparse.bbclass
> >>>>> +++ b/meta-oe/classes/image_types_sparse.bbclass
> >>>>> @@ -2,15 +2,7 @@ inherit image_types
> >>>>>
> >>>>>   CONVERSIONTYPES +=3D "sparse"
> >>>>>   CONVERSION_CMD:sparse =3D " \
> >>>>> -    case "${type}" in \
> >>>>> -        ext*) \
> >>>>> -            ext2simg "${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}" \
> >>>>> -                     "${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sp=
arse" \
> >>>>> -            ;; \
> >>>>> -        *) \
> >>>>> -            img2simg "${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}" \
> >>>>> -                     "${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sp=
arse" \
> >>>>> -            ;; \
> >>>>> -    esac \
> >>>>> +    img2simg "${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}" \
> >>>>> +             "${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sparse" \
> >>>>>   "
> >>>>>   CONVERSION_DEPENDS_sparse =3D "android-tools-native"
> >>>>> --
> >>>>> 2.30.2
> >>>>>
> >>>>>
> >>>>>=20
> >>>>>
> >>>
> >>>
> >>>
> >>> --
> >>> With best wishes
> >>> Dmitry
> >
> >
> >



--=20
With best wishes
Dmitry
