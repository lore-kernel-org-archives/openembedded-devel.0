Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web12.1367.1629482601964563179
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Aug 2021 11:03:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ospH5wpO;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id bj38so11694904qkb.9
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Aug 2021 11:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9eHRaDnhWkIvogpkoGuGbNNFSjs2UlelDXHsweLjRAE=;
        b=ospH5wpOyX8bAOVe8ETCVeYJu5FZhKe+Aq7R9Mb3cV0q9JpWGOBIHPXkhdC2G1kGjb
         VuNPQRV1na9UFy7aQDSokLNat68CdkZjoD16EXnuqB3kh+LeDlb+1ASuT8r+YM+RIxuF
         /Kt3LGa3dNblnKau+A+YHgM82D0Q2X6XP+o6up180S3eAGE5J4H+eG3B0LG77RwDtw6f
         AwQAnxiT68wIW8Xbm6SIECu8jjrKf7R38v+RrFnChQ0lIvoKHwjtZ5oxxlF4LzU9dgCt
         DCYqwVASt66KpGMTbVub8vJapei+5f6GQrCnivCCirBFseK1fkhB/Bli2yHq/jVdqfl0
         uqxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9eHRaDnhWkIvogpkoGuGbNNFSjs2UlelDXHsweLjRAE=;
        b=tBT2JzNli8yWEs15EJt1M6fBD6qyuM/8su7/dCb6XT5DQ08ux65U+MDg2CzpQKxPW/
         5Jg/ZaG4tbG24su2mS1th1dJUUWhBLXyyHqzP7TWeFFinIqtc3notPbzCyoyTLLT6Pdy
         z36cGdvYRuasl+UofStM2TyZqYlhV32dTI0XYb9ZVgF8URacFx5o2KZctGhKnM2lfSxy
         /WU8wweunoXVjpMZvKHSr/1AI+8KOC0uxQrXcFpJDrPuHLg5GDcboXN2cTlgST67afc/
         30zYou1ZLH6db7LwOUngLABJi/aTOf3GLOf19WPXbUUD5BpXDWtNsB6Fo/WbWruQa+yW
         ceZg==
X-Gm-Message-State: AOAM531oolljAiQ2+jRlC6NZXCKSA4dyM5jHqq+ejqUBUFnhkvfu9oZ+
	Qyu7fQxwmp/zeDoFFLTOBVZ/DfdtJA0sCbiNluA=
X-Google-Smtp-Source: ABdhPJwHp8idlpqqpM9JFfLU0MXEF+E8zzmzJsKENTxgg+k9fU+r9vHyGvSrjH6Z51VKkBifmVL2nKV0MqRb9jxVRM4=
X-Received: by 2002:a05:620a:799:: with SMTP id 25mr9907740qka.119.1629482601044;
 Fri, 20 Aug 2021 11:03:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210818153932.3365328-1-dmitry.baryshkov@linaro.org>
 <CAMKF1sqL1aaJrNr4Fj1kkSb0+Ctd5sC8sUkDYiqKMYvJ3cyLUA@mail.gmail.com> <CALT56yMBWzhbyH_exaKPgBZFceYfJFviLd1nX2d+tSs0U0MwqA@mail.gmail.com>
In-Reply-To: <CALT56yMBWzhbyH_exaKPgBZFceYfJFviLd1nX2d+tSs0U0MwqA@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 20 Aug 2021 11:03:10 -0700
Message-ID: <CAMKF1sqmXR2xAc=3SOXKODvaO9BPbe52Y8Ct42V99FcV5Dma5A@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] image_types_sparse: stop using ext2simg
To: Dmitry Baryshkov <dbaryshkov@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000009a5fb105ca017ba5"

--0000000000009a5fb105ca017ba5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 20, 2021 at 7:43 AM Dmitry Baryshkov <dbaryshkov@gmail.com>
wrote:

> =D1=81=D1=80, 18 =D0=B0=D0=B2=D0=B3. 2021 =D0=B3. =D0=B2 21:23, Khem Raj =
<raj.khem@gmail.com>:
> >
> > On Wed, Aug 18, 2021 at 8:39 AM Dmitry Baryshkov <dbaryshkov@gmail.com>
> wrote:
> > >
> > > Under some conditions ext2simg can corrupt the file system (see
> > >
> https://lore.kernel.org/linux-ext4/CAP71WjwVdqmLEq1NGWK36JkEd-i05YcAu4jeY=
6GFjsk6TS=3DMtg@mail.gmail.com/
> ).
> > > This has been reproduced with the ext2simg currently found meta-oe's
> > > android-tools-native). Stop using ext2simg and always use img2simg.
> This
> > > results in bigger images, but without the risk of image corruption.
> >
> > how big are the images ?
>
> Just checked. I've 1GB (964 MB) ext4 image. gzipped it takes 227 MB.
> Given that I got:
> ext2simg - 518MB
> img2simg - 655 MB


Hmm so Choice is corrupted at times and small or big but not corrupted I
guess we should take the second option as it seems more stable

>
>
> >
> > >
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > >  meta-oe/classes/image_types_sparse.bbclass | 12 ++----------
> > >  1 file changed, 2 insertions(+), 10 deletions(-)
> > >
> > > diff --git a/meta-oe/classes/image_types_sparse.bbclass
> b/meta-oe/classes/image_types_sparse.bbclass
> > > index 65d980fd913f..4263593a8dd1 100644
> > > --- a/meta-oe/classes/image_types_sparse.bbclass
> > > +++ b/meta-oe/classes/image_types_sparse.bbclass
> > > @@ -2,15 +2,7 @@ inherit image_types
> > >
> > >  CONVERSIONTYPES +=3D "sparse"
> > >  CONVERSION_CMD:sparse =3D " \
> > > -    case "${type}" in \
> > > -        ext*) \
> > > -            ext2simg "${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}" \
> > > -
>  "${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sparse" \
> > > -            ;; \
> > > -        *) \
> > > -            img2simg "${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}" \
> > > -
>  "${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sparse" \
> > > -            ;; \
> > > -    esac \
> > > +    img2simg "${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}" \
> > > +             "${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sparse" \
> > >  "
> > >  CONVERSION_DEPENDS_sparse =3D "android-tools-native"
> > > --
> > > 2.30.2
> > >
> > >
> > >=20
> > >
>
>
>
> --
> With best wishes
> Dmitry
>

--0000000000009a5fb105ca017ba5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Aug 20, 2021 at 7:43 AM Dmitry Baryshkov &lt;<a hre=
f=3D"mailto:dbaryshkov@gmail.com">dbaryshkov@gmail.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">=D1=81=D1=80, 18 =D0=B0=D0=B2=D0=B3. 202=
1 =D0=B3. =D0=B2 21:23, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" =
target=3D"_blank">raj.khem@gmail.com</a>&gt;:<br>
&gt;<br>
&gt; On Wed, Aug 18, 2021 at 8:39 AM Dmitry Baryshkov &lt;<a href=3D"mailto=
:dbaryshkov@gmail.com" target=3D"_blank">dbaryshkov@gmail.com</a>&gt; wrote=
:<br>
&gt; &gt;<br>
&gt; &gt; Under some conditions ext2simg can corrupt the file system (see<b=
r>
&gt; &gt; <a href=3D"https://lore.kernel.org/linux-ext4/CAP71WjwVdqmLEq1NGW=
K36JkEd-i05YcAu4jeY6GFjsk6TS=3DMtg@mail.gmail.com/" rel=3D"noreferrer" targ=
et=3D"_blank">https://lore.kernel.org/linux-ext4/CAP71WjwVdqmLEq1NGWK36JkEd=
-i05YcAu4jeY6GFjsk6TS=3DMtg@mail.gmail.com/</a>).<br>
&gt; &gt; This has been reproduced with the ext2simg currently found meta-o=
e&#39;s<br>
&gt; &gt; android-tools-native). Stop using ext2simg and always use img2sim=
g. This<br>
&gt; &gt; results in bigger images, but without the risk of image corruptio=
n.<br>
&gt;<br>
&gt; how big are the images ?<br>
<br>
Just checked. I&#39;ve 1GB (964 MB) ext4 image. gzipped it takes 227 MB.<br=
>
Given that I got:<br>
ext2simg - 518MB<br>
img2simg - 655 MB</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto"=
>Hmm so Choice is corrupted at times and small or big but not corrupted I g=
uess we should take the second option as it seems more stable=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex" dir=3D"auto"><br>
<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Dmitry Baryshkov &lt;<a href=3D"mailto:dmitry.bary=
shkov@linaro.org" target=3D"_blank">dmitry.baryshkov@linaro.org</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 meta-oe/classes/image_types_sparse.bbclass | 12 ++---------=
-<br>
&gt; &gt;=C2=A0 1 file changed, 2 insertions(+), 10 deletions(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta-oe/classes/image_types_sparse.bbclass b/meta-oe=
/classes/image_types_sparse.bbclass<br>
&gt; &gt; index 65d980fd913f..4263593a8dd1 100644<br>
&gt; &gt; --- a/meta-oe/classes/image_types_sparse.bbclass<br>
&gt; &gt; +++ b/meta-oe/classes/image_types_sparse.bbclass<br>
&gt; &gt; @@ -2,15 +2,7 @@ inherit image_types<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 CONVERSIONTYPES +=3D &quot;sparse&quot;<br>
&gt; &gt;=C2=A0 CONVERSION_CMD:sparse =3D &quot; \<br>
&gt; &gt; -=C2=A0 =C2=A0 case &quot;${type}&quot; in \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ext*) \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ext2simg &quot;${IMAGE=
_NAME}${IMAGE_NAME_SUFFIX}.${type}&quot; \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&quot;${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sparse&quot; \=
<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;; \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 *) \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 img2simg &quot;${IMAGE=
_NAME}${IMAGE_NAME_SUFFIX}.${type}&quot; \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&quot;${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sparse&quot; \=
<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;; \<br>
&gt; &gt; -=C2=A0 =C2=A0 esac \<br>
&gt; &gt; +=C2=A0 =C2=A0 img2simg &quot;${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$=
{type}&quot; \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;${IMAGE_NA=
ME}${IMAGE_NAME_SUFFIX}.${type}.sparse&quot; \<br>
&gt; &gt;=C2=A0 &quot;<br>
&gt; &gt;=C2=A0 CONVERSION_DEPENDS_sparse =3D &quot;android-tools-native&qu=
ot;<br>
&gt; &gt; --<br>
&gt; &gt; 2.30.2<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; <br>
&gt; &gt;<br>
<br>
<br>
<br>
-- <br>
With best wishes<br>
Dmitry<br>
</blockquote></div></div>

--0000000000009a5fb105ca017ba5--
