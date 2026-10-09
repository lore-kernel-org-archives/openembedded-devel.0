Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48C33CA601F
	for <webhook@archiver.kernel.org>; Fri,  9 Oct 2026 18:58:59 +0000 (UTC)
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.783.1791565655542211675
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Oct 2026 10:07:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PspPtnGa;
 spf=pass (domain: gmail.com, ip: 74.125.224.53, mailfrom: joel.winarske@gmail.com)
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-677ad9083feso5004734d50.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Oct 2026 10:07:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791565654; cv=none;
        d=google.com; s=arc-20260327;
        b=KORyldXgsJoTEbkXI0OXFEnDYQCuoBD/aOFUN9UczCQ9mSr0hVf7odeCOhDafpVJBo
         kZZUHwCokks8VOAkln95d6ti6TjzcMTtbH9p8F+xaCm/oXOt4jpsF/gOe3MLtr14ei28
         cD8RnVtIIe+5QQFjIXWKcT0fAm16kTjGDrxD7xeBHWx9QnzvPzRLEhkG8s8pK9ygluhy
         EmS8Xz0h/y0TMIbZQHTFv0yWkAqR0iehLdKTnpLRvwEbjQF5p4AMuWzvdbNnJUnSS06r
         d3epqAxys9GhSHhlGAdv1K5vV8tiFHN7Qs8cR3GCOxi692N4QvUfdWQZp/o54R0t+ZEU
         w3ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=n7V2UVt8YWVWaxCB3tBXQ09A3HXQvcYju6RroPD6Oxs=;
        fh=pgSuNtBd9WV+mTof3gYKFZAQkk03g+8G5+Acac4ed14=;
        b=DfeBbu3CKaxKt1tyUkA5vI7S0qM4M25nrREBfkJB4XkI/wUDy5XCaUJeXZDmS66xHQ
         Ftpsjaq4e7l1Yr/r1SCjgnVdaRaC92Gi8zJFNDQqmwNFNzWrGvcMPK+XsUjeKwVZIA21
         Xm3yJpBXzL98ZX4u4TIbh4a05gOoCmG+AnxPCgqxLoiRav0NV5HMQ/ZtWGVBZXeWpsr4
         KFy9HXPgGcMlDWjLMT7ljEO+sEcH91GNG9xnhKnG+0JW8ps9CvDI8HUSh/mXfuZ0A52c
         8Go0K8yiP8NSqhU1lotahbacuckgP8pFI65Xd4w3L9bgvbHQk05DyzysliDCv21Xnzc2
         3kfw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791565654; x=1792170454; darn=lists.openembedded.org;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n7V2UVt8YWVWaxCB3tBXQ09A3HXQvcYju6RroPD6Oxs=;
        b=PspPtnGa8n9nlB9Hd7hv/83mylu8jRVYvL1fJ5LIxkizgXH809L2Oo/XAuL1hXA9ux
         jI+8N7ptXCC3pZTZZAPXLQx1AURJ9RF5VjtnEfBEI5LfcO2EKwRIr224+KkFPOxatPwx
         UjduGpC4HTidzbX4BdpqbpmIpZZTDcLFGPvaHTuM3y2CtqK2YUlA0RQzUDymSZ6mOdRG
         jY9PzKyaLDMvEiBV1qCS77mxttdOU+IDAOtWVaibH9tDjY+6rm2tpGP/6KZp9+o4bNna
         m+sFoqXFFN60nW0WuY6wcUh1zdTm1h9ktA8flGbw7pAp5dh2+DR+8H5/eyNsWI7kK4fq
         i3bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791565654; x=1792170454;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n7V2UVt8YWVWaxCB3tBXQ09A3HXQvcYju6RroPD6Oxs=;
        b=oHzSO+jgKIs5YuSDmKTSHHbxs8PJLKu7A5ILiu+/VXRjakHEy/lNoS+C/IY6hOsYvc
         qzbKYEeToIrqXPgewJj8ou8J+YcF31ktLLxCpLGhs5/QL89P26YvMC91VH3nosgH978G
         rn5slg7HZeLaJoxZBciOGfVhuHONycZkUFJB+tfkqXFII+NTiFuxivfgfnTu9lvEx4/h
         ZV7Lmwe95UPCsi7nHM97s45USDBF/ZtPtwngLNe149wdOPcOLsvSzq3T1TutO4154U4b
         cwG1cqdANIJ2zP00GbDvwFkQijmEfaqr67fXYKZf4JRyXi403hbY3i9P2YFgrNqkqSiu
         YSmA==
X-Gm-Message-State: AFq9FYJaA/1S3p+g/d8g/oFkrvFUXGeq3s7XL26GX3LLRcTK8+y3TG4P
	wdx5iuUJLHg/+/mfJsZD/dPK0sJr2fLHd1coZ8dEuqMNDexPH+mQrwAOV0R//clyaB8lSUU4TTC
	hqXb85apU4wzCZ1ep0kMQEd1GOke4IldwO3ETPZA=
X-Gm-Gg: AYBFou3XdLAAP3BMB4dNiS7A1cIPbo2xZFVpdxmtUDtqEqGNEEw/Lr8rLlZIpiXlpZY
	Ey3uUy3DiNox1h0k4ISoOTcXU6dfdeFrJinx0KLn6lvijYxnuKMdpEH/Y4stXCs+0uu3fZX0TmH
	hjD2KRWbBDatnLNgPcBG90WlUHBWiasz9mdDJL/Wxry9sDYNNrzbASt0HfOw976BwFC2zAw3xaU
	c5DRDNhrOGqjGhVMFaZFJ16Nsvouj6xrPJN1TDmXKo5riTobLfBhq21lP5DQlWtuJneGsQV3EH2
	/H8SAmnA/2eSU+vLzxTK4bykYt0pMQ62Ci5Ez28rYgz/wnLFXdv8SPaGYkAZWUuvJXLtnipfQi5
	mr0X3n7u0RBB2Rp2jX3OsobKz0m0HXKPzhvnIw5o/6r7BQ14bNXzSQmQ3jMmaXG6nRQ==
X-Received: by 2002:a05:690e:1504:b0:676:866f:4da8 with SMTP id
 956f58d0204a3-67936a678ffmr762813d50.84.1791565653266; Fri, 09 Oct 2026
 10:07:33 -0700 (PDT)
MIME-Version: 1.0
References: <20261009163214.3203833-1-joel.winarske@linux.com> <20261009163214.3203833-2-joel.winarske@linux.com>
In-Reply-To: <20261009163214.3203833-2-joel.winarske@linux.com>
From: "Joel Winarske" <joel.winarske@gmail.com>
Date: Fri, 9 Oct 2026 10:07:20 -0700
X-Gm-Features: AclHuK_AgmH1jrrSS0dCZP6hO7gZiTap4rVhRZgKA86JWliOpGozioKWIaHPnX0
Message-ID: <CABKMkP+7-i34ZZW7cajgHG7BPnZLHr9zXF3eTn6vZEHq=wT6ig@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] python3-gammu: set PYPI_PACKAGE_SDIST
To: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000005ad3fc065d6b6238"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Oct 2026 18:58:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130708

--0000000000005ad3fc065d6b6238
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I have a sweep for the rest: 60 recipes in meta-python and python3-gammu
in meta-oe. That is every remaining recipe where the effective
PYPI_PACKAGE carries a hyphen and the sdist does not.

Left out as already covered:

  yours   async-timeout, google-api-core, googleapis-common-protos,
          google-api-python-client, requests-toolbelt
  Scott   dateutil, systemd
  Ankur   pytest-benchmark, types-setuptools

51 use PYPI_PACKAGE_SDIST =3D "${PYPI_PACKAGE}" as yours do. The other 10
cannot: normalizing lowercases the name while the sdist keeps its case,
flask-restful against Flask-RESTful, so those name the sdist directly.

No PYPI_PACKAGE is removed. Dropping a non-redundant one repoints
HOMEPAGE, UPSTREAM_CHECK_URI and the SPDX purl at the name BPN derives,
which is not always the project.

Verified against oe-core master with an empty DL_DIR: every one fails
do_fetch before and fetches after, checksums unchanged.

Do you want it as one patch, or split up? I can also hold it until the
per-recipe patches land and send whatever is left, if that is easier
with three of us touching the same files.

On Fri, Oct 9, 2026 at 9:32=E2=80=AFAM Joel Winarske <joel.winarske@gmail.c=
om>
wrote:

> From: Joel Winarske <joel.winarske@gmail.com>
>
> oe-core 98049bf86 redefined PYPI_PACKAGE as the normalized project name a=
nd
> derives the sdist name from it by replacing - with _. The sdist here
> predates
> PEP 625 and is still python-gammu-3.2.4.tar.gz, so do_fetch asks for
> python_gammu-3.2.4.tar.gz and gets a 404.
>
> PYPI_PACKAGE stays: the project is python-gammu, while BPN derives gammu,
> so
> dropping it would repoint HOMEPAGE, UPSTREAM_CHECK_URI and the SPDX purl =
at
> the wrong project.
>
> Checksum is unaffected, only the URL. Verified against oe-core master wit=
h
> an
> empty DL_DIR: do_fetch fails before and succeeds after.
>
> Signed-off-by: Joel Winarske <joel.winarske@gmail.com>
> ---
>  meta-oe/recipes-connectivity/gammu/python3-gammu_3.2.4.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-oe/recipes-connectivity/gammu/python3-gammu_3.2.4.bb
> b/meta-oe/recipes-connectivity/gammu/python3-gammu_3.2.4.bb
> index f5e2cc4da1..e9138462a3 100644
> --- a/meta-oe/recipes-connectivity/gammu/python3-gammu_3.2.4.bb
> +++ b/meta-oe/recipes-connectivity/gammu/python3-gammu_3.2.4.bb
> @@ -6,6 +6,7 @@ LICENSE =3D "GPL-2.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
>
>  PYPI_PACKAGE =3D "python-gammu"
> +PYPI_PACKAGE_SDIST =3D "${PYPI_PACKAGE}"
>
>  inherit pypi setuptools3 pkgconfig
>
> --
> 2.56.0
>
>

--0000000000005ad3fc065d6b6238
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I have a sweep for the rest: 60 recipes in meta-python and=
 python3-gammu<br>in meta-oe. That is every remaining recipe where the effe=
ctive<br>PYPI_PACKAGE carries a hyphen and the sdist does not.<br><br>Left =
out as already covered:<br><br>=C2=A0 yours =C2=A0 async-timeout, google-ap=
i-core, googleapis-common-protos,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goo=
gle-api-python-client, requests-toolbelt<br>=C2=A0 Scott =C2=A0 dateutil, s=
ystemd<br>=C2=A0 Ankur =C2=A0 pytest-benchmark, types-setuptools<br><br>51 =
use PYPI_PACKAGE_SDIST =3D &quot;${PYPI_PACKAGE}&quot; as yours do. The oth=
er 10<br>cannot: normalizing lowercases the name while the sdist keeps its =
case,<br>flask-restful against Flask-RESTful, so those name the sdist direc=
tly.<br><br>No PYPI_PACKAGE is removed. Dropping a non-redundant one repoin=
ts<br>HOMEPAGE, UPSTREAM_CHECK_URI and the SPDX purl at the name BPN derive=
s,<br>which is not always the project.<br><br>Verified against oe-core mast=
er with an empty DL_DIR: every one fails<br>do_fetch before and fetches aft=
er, checksums unchanged.<br><br>Do you want it as one patch, or split up? I=
 can also hold it until the<br>per-recipe patches land and send whatever is=
 left, if that is easier<br>with three of us touching the same files.</div>=
<br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Oct 9, 2026 at 9:32=E2=80=AFAM Joel Winarske &lt;<a=
 href=3D"mailto:joel.winarske@gmail.com">joel.winarske@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Joel =
Winarske &lt;<a href=3D"mailto:joel.winarske@gmail.com" target=3D"_blank">j=
oel.winarske@gmail.com</a>&gt;<br>
<br>
oe-core 98049bf86 redefined PYPI_PACKAGE as the normalized project name and=
<br>
derives the sdist name from it by replacing - with _. The sdist here predat=
es<br>
PEP 625 and is still python-gammu-3.2.4.tar.gz, so do_fetch asks for<br>
python_gammu-3.2.4.tar.gz and gets a 404.<br>
<br>
PYPI_PACKAGE stays: the project is python-gammu, while BPN derives gammu, s=
o<br>
dropping it would repoint HOMEPAGE, UPSTREAM_CHECK_URI and the SPDX purl at=
<br>
the wrong project.<br>
<br>
Checksum is unaffected, only the URL. Verified against oe-core master with =
an<br>
empty DL_DIR: do_fetch fails before and succeeds after.<br>
<br>
Signed-off-by: Joel Winarske &lt;<a href=3D"mailto:joel.winarske@gmail.com"=
 target=3D"_blank">joel.winarske@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-connectivity/gammu/<a href=3D"http://python3-gammu_3.=
2.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-gammu_3.2.4.bb</a> | 1=
 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta-oe/recipes-connectivity/gammu/<a href=3D"http://python3-g=
ammu_3.2.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-gammu_3.2.4.bb<=
/a> b/meta-oe/recipes-connectivity/gammu/<a href=3D"http://python3-gammu_3.=
2.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-gammu_3.2.4.bb</a><br>
index f5e2cc4da1..e9138462a3 100644<br>
--- a/meta-oe/recipes-connectivity/gammu/<a href=3D"http://python3-gammu_3.=
2.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-gammu_3.2.4.bb</a><br>
+++ b/meta-oe/recipes-connectivity/gammu/<a href=3D"http://python3-gammu_3.=
2.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-gammu_3.2.4.bb</a><br>
@@ -6,6 +6,7 @@ LICENSE =3D &quot;GPL-2.0-or-later&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Db234ee4d69f5fce4486a8=
0fdaf4a4263&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;python-gammu&quot;<br>
+PYPI_PACKAGE_SDIST =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
=C2=A0inherit pypi setuptools3 pkgconfig<br>
<br>
-- <br>
2.56.0<br>
<br>
</blockquote></div>

--0000000000005ad3fc065d6b6238--

