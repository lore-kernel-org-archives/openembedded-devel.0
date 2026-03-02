Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28A13EA4E11
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 14:59:16 +0000 (UTC)
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.162270.1772463553459544443
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Mar 2026 06:59:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K0CY4Qmf;
 spf=pass (domain: gmail.com, ip: 74.125.224.54, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-64c97997b0fso3065557d50.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Mar 2026 06:59:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772463552; cv=none;
        d=google.com; s=arc-20240605;
        b=Wlq6soNHEXkW7/5+bSHdU+R/xM7iYvH+oY88AXrAHuK5LSUUuiS16OsjYx8F5Aqwur
         +jsrfDXTXjB7HYA4N7KVC4NRHIDNKU41pE6eB9oUc2QLHXw4wROsV19MJYqIbkTLI3J+
         2qi+u+pYn9LU+qzMwZv8gQUnxDqHXSVVwICnS6/F0bs7qg/7/E+LlCYDWpASOxIlx5yq
         I+i9e1UtzfDHL0M53VcxqIUvgqTYC3rYIXWOuLE6FEOeqj2pB3mbhxTpd1fefF7OygT2
         t17jxw3VCVua6Ktdf1V+zBjV6qJmfw4RFJ1umMRozNoRV80Ai0HaRqFqXuCzS0wwIcPy
         btQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xjvXdHkA4TKERy8lsOJ+U1yFM+UipS9WYtevaZdPMKg=;
        fh=T4CPLHS+o6DAwGFfKmQ6x8qUYUzzMdir05T+ffiJoHU=;
        b=GkkXvMiXQiSY8pPQvbn/oVqi4P6rE/SwGc7y30se+FJkR9B3wQOH0CDzQNezsP2z9l
         oBOLa/io06TIiH+X8Rg1IuaKRDm4+YUzJBo8Yn0xvqfBh9k3jY13pRuU6ublpnjd7CBy
         RBUe5ptDAYqhBRrpnGPmbns9I+yvdYODu7feA/rgM6xlsL5+eo/iC7E0gO3aMzJXs4Nc
         gR4M1O3j4q76sc+OWRJblI+mQjqlfn2ijLPMG/m3Yrad/lP2/dMfPJX5sFnyo8rtlYzS
         Ajk7oNEd0NVip+LzLyNtF+bBkyJjRP6RgGiFnETyHwIRQNBVmhlNiR3E8R4c/RIk49Y/
         zJhA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772463552; x=1773068352; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xjvXdHkA4TKERy8lsOJ+U1yFM+UipS9WYtevaZdPMKg=;
        b=K0CY4QmfwmLjs9WUf5ImM6Ba+SB5dDN1TflCYq2rg1Mpq0wVV89U/fG+P95rmGVIHZ
         Q8miW4ry6kRiWm4F7HCBjLwMcf3EF1dzj8SZzonRhH74eCasoqU0a8tfjO+Jw7iUZP4s
         Eanp83E6gJbde2oDl2yk6XfAjV5020I7XD6GksEYFEXgQDIlvKrwGQR3OhkngK3fNTS7
         FY/MshxytTi0QzPDYPAbE5xpSAJJIs1rEZLcDlP9J6xPzTTGmwEI2oY82j1eSnOvABQ5
         17/eV1T1GNNUmMKFVEVb1tnwdOjO9PriZ0nKv3RL7zxuIrgIxkxUzEG2BGUodFf0z7d1
         iE4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772463552; x=1773068352;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xjvXdHkA4TKERy8lsOJ+U1yFM+UipS9WYtevaZdPMKg=;
        b=Bsnf//LZYLgm1ozctUKNroZEk1KXto2dOObrdoh/wU2an+g9wuw+a5Zlouuau83vZ7
         CCo2DmJKQx0gaZZYiM28S/mq6gVg3GBKyPFa1rUFmC2pZMGGSzKo0yG1hwnMaAKs/RSA
         KIzPnHmMWheSzRMuFOIqaQD+IpXoIkvyHaLj1Igl5ltOxma9EdbZTGmPhIiHsuwi/Rn0
         JDrm1cXnGLX3JlsttfjdS5WDJzdRPA5oHzl3mXQwn/Hu3OaPmWodZ06UY4BAOj0PHaZ/
         9G7K9H8F0IqKfDe+IrFGbNUBDqjdHqTN9S5tmzABLs3fxf7nk+K0zzZBZIAywfXwpQMa
         nDSw==
X-Gm-Message-State: AOJu0Yxg96gI6MW9ChojtN9MP8hKzDeu6g47IqyXUNRYtzQEV8ozrTl6
	nOrD/j19aHsQRX9XlX9YnZWkQsor381hVYLQGe+mlS7hO+DtmpaEGBqFXz7F001QG1DoJrAGCje
	BCwVk/pwQ4kB5bHP8h8p/x4HSP+noaN0=
X-Gm-Gg: ATEYQzzbuUZlU8XH8g+7L4Qdhx/L596J0NOsu2/pLaZ+hbvfl0hxy1m13gGaN3t/Vd9
	gZs1HjWatBswnFReyRZIsq4EPlDoyVZpo+rE9p8JHEMrW0ruwzb5Ur5uMx5osRGMdp6dCFoGAzq
	KogwZ5CKv41v3vF9F7tqT1f4LrqMPl3P6VepBjq3G6Laah5wnq9Scmk4D88GFgSjrJjzjwwehOG
	0+7jY2S9fGlp2Za6GqoiBGhGr11ynLqY7TznWgp2TDCZH4ERrxEdulnAWlEhK9kElP3aZvTF8Bo
	IleQkNWtNTyP96ubwlD1iathqkgFNdqCb4/Y82PdmTf5GzAxUx32fkPtv9tIqKwXJJKXV1CFRdu
	1VxTJVHRCF9OjBnGK0vMY+OXc
X-Received: by 2002:a53:e23c:0:b0:64c:975b:eca9 with SMTP id
 956f58d0204a3-64cc22ccf7dmr7723480d50.64.1772463552291; Mon, 02 Mar 2026
 06:59:12 -0800 (PST)
MIME-Version: 1.0
References: <20260301073711.148281-1-gitbeam@proton.me>
In-Reply-To: <20260301073711.148281-1-gitbeam@proton.me>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 2 Mar 2026 06:58:44 -0800
X-Gm-Features: AaiRm509Zk8xrFoJXXdw4MKJRO30CWgFi1RjtUZH00xdcYwDMpwZ6d-u3pLUE5s
Message-ID: <CAMKF1sqoU=s-i37voXs-kDx4d3SMgCb84FWM=aCu5TVhNqhzBA@mail.gmail.com>
Subject: Re: [oe] [PATCH] ntpsec: upgrade 1.2.2a -> 1.2.4
To: gitbeam@gmail.com
Cc: openembedded-devel@lists.openembedded.org, G B <gitbeam@proton.me>
Content-Type: multipart/alternative; boundary="00000000000069692f064c0bd409"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Mar 2026 14:59:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124811

--00000000000069692f064c0bd409
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

fails
https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/5584775/raw_inlin=
e

On Sun, Mar 1, 2026 at 2:42=E2=80=AFAM G B via lists.openembedded.org <gitb=
eam=3D
gmail.com@lists.openembedded.org> wrote:

> Upgrade to latest upstream release 1.2.4.
>
> Release notes: https://blog.ntpsec.org/2025/04/18/version-1.2.4.html
>
> Signed-off-by: G B <gitbeam@proton.me>
> ---
>  .../ntpsec/{ntpsec_1.2.2a.bb =3D> ntpsec_1.2.4.bb}                | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-networking/recipes-support/ntpsec/{ntpsec_1.2.2a.bb =3D>
> ntpsec_1.2.4.bb} (98%)
>
> diff --git a/meta-networking/recipes-support/ntpsec/ntpsec_1.2.2a.bb
> b/meta-networking/recipes-support/ntpsec/ntpsec_1.2.4.bb
> similarity index 98%
> rename from meta-networking/recipes-support/ntpsec/ntpsec_1.2.2a.bb
> rename to meta-networking/recipes-support/ntpsec/ntpsec_1.2.4.bb
> index 9ad97e7689..4f71cd2298 100644
> --- a/meta-networking/recipes-support/ntpsec/ntpsec_1.2.2a.bb
> +++ b/meta-networking/recipes-support/ntpsec/ntpsec_1.2.4.bb
> @@ -17,7 +17,7 @@ SRC_URI =3D "
> https://ftp.ntpsec.org/pub/releases/ntpsec-${PV}.tar.gz \
>             file://0001-wscript-Add-BISONFLAGS-support.patch \
>             "
>
> -SRC_URI[sha256sum] =3D
> "e0ce93af222a0a9860e6f5a51aadba9bb5ca601d80b2aea118a62f0a3226950e"
> +SRC_URI[sha256sum] =3D
> "443e54a6149d1b0bf08677d17b18fced9028b101fc2ffd2c81e0834f87eebc7d"
>
>  UPSTREAM_CHECK_URI =3D "ftp://ftp.ntpsec.org/pub/releases/"
>
> --
> 2.47.3
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#124792):
> https://lists.openembedded.org/g/openembedded-devel/message/124792
> Mute This Topic: https://lists.openembedded.org/mt/118064777/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000069692f064c0bd409
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">fails<div><a href=3D"https://autobuilder.yoctoproject.org/=
valkyrie/api/v2/logs/5584775/raw_inline">https://autobuilder.yoctoproject.o=
rg/valkyrie/api/v2/logs/5584775/raw_inline</a></div></div><br><div class=3D=
"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Sun, Mar 1, 2026 at 2:42=E2=80=AFAM G B via <a href=3D"http://lists.opene=
mbedded.org">lists.openembedded.org</a> &lt;gitbeam=3D<a href=3D"mailto:gma=
il.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Upgrade to l=
atest upstream release 1.2.4.<br>
<br>
Release notes: <a href=3D"https://blog.ntpsec.org/2025/04/18/version-1.2.4.=
html" rel=3D"noreferrer" target=3D"_blank">https://blog.ntpsec.org/2025/04/=
18/version-1.2.4.html</a><br>
<br>
Signed-off-by: G B &lt;<a href=3D"mailto:gitbeam@proton.me" target=3D"_blan=
k">gitbeam@proton.me</a>&gt;<br>
---<br>
=C2=A0.../ntpsec/{<a href=3D"http://ntpsec_1.2.2a.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">ntpsec_1.2.2a.bb</a> =3D&gt; <a href=3D"http://ntpsec_1.2.4=
.bb" rel=3D"noreferrer" target=3D"_blank">ntpsec_1.2.4.bb</a>}=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta-networking/recipes-support/ntpsec/{<a href=3D"http://ntps=
ec_1.2.2a.bb" rel=3D"noreferrer" target=3D"_blank">ntpsec_1.2.2a.bb</a> =3D=
&gt; <a href=3D"http://ntpsec_1.2.4.bb" rel=3D"noreferrer" target=3D"_blank=
">ntpsec_1.2.4.bb</a>} (98%)<br>
<br>
diff --git a/meta-networking/recipes-support/ntpsec/<a href=3D"http://ntpse=
c_1.2.2a.bb" rel=3D"noreferrer" target=3D"_blank">ntpsec_1.2.2a.bb</a> b/me=
ta-networking/recipes-support/ntpsec/<a href=3D"http://ntpsec_1.2.4.bb" rel=
=3D"noreferrer" target=3D"_blank">ntpsec_1.2.4.bb</a><br>
similarity index 98%<br>
rename from meta-networking/recipes-support/ntpsec/<a href=3D"http://ntpsec=
_1.2.2a.bb" rel=3D"noreferrer" target=3D"_blank">ntpsec_1.2.2a.bb</a><br>
rename to meta-networking/recipes-support/ntpsec/<a href=3D"http://ntpsec_1=
.2.4.bb" rel=3D"noreferrer" target=3D"_blank">ntpsec_1.2.4.bb</a><br>
index 9ad97e7689..4f71cd2298 100644<br>
--- a/meta-networking/recipes-support/ntpsec/<a href=3D"http://ntpsec_1.2.2=
a.bb" rel=3D"noreferrer" target=3D"_blank">ntpsec_1.2.2a.bb</a><br>
+++ b/meta-networking/recipes-support/ntpsec/<a href=3D"http://ntpsec_1.2.4=
.bb" rel=3D"noreferrer" target=3D"_blank">ntpsec_1.2.4.bb</a><br>
@@ -17,7 +17,7 @@ SRC_URI =3D &quot;<a href=3D"https://ftp.ntpsec.org/pub/r=
eleases/ntpsec-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">https=
://ftp.ntpsec.org/pub/releases/ntpsec-${PV}.tar.gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-wscript-Add-BISONFLAG=
S-support.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;e0ce93af222a0a9860e6f5a51aadba9bb5ca601d80b2a=
ea118a62f0a3226950e&quot;<br>
+SRC_URI[sha256sum] =3D &quot;443e54a6149d1b0bf08677d17b18fced9028b101fc2ff=
d2c81e0834f87eebc7d&quot;<br>
<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"ftp://ftp.ntpsec.org/pub/rele=
ases/" rel=3D"noreferrer" target=3D"_blank">ftp://ftp.ntpsec.org/pub/releas=
es/</a>&quot;<br>
<br>
-- <br>
2.47.3<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#124792): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/124792" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/124792</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118064777/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118064777/1997914</a><br>
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

--00000000000069692f064c0bd409--

