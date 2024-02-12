Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1801C48297
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 15:14:39 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web10.8701.1707750876156602653
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Feb 2024 07:14:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D43NaCdM;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-604b23d91afso35884457b3.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Feb 2024 07:14:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707750875; x=1708355675; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=i+VX3V866z9T6RtVWL3z259E7Wwj99LX0tD04hUkeD0=;
        b=D43NaCdMMvw0ojW0lD5ITePl/A7fP44XeMAaCQnEke96BnrQghT3r7a23lxX/R3reK
         GEswc4K8axpojbDbUXkGnQRaKUeG+Ll5xsJeP066zNOMWJNwVLMPdm9Jk8i2PQ1jPaL5
         bpMTBeWa47hYJO7cJqnjRysrafkHIJGoCKbtOkXOZZveNbWpIbUyDJCwdIM6rDVAXYUe
         Rpy/UQU/otJ7JWap6AxEQVkQZ5Je5IXJYajUljSkzxdZZOxabmmQxbRJh9/ckNrCz6Vf
         v6eUGUg/Ru/M4Hm+cfRMOYfMpGFBSw2HuT2xhcHx8tCkqSLrY0gzoV8kxLip4Mw1u7k5
         O2Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707750875; x=1708355675;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i+VX3V866z9T6RtVWL3z259E7Wwj99LX0tD04hUkeD0=;
        b=wBVYQcDiBNXJhs8FuRQ4acnFwq7iX54uwYx0y/aGDYvKH0gT1WU+ae8YhWn3yo/Eyz
         b7E+jjY0HJEtP3p3lfRo+kh0AmWAAsLjPogvvvM+8wq/q2iLe6g6pggmDa6nDXH8GcoI
         ojCJN1Pf2OgnATo36tUvpUiIPkycaydDC+psvzvvu9GaQMblBqrIE25wNJ6Stdnd7TR8
         N0Igh4dZrmAloMe1Wdod6CYRKBwZ1Hq1d+kfyK4Y3Y/nQPP+Oxp6tS1Xztawabc5XR+F
         Ha3aWTDxdaTv5cWavlBj+awyKCmpUiqgJez6DYhAKX642tks50j4Iy21nG7V8IkAxxk0
         +YBA==
X-Gm-Message-State: AOJu0YzMljur7DfJzEJCBk9DorCdlyQjgrXF0H+Dwt3JwSSoKPZhKssO
	u6N0mVp+oONMU2fnNZsRhKAeCNFgEhm0f2LhBYhRzeeMPTB48izpBYoFjkvqkXSOShy7GImHhtd
	JvyzYDaRkx/cPsLzGLQRef5N3isE=
X-Google-Smtp-Source: AGHT+IHoo0w2YO3Ws1/z2geMrZiq8MNdVKJZqviEv6Howo0E5Vo5LqeiY13crG6x7gJhrhw+zpgbhIVSvt31FtdYb2E=
X-Received: by 2002:a81:4951:0:b0:607:782e:fe12 with SMTP id
 w78-20020a814951000000b00607782efe12mr703459ywa.34.1707750874877; Mon, 12 Feb
 2024 07:14:34 -0800 (PST)
MIME-Version: 1.0
References: <20240212104855.29980-1-fathi.boudra@linaro.org>
In-Reply-To: <20240212104855.29980-1-fathi.boudra@linaro.org>
From: Tim Orling <ticotimo@gmail.com>
Date: Mon, 12 Feb 2024 07:14:24 -0800
Message-ID: <CANx9H-BmFtth_m5DHpGEsncjxMayzMuWi9NYX-d42Ohd7X845g@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] whitenoise: add a new recipe
To: Fathi Boudra <fathi.boudra@linaro.org>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000431239061130bcc3"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Feb 2024 15:14:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108711

--000000000000431239061130bcc3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 12, 2024 at 2:49=E2=80=AFAM Fathi Boudra <fathi.boudra@linaro.o=
rg>
wrote:

> Radically simplified static file serving for Python web apps
>
> With a couple of lines of config WhiteNoise allows your web app
> to serve its own static files, making it a self-contained unit
> that can be deployed anywhere without relying on nginx, Amazon S3
> or any other external service.
>
> https://whitenoise.readthedocs.io/en/latest/
>
> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
> ---
>  .../0001-add-setup.py.patch                   | 25 +++++++++++++++++++
>  .../python/python3-whitenoise_6.6.0.bb        | 21 ++++++++++++++++
>  2 files changed, 46 insertions(+)
>  create mode 100644
> meta-python/recipes-devtools/python/python3-whitenoise/0001-add-setup.py.=
patch
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-whitenoise_6.6.0.bb
>
> diff --git
> a/meta-python/recipes-devtools/python/python3-whitenoise/0001-add-setup.p=
y.patch
> b/meta-python/recipes-devtools/python/python3-whitenoise/0001-add-setup.p=
y.patch


Rather than carry a patch to add deprecated setup.py,
you can inherit python_setuptools_build_meta according to
https://github.com/evansd/whitenoise/blob/dbfd5f262f3390bd2304113a1b4eefa52=
1056ef4/pyproject.toml#L2

>
> new file mode 100644
> index 0000000000..48a861496e
> --- /dev/null
> +++
> b/meta-python/recipes-devtools/python/python3-whitenoise/0001-add-setup.p=
y.patch
> @@ -0,0 +1,25 @@
> +From ded40864cd0d74e0881040ed580917128a83f40f Mon Sep 17 00:00:00 2001
> +From: Sahaj Sarup <sahaj.sarup@linaro.org>
> +Date: Thu, 16 Mar 2023 05:20:49 +0530
> +Subject: [PATCH] add setup.py
> +
> +Signed-off-by: Sahaj Sarup <sahaj.sarup@linaro.org>
> +
> +Upstream-Status: Pending
> +---
> + setup.py | 3 +++
> + 1 file changed, 3 insertions(+)
> + create mode 100644 setup.py
> +
> +diff --git a/setup.py b/setup.py
> +new file mode 100644
> +index 0000000..f13cf21
> +--- /dev/null
> ++++ b/setup.py
> +@@ -0,0 +1,3 @@
> ++from setuptools import setup
> ++if __name__ =3D=3D '__main__':
> ++    setup()
> +--
> +2.43.0
> +
> diff --git a/meta-python/recipes-devtools/python/
> python3-whitenoise_6.6.0.bb b/meta-python/recipes-devtools/python/
> python3-whitenoise_6.6.0.bb
> new file mode 100644
> index 0000000000..4948977448
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-whitenoise_6.6.0.bb
> @@ -0,0 +1,21 @@
> +SUMMARY =3D "Radically simplified static file serving for WSGI applicati=
ons"
> +AUTHOR =3D "David Evans <d@evans.io>"
> +HOMEPAGE =3D "https://whitenoise.evans.io"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Daba4901cc64e401cea5a267eac2a2=
e1e"
> +
> +PYPI_PACKAGE =3D "whitenoise"
> +
> +SRC_URI +=3D "file://0001-add-setup.py.patch"
> +
> +SRC_URI[sha256sum] =3D
> "8998f7370973447fac1e8ef6e8ded2c5209a7b1f67c1012866dbcd09681c3251"
> +
> +inherit pypi setuptools3
> +
> +RDEPENDS:${PN}:append =3D " \
> +    python3-brotli \
> +    python3-coverage \
> +    python3-django \
> +    python3-pytest \
> +    python3-requests \
> +"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108706):
> https://lists.openembedded.org/g/openembedded-devel/message/108706
> Mute This Topic: https://lists.openembedded.org/mt/104309104/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000431239061130bcc3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Feb 12, 2024 at 2:49=E2=80=AFAM Fathi Boudra &lt;<a=
 href=3D"mailto:fathi.boudra@linaro.org">fathi.boudra@linaro.org</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;borde=
r-left-color:rgb(204,204,204)">Radically simplified static file serving for=
 Python web apps<br>
<br>
With a couple of lines of config WhiteNoise allows your web app<br>
to serve its own static files, making it a self-contained unit<br>
that can be deployed anywhere without relying on nginx, Amazon S3<br>
or any other external service.<br>
<br>
<a href=3D"https://whitenoise.readthedocs.io/en/latest/" rel=3D"noreferrer"=
 target=3D"_blank">https://whitenoise.readthedocs.io/en/latest/</a><br>
<br>
Signed-off-by: Fathi Boudra &lt;<a href=3D"mailto:fathi.boudra@linaro.org" =
target=3D"_blank">fathi.boudra@linaro.org</a>&gt;<br>
---<br>
=C2=A0.../0001-add-setup.py.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 25 +++++++++++++++++++<br>
=C2=A0.../python/<a href=3D"http://python3-whitenoise_6.6.0.bb" rel=3D"nore=
ferrer" target=3D"_blank">python3-whitenoise_6.6.0.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 21 ++++++++++++++++<br>
=C2=A02 files changed, 46 insertions(+)<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-whiten=
oise/0001-add-setup.py.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-whitenoise_6.6.0.bb" rel=3D"noreferrer" target=3D"_blank">pytho=
n3-whitenoise_6.6.0.bb</a><br>
<br>
diff --git a/meta-python/recipes-devtools/python/python3-whitenoise/0001-ad=
d-setup.py.patch b/meta-python/recipes-devtools/python/python3-whitenoise/0=
001-add-setup.py.patch</blockquote><div dir=3D"auto"><br></div><div dir=3D"=
auto">Rather than carry a patch to add deprecated setup.py,</div><div dir=
=3D"auto">you can inherit python_setuptools_build_meta according to=C2=A0<d=
iv><a href=3D"https://github.com/evansd/whitenoise/blob/dbfd5f262f3390bd230=
4113a1b4eefa521056ef4/pyproject.toml#L2">https://github.com/evansd/whitenoi=
se/blob/dbfd5f262f3390bd2304113a1b4eefa521056ef4/pyproject.toml#L2</a></div=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-=
color:rgb(204,204,204)" dir=3D"auto"><br>
new file mode 100644<br>
index 0000000000..48a861496e<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/python3-whitenoise/0001-add-setup=
.py.patch<br>
@@ -0,0 +1,25 @@<br>
+From ded40864cd0d74e0881040ed580917128a83f40f Mon Sep 17 00:00:00 2001<br>
+From: Sahaj Sarup &lt;<a href=3D"mailto:sahaj.sarup@linaro.org" target=3D"=
_blank">sahaj.sarup@linaro.org</a>&gt;<br>
+Date: Thu, 16 Mar 2023 05:20:49 +0530<br>
+Subject: [PATCH] add setup.py<br>
+<br>
+Signed-off-by: Sahaj Sarup &lt;<a href=3D"mailto:sahaj.sarup@linaro.org" t=
arget=3D"_blank">sahaj.sarup@linaro.org</a>&gt;<br>
+<br>
+Upstream-Status: Pending<br>
+---<br>
+ setup.py | 3 +++<br>
+ 1 file changed, 3 insertions(+)<br>
+ create mode 100644 setup.py<br>
+<br>
+diff --git a/setup.py b/setup.py<br>
+new file mode 100644<br>
+index 0000000..f13cf21<br>
+--- /dev/null<br>
++++ b/setup.py<br>
+@@ -0,0 +1,3 @@<br>
++from setuptools import setup<br>
++if __name__ =3D=3D &#39;__main__&#39;:<br>
++=C2=A0 =C2=A0 setup()<br>
+-- <br>
+2.43.0<br>
+<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
whitenoise_6.6.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-whitenois=
e_6.6.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://pyth=
on3-whitenoise_6.6.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-white=
noise_6.6.0.bb</a><br>
new file mode 100644<br>
index 0000000000..4948977448<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-whiteno=
ise_6.6.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-whitenoise_6.6.0=
.bb</a><br>
@@ -0,0 +1,21 @@<br>
+SUMMARY =3D &quot;Radically simplified static file serving for WSGI applic=
ations&quot;<br>
+AUTHOR =3D &quot;David Evans &lt;<a href=3D"mailto:d@evans.io" target=3D"_=
blank">d@evans.io</a>&gt;&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://whitenoise.evans.io" rel=3D"noreferr=
er" target=3D"_blank">https://whitenoise.evans.io</a>&quot;<br>
+LICENSE =3D &quot;MIT&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Daba4901cc64e401cea5a267eac=
2a2e1e&quot;<br>
+<br>
+PYPI_PACKAGE =3D &quot;whitenoise&quot;<br>
+<br>
+SRC_URI +=3D &quot;file://0001-add-setup.py.patch&quot;<br>
+<br>
+SRC_URI[sha256sum] =3D &quot;8998f7370973447fac1e8ef6e8ded2c5209a7b1f67c10=
12866dbcd09681c3251&quot;<br>
+<br>
+inherit pypi setuptools3<br>
+<br>
+RDEPENDS:${PN}:append =3D &quot; \<br>
+=C2=A0 =C2=A0 python3-brotli \<br>
+=C2=A0 =C2=A0 python3-coverage \<br>
+=C2=A0 =C2=A0 python3-django \<br>
+=C2=A0 =C2=A0 python3-pytest \<br>
+=C2=A0 =C2=A0 python3-requests \<br>
+&quot;<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#108706): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/108706" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/108706</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/104309104/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/104309104/924729</a><br>
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

--000000000000431239061130bcc3--

