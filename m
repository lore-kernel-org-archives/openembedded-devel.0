Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEC9CC4167B
	for <webhook@archiver.kernel.org>; Thu,  7 Dec 2023 15:01:58 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web11.86096.1701961308961648992
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Dec 2023 07:01:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GonpuoA5;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-1fb9a22b4a7so602430fac.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 07 Dec 2023 07:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701961308; x=1702566108; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/29Lir5DtZcGHkfOjzYYyjysslIq2vuhXZOIMou2fq8=;
        b=GonpuoA5yREO7GD+EG+d+HHPSzLbtPl+mhhjX0tYI/i8cHW4XyHxRpG0mLTJh1QdwL
         1Mvvi8ePEOvlWXlM8kKGc6JztQMS3G3/nfzSFVQKv5sB9cmhL9gUrLuBSfNs65p2nN4A
         TC8b9t2XGP0OnJz8tcLmrTH6pAzWyGsNiKkNGz3WSoacgXTiASBpsYbWesETdrzvQ4UN
         a2GxRIS/eUe83OjBv7UQwzzeEJoMjwd2brMbVRxa62/f0Igj+QBi+XJA2h7cQq43s07I
         Wj8X8ps9eeXT/NaW+Z4cMGzdieP5qQBgA/3N4rk4YqvhzLb1wZ824gn4RiwFmJHClBSr
         7VHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701961308; x=1702566108;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/29Lir5DtZcGHkfOjzYYyjysslIq2vuhXZOIMou2fq8=;
        b=hfZN5SOTJhYOB1q7oo18r8JHyoCGKOuqbDLoG98cHni19/de1TY/lYhyAZhd2iQ6+o
         Sr/u+LJ7ke8ytYeGy3KnjTN7L4zDVleRQlwmre1jDQmY+UCXPeUAsaAmzfWBFTHimlmR
         mafS8r5OvAuyADKZ4gtiZ55CHVu2f1cMfbkaOu11YvQYzyNAbgmWW+Zjl5QCqZZCT1F9
         qaWaaouKXK5ZAnvCxucQL2VyV8gOk9clRLGOxTVpqiY3/Eq0AQIIpYZmCNPH7GtcCxkA
         wEo+FV7h7TSX0JU5rjg6KTsbvmDBqCwQbZzFCPY5CAOEFX2Elp7zba/DAE5wmYhOwCmI
         LumA==
X-Gm-Message-State: AOJu0Yzk9vAV5p5UZsGeAr05xoBSPSCuLb6EGRrmg6qFcR07EF/BjZmG
	EiauMdUx/eJz2O433P+RbbSlpegp7Tt7FTTDgxBIbxZw
X-Google-Smtp-Source: AGHT+IFR0InA509xpZh9BI+1Hktf8Rn9whOEKrw9qT9kLGmdviTU2hMzTHzGm0wHm0FCC3ME+9g42vJ8BJGKminDlPo=
X-Received: by 2002:a05:6870:239c:b0:1fb:18b0:e7d3 with SMTP id
 e28-20020a056870239c00b001fb18b0e7d3mr2787317oap.104.1701961308132; Thu, 07
 Dec 2023 07:01:48 -0800 (PST)
MIME-Version: 1.0
References: <20231204141856.2977926-1-p.chernikov@yadro.com>
 <CAMKF1sqszUOsKDu42Z73AvLBMta4tauXCaCm_ZJbOa7UXVPUzg@mail.gmail.com>
 <CAMKF1sqf=jKN3tbeO9nn2Gc2dgLh8Ctaw=_BwaLVHoahAg_KpQ@mail.gmail.com>
 <1cd20d51c6d841a69a77c80904b03372@yadro.com> <2474bdddf872480b8c776713d425c315@yadro.com>
 <CAMKF1sonmdORsNct3cm+qQ4ABZMo00YRH7pd32nLkmKN7Afv6w@mail.gmail.com> <6f92f2b018f146abbc72828d4f68f211@yadro.com>
In-Reply-To: <6f92f2b018f146abbc72828d4f68f211@yadro.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 7 Dec 2023 07:01:36 -0800
Message-ID: <CAMKF1sotx1M_Xg1PdXXE8vW110YjnAbMe6aPapbsDbSxh_5+7w@mail.gmail.com>
Subject: Re: [oe] [PATCH] abseil-cpp: remove -Dcmake_cxx_standard=14 flag from extra_oecmake
To: Petr Chernikov <p.chernikov@yadro.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000003158b7060becbf98"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Dec 2023 15:01:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107281

--0000000000003158b7060becbf98
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 7, 2023 at 12:34=E2=80=AFAM Petr Chernikov <p.chernikov@yadro.c=
om>
wrote:

> Good catch Raj! Thank you!
>
>
>
> I=E2=80=99ve tested mosh compilation and yes, this fails without some cha=
nges:
>
>
>
> I=E2=80=99ve added ` CXXFLAGS:append =3D " -std=3Dc++17"` to mosh recipe =
and
> compilation is fixed, so my question:
>
> Should I put both changes (for mosh and for abseil-cpp) in one patch?
>

Two patches in one series yes

>
>
>
>
> Yours sincerely,
> *Petr Chernikov*
>
>
>
>
>
> *From:* Khem Raj <raj.khem@gmail.com>
> *Sent:* Wednesday, December 6, 2023 6:07 PM
> *To:* Petr Chernikov <p.chernikov@yadro.com>
> *Cc:* openembedded-devel@lists.openembedded.org
> *Subject:* Re: [oe] [PATCH] abseil-cpp: remove -Dcmake_cxx_standard=3D14
> flag from extra_oecmake
>
>
>
> =C2=AB=D0=92=D0=BD=D0=B8=D0=BC=D0=B0=D0=BD=D0=B8=D0=B5! =D0=94=D0=B0=D0=
=BD=D0=BD=D0=BE=D0=B5 =D0=BF=D0=B8=D1=81=D1=8C=D0=BC=D0=BE =D0=BE=D1=82 =D0=
=B2=D0=BD=D0=B5=D1=88=D0=BD=D0=B5=D0=B3=D0=BE =D0=B0=D0=B4=D1=80=D0=B5=D1=
=81=D0=B0=D1=82=D0=B0!=C2=BB
>
>
>
>
>
> On Wed, Dec 6, 2023 at 3:01=E2=80=AFAM Petr Chernikov <p.chernikov@yadro.=
com>
> wrote:
>
> Raj, is my testing enough to apply changes?
>
>
>
> I think you have to compile mosh package to see the issue abseil builds
> fine
>
>
>
> -----Original Message-----
> From: Petr Chernikov
> Sent: Tuesday, December 5, 2023 10:53 AM
> To: 'Khem Raj' <raj.khem@gmail.com>
> Cc: openembedded-devel@lists.openembedded.org
> Subject: RE: [oe] [PATCH] abseil-cpp: remove -Dcmake_cxx_standard=3D14 fl=
ag
> from extra_oecmake
>
> Hi Raj,
> Thank you for feedback!
>
> I've just tested compilation via clang using meta-clang layer - this is
> fine
>
> I've also tested `native` compilation using both gcc and clang, this is O=
K
> too.
> But I don't know how to test nativesdk, any thoughts about this kind of
> compilation?
>
>
> -----Original Message-----
> From: Khem Raj <raj.khem@gmail.com>
> Sent: Tuesday, December 5, 2023 1:46 AM
> To: Petr Chernikov <p.chernikov@yadro.com>
> Cc: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [PATCH] abseil-cpp: remove -Dcmake_cxx_standard=3D14 fl=
ag
> from extra_oecmake
>
> =C2=AB=D0=92=D0=BD=D0=B8=D0=BC=D0=B0=D0=BD=D0=B8=D0=B5! =D0=94=D0=B0=D0=
=BD=D0=BD=D0=BE=D0=B5 =D0=BF=D0=B8=D1=81=D1=8C=D0=BC=D0=BE =D0=BE=D1=82 =D0=
=B2=D0=BD=D0=B5=D1=88=D0=BD=D0=B5=D0=B3=D0=BE =D0=B0=D0=B4=D1=80=D0=B5=D1=
=81=D0=B0=D1=82=D0=B0!=C2=BB
>
> here is a problem which might be related to this change
>
> https://errors.yoctoproject.org/Errors/Details/745165/
>
> On Mon, Dec 4, 2023 at 7:22=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrot=
e:
> >
> >
> >
> > On Mon, Dec 4, 2023 at 6:23=E2=80=AFAM Petr Chernikov <p.chernikov@yadr=
o.com>
> wrote:
> >>
> >> Old versions of abseil-cpp could not be compiled using C++ Standard 17=
.
> >> For now this cmake flag is not needed.
> >
> >
> > Can you check if this works with clang compiler as well
> >>
> >>
> >>
> >> Signed-off-by: Petr Chernikov <p.chernikov@yadro.com>
> >>
> >> diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
> b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
> >> index f847ebf15..4705b6f8c 100644
> >> --- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
> >> +++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
> >> @@ -26,7 +26,6 @@ inherit cmake
> >>
> >>  EXTRA_OECMAKE =3D "-DBUILD_SHARED_LIBS=3DON \
> >>                   -DBUILD_TESTING=3DOFF    \
> >> -                 -DCMAKE_CXX_STANDARD=3D14 \
> >>                   -DABSL_ENABLE_INSTALL=3DON \
> >>                  "
> >>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#107204):
> https://lists.openembedded.org/g/openembedded-devel/message/107204
> >> Mute This Topic: https://lists.openembedded.org/mt/102970930/1997914
> >> Group Owner: openembedded-devel+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub
> [raj.khem@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
>
>

--0000000000003158b7060becbf98
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Dec 7, 2023 at 12:34=E2=80=AFAM Petr Chernikov &lt;=
<a href=3D"mailto:p.chernikov@yadro.com">p.chernikov@yadro.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-=
left-color:rgb(204,204,204)">





<div lang=3D"RU" link=3D"blue" vlink=3D"purple" style=3D"overflow-wrap: bre=
ak-word;">
<div class=3D"m_-3176106658458149539WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Good catch Raj! Thank you!<u></=
u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I=E2=80=99ve tested mosh compil=
ation and yes, this fails without some changes:<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I=E2=80=99ve added `</span><spa=
n lang=3D"EN-US">
</span><span lang=3D"EN-US">CXXFLAGS:append =3D &quot; -std=3Dc++17&quot;` =
to mosh recipe and compilation is fixed, so my question:<u></u><u></u></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Should I put both changes (for =
mosh and for abseil-cpp) in one patch?</span></p></div></div></blockquote><=
div dir=3D"auto"><br></div><div dir=3D"auto">Two patches in one series yes<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-co=
lor:rgb(204,204,204)"><div lang=3D"RU" link=3D"blue" vlink=3D"purple" style=
=3D"overflow-wrap: break-word;"><div class=3D"m_-3176106658458149539WordSec=
tion1"><p class=3D"MsoNormal" dir=3D"auto"><span lang=3D"EN-US">
<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<table border=3D"0" cellspacing=3D"0" cellpadding=3D"0" width=3D"600" style=
=3D"width:450pt">
<tbody>
<tr>
<td valign=3D"top" style=3D"padding:0cm">
<table border=3D"0" cellspacing=3D"0" cellpadding=3D"0">
<tbody>
<tr>
<td valign=3D"top" style=3D"padding:0cm">
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:9pt;font-family:Tahoma,sans=
-serif;color:rgb(48,48,48)">Yours sincerely,<br>
<b style=3D"font-family:Tahoma,sans-serif">Petr Chernikov</b></span><u></u>=
<u></u></p>
</div>
<table border=3D"0" cellspacing=3D"0" cellpadding=3D"0" width=3D"115" style=
=3D"width:86.25pt">
<tbody>
<tr>
<td style=3D"padding:0cm"></td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table></div></div><div lang=3D"RU" link=3D"blue" vlink=3D"purple" style=
=3D"overflow-wrap: break-word;"><div class=3D"m_-3176106658458149539WordSec=
tion1">
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<div>
<div style=3D"border-width:1pt medium medium;border-style:solid none none;p=
adding:3pt 0cm 0cm;border-color:rgb(225,225,225) currentcolor currentcolor"=
>
<p class=3D"MsoNormal"><b>From:</b> Khem Raj &lt;<a href=3D"mailto:raj.khem=
@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; <br>
<b>Sent:</b> Wednesday, December 6, 2023 6:07 PM<br>
<b>To:</b> Petr Chernikov &lt;<a href=3D"mailto:p.chernikov@yadro.com" targ=
et=3D"_blank">p.chernikov@yadro.com</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:openembedded-devel@lists.openembedded.org" tar=
get=3D"_blank">openembedded-devel@lists.openembedded.org</a><br>
<b>Subject:</b> Re: [oe] [PATCH] abseil-cpp: remove -Dcmake_cxx_standard=3D=
14 flag from extra_oecmake<u></u><u></u></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div style=3D"border:1pt dotted rgb(0,51,51);padding:0cm">
<p align=3D"center" style=3D"text-align:center;background:repeat rgb(247,16=
2,156)">
<span style=3D"font-size:10pt;font-family:Cambria,serif;color:black">=C2=AB=
=D0=92=D0=BD=D0=B8=D0=BC=D0=B0=D0=BD=D0=B8=D0=B5! =D0=94=D0=B0=D0=BD=D0=BD=
=D0=BE=D0=B5 =D0=BF=D0=B8=D1=81=D1=8C=D0=BC=D0=BE =D0=BE=D1=82 =D0=B2=D0=BD=
=D0=B5=D1=88=D0=BD=D0=B5=D0=B3=D0=BE =D0=B0=D0=B4=D1=80=D0=B5=D1=81=D0=B0=
=D1=82=D0=B0!=C2=BB
</span><span style=3D"font-size:10pt;font-family:Cambria,serif"><u style=3D=
"font-family:Cambria,serif"></u><u style=3D"font-family:Cambria,serif"></u>=
</span></p>
</div>
<div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">On Wed, Dec 6, 2023 at 3:01=E2=80=AFAM Petr Cherniko=
v &lt;<a href=3D"mailto:p.chernikov@yadro.com" target=3D"_blank">p.cherniko=
v@yadro.com</a>&gt; wrote:<u></u><u></u></p>
</div>
<blockquote style=3D"border-width:medium medium medium 1pt;border-style:non=
e none none solid;padding:0cm 0cm 0cm 6pt;margin-left:4.8pt;margin-right:0c=
m;border-color:currentcolor currentcolor currentcolor rgb(204,204,204)">
<p class=3D"MsoNormal">Raj, is my testing enough to apply changes?<u></u><u=
></u></p>
</blockquote>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">I think you have to compile mosh package to see the =
issue abseil builds fine=C2=A0<u></u><u></u></p>
</div>
<blockquote style=3D"border-width:medium medium medium 1pt;border-style:non=
e none none solid;padding:0cm 0cm 0cm 6pt;margin-left:4.8pt;margin-right:0c=
m;border-color:currentcolor currentcolor currentcolor rgb(204,204,204)">
<p class=3D"MsoNormal"><br>
<br>
-----Original Message-----<br>
From: Petr Chernikov <br>
Sent: Tuesday, December 5, 2023 10:53 AM<br>
To: &#39;Khem Raj&#39; &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"=
_blank">raj.khem@gmail.com</a>&gt;<br>
Cc: <a href=3D"mailto:openembedded-devel@lists.openembedded.org" target=3D"=
_blank">openembedded-devel@lists.openembedded.org</a><br>
Subject: RE: [oe] [PATCH] abseil-cpp: remove -Dcmake_cxx_standard=3D14 flag=
 from extra_oecmake<br>
<br>
Hi Raj, <br>
Thank you for feedback!<br>
<br>
I&#39;ve just tested compilation via clang using meta-clang layer - this is=
 fine<br>
<br>
I&#39;ve also tested `native` compilation using both gcc and clang, this is=
 OK too.<br>
But I don&#39;t know how to test nativesdk, any thoughts about this kind of=
 compilation?<br>
<br>
<br>
-----Original Message-----<br>
From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">=
raj.khem@gmail.com</a>&gt;
<br>
Sent: Tuesday, December 5, 2023 1:46 AM<br>
To: Petr Chernikov &lt;<a href=3D"mailto:p.chernikov@yadro.com" target=3D"_=
blank">p.chernikov@yadro.com</a>&gt;<br>
Cc: <a href=3D"mailto:openembedded-devel@lists.openembedded.org" target=3D"=
_blank">openembedded-devel@lists.openembedded.org</a><br>
Subject: Re: [oe] [PATCH] abseil-cpp: remove -Dcmake_cxx_standard=3D14 flag=
 from extra_oecmake<br>
<br>
=C2=AB=D0=92=D0=BD=D0=B8=D0=BC=D0=B0=D0=BD=D0=B8=D0=B5! =D0=94=D0=B0=D0=BD=
=D0=BD=D0=BE=D0=B5 =D0=BF=D0=B8=D1=81=D1=8C=D0=BC=D0=BE =D0=BE=D1=82 =D0=B2=
=D0=BD=D0=B5=D1=88=D0=BD=D0=B5=D0=B3=D0=BE =D0=B0=D0=B4=D1=80=D0=B5=D1=81=
=D0=B0=D1=82=D0=B0!=C2=BB<br>
<br>
here is a problem which might be related to this change<br>
<br>
<a href=3D"https://errors.yoctoproject.org/Errors/Details/745165/" target=
=3D"_blank">https://errors.yoctoproject.org/Errors/Details/745165/</a><br>
<br>
On Mon, Dec 4, 2023 at 7:22=E2=80=AFAM Khem Raj &lt;<a href=3D"mailto:raj.k=
hem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Mon, Dec 4, 2023 at 6:23=E2=80=AFAM Petr Chernikov &lt;<a href=3D"m=
ailto:p.chernikov@yadro.com" target=3D"_blank">p.chernikov@yadro.com</a>&gt=
; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Old versions of abseil-cpp could not be compiled using C++ Standar=
d 17.<br>
&gt;&gt; For now this cmake flag is not needed.<br>
&gt;<br>
&gt;<br>
&gt; Can you check if this works with clang compiler as well<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Petr Chernikov &lt;<a href=3D"mailto:p.chernikov@ya=
dro.com" target=3D"_blank">p.chernikov@yadro.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta-oe/recipes-devtools/abseil-cpp/<a href=3D"http:/=
/abseil-cpp_git.bb" target=3D"_blank">abseil-cpp_git.bb</a> b/meta-oe/recip=
es-devtools/abseil-cpp/<a href=3D"http://abseil-cpp_git.bb" target=3D"_blan=
k">abseil-cpp_git.bb</a><br>
&gt;&gt; index f847ebf15..4705b6f8c 100644<br>
&gt;&gt; --- a/meta-oe/recipes-devtools/abseil-cpp/<a href=3D"http://abseil=
-cpp_git.bb" target=3D"_blank">abseil-cpp_git.bb</a><br>
&gt;&gt; +++ b/meta-oe/recipes-devtools/abseil-cpp/<a href=3D"http://abseil=
-cpp_git.bb" target=3D"_blank">abseil-cpp_git.bb</a><br>
&gt;&gt; @@ -26,7 +26,6 @@ inherit cmake<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 EXTRA_OECMAKE =3D &quot;-DBUILD_SHARED_LIBS=3DON \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0-DBUILD_TESTING=3DOFF=C2=A0 =C2=A0 \<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-DC=
MAKE_CXX_STANDARD=3D14 \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0-DABSL_ENABLE_INSTALL=3DON \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quo=
t;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; Links: You receive all messages sent to this group.<br>
&gt;&gt; View/Reply Online (#107204): <a href=3D"https://lists.openembedded=
.org/g/openembedded-devel/message/107204" target=3D"_blank">
https://lists.openembedded.org/g/openembedded-devel/message/107204</a><br>
&gt;&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/1029=
70930/1997914" target=3D"_blank">
https://lists.openembedded.org/mt/102970930/1997914</a><br>
&gt;&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.op=
enembedded.org" target=3D"_blank">
openembedded-devel+owner@lists.openembedded.org</a><br>
&gt;&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembed=
ded-devel/unsub" target=3D"_blank">
https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href=3D"m=
ailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt;<u></u><u></u></p>
</blockquote>
</div>
</div>
</div>
</div>
</div>

</blockquote></div></div>

--0000000000003158b7060becbf98--

