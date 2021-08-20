Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web08.84930.1629470637888142395
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Aug 2021 07:43:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jaarxXPl;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: dbaryshkov@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id s25so1639173edw.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Aug 2021 07:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=kWVvMKDFOV4sAozAjvP0bVqoZ41RMkJA8Jp1xHzlb9M=;
        b=jaarxXPlOfdtVS3AizXJznaGD5yh/o9oSieRUf7ikEx04jMV0/G/xPNJcH4HSY+TNO
         8GUZBhzD2SBFDwK13/fqTQ/YK91gAf1jvg4mv8+s5spHZiNddc9B5mfnY4O36dOWBNe+
         gJ5YjXY0LkyrWZBQ7NXUHEF602MiXUcVMx39tEm3z0r2TRPV4PzSZDP2I1AYED4nw9K6
         IZ94B4QPmU4KNNebscxb/CUfCu2MLfAJss7bcnNuqncJppWZ7J9CJ3d2SNuvxhlslcT/
         1dto7LdMxKtMWNm8WcBKeTKxToOUHcFSIgJO6UU+JaBAyMMuj7bYHluxl3u7jVXcd9w5
         oK9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=kWVvMKDFOV4sAozAjvP0bVqoZ41RMkJA8Jp1xHzlb9M=;
        b=uZgwnQMCxACQc0dGhqj8kERUhYP3Kahg8kjGORDXL4jHqRGyU79yTAiIaMKNNFwpqu
         D4JLe8UokHCiEvL+uWBOy0YAKXfgTk2k6hM6gA5Eg4KzTjiV0lidbsF6YftyU92PztD4
         DmtpOaZdrxwi6nIu6jznUca3BEOZyrBbvddy3nC57MMHK3UnpL7eDDJ7QObXBPTQ3qZ0
         Qcq9dgykMkFlbA0a39/EkMdgGcVP+ZrHQUuwHdNucQCOWP1YhhmTk+Rg7HYPL4IZ4u50
         kvt82I6i3ET+MrJPG3U2rQdzT2gA5+9lwbykuLs2dgOUUCEbQqYOJY4tCdFI7xOXB50R
         au2Q==
X-Gm-Message-State: AOAM532t5tyH3uLK9qOz30qDUVAiEQmtEECBmP8u5jIXLhPGC8f0d0PQ
	vr5kggwRQdhDAuVf5l+HFS37ELrepEQMIH0jSbU=
X-Google-Smtp-Source: ABdhPJwX3L9zkplrA+/MJATZ7o4Gua4Pg4C0pOEewwpxjziz8H1Nu8NiUuoHRaarFSk0Z1ZFuJKhxGNy4yNynRUdZXc=
X-Received: by 2002:aa7:d6cc:: with SMTP id x12mr22602897edr.171.1629470636404;
 Fri, 20 Aug 2021 07:43:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210818153932.3365328-1-dmitry.baryshkov@linaro.org> <CAMKF1sqL1aaJrNr4Fj1kkSb0+Ctd5sC8sUkDYiqKMYvJ3cyLUA@mail.gmail.com>
In-Reply-To: <CAMKF1sqL1aaJrNr4Fj1kkSb0+Ctd5sC8sUkDYiqKMYvJ3cyLUA@mail.gmail.com>
From: "Dmitry Baryshkov" <dbaryshkov@gmail.com>
Date: Fri, 20 Aug 2021 17:43:45 +0300
Message-ID: <CALT56yMBWzhbyH_exaKPgBZFceYfJFviLd1nX2d+tSs0U0MwqA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] image_types_sparse: stop using ext2simg
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 18 =D0=B0=D0=B2=D0=B3. 2021 =D0=B3. =D0=B2 21:23, Khem Raj <r=
aj.khem@gmail.com>:
>
> On Wed, Aug 18, 2021 at 8:39 AM Dmitry Baryshkov <dbaryshkov@gmail.com> w=
rote:
> >
> > Under some conditions ext2simg can corrupt the file system (see
> > https://lore.kernel.org/linux-ext4/CAP71WjwVdqmLEq1NGWK36JkEd-i05YcAu4j=
eY6GFjsk6TS=3DMtg@mail.gmail.com/).
> > This has been reproduced with the ext2simg currently found meta-oe's
> > android-tools-native). Stop using ext2simg and always use img2simg. Thi=
s
> > results in bigger images, but without the risk of image corruption.
>
> how big are the images ?

Just checked. I've 1GB (964 MB) ext4 image. gzipped it takes 227 MB.
Given that I got:
ext2simg - 518MB
img2simg - 655 MB

>
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  meta-oe/classes/image_types_sparse.bbclass | 12 ++----------
> >  1 file changed, 2 insertions(+), 10 deletions(-)
> >
> > diff --git a/meta-oe/classes/image_types_sparse.bbclass b/meta-oe/class=
es/image_types_sparse.bbclass
> > index 65d980fd913f..4263593a8dd1 100644
> > --- a/meta-oe/classes/image_types_sparse.bbclass
> > +++ b/meta-oe/classes/image_types_sparse.bbclass
> > @@ -2,15 +2,7 @@ inherit image_types
> >
> >  CONVERSIONTYPES +=3D "sparse"
> >  CONVERSION_CMD:sparse =3D " \
> > -    case "${type}" in \
> > -        ext*) \
> > -            ext2simg "${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}" \
> > -                     "${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sparse=
" \
> > -            ;; \
> > -        *) \
> > -            img2simg "${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}" \
> > -                     "${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sparse=
" \
> > -            ;; \
> > -    esac \
> > +    img2simg "${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}" \
> > +             "${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sparse" \
> >  "
> >  CONVERSION_DEPENDS_sparse =3D "android-tools-native"
> > --
> > 2.30.2
> >
> >
> >=20
> >



--=20
With best wishes
Dmitry
