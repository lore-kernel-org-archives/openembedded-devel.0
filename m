Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC2BECDB47A
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 02:45:55 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9641.1763088352415189611
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Nov 2025 18:45:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LfafDwgR;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-78817f3af10so15139267b3.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 18:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763088351; x=1763693151; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aIAIPSUjIlsp2f2xeTpox+iCJijGqz/x1kYYFEiq+pw=;
        b=LfafDwgR59nrFY7icTnPDYF7Or1pXaSksGnSXf/orZWgzG4fbAQhBM+4amRhE1IS7T
         am2FiS4oVhWLEZPp+BIvFWlTxz/g5Ar2cLn43fcgqV5ervXGW3bU7A0lFcGwrdspM+Iy
         ia4CFeeX8PEfAaswW31ynFcJ6QsDOAAUNUpT9KBeeNkuLSNLHlagJb0e7Q6tOKEN1oVi
         T3prrrL3/9KdsDE5KldWqpMZ56nam+P8In0A+7dSvZjCRwEFzl+pc+nM441FRqw0FMCH
         2GRod+kFHhricEZOPbzMb9BB6WCx8o/H2/zUs8Ta3k1ptn/3Wnz2di4DxomrxFjs0bDu
         svWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763088351; x=1763693151;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aIAIPSUjIlsp2f2xeTpox+iCJijGqz/x1kYYFEiq+pw=;
        b=FtCkJ8iWCczNw5RsJB41mfz4nzTX4rJxoqw/R7LhR9+TuHRym2IEma/hXqPDXd1dQs
         pAQbI602yXXV7f7S5ddPpiZ19OtcISrPP3ZiJtv4LUTY+FMUE5AUvnFvysdXe3NCwz1C
         BLwsxzhnqtFCY3Q0henXnsoZzWdyuuGCTeGtmbNNQ6EMCuwMcY97pICnufgtS7tEnFta
         s2WU0qRreL3sOCIBkpEaOAYiIyl6PTMvUU6Fcyz2IgFDHrTEhRGgPwxr3Nsg3WIp4qVO
         /cejKv1XtntZNnT4WZN/LJlrHbYgWskke5axWAyIhToXzkSFjSCL/cfftx4XN9kNs3um
         S/xA==
X-Forwarded-Encrypted: i=1; AJvYcCURizKBQ2riA1i9+Kh87UPrbK7TLo1UM6rt95eGjgBpwGjoFbGUwiNbGEy16b/CkGuH5sSbGUMka23Z0qDy71bhabQ=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy24KwaNCMquBtDvr9457w3xG2eWkjUR+mKa5zYkABs8JsrO8Te
	rGWcctHz/+CHXQBHdAJi9ki9LFZ+JmI8/TkgflOw1yMf+e+ik8fBnXALjXPTdJyitAfEuWbfZR8
	j1HT0/viDUecpqUx9GGtGKQU5eP5QIC4=
X-Gm-Gg: ASbGncvMgS7aG0sIMkd6UMFQlJ6dxreB646B0YwVPdMkPzl9Y1NYqqif3FRQ7P/qbLQ
	IfITiMwyeCUCEof72zordEbuhqTXM1UsKrnoEB+1bEAQw6DrnbjF3zBjSUj38DZWSMUb5TE72Jv
	Hg735MlsvLukQTlZ+4aizAvOMF9mx04hfOJ0NPsA6SZrwZdBgl18CcrOEBj1vk/5GvfRH5ZTFhx
	f+D7butObGaxqW9Mzgdk8lmIHzEFPybpDKZolJ17bCJzkLwb3GHcwuVi+gpWRPvhFKeGULiii6r
	PKVZ60WQ0IcykoCXYLVRQd8MH1wKO5fsQRk1p4cRP+d0EI1pF+bczQBE++5LA8iavti4K3lpcRs
	yV1lkS5zSB3T33H/CbP8SRSQV6+BixFQF1qLAaXtS+DqMOg==
X-Google-Smtp-Source: AGHT+IHc5wGvTQLNk79tzbz4rQ9EcegMxOdBG1+ZroXmWpAp2LjBxJ53+bUI1ojngz1/9ig7tQqrSfv/7jAnp1BojwY=
X-Received: by 2002:a05:690c:6c0c:b0:786:61c6:7e43 with SMTP id
 00721157ae682-78929ecc952mr16144847b3.35.1763088351484; Thu, 13 Nov 2025
 18:45:51 -0800 (PST)
MIME-Version: 1.0
References: <20251114020447.2540986-1-f_l_k@t-online.de> <CAMKF1srJz=zBHjUWNECb2OAn9Q6v0gV4YNkjoVefGz_yaSnENA@mail.gmail.com>
 <783P5T.46ELW3NU5ONA2@t-online.de>
In-Reply-To: <783P5T.46ELW3NU5ONA2@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Nov 2025 18:45:25 -0800
X-Gm-Features: AWmQ_bmy4xrKhHkM_zwkm6biMNL-4DGew-8RBi7zbUs72iQY8xoJeIJ8TJkgZYQ
Message-ID: <CAMKF1sp920D=Ffjtekgfv1k4raF5xkqmUNUcXZUYwUbtW4SXMg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] fex: add recipe
To: f_l_k@t-online.de
Cc: "Khem Raj via lists.openembedded.org" <raj.khem=gmail.com@lists.openembedded.org>, 
	openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e5e054064384fea1"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 02:45:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121672

--000000000000e5e054064384fea1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 13, 2025 at 6:36=E2=80=AFPM Markus Volk via lists.openembedded.=
org
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:

> On Thu, Nov 13 2025 at 18:18:40 -08:00:00, Khem Raj via
> lists.openembedded.org <raj.khem=3Dgmail.com@lists.openembedded.org> wrot=
e:
>
> You. can just add LDFLAGS +=3D "-fuse-ld=3Dlld" instead of demanding the
> distro feature
> that will make it work with wider variety of distro settings, not many OE
> distros default to LLD yet.
>
>
> It works like that. But I also added the feature_check because I was
> afraid that it would break meta-openembedded world build.
> If you try to build fex with gcc toolchain it will throw an error
>

Once you set TOOLCHAIN =3D "clang" then gcc is out of picture.


>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#121670):
> https://lists.openembedded.org/g/openembedded-devel/message/121670
> Mute This Topic: https://lists.openembedded.org/mt/116286410/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000e5e054064384fea1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 13,=
 2025 at 6:36=E2=80=AFPM Markus Volk via <a href=3D"http://lists.openembedd=
ed.org">lists.openembedded.org</a> &lt;f_l_k=3D<a href=3D"mailto:t-online.d=
e@lists.openembedded.org">t-online.de@lists.openembedded.org</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div id=3D"m_-8=
380749001017321207geary-body" dir=3D"auto">On Thu, Nov 13 2025 at 18:18:40 =
-08:00:00, Khem Raj via <a href=3D"http://lists.openembedded.org" target=3D=
"_blank">lists.openembedded.org</a> &lt;raj.khem=3D<a href=3D"mailto:gmail.=
com@lists.openembedded.org" target=3D"_blank">gmail.com@lists.openembedded.=
org</a>&gt; wrote:<br><blockquote type=3D"cite"><div>You. can just add LDFL=
AGS=C2=A0+=3D &quot;-fuse-ld=3Dlld&quot; instead of demanding the distro fe=
ature</div><div>that will make it work with wider variety of distro setting=
s, not many OE distros default to LLD yet.</div></blockquote><div><br></div=
><div>It works like that. But I also added the feature_check because I was =
afraid that it would break meta-openembedded world build.</div><div>If you =
try to build fex with gcc toolchain it will throw an error</div></div></blo=
ckquote><div><br></div><div>Once you set TOOLCHAIN =3D &quot;clang&quot; th=
en gcc is out of picture.</div><div>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#121670): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/121670" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/121670</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116286410/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116286410/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000e5e054064384fea1--

