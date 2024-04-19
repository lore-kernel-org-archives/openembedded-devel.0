Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7B8AC4345F
	for <webhook@archiver.kernel.org>; Fri, 19 Apr 2024 14:08:32 +0000 (UTC)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
 by mx.groups.io with SMTP id smtpd.web10.22089.1713535703009264696
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Apr 2024 07:08:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m+s8ViLE;
 spf=pass (domain: gmail.com, ip: 209.85.219.180, mailfrom: ticotimo@gmail.com)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-de466c64161so1979478276.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 19 Apr 2024 07:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713535702; x=1714140502; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ymY9AuoHtzYCEyQyoEZENi3c1In5Kmy1CJq/WB3A8mw=;
        b=m+s8ViLE26s8VvhSd5wIbFkH/h8DDq+J9ibZBw6lgVJQkdoLzouFKED5kg6laBPaac
         56uS44LLhieZ34riVTdG2GdPEJyhLX2JxL6wqoCypufrNjC8bk7PdKeSWmj1RrpHvzML
         poZ1LYNPoJobFI7JbXtirlCjEEpe9jzmbXk2DKXox0k5+zVFRFJp3bmwE8ZZSpEIYcUL
         816IWIV5GNCiumH16qgmUPXlcNU/1HpW7zwhn1FV1RTPiYviEHmeC4corrm6eqzWqsbe
         8YVWoaANT/6O/Xs1o+N4yyW/DZ6ElSrAW1Zc9TF4S2Hj9MbVQ6fLK6pFYuBYYopr8ubQ
         I0QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713535702; x=1714140502;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ymY9AuoHtzYCEyQyoEZENi3c1In5Kmy1CJq/WB3A8mw=;
        b=UZn39BOfbTSlun4cEEDxXMeoqBnSyOsB0pwucAaR/4XQ0RWYx1IGOomyvfIJ4qz1J9
         m42QHs6sFMzy5c4qm6809TP5y0y05ROWgVmuu41b+WRq4KJvguo3h9pzCmnYxax/5uOP
         MNyZ1Wk8unSM7R3YEThqTi1OIBJ/sF/6gl/ChdGzK9NOBWR/XARTLizKtoqoOIhedxGI
         5kYa9eLu7/CdMTx6Ty2aOIjFgb1s2R6EL6+dkVh/vfgRp7P7HUXxPAV2he+0cYvsuklL
         Zc7uPAm0Brc3/qD0DzEdMAa6+lB4lRHzw2wMv/IT05EbUcpuoEgUdUH2PpyuXhSLs2W6
         e2Gg==
X-Gm-Message-State: AOJu0Yz6wYXywz6//MlmJnDRgn4tBDmzm08Dun5EksxccVSaq2JUk4CS
	XPXfI4+bO1B9iw4SwprcL+1Y3kJmotCYE+k5DY420nzHW2YkZ5iBZhUr9K/idIWx0QrIVZm8zOs
	q/jdAIm1g0KjvhKVR1/i8JDOLB6lUaQ==
X-Google-Smtp-Source: AGHT+IHAcbI0lBQBljZa+SmSzBxDotP2JHt6pF+j+N7Wz3vGTR70+7j4m1zgchzwh5XP+q2gUiyuTt7EZT2T13BTsRs=
X-Received: by 2002:a25:b199:0:b0:de1:dcc:2a8b with SMTP id
 h25-20020a25b199000000b00de10dcc2a8bmr2344123ybj.59.1713535701946; Fri, 19
 Apr 2024 07:08:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240418092910.3585-1-gudnimar@noxmedical.com>
In-Reply-To: <20240418092910.3585-1-gudnimar@noxmedical.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Fri, 19 Apr 2024 07:08:10 -0700
Message-ID: <CANx9H-DfZSKApi=KS2HK+pnrEuv799nn3_QrE76c5sMq57-8ZA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-incremental: cleanup RDEPENDS
To: gudnimar@noxmedical.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d31a930616739e4f"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Apr 2024 14:08:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110061

--000000000000d31a930616739e4f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 18, 2024 at 2:29=E2=80=AFAM Gu=C3=B0ni M=C3=A1r Gilbert via lis=
ts.openembedded.org
<gudnimar=3Dnoxmedical.com@lists.openembedded.org> wrote:

> incremental package does not need all twisted packages. Only the core
> package is required.
> The goal with this change is to minimize dependency memory requirements.
>
> Signed-off-by: Gu=C3=B0ni M=C3=A1r Gilbert <gudnimar@noxmedical.com>
> ---
> .../recipes-devtools/python/python3-incremental_22.10.0.bb | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-incremental_22.10.0.bb b/meta-python/recipes-devtools/python/
> python3-incremental_22.10.0.bb
> index 3d93cc05e..79fa15311 100644
> --- a/meta-python/recipes-devtools/python/python3-incremental_22.10.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-incremental_22.10.0.bb
> @@ -8,7 +8,7 @@ SRC_URI[sha256sum] =3D
> "912feeb5e0f7e0188e6f42241d2f450002e11bbc0937c65865045854c2
> inherit pypi setuptools3
>

This package defines a proper build-backend, so we should also consider
=E2=80=9Cinherit python_setuptools_build_meta=E2=80=9D instead of setuptool=
s.
https://github.com/twisted/incremental/blob/19a308d70d72d0aa95380125988d60a=
bb23b64e3/pyproject.toml#L7


>
> RDEPENDS:${PN} +=3D " \
> - python3-twisted \
> + python3-twisted-core \
> python3-click \
> "
>
> --
> 2.34.1
>
>
> Warning: Copyright Nox Health. This communication is confidential and may
> contain privileged information. By the use of email over the Internet or
> other communication systems, Nox Health is not waiving either
> confidentiality of, or legal privilege in, the content of the email and o=
f
> any attachments. If the recipient of this message is not the intended
> addressee, please call Nox Health immediately by calling (+1) 888.505.028=
0
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110052):
> https://lists.openembedded.org/g/openembedded-devel/message/110052
> Mute This Topic: https://lists.openembedded.org/mt/105594757/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000d31a930616739e4f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Apr 18, 2024 at 2:29=E2=80=AFAM Gu=C3=B0ni M=C3=A1r=
 Gilbert via <a href=3D"http://lists.openembedded.org">lists.openembedded.o=
rg</a> &lt;gudnimar=3D<a href=3D"mailto:noxmedical.com@lists.openembedded.o=
rg">noxmedical.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-widt=
h:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,20=
4,204)"><div>incremental package does not need all twisted packages. Only t=
he core package is required.<br>
The goal with this change is to minimize dependency memory requirements.<br=
>
<br>
Signed-off-by: Gu=C3=B0ni M=C3=A1r Gilbert &lt;<a href=3D"mailto:gudnimar@n=
oxmedical.com" target=3D"_blank">gudnimar@noxmedical.com</a>&gt;<br>
---<br>
 .../recipes-devtools/python/<a href=3D"http://python3-incremental_22.10.0.=
bb" target=3D"_blank">python3-incremental_22.10.0.bb</a>      | 2 +-<br>
 1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
incremental_22.10.0.bb" target=3D"_blank">python3-incremental_22.10.0.bb</a=
> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-increment=
al_22.10.0.bb" target=3D"_blank">python3-incremental_22.10.0.bb</a><br>
index 3d93cc05e..79fa15311 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-increme=
ntal_22.10.0.bb" target=3D"_blank">python3-incremental_22.10.0.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-increme=
ntal_22.10.0.bb" target=3D"_blank">python3-incremental_22.10.0.bb</a><br>
@@ -8,7 +8,7 @@ SRC_URI[sha256sum] =3D &quot;912feeb5e0f7e0188e6f42241d2f45=
0002e11bbc0937c65865045854c2<br>
 inherit pypi setuptools3</div></blockquote><div dir=3D"auto"><br></div><di=
v dir=3D"auto">This package defines a proper build-backend, so we should al=
so consider =E2=80=9Cinherit python_setuptools_build_meta=E2=80=9D instead =
of setuptools.</div><div dir=3D"auto"><div><a href=3D"https://github.com/tw=
isted/incremental/blob/19a308d70d72d0aa95380125988d60abb23b64e3/pyproject.t=
oml#L7">https://github.com/twisted/incremental/blob/19a308d70d72d0aa9538012=
5988d60abb23b64e3/pyproject.toml#L7</a></div><br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;borde=
r-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)"><di=
v dir=3D"auto"><br>
 <br>
 RDEPENDS:${PN} +=3D &quot; \<br>
-    python3-twisted \<br>
+    python3-twisted-core \<br>
     python3-click \<br>
 &quot;<br>
 <br>
-- <br>
2.34.1<br>

<br><br><p style=3D"font-family:Verdana;font-size:10pt;color:rgb(102,102,10=
2)"></p><p style=3D"font-family:Verdana;font-size:8pt;color:rgb(102,102,102=
)">Warning:  Copyright Nox Health.  This communication is confidential and =
may contain privileged information.  By the use of email over the Internet =
or other communication systems, Nox Health is not waiving either confidenti=
ality of, or legal privilege in, the content of the email and of any attach=
ments.  If the recipient of this message is not the intended addressee, ple=
ase call Nox Health immediately by calling (+1) 888.505.0280</p></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#110052): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/110052" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/110052</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/105594757/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/105594757/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" targ=
et=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000d31a930616739e4f--

