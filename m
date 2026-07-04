Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B9E0C43458
	for <webhook@archiver.kernel.org>; Sat,  4 Jul 2026 07:58:07 +0000 (UTC)
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.109903.1783151878624184230
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Jul 2026 00:57:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=f0MsQ/Jd;
 spf=pass (domain: gmail.com, ip: 74.125.224.41, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-664a09bc459so1733894d50.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Jul 2026 00:57:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783151877; cv=none;
        d=google.com; s=arc-20260327;
        b=RON5moWbeP4mw1DsYlNYLU93RbWcOWLpkFziNvCBevqnWfzW/9E5GUpIvRyp1+OcXU
         IzRIfmCKOZrBTJdkvsO7yb4ufK7hYefghkG/I4FzAS2EHH3KcYOTDItSWfcrXrtyXZMB
         gX4SGPcr8Q2wc/VFsE2hJSWc8xXTsg+c3ZRfdtF0IzBY95y3SoWP41ADxdcLjN87DOKL
         NtDYByrrCXY7Woen3QG7FIpwR6kRI0FsKcH1aOmJKYGjRn/fRRVXPnngkgYIk7tQQSbo
         wSIsAT1I4nOuBgjT2eV32hUNYGqn/pd3OeFK+LniA8NK5q19qC0b5m1nh6CO8UTaE3QC
         JBjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XqgXzFXGIC3uPe2Gt6EY+Wv2YEjgRjvDuOlvPthNxtw=;
        fh=tvH0fRzsTzWp7W9pVcVBj/Hg9HcaDtV/l9F/msdGtu4=;
        b=rRRSP7uwDSCRwwAgYqU1ULQlhk+3YM8hBw+Ky4AU2cjHwy+Q8ti5JVgVC961ZqcGuO
         g9nT/Uy2G08FfWJnNK9c1l+RWHKuYHdThKCfVPLiTTB7bx8N5qMHjNS/4PjW21z6Kq4A
         bSNfp27XaVkWgvIquPDQBTPv9R2nOfP6+F/DNllq/k4EukAN5Py1gEV93mOJaRsv/5TI
         XC/k7++O/d6ev5c14LoaFeWECUhv02BjLN9myTNuHzOHKqHLRNkU3JFxpTn/7gRkiaP6
         ZEL4ZRDT3gzLy7Sgvoj5Ko9wKA91C4ooX8S0ZHQ/bRP4rrAnIByGt6WnFowUsuHz6xKO
         HIEA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783151877; x=1783756677; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XqgXzFXGIC3uPe2Gt6EY+Wv2YEjgRjvDuOlvPthNxtw=;
        b=f0MsQ/JdT4TMpfizh/RPWhaOSVoHRSUdmWIiWKTWhdBKthzfuv45HayGh8VXqRqwK7
         TQxc9a6PP7LwjRhrV81JO4SbuE54MvsNMfa4ny20yd0np6QRT2i883c2v6wl2D/Q6t1z
         n7Ohph4u2zbdp3S6at7yhlmbzBv7MWe/Kthy8VSn5o/RnjjLZV2ITLmYLIJF6dMU8itz
         iEI/hos8gDsHU5+VG1Zfz97pygi6/rEG7mrVdrruT1WRbsTpy+1OAlT3PWb8rxjRxSGj
         1q6rsBoNz/ARGUFfyg9vH48hKp05oj7EAPJU0aDJ2ei6S49RPNlk6WqOuYeQwYngv0mM
         TX/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783151877; x=1783756677;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XqgXzFXGIC3uPe2Gt6EY+Wv2YEjgRjvDuOlvPthNxtw=;
        b=PWAwrjVI4XbKfgLx6bQJNpMAJYfrOWD9efiQq7ckrQhj8pGxt2mWhwMcGQKYgjByiN
         tmJUV9EuMSRBR0nDH5BcU8zWvPGaMDulbwTmIuktlcbQV2V5lkbm3cJ4G4zc8057TC/y
         LQcmB4MFfXZWu7zjPCaFVWUjficIlikTyJmpYNqW9HwP9oKamGhkdQWGE0DTIh1D6s1G
         XZgUBkirmWnKDlKeIp/GjfvuEtvM4JrceSzPGrrjsfcamD7z3m6UFnnkMvTBsXi94BrB
         uY/99JB59O4Iy3YzHHIMYN5uZ6j3kS81R1Z0lH+EwvVM2aAcEDwBx1OXty+kldy1t2hZ
         qCMg==
X-Gm-Message-State: AOJu0Yyt91qvNlgnrTd3Jg6k/32cs+JtqAUWOqSyKU1HyQPI2E3MMGau
	OVO0qhQRRaA7ivb2iktf+H3XNAi4jli2xoqKS9wfRZvxeaz2Lbe6BdGpswsJG1WXWNPiXyi3nvs
	QnuadBjg7WO3oce6j9U2UaE4Z7jIm0lo=
X-Gm-Gg: AfdE7clwOD9XKjcaVQA+4rXXGmk8p8W60EPWVgWM3gxJmujxmLdLzJWNk1nz6uP0Do1
	RcQxFY5KrnBHrHFxAG5/qYJs/ERQWWxmQb/iGcCck9AqnFnSB8ifQ+N+OEBBSJZ28VgXY+lghBy
	QKEtWZVaNwqZEjj81FERUO0RGktTLhikMvtni/qkFKvUH+RWguYcMKhJk2KafaSmn2VhrDCmup1
	gvEauiBVvWTX2MTthVi/hYaS8FvX4tT5pI0WeGXmkZE0uwabUSxahABYmgz84eP6b4IBHAtwdrc
	Oq8rZCcWWWwVpFF9PrXzFcIhvPQgk27ceVIIocHPrCwD6Uzc9EaGXiW81y5qw+bgpMZ8Y+/TroL
	1mH0wImIBNxUz210F/TdD1nzMdP7HGNsFH5PPDi/1Tcgbg8vXTyPvughFdXUrf86Dw8sRag==
X-Received: by 2002:a53:b177:0:b0:664:ae6b:b49f with SMTP id
 956f58d0204a3-6665305985bmr1707266d50.84.1783151877375; Sat, 04 Jul 2026
 00:57:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260704053656.648316-1-mail@michael-fitzmayer.de>
 <CAMKF1sr-o4FHMJrCZ4MWtTR8RC1qvLBoq7k-gvqD=7bYZW4XQA@mail.gmail.com> <002001dd0b88$b8a65830$29f30890$@michael-fitzmayer.de>
In-Reply-To: <002001dd0b88$b8a65830$29f30890$@michael-fitzmayer.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 4 Jul 2026 00:57:29 -0700
X-Gm-Features: AVVi8Ce9pLTi_Pm1y_xSocuktPyl4kcYt8BehOHkJ63uT-UmsQYV3WSNb49Ja2w
Message-ID: <CAMKF1soY-Zwxz=7tizLN3gegSt6FeRNri+xU-SQ2Wdqb9hMSdw@mail.gmail.com>
Subject: Re: [oe] [PATCH] canopenterm: update to version 2.03
To: mail@michael-fitzmayer.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000003b4d1d0655c466a1"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Jul 2026 07:58:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128021

--0000000000003b4d1d0655c466a1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://lore.kernel.org/openembedded-devel/20260704053511.647800-1-mail@mic=
hael-fitzmayer.de/T/#u

On Sat, Jul 4, 2026 at 12:42=E2=80=AFAM Michael Fitzmayer via lists.openemb=
edded.org
<mail=3Dmichael-fitzmayer.de@lists.openembedded.org> wrote:

> Hi,
>
> thanks. What do you mean by =E2=80=9Cdropped the hunk=E2=80=9D?
>
>
>
> I didn=E2=80=99t change much:
>
>
>
> 14c14
>
> < LIC_FILES_CHKSUM =3D
> "file://LICENSE.md;md5=3Dbd2edc721b4a0289efe949bdbe7dda79"
>
> ---
>
> > LIC_FILES_CHKSUM =3D
> "file://LICENSE.md;md5=3D8977ecf3af54da2a5271158cc969bd45"
>
> 18,21c18,19
>
> < PV .=3D "+git"
>
> <
>
> < SRC_URI =3D "git://
> github.com/CANopenTerm/CANopenTerm.git;protocol=3Dhttps;branch=3Dmain"
>
> < SRCREV  =3D "7a9466029a6e88345e65e794ff1779f778c9358a"
>
> ---
>
> > SRC_URI =3D "git://
> github.com/CANopenTerm/CANopenTerm.git;protocol=3Dhttps;branch=3Dmain;tag=
=3Dv${PV}
> <http://github.com/CANopenTerm/CANopenTerm.git;protocol=3Dhttps;branch=3D=
main;tag=3Dv$%7BPV%7D>
> "
>
> > SRCREV  =3D "63ccae8262f5e796ffca0c8a44fdf7ff0bd28571"
>
>
>
> *From:* Khem Raj <raj.khem@gmail.com>
> *Sent:* 04 July 2026 08:58
> *To:* mail@michael-fitzmayer.de
> *Cc:* openembedded-devel@lists.openembedded.org
> *Subject:* Re: [oe] [PATCH] canopenterm: update to version 2.03
>
>
>
> On Fri, Jul 3, 2026 at 10:37=E2=80=AFPM Michael Fitzmayer via
> lists.openembedded.org <mail=3Dmichael-fitzmayer.de@lists.openembedded.or=
g>
> wrote:
>
> - Added new script to interface CiA 305: Layer setting services (LSS)
> - New API function to set baud rate: can_set_baudrate()
> - Remove usage of white text-color
> - License-Update: update year in copyright
>
>
>
> This looks ok.
>
>
>
> this version dropped the hunk against do_install. Is this intentional ?
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#128020):
> https://lists.openembedded.org/g/openembedded-devel/message/128020
> Mute This Topic: https://lists.openembedded.org/mt/120110277/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000003b4d1d0655c466a1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><a href=3D"https://lore.kernel.org/openembedded-devel/2026=
0704053511.647800-1-mail@michael-fitzmayer.de/T/#u">https://lore.kernel.org=
/openembedded-devel/20260704053511.647800-1-mail@michael-fitzmayer.de/T/#u<=
/a></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"l=
tr" class=3D"gmail_attr">On Sat, Jul 4, 2026 at 12:42=E2=80=AFAM Michael Fi=
tzmayer via <a href=3D"http://lists.openembedded.org">lists.openembedded.or=
g</a> &lt;mail=3D<a href=3D"mailto:michael-fitzmayer.de@lists.openembedded.=
org">michael-fitzmayer.de@lists.openembedded.org</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><div class=3D"msg8977771212=
526145322"><div lang=3D"EN-GB"><div class=3D"m_8977771212526145322WordSecti=
on1"><p class=3D"MsoNormal"><span>Hi,<u></u><u></u></span></p><p class=3D"M=
soNormal"><span>thanks. What do you mean by =E2=80=9C</span>dropped the hun=
k=E2=80=9D?<u></u><u></u></p><p class=3D"MsoNormal"><span><u></u>=C2=A0<u><=
/u></span></p><p class=3D"MsoNormal"><span>I didn=E2=80=99t change much:<u>=
</u><u></u></span></p><p class=3D"MsoNormal"><span><u></u>=C2=A0<u></u></sp=
an></p><p class=3D"MsoNormal"><span>14c14<u></u><u></u></span></p><p class=
=3D"MsoNormal"><span>&lt; LIC_FILES_CHKSUM =3D &quot;file://LICENSE.md;md5=
=3Dbd2edc721b4a0289efe949bdbe7dda79&quot;<u></u><u></u></span></p><p class=
=3D"MsoNormal"><span>---<u></u><u></u></span></p><p class=3D"MsoNormal"><sp=
an>&gt; LIC_FILES_CHKSUM =3D &quot;file://LICENSE.md;md5=3D8977ecf3af54da2a=
5271158cc969bd45&quot;<u></u><u></u></span></p><p class=3D"MsoNormal"><span=
 lang=3D"DE">18,21c18,19<u></u><u></u></span></p><p class=3D"MsoNormal"><sp=
an lang=3D"DE">&lt; PV .=3D &quot;+git&quot;<u></u><u></u></span></p><p cla=
ss=3D"MsoNormal"><span lang=3D"DE">&lt;<u></u>=C2=A0<u></u></span></p><p cl=
ass=3D"MsoNormal"><span lang=3D"DE">&lt; SRC_URI =3D &quot;git://<a href=3D=
"http://github.com/CANopenTerm/CANopenTerm.git;protocol=3Dhttps;branch=3Dma=
in" target=3D"_blank">github.com/CANopenTerm/CANopenTerm.git;protocol=3Dhtt=
ps;branch=3Dmain</a>&quot;<u></u><u></u></span></p><p class=3D"MsoNormal"><=
span>&lt; SRCREV=C2=A0 =3D &quot;7a9466029a6e88345e65e794ff1779f778c9358a&q=
uot;<u></u><u></u></span></p><p class=3D"MsoNormal"><span>---<u></u><u></u>=
</span></p><p class=3D"MsoNormal"><span>&gt; SRC_URI =3D &quot;git://<a hre=
f=3D"http://github.com/CANopenTerm/CANopenTerm.git;protocol=3Dhttps;branch=
=3Dmain;tag=3Dv$%7BPV%7D" target=3D"_blank">github.com/CANopenTerm/CANopenT=
erm.git;protocol=3Dhttps;branch=3Dmain;tag=3Dv${PV}</a>&quot;<u></u><u></u>=
</span></p><p class=3D"MsoNormal"><span>&gt; SRCREV=C2=A0 =3D &quot;63ccae8=
262f5e796ffca0c8a44fdf7ff0bd28571&quot;<u></u><u></u></span></p><p class=3D=
"MsoNormal"><span><u></u>=C2=A0<u></u></span></p><p class=3D"MsoNormal"><b>=
<span lang=3D"EN-US">From:</span></b><span lang=3D"EN-US"> Khem Raj &lt;<a =
href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>=
&gt; <br><b>Sent:</b> 04 July 2026 08:58<br><b>To:</b> <a href=3D"mailto:ma=
il@michael-fitzmayer.de" target=3D"_blank">mail@michael-fitzmayer.de</a><br=
><b>Cc:</b> <a href=3D"mailto:openembedded-devel@lists.openembedded.org" ta=
rget=3D"_blank">openembedded-devel@lists.openembedded.org</a><br><b>Subject=
:</b> Re: [oe] [PATCH] canopenterm: update to version 2.03<u></u><u></u></s=
pan></p><div><p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p><div><div><p cl=
ass=3D"MsoNormal">On Fri, Jul 3, 2026 at 10:37=E2=80=AFPM Michael Fitzmayer=
 via <a href=3D"http://lists.openembedded.org" target=3D"_blank">lists.open=
embedded.org</a> &lt;mail=3D<a href=3D"mailto:michael-fitzmayer.de@lists.op=
enembedded.org" target=3D"_blank">michael-fitzmayer.de@lists.openembedded.o=
rg</a>&gt; wrote:<u></u><u></u></p></div><blockquote style=3D"border-width:=
medium medium medium 1pt;border-style:none none none solid;border-color:cur=
rentcolor currentcolor currentcolor rgb(204,204,204);padding:0cm 0cm 0cm 6p=
t;margin-left:4.8pt;margin-right:0cm"><p class=3D"MsoNormal">- Added new sc=
ript to interface CiA 305: Layer setting services (LSS)<br>- New API functi=
on to set baud rate: can_set_baudrate()<br>- Remove usage of white text-col=
or<br>- License-Update: update year in copyright<u></u><u></u></p></blockqu=
ote><div><p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p></div><div><p class=
=3D"MsoNormal">This looks ok.<u></u><u></u></p></div><div><p class=3D"MsoNo=
rmal">=C2=A0<u></u><u></u></p></div><div><p class=3D"MsoNormal">this versio=
n dropped the hunk against do_install. Is this intentional ?<u></u><u></u><=
/p></div><div><p class=3D"MsoNormal">=C2=A0<u></u><u></u></p></div></div></=
div></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#128020): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/128020" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/128020</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120110277/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/120110277/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</div></blockquote></div>

--0000000000003b4d1d0655c466a1--

