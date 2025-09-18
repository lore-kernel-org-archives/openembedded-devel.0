Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3492FCA1013
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 14:17:24 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.15574.1758205036575060082
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Sep 2025 07:17:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=j9ikusrz;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45f2c4c3853so4181115e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 07:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1758205035; x=1758809835; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iCeRiv1a+8gzxON+DkOYSMdpHwCspMjFxVNFXCLFjok=;
        b=j9ikusrzt5uT94a26wYfolDClt7IJEq/VwY/NIX++VDhq0pISyeZXqlCiv6G7sl0yN
         gsX1kQosp2oGKHqbjOi2urbtuM6KLbbbUywr1Y+fB74jiHMOf50C+nEms/SuePwx0+mF
         SFnTTwPVaL1a+bHDuTJQUt2eLXLtraaBoCzOM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758205035; x=1758809835;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iCeRiv1a+8gzxON+DkOYSMdpHwCspMjFxVNFXCLFjok=;
        b=VkOcdJ5z1NiTeubWOlFTITbtXev8iaPUcPqF6A+bJiPWS6Y5mgkr+/4nkE0AL4x+eK
         2878qDXZsdyU9VVdgqTGZDrC2MOVlr8QsY6VeCFG4ECTyarGbijmuy6ANF5COxpc/+3x
         YIbaakKCeB/lETJXEcFTSZEqXbTFfjAMyNCHIbloXUUxH+9JUZU+ukLtDU0RZKAeg7n5
         5MKv6zOEkXX+xS3F/FQ53o75LdUopiBQyLRO0GwGVtyQKLek4EqeOR5XLW6qowo74lkp
         X1VqTeSBPTNm3Tm5nR6m8u2hQBBpCDA4LNCYZlfvjJET+DqBu6i1fRFklCvTt9mEr20n
         PlLA==
X-Gm-Message-State: AOJu0YzXUfNnBMNDr1k/kWnnwStPpDu8Ss2c3KlYfDxJ98nsNb2vkA7z
	YdSKMkQyb9DSAmRDJCzvGNnMsxN+WLTbSpQJEB8BPQ/XNhW3RjwW7y9GhI4GiRur0u7yXaH2q3d
	P6a6xfMb3+slE1cuRQlESblt6/Y4RX2ycEtpVZT5UJg==
X-Gm-Gg: ASbGncsrTKgfnz+zDaFY1adwcjC9YPijz2hBSD1e47ub93AWiAw+KcSFsYcyRxaX69n
	+so/kBpw8hyKdAS3s2WOtO6M0VA7k9gLRPryYvxAE3vE8zrUDK8XJ6Ov9F/Sx1O7nSknq8QyS1t
	AbrArwQjX5M7xrIUbppmpbyo4S6JQNAsX5e3Z6PptsaGr4VHiqsLLTAHpaIE6/yGG7JG+9OhNYc
	nYni1NLor/966zGy+DdN/GgEeBaoX7NBiE9UMrWyRfQctKyM8tixjMoGXoq
X-Google-Smtp-Source: AGHT+IHa8/tk8T6PXOY0wfh6cXuSTh2kdSEOAEEBrt3cp8dVHz0syeNAY+iXX0UiUuSAzIDlUwQCn4XL78RYZjFS3Rc=
X-Received: by 2002:a05:600c:190f:b0:45c:b5e0:2cf5 with SMTP id
 5b1f17b1804b1-46205adf583mr64965995e9.24.1758205034712; Thu, 18 Sep 2025
 07:17:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250918102642.487522-1-zboszor@gmail.com>
In-Reply-To: <20250918102642.487522-1-zboszor@gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Thu, 18 Sep 2025 16:16:48 +0200
X-Gm-Features: AS18NWAEcYcbgpvaIBd97O9uuqrpy8spFAl37ZsQjoiEkWjpBpwPI90YaaVJ8fU
Message-ID: <CAMSfU+6F0GngYjP=07gUWFo4Tvf=hk=rG6CgAnV16BrK8UuBEg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] gutenprint: 5.3.5
To: zboszor@gmail.com
Cc: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000896903063f1402c6"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 14:17:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119576

--000000000000896903063f1402c6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Le jeu. 18 sept. 2025 =C3=A0 12:26, Zoltan Boszormenyi via lists.openembedd=
ed.org
<zboszor=3Dgmail.com@lists.openembedded.org> a =C3=A9crit :

> This fixes an installation error:
>
> | make[5]: Entering directory
> '.../tmp/work/corei7-64-oe-linux/gutenprint/5.3.4/build/src/cups'
> | chmod 700
> .../tmp/work/corei7-64-oe-linux/gutenprint/5.3.4/image/usr/libexec/cups/b=
ackend/backend_gutenprint
> | chmod: cannot access
> '.../tmp/work/corei7-64-oe-linux/gutenprint/5.3.4/image/usr/libexec/cups/=
backend/backend_gutenprint':
> No such file or directory
>

What makes you say that the 5.3.4->5.3.5 upgrade fix this bug?
The above error is the one I fixed with the patch
"0001-cups-fix-a-build-race-condition-around-empty-directo.patch" and this
patch has not been merged upstream nor the code I touched changed. I did
not see anything related by quickly reading the NEWS.
I'd be happy to see this fixed upstream but I'd rather have upstream
confirmation that they saw/fixed it (a commit, a changelog, ...).
If that is fixed upstream, then we can drop my patch.

Thanks!


> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> ---
>  .../gutenprint/{gutenprint_5.3.4.bb =3D> gutenprint_5.3.5.bb}     | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-printing/gutenprint/{gutenprint_5.3.4.bb =3D>
> gutenprint_5.3.5.bb} (96%)
>
> diff --git a/meta-oe/recipes-printing/gutenprint/gutenprint_5.3.4.bb
> b/meta-oe/recipes-printing/gutenprint/gutenprint_5.3.5.bb
> similarity index 96%
> rename from meta-oe/recipes-printing/gutenprint/gutenprint_5.3.4.bb
> rename to meta-oe/recipes-printing/gutenprint/gutenprint_5.3.5.bb
> index f90a123293..82953b798c 100644
> --- a/meta-oe/recipes-printing/gutenprint/gutenprint_5.3.4.bb
> +++ b/meta-oe/recipes-printing/gutenprint/gutenprint_5.3.5.bb
> @@ -17,7 +17,7 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6552"
>  SRC_URI =3D "https://downloads.sourceforge.net/gimp-print/${BP}.tar.xz \
>
> file://0001-cups-fix-a-build-race-condition-around-empty-directo.patch \
>             "
> -SRC_URI[sha256sum] =3D
> "db44a701d2b8e6a8931c83cec06c91226be266d23e5c189d20a39dd175f2023b"
> +SRC_URI[sha256sum] =3D
> "f5a9f47de28530b1ae2069cfbc647a9a641baeeabe809bb0ef2b3ec5b9668d70"
>
>  inherit autotools gettext pkgconfig
>
> --
> 2.51.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119552):
> https://lists.openembedded.org/g/openembedded-devel/message/119552
> Mute This Topic: https://lists.openembedded.org/mt/115307539/4316185
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--000000000000896903063f1402c6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><br><div class=3D"gmail_quote gmail_quote=
_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0jeu. 18 sept. 202=
5 =C3=A0=C2=A012:26, Zoltan Boszormenyi via <a href=3D"http://lists.openemb=
edded.org">lists.openembedded.org</a> &lt;zboszor=3D<a href=3D"mailto:gmail=
.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; a =C3=
=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">T=
his fixes an installation error:<br>
<br>
| make[5]: Entering directory &#39;.../tmp/work/corei7-64-oe-linux/gutenpri=
nt/5.3.4/build/src/cups&#39;<br>
| chmod 700 .../tmp/work/corei7-64-oe-linux/gutenprint/5.3.4/image/usr/libe=
xec/cups/backend/backend_gutenprint<br>
| chmod: cannot access &#39;.../tmp/work/corei7-64-oe-linux/gutenprint/5.3.=
4/image/usr/libexec/cups/backend/backend_gutenprint&#39;: No such file or d=
irectory<br></blockquote><div><br></div><div>What makes you say that the 5.=
3.4-&gt;5.3.5 upgrade fix this bug?</div><div>The above error is the one I =
fixed with the patch &quot;0001-cups-fix-a-build-race-condition-around-empt=
y-directo.patch&quot; and this patch has not been merged upstream nor the c=
ode I touched changed. I did not see anything related by quickly reading th=
e NEWS.</div><div></div><div>I&#39;d be happy to see this fixed upstream bu=
t I&#39;d rather have upstream confirmation that they saw/fixed it (a commi=
t, a changelog, ...).</div><div>If that is fixed upstream, then we can drop=
 my patch.</div><div><br></div><div>Thanks!</div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi &lt;<a href=3D"mailto=
:zboszor@gmail.com" target=3D"_blank">zboszor@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../gutenprint/{<a href=3D"http://gutenprint_5.3.4.bb" rel=3D"norefer=
rer" target=3D"_blank">gutenprint_5.3.4.bb</a> =3D&gt; <a href=3D"http://gu=
tenprint_5.3.5.bb" rel=3D"noreferrer" target=3D"_blank">gutenprint_5.3.5.bb=
</a>}=C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta-oe/recipes-printing/gutenprint/{<a href=3D"http://gutenpr=
int_5.3.4.bb" rel=3D"noreferrer" target=3D"_blank">gutenprint_5.3.4.bb</a> =
=3D&gt; <a href=3D"http://gutenprint_5.3.5.bb" rel=3D"noreferrer" target=3D=
"_blank">gutenprint_5.3.5.bb</a>} (96%)<br>
<br>
diff --git a/meta-oe/recipes-printing/gutenprint/<a href=3D"http://gutenpri=
nt_5.3.4.bb" rel=3D"noreferrer" target=3D"_blank">gutenprint_5.3.4.bb</a> b=
/meta-oe/recipes-printing/gutenprint/<a href=3D"http://gutenprint_5.3.5.bb"=
 rel=3D"noreferrer" target=3D"_blank">gutenprint_5.3.5.bb</a><br>
similarity index 96%<br>
rename from meta-oe/recipes-printing/gutenprint/<a href=3D"http://gutenprin=
t_5.3.4.bb" rel=3D"noreferrer" target=3D"_blank">gutenprint_5.3.4.bb</a><br=
>
rename to meta-oe/recipes-printing/gutenprint/<a href=3D"http://gutenprint_=
5.3.5.bb" rel=3D"noreferrer" target=3D"_blank">gutenprint_5.3.5.bb</a><br>
index f90a123293..82953b798c 100644<br>
--- a/meta-oe/recipes-printing/gutenprint/<a href=3D"http://gutenprint_5.3.=
4.bb" rel=3D"noreferrer" target=3D"_blank">gutenprint_5.3.4.bb</a><br>
+++ b/meta-oe/recipes-printing/gutenprint/<a href=3D"http://gutenprint_5.3.=
5.bb" rel=3D"noreferrer" target=3D"_blank">gutenprint_5.3.5.bb</a><br>
@@ -17,7 +17,7 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D59530bdf3=
3659b29e73d4adb9f9f6552&quot;<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"https://downloads.sourceforge.net/gimp-p=
rint/$%7BBP%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">https://downloa=
ds.sourceforge.net/gimp-print/${BP}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-cups-fix-a-build-race=
-condition-around-empty-directo.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-SRC_URI[sha256sum] =3D &quot;db44a701d2b8e6a8931c83cec06c91226be266d23e5c1=
89d20a39dd175f2023b&quot;<br>
+SRC_URI[sha256sum] =3D &quot;f5a9f47de28530b1ae2069cfbc647a9a641baeeabe809=
bb0ef2b3ec5b9668d70&quot;<br>
<br>
=C2=A0inherit autotools gettext pkgconfig<br>
<br>
-- <br>
2.51.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#119552): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/119552" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/119552</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/115307539/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/115307539/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr" t=
arget=3D"_blank">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--000000000000896903063f1402c6--

