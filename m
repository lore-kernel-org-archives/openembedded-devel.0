Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59E72D116F1
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 13:22:10 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21371.1764595320057077613
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Dec 2025 05:22:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=SYSp4sBs;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42e33956e76so401264f8f.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Dec 2025 05:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1764595318; x=1765200118; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JflPHhY2LT6NTOsl+ZJHInYJxbZ9oV87XacO1CGSmxI=;
        b=SYSp4sBs/urIyjmv/x6VM2F4KZyEMO7l0yE2XLA90ydi0G9fSO25+YBX6aU9pDRawn
         GjLxLxuSxTDy8CqRz8+KtU7JQoPIeXMwNzCmWgwwS8azwW+n28znJDMnn8Ds1CNVPi9+
         yogvVEK7hfmItPDV8mBfsTH3087kRo4wvdsis=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764595318; x=1765200118;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JflPHhY2LT6NTOsl+ZJHInYJxbZ9oV87XacO1CGSmxI=;
        b=uKMnVPVmK4vy8IZqeL/PBJ0PMBZYWmatnVrXMFnNiQ0y6kDRVUulkodukRlYW/SOYl
         WibQEuM1PUg0VKbudcJRGIBtLX3GrUpIsf3C+ThGzF3kMk8oQ1YEbWmlxfpSggWdBWPD
         ML61iN8638FAuzfZnFjoYVrWJE/jweezaZKIHQXWxZvY51383WbOgLSjggz+KrdQs6DA
         IIyl5g2aIYZDF44B/xOFvekvhBRcfg1xmJ5U/W8fJ80SgC32VcH9/NjReOZVnsYGCOdD
         8f44r29SafRxn8t+8X3MlPxZQ1khA0AM8mN865reh7iOTAi8qsyk7o0lgPLmgtwH4h8Y
         94ig==
X-Gm-Message-State: AOJu0YxKfjGDOGQqRXq51wP70jpITlq+o/IClS8pzmzkRslojdCiw1qC
	AdBfqjskD6yaQTZL33q19YfvTT6h+Quylybmy5ac5RsggH5sEeZm8IHfXKYuYd+rUOaL7YGtU7s
	53YRJ4gEcl46572NO9o+1HikuEWtlPJmOfPw5fTfKKg==
X-Gm-Gg: ASbGncugpDbrjkwSDU14IPZSzy+nyhwhuatOET/JOmeQVWz62jF8B4rH7pGQ52D1Ewv
	nLi7XtdMf2c6s7N21ZXgbGKMh7PFepcHzffl6r03M2A/KUIvwlmCKOeD5UXuspnp5yMj/5ZRY4L
	q1fOKZA71gNLa0HEKZRkCruz63lPAzOxerq39cjA5/xmsSsROlJeOA0kYKuvkXWfu4BXP4TdEvv
	bTtrrg2BWy16XMP/v+qTxSX9S3CPBGUUlopx+lmvvxt6HWSaFe3ycVKmSD0foOLVP48pvLTCQ==
X-Google-Smtp-Source: AGHT+IHFMTKarmEHGvDnOCqNMiEX4HeyGyTH5ghbA4UuYVDR1nqK7V8SAPjvppO3nTSA7vtYJj3kzRy5/mtzmgrkOFE=
X-Received: by 2002:a05:6000:40c7:b0:429:d6fa:da32 with SMTP id
 ffacd0b85a97d-42cc1d19d83mr41102014f8f.59.1764595318072; Mon, 01 Dec 2025
 05:21:58 -0800 (PST)
MIME-Version: 1.0
References: <20251201112044.369630-1-leon.anavi@konsulko.com>
In-Reply-To: <20251201112044.369630-1-leon.anavi@konsulko.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Mon, 1 Dec 2025 14:21:31 +0100
X-Gm-Features: AWmQ_bkiQY89fTsL9tHAQnwwhuBKh7cop2v7F8bk0-mOkOSvfU5GEdZq-7U8BkM
Message-ID: <CAMSfU+5Os9gORnytMLrutAK6sbEtJYbxVLn6RaVL+aTYsajwAQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 1/3] python3-gast: Upgrade 0.6.0 -> 0.7.0
To: leon.anavi@konsulko.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000001b388d0644e3dd20"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Dec 2025 13:22:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122208

--0000000000001b388d0644e3dd20
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 1 d=C3=A9c. 2025 =C3=A0 12:20, Leon Anavi via lists.openembedded.or=
g
<leon.anavi=3Dkonsulko.com@lists.openembedded.org> a =C3=A9crit :

> Upgrade to release 0.7.0:
>
> - Update unparser to harmonize output across revisions and handle
>   python 3.12+ features
> - Fix support for TypeVar, TypeVarTupe and ParamSpec=EF=BF=BC
>

FYI, there is a weird unicode character at the end of this line ^

I don't know if that is a problem or not...


> - Support t-string from python 3.14
> - Adjust test incompatible with py2
> - Support _field_types field for every AST class
> - Make gast.dump more generic across python version
> - Only pass existing attributes as keyword parameters in gast_to_ast
> - Initial oss-fuzz integration
> - Support [g]ast.get_source_segment
> - Fix gast.get_docstring implementation
> - Initialize ast node with known fields to avoid deprecation warning
>   in Python 3.13
> - Add missing type_params attribute for ClassDef node before
>   Python 3.12
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  .../python/{python3-gast_0.6.0.bb =3D> python3-gast_0.7.0.bb}     | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-python/recipes-devtools/python/{python3-gast_0.6.0.bb =3D>
> python3-gast_0.7.0.bb} (78%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-gast_0.6.0.bb
> b/meta-python/recipes-devtools/python/python3-gast_0.7.0.bb
> similarity index 78%
> rename from meta-python/recipes-devtools/python/python3-gast_0.6.0.bb
> rename to meta-python/recipes-devtools/python/python3-gast_0.7.0.bb
> index af46c3feb7..93301f0943 100644
> --- a/meta-python/recipes-devtools/python/python3-gast_0.6.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-gast_0.7.0.bb
> @@ -4,7 +4,7 @@ SECTION =3D "devel/python"
>  LICENSE =3D "BSD-3-Clause"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da3ad9b6802e713fc5e307e1230f1e=
a90"
>
> -SRC_URI[sha256sum] =3D
> "88fc5300d32c7ac6ca7b515310862f71e6fdf2c029bbec7c66c0f5dd47b6b1fb"
> +SRC_URI[sha256sum] =3D
> "0bb14cd1b806722e91ddbab6fb86bba148c22b40e7ff11e248974e04c8adfdae"
>
>  inherit pypi setuptools3
>
> --
> 2.47.3
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#122202):
> https://lists.openembedded.org/g/openembedded-devel/message/122202
> Mute This Topic: https://lists.openembedded.org/mt/116554099/4316185
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--0000000000001b388d0644e3dd20
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0lun. 1 =
d=C3=A9c. 2025 =C3=A0=C2=A012:20, Leon Anavi via <a href=3D"http://lists.op=
enembedded.org">lists.openembedded.org</a> &lt;leon.anavi=3D<a href=3D"mail=
to:konsulko.com@lists.openembedded.org">konsulko.com@lists.openembedded.org=
</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">Upgrade to release 0.7.0:<br>
<br>
- Update unparser to harmonize output across revisions and handle<br>
=C2=A0 python 3.12+ features<br>
- Fix support for TypeVar, TypeVarTupe and ParamSpec=EF=BF=BC<br></blockquo=
te><div><br></div><div>FYI, there is a weird unicode character at the end o=
f this line ^</div><div><br></div><div>I don&#39;t know if that is a proble=
m or not...</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
- Support t-string from python 3.14<br>
- Adjust test incompatible with py2<br>
- Support _field_types field for every AST class<br>
- Make gast.dump more generic across python version<br>
- Only pass existing attributes as keyword parameters in gast_to_ast<br>
- Initial oss-fuzz integration<br>
- Support [g]ast.get_source_segment<br>
- Fix gast.get_docstring implementation<br>
- Initialize ast node with known fields to avoid deprecation warning<br>
=C2=A0 in Python 3.13<br>
- Add missing type_params attribute for ClassDef node before<br>
=C2=A0 Python 3.12<br>
<br>
Signed-off-by: Leon Anavi &lt;<a href=3D"mailto:leon.anavi@konsulko.com" ta=
rget=3D"_blank">leon.anavi@konsulko.com</a>&gt;<br>
---<br>
=C2=A0.../python/{<a href=3D"http://python3-gast_0.6.0.bb" rel=3D"noreferre=
r" target=3D"_blank">python3-gast_0.6.0.bb</a> =3D&gt; <a href=3D"http://py=
thon3-gast_0.7.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-gast_0.7.=
0.bb</a>}=C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-gast_0.6.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-gast_0.6.0.bb<=
/a> =3D&gt; <a href=3D"http://python3-gast_0.7.0.bb" rel=3D"noreferrer" tar=
get=3D"_blank">python3-gast_0.7.0.bb</a>} (78%)<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
gast_0.6.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-gast_0.6.0.bb</=
a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-gast_0.7=
.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-gast_0.7.0.bb</a><br>
similarity index 78%<br>
rename from meta-python/recipes-devtools/python/<a href=3D"http://python3-g=
ast_0.6.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-gast_0.6.0.bb</a=
><br>
rename to meta-python/recipes-devtools/python/<a href=3D"http://python3-gas=
t_0.7.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-gast_0.7.0.bb</a><=
br>
index af46c3feb7..93301f0943 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-gast_0.=
6.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-gast_0.6.0.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-gast_0.=
7.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-gast_0.7.0.bb</a><br>
@@ -4,7 +4,7 @@ SECTION =3D &quot;devel/python&quot;<br>
=C2=A0LICENSE =3D &quot;BSD-3-Clause&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Da3ad9b6802e713fc5e307=
e1230f1ea90&quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;88fc5300d32c7ac6ca7b515310862f71e6fdf2c029bbe=
c7c66c0f5dd47b6b1fb&quot;<br>
+SRC_URI[sha256sum] =3D &quot;0bb14cd1b806722e91ddbab6fb86bba148c22b40e7ff1=
1e248974e04c8adfdae&quot;<br>
<br>
=C2=A0inherit pypi setuptools3<br>
<br>
-- <br>
2.47.3<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#122202): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/122202" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/122202</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116554099/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116554099/4316185</a><br>
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

--0000000000001b388d0644e3dd20--

