Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1240C88E64
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 11:29:34 +0000 (UTC)
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18105.1789385374255179358
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Sep 2026 04:29:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=TL1jxTQr;
 spf=pass (domain: gmail.com, ip: 74.125.224.41, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-66c744a00edso2347272d50.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 14 Sep 2026 04:29:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789385373; cv=none;
        d=google.com; s=arc-20260327;
        b=GfCBqwZYltR3+f5ytWv36xi56aGAUJvzj8BbcNRS07mXFNwhY14mGoThlw1yT0NEV4
         76JbbzNU8e0R6U72sF2Fm76pv1EsVZmUqeD+gp/hA6HbyaBqE08Nuci6GEb8N5+1sL/A
         7E5iTNkkxyW0WJOR7njyg46mttBDTNzGVI2bg6wbE7c6ACeEmTh9C5jlaSABEr1PAKJx
         1BXiO1sekrwf7WZD2j6uqllHHttK4IeWFu65CEwoICNN4FRCPCQvMoL9F/ssizu4oewp
         Saidcqh43S2k5rO+W2oNHxBZN8tfiuqQy67B9TZ2etALHrkmO/DKmx1WWsThGdcgLqYj
         sTBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JEESaj6cjdW+yQrkUPlbqzKG3VQGnMFRcsuAs/OBWaA=;
        fh=DXQCmsT/VsZ1HSXcYzFH2WXbZpFZ7typrNlBUqGPTCQ=;
        b=pY9ODJq88KldbTFYxlCcxuQPGRQ+IsQUABXG7NEUl8UjCBS2qZ79kAEqAwAZK0FI98
         64bqxW8jtuVpYAYPUGUvYuYEDzCCmE7RtsietsQnes5uX7eyZMyUiZX1+otYRMqlIw04
         pKcnoCgWRW1rWV2nNRKkxnSgP9gNnWkuP/oSrfZcBfL+OLCckSFggoLy1CAuyGtirH1i
         hbYW502ZuCyfl9EFd2xd+hw5nVwaHMtHYTaWDbgQEeFYcr2sVewucLLJNn+ve1MvKYQH
         FqdMpcCKPMU40wBLLUMwZ3IuYwp6jUCt0rEB62iiwu2ejPmde+KPoua1eiaU1NFVSLZh
         CZvA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789385373; x=1789990173; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JEESaj6cjdW+yQrkUPlbqzKG3VQGnMFRcsuAs/OBWaA=;
        b=TL1jxTQrh1EUX2ag0FG0cCwpZNjOsnPiyzPxH1+5XyvS6YmL3ypc4+ZX0jQPfzIDnu
         LS+NLIcz2mr4Sy078xN+nqI48r0y1VIWnYdown+MQpwZS4wWV46bfn5YF8ItjMIklE7X
         IlGEWlax/gnwiei/V7DoTi0SuvR4RLtQYkDg4Igp21n/K01rC9Cgj7xKeKsJ9DUSbfLW
         isoLy3rA9bnjKLeiQWzB+TCG6iHjJQYbHHONUFpgQlwHJh2Jogt5WToCpfTv4VIED5/q
         /nqKIIxqfFSJZzhroX0lZUo0uJY5/xNNe58GMH0LlCU5fRoS4MhPt7Xg57lx4sIDs8wz
         sCWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789385373; x=1789990173;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JEESaj6cjdW+yQrkUPlbqzKG3VQGnMFRcsuAs/OBWaA=;
        b=qVwFrMhpl+lkiD/SWiPiHdmPOnh678E3iD1xJ4Y2L/q3yzb+c+d8A5uBEPrfivYkyS
         vqqfWb0BGuL8/Dma4rdTQeZyNtpPX1Mqbrqv+w+lFk+H3u27mh6koi35gmtPrOALrzsY
         Fitho081ChyfThAPCL9+0THgHHOhvpKgwrpLL9SMe+uVloDMXtIg6vkcDZUBQGmLsc3g
         QciKrKvJwZnkezgkrR607Scymn5k+RsaGVn9ZNJ9fkX58sIFvJE9tZRGv6GW0pktdfqv
         Ts83o9ASRRyhUgOHbP7bem9YXMsmPhxwiBYUj2+8AxBp+008IRLRvhBzOAUmOhAkviGG
         0MXQ==
X-Forwarded-Encrypted: i=1; AKwUvByD807t11P4ADJcfoaTApC9HxgbQauNCItM3srkG3YYHaNv+CeIZi6rASvhyRQZh/LVZ1SPJBAMENwTFp4mX4qK0wc=@lists.openembedded.org
X-Gm-Message-State: AFuF++lCY0zJJw1xIEFOjYhQl8vQ5yYArKG6We00zJjx6+g/juMLFMej
	y6c3dM1ZzWqJ+BdorRXjXFdMUO6NxFbXLXEOz4DOZcy71Cqu6Eu+5IjK+yjWr1VmXfZNxBCG8IT
	YKL4czYsqzbFAKNQ5SM0iwLjn2JXmp9U=
X-Gm-Gg: AYBFou3pI8jH8wwiYQ6KfWc7WaY2ZTlSJ3dIY0+tuTXX5tj1eM8z8SUYYEcvpJoHUrK
	zl2mOOi7LO2eAgKpxqKvMSV0IWt9i7T9dq8G4Bzz2l8enDHVmd3N3uxYupR8oB78377x/iVpIFF
	y2umXj1pfYqSKMD4tgAqsc61X1pVplHkUQQ1ub+ivIxgpTPnpkn2Yi114t4oln9VQdHRPO8UU0X
	iMqlrCQKlcZXk3fPHohI2nOejJabydJyK1i4u5U0T8o6WHRubWEJ1hRTaLyhXUmP30PUJnnps1/
	uy01t4WV0RqpCXcUV58lZalEel5D8WuCWq3s3nzLFzUbcWPW1/UhXAcnUPdyEvolYKZGh3F3RcH
	oJkHmCt256i57zsz8jAsCnVfa0erVjXGyyrQeTxTk/5u4b3N7ZzETLnxn39vpHJZSYLnZh08LWL
	+m0vUSiXwhiTrrg05nUU2SiirhH/iFfx4caX4y33v4ui+J7SjbH2oSbmSGntNbuQJu8drvkYXLm
	6PSlava0yVr+mfMAWc7qUszesYhG8UUkLhC
X-Received: by 2002:a05:690e:4008:b0:66e:5884:a0c with SMTP id
 956f58d0204a3-6714dff4181mr377273d50.34.1789385373127; Mon, 14 Sep 2026
 04:29:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260911-libgpiod-v1-6-5-handle-disappearing-chips-v3-1-1e9e565dbab6@gmail.com>
 <CAMKF1soH4p+tYg5bfWQBmUe-fXS-JPxO09L_H94bkwannL=Thg@mail.gmail.com> <CAMRc=Mfz+iDE6AUuw1DgZMbmx09Ws-ENxAKYWZ_85ScfN0Rvgg@mail.gmail.com>
In-Reply-To: <CAMRc=Mfz+iDE6AUuw1DgZMbmx09Ws-ENxAKYWZ_85ScfN0Rvgg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 14 Sep 2026 13:29:21 +0200
X-Gm-Features: AcwNN1WmnYsXA2KLIjXuDxrq0fGVGNn8eDIaIjDZgx9NHMlyPdSC7FDa5cXWLaw
Message-ID: <CAMKF1srxk2SJjyggUFdomGL0PsFG+odpPUW=qVdQUNEwskfmVw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v3] libgpiod: handle disappearing chips
 during iteration for v1.6.x
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: "Khem Raj via lists.openembedded.org" <raj.khem=gmail.com@lists.openembedded.org>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>, 
	Potin Lai <potin.lai.pt@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000881a3a065b6fbfa1"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Sep 2026 11:29:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130021

--000000000000881a3a065b6fbfa1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

These should be corrected to Backport since we do not test meta-gnome on
yocto AB this does not get caught. Care to send a patch ?

On Mon, Sep 14, 2026, 9:38=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.org>=
 wrote:

> On Sat, 12 Sep 2026 07:46:52 +0200, "Khem Raj via
> lists.openembedded.org" <raj.khem=3Dgmail.com@lists.openembedded.org>
> said:
> > On Fri, Sep 11, 2026 at 2:17=E2=80=AFAM Potin Lai <potin.lai.pt@gmail.c=
om>
> wrote:
> >
> >> +
> >> +Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
> >> +Link:
> >>
> https://patch.msgid.link/20260908-gpiofind-error-enodev-v1-1-c7756aab9568=
@gmail.com
> >> +Signed-off-by: Bartosz Golaszewski <
> bartosz.golaszewski@oss.qualcomm.com>
> >> +Upstream-Status: Accepted [
> >>
> https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/commit/?id=3D40=
f18f16f573e6bf091d83cb1677e7386d0b8495
> >> ]
> >>
> >
> > Accepted is not a valid status, for details see -
> >
> https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#p=
atch-upstream-status
> >
>
> Sorry my bad. I really thought this was a status I've seen before. In fac=
t:
>
> $ git log | grep "Upstream-Status: Accepted"
>     meta-gnome.qa-patches-Upstream-Status: Accepted
> [
> https://gitlab.gnome.org/GNOME/gnome-tweaks/-/commit/dc9701e18775c01d0b69=
fabaa350147f70096da8
> ]'
>
> (/OE/layers/meta-openembedded/meta-gnome/recipes-gnome/gnome-tweaks/gnome=
-tweaks/0002-meson-fix-invalid-positional-argument.patch)
>     Upstream-Status: Accepted
>     Upstream-Status: Accepted
> [
> https://github.com/libesmtp/libESMTP/commit/1c304e7886a08fb56485e41614ff3=
f8685afb59d
> ]
>           Upstream-Status: Accepted
> [
> https://github.com/Exiv2/exiv2/pull/1587/commits/e6a0982f7cd9282052b6e348=
5a458d60629ffa0b
> ]
>           Upstream-Status: Accepted
> [
> https://github.com/Exiv2/exiv2/pull/1581/commits/6628a69c036df2aa036290e6=
cd71767c159c79ed
> ]
>               Upstream-Status: Accepted
> [
> https://github.com/Exiv2/exiv2/commit/f9308839198aca5e68a65194f151a1de923=
98f54
> ]
>           Upstream-Status: Accepted
> [
> https://github.com/Exiv2/exiv2/pull/1523/commits/22ea582c6b74ada30bec3a6b=
15de3c3e52f2b4da
> ]
>           Upstream-Status: Accepted
> [
> https://github.com/Exiv2/exiv2/commit/783b3a6ff15ed6f82a8f8e6c8a6f3b84a9b=
04d4b
> ]
>           Upstream-Status: Accepted
> [
> https://github.com/Exiv2/exiv2/pull/1536/commits/06d2db6e5fd2fcca9c060e95=
fc97f8a5b5d4c22d
> ]
>       Upstream-Status: Accepted
> [
> https://github.com/Exiv2/exiv2/commit/0230620e6ea5e2da0911318e07ce6e66d1e=
bdf22
> ]
>
> There seem to be some in the git log so maybe used to be a valid one?
>
> Anyway, please keep my R-b after the change.
>
> Bart
>

--000000000000881a3a065b6fbfa1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">These should be corrected to Backport since we do not tes=
t meta-gnome on yocto AB this does not get caught. Care to send a patch ?</=
div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" c=
lass=3D"gmail_attr">On Mon, Sep 14, 2026, 9:38=E2=80=AFAM Bartosz Golaszews=
ki &lt;<a href=3D"mailto:brgl@kernel.org">brgl@kernel.org</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">On Sat, 12 Sep 202=
6 07:46:52 +0200, &quot;Khem Raj via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">lists.openembedded.org</a>&quot; &lt;raj.khem=3D<a href=3D"m=
ailto:gmail.com@lists.openembedded.org" target=3D"_blank" rel=3D"noreferrer=
">gmail.com@lists.openembedded.org</a>&gt;<br>
said:<br>
&gt; On Fri, Sep 11, 2026 at 2:17=E2=80=AFAM Potin Lai &lt;<a href=3D"mailt=
o:potin.lai.pt@gmail.com" target=3D"_blank" rel=3D"noreferrer">potin.lai.pt=
@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt;&gt; +<br>
&gt;&gt; +Signed-off-by: Potin Lai &lt;<a href=3D"mailto:potin.lai.pt@gmail=
.com" target=3D"_blank" rel=3D"noreferrer">potin.lai.pt@gmail.com</a>&gt;<b=
r>
&gt;&gt; +Link:<br>
&gt;&gt; <a href=3D"https://patch.msgid.link/20260908-gpiofind-error-enodev=
-v1-1-c7756aab9568@gmail.com" rel=3D"noreferrer noreferrer" target=3D"_blan=
k">https://patch.msgid.link/20260908-gpiofind-error-enodev-v1-1-c7756aab956=
8@gmail.com</a><br>
&gt;&gt; +Signed-off-by: Bartosz Golaszewski &lt;<a href=3D"mailto:bartosz.=
golaszewski@oss.qualcomm.com" target=3D"_blank" rel=3D"noreferrer">bartosz.=
golaszewski@oss.qualcomm.com</a>&gt;<br>
&gt;&gt; +Upstream-Status: Accepted [<br>
&gt;&gt; <a href=3D"https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.g=
it/commit/?id=3D40f18f16f573e6bf091d83cb1677e7386d0b8495" rel=3D"noreferrer=
 noreferrer" target=3D"_blank">https://git.kernel.org/pub/scm/libs/libgpiod=
/libgpiod.git/commit/?id=3D40f18f16f573e6bf091d83cb1677e7386d0b8495</a><br>
&gt;&gt; ]<br>
&gt;&gt;<br>
&gt;<br>
&gt; Accepted is not a valid status, for details see -<br>
&gt; <a href=3D"https://docs.yoctoproject.org/contributor-guide/recipe-styl=
e-guide.html#patch-upstream-status" rel=3D"noreferrer noreferrer" target=3D=
"_blank">https://docs.yoctoproject.org/contributor-guide/recipe-style-guide=
.html#patch-upstream-status</a><br>
&gt;<br>
<br>
Sorry my bad. I really thought this was a status I&#39;ve seen before. In f=
act:<br>
<br>
$ git log | grep &quot;Upstream-Status: Accepted&quot;<br>
=C2=A0 =C2=A0 meta-gnome.qa-patches-Upstream-Status: Accepted<br>
[<a href=3D"https://gitlab.gnome.org/GNOME/gnome-tweaks/-/commit/dc9701e187=
75c01d0b69fabaa350147f70096da8" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://gitlab.gnome.org/GNOME/gnome-tweaks/-/commit/dc9701e18775c01d0=
b69fabaa350147f70096da8</a>]&#39;<br>
(/OE/layers/meta-openembedded/meta-gnome/recipes-gnome/gnome-tweaks/gnome-t=
weaks/0002-meson-fix-invalid-positional-argument.patch)<br>
=C2=A0 =C2=A0 Upstream-Status: Accepted<br>
=C2=A0 =C2=A0 Upstream-Status: Accepted<br>
[<a href=3D"https://github.com/libesmtp/libESMTP/commit/1c304e7886a08fb5648=
5e41614ff3f8685afb59d" rel=3D"noreferrer noreferrer" target=3D"_blank">http=
s://github.com/libesmtp/libESMTP/commit/1c304e7886a08fb56485e41614ff3f8685a=
fb59d</a>]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Upstream-Status: Accepted<br>
[<a href=3D"https://github.com/Exiv2/exiv2/pull/1587/commits/e6a0982f7cd928=
2052b6e3485a458d60629ffa0b" rel=3D"noreferrer noreferrer" target=3D"_blank"=
>https://github.com/Exiv2/exiv2/pull/1587/commits/e6a0982f7cd9282052b6e3485=
a458d60629ffa0b</a>]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Upstream-Status: Accepted<br>
[<a href=3D"https://github.com/Exiv2/exiv2/pull/1581/commits/6628a69c036df2=
aa036290e6cd71767c159c79ed" rel=3D"noreferrer noreferrer" target=3D"_blank"=
>https://github.com/Exiv2/exiv2/pull/1581/commits/6628a69c036df2aa036290e6c=
d71767c159c79ed</a>]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Upstream-Status: Accepted<=
br>
[<a href=3D"https://github.com/Exiv2/exiv2/commit/f9308839198aca5e68a65194f=
151a1de92398f54" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gi=
thub.com/Exiv2/exiv2/commit/f9308839198aca5e68a65194f151a1de92398f54</a>]<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Upstream-Status: Accepted<br>
[<a href=3D"https://github.com/Exiv2/exiv2/pull/1523/commits/22ea582c6b74ad=
a30bec3a6b15de3c3e52f2b4da" rel=3D"noreferrer noreferrer" target=3D"_blank"=
>https://github.com/Exiv2/exiv2/pull/1523/commits/22ea582c6b74ada30bec3a6b1=
5de3c3e52f2b4da</a>]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Upstream-Status: Accepted<br>
[<a href=3D"https://github.com/Exiv2/exiv2/commit/783b3a6ff15ed6f82a8f8e6c8=
a6f3b84a9b04d4b" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gi=
thub.com/Exiv2/exiv2/commit/783b3a6ff15ed6f82a8f8e6c8a6f3b84a9b04d4b</a>]<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Upstream-Status: Accepted<br>
[<a href=3D"https://github.com/Exiv2/exiv2/pull/1536/commits/06d2db6e5fd2fc=
ca9c060e95fc97f8a5b5d4c22d" rel=3D"noreferrer noreferrer" target=3D"_blank"=
>https://github.com/Exiv2/exiv2/pull/1536/commits/06d2db6e5fd2fcca9c060e95f=
c97f8a5b5d4c22d</a>]<br>
=C2=A0 =C2=A0 =C2=A0 Upstream-Status: Accepted<br>
[<a href=3D"https://github.com/Exiv2/exiv2/commit/0230620e6ea5e2da0911318e0=
7ce6e66d1ebdf22" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gi=
thub.com/Exiv2/exiv2/commit/0230620e6ea5e2da0911318e07ce6e66d1ebdf22</a>]<b=
r>
<br>
There seem to be some in the git log so maybe used to be a valid one?<br>
<br>
Anyway, please keep my R-b after the change.<br>
<br>
Bart<br>
</blockquote></div>

--000000000000881a3a065b6fbfa1--

