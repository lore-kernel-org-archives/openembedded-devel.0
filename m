Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CE5CC43458
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 15:15:28 +0000 (UTC)
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37545.1782486919848871769
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jun 2026 08:15:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=cwYTZsy9;
 spf=pass (domain: gmail.com, ip: 74.125.224.51, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-662e7fed068so725638d50.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Jun 2026 08:15:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782486919; cv=none;
        d=google.com; s=arc-20260327;
        b=lozi+4JYUcb+l5asxpxTFDDwxT7k0gjm1zfNx1arN0Gzz6EjPmfohzCy5CIKcoSRiW
         XC2K7A+/FQAa48ZJVMPshKLawCvdTp1GUG/cBC3ewfK8isDNiPxMr+E8c1EhvNZudKT0
         B2idaITrZIbMdAyccbqPlTHWzB8VpViydSaSfVFbrGm9JP/I7ma/vCJqoB1G4oNwIaah
         wBeTDg9lnH6nTRyZI78E632BZ7o1j7Ob1HbtlVCgWD/kj4JVkYZdplHPydeMMACdV3NY
         RCrFibDVh2A09LK/UZmzgThg6e1Ulkr7YwO4zuDp1g879hnICpm2rWzgaK+79lLBdMAP
         cdaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=GVdlk+aazh64Xfczpy1XRKyI+JVdrktdUy44STiXEYA=;
        fh=sxMuDx9vrV9Y2fb16yIQmJYex9pS4YV5hd9nHejkpAE=;
        b=U4dFt0dC3DCQ61VOKujfhdQ9Vn6TYrqOR/E6ej/VFTs6BdRErpZyeLksmgObpZ37lF
         hjpKLh7yd3btawhv8lpBuLgqPHPjwi+ZU1giXvjTfSnx5y5WWBN6qFExz70uCX2jXVLt
         TvfnENHSpkuORk8rWJZmkyXwMygEbAk05I24RrHB1H7sWj5+Rtxw3T9XrZpwAtsNrO29
         86UF/V8tTeqChM4MUNr6wJZ+R+PkLZfl/hkekGKy7CP7lZSQPlav6trAmufyL2x/oRJQ
         aFQ7byV2uv7Tpo3LmSmk61lFjVc3yJgAvhRA68zfoTp5ZRS4u7Mmxn3dH5UBWdtt5taP
         M0mQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782486919; x=1783091719; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GVdlk+aazh64Xfczpy1XRKyI+JVdrktdUy44STiXEYA=;
        b=cwYTZsy9ZljT4h5/1VEoYRo1v+GlTThY93YMX+r6Io7YZBC1Jhvq0qXHS4P5x/WEbo
         Q3EJf2AiGaYpROYsNx4L2bVpZpN08YtIMJYEP+w1+OZlLYRlePb5enOAUKAR1sPtFj0W
         23sfGe0784CxcXk00KSMCrxx91i0m8cmkXuwbQm6xtFLjQGFStW6jqzQEkS7bF0yAcFV
         DIFRb7WrdV24bAc6/PC6wJKMRcGZeDcJ7OEyWNqFek+Bq4O2AYMl5O6rQGavXDby3O3y
         Ve0hpgb4KFXuHezK3tdYp9V5y0DvFDhE+21WynbzYrJQh15kK0B/q6f0VkBa1cdk0Ac9
         XZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782486919; x=1783091719;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GVdlk+aazh64Xfczpy1XRKyI+JVdrktdUy44STiXEYA=;
        b=W5uBkzCR5l840DA4OWW8INCyp+EOtHcwTyztUN6Cyfc7IlxoBkt94ea+HnVZo6AwqD
         O6Mwj9HQvQrhFutH2s/HWx+TlVFyaBNNPHYXE4MhlrZA7V7toS9/3PH8SfxOMk9OH8UT
         5cBbP4p+bf7VoSDA38ugSvQyOwfcwUJFjArU8FpURRLVB0Qph6IHvOzOwwoHfUvHfKmq
         RTxEMekb0bJ3ZC+o1dDqIi0ADs0WRu+F8LC5rS/ruo5GFwj+95xHUnerATw3TW3zpqZz
         IZcpMhVt6W5VVirP90IaPjRQcbtPyFLwhsuu5IhsaLhPHDxuXifu4gIjAKJ7yoxYTLWb
         y38g==
X-Gm-Message-State: AOJu0YzoBEowTtAYeTjFHwC8pRD3heFub1y6sIEne0z4++Yonkv2f9A+
	b57OfzgmpZgg4vfhEVNsuPnGuIhK3lJK7NZF47/Q1EE8eH5/ajziHC1agtNRPLHy3L4s2lCFhbo
	hT7Y+FxwIDpsFwtllzdkbVOW3F0sbcWA=
X-Gm-Gg: AfdE7cmdBzx3Swg8Ks02vfS1bF/OkOk9Mmx8KWQDgJpOh0r/CRR/GnxSGotxc07zBnS
	hjvrI+pXPnBWcEjXfdlJSWc/EHRt8iM6qLnJUkVhRbGBmGuI+dcgG+odNXUfzW1h3Oava+Dkryq
	uGGNrYW2jBkDRLvf1sq204K+1irNpELXJVMgmjs2yPeyXQwG+BNvowkn4ERfbx51IpLMjqPHimb
	3jVttpwKbJfKduUF4TMuW5QuDPG6sOl+m6MT7vgr6jQMWymdvJwm/Lp6zmYkDBDRNV1+bJEFEPA
	wYhkRQjEc3vV4MUxBuV5dKM3FOA7i7+l7cPJRInRKQJUBfr7UnYt2xZx2XqGBERmyjwU6vDDbU8
	71YhdlM1bpsM1YTCK2SyGRY4J7FO+ggvkz7h1gN3D+5m/SN8nPeT0eX823GSNtFtKdOJ/YQ==
X-Received: by 2002:a05:690e:2559:b0:664:ae68:ca0c with SMTP id
 956f58d0204a3-664ae68d16emr550522d50.82.1782486918778; Fri, 26 Jun 2026
 08:15:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260625020437.2824-1-zhengrq.fnst@fujitsu.com>
In-Reply-To: <20260625020437.2824-1-zhengrq.fnst@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 26 Jun 2026 08:14:52 -0700
X-Gm-Features: AVVi8CfYUtJb0IpYNTTJJkC7zGzj8R6GAe0OIYoaeKDL533At2x-qjz4oUknfU4
Message-ID: <CAMKF1spuJhbL5dtkE=nhQABDCm7cU9gFfUk2eSGDwYUBTDbQSw@mail.gmail.com>
Subject: Re: [oe] [PATCH v2 0/5] freeglut: Bug fix and virtual/freeglut provide.
To: zhengrq.fnst@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000009c543106552993aa"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Jun 2026 15:15:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127803

--0000000000009c543106552993aa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Seeing this on AB -
https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1575/ste=
ps/15/logs/stdio

On Wed, Jun 24, 2026 at 7:04=E2=80=AFPM zhengruoqin via lists.openembedded.=
org
<zhengrq.fnst=3Dfujitsu.com@lists.openembedded.org> wrote:

> Zheng Ruoqin (5):
>   Bug fix:
>   [oe][meta-oe][PATCH v2] freeglut-gles: Add symbol link to fix opencl-ct=
s
>     compile error
>
>   Add virtual/freeglut to provide split version of freeglut and fix recip=
e
> which depends on freeglut.
>   [oe][meta-oe][PATCH v2] freeglut: Add virtual/freeglut to PROVIDES
>   [oe][meta-oe][PATCH v2] jasper: Use virtual/freeglut instead of freeglu=
t
>   [oe][meta-oe][PATCH v2] ftgl: Use virtual/freeglut instead of freeglut
>   [oe][meta-oe][PATCH v2] opencl-cts: Use virtual/freeglut instead of
>     freeglut
>
>  meta-oe/recipes-core/opencl/opencl-cts_2026.05.05.bb | 2 +-
>  meta-oe/recipes-graphics/freeglut/freeglut_3.8.0.bb  | 5 ++++-
>  meta-oe/recipes-graphics/ftgl/ftgl_2.4.0.bb          | 2 +-
>  meta-oe/recipes-graphics/jasper/jasper_4.2.9.bb      | 2 +-
>  4 files changed, 7 insertions(+), 4 deletions(-)
>
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#127726):
> https://lists.openembedded.org/g/openembedded-devel/message/127726
> Mute This Topic: https://lists.openembedded.org/mt/119968332/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000009c543106552993aa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Seeing this on AB -=C2=A0<a href=3D"https://autobuilder.yo=
ctoproject.org/valkyrie/#/builders/81/builds/1575/steps/15/logs/stdio">http=
s://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1575/steps/1=
5/logs/stdio</a></div><br><div class=3D"gmail_quote gmail_quote_container">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 24, 2026 at 7:04=E2=80=AF=
PM zhengruoqin via <a href=3D"http://lists.openembedded.org">lists.openembe=
dded.org</a> &lt;zhengrq.fnst=3D<a href=3D"mailto:fujitsu.com@lists.openemb=
edded.org">fujitsu.com@lists.openembedded.org</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">Zheng Ruoqin (5):<br>
=C2=A0 Bug fix:<br>
=C2=A0 [oe][meta-oe][PATCH v2] freeglut-gles: Add symbol link to fix opencl=
-cts<br>
=C2=A0 =C2=A0 compile error<br>
<br>
=C2=A0 Add virtual/freeglut to provide split version of freeglut and fix re=
cipe which depends on freeglut.<br>
=C2=A0 [oe][meta-oe][PATCH v2] freeglut: Add virtual/freeglut to PROVIDES<b=
r>
=C2=A0 [oe][meta-oe][PATCH v2] jasper: Use virtual/freeglut instead of free=
glut<br>
=C2=A0 [oe][meta-oe][PATCH v2] ftgl: Use virtual/freeglut instead of freegl=
ut<br>
=C2=A0 [oe][meta-oe][PATCH v2] opencl-cts: Use virtual/freeglut instead of<=
br>
=C2=A0 =C2=A0 freeglut<br>
<br>
=C2=A0meta-oe/recipes-core/opencl/<a href=3D"http://opencl-cts_2026.05.05.b=
b" rel=3D"noreferrer" target=3D"_blank">opencl-cts_2026.05.05.bb</a> | 2 +-=
<br>
=C2=A0meta-oe/recipes-graphics/freeglut/<a href=3D"http://freeglut_3.8.0.bb=
" rel=3D"noreferrer" target=3D"_blank">freeglut_3.8.0.bb</a>=C2=A0 | 5 ++++=
-<br>
=C2=A0meta-oe/recipes-graphics/ftgl/<a href=3D"http://ftgl_2.4.0.bb" rel=3D=
"noreferrer" target=3D"_blank">ftgl_2.4.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 | 2 +-<br>
=C2=A0meta-oe/recipes-graphics/jasper/<a href=3D"http://jasper_4.2.9.bb" re=
l=3D"noreferrer" target=3D"_blank">jasper_4.2.9.bb</a>=C2=A0 =C2=A0 =C2=A0 =
| 2 +-<br>
=C2=A04 files changed, 7 insertions(+), 4 deletions(-)<br>
<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#127726): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/127726" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/127726</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119968332/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/119968332/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000009c543106552993aa--

