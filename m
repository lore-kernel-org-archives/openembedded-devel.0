Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11871.1794410436826788957
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Nov 2026 07:20:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=d+7f8EP+;
 spf=pass (domain: gmail.com, ip: 74.125.224.51, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-67921b515a7so3711588d50.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 07:20:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794410436; cv=none;
        d=google.com; s=arc-20260327;
        b=TASA6JqVbPqsUpeG3Z5zr62T0IhAe6ydjbCDiVoYR38VZUSftNfX1FmmWDmxsZcAwn
         PzmouWuSV18edNABc67Do40ti7yBEcrFNZ+0/5O2qKEhNxJ/5lQ2QIzCaaRjpzDhpNTZ
         eu8fRGpgio0Tod8XCvqV6KaRRcrNSbhOk86Pg0KAteEsSVQJKo+91i+PL0e5W1xc2AAZ
         Y4x3PIvdkinlmR/VvQPPUbOfSWWCKczf+5TwPWj/2unHFO+gtpJ//U7FShh4g/DHoKms
         wHEuvNeMz0teoiiVT4NpdvRIdESJLmN+L4jA1/EG/N435WhcgFmAovn+1cAau+UsrcJk
         QL6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Uhx47dCEVbMXH7iC7AsLZ42LCusKIBPIOgXmidAfrTQ=;
        fh=Tjun94z5QcpIKl7rcFTSxMI3vHiekwoX6jPxW2Hh8r0=;
        b=TDDr3KxuTzB0aYMRXAn69EFM1pR9UmNUtw4LpjoUTz92jiKCiGHM73rYGGPMSR88zZ
         6ZcbucEhjOtp/iLcazAVDny/2DcA2snLuS6UUuwWH1glI4hYiHGtjZav8UxP2tO2eAyW
         RiMlMH7wXsSmbs9nL9MxZB/RbK0BVw6j1Lt+byThwcHiHpL1J3L6WLj5k6Mf0u+R6t1P
         8vDn9N6wv0cdpuFw049O9AuRpB/ZTrlv4leCCAYoungeSmZmISzKWlTh/hmLdVoM+LWZ
         nXx0kqXNRbJOuuI69CglVK1zUaYvfQY5oTB8L/jvxBU6/l3pvIw9CvIfWAM1Dg4ry5LK
         wBdw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794410436; x=1795015236; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uhx47dCEVbMXH7iC7AsLZ42LCusKIBPIOgXmidAfrTQ=;
        b=d+7f8EP+U27HC9zj429iQURevn6JLn6dZ2e2c95UkZMh5Y7OUj4zi+jcpJBYyi7gCj
         QrWKg4SaOdEhfGnDwn4tJywZRR2VSK6Jd72IdKNMfygiAGTQOzPdHARVlbEKhtG8BWgR
         wt1ZFuU5W7BTvqcECiI7yWzFuY1bERq6H5S0Ldi4XDc9TJUvqeZLrzFN1zsTmf/O17nZ
         gCtsdeZOpodTx3gJ97mAWkdoQrO8nw930It4FRn/3FX1GpxNOnRFsiRMbvYAzNbPik/Z
         ZUcSPDz4uyE3wdKCFkGsNMoUUp+8TKIzybPAJQIAATszfWsUnC6KsIagJpFqDAm0TWa4
         ouNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794410436; x=1795015236;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Uhx47dCEVbMXH7iC7AsLZ42LCusKIBPIOgXmidAfrTQ=;
        b=DwQ7k9D7FyXwAg/U/I2GLxwutPMlo4IE1isQB/b8/PtpwFleCdW73mxyTewBwfmR7y
         rjIcQzy8Sa18VV/k8vIWoEY86PZhZIqDNrBOguGvq4BdixHWrOi9un5h5FVOvJU6bxDx
         4e6RVlWBwTcDVA0TCRpvX8fJrfHQLf0osw0NtGOGEW08F8gMSiyDyiuuNjd5kR3BaxYY
         uMeAiYRRsfO3BM5yY0xP2VXTuBIMrJwPLkeVg3LxT6glcl33/Xht5AnYQTbaPGsFI19y
         O0UR+EdFnpYu1yzCBPQbm50DAfa0L78yRdVXsNmwUpFZgu9MRUpXmDBqPlh1DNrr6n6F
         eaPA==
X-Gm-Message-State: APuU4Z9hgHsaE3Q0nEvTJr2T+CgsbIgEnRT7ZLvPGoxXfsvRt9dIDbsD
	43BKy4UANv9eU9BYKLHS8JtAGu+sqsA4KYR3ekwX4HAgZy/2pQ88dmrHMexaNYlTYfBRkn0FMQ/
	ACbeuXBYNjIH1hYapKWDWPpz4GyrqUw42Vol/
X-Gm-Gg: AYBFou36v4qe8m9wyMssbCbMG/HDBm51NxOuTLxOaGkLk5/Prn7bbRX0lsBKsO1sZKg
	6l+TQ3DEpcu8+NNlTudqPzUp+jSl8DaFgWnTnRpJQVUHUteTyX5Lv9u0ixJvg0ftsuBH2UvqWQ0
	6vkEfTP82/onUXOTVN7OebRkoqDUJxBjnrviPUNLpPlwvPbdqMmPryg2HA1xesfMd7QLSyWlsE+
	XRS9ya6nY0K7Pl9MyjvO+8EB6Ikb58GM6Hj74bNAKKvwEGBRHntVjNXlUQn8dz9q4VCs01TXJ3H
	0zsTp3sl0PgIry3INxuZFciNBduEYQ4xlqPLVh8NqJaHglOU2sSp2jaK0xzMQcFzgzMmnTROYI3
	nKJ/onIuuWEzkr8yf6NOTFGJkwkXJcEn4R7ALHQoLx7olGqv7wb4Z8m3eJ9AFTjYbYgoXldTGim
	QIzYqbICZ1/fpNd0YpNcfSnh/FNUf7Gwji1UIJnJKnF0WSYQEVlm37AqCi70rPPIkDQtgS2DO9s
	OTKg1+wctjJm6JfRRWP1NGw0giLlVfRiT7fEVWX2a8pBAzj5NLoDtrb2wm9ETyn0handZSJTklh
	E41FRqAb/Ri2Md3YdDBDY75CxukgxHCNnfULqqT3E8vx60jZemeViwnM8yu5HNgDrrVca5LbNZM
	36WPR4SqcVwlQrsTAv73AunkzEWa1N6mAa3WxYXDitWk=
X-Received: by 2002:a05:690e:1094:20b0:67c:2a1f:84ae with SMTP id
 956f58d0204a3-67c67fa7476mr1274041d50.83.1794410435486; Wed, 11 Nov 2026
 07:20:35 -0800 (PST)
MIME-Version: 1.0
References: <20261110163904.15077-1-tafil@tafhub.de> <20261110163904.15077-3-tafil@tafhub.de>
In-Reply-To: <20261110163904.15077-3-tafil@tafhub.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 11 Nov 2026 07:20:09 -0800
X-Gm-Features: AclHuK8e644_gIvm2gpsPUtI085La5Vg1HbNWI8fboVE4S5i7tOQkRnhjyI9-TI
Message-ID: <CAMKF1sqwkkAtRkCh5Y8cgZoaadBDy2OgUa6P=0+6oTqb8y=5-Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 3/3] fastfetch: upgrade 2.70.0 -> 2.71.0
To: tafil@tafhub.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000096ab57066001bc11"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 15:20:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132130

--00000000000096ab57066001bc11
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

this fails with clang compiler

/home/ubuntu/yoe/build/tmp/work/cortexa57-yoe-linux/fastfetch/2.71.0/source=
s/fastfetch-2.71.0/src/detection/users/users_linux.c:189:5:
error: use of undeclared identifier 'endutxent'; did you mean 'endutent'?
  189 |     endutxent();
      |     ^~~~~~~~~
      |     endutent
/home/ubuntu/yoe/build/tmp/work/cortexa57-yoe-linux/fastfetch/2.71.0/recipe=
-sysroot/usr/include/utmp.h:68:13:
note: 'endutent' declared here
   68 | extern void endutent (void) __THROW;
      |             ^
1 error generated.

On Tue, Nov 10, 2026 at 8:39=E2=80=AFAM Tafil Avdyli via openembedded-devel=
 <tafil=3D
tafhub.de@lists.openembedded.org> wrote:

> Full changelog:
> https://github.com/fastfetch-cli/fastfetch/blob/2.71.0/CHANGELOG.md
>
> Signed-off-by: Tafil Avdyli <tafil@tafhub.de>
> ---
>  .../fastfetch/{fastfetch_2.70.0.bb =3D> fastfetch_2.71.0.bb}      | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-support/fastfetch/{fastfetch_2.70.0.bb =3D>
> fastfetch_2.71.0.bb} (98%)
>
> diff --git a/meta-oe/recipes-support/fastfetch/fastfetch_2.70.0.bb
> b/meta-oe/recipes-support/fastfetch/fastfetch_2.71.0.bb
> similarity index 98%
> rename from meta-oe/recipes-support/fastfetch/fastfetch_2.70.0.bb
> rename to meta-oe/recipes-support/fastfetch/fastfetch_2.71.0.bb
> index 9db8b2cbce..c9ba3519b0 100644
> --- a/meta-oe/recipes-support/fastfetch/fastfetch_2.70.0.bb
> +++ b/meta-oe/recipes-support/fastfetch/fastfetch_2.71.0.bb
> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D2090e7d93df7ad5a3d41f6fb4226ac76"
>  DEPENDS =3D "yyjson"
>
>  SRC_URI =3D "git://
> github.com/fastfetch-cli/fastfetch.git;protocol=3Dhttps;branch=3Dmaster;t=
ag=3D${PV}
> <http://github.com/fastfetch-cli/fastfetch.git;protocol=3Dhttps;branch=3D=
master;tag=3D$%7BPV%7D>
> "
> -SRCREV =3D "17bb3fd2384bd814b421d73b8c8b8d08e06cfa26"
> +SRCREV =3D "8c9d9c0449dd515e0088c4a60a38d2dc40c5ccd0"
>
>  inherit cmake pkgconfig
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#132096):
> https://lists.openembedded.org/g/openembedded-devel/message/132096
> Mute This Topic: https://lists.openembedded.org/mt/122196593/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000096ab57066001bc11
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">this=C2=A0fails with clang compiler<div><br></div><div>/ho=
me/ubuntu/yoe/build/tmp/work/cortexa57-yoe-linux/fastfetch/2.71.0/sources/f=
astfetch-2.71.0/src/detection/users/users_linux.c:189:5: error: use of unde=
clared identifier &#39;endutxent&#39;; did you mean &#39;endutent&#39;?<br>=
=C2=A0 189 | =C2=A0 =C2=A0 endutxent();<br>=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =
=C2=A0 ^~~~~~~~~<br>=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 endutent<br>/home/=
ubuntu/yoe/build/tmp/work/cortexa57-yoe-linux/fastfetch/2.71.0/recipe-sysro=
ot/usr/include/utmp.h:68:13: note: &#39;endutent&#39; declared here<br>=C2=
=A0 =C2=A068 | extern void endutent (void) __THROW;<br>=C2=A0 =C2=A0 =C2=A0=
 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^<br>1 error generated.<br></d=
iv></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"l=
tr" class=3D"gmail_attr">On Tue, Nov 10, 2026 at 8:39=E2=80=AFAM Tafil Avdy=
li via openembedded-devel &lt;tafil=3D<a href=3D"mailto:tafhub.de@lists.ope=
nembedded.org">tafhub.de@lists.openembedded.org</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">Full changelog: <a href=3D"h=
ttps://github.com/fastfetch-cli/fastfetch/blob/2.71.0/CHANGELOG.md" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/fastfetch-cli/fastfetch/bl=
ob/2.71.0/CHANGELOG.md</a><br>
<br>
Signed-off-by: Tafil Avdyli &lt;<a href=3D"mailto:tafil@tafhub.de" target=
=3D"_blank">tafil@tafhub.de</a>&gt;<br>
---<br>
=C2=A0.../fastfetch/{<a href=3D"http://fastfetch_2.70.0.bb" rel=3D"noreferr=
er" target=3D"_blank">fastfetch_2.70.0.bb</a> =3D&gt; <a href=3D"http://fas=
tfetch_2.71.0.bb" rel=3D"noreferrer" target=3D"_blank">fastfetch_2.71.0.bb<=
/a>}=C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta-oe/recipes-support/fastfetch/{<a href=3D"http://fastfetch=
_2.70.0.bb" rel=3D"noreferrer" target=3D"_blank">fastfetch_2.70.0.bb</a> =
=3D&gt; <a href=3D"http://fastfetch_2.71.0.bb" rel=3D"noreferrer" target=3D=
"_blank">fastfetch_2.71.0.bb</a>} (98%)<br>
<br>
diff --git a/meta-oe/recipes-support/fastfetch/<a href=3D"http://fastfetch_=
2.70.0.bb" rel=3D"noreferrer" target=3D"_blank">fastfetch_2.70.0.bb</a> b/m=
eta-oe/recipes-support/fastfetch/<a href=3D"http://fastfetch_2.71.0.bb" rel=
=3D"noreferrer" target=3D"_blank">fastfetch_2.71.0.bb</a><br>
similarity index 98%<br>
rename from meta-oe/recipes-support/fastfetch/<a href=3D"http://fastfetch_2=
.70.0.bb" rel=3D"noreferrer" target=3D"_blank">fastfetch_2.70.0.bb</a><br>
rename to meta-oe/recipes-support/fastfetch/<a href=3D"http://fastfetch_2.7=
1.0.bb" rel=3D"noreferrer" target=3D"_blank">fastfetch_2.71.0.bb</a><br>
index 9db8b2cbce..c9ba3519b0 100644<br>
--- a/meta-oe/recipes-support/fastfetch/<a href=3D"http://fastfetch_2.70.0.=
bb" rel=3D"noreferrer" target=3D"_blank">fastfetch_2.70.0.bb</a><br>
+++ b/meta-oe/recipes-support/fastfetch/<a href=3D"http://fastfetch_2.71.0.=
bb" rel=3D"noreferrer" target=3D"_blank">fastfetch_2.71.0.bb</a><br>
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D2090e7d93=
df7ad5a3d41f6fb4226ac76&quot;<br>
=C2=A0DEPENDS =3D &quot;yyjson&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/fastfetch-cli/fa=
stfetch.git;protocol=3Dhttps;branch=3Dmaster;tag=3D$%7BPV%7D" rel=3D"norefe=
rrer" target=3D"_blank">github.com/fastfetch-cli/fastfetch.git;protocol=3Dh=
ttps;branch=3Dmaster;tag=3D${PV}</a>&quot;<br>
-SRCREV =3D &quot;17bb3fd2384bd814b421d73b8c8b8d08e06cfa26&quot;<br>
+SRCREV =3D &quot;8c9d9c0449dd515e0088c4a60a38d2dc40c5ccd0&quot;<br>
<br>
=C2=A0inherit cmake pkgconfig<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#132096): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/132096" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/132096</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/122196593/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/122196593/1997914</a><br>
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

--00000000000096ab57066001bc11--
