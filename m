Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56B1DC52D6F
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 14:39:18 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.61649.1723127955365371859
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Aug 2024 07:39:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=2E8tTXns;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3684eb5be64so588551f8f.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Aug 2024 07:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1723127954; x=1723732754; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hIHEsHjhv+sK8CGhU+KC+uDSAOlMXyCJjH+uoNakV/I=;
        b=2E8tTXns8WfIMOT/B9cJBcYkBhgeHyhwW4IvZPghkaM/O1Ckcmz2iPi7wDoh0hw2D9
         n63YaSFjGE9GkGamVlthRZoHMmebPqWx+KhdGR+NcJ4EIa6ne6cfkcZCTSLVsEZvhei5
         oTH00z88Sp826/CLqlYwIG88/0rjTjf1IZSRM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723127954; x=1723732754;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hIHEsHjhv+sK8CGhU+KC+uDSAOlMXyCJjH+uoNakV/I=;
        b=d9V/aXrzsFLL43AbmbXHz8ibduZpMCUJs6c5P5bw5KGX5R47cloO/PL9SZ4e6DjSJZ
         9mCEcFnrtLMXDRr7Rgi5bs6VM6+FDcV9KYJMK6pO6n+VZH1BWPsWhhoP2wNvr+nQeASd
         P60hzpTp0yvtRJIPwMRtbBCOntfa8lS7ki15UOdIwPOfrtShgALLJUfVh/WtPmZjhTNs
         djLPf/8stWzCISKN2kfOtmoFM/VO7Xrct5OJ6/++fiAmnC4VFm56gv55ndk3y+zHZqNg
         Vz/+MnroZMcMEvoyP8WHQXthErJGNGSdV6/gOT97MTlCTcKvhPIiNY4A83sMacQftKrP
         eHmg==
X-Gm-Message-State: AOJu0YyaMGkSFR5UOBCCA3kMIUalC2IlxDmaCZfmGv9qAnLbHwdknsVB
	/VfFs8y6H40fjZwEQdhuJlTCZ1RzsZNwoZhYTTmnqV8Ad1JGldkaDndmvTKK8VZxqxXkBsPppIP
	gyrSuXTADxbCUcizEycMHe5367KY1CqSbsFs++A==
X-Google-Smtp-Source: AGHT+IF7G6mesCU/kxf2xpEjjAjdp5sTcjI7CcN+Cs6Gf01vUwmTBsR0gmWhzNtrZFfc4aV9xa9qdLbq5a6Z1akKptk=
X-Received: by 2002:a5d:514e:0:b0:36b:3384:40e5 with SMTP id
 ffacd0b85a97d-36d274db699mr1357787f8f.24.1723127953353; Thu, 08 Aug 2024
 07:39:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a5d:42c5:0:b0:363:69dd:ac36 with HTTP; Thu, 8 Aug 2024
 07:39:12 -0700 (PDT)
In-Reply-To: <20240808101402.24626-1-alperyasinak1@gmail.com>
References: <20240808101402.24626-1-alperyasinak1@gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Thu, 8 Aug 2024 16:39:12 +0200
Message-ID: <CAMSfU+5QtYgjPCvN3M6AQm8PvNArEOFGZidq-yxxd+MNN-fmTg@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-reedsolo: fix versioning
To: "alperyasinak1@gmail.com" <alperyasinak1@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000900a8a061f2cfd87"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Aug 2024 14:39:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111665

--000000000000900a8a061f2cfd87
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 8 ao=C3=BBt 2024, Alper Ak via lists.openembedded.org <alperyasina=
k1=3D
gmail.com@lists.openembedded.org> a =C3=A9crit :
> The latest release version 1.7.0.
>
> https://pypi.org/project/reedsolo/#description
> https://github.com/tomerfiliba-org/reedsolomon/releases
>
> Signed-off-by: alperak <alperyasinak1@gmail.com>
> ---
>  .../{python3-reedsolo_2.0.13.bb =3D> python3-reedsolo_1.7.0.bb}   | 2 +-

Hi,

I haven't looked at what the correct PV should be, but don't we need to
increase PE when PV decrease like this?

Thanks!

>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-python/recipes-devtools/python3-reedsolo/{
python3-reedsolo_2.0.13.bb =3D> python3-reedsolo_1.7.0.bb} (75%)
>
> diff --git a/meta-python/recipes-devtools/python3-reedsolo/
python3-reedsolo_2.0.13.bb b/meta-python/recipes-devtools/python3-reedsolo/
python3-reedsolo_1.7.0.bb
> similarity index 75%
> rename from meta-python/recipes-devtools/python3-reedsolo/
python3-reedsolo_2.0.13.bb
> rename to meta-python/recipes-devtools/python3-reedsolo/
python3-reedsolo_1.7.0.bb
> index bb5b973d8..b6c40921c 100644
> --- a/meta-python/recipes-devtools/python3-reedsolo/
python3-reedsolo_2.0.13.bb
> +++ b/meta-python/recipes-devtools/python3-reedsolo/
python3-reedsolo_1.7.0.bb
> @@ -3,7 +3,7 @@ HOMEPAGE =3D "https://github.com/tomerfiliba/reedsolomon"
>  LICENSE =3D "MIT-0 | Unlicense"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dffde61aeb8917e70e0257e0a4b6d1=
03c"
>
> -SRC_URI[sha256sum] =3D
"71b4121c6860a55899435c552051a19d5f023c50358be4b1c0fa0c6e2f4ac717"
> +SRC_URI[sha256sum] =3D
"c1359f02742751afe0f1c0de9f0772cc113835aa2855d2db420ea24393c87732"
>
>  inherit pypi setuptools3
>
> --
> 2.25.1
>
>

--=20
Yoann Congal
Smile ECS - Tech expert

--000000000000900a8a061f2cfd87
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>Le jeudi 8 ao=C3=BBt 2024, Alper Ak via <a href=3D"http://lists.ope=
nembedded.org">lists.openembedded.org</a> &lt;alperyasinak1=3D<a href=3D"ma=
ilto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>=
&gt; a =C3=A9crit=C2=A0:<br>&gt; The latest release version 1.7.0.<br>&gt;<=
br>&gt; <a href=3D"https://pypi.org/project/reedsolo/#description">https://=
pypi.org/project/reedsolo/#description</a><br>&gt; <a href=3D"https://githu=
b.com/tomerfiliba-org/reedsolomon/releases">https://github.com/tomerfiliba-=
org/reedsolomon/releases</a><br>&gt;<br>&gt; Signed-off-by: alperak &lt;<a =
href=3D"mailto:alperyasinak1@gmail.com">alperyasinak1@gmail.com</a>&gt;<br>=
&gt; ---<br>&gt; =C2=A0.../{<a href=3D"http://python3-reedsolo_2.0.13.bb">p=
ython3-reedsolo_2.0.13.bb</a> =3D&gt; <a href=3D"http://python3-reedsolo_1.=
7.0.bb">python3-reedsolo_1.7.0.bb</a>}=C2=A0 =C2=A0| 2 +-<br><br>Hi,<br><br=
>I haven&#39;t looked at what the correct PV should be, but don&#39;t we ne=
ed to increase PE when PV decrease like this? <br><br>Thanks!<br><br>&gt; =
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>&gt; =C2=A0rename me=
ta-python/recipes-devtools/python3-reedsolo/{<a href=3D"http://python3-reed=
solo_2.0.13.bb">python3-reedsolo_2.0.13.bb</a> =3D&gt; <a href=3D"http://py=
thon3-reedsolo_1.7.0.bb">python3-reedsolo_1.7.0.bb</a>} (75%)<br>&gt;<br>&g=
t; diff --git a/meta-python/recipes-devtools/python3-reedsolo/<a href=3D"ht=
tp://python3-reedsolo_2.0.13.bb">python3-reedsolo_2.0.13.bb</a> b/meta-pyth=
on/recipes-devtools/python3-reedsolo/<a href=3D"http://python3-reedsolo_1.7=
.0.bb">python3-reedsolo_1.7.0.bb</a><br>&gt; similarity index 75%<br>&gt; r=
ename from meta-python/recipes-devtools/python3-reedsolo/<a href=3D"http://=
python3-reedsolo_2.0.13.bb">python3-reedsolo_2.0.13.bb</a><br>&gt; rename t=
o meta-python/recipes-devtools/python3-reedsolo/<a href=3D"http://python3-r=
eedsolo_1.7.0.bb">python3-reedsolo_1.7.0.bb</a><br>&gt; index bb5b973d8..b6=
c40921c 100644<br>&gt; --- a/meta-python/recipes-devtools/python3-reedsolo/=
<a href=3D"http://python3-reedsolo_2.0.13.bb">python3-reedsolo_2.0.13.bb</a=
><br>&gt; +++ b/meta-python/recipes-devtools/python3-reedsolo/<a href=3D"ht=
tp://python3-reedsolo_1.7.0.bb">python3-reedsolo_1.7.0.bb</a><br>&gt; @@ -3=
,7 +3,7 @@ HOMEPAGE =3D &quot;<a href=3D"https://github.com/tomerfiliba/ree=
dsolomon">https://github.com/tomerfiliba/reedsolomon</a>&quot;<br>&gt; =C2=
=A0LICENSE =3D &quot;MIT-0 | Unlicense&quot;<br>&gt; =C2=A0LIC_FILES_CHKSUM=
 =3D &quot;file://LICENSE;md5=3Dffde61aeb8917e70e0257e0a4b6d103c&quot;<br>&=
gt;<br>&gt; -SRC_URI[sha256sum] =3D &quot;71b4121c6860a55899435c552051a19d5=
f023c50358be4b1c0fa0c6e2f4ac717&quot;<br>&gt; +SRC_URI[sha256sum] =3D &quot=
;c1359f02742751afe0f1c0de9f0772cc113835aa2855d2db420ea24393c87732&quot;<br>=
&gt;<br>&gt; =C2=A0inherit pypi setuptools3<br>&gt; =C2=A0<br>&gt; --<br>&g=
t; 2.25.1<br>&gt;<br>&gt;<br><br>-- <br><div dir=3D"ltr"><font face=3D"Rale=
way, regular">Yoann Congal</font><div><font face=3D"Raleway, regular">Smile=
 ECS - Tech expert<br></font></div></div><br>

--000000000000900a8a061f2cfd87--

