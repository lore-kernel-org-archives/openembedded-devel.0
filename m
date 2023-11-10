Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FCBCC4332F
	for <webhook@archiver.kernel.org>; Fri, 10 Nov 2023 01:24:11 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.18864.1699579445468412742
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Nov 2023 17:24:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OkT+soge;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: peron.clem@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5099184f8a3so998408e87.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Nov 2023 17:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699579443; x=1700184243; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Td9CjdrwMnxt4iCijXypVSisjul1QGKUHotBfhME/cI=;
        b=OkT+soge8hb+Rw4Cq8suj9F0/q4G4OTjzEXuDRE28BBSfcrDSzHM3PxJcSRzMCvlZE
         F668irnltIV16e+CuXrAw3okBcfYa9uF5TyB9TE7oduB6fYV5YojoinxN9u+q0bXqOkc
         6m+o1DL78cnpJmHHWt3CdBkicilbX280kWLsViVNPR3GRBSCrshCX6h9z2fvXpV4rtEf
         VUi13/Ceq0qWUDJa7Dba2CmYlOiWC0tapd3uQpAiwK9y8rkpVO5yz9J9IjTNkhldAhAM
         G2Ij0NoeKH7MR8UMFtG+ROQ5Siaf2ipcNDq3P4xOSLOOESl6zM5Zk97Qnky7WdIDF5c2
         DHWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699579443; x=1700184243;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Td9CjdrwMnxt4iCijXypVSisjul1QGKUHotBfhME/cI=;
        b=rB09/vNM/IRlfsfH7cJzrM/BfQ//PpIbpYRGwSSXejWiTQwGWl5ykljcAQQWQq6w4G
         N6jWshU5Ix/qZ70Dw/0GRmQjdNszUg7V4ciRIqVE2Axs+HzhffmouMScHvNPl93ES1jI
         5QZm7benY/8ovPfoCZ938bsz5od9eEz5RYeDqzkh3VgyM/FwclTI5Spc4d7r2lJz7jvV
         pcuSzmqzStQguBBCnvEUdWri5zEoRDx5WsxN/3DF7gB/JUbTGzfMyE2nGcmh2iaCg+Rk
         BBCyC23c0hTqisDkyB+ApPtxemM5PsLsGsV5MTWomkZvt1nq6H69rzftjbVTAPrq8Lq/
         BRxQ==
X-Gm-Message-State: AOJu0Ywcq18nApawLxBpOsfdQA8HdhLBQMKeyt1bDnvQIpL8UImeeMEl
	I65m6Kk7RImnOTU5wnyFbR5zAqZi2jMUvnV2gZA=
X-Google-Smtp-Source: AGHT+IHJ0eVV5QkXN66xlVnPHBQIDhlnvLSqEE6LiwGOldiytyEdkr2zE72A/CM0foC5goOnKNDM2RSXaY7dRyW2wvY=
X-Received: by 2002:ac2:5a06:0:b0:504:4165:54ab with SMTP id
 q6-20020ac25a06000000b00504416554abmr2725893lfn.56.1699579443163; Thu, 09 Nov
 2023 17:24:03 -0800 (PST)
MIME-Version: 1.0
References: <20230930173003.3210-1-peron.clem@gmail.com> <CAJiuCcd=uZ+eUt8Brj-y48Gewy3=gzmDTOLdKrkhvZebZsSD2w@mail.gmail.com>
 <CA+chaQez2kfNHw4f3NK0ft4kagtfqsQTkoO=2DRQA63j2Kdn3A@mail.gmail.com>
 <178A5713556C6E82.9230@lists.openembedded.org> <9714b98c-66b5-48bc-a00a-69e1634b0307@gmail.com>
 <CABXoSoVp=45ccqwzQXFF1y=fjcwCGjXh0HiuLBAE-UssDzf5Yg@mail.gmail.com>
 <babbfd71-062b-4ad5-9ef9-00acc52ae090@gmail.com> <CABXoSoVkvT7py3ZEtZc5gKYuLKzJYesWvi=65zRA5osHQa87tQ@mail.gmail.com>
 <CA+chaQc6XzqXXnFpaN_7f21GBpYvZx4Cv_fw3WwHwVOzGyBPTQ@mail.gmail.com>
 <5d7628e8-4fe7-4cfa-841f-879ebee31b6d@gmail.com> <CAJiuCccMuUTK=-6_hBONEdhWW8UzkOx3Ag=uJTbNyiwnqBNgXA@mail.gmail.com>
 <17910E05B5C0179B.11247@lists.openembedded.org> <CABXoSoVoDRWoSEsWTYHTjfuyGTNnhpBhEvf+V-bxq-70xL11iw@mail.gmail.com>
 <CAJiuCcf9TKKaiLGALDE0Cx5hE+i8c-gLM0Y=D9vfy8Hg71-rug@mail.gmail.com>
 <fb860d6d-99d4-494c-80d5-7023bb106782@gmail.com> <CABXoSoXoy4FhkTiuyOO9_idW_yjAU5xmW4D5p3e12XOzF5cLcg@mail.gmail.com>
 <23c9a4cc-87c0-4bb8-a1ce-0c920f442600@gmail.com>
In-Reply-To: <23c9a4cc-87c0-4bb8-a1ce-0c920f442600@gmail.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Fri, 10 Nov 2023 10:23:51 +0900
Message-ID: <CAJiuCcfkMzMFJhqfBKrwmxx5XA+3uRHipC-=8C2YOgwJe3Mzdw@mail.gmail.com>
Subject: Re: [oe] [PATCH] Revert "protobuf: stage protoc binary to sysroot"
To: Vyacheslav Yurkov <uvv.mail@gmail.com>
Cc: Samuli Piippo <samuli.piippo@gmail.com>, Martin Jansa <martin.jansa@gmail.com>, 
	Khem Raj <raj.khem@gmail.com>, Ross Burton <ross.burton@arm.com>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000fa366e0609c22c66"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Nov 2023 01:24:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106521

--000000000000fa366e0609c22c66
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Samuli,

Le ven. 10 nov. 2023, 00:05, Vyacheslav Yurkov <uvv.mail@gmail.com> a
=C3=A9crit :

> Thanks for the explanation, that was the missing piece for me to get an
> understanding of the problem :)
>
> I think it's not only me, but also others, were confused by the fact that
> we are talking about native(sdk), but try to fix something with a
> non-native variable.
>
> I've just gave it a try and have two suggestions how this can be addresse=
d.
>
> 1. Recipe based solution:
> SYSROOT_DIRS:append:class-nativesdk =3D " $bindir}"
>

Is it not just missing something like

DEPENDS:append:class-nativesdk =3D " protobuf-native "


Regards

Clement




> 2. oe-core based solution:
> --- a/meta/classes-global/staging.bbclass
> +++ b/meta/classes-global/staging.bbclass
> @@ -26,6 +26,7 @@ SYSROOT_DIRS_NATIVE =3D " \
>      ${localstatedir} \
>  "
>  SYSROOT_DIRS:append:class-native =3D " ${SYSROOT_DIRS_NATIVE}"
> +SYSROOT_DIRS:append:class-nativesdk =3D " ${SYSROOT_DIRS_NATIVE}"
>  SYSROOT_DIRS:append:class-cross =3D " ${SYSROOT_DIRS_NATIVE}"
>  SYSROOT_DIRS:append:class-crosssdk =3D " ${SYSROOT_DIRS_NATIVE}"
>
> The second one will invalidate nativesdk sstate, but might cover not only
> grpc issue (I would assume gdbus-codegen or any other generator has the
> same issue when used for SDK build).
>
> What are your thoughs?
>
> Thanks,
> Slava
>
> On 09.11.2023 14:35, Samuli Piippo wrote:
>
> DEPENDS +=3D "protobuf" is enough to have dependencies resolved.
>
> Problem is that bitbake's do_populate_sysroot does not take anything from
> bindir.
> This leads to nativesdk-(qt)grpc's do_prepare_recipe_sysroot to not get
> the protoc binary into the recipe_sysroot as expected by CMake.
>
> This can be fixed with SYSROOT_DIRS.
>
> On Thu, 9 Nov 2023 at 12:19, Vyacheslav Yurkov <uvv.mail@gmail.com> wrote=
:
>
>> Hi Cl=C3=A9ment,
>> No, the issue is when you just build nativesdk recipe (we are not at the
>> stage to use the SDK yet).
>>
>> And that was exactly my question how to propagate the dependency
>> correctly for nativesdk build.
>>
>> Regards,
>> Slava
>>
>
>

--000000000000fa366e0609c22c66
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi Samuli,<br><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">Le ven. 10 nov. 2023, 00:05, Vyacheslav Yurk=
ov &lt;<a href=3D"mailto:uvv.mail@gmail.com">uvv.mail@gmail.com</a>&gt; a =
=C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><u></u>

 =20
   =20
 =20
  <div>
    <div>Thanks for the explanation, that was
      the missing piece for me to get an understanding of the problem :)<br=
>
      <br>
      I think it&#39;s not only me, but also others, were confused by the
      fact that we are talking about native(sdk), but try to fix
      something with a non-native variable.<br>
      <br>
      I&#39;ve just gave it a try and have two suggestions how this can be
      addressed.<br>
      <br>
      1. Recipe based solution:<br>
      SYSROOT_DIRS:append:class-nativesdk =3D &quot; $bindir}&quot;<br></di=
v></div></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"au=
to">Is it not just missing something like</div><div dir=3D"auto"><br></div>=
<div dir=3D"auto"><pre style=3D"padding:0px;margin-top:0px;margin-bottom:0p=
x;font-size:13.3333px"><span style=3D"color:rgb(51,102,153);background-colo=
r:rgb(255,255,255)">DEPENDS:append:class</span><font color=3D"#000000"><spa=
n style=3D"background-color:rgb(255,255,255)">-</span></font><span style=3D=
"color:rgb(51,102,153);background-color:rgb(255,255,255)">nativesdk</span><=
font color=3D"#000000"><span style=3D"background-color:rgb(255,255,255)"> =
=3D </span></font><span style=3D"color:rgb(221,34,0);background-color:rgb(2=
55,240,240)">&quot; protobuf-native &quot;</span><font color=3D"#000000"><s=
pan style=3D"background-color:rgb(255,255,255)"> </span></font></pre><pre s=
tyle=3D"padding:0px;margin-top:0px;margin-bottom:0px;font-size:13.3333px"><=
font color=3D"#000000"><span style=3D"background-color:rgb(255,255,255)"><b=
r></span></font></pre><pre style=3D"padding:0px;margin-top:0px;margin-botto=
m:0px;font-size:13.3333px"><font color=3D"#000000"><span style=3D"backgroun=
d-color:rgb(255,255,255)">Regards</span></font></pre><pre style=3D"padding:=
0px;margin-top:0px;margin-bottom:0px;font-size:13.3333px"><font color=3D"#0=
00000"><span style=3D"background-color:rgb(255,255,255)">Clement </span></f=
ont></pre><pre style=3D"padding:0px;margin-top:0px;margin-bottom:0px;font-s=
ize:13.3333px"><font color=3D"#000000"><span style=3D"background-color:rgb(=
255,255,255)"><br></span></font></pre><pre style=3D"padding:0px;margin-top:=
0px;margin-bottom:0px;font-size:13.3333px"><font color=3D"#000000"><span st=
yle=3D"background-color:rgb(255,255,255)"><br></span></font></pre></div><di=
v dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><d=
iv><div>
      <br>
      2. oe-core based solution:<br>
      --- a/meta/classes-global/staging.bbclass<br>
      +++ b/meta/classes-global/staging.bbclass<br>
      @@ -26,6 +26,7 @@ SYSROOT_DIRS_NATIVE =3D &quot; \<br>
      =C2=A0=C2=A0=C2=A0=C2=A0 ${localstatedir} \<br>
      =C2=A0&quot;<br>
      =C2=A0SYSROOT_DIRS:append:class-native =3D &quot; ${SYSROOT_DIRS_NATI=
VE}&quot;<br>
      +SYSROOT_DIRS:append:class-nativesdk =3D &quot; ${SYSROOT_DIRS_NATIVE=
}&quot;<br>
      =C2=A0SYSROOT_DIRS:append:class-cross =3D &quot; ${SYSROOT_DIRS_NATIV=
E}&quot;<br>
      =C2=A0SYSROOT_DIRS:append:class-crosssdk =3D &quot; ${SYSROOT_DIRS_NA=
TIVE}&quot;<br>
      <br>
      The second one will invalidate nativesdk sstate, but might cover
      not only grpc issue (I would assume gdbus-codegen or any other
      generator has the same issue when used for SDK build).<br>
      <br>
      What are your thoughs?<br>
      <br>
      Thanks,<br>
      Slava<br>
      <br>
      On 09.11.2023 14:35, Samuli Piippo wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">
        <div>DEPENDS +=3D &quot;protobuf&quot; is enough to have dependenci=
es
          resolved.</div>
        <div><br>
        </div>
        <div>Problem is that bitbake&#39;s do_populate_sysroot does not tak=
e
          anything from bindir.</div>
        <div>This leads to nativesdk-(qt)grpc&#39;s
          do_prepare_recipe_sysroot to not get the protoc binary into
          the recipe_sysroot as expected by CMake.<br>
        </div>
        <div><br>
        </div>
        <div>This can be fixed with SYSROOT_DIRS.<br>
        </div>
      </div>
      <br>
      <div class=3D"gmail_quote">
        <div dir=3D"ltr" class=3D"gmail_attr">On Thu, 9 Nov 2023 at 12:19,
          Vyacheslav Yurkov &lt;<a href=3D"mailto:uvv.mail@gmail.com" targe=
t=3D"_blank" rel=3D"noreferrer">uvv.mail@gmail.com</a>&gt;
          wrote:<br>
        </div>
        <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
          <div>
            <div>Hi <span>Cl=C3=A9ment,<br>
                No, the issue is when you just build nativesdk recipe
                (we are not at the stage to use the SDK yet).<br>
                <br>
                And that was exactly my question how to propagate the
                dependency correctly for nativesdk build.<br>
                <br>
                Regards,<br>
                Slava<br>
              </span></div>
          </div>
        </blockquote>
      </div>
    </blockquote>
    <br>
  </div>

</blockquote></div></div></div>

--000000000000fa366e0609c22c66--

