Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web10.3286.1591070050933237181
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jun 2020 20:54:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MBEI1Uoe;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id e16so9632906qtg.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Jun 2020 20:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xEttjPEBmah8dPw8qA96QV6D09WX1+fsCorYcGvUqMA=;
        b=MBEI1UoeqDX8nCFCdzcPmkjXant3pKREU4N+//Hsu1zUIKDVJvZqtCR7qZ/nq07Zna
         XgBQGjJP6l6yJ9su3w0Vd9azawQXvYzDYZwLaWM52PMsDtA26pdLiztQXmY6J8uGHCfQ
         Y/zE7pZSe10FnFB9lQQt3dcBhSVfBGIpuukTA7ynRcvqxSgy/UK65sXQYE3f8dClDvba
         9iheEV5WJOQncNDMfwNgODxRlmUvzUox0WLRUw6YoIMuqqXe/SsVYrGzL/4szEZkMtUJ
         Xo3lsJzHL+Eh+VvhD4uWDUmFOEshOR/cn3KKWVMryHd8saczGqN/OJCgdxZvcyfh/urm
         6smg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xEttjPEBmah8dPw8qA96QV6D09WX1+fsCorYcGvUqMA=;
        b=caPyXS08mCA+xSjSzR0shV9bpLfsXe8jNud6UEv8AcCF1UgNGD60RGwYA5es1XR0T2
         6t3lrccWyNsRJPxf3Mv8+3vRqSpDWnTZ6J4di52BMh/21pu+NlL+KrxloKGZ4f6ai4jn
         6kqssTu0jU24Y5G8qvFCwcf6mLZbaD0G8PCkd4jacK5Qc8sfK4vi0v+w31n5XHJqSw1w
         4LRp1sjNDejANQIXSbwqJxOh7+YCWKwaiL9a7qtnpP0trt5TXqFqASddQejkz8cK84VA
         npYh8GKUCUBcLpYwplt5gxuLfFEd7Cx9taXTtvW706DKgOPGoP3GOE0vGItMKx2o9Lrr
         tf8A==
X-Gm-Message-State: AOAM532NBD7jIhtT1cnK6WrG9ZNSYxyEC9BD5dxhLu3vkcwNSZFdDpQK
	8r3hMmJ+l/c1Fu3Wx+QGjd8lJG60Y+KSYIcjX1/a4+Ov
X-Google-Smtp-Source: ABdhPJyS0ACERnBCwVN+8jX57wYvLD4jz3Gndihk3peM+5sTBfLfv215IQBooF5j0XFtk9psMWULACnRVyP3GF0iKOw=
X-Received: by 2002:ac8:44b3:: with SMTP id a19mr25128861qto.285.1591070049960;
 Mon, 01 Jun 2020 20:54:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200601135308.18379-1-leon.anavi@konsulko.com>
In-Reply-To: <20200601135308.18379-1-leon.anavi@konsulko.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 1 Jun 2020 20:53:59 -0700
Message-ID: <CAMKF1so7X3xT-WXhrAhVC0Ex4sY3QCpxtKa9LhhDNGemvzxeDg@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-humanize: Upgrade 0.5.1 -> 2.4.0
To: Leon Anavi <leon.anavi@konsulko.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000002407c205a711dd27"

--0000000000002407c205a711dd27
Content-Type: text/plain; charset="UTF-8"

Did the license checksum
Change ? If so perhaps document it in commit

On Mon, Jun 1, 2020 at 6:53 AM Leon Anavi <leon.anavi@konsulko.com> wrote:

> Upgrade to release 2.4.0 and consolidate into a single file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  .../python/python-humanize.inc                | 14 -------------
>  .../python/python3-humanize_0.5.1.bb          |  2 --
>  .../python/python3-humanize_2.4.0.bb          | 20 +++++++++++++++++++
>  3 files changed, 20 insertions(+), 16 deletions(-)
>  delete mode 100644 meta-python/recipes-devtools/python/python-humanize.inc
>  delete mode 100644 meta-python/recipes-devtools/python/
> python3-humanize_0.5.1.bb
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-humanize_2.4.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/python-humanize.inc
> b/meta-python/recipes-devtools/python/python-humanize.inc
> deleted file mode 100644
> index 17a3449e7..000000000
> --- a/meta-python/recipes-devtools/python/python-humanize.inc
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -SUMMARY = "Python humanize utilities"
> -HOMEPAGE = "http://github.com/jmoiron/humanize"
> -
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENCE;md5=d2eff82fc25dd07c919a02465884f02e"
> -
> -SRC_URI[md5sum] = "e8473d9dc1b220911cac2edd53b1d973"
> -SRC_URI[sha256sum] =
> "a43f57115831ac7c70de098e6ac46ac13be00d69abbf60bdcac251344785bb19"
> -
> -RDEPENDS_${PN} += "\
> -    ${PYTHON_PN}-datetime \
> -"
> -
> -BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-python/recipes-devtools/python/python3-humanize_0.5.1.bb
> b/meta-python/recipes-devtools/python/python3-humanize_0.5.1.bb
> deleted file mode 100644
> index 04464ac59..000000000
> --- a/meta-python/recipes-devtools/python/python3-humanize_0.5.1.bb
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -inherit pypi setuptools3
> -require python-humanize.inc
> diff --git a/meta-python/recipes-devtools/python/python3-humanize_2.4.0.bb
> b/meta-python/recipes-devtools/python/python3-humanize_2.4.0.bb
> new file mode 100644
> index 000000000..6bb6946ff
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-humanize_2.4.0.bb
> @@ -0,0 +1,20 @@
> +SUMMARY = "Python humanize utilities"
> +HOMEPAGE = "http://github.com/jmoiron/humanize"
> +
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENCE;md5=4ecc42519e84f6f3e23529464df7bd1d"
> +
> +SRC_URI[md5sum] = "010e86a4196ed6030112e7bc681e7353"
> +SRC_URI[sha256sum] =
> "42ae7d54b398c01bd100847f6cb0fc9e381c21be8ad3f8e2929135e48dbff026"
> +
> +inherit pypi setuptools3
> +
> +DEPENDS += "\
> +    ${PYTHON_PN}-setuptools-scm-native \
> +"
> +
> +RDEPENDS_${PN} += "\
> +    ${PYTHON_PN}-datetime \
> +"
> +
> +BBCLASSEXTEND = "native nativesdk"
> --
> 2.17.1
>
> 
>

--0000000000002407c205a711dd27
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">Did the license checksum</div></div><div dir=3D"auto=
">Change ? If so perhaps document it in commit=C2=A0</div><div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 1, 202=
0 at 6:53 AM Leon Anavi &lt;<a href=3D"mailto:leon.anavi@konsulko.com">leon=
.anavi@konsulko.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
Upgrade to release 2.4.0 and consolidate into a single file.<br>
<br>
Signed-off-by: Leon Anavi &lt;<a href=3D"mailto:leon.anavi@konsulko.com" t=
arget=3D"_blank">leon.anavi@konsulko.com</a>&gt;<br>
---<br>
=C2=A0.../python/python-humanize.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 | 14 -------------<br>
=C2=A0.../python/<a href=3D"http://python3-humanize_0.5.1.bb" rel=3D"noref=
errer" target=3D"_blank">python3-humanize_0.5.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 |=C2=A0 2 --<br>
=C2=A0.../python/<a href=3D"http://python3-humanize_2.4.0.bb" rel=3D"noref=
errer" target=3D"_blank">python3-humanize_2.4.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 | 20 +++++++++++++++++++<br>
=C2=A03 files changed, 20 insertions(+), 16 deletions(-)<br>
=C2=A0delete mode 100644 meta-python/recipes-devtools/python/python-humani=
ze.inc<br>
=C2=A0delete mode 100644 meta-python/recipes-devtools/python/<a href=3D"ht=
tp://python3-humanize_0.5.1.bb" rel=3D"noreferrer" target=3D"_blank">python=
3-humanize_0.5.1.bb</a><br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/<a href=3D"ht=
tp://python3-humanize_2.4.0.bb" rel=3D"noreferrer" target=3D"_blank">python=
3-humanize_2.4.0.bb</a><br>
<br>
diff --git a/meta-python/recipes-devtools/python/python-humanize.inc b/met=
a-python/recipes-devtools/python/python-humanize.inc<br>
deleted file mode 100644<br>
index 17a3449e7..000000000<br>
--- a/meta-python/recipes-devtools/python/python-humanize.inc<br>
+++ /dev/null<br>
@@ -1,14 +0,0 @@<br>
-SUMMARY =3D &quot;Python humanize utilities&quot;<br>
-HOMEPAGE =3D &quot;<a href=3D"http://github.com/jmoiron/humanize" rel=3D"=
noreferrer" target=3D"_blank">http://github.com/jmoiron/humanize</a>&quot;<=
br>
-<br>
-LICENSE =3D &quot;MIT&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENCE;md5=3Dd2eff82fc25dd07c919a02465=
884f02e&quot;<br>
-<br>
-SRC_URI[md5sum] =3D &quot;e8473d9dc1b220911cac2edd53b1d973&quot;<br>
-SRC_URI[sha256sum] =3D &quot;a43f57115831ac7c70de098e6ac46ac13be00d69abbf=
60bdcac251344785bb19&quot;<br>
-<br>
-RDEPENDS_${PN} +=3D &quot;\<br>
-=C2=A0 =C2=A0 ${PYTHON_PN}-datetime \<br>
-&quot;<br>
-<br>
-BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3=
-humanize_0.5.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-humanize_0=
.5.1.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3=
-humanize_0.5.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-humanize_0=
.5.1.bb</a><br>
deleted file mode 100644<br>
index 04464ac59..000000000<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-humani=
ze_0.5.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-humanize_0.5.1.bb=
</a><br>
+++ /dev/null<br>
@@ -1,2 +0,0 @@<br>
-inherit pypi setuptools3<br>
-require python-humanize.inc<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3=
-humanize_2.4.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-humanize_2=
.4.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3=
-humanize_2.4.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-humanize_2=
.4.0.bb</a><br>
new file mode 100644<br>
index 000000000..6bb6946ff<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-humani=
ze_2.4.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-humanize_2.4.0.bb=
</a><br>
@@ -0,0 +1,20 @@<br>
+SUMMARY =3D &quot;Python humanize utilities&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"http://github.com/jmoiron/humanize" rel=3D"=
noreferrer" target=3D"_blank">http://github.com/jmoiron/humanize</a>&quot;<=
br>
+<br>
+LICENSE =3D &quot;MIT&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENCE;md5=3D4ecc42519e84f6f3e23529464=
df7bd1d&quot;<br>
+<br>
+SRC_URI[md5sum] =3D &quot;010e86a4196ed6030112e7bc681e7353&quot;<br>
+SRC_URI[sha256sum] =3D &quot;42ae7d54b398c01bd100847f6cb0fc9e381c21be8ad3=
f8e2929135e48dbff026&quot;<br>
+<br>
+inherit pypi setuptools3<br>
+<br>
+DEPENDS +=3D &quot;\<br>
+=C2=A0 =C2=A0 ${PYTHON_PN}-setuptools-scm-native \<br>
+&quot;<br>
+<br>
+RDEPENDS_${PN} +=3D &quot;\<br>
+=C2=A0 =C2=A0 ${PYTHON_PN}-datetime \<br>
+&quot;<br>
+<br>
+BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
-- <br>
2.17.1<br>
<br>
<br>
</blockquote></div></div>

--0000000000002407c205a711dd27--
