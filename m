Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5ED0C3DA61
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 18:28:28 +0000 (UTC)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
 by mx.groups.io with SMTP id smtpd.web10.1394.1721327303704341802
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Jul 2024 11:28:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YuQwWEpO;
 spf=pass (domain: gmail.com, ip: 209.85.161.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-5d31ef2c73cso625134eaf.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Jul 2024 11:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721327303; x=1721932103; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fRCToj9VHX/lKdRvMU4kaJYiydeuNF7vRMK9u5zHQ/g=;
        b=YuQwWEpO2HLYOG+2OgHSVpxBlOwlJj9AJQHBTrIc6XH0gYuTDfWXhNpSW2Ua2yXbCt
         P3yrzJZ5svSo96OnJDJc5FkuBDDjRrauogaXt+P/GWyQsPEls0UwQZr9alt4g3Iezwwl
         T05kM5kBSgK2fabnOcspoDXB7WqSUxsvDc+NfU6Jy/I6RfBI8+e8s1orJIri3pMoT44K
         6R7vv5JQ7w/DZoj5YYAFg4rarER3jtnZWjNEddEPb3vdho/dLDz7eJxFL0Jt4Z160csE
         9IlRWnB/lyXI8D+yrJlvt8Mt7l0Bg1gRIpkU4T76whwWPkOxX0ZKjnVcpWiunTvFHrD3
         iy6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721327303; x=1721932103;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fRCToj9VHX/lKdRvMU4kaJYiydeuNF7vRMK9u5zHQ/g=;
        b=cXOZfDRO8+J7DLXtjWkOsMCQkVqkJBLw9BvzNYDTaEXmLILhl1tQW3c2UIJDESLaxz
         Q9Q6C3bCPMuQU+gzuh5s0OLvLzCJl0uqn4+4FahEdSRfGIqW6ddO8qvr+BRi4Uw3akqr
         TNtlCEO93SOzgqzX5dw999W+8jCUPwR/VRiZhA9zJo5jrDyHMIoyWeePg91s+u5rEjgR
         aMDQHlprFDEUANrl9cl1rM3hfGAv59fjojI5q5nTOM4CS5RYGadcqF779B0SiK2mY1F2
         n8ioZRtbBlno+8rFgLoPPARS5KBwxft1yIVMyvWVfjLy01OPbbwe9wEbOZPaCMmaVS/G
         wkwQ==
X-Gm-Message-State: AOJu0YwQ+MJb7CSSNgXp1os5+y+Ok0qEwESEwxmegzaJIehlOZNkbgBz
	soP6vACoGffHiU/wVJWEDCQh4P5ZK73xVKKNyqToN/AI6YEVA3Zn1hySToNoDtQW593k0YRDH5d
	8A38Aj6blXoddYIV1l38y6bB86UY=
X-Google-Smtp-Source: AGHT+IFLcO6+8FLMWzVDNU4gXgLYetzGFFYlcP34XJKjNWaot7MLSalqwvBGxNdw4iSoIzaQu+FMFfYOS4UTu26FgYg=
X-Received: by 2002:a05:6870:d202:b0:25d:1a2f:cd53 with SMTP id
 586e51a60fabf-260d950b478mr4891697fac.53.1721327302794; Thu, 18 Jul 2024
 11:28:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240718172321.412136-1-gudni.m.g@gmail.com>
In-Reply-To: <20240718172321.412136-1-gudni.m.g@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 18 Jul 2024 11:28:11 -0700
Message-ID: <CAMKF1soGHXo9VVMB+e3qLw0JJW8LSNDtPVuj8H0p+KRQoJM3RQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-incremental: improve packaging
To: gudni.m.g@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000006ce8b4061d89be5f"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Jul 2024 18:28:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111406

--0000000000006ce8b4061d89be5f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for doing this. These kind of changes are very helpful

On Thu, Jul 18, 2024 at 10:24=E2=80=AFAM Gu=C3=B0ni M=C3=A1r Gilbert via
lists.openembedded.org <gudni.m.g=3Dgmail.com@lists.openembedded.org> wrote=
:

> Summary of changes:
> 1. Create a new package: python3-incremental-tests
> 2. Create a new package: python3-incremental-scripts. This is an optional
> package used to update Twisted locally on the command line. The package
> requires python3-click. Most, if not all, users don't need this package.
> 3. There is no longer a circular dependency between python3-twisted and
> python3-incremental at build time.
> 5. python3-incremental ipk package shrinks from 167 KiB to 32 KiB
>
> Signed-off-by: Gu=C3=B0ni M=C3=A1r Gilbert <gudni.m.g@gmail.com>
> ---
>  .../python/python3-incremental_22.10.0.bb     | 27 ++++++++++++++-----
>  1 file changed, 21 insertions(+), 6 deletions(-)
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-incremental_22.10.0.bb b/meta-python/recipes-devtools/python/
> python3-incremental_22.10.0.bb
> index 503ef35a9..007be032f 100644
> --- a/meta-python/recipes-devtools/python/python3-incremental_22.10.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-incremental_22.10.0.bb
> @@ -7,13 +7,28 @@ SRC_URI[sha256sum] =3D
> "912feeb5e0f7e0188e6f42241d2f450002e11bbc0937c65865045854c2
>
>  inherit pypi python_setuptools_build_meta
>
> -RDEPENDS:${PN} +=3D " \
> -    python3-twisted-core \
> +PACKAGE_BEFORE_PN =3D "\
> +    ${PN}-scripts \
> +    ${PN}-tests \
> +"
> +
> +FILES:${PN}-scripts =3D "\
> +    ${PYTHON_SITEPACKAGES_DIR}/incremental/update.py \
> +    ${PYTHON_SITEPACKAGES_DIR}/incremental/__pycache__/update*.pyc \
> +"
> +
> +RDEPENDS:${PN}-scripts =3D "\
>      python3-click \
> +    python3-twisted-core \
> +"
> +
> +FILES:${PN}-tests =3D "${PYTHON_SITEPACKAGES_DIR}/incremental/tests"
> +
> +# The tests require unit testing tool 'trial' from the twisted package
> +RDEPENDS:${PN}-tests =3D "\
> +    ${PN}-scripts \
> +    python3-twisted \
>  "
>
> -# -native is needed to build python[3]-twisted, however, we need to take
> steps to
> -# prevent a circular dependency. The build apparently does not use the
> part of
> -# python-incremental which uses python-twisted, so this hack is OK.
> -RDEPENDS:python3-incremental-native:remove =3D "python3-twisted-core-nat=
ive"
>  BBCLASSEXTEND =3D "native"
> +
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111405):
> https://lists.openembedded.org/g/openembedded-devel/message/111405
> Mute This Topic: https://lists.openembedded.org/mt/107421002/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000006ce8b4061d89be5f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div dir=3D"auto">Thanks for doing this. These kind of chang=
es are very helpful=C2=A0</div><div dir=3D"auto"><br><div class=3D"gmail_qu=
ote" dir=3D"auto"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 18, 202=
4 at 10:24=E2=80=AFAM Gu=C3=B0ni M=C3=A1r Gilbert via <a href=3D"http://lis=
ts.openembedded.org">lists.openembedded.org</a> &lt;gudni.m.g=3D<a href=3D"=
mailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Summary of changes:<b=
r>
1. Create a new package: python3-incremental-tests<br>
2. Create a new package: python3-incremental-scripts. This is an optional<b=
r>
package used to update Twisted locally on the command line. The package<br>
requires python3-click. Most, if not all, users don&#39;t need this package=
.<br>
3. There is no longer a circular dependency between python3-twisted and<br>
python3-incremental at build time.<br>
5. python3-incremental ipk package shrinks from 167 KiB to 32 KiB<br>
<br>
Signed-off-by: Gu=C3=B0ni M=C3=A1r Gilbert &lt;<a href=3D"mailto:gudni.m.g@=
gmail.com" target=3D"_blank">gudni.m.g@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../python/<a href=3D"http://python3-incremental_22.10.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">python3-incremental_22.10.0.bb</a>=C2=A0 =C2=
=A0 =C2=A0| 27 ++++++++++++++-----<br>
=C2=A01 file changed, 21 insertions(+), 6 deletions(-)<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
incremental_22.10.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-increm=
ental_22.10.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http:=
//python3-incremental_22.10.0.bb" rel=3D"noreferrer" target=3D"_blank">pyth=
on3-incremental_22.10.0.bb</a><br>
index 503ef35a9..007be032f 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-increme=
ntal_22.10.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-incremental_2=
2.10.0.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-increme=
ntal_22.10.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-incremental_2=
2.10.0.bb</a><br>
@@ -7,13 +7,28 @@ SRC_URI[sha256sum] =3D &quot;912feeb5e0f7e0188e6f42241d2f=
450002e11bbc0937c65865045854c2<br>
<br>
=C2=A0inherit pypi python_setuptools_build_meta<br>
<br>
-RDEPENDS:${PN} +=3D &quot; \<br>
-=C2=A0 =C2=A0 python3-twisted-core \<br>
+PACKAGE_BEFORE_PN =3D &quot;\<br>
+=C2=A0 =C2=A0 ${PN}-scripts \<br>
+=C2=A0 =C2=A0 ${PN}-tests \<br>
+&quot;<br>
+<br>
+FILES:${PN}-scripts =3D &quot;\<br>
+=C2=A0 =C2=A0 ${PYTHON_SITEPACKAGES_DIR}/incremental/update.py \<br>
+=C2=A0 =C2=A0 ${PYTHON_SITEPACKAGES_DIR}/incremental/__pycache__/update*.p=
yc \<br>
+&quot;<br>
+<br>
+RDEPENDS:${PN}-scripts =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0python3-click \<br>
+=C2=A0 =C2=A0 python3-twisted-core \<br>
+&quot;<br>
+<br>
+FILES:${PN}-tests =3D &quot;${PYTHON_SITEPACKAGES_DIR}/incremental/tests&q=
uot;<br>
+<br>
+# The tests require unit testing tool &#39;trial&#39; from the twisted pac=
kage<br>
+RDEPENDS:${PN}-tests =3D &quot;\<br>
+=C2=A0 =C2=A0 ${PN}-scripts \<br>
+=C2=A0 =C2=A0 python3-twisted \<br>
=C2=A0&quot;<br>
<br>
-# -native is needed to build python[3]-twisted, however, we need to take s=
teps to<br>
-# prevent a circular dependency. The build apparently does not use the par=
t of<br>
-# python-incremental which uses python-twisted, so this hack is OK.<br>
-RDEPENDS:python3-incremental-native:remove =3D &quot;python3-twisted-core-=
native&quot;<br>
=C2=A0BBCLASSEXTEND =3D &quot;native&quot;<br>
+<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#111405): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/111405" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/111405</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/107421002/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/107421002/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000006ce8b4061d89be5f--

