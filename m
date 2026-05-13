Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 166A4CD37B6
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 07:27:19 +0000 (UTC)
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2128.1778657235980651677
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 May 2026 00:27:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=CFsC93Dx;
 spf=pass (domain: gmail.com, ip: 74.125.224.47, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-65318dafbcbso6852757d50.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 00:27:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778657235; cv=none;
        d=google.com; s=arc-20240605;
        b=SFvpphz/U8rlRA7B1G8YPowesUzuFB6CLbDxLpxw1gO6Jz1sKb2CTOVgUUeGCQRgat
         t6AHJXcSKcq0gQMYQKIY9OXIOY3sA2pCyn1d4lnZJeKm0lpOefuGiuCbLl+cprV0WqNJ
         ic+9j3sv3jnC9U/VZYNyi9i7x4mAg30RIe7I0B+AgwNriwzD8bztkkiUcQy9ebXHBG6G
         6Alimen6m1VHufnWy+2VG4A9ZqAkeiugwVJIrqa+NOr0BNapxPQYwOVICFfxWFRcLOJ6
         WSYxCi2FCpSFVBEwvo1ey5rm7ShdNj7a9u1coiM0ZL2r6TI+Hz3ZR8ESQYMSjt/7w469
         MIUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+fYoHirPL45lgvseGAVeIrFtoSpfQab2aIxobfSom74=;
        fh=eNmGYEFHOcoqO/CmGWfyZfVHFm4wkF1S+vVVYUXeXaI=;
        b=FBmLUx4LYx30YJfoI4N2g0ljS0eT0fkqUMfGu2BUjg6Pua3/7JfTXJ/jrXqEu0yVU9
         dxJ6xdS5YoViAiC5EXaEK/R8yKq96Al/JgTdHboKYUuUu6TY4IyXd2xhaYuzsZSSc/c+
         XRzM+lpvs2ibYfc1EMatN/fhXN8soc9V1YKd2VXwdRVWE29/twa1KCBp9yUR42i1Muh+
         F2DnhOkbxAxnBk+cgkjasxBv7ctWISS30WtOzwA69Et4i7w6519axXX/wR4VMkcj/0sP
         9d+qehhEhiMQjIJ7mTwKXFfy0FR3X57Pxuf+NoFeDIMOlrC1bvqiyIGS3ZSHk9Ye2trS
         NJmg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778657235; x=1779262035; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+fYoHirPL45lgvseGAVeIrFtoSpfQab2aIxobfSom74=;
        b=CFsC93Dx/oSK9WhV78CUbzbq9kIxAsJJ9bMnnyQZ37D+ELnwMRC0yjm7bLBkD2R96A
         9ia1Tc+3JP+nJpHuE5qaaqJF947V8SCe9Xz//T7G6D1CTUpkX0toudSVo2MpV7/Z8VNS
         Ud5Z3dMnwbrxD4LX+fn05D21AtVwojCVebEFGrbLpD3lRjVzxvFuZeG6I9H1JE+fWgj5
         o+fcWsulkWHSKyzwefHEYVH1Cu/9BQr00qL4IV1+pT6iMR2d79wLL2VVQ3nX7OUUqlbS
         Vabb32KwLUd4Kdz9kvzVTYeECe47ChQYowJQpn4GrWGLK3tx3wxYQCdK50/T5PSoiz3q
         BeLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778657235; x=1779262035;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+fYoHirPL45lgvseGAVeIrFtoSpfQab2aIxobfSom74=;
        b=WTwd5W7X8yTLLM+JsdRftid160GVPw7nuQvvnZLL8CY95NsbvAc3sqXQFCMme750P2
         Uw/69CuvIENxBUv8pqMPYjbk42X54w6XuIpHn3itFCyF4eOj8hRUagXKOWysWeaTGeFg
         mh3qLWl8KmBVzil2QBCE+5Y+IoVIVAjksB2xAxabvmB71SvdqXzisCeXvuCrz4jtjkv2
         I8V/F4awNXMj7FGlBDHbjnc420otG6kdMFB3sKdicSAya6zC1fB3uV+bApkMveQwzLKn
         +XWh6CJ5E0wfwy8BDY7oFt8PQ1fQOVZmY0NEK3h8VZWuxprWr1J0DDw3BIrFQ1T3YA31
         5Hog==
X-Forwarded-Encrypted: i=1; AFNElJ9+NRQbDXFCzBqbfLM3w7ynoxsCQfxL5vjtjhCUWjb2lz5u7Dk9/MBHBgNO85pGgCX/7wAKB5jtkk1fISbbFXiaqpw=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwlfCpVUSW6eAOCOJvijVXLmZiPRuBjtoc3IL+utdBX0IaT2HVS
	fvp/dF7yUloM4Ar5+YAL6jf6BlR7h3r0F8FQPJuYflQ+YaciBToW/JA6ab6lbIc/6XZKC0lrNU8
	6PRmx/pkpKbiiZ9AkXKgoikBpmkzvNkStH2sATik5UwPB
X-Gm-Gg: Acq92OEYG6eeRjBMiR3qJiLI7WwdWhYpI8cnNeHLQp3dhhdweVF1EjL6SaEyuJuKkIz
	gc/hGuHj8WQYhyR8/nhuuHZHh0sYqZMxDrm+c3KuLhwChvChKM85k/UHSIHHFHBMntYWehxTFyy
	dGMCWOqOfRPvWe4H041y/QGrSt2gfY1AgZKM9aI6eWPfy0KU/tKsE8IOSipsy9428sG9joo0hLt
	mNPi54W2LvHCAn4LTjtIlS2r9J6YMUwJufZg8WAfZu5p9btLBBjrY+QNJK+833FS7r9wHHi8Avq
	FHFoMSG/KKGx0IIK1ZVZZD9vbO5tj0TmuETyOKkkzdeM1ZaxTcSmOHEjS0cmxMKrjd2DDykF9jJ
	8TdJ8Y3DaC/foiHHJdJEBG/VoouKkx8Jm5Qmo0pFDS8p6n7G7D9bHFXRSPs5PRSKLoevT/xpth5
	rUArs5dQ==
X-Received: by 2002:a05:690e:dcd:b0:65d:93bc:dad4 with SMTP id
 956f58d0204a3-65df83031camr1224030d50.52.1778657235064; Wed, 13 May 2026
 00:27:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260505150634.192651-1-emailaddress.ashish@gmail.com>
 <2022222.1778130561122567168@lists.openembedded.org> <2115555.1778654861364723634@lists.openembedded.org>
 <6a719287-ab7f-486b-a9c4-ec5801e9e8af@gmail.com>
In-Reply-To: <6a719287-ab7f-486b-a9c4-ec5801e9e8af@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 13 May 2026 00:26:46 -0700
X-Gm-Features: AVHnY4ItsnEZM8bCUtO7gfo1akO7R9Juz9psN1fJVUo2ZVe8IYcxw8H3v5Fhf7M
Message-ID: <CAMKF1sp=Ae3MHJYK7fbAXokwEhayigWkOPjpzw+H4Mp3W3Bjow@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v3 0/3] android-tools: migration and cleanup
To: skandigraun@gmail.com
Cc: ashishkumar.mishra@bmwtechworks.in, 
	openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ac5dfe0651ade84d"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 07:27:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126956

--000000000000ac5dfe0651ade84d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

there are some build issues I am seeing

https://errors.yoctoproject.org/Errors/Details/938668/

On Tue, May 12, 2026 at 11:57=E2=80=AFPM Gyorgy Sarvari via lists.openembed=
ded.org
<skandigraun=3Dgmail.com@lists.openembedded.org> wrote:

>
> On 5/13/26 08:47, AshishKumar Mishra via lists.openembedded.org wrote:
> > Hi Team,
> > Can team please take this to be merged in master branch
> >
>
> It's currently undergoing tests in the master-next branch:
> https://git.openembedded.org/meta-openembedded/log/?h=3Dmaster-next
>
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#126953):
> https://lists.openembedded.org/g/openembedded-devel/message/126953
> Mute This Topic: https://lists.openembedded.org/mt/119162735/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000ac5dfe0651ade84d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">there are some build issues I am seeing<div><br></div><div=
><a href=3D"https://errors.yoctoproject.org/Errors/Details/938668/">https:/=
/errors.yoctoproject.org/Errors/Details/938668/</a></div></div><br><div cla=
ss=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Tue, May 12, 2026 at 11:57=E2=80=AFPM Gyorgy Sarvari via <a href=3D"=
http://lists.openembedded.org">lists.openembedded.org</a> &lt;skandigraun=
=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.open=
embedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><br>
On 5/13/26 08:47, AshishKumar Mishra via <a href=3D"http://lists.openembedd=
ed.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wro=
te:<br>
&gt; Hi Team,=C2=A0<br>
&gt; Can team please take this to be merged in master branch=C2=A0<br>
&gt; =C2=A0<br>
<br>
It&#39;s currently undergoing tests in the master-next branch:<br>
<a href=3D"https://git.openembedded.org/meta-openembedded/log/?h=3Dmaster-n=
ext" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/meta=
-openembedded/log/?h=3Dmaster-next</a><br>
<br>
<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#126953): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/126953" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/126953</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119162735/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/119162735/1997914</a><br>
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

--000000000000ac5dfe0651ade84d--

