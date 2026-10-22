Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.243.1792702676811260580
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Oct 2026 13:57:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=aVnK/mEr;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b118bea471so1777197b3.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Oct 2026 13:57:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792702676; cv=none;
        d=google.com; s=arc-20260327;
        b=Bl+xlifiAXbjaB4Gn1COPy/tig3HbpRur6oJeDTDpDEq44VPm+ZHGMorkLJG0Z6iGC
         pSk7MQrntwxGOHnpSvLy5HnQqywXYbuPiQ3jBZRBhyYLubsrFGigEyyBJg50xlFWpf5h
         KPX5Ni6JAeRWzTBRIPl1BtaRruTpfl74Vyf+gWZIdua80O/gi3mLmQ4MukZFgZ896vp0
         CIyqF5XLXitBPNrIM1/l5poXfC7EGwUuHV2LM4ObaC9OlEMCIDrAsN6/MBW4ZKF7/e9r
         WaHYWFpH1KSP8chAWo/3E+n77ZcEL+1PC40gAdxfmqvBjjAtJ4GViA+zptvXOXRllP36
         QRrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EXOOgewLq2EuBYeMSpXJ5QorklObn7iFbq5pPTkjE8Q=;
        fh=2nN/GzVxUjERD0LNgf9vNaPM58ZIkCHYlMJQEwcNq0M=;
        b=XAtjKVfTEHOQ44pk/UpAyQVQXlZ0HCWorupOGKyKHbj/e/S5al68svt/BwjzuEMRr8
         zdZ+hJf1DII1HL2u/CH0H3QGdBN8IiZ9HRhUhl/8l81/uBoIvJGHOLBHw5k9Dlh0cArw
         Jh/y4VW9ajjgTllaOMsxgp+40LVVNAqtcqleseQF0NCQkiaxPE7U/PR8EQZTLFZjPFaj
         kAm0zVZYkFALmaxwL9t6Cghc5z9yPs97zVY999Q5ydrp+b7rKf3WFOhu6z1K/y3JRCNo
         7GaAdBAXmSNB/ArorWkVJ/NdHbRONCJq4mNYr+Yt/RWyWW64+NOhC2b7G4z+MpfrZQNL
         AowQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792702676; x=1793307476; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EXOOgewLq2EuBYeMSpXJ5QorklObn7iFbq5pPTkjE8Q=;
        b=aVnK/mErX+LQf3UsbHpR5elwF15mWnT7yraBvnqF2JQchZim0jEaWHFI+uAfvHt+oR
         Ju6RWUW0Eu2iSvcnnJnxNx6gGPy0rLdncbIPV/qv5ogojt0aDD3EfiRgY4D60u8qu4ta
         8jdgdnpfeKnO+ofKx8ik3MZ5Otr97oIs7yeWD2zGpY1JyCvcARQcaBRol78ziPNGo7Kb
         SUXGlHOjEGOclx8VNoLf1/CJ8kFIMmNuMbD1/AG8gwgbX5vB7PhFSxRI342SaVaKDZRH
         O9AMNiyVq8XKbkWSw8Fpsrl7upq4ENShcDQKEiVC89ls+XvJa11CExpUpQ2UJrYikva7
         lmag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792702676; x=1793307476;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EXOOgewLq2EuBYeMSpXJ5QorklObn7iFbq5pPTkjE8Q=;
        b=Ps0ICQLREkXdhr331G71QfTMKeXGwt2GZBvRfPkc1MjfJTaVq+ajtMIFqn0vY6Rwun
         aAKW2H22RR3yym6XUulOcKYJAI9XbvjMc45L4ikjPPrAyWxlmltDHH0tn1NznN202Viy
         Oe7WXlsnCpF9SPWTKBS9D8LB+T34BENVMIQrilsoPkwCOD7GYAWp0TEIlPKc7Qk0aw9t
         /EiB1zlTmFCaIcdmsbDe0Jhwyy3lshe2oqYVcFJaj3zo/D4kP67zHEZJaop4RuqW2rkb
         Xj+ep/iOS0nPMp46sQ+cxycKWRufxBOP3ycTCqZapY/vkfE82QnnmvJ+VEHgCtHvFCpd
         LhJw==
X-Gm-Message-State: AFq9FYKcfvBJUpY356J3rUn41F+9LGOJTB75uMAZgwHFeeJbx7jgqcNP
	39R0tPqBfwnnJn8RpfiPgz4bMlRsvcfeJHvl3bXty20ZdPfre4kj7AIYlZEF/rBSZ5J/lrkTv6O
	W6xe4/6LDzAu+3jZUhbFway+/Y0dxOvYqGvB1LJZxyA==
X-Gm-Gg: AYBFou2glXqnWC27IEsq7apUNbhf2GPbQBjwIk/FNWZomk8L3Enee4hoiONu2GTtVcX
	GUO//m0DooCkn/2Pm/Ip9TG2fXfjUNyDQZgu7vqCusa7/B3jZxoCaPTAyRnK1uGWwMAjDTAuub7
	IetgN+0MlCALzqpr/A/D7FLReqmCkjNR+2VFq+Kbs3cYltctY7orFsDDrTXHtpIz1UlxfxdqR7f
	Ntw53rz5/4aFhQjM+3Xyj0kEZXTVqY465XLmb7ks4M+In5Inj5zqaATcfsiOSoZ451NToeyvCX8
	irzYFyTq7AyVNxZkaExG7Z37411q25OZuZKh7MJE0MjzNl9oZzHhYTipBGAXwL+iW/tJeRQ+8Gx
	e1S6QLhHAPRe6D9xYsOlMOt2LdQfP5K8eBbmRnXInM4KiDhNkA7BYR4vcaMFRhdX0Wzs80T+gpJ
	hZdwSWyMOKTGXftk9aFvPww1ddDRS0sV3kuHQQ9QEZDmJ3Tyb6KL5j+f1qiUdnakbrMH3XBAYtf
	jkPICgcuuFIKq7VJ02qPfP5x3Mnh4avo8NTJSryFTF8PTSvrECx6zdYgCasbMt2wEXffBYS/Y2O
	Bosb9KX2SfFcuH/hk9LmCEF9EcDdQh0SK1I5D7gGnTjkUGtptoigkbAacIgldDl3
X-Received: by 2002:a05:690c:298:b0:8b1:901:b9ee with SMTP id
 00721157ae682-8b157cf45f4mr1881337b3.13.1792702675746; Thu, 22 Oct 2026
 13:57:55 -0700 (PDT)
MIME-Version: 1.0
References: <20261019125616.3888504-1-leon.anavi@konsulko.com> <20261019125616.3888504-8-leon.anavi@konsulko.com>
In-Reply-To: <20261019125616.3888504-8-leon.anavi@konsulko.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 22 Oct 2026 13:57:29 -0700
X-Gm-Features: AclHuK_IaXvdihJOJsNJ7SMVVfdfIZL9YUoNh_OG6cjfHUx6cHp19iX9l_Vfd5c
Message-ID: <CAMKF1so-bmA6gw-BgrNeh1uzR_=pUPJ3n=BKKD==tvc76OVWqQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 08/10] python3-cchardet: Upgrade 2.1.7
 -> 2.4.0
To: leon.anavi@konsulko.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000002d03cd065e741edd"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 22 Oct 2026 20:58:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131317

--0000000000002d03cd065e741edd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

There is new QA diagnostic

WARNING: python3-cchardet-2.4.0-r0 do_check_backend: QA Issue: inherits
setuptools3 but has pyproject.toml specifying backend
setuptools.build_meta, use the correct class [pep517-backend]

On Mon, Oct 19, 2026 at 5:56=E2=80=AFAM Leon Anavi via lists.openembedded.o=
rg
<leon.anavi=3Dkonsulko.com@lists.openembedded.org> wrote:

> Upgrade to release 2.4.0:
>
> - Supports Python 3.15, including the free-threaded CPython 3.15
>   build, with tests and wheels for Linux, macOS, and Windows.
> - Publishes Windows ARM64 wheels, and builds Linux aarch64 wheels
>   on native arm64 runners instead of under QEMU emulation.
> - Tests every supported Python version on arm64 Linux and Windows
>   in addition to x86-64.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  .../{python3-cchardet_2.1.7.bb =3D> python3-cchardet_2.4.0.bb}    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-python/recipes-devtools/python/{python3-cchardet_2.1.7.bb =
=3D>
> python3-cchardet_2.4.0.bb} (74%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-cchardet_2.1.7.b=
b
> b/meta-python/recipes-devtools/python/python3-cchardet_2.4.0.bb
> similarity index 74%
> rename from meta-python/recipes-devtools/python/python3-cchardet_2.1.7.bb
> rename to meta-python/recipes-devtools/python/python3-cchardet_2.4.0.bb
> index b59c289c51..0aefe92942 100644
> --- a/meta-python/recipes-devtools/python/python3-cchardet_2.1.7.bb
> +++ b/meta-python/recipes-devtools/python/python3-cchardet_2.4.0.bb
> @@ -3,7 +3,7 @@ HOMEPAGE =3D "https://github.com/PyYoshi/cChardet"
>  LICENSE =3D "MPL-1.1"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6ecda54f6f525388d71d6b3cd92f7=
474"
>
> -SRC_URI[sha256sum] =3D
> "c428b6336545053c2589f6caf24ea32276c6664cb86db817e03a94c60afa0eaf"
> +SRC_URI[sha256sum] =3D
> "7b062e7e92e5ab1a00aaf5c164d5f056daae648ba1f144082baf5b4c229b794e"
>
>  inherit pypi setuptools3 cython
>
> --
> 2.47.3
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#131123):
> https://lists.openembedded.org/g/openembedded-devel/message/131123
> Mute This Topic: https://lists.openembedded.org/mt/121830551/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000002d03cd065e741edd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">There is new QA diagnostic=C2=A0<div><br></div><div>WARNIN=
G: python3-cchardet-2.4.0-r0 do_check_backend: QA Issue: inherits setuptool=
s3 but has pyproject.toml specifying backend setuptools.build_meta, use the=
 correct class [pep517-backend]</div></div><br><div class=3D"gmail_quote gm=
ail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 19, =
2026 at 5:56=E2=80=AFAM Leon Anavi via <a href=3D"http://lists.openembedded=
.org">lists.openembedded.org</a> &lt;leon.anavi=3D<a href=3D"mailto:konsulk=
o.com@lists.openembedded.org">konsulko.com@lists.openembedded.org</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Upgrade to=
 release 2.4.0:<br>
<br>
- Supports Python 3.15, including the free-threaded CPython 3.15<br>
=C2=A0 build, with tests and wheels for Linux, macOS, and Windows.<br>
- Publishes Windows ARM64 wheels, and builds Linux aarch64 wheels<br>
=C2=A0 on native arm64 runners instead of under QEMU emulation.<br>
- Tests every supported Python version on arm64 Linux and Windows<br>
=C2=A0 in addition to x86-64.<br>
<br>
Signed-off-by: Leon Anavi &lt;<a href=3D"mailto:leon.anavi@konsulko.com" ta=
rget=3D"_blank">leon.anavi@konsulko.com</a>&gt;<br>
---<br>
=C2=A0.../{<a href=3D"http://python3-cchardet_2.1.7.bb" rel=3D"noreferrer" =
target=3D"_blank">python3-cchardet_2.1.7.bb</a> =3D&gt; <a href=3D"http://p=
ython3-cchardet_2.4.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-ccha=
rdet_2.4.0.bb</a>}=C2=A0 =C2=A0 | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-cchardet_2.1.7.bb" rel=3D"noreferrer" target=3D"_blank">python3-cchardet_2=
.1.7.bb</a> =3D&gt; <a href=3D"http://python3-cchardet_2.4.0.bb" rel=3D"nor=
eferrer" target=3D"_blank">python3-cchardet_2.4.0.bb</a>} (74%)<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
cchardet_2.1.7.bb" rel=3D"noreferrer" target=3D"_blank">python3-cchardet_2.=
1.7.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
cchardet_2.4.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-cchardet_2.=
4.0.bb</a><br>
similarity index 74%<br>
rename from meta-python/recipes-devtools/python/<a href=3D"http://python3-c=
chardet_2.1.7.bb" rel=3D"noreferrer" target=3D"_blank">python3-cchardet_2.1=
.7.bb</a><br>
rename to meta-python/recipes-devtools/python/<a href=3D"http://python3-cch=
ardet_2.4.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-cchardet_2.4.0=
.bb</a><br>
index b59c289c51..0aefe92942 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-ccharde=
t_2.1.7.bb" rel=3D"noreferrer" target=3D"_blank">python3-cchardet_2.1.7.bb<=
/a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-ccharde=
t_2.4.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-cchardet_2.4.0.bb<=
/a><br>
@@ -3,7 +3,7 @@ HOMEPAGE =3D &quot;<a href=3D"https://github.com/PyYoshi/cC=
hardet" rel=3D"noreferrer" target=3D"_blank">https://github.com/PyYoshi/cCh=
ardet</a>&quot;<br>
=C2=A0LICENSE =3D &quot;MPL-1.1&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D6ecda54f6f525388d71d6=
b3cd92f7474&quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;c428b6336545053c2589f6caf24ea32276c6664cb86db=
817e03a94c60afa0eaf&quot;<br>
+SRC_URI[sha256sum] =3D &quot;7b062e7e92e5ab1a00aaf5c164d5f056daae648ba1f14=
4082baf5b4c229b794e&quot;<br>
<br>
=C2=A0inherit pypi setuptools3 cython<br>
<br>
-- <br>
2.47.3<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#131123): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/131123" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/131123</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121830551/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/121830551/1997914</a><br>
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

--0000000000002d03cd065e741edd--
