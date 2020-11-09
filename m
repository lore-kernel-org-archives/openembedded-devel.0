Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web12.16204.1604947659572964395
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Nov 2020 10:47:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Dg4JHtFD;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id za3so13783164ejb.5
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Nov 2020 10:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1T+V05hVPnu6Te9A41LIBYbFcypbHORV1shBLrPGXSQ=;
        b=Dg4JHtFDfvcp9uuLGc5hbpdla8BfgcsNrK96GXcBE4O5D6GA51vNocr73nrZ94hx8v
         tjKcV841BTss7mBQaFcSfOcdl8Zj7qQDs7tEGWirIjYfN0Pz5eGIBD3n3l5eaOB0nd+j
         BmivzZobdV1Q4Fkjv4AKXD1i7MJNO1ILbKEWTnX+r80zgkmQKSFXYWbLRqLxqzzi7WA1
         xgVaRLsHbzJUBeTTYiK2mU1sqTETVhzdxF6d487HqqEVCzvNT4cBjbaEx8Vkzct7ZCdR
         C6YgdeHJCbNJBR/j4y8t3q4spHjTYgaEfrcoUVO7wJtni6Ld+AKLIi9GItMYBUH96sFu
         nbMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1T+V05hVPnu6Te9A41LIBYbFcypbHORV1shBLrPGXSQ=;
        b=ExrjC9bMjXPAsE41n7kvkWbgwg1eC55q0PP9+JMPJKfC5Bb/cwW9ZWbbWtDeGN8FT5
         LXjMLJHb03ng+hm0JHJfBgumS4m7OSfQYi1CwSO00wXVXw+ZVcGNyae5g8RUDiRkJxI2
         Uvo6fEFS86cTQoNWSrxBciByBEoK6pr4qO3SHJybwQq1Tn8fIj4u633jwH4e63yRhbn7
         lYfjvTyIaP7z6/laQwQyLTyD/hXQ2ZbyY5ImdZ5ZdXLf1U7lrwW1LkdXxpUIkmKxxNtL
         f6aAFndrSEXygRhBE4wbORGlJ9ErOQjtO6ERLHhySnVDTs+tbbUpyjZO39xNMWvfKfSx
         sJOw==
X-Gm-Message-State: AOAM532Ycmy9jiRYdU23eAa4Vdg0FpP+AqzNkCvRomtcATLMp6mumf3J
	xE8JkpOH175o8t6bvnMyfwumRu5mqkD2A91+MwA=
X-Google-Smtp-Source: ABdhPJySSAf+j5yKTJ+eL/RVxrK1YAEr+KGVfiXYyBbjeEAUgrZUDlYRdS4xiek2Rlh9IX68qtdQWsfqMLYaFBqjvfk=
X-Received: by 2002:a17:906:e2c3:: with SMTP id gr3mr15982481ejb.471.1604947657972;
 Mon, 09 Nov 2020 10:47:37 -0800 (PST)
MIME-Version: 1.0
References: <20201109183156.25407-1-greg@gpanders.com>
In-Reply-To: <20201109183156.25407-1-greg@gpanders.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Mon, 9 Nov 2020 19:47:27 +0100
Message-ID: <CA+chaQfGFAdz4agYj6z4m+tGQofyBbiUBRL3ZJnzsm5HFLtHVg@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH v2] Add python3-cvxopt
To: Gregory Anders <greg@gpanders.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000095e6505b3b0ff3d"

--000000000000095e6505b3b0ff3d
Content-Type: text/plain; charset="UTF-8"

> SRCREV = "1.2.5"

Use the actual git SHA not the tag name.

On Mon, Nov 9, 2020 at 7:32 PM Gregory Anders <greg@gpanders.com> wrote:

> ---
> Added python3-cvxopt to meta-python packagegroup
>
>  .../packagegroups/packagegroup-meta-python.bb |  1 +
>  .../python/python3-cvxopt_1.2.5.bb            | 20 +++++++++++++++++++
>  2 files changed, 21 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-cvxopt_1.2.5.bb
>
> diff --git a/meta-python/recipes-core/packagegroups/
> packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/
> packagegroup-meta-python.bb
> index 6a3061986..0120fb873 100644
> --- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> +++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> @@ -425,6 +425,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
>      python3-pycurl \
>      gyp \
>      python3-jsonref \
> +    python3-cvxopt \
>  "
>
>  RDEPENDS_packagegroup-meta-python3-extended = "\
> diff --git a/meta-python/recipes-devtools/python/python3-cvxopt_1.2.5.bb
> b/meta-python/recipes-devtools/python/python3-cvxopt_1.2.5.bb
> new file mode 100644
> index 000000000..7d01b22a1
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-cvxopt_1.2.5.bb
> @@ -0,0 +1,20 @@
> +SUMMARY = "Convex optimization package"
> +HOMEPAGE = "http://cvxopt.org"
> +LICENSE = "GPL-3.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=4905701d14049b3f8e4774c290aeee21"
> +
> +SRC_URI = "git://github.com/cvxopt/cvxopt;protocol=https"
> +
> +SRCREV = "1.2.5"
> +PV = "${SRCREV}"
> +
> +S = "${WORKDIR}/git"
> +
> +RDEPENDS_${PN} += "lapack suitesparse"
> +DEPENDS += "lapack suitesparse"
> +
> +inherit setuptools3
> +
> +export CVXOPT_BLAS_LIB_DIR = "${STAGING_LIBDIR}"
> +export CVXOPT_SUITESPARSE_LIB_DIR = "${STAGING_LIBDIR}"
> +export CVXOPT_SUITESPARSE_INC_DIR = "${STAGING_INCDIR}"
> --
> 2.29.2
>
>
> 
>
>

--000000000000095e6505b3b0ff3d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&gt; SRCREV =3D &quot;1.2.5&quot;<div><br></div><div>Use t=
he actual git SHA not the tag name.</div></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 9, 2020 at 7:32 PM Gre=
gory Anders &lt;<a href=3D"mailto:greg@gpanders.com">greg@gpanders.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">---<b=
r>
Added python3-cvxopt to meta-python packagegroup<br>
<br>
=C2=A0.../packagegroups/<a href=3D"http://packagegroup-meta-python.bb" rel=
=
=3D"noreferrer" target=3D"_blank">packagegroup-meta-python.bb</a> |=C2=A0 =
1 +<br>
=C2=A0.../python/<a href=3D"http://python3-cvxopt_1.2.5.bb" rel=3D"norefer=
rer" target=3D"_blank">python3-cvxopt_1.2.5.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 20 +++++++++++++++++++<br>
=C2=A02 files changed, 21 insertions(+)<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/<a href=3D"ht=
tp://python3-cvxopt_1.2.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-=
cvxopt_1.2.5.bb</a><br>
<br>
diff --git a/meta-python/recipes-core/packagegroups/<a href=3D"http://pack=
agegroup-meta-python.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-=
meta-python.bb</a> b/meta-python/recipes-core/packagegroups/<a href=3D"http=
://packagegroup-meta-python.bb" rel=3D"noreferrer" target=3D"_blank">packag=
egroup-meta-python.bb</a><br>
index 6a3061986..0120fb873 100644<br>
--- a/meta-python/recipes-core/packagegroups/<a href=3D"http://packagegrou=
p-meta-python.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-meta-py=
thon.bb</a><br>
+++ b/meta-python/recipes-core/packagegroups/<a href=3D"http://packagegrou=
p-meta-python.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-meta-py=
thon.bb</a><br>
@@ -425,6 +425,7 @@ RDEPENDS_packagegroup-meta-python3 =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0python3-pycurl \<br>
=C2=A0 =C2=A0 =C2=A0gyp \<br>
=C2=A0 =C2=A0 =C2=A0python3-jsonref \<br>
+=C2=A0 =C2=A0 python3-cvxopt \<br>
=C2=A0&quot;<br>
<br>
=C2=A0RDEPENDS_packagegroup-meta-python3-extended =3D &quot;\<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3=
-cvxopt_1.2.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-cvxopt_1.2.5=
.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-cvx=
opt_1.2.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-cvxopt_1.2.5.bb<=
/a><br>
new file mode 100644<br>
index 000000000..7d01b22a1<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-cvxopt=
_1.2.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-cvxopt_1.2.5.bb</a>=
<br>
@@ -0,0 +1,20 @@<br>
+SUMMARY =3D &quot;Convex optimization package&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"http://cvxopt.org" rel=3D"noreferrer" targe=
t=3D"_blank">http://cvxopt.org</a>&quot;<br>
+LICENSE =3D &quot;GPL-3.0&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D4905701d14049b3f8e4774c29=
0aeee21&quot;<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/cvxopt/cvxopt;protoc=
ol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github.com/cvxopt/cvxopt;p=
rotocol=3Dhttps</a>&quot;<br>
+<br>
+SRCREV =3D &quot;1.2.5&quot;<br>
+PV =3D &quot;${SRCREV}&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+RDEPENDS_${PN} +=3D &quot;lapack suitesparse&quot;<br>
+DEPENDS +=3D &quot;lapack suitesparse&quot;<br>
+<br>
+inherit setuptools3<br>
+<br>
+export CVXOPT_BLAS_LIB_DIR =3D &quot;${STAGING_LIBDIR}&quot;<br>
+export CVXOPT_SUITESPARSE_LIB_DIR =3D &quot;${STAGING_LIBDIR}&quot;<br>
+export CVXOPT_SUITESPARSE_INC_DIR =3D &quot;${STAGING_INCDIR}&quot;<br>
-- <br>
2.29.2<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000095e6505b3b0ff3d--
