Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A38CAC3DA4A
	for <webhook@archiver.kernel.org>; Thu, 15 Aug 2024 01:59:55 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web11.114354.1723687191138264641
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Aug 2024 18:59:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AEelaJuZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6510c0c8e29so5875617b3.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Aug 2024 18:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723687190; x=1724291990; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XIqlLKFDsvwz+PcDPpJ5pfwj9cxHIMO3Eny/tg8YKN0=;
        b=AEelaJuZjBPFLfP22qWDO53MqHPjJxdZLpdLcNtGF2u0yTnineXXDhAEl0eh+RhEoJ
         uGwgdI5vwNCEoZ+EHDGvXum4ujyaZdG88kHSqZHe5HC6MhH14Uasg2mW9YRiTOcQV8n/
         hugZO0EgmkPJTggWGyUdr2Tp5b3k4J9eKLD7S5x0fuFA7Uittl0h+kwiNSRe3uhhiN5i
         XJkj6ZYqqMkmy+lLbXUg17+00rmKY/N+oBFoG4pPk+dCJsRlftFRMhM1kpdDiG1EsJ2r
         fc7TqNgACapSoghnAVOWc4PxRiezCYJ0J9r71gCdQyKembp5qYxXUbv4kHsP8XPFAxQj
         IHNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723687190; x=1724291990;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XIqlLKFDsvwz+PcDPpJ5pfwj9cxHIMO3Eny/tg8YKN0=;
        b=ahvmpnFxRin19E04gSdTMYBSoByoq0+mzIVeQJc5Cf6Yo8s1sQVw3qgNY6LfI4ElBX
         lO6bRwAVGircJFp5zZ5uIuKphsiltUVdxmN7EI2lmfnPOZ8IfcXqFErdtkoouo4ri7+3
         dLbVemSUXXuQe96vbvby9WHfVUrMs1Isda+xdm71mW827eFK/+bnLAkNVV8aZahAGM7d
         YBOiI5f8RdIIoOY3h/WJicFZfwqw2sIoVC3oXM2JsOG6WROQqwRTAObcrL6tbfh0Po4V
         MRAEI8vOj/JBCpU6tlqMnZ2qPhgtfQPXDmOCpMhKZLDLPoyVa62db/p7jHiYPrRO5Bik
         YWPQ==
X-Gm-Message-State: AOJu0YwUZ7ls0fZ+NTsfEWCgxbJGNmeTeMGf7Jm/Npv/UiovDHPCihP9
	HOfX1ICDkTeq0qJNZEo4b+oWVVcLSC2k4MsT5a3HVC+emleKCgK8YXIfGCuMU21+Ew9MCvpXKDy
	Yq+y+OLuJiTd8jP5X/2eLGfWKFB0=
X-Google-Smtp-Source: AGHT+IHr6rLjs/EudKG439aQSjgkKZ6ZVwvga8VNmItsJ3p/KNj4XX0o0/bh20qGQAXt8tcDGTY46o0MOf5rGN0/YqM=
X-Received: by 2002:a05:690c:f0f:b0:6ac:f8ac:7296 with SMTP id
 00721157ae682-6acf8ac765bmr55098007b3.1.1723687190232; Wed, 14 Aug 2024
 18:59:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240814115435.808089-1-leon.anavi@konsulko.com> <20240814115435.808089-3-leon.anavi@konsulko.com>
In-Reply-To: <20240814115435.808089-3-leon.anavi@konsulko.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Wed, 14 Aug 2024 18:59:39 -0700
Message-ID: <CANx9H-C0d3GXgyZrfc_S1MgHK76fKUT792Js==VUyPwZoLnvpQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 3/3] python3-fastjsonschema: Upgrade
 2.18.0 -> 2.20.0
To: leon.anavi@konsulko.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ad86d2061faf327b"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Aug 2024 01:59:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111808

--000000000000ad86d2061faf327b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Did you double check the tests are included in the sdist tarball? That is
why it was git fetcher.

In other words did you build meta-Python-image-ptest-python3-fastjson and
run -c testimage?

On Wed, Aug 14, 2024 at 4:54=E2=80=AFAM Leon Anavi via lists.openembedded.o=
rg
<leon.anavi=3Dkonsulko.com@lists.openembedded.org> wrote:

> Upgrade to release 2.20.0. Added validations at compile time:
>
> - required must have unique items
> - checking if schema is not allowing required items (item is
>   required, but is not listed in properties)
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  ...jsonschema_2.18.0.bb =3D> python3-fastjsonschema_2.20.0.bb} | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>  rename meta-python/recipes-devtools/python/{
> python3-fastjsonschema_2.18.0.bb =3D> python3-fastjsonschema_2.20.0.bb}
> (84%)
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-fastjsonschema_2.18.0.bb b/meta-python/recipes-devtools/python/
> python3-fastjsonschema_2.20.0.bb
> similarity index 84%
> rename from meta-python/recipes-devtools/python/
> python3-fastjsonschema_2.18.0.bb
> rename to meta-python/recipes-devtools/python/
> python3-fastjsonschema_2.20.0.bb
> index b2e969c5c..0524a73b6 100644
> --- a/meta-python/recipes-devtools/python/python3-fastjsonschema_2.18.0.b=
b
> +++ b/meta-python/recipes-devtools/python/python3-fastjsonschema_2.20.0.b=
b
> @@ -6,15 +6,12 @@ HOMEPAGE =3D "
> https://github.com/seznam/python-fastjsonschema"
>  LICENSE =3D "BSD-3-Clause"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D18950e8362b69c0c617b42b8bd8e7=
532"
>
> -SRCREV =3D "756540088687cda351390f687b92e602feaa7dc6"
> -PYPI_SRC_URI =3D "git://
> github.com/horejsek/python-fastjsonschema;protocol=3Dhttps;branch=3Dmaste=
r"
> +SRC_URI[sha256sum] =3D
> "3d48fc5300ee96f5d116f10fe6f28d938e6008f59a6a025c2649475b87f76a23"
>
>  SRC_URI +=3D "file://run-ptest"
>
>  inherit ptest pypi setuptools3
>
> -S =3D "${WORKDIR}/git"
> -
>  do_install_ptest() {
>         install -d ${D}${PTEST_PATH}/tests
>         cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111803):
> https://lists.openembedded.org/g/openembedded-devel/message/111803
> Mute This Topic: https://lists.openembedded.org/mt/107893158/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000ad86d2061faf327b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Did you double check the tests are included in the sdist =
tarball? That is why it was git fetcher.</div><div dir=3D"auto"><br></div><=
div dir=3D"auto">In other words did you build meta-Python-image-ptest-pytho=
n3-fastjson and run -c testimage?</div><div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 14, 2024 at 4:54=E2=80=AF=
AM Leon Anavi via <a href=3D"http://lists.openembedded.org">lists.openembed=
ded.org</a> &lt;leon.anavi=3D<a href=3D"mailto:konsulko.com@lists.openembed=
ded.org">konsulko.com@lists.openembedded.org</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-w=
idth:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204=
,204,204)">Upgrade to release 2.20.0. Added validations at compile time:<br=
>
<br>
- required must have unique items<br>
- checking if schema is not allowing required items (item is<br>
=C2=A0 required, but is not listed in properties)<br>
<br>
Signed-off-by: Leon Anavi &lt;<a href=3D"mailto:leon.anavi@konsulko.com" ta=
rget=3D"_blank">leon.anavi@konsulko.com</a>&gt;<br>
---<br>
=C2=A0...<a href=3D"http://jsonschema_2.18.0.bb" rel=3D"noreferrer" target=
=3D"_blank">jsonschema_2.18.0.bb</a> =3D&gt; <a href=3D"http://python3-fast=
jsonschema_2.20.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-fastjson=
schema_2.20.0.bb</a>} | 5 +----<br>
=C2=A01 file changed, 1 insertion(+), 4 deletions(-)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-fastjsonschema_2.18.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-fas=
tjsonschema_2.18.0.bb</a> =3D&gt; <a href=3D"http://python3-fastjsonschema_=
2.20.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-fastjsonschema_2.20=
.0.bb</a>} (84%)<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
fastjsonschema_2.18.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-fast=
jsonschema_2.18.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"h=
ttp://python3-fastjsonschema_2.20.0.bb" rel=3D"noreferrer" target=3D"_blank=
">python3-fastjsonschema_2.20.0.bb</a><br>
similarity index 84%<br>
rename from meta-python/recipes-devtools/python/<a href=3D"http://python3-f=
astjsonschema_2.18.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-fastj=
sonschema_2.18.0.bb</a><br>
rename to meta-python/recipes-devtools/python/<a href=3D"http://python3-fas=
tjsonschema_2.20.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-fastjso=
nschema_2.20.0.bb</a><br>
index b2e969c5c..0524a73b6 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-fastjso=
nschema_2.18.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-fastjsonsch=
ema_2.18.0.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-fastjso=
nschema_2.20.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-fastjsonsch=
ema_2.20.0.bb</a><br>
@@ -6,15 +6,12 @@ HOMEPAGE =3D &quot;<a href=3D"https://github.com/seznam/p=
ython-fastjsonschema" rel=3D"noreferrer" target=3D"_blank">https://github.c=
om/seznam/python-fastjsonschema</a>&quot;<br>
=C2=A0LICENSE =3D &quot;BSD-3-Clause&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D18950e8362b69c0c617b4=
2b8bd8e7532&quot;<br>
<br>
-SRCREV =3D &quot;756540088687cda351390f687b92e602feaa7dc6&quot;<br>
-PYPI_SRC_URI =3D &quot;git://<a href=3D"http://github.com/horejsek/python-=
fastjsonschema;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=
=3D"_blank">github.com/horejsek/python-fastjsonschema;protocol=3Dhttps;bran=
ch=3Dmaster</a>&quot;<br>
+SRC_URI[sha256sum] =3D &quot;3d48fc5300ee96f5d116f10fe6f28d938e6008f59a6a0=
25c2649475b87f76a23&quot;<br>
<br>
=C2=A0SRC_URI +=3D &quot;file://run-ptest&quot;<br>
<br>
=C2=A0inherit ptest pypi setuptools3<br>
<br>
-S =3D &quot;${WORKDIR}/git&quot;<br>
-<br>
=C2=A0do_install_ptest() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${PTEST_PATH}/tests<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/<br=
>
-- <br>
2.39.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#111803): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/111803" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/111803</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/107893158/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/107893158/924729</a><br>
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

--000000000000ad86d2061faf327b--

