Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
 by mx.groups.io with SMTP id smtpd.web11.1105.1585934923512558178
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Apr 2020 10:28:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jwajfRh8;
 spf=pass (domain: gmail.com, ip: 209.85.166.169, mailfrom: ticotimo@gmail.com)
Received: by mail-il1-f169.google.com with SMTP id n13so8055247ilm.5
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Apr 2020 10:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=A99E48U+IBFELPDaIjxjzqPYzwnDJ2hD10nZI92Qljw=;
        b=jwajfRh86QFmq+ZGeuFRULbVWaU07T9NYngmpj2wjfCLioK+QmvYxO7qc0LMPbmTNy
         HYEF5M+GYIdr+kxCbYyQXsPj2Oj+/H6e+3pVRD2oOF8vc6LfrLcR3wcv96hKBMmxTF/0
         KYUEu942AgbwhMLy4UmG60V8CHaNCDWeftnrlXKlDp7k5FqK1KVlpj5ThY1JcnUjmml8
         ld8FByO6Esqf0MsrzeT+NTLSNazXmDFSSPfchyKmGt4s0FwxJ+owJQpgUbyKVmiKGn6M
         nMlJvh0rxrU7v6j/1VKIaodLXMlSjTyvvXYJ3i+auxKJbwET7l1EMY2Tq6hmrqSY3Ka/
         lIiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A99E48U+IBFELPDaIjxjzqPYzwnDJ2hD10nZI92Qljw=;
        b=OHvVY0Lk75NMEqssaid1Uin92n7AcdUDoBlAeyEqizpp7XQlCVaYEqmwZ4sD5vX3RE
         w/yZuV2cTe+Q39tckYRsm/uidsYigstnFWyeKeyoUoIldyJJRiryW1fJ5wY4WTuAotA+
         u298bxFG6XSdUxUoaQPTKfQZndP5XPBU34XG9ArkACJIWXnOdV3egpsmviklNf+x6dE/
         TStplM/370a3SxB5/tYLEgmnHW4XmyXJL7ykbDt9MMP1F0TUviqm9Ohmr/S/S8NVpPbI
         ZBdy9qorwZ5juO1uijKAp31psikPgUg4RY+1w2gwiNtclDCwpkP4XxqLRcu1OYbnfLii
         y0FA==
X-Gm-Message-State: AGi0PuYyZx1KxhG4oiaqoyWl7SXB+tIyaOAxxBsNJpph2WOSEC4XZZjO
	61YAOjyzpfcqC1wnXcYMP7k+bsBSzoEUIIXAaprfVVzY
X-Google-Smtp-Source: APiQypJLzbPnBSvR0qXKgho58zVnJPm86zrd05Mw5iJZ8dPg1j+6PlX7n24GOHK0yfrTh0TprNNmPM6NZlU1jE2a5t8=
X-Received: by 2002:a92:9fc4:: with SMTP id z65mr10131890ilk.198.1585934922803;
 Fri, 03 Apr 2020 10:28:42 -0700 (PDT)
MIME-Version: 1.0
References: <1585935907-41366-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
In-Reply-To: <1585935907-41366-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: "Tim Orling" <ticotimo@gmail.com>
Date: Fri, 3 Apr 2020 10:28:31 -0700
Message-ID: <CANx9H-A5BPzGv71Y_sirS6ihD1hx18581a+BkKhU0iiri96c_g@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-pint: Enable ptest
To: zhengruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b5ed9a05a2663f83"

--000000000000b5ed9a05a2663f83
Content-Type: text/plain; charset="UTF-8"

Please merge the .inc file into the .bb file.

On Fri, Apr 3, 2020 at 1:45 AM zhengruoqin <zhengrq.fnst@cn.fujitsu.com>
wrote:

> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  .../recipes-devtools/python/python-pint.inc       | 15 ++++++++++++++-
>  .../python/python3-pint/run-ptest                 |  3 +++
>  2 files changed, 17 insertions(+), 1 deletion(-)
>  create mode 100644
> meta-python/recipes-devtools/python/python3-pint/run-ptest
>
> diff --git a/meta-python/recipes-devtools/python/python-pint.inc
> b/meta-python/recipes-devtools/python/python-pint.inc
> index c58dc9076..5c3481008 100644
> --- a/meta-python/recipes-devtools/python/python-pint.inc
> +++ b/meta-python/recipes-devtools/python/python-pint.inc
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =
> "file://LICENSE;md5=bccf824202692270a1e0829a62e3f47b"
>
>  PYPI_PACKAGE := "Pint"
>
> -inherit pypi
> +inherit pypi ptest
>
>  SRC_URI[md5sum] = "3a8f29c2a30efd35af4b5c5a224ef965"
>  SRC_URI[sha256sum] =
> "308f1070500e102f83b6adfca6db53debfce2ffc5d3cbe3f6c367da359b5cf4d"
> @@ -15,3 +15,16 @@ SRC_URI[sha256sum] =
> "308f1070500e102f83b6adfca6db53debfce2ffc5d3cbe3f6c367da359
>  DEPENDS += "python3-setuptools-scm-native"
>
>  BBCLASSEXTEND = "native nativesdk"
> +
> +SRC_URI += " \
> +       file://run-ptest \
> +"
> +
> +RDEPENDS_${PN}-ptest += " \
> +       ${PYTHON_PN}-pytest \
> +"
> +
> +do_install_ptest() {
> +       install -d ${D}${PTEST_PATH}/testsuite
> +       cp -rf ${S}/pint/testsuite/* ${D}${PTEST_PATH}/testsuite/
> +}
> diff --git a/meta-python/recipes-devtools/python/python3-pint/run-ptest
> b/meta-python/recipes-devtools/python/python3-pint/run-ptest
> new file mode 100644
> index 000000000..5cec71169
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pint/run-ptest
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +pytest
> --
> 2.20.1
>
>
>
> 
>

--000000000000b5ed9a05a2663f83
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">Please merge the .inc file into the .bb file.</div><=
/div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Fri, Apr 3, 2020 at 1:45 AM zhengruoqin &lt;<a href=3D"mailto:zhengr=
q.fnst@cn.fujitsu.com">zhengrq.fnst@cn.fujitsu.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Signed-off-by: Zheng Ruoqin &lt;<a href=3D"m=
ailto:zhengrq.fnst@cn.fujitsu.com" target=3D"_blank">zhengrq.fnst@cn.fujits=
u.com</a>&gt;<br>
---<br>
=C2=A0.../recipes-devtools/python/python-pint.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 15 ++++++++++++++-<br>
=C2=A0.../python/python3-pint/run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3 +++<br>
=C2=A02 files changed, 17 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-pint/=
run-ptest<br>
<br>
diff --git a/meta-python/recipes-devtools/python/python-pint.inc b/meta-py=
thon/recipes-devtools/python/python-pint.inc<br>
index c58dc9076..5c3481008 100644<br>
--- a/meta-python/recipes-devtools/python/python-pint.inc<br>
+++ b/meta-python/recipes-devtools/python/python-pint.inc<br>
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dbccf824202=
692270a1e0829a62e3f47b&quot;<br>
<br>
=C2=A0PYPI_PACKAGE :=3D &quot;Pint&quot;<br>
<br>
-inherit pypi<br>
+inherit pypi ptest<br>
<br>
=C2=A0SRC_URI[md5sum] =3D &quot;3a8f29c2a30efd35af4b5c5a224ef965&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;308f1070500e102f83b6adfca6db53debfce2ff=
c5d3cbe3f6c367da359b5cf4d&quot;<br>
@@ -15,3 +15,16 @@ SRC_URI[sha256sum] =3D &quot;308f1070500e102f83b6adfca6=
db53debfce2ffc5d3cbe3f6c367da359<br>
=C2=A0DEPENDS +=3D &quot;python3-setuptools-scm-native&quot;<br>
<br>
=C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
+<br>
+SRC_URI +=3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
+&quot;<br>
+<br>
+RDEPENDS_${PN}-ptest +=3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0${PYTHON_PN}-pytest \<br>
+&quot;<br>
+<br>
+do_install_ptest() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${PTEST_PATH}/testsuite<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -rf ${S}/pint/testsuite/* ${D}${PTEST_PATH}=
/testsuite/<br>
+}<br>
diff --git a/meta-python/recipes-devtools/python/python3-pint/run-ptest b/=
meta-python/recipes-devtools/python/python3-pint/run-ptest<br>
new file mode 100644<br>
index 000000000..5cec71169<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/python3-pint/run-ptest<br>
@@ -0,0 +1,3 @@<br>
+#!/bin/sh<br>
+<br>
+pytest<br>
-- <br>
2.20.1<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--000000000000b5ed9a05a2663f83--
