Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BEB0C5B552
	for <webhook@archiver.kernel.org>; Mon,  9 Jun 2025 07:10:34 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.53821.1749453027733434354
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jun 2025 00:10:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Ojr1q/4e;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-450cfb79177so19434385e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Jun 2025 00:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1749453026; x=1750057826; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RnBXE1JfYG1H27rFVUcqGNublF3Hs8V6YrfDhXnBymY=;
        b=Ojr1q/4eBfo+ihQMAZEPNF6M3zz1HJsArv2GeJGySGvK4d0F3ng+ufKIAvOhiqvIw0
         jqHvdsq2ToVhfvYHGVj9UQ1myBhq5praDOTf0YelOqdYXwsza+jI24A3rueinqrhGjs2
         51Lgfz80WDvSRfmb5kMyPc34hrpWEqGWLAoBQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749453026; x=1750057826;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RnBXE1JfYG1H27rFVUcqGNublF3Hs8V6YrfDhXnBymY=;
        b=V83gtoaInvt6f0HDe0M6+Dlhn583VrEtr/pP2cE6zfyJ3kpr9eKOnJnKwnGIhtAh6d
         aaWUUQaFraPAcw0dE0qW/4bkG1r12p90mZvB8PThqP7hafrCivGR3qxqmUDt/pYQq7uw
         Mr+rIVYhqTRI5NJfUCncBoFMf9BUKzl5nLbsR/9qzILqCEHhwZn5aJRv9tX+vMGLlv8H
         M1CckN4Lj/h2v4GsbZh2df/zUM3qOZ7jhvjvK0P/5iAG5O0CJWuV0zVdcGFraQ0tBPYZ
         pJa61w0yc+1w3019j6bQdu9mG1ysuLkXIPQbn+CygywNZX+61Obz1+ep5GYS7wU0Kysn
         a8kg==
X-Gm-Message-State: AOJu0YyOuStQqr/hhikQUja1FKNgZMB/BG/BcK8AiHPsUeJiqdbZiOJx
	S3t1AQE82TJHdDZPZo4uVqRGqDILOdqUfZf+7QTpr3UbnIJKCVfCtznJRmVa1xP4JW+KLfOTjeb
	s7Awn40cMpF5vviYXQKThXJc+qwf/+GMqPu3jcjmhEg==
X-Gm-Gg: ASbGncul5rykJU0b5cPxYiYIPtNOZN4DEarkXxqkQV4Cxnd5IlAk+toSL+KiSWpmj7w
	yycwhVEAoIpoaUpsWTBuUx4fs8gw3DLu6F6sQOpUN6XXTqoDrUUMB/yeJ2F+ADVVKjGXpthOuq7
	YRC/f5kbWOeDD1tXgi2s1MogSqLs+BWGgqlRMQaRY1K0MK6Cvjf1AAjbrPGMHjjqn2p8Q=
X-Google-Smtp-Source: AGHT+IEYbJv7T41qcE3edvDXNXtjaxXkTFpyM4ZV/oueyvEKb5Y2n3WF4vVVLc6Pp+afOXcSUiwQ/LagZSNmYrzw3+A=
X-Received: by 2002:a05:6000:290d:b0:3a4:f918:9d4e with SMTP id
 ffacd0b85a97d-3a5319b64b0mr7430084f8f.41.1749453025832; Mon, 09 Jun 2025
 00:10:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250609070244.111198-1-hongxu.jia@windriver.com>
In-Reply-To: <20250609070244.111198-1-hongxu.jia@windriver.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Mon, 9 Jun 2025 09:10:00 +0200
X-Gm-Features: AX0GCFv3mYWNXLlc2wBpEac2wbFCCd5OLrUGDZEu1b4wS7W-bjXx3SxpvdxUMtY
Message-ID: <CAMSfU+4wiLOTguBZW2DJA6_DA_Lkuhagu-dOw1gBcH3MUHJJ0Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] Correct recipe version to 1.64.4
To: hongxu.jia@eng.windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000028079e06371e469b"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Jun 2025 07:10:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117782

--00000000000028079e06371e469b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 9 juin 2025 =C3=A0 09:02, hongxu via lists.openembedded.org <hongxu=
.jia=3D
eng.windriver.com@lists.openembedded.org> a =C3=A9crit :

> Bump up minor version to 4 to follow the output of command
> 'xmlrpc-c-config  --version'
>
> root@intel-x86-64:~# xmlrpc-c-config  --version
> 1.60.4
>

Hello,

Can you put the recipe name in the patch title please?

Also, your example does not match the change (1.60.4 vs 1.64.4), can you
double check?

Thanks!


> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  .../xmlrpc-c/{xmlrpc-c_1.64.0.bb =3D> xmlrpc-c_1.64.4.bb}           | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename meta-oe/recipes-devtools/xmlrpc-c/{xmlrpc-c_1.64.0.bb =3D>
> xmlrpc-c_1.64.4.bb} (100%)
>
> diff --git a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.64.0.bb
> b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.64.4.bb
> similarity index 100%
> rename from meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.64.0.bb
> rename to meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.64.4.bb
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117781):
> https://lists.openembedded.org/g/openembedded-devel/message/117781
> Mute This Topic: https://lists.openembedded.org/mt/113546466/4316185
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--00000000000028079e06371e469b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0lun. 9 =
juin 2025 =C3=A0=C2=A009:02, hongxu via <a href=3D"http://lists.openembedde=
d.org">lists.openembedded.org</a> &lt;hongxu.jia=3D<a href=3D"mailto:eng.wi=
ndriver.com@lists.openembedded.org">eng.windriver.com@lists.openembedded.or=
g</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">Bump up minor version to 4 to follow the output of command<br=
>
&#39;xmlrpc-c-config=C2=A0 --version&#39;<br>
<br>
root@intel-x86-64:~# xmlrpc-c-config=C2=A0 --version<br>
1.60.4<br></blockquote><div><br></div><div>Hello,</div><div><br></div><div>=
Can you put the recipe name in the patch title please?</div><div><br></div>=
<div>Also, your example does not match the change (1.60.4 vs 1.64.4), can y=
ou double check?</div><div><br></div><div>Thanks!</div><div>=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" t=
arget=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../xmlrpc-c/{<a href=3D"http://xmlrpc-c_1.64.0.bb" rel=3D"noreferrer=
" target=3D"_blank">xmlrpc-c_1.64.0.bb</a> =3D&gt; <a href=3D"http://xmlrpc=
-c_1.64.4.bb" rel=3D"noreferrer" target=3D"_blank">xmlrpc-c_1.64.4.bb</a>}=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 0<br>
=C2=A01 file changed, 0 insertions(+), 0 deletions(-)<br>
=C2=A0rename meta-oe/recipes-devtools/xmlrpc-c/{<a href=3D"http://xmlrpc-c_=
1.64.0.bb" rel=3D"noreferrer" target=3D"_blank">xmlrpc-c_1.64.0.bb</a> =3D&=
gt; <a href=3D"http://xmlrpc-c_1.64.4.bb" rel=3D"noreferrer" target=3D"_bla=
nk">xmlrpc-c_1.64.4.bb</a>} (100%)<br>
<br>
diff --git a/meta-oe/recipes-devtools/xmlrpc-c/<a href=3D"http://xmlrpc-c_1=
.64.0.bb" rel=3D"noreferrer" target=3D"_blank">xmlrpc-c_1.64.0.bb</a> b/met=
a-oe/recipes-devtools/xmlrpc-c/<a href=3D"http://xmlrpc-c_1.64.4.bb" rel=3D=
"noreferrer" target=3D"_blank">xmlrpc-c_1.64.4.bb</a><br>
similarity index 100%<br>
rename from meta-oe/recipes-devtools/xmlrpc-c/<a href=3D"http://xmlrpc-c_1.=
64.0.bb" rel=3D"noreferrer" target=3D"_blank">xmlrpc-c_1.64.0.bb</a><br>
rename to meta-oe/recipes-devtools/xmlrpc-c/<a href=3D"http://xmlrpc-c_1.64=
.4.bb" rel=3D"noreferrer" target=3D"_blank">xmlrpc-c_1.64.4.bb</a><br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#117781): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/117781" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/117781</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/113546466/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/113546466/4316185</a><br>
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

--00000000000028079e06371e469b--

