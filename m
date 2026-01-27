Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FCCBD2593F
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 05:47:44 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3754.1769492857623702533
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Jan 2026 21:47:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LWzB4D1x;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-7945838691aso23490727b3.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 21:47:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769492857; cv=none;
        d=google.com; s=arc-20240605;
        b=K+6Gj86O4oS+RyLD1QCcUY72GQv0tfjZWVn95ZZOzgkzBTSYeT4scdtc0LVJE2etBk
         h9+3Mg1Gn5n/ysTgWHlgfi6Utz3ydKS9nBgJk+W81NCXHEt49JjrJ7Zo38LwpapZn7BQ
         WFpgloQxsh6AZPR4PMvqIKsiqXolpnnKVdJ20rF9dfEJxf1zeJEZ2Gn1mHQSjOsSIBho
         k2R+rmgZL8WMBi+uLBbEEnkvWAWKH4wCLU9s0Ab7quJJlKUdnKBHb2tr5Oip+oAVQG5K
         1JYf0ncVzXpKesg+tgZFxUlGs2C/QifyYd4trURdrrLNOQscmqZZxqk39A01judcXRoY
         3Apg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Ojg01BrEZNcYEsYLoxfGFs+NRrW/E7W97RQk/R8Xz7k=;
        fh=RnZMXDUlwXY8UgMJsCy3860tY0uphmLPDqFPKV9t5MY=;
        b=SrrX7ie03niFJsk41krNij3FxNWcQ+4KRR4HJzkcuy4cJz8mGUYf0QlJ8FGZWM5HJy
         l91zGzY+hIDOi/FkfKs1+QndHPyEfMiuqKImsJFU5cosIbnti6Dw24alL5eYa21L5y6Z
         1VUZ0pG6PSRVy4PuN9r5JwnBYs1X6aIQ/GGevH7Y/cE0slrAmRHusi2z9iDKX0w3RKOO
         m6oUacLKROnXoAsrxcm/DH+XYOi1cEpiBzYIITpVNQxNKD+ROgJAQkJjSgomcsyYoDHP
         kAaHifqvchDdOOF5SKtMB6Px5RKluNgmUhbQOasCk6aNeyxH3b48r9y0BFjp/VsHraUo
         d4GA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769492857; x=1770097657; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ojg01BrEZNcYEsYLoxfGFs+NRrW/E7W97RQk/R8Xz7k=;
        b=LWzB4D1xGDa8m1bgrarik6Cop50/vSUhfxC/aUgnViu2M/FzwBv+oBmCFvMr3dx9yW
         nOCve3DOfCG5t7sdfJomXez6CD1v33WX/mTIduAgKPFrEzubXfRkOaOhemVt9eOW/j7V
         yH6kIiKLwZQFDr/6YIez3fQ3+CMkjhcb3giF3Gpu86WFRgaAj9P3W53gA2h0iaDpM/sS
         df+wFtdiFmDBb6i2aq6F2xdiecNL1D20H4L/JSxn0njPL5t6ucgA9DfIquf6x6Qitbqc
         Wy1LsXhJ6tZh1unN3PmIiUV/9hyveh9SaNsxXEENRMVoGZYgsPB0HSQNg8fHmYtf697o
         ktVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769492857; x=1770097657;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ojg01BrEZNcYEsYLoxfGFs+NRrW/E7W97RQk/R8Xz7k=;
        b=JComQYhyIn/V0rMNC+1WnqB0KGkOAk4e7iiXEAKV8Jkv8lEWYacKxFw1ZFjPsdWchk
         m3TOEHKwY7xe82CvZLThnu+6q5j9WsLuPr2qNxT+oCyQpRIrrJViWNaV3tnLHgH1Fptd
         HaMSzy8kLGKJFhr8SGHzBXr4lQVcYylcaP/xfQeY2FzZJ3NtnDMaJKkMosBz+LwwPEza
         TJI1KiIeFNwbI9abc2KwX5PSnbOLyXa+L7knkQHJOyI0Ta8TErr3CiWvE+KWmcr+PgTM
         rKz6J+S8RaFe7J1ZxhKUkuh7Ygi1XHSBEKTgHCL6NkfZ/Glm6Ku0HX10WxbUdMxzc7Kl
         ELMA==
X-Gm-Message-State: AOJu0Yw+SX7yS71kD2Rq+KNycCp7sOLbcZZGJRHRFe1RAXHcnjLuI9iu
	NNbHHTxdVRTzQ+1hFOU+xTTYaPaAoGTc+Ko1yNjpxqhicejmkBJ6YW4DUiUDGoIGgG5Ey6A686C
	x2JcSNdnESa1g3ZtXe9levimBAd/SOwQ=
X-Gm-Gg: AZuq6aIKgMTGdoWo1ZJYlEUWB1ZxAq2wNOvMphVqxz56XBkI9mBAJvVRiAiIicujIa/
	M/qcz1IoVZN/EE2X82OrlP9/Xl/Ud9SucR+M2U08sp9X7AiTXwq5KNf9w/tYmo0/4a34+dMdxu3
	XEPMGVesAX8YrFeAjDglp02dZtK+PaQWTttx2x14e8wLXZlkU9hBuhxPrvIRPXVYEeBi8Bv4GJG
	ra1iPmyEafp+OPmT2gDnwcjKvZdViOXnKMVCzpKxHhX9TxTKjgLo0ruQWqcoeT8spGBkz1OehFA
	GoOVawq0ih8Vxhk+8YSszT40xgzHtgZNm7iOYTnoaTFdDnY51IjWBy8GGGxaH1PAllAcIjRRwif
	PQ6DAvAED/QzlDok7//5F3D+5601IGADBjjNMQHKGu3i6
X-Received: by 2002:a05:690c:fc5:b0:793:ad45:8e8b with SMTP id
 00721157ae682-7947acee3f8mr3591117b3.19.1769492856661; Mon, 26 Jan 2026
 21:47:36 -0800 (PST)
MIME-Version: 1.0
References: <20260126122432.1312490-2-frederikbraendstrup@gmail.com>
In-Reply-To: <20260126122432.1312490-2-frederikbraendstrup@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 26 Jan 2026 21:47:10 -0800
X-Gm-Features: AZwV_QjvZjTlRby3faZgArCZ_tqOLqQDgdkKKUKaNc7FgoIMTC3YDA2Xy9iitug
Message-ID: <CAMKF1sp+wtMeF_t2Mww3NNe4F9mSXDDjeHr1D+RRDhPTHTzatQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH v1] python-iam-rolesanywhere-session:
 Add recipe at 2.3.0
To: frederikbraendstrup@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000276b7e0649582957"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 05:47:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123897

--000000000000276b7e0649582957
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This results in some dependencies which are not in the layer or its
recommended dependent layers. see

https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1271

On Mon, Jan 26, 2026 at 4:25=E2=80=AFAM Frederik Br=C3=A6ndstrup via
lists.openembedded.org <frederikbraendstrup=3Dgmail.com@lists.openembedded.=
org>
wrote:

> Signed-off-by: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
> ---
>  .../0001-fix-remove-license-classifier.patch  | 23 +++++++++++++++++++
>  ...python3-iam-rolesanywhere-session_2.3.0.bb | 12 ++++++++++
>  2 files changed, 35 insertions(+)
>  create mode 100644
> meta-python/recipes-extended/python3-iam-rolesanywhere-session/python3-ia=
m-rolesanywhere-session/0001-fix-remove-license-classifier.patch
>  create mode 100644
> meta-python/recipes-extended/python3-iam-rolesanywhere-session/
> python3-iam-rolesanywhere-session_2.3.0.bb
>
> diff --git
> a/meta-python/recipes-extended/python3-iam-rolesanywhere-session/python3-=
iam-rolesanywhere-session/0001-fix-remove-license-classifier.patch
> b/meta-python/recipes-extended/python3-iam-rolesanywhere-session/python3-=
iam-rolesanywhere-session/0001-fix-remove-license-classifier.patch
> new file mode 100644
> index 0000000000..8c61650963
> --- /dev/null
> +++
> b/meta-python/recipes-extended/python3-iam-rolesanywhere-session/python3-=
iam-rolesanywhere-session/0001-fix-remove-license-classifier.patch
> @@ -0,0 +1,23 @@
> +From bee363b93f0ddd305b71e1fa1d3dca6ea44c8f80 Mon Sep 17 00:00:00 2001
> +From: Frede Braendstrup <frederikbraendstrup@gmail.com>
> +Date: Fri, 17 Oct 2025 15:55:07 +0200
> +Subject: [PATCH] fix: remove license classifier
> +
> +Upstream-Status: Submitted
> https://github.com/awslabs/iam-roles-anywhere-session/pull/22
> +Signed-off-by
> <https://github.com/awslabs/iam-roles-anywhere-session/pull/22+Signed-off=
-by>:
> Frede Braendstrup <frederikbraendstrup@gmail.com>
> +---
> + pyproject.toml                                     | 1 -
> + 1 files changed, 0 insertions(+), 1 deletions(-)
> +
> +diff --git a/pyproject.toml b/pyproject.toml
> +index c001045..cd83a8f 100644
> +--- a/pyproject.toml
> ++++ b/pyproject.toml
> +@@ -20,7 +20,6 @@ requires-python =3D ">=3D3.8"
> +
> + classifiers =3D [
> +     "Development Status :: 4 - Beta",
> +-    "License :: OSI Approved :: Apache Software License",
> +     "Programming Language :: Python :: 3",
> + ]
> +
> diff --git
> a/meta-python/recipes-extended/python3-iam-rolesanywhere-session/
> python3-iam-rolesanywhere-session_2.3.0.bb
> b/meta-python/recipes-extended/python3-iam-rolesanywhere-session/
> python3-iam-rolesanywhere-session_2.3.0.bb
> new file mode 100644
> index 0000000000..c27c9b4ec8
> --- /dev/null
> +++ b/meta-python/recipes-extended/python3-iam-rolesanywhere-session/
> python3-iam-rolesanywhere-session_2.3.0.bb
> @@ -0,0 +1,12 @@
> +SUMMARY =3D "Boto3 session creator for IAM Roles Anywhere"
> +LICENSE =3D "Apache-2.0"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D34400b68072d710fecd0a2940a0d1=
658"
> +
> +DEPENDS =3D "python3-setuptools-scm-native"
> +SRC_URI +=3D "file://0001-fix-remove-license-classifier.patch"
> +SRC_URI[sha256sum] =3D
> "718a7cb43c191f2801467a53405b829ce878ac58b3cb8868caa5782ecc3f20e5"
> +
> +inherit pypi python_setuptools_build_meta
> +
> +PYPI_PACKAGE =3D "iam_rolesanywhere_session"
> +RDEPENDS:${PN} =3D "python3-boto3 python3-botocore python3-cryptography"
> --
> 2.52.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#123876):
> https://lists.openembedded.org/g/openembedded-devel/message/123876
> Mute This Topic: https://lists.openembedded.org/mt/117466999/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000276b7e0649582957
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This results in some dependencies which are not in the lay=
er or its recommended dependent layers. see<div><br></div><div><a href=3D"h=
ttps://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1271">htt=
ps://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1271</a></d=
iv></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"l=
tr" class=3D"gmail_attr">On Mon, Jan 26, 2026 at 4:25=E2=80=AFAM Frederik B=
r=C3=A6ndstrup via <a href=3D"http://lists.openembedded.org">lists.openembe=
dded.org</a> &lt;frederikbraendstrup=3D<a href=3D"mailto:gmail.com@lists.op=
enembedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">Signed-off-by: Frede Hoey B=
raendstrup &lt;<a href=3D"mailto:frederikbraendstrup@gmail.com" target=3D"_=
blank">frederikbraendstrup@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../0001-fix-remove-license-classifier.patch=C2=A0 | 23 +++++++++++++=
++++++<br>
=C2=A0...<a href=3D"http://python3-iam-rolesanywhere-session_2.3.0.bb" rel=
=3D"noreferrer" target=3D"_blank">python3-iam-rolesanywhere-session_2.3.0.b=
b</a> | 12 ++++++++++<br>
=C2=A02 files changed, 35 insertions(+)<br>
=C2=A0create mode 100644 meta-python/recipes-extended/python3-iam-rolesanyw=
here-session/python3-iam-rolesanywhere-session/0001-fix-remove-license-clas=
sifier.patch<br>
=C2=A0create mode 100644 meta-python/recipes-extended/python3-iam-rolesanyw=
here-session/<a href=3D"http://python3-iam-rolesanywhere-session_2.3.0.bb" =
rel=3D"noreferrer" target=3D"_blank">python3-iam-rolesanywhere-session_2.3.=
0.bb</a><br>
<br>
diff --git a/meta-python/recipes-extended/python3-iam-rolesanywhere-session=
/python3-iam-rolesanywhere-session/0001-fix-remove-license-classifier.patch=
 b/meta-python/recipes-extended/python3-iam-rolesanywhere-session/python3-i=
am-rolesanywhere-session/0001-fix-remove-license-classifier.patch<br>
new file mode 100644<br>
index 0000000000..8c61650963<br>
--- /dev/null<br>
+++ b/meta-python/recipes-extended/python3-iam-rolesanywhere-session/python=
3-iam-rolesanywhere-session/0001-fix-remove-license-classifier.patch<br>
@@ -0,0 +1,23 @@<br>
+From bee363b93f0ddd305b71e1fa1d3dca6ea44c8f80 Mon Sep 17 00:00:00 2001<br>
+From: Frede Braendstrup &lt;<a href=3D"mailto:frederikbraendstrup@gmail.co=
m" target=3D"_blank">frederikbraendstrup@gmail.com</a>&gt;<br>
+Date: Fri, 17 Oct 2025 15:55:07 +0200<br>
+Subject: [PATCH] fix: remove license classifier<br>
+<br>
+Upstream-Status: Submitted <a href=3D"https://github.com/awslabs/iam-roles=
-anywhere-session/pull/22+Signed-off-by" rel=3D"noreferrer" target=3D"_blan=
k">https://github.com/awslabs/iam-roles-anywhere-session/pull/22<br>
+Signed-off-by</a>: Frede Braendstrup &lt;<a href=3D"mailto:frederikbraends=
trup@gmail.com" target=3D"_blank">frederikbraendstrup@gmail.com</a>&gt;<br>
+---<br>
+ pyproject.toml=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
1 -<br>
+ 1 files changed, 0 insertions(+), 1 deletions(-)<br>
+<br>
+diff --git a/pyproject.toml b/pyproject.toml<br>
+index c001045..cd83a8f 100644<br>
+--- a/pyproject.toml<br>
++++ b/pyproject.toml<br>
+@@ -20,7 +20,6 @@ requires-python =3D &quot;&gt;=3D3.8&quot;<br>
+ <br>
+ classifiers =3D [<br>
+=C2=A0 =C2=A0 =C2=A0&quot;Development Status :: 4 - Beta&quot;,<br>
+-=C2=A0 =C2=A0 &quot;License :: OSI Approved :: Apache Software License&qu=
ot;,<br>
+=C2=A0 =C2=A0 =C2=A0&quot;Programming Language :: Python :: 3&quot;,<br>
+ ]<br>
+ <br>
diff --git a/meta-python/recipes-extended/python3-iam-rolesanywhere-session=
/<a href=3D"http://python3-iam-rolesanywhere-session_2.3.0.bb" rel=3D"noref=
errer" target=3D"_blank">python3-iam-rolesanywhere-session_2.3.0.bb</a> b/m=
eta-python/recipes-extended/python3-iam-rolesanywhere-session/<a href=3D"ht=
tp://python3-iam-rolesanywhere-session_2.3.0.bb" rel=3D"noreferrer" target=
=3D"_blank">python3-iam-rolesanywhere-session_2.3.0.bb</a><br>
new file mode 100644<br>
index 0000000000..c27c9b4ec8<br>
--- /dev/null<br>
+++ b/meta-python/recipes-extended/python3-iam-rolesanywhere-session/<a hre=
f=3D"http://python3-iam-rolesanywhere-session_2.3.0.bb" rel=3D"noreferrer" =
target=3D"_blank">python3-iam-rolesanywhere-session_2.3.0.bb</a><br>
@@ -0,0 +1,12 @@<br>
+SUMMARY =3D &quot;Boto3 session creator for IAM Roles Anywhere&quot;<br>
+LICENSE =3D &quot;Apache-2.0&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D34400b68072d710fecd0a2940a=
0d1658&quot;<br>
+<br>
+DEPENDS =3D &quot;python3-setuptools-scm-native&quot;<br>
+SRC_URI +=3D &quot;file://0001-fix-remove-license-classifier.patch&quot;<b=
r>
+SRC_URI[sha256sum] =3D &quot;718a7cb43c191f2801467a53405b829ce878ac58b3cb8=
868caa5782ecc3f20e5&quot;<br>
+<br>
+inherit pypi python_setuptools_build_meta<br>
+<br>
+PYPI_PACKAGE =3D &quot;iam_rolesanywhere_session&quot;<br>
+RDEPENDS:${PN} =3D &quot;python3-boto3 python3-botocore python3-cryptograp=
hy&quot;<br>
-- <br>
2.52.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#123876): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/123876" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/123876</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117466999/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117466999/1997914</a><br>
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

--000000000000276b7e0649582957--

