Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 509ADC43458
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 17:35:19 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.98209.1783100107822078188
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jul 2026 10:35:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rZiBSMe0;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: raj.khem@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-68bd9fce347so1469284a12.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Jul 2026 10:35:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783100105; cv=none;
        d=google.com; s=arc-20260327;
        b=j1H5kUV9VpCTYr2BJ4mYM0y2Kizsx4t9f1g7Veu1dL8ObIa40/RUAB9/R/9EYzOAr4
         H4q9mqzV1qkoQIRXdV7dN1nvzcBnhG0Xe+KFMMHeIMTXIGWah4odOwanO//IocQcv1jG
         IRl3jyPFjmhG7A6Njjdx/8NgMqdJN6v9oSWFitDyEWC2QOjlmC5daL0CGlhNcAEbFz0h
         mtV9S5PQ9tx2JzfULKnyjWeDy4/UutkgPyWktwAbVBPqWcS8GnL1msooXQyaEEA5bIWA
         SHsMBOE1D+Ao6BUhBsYbYwFK/Aj9iLvjcggaxJ9nMTo9c9twOpihAGvUd3C7LkqONdIA
         AlMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jKOLiM/yxPg+J/0f90hmwemakAMcgJ+Ys8+XIsTFIpo=;
        fh=EHpmre0aQYmRysQfwT+hDmUqB39dsf4VzvypXOcdZLg=;
        b=VXKpcbeuk2d/F/s/9BIDu1C5nUfe/jtRrTE6XHBoBJv6JYp+2H3qU+PLaqX2Ni3tQH
         GrCWSpqkoskcjCkGb8+GKbaM+hUdcdEaEw9I5zOxpuqMAw72Cl0YaVRXWgFg4yCfB4yE
         T8gb9jZr4ZNN27O/x1vqlW1Nx9l5YKTETf05DJUQgq0qnvH5sWDs8g3cT+GhLqQ+Mt0q
         mDdqjkC5/Ua+zK4AY1Sc7CqXGOs/2tGL6KfSL9ZAfF5ZTZQgBsBvcFnEuQsMn+TDb9NG
         sbn9MRfj0F6v5IUTa+a5YZoy2a82U7ygPymPUOAyLHbUhq4eBhFSw4yXaUWKFGE4uji3
         0v6A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783100105; x=1783704905; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jKOLiM/yxPg+J/0f90hmwemakAMcgJ+Ys8+XIsTFIpo=;
        b=rZiBSMe0H7ZASZzAVUjP70iOBJZw7YEsAWfMzn3qs6TvKNvZy9lhqmW1NPfBwXb4Wc
         rJpDDD5w+rCeidw0AZrCyJDVta1O2ZHGBOjEjWCuYqOw41ZW2IpQ19xtesEBBYQ/Kct0
         i7jgr744Pt6+IWAPQkjSsZP5MThvFDWW5vWXO/eWSgpA0i4q5zXSlJpucrtriaAKCU7P
         sJaWlIGh7vy8Wn+tZ6Hdj7YXDutfM0WLokS4BynsHCb3H90PVOAuUfKh/jVIsV687Iap
         YtYyqEDx7MWxMvHBfrZ8fvtvxuhq1wfAv/mufzpD+7UPoIJKnjcD8XZIwAyoeERIgseU
         Ev9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783100105; x=1783704905;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jKOLiM/yxPg+J/0f90hmwemakAMcgJ+Ys8+XIsTFIpo=;
        b=QMcQ0rKwGLVXC2GSesHnPyr6gT0DaM/j+0UZWCz/BTYcRxusO56cI2IoA9WyzkVw3L
         HRWtLtvDHYf825a5Y1YX1nBuNySAHgCiK/kWYRTeNukfu5d+WkBHou0cokGctllTfcN9
         cylIH3Wo6GxzhfIRStq2I8OSsXU62PJHkdiQTHVPddjnQ/UMYkFJk4g230XCT+MSeUzJ
         EQR4EcDe78GYrP1D95hgWslMWkTvIlatvZUN9DZKC0fuYSUchFQuIq/uRKBRyHooF7RF
         yQ2NoF7fmOpmGseLVDnGLCmCjmED86KVFRQso6SpzbkfVOFLzibuFp+mLUUaYTvaxaGh
         srag==
X-Gm-Message-State: AOJu0YxqV/9oTB0uDLzbo6cv7MIWkjsGymAiQ3Rkcf9q1NN7R+1Weknx
	oEa1TbOT7IkVp1YmzDSHx2V015BSygDzwJGgDyrbdUGMvjdae+BzNa9VKB0BF3Hb9eA1z4jMCuU
	dwgc1RPdiwhCPpxlADKblJSu+TWRelWo=
X-Gm-Gg: AfdE7ckd8iMmNhpaFRBulWLa2k5f6RqhDiI/qbGzCTD4LrIsCJ+ICtLsqAheTFkFb5Y
	OX1ckQEGsyvj1GGW9HuKpoSHmPAyDhxP8wqkkMGbnrwN+mqRY3t/UhWk8xm9s3NVXwUtf8XVqS8
	CD6C8ra9wmcaOo2K4z8IRJNm9fYGmGyvPh8xo7O3/LFczL7W2qIsENcRUASmir666PKaFe19ut+
	BNrGdqEjLcf2wUK4qgXwFzHdlqF37McDd3Csvm9KFJ1Ry5RyQAqLVWtkpulzpJDs10T6moBC+ro
	OBslhJBvsHwg2VNp8SDxTCa8GK9hDYIkoquSl1gOHgt3VusDyvg9sb7lilQmLNWVXYBshy4P1yl
	2ytu+wTvT8OD1JYs0OPI/4/1vLvdhGeAoRisBrAR2JXbaoHlriASN03OXZyKuKYSg1SWn
X-Received: by 2002:a05:6402:27c8:b0:698:c1ea:c1f7 with SMTP id
 4fb4d7f45d1cf-69a1a3c0751mr90555a12.38.1783100104487; Fri, 03 Jul 2026
 10:35:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260703172800.480930-1-mail@michael-fitzmayer.de>
In-Reply-To: <20260703172800.480930-1-mail@michael-fitzmayer.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 3 Jul 2026 10:34:43 -0700
X-Gm-Features: AVVi8CegZDLun6nHhfXRiM6I83qcJnPAh7VM7JTfs2kbpqsiPdSNaqVnk7QyZaw
Message-ID: <CAMKF1sqx57Qh_=gkVecREUxndur18rj-9hJy0YucXxK+-y-mPA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] canopenterm: update to version 2.03
To: mail@michael-fitzmayer.de
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000053b60f0655b8584a"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Jul 2026 17:35:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128013

--00000000000053b60f0655b8584a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please document what change in license check sums to differ

On Fri, Jul 3, 2026, 10:28=E2=80=AFAM Michael Fitzmayer via lists.openembed=
ded.org
<mail=3Dmichael-fitzmayer.de@lists.openembedded.org> wrote:

> - Added new script to interface CiA 305: Layer setting services (LSS)
> - New API function to set baud rate: can_set_baudrate()
> - Remove usage of white text-color
>
> Signed-off-by: Michael Fitzmayer <mail@michael-fitzmayer.de>
> ---
>  .../{canopenterm_2.02.bb =3D> canopenterm_2.03.bb}          | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>  rename meta-oe/recipes-extended/canopenterm/{canopenterm_2.02.bb =3D>
> canopenterm_2.03.bb} (84%)
>
> diff --git a/meta-oe/recipes-extended/canopenterm/canopenterm_2.02.bb
> b/meta-oe/recipes-extended/canopenterm/canopenterm_2.03.bb
> similarity index 84%
> rename from meta-oe/recipes-extended/canopenterm/canopenterm_2.02.bb
> rename to meta-oe/recipes-extended/canopenterm/canopenterm_2.03.bb
> index 0e8a7a1c8a..0ee94bb052 100644
> --- a/meta-oe/recipes-extended/canopenterm/canopenterm_2.02.bb
> +++ b/meta-oe/recipes-extended/canopenterm/canopenterm_2.03.bb
> @@ -11,14 +11,12 @@ HOMEPAGE =3D "https://canopenterm.de"
>  BUGTRACKER =3D "https://github.com/CANopenTerm/CANopenTerm/issues"
>
>  LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D
> "file://LICENSE.md;md5=3Dbd2edc721b4a0289efe949bdbe7dda79"
> +LIC_FILES_CHKSUM =3D
> "file://LICENSE.md;md5=3D8977ecf3af54da2a5271158cc969bd45"
>
>  DEPENDS =3D "canvenient cjson isocline libinih libsdl3 lua pocketpy"
>
> -PV .=3D "+git"
> -
> -SRC_URI =3D "git://
> github.com/CANopenTerm/CANopenTerm.git;protocol=3Dhttps;branch=3Dmain"
> -SRCREV  =3D "7a9466029a6e88345e65e794ff1779f778c9358a"
> +SRC_URI =3D "git://
> github.com/CANopenTerm/CANopenTerm.git;protocol=3Dhttps;branch=3Dmain;tag=
=3Dv${PV}
> <http://github.com/CANopenTerm/CANopenTerm.git;protocol=3Dhttps;branch=3D=
main;tag=3Dv$%7BPV%7D>
> "
> +SRCREV  =3D "63ccae8262f5e796ffca0c8a44fdf7ff0bd28571"
>
>
>  inherit cmake ptest
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#128012):
> https://lists.openembedded.org/g/openembedded-devel/message/128012
> Mute This Topic: https://lists.openembedded.org/mt/120103307/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000053b60f0655b8584a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Please document what change in license check sums to diff=
er</div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Jul 3, 2026, 10:28=E2=80=AFAM Michael Fitzm=
ayer via <a href=3D"http://lists.openembedded.org">lists.openembedded.org</=
a> &lt;mail=3D<a href=3D"mailto:michael-fitzmayer.de@lists.openembedded.org=
">michael-fitzmayer.de@lists.openembedded.org</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">- Added new script to interfac=
e CiA 305: Layer setting services (LSS)<br>
- New API function to set baud rate: can_set_baudrate()<br>
- Remove usage of white text-color<br>
<br>
Signed-off-by: Michael Fitzmayer &lt;<a href=3D"mailto:mail@michael-fitzmay=
er.de" target=3D"_blank" rel=3D"noreferrer">mail@michael-fitzmayer.de</a>&g=
t;<br>
---<br>
=C2=A0.../{<a href=3D"http://canopenterm_2.02.bb" rel=3D"noreferrer norefer=
rer" target=3D"_blank">canopenterm_2.02.bb</a> =3D&gt; <a href=3D"http://ca=
nopenterm_2.03.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">canopent=
erm_2.03.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 8 +++-----<br>
=C2=A01 file changed, 3 insertions(+), 5 deletions(-)<br>
=C2=A0rename meta-oe/recipes-extended/canopenterm/{<a href=3D"http://canope=
nterm_2.02.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">canopenterm_=
2.02.bb</a> =3D&gt; <a href=3D"http://canopenterm_2.03.bb" rel=3D"noreferre=
r noreferrer" target=3D"_blank">canopenterm_2.03.bb</a>} (84%)<br>
<br>
diff --git a/meta-oe/recipes-extended/canopenterm/<a href=3D"http://canopen=
term_2.02.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">canopenterm_2=
.02.bb</a> b/meta-oe/recipes-extended/canopenterm/<a href=3D"http://canopen=
term_2.03.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">canopenterm_2=
.03.bb</a><br>
similarity index 84%<br>
rename from meta-oe/recipes-extended/canopenterm/<a href=3D"http://canopent=
erm_2.02.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">canopenterm_2.=
02.bb</a><br>
rename to meta-oe/recipes-extended/canopenterm/<a href=3D"http://canopenter=
m_2.03.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">canopenterm_2.03=
.bb</a><br>
index 0e8a7a1c8a..0ee94bb052 100644<br>
--- a/meta-oe/recipes-extended/canopenterm/<a href=3D"http://canopenterm_2.=
02.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">canopenterm_2.02.bb<=
/a><br>
+++ b/meta-oe/recipes-extended/canopenterm/<a href=3D"http://canopenterm_2.=
03.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">canopenterm_2.03.bb<=
/a><br>
@@ -11,14 +11,12 @@ HOMEPAGE =3D &quot;<a href=3D"https://canopenterm.de" r=
el=3D"noreferrer noreferrer" target=3D"_blank">https://canopenterm.de</a>&q=
uot;<br>
=C2=A0BUGTRACKER =3D &quot;<a href=3D"https://github.com/CANopenTerm/CANope=
nTerm/issues" rel=3D"noreferrer noreferrer" target=3D"_blank">https://githu=
b.com/CANopenTerm/CANopenTerm/issues</a>&quot;<br>
<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE.md;md5=3Dbd2edc721b4a0289efe949b=
dbe7dda79&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE.md;md5=3D8977ecf3af54da2a5271158=
cc969bd45&quot;<br>
<br>
=C2=A0DEPENDS =3D &quot;canvenient cjson isocline libinih libsdl3 lua pocke=
tpy&quot;<br>
<br>
-PV .=3D &quot;+git&quot;<br>
-<br>
-SRC_URI =3D &quot;git://<a href=3D"http://github.com/CANopenTerm/CANopenTe=
rm.git;protocol=3Dhttps;branch=3Dmain" rel=3D"noreferrer noreferrer" target=
=3D"_blank">github.com/CANopenTerm/CANopenTerm.git;protocol=3Dhttps;branch=
=3Dmain</a>&quot;<br>
-SRCREV=C2=A0 =3D &quot;7a9466029a6e88345e65e794ff1779f778c9358a&quot;<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/CANopenTerm/CANopenTe=
rm.git;protocol=3Dhttps;branch=3Dmain;tag=3Dv$%7BPV%7D" rel=3D"noreferrer n=
oreferrer" target=3D"_blank">github.com/CANopenTerm/CANopenTerm.git;protoco=
l=3Dhttps;branch=3Dmain;tag=3Dv${PV}</a>&quot;<br>
+SRCREV=C2=A0 =3D &quot;63ccae8262f5e796ffca0c8a44fdf7ff0bd28571&quot;<br>
<br>
<br>
=C2=A0inherit cmake ptest<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#128012): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/128012" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">https://lists.openembedded.org/g/openembedded-devel/message/128012</a=
><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120103307/199=
7914" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/mt/120103307/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank" rel=3D"noreferrer">openembedded-devel+owner@lists.=
openembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.opene=
mbedded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmai=
l.com" target=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000053b60f0655b8584a--

