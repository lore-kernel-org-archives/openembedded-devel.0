Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web09.20634.1629920752789163446
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Aug 2021 12:45:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MI4pEyCx;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: dbaryshkov@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id dm15so783009edb.10
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Aug 2021 12:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Fu6kGov+KraCn1KAP1TMluWO9DhGsXsiLRB1KR5D24Q=;
        b=MI4pEyCxb14Kdx/gH6f7ad45V7stUPJqA1YTThwTCxMBVk+8IyGrdqjfVKBt1Gcz8y
         pVgsrFK2rQMd7cz6e8PH9ZlXXKq9tbbp4o/7sSB2bkjyNyKrNK2i0gdafbZcwiYxLpF1
         zgkIyXBgjq04gPHVzNx4LlgZb2D+jcnTrr5Q6HYmoLwfD9pZauoh8b+xD4+SXJSts3eo
         Cw8sDgxghlpNKrV23j0PMK187VotQM+KNIas7aav+CzeBAJexPOKFIxhIjFELE0FfcS4
         SM1CN3LEPXBfF4NoiUS94SBktIxcXpjIr414D6iAw1PaduOGtdUISLBBCB++Yb3riAaW
         vutg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Fu6kGov+KraCn1KAP1TMluWO9DhGsXsiLRB1KR5D24Q=;
        b=d6AsVDa9lm9nLhxVIeIH1smt4jnibHpUmdCpWKxGuqn4m1rufkXaAVn2m21BCQRgQx
         CpSXP5wHNNRiq0ost5CRYY/qAUHEcZ40pDfQUKCZz8imglfncHBc2JQwNnwKtz65xLqE
         LOHp276Eju8GZfPiuQ8Ar3K/gEAT2uPxq7nDgkrdsIv4MQjxhS3pAXio+GzIhYuKMlJY
         8k4bNBAIgH1YaFmW3hzN5gfsnpESeMmDQzB3mbkhFu8481OPWhmFaO7dGUiO51pb2d9F
         nVAQuRoUjEMHPULqqkZpToEQmTiArtEfeGzOtV/I1V9+PTTZQ9iaC25y/mEfFPJ5U+ja
         6TZg==
X-Gm-Message-State: AOAM531QNJddx769Qe87+8qnh+l3cMxY1SaURURvg0InmxaU4sPfJBTj
	cPNzsvPatZxxRi+hajBHRWnxhciZZ3QY6wndeL4=
X-Google-Smtp-Source: ABdhPJztsgHX7CbsPXyowT9ZMyUuRapxPGR9+2XSXrIUJr4A4H3QnQ4gcY7wByBOTI1VtXYkhC9ALfmfHyaiKbI7u0g=
X-Received: by 2002:a50:c31e:: with SMTP id a30mr208822edb.123.1629920751235;
 Wed, 25 Aug 2021 12:45:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210818153932.3365328-1-dmitry.baryshkov@linaro.org>
 <CAMKF1sqL1aaJrNr4Fj1kkSb0+Ctd5sC8sUkDYiqKMYvJ3cyLUA@mail.gmail.com>
 <CALT56yMBWzhbyH_exaKPgBZFceYfJFviLd1nX2d+tSs0U0MwqA@mail.gmail.com> <CAMKF1sqmXR2xAc=3SOXKODvaO9BPbe52Y8Ct42V99FcV5Dma5A@mail.gmail.com>
In-Reply-To: <CAMKF1sqmXR2xAc=3SOXKODvaO9BPbe52Y8Ct42V99FcV5Dma5A@mail.gmail.com>
From: "Dmitry Baryshkov" <dbaryshkov@gmail.com>
Date: Wed, 25 Aug 2021 22:45:39 +0300
Message-ID: <CALT56yMadgTKaQ=y7oP+9uZfLL3=vR_xkAGpfyMVsDZ0WhsB7Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] image_types_sparse: stop using ext2simg
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

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

Pretty much so. I'd also settle for the second option. I've been hit
by ext2simg, thus I had to send this patch. So, can we please get it
queued/applied?

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
