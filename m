Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BFDEC48286
	for <webhook@archiver.kernel.org>; Sun,  4 Feb 2024 10:55:18 +0000 (UTC)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
 by mx.groups.io with SMTP id smtpd.web10.36445.1707044115258676958
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Feb 2024 02:55:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XV0hdj5e;
 spf=pass (domain: gmail.com, ip: 209.85.161.51, mailfrom: alperyasinak1@gmail.com)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-59a1a03d09aso1426274eaf.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 04 Feb 2024 02:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707044114; x=1707648914; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cIf+OB/kqI2goXrPH+GeV565hf7oZ5iTuqRAJeA/uRs=;
        b=XV0hdj5e2GBuNppFXMV4SnpjDE2sNI5cY5Gvf9p6KGopZs+oVzANvoYE+pjjErzLRt
         VSkBANUOT7RiONtKpbBsC/lb2tnfNaai0IyBCu7jUTa/q4K5um/V6oH6xb3lb5uW67io
         KD6/sLDYLyaXbAROAQYnflDXmMXrlSf/kw4mxT2P6HICrCG6epQvPo6JBL1lTulT0/9X
         1PWyGWHl67AUtFXe8VjUMmy74zmrLMGl6Z/mX0GBxa5JtIKE7NBg1FR+E+qCNZnhuTDI
         7MairVT/TxXUDLgYhVY8OzBBq8IRQfAgOWPlgtvytZJFPZsFL5Pfs+ZpfGn7Pf0OolO1
         Xk1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707044114; x=1707648914;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cIf+OB/kqI2goXrPH+GeV565hf7oZ5iTuqRAJeA/uRs=;
        b=vZoJP8PCjkId0fHQXHrRNOSmwGP8e1+hR+9h7iH32ZMQaYIGnyGwNku31zltUibkG/
         FOPDLhcSppUkUfc8BMd3cNqZPeezlKJgsqQjgxZ0/MJFfDHyCCTrd/Ze7ZmIoVZwSj8O
         Te3jsu7zEOyVD5G+SvqGnZ3QhU4XUsDE4p+UfBODSs686BKSfHsZ/ixlOvmnZ6AiHS0o
         iArlQfNdd3ZxrOSZdygp6lC3unv0Q9r1dbth754z9gSMcBV+H7BIWL/G8cDzZrrLA+wp
         jvl6Y7Km/UmrXHdoGTARMquBSujKwCdhyqZhjQek7uVbgzJIEpyQE7W3p9snMqsYBlC3
         2Mxg==
X-Gm-Message-State: AOJu0Yz+cNaN9utGvAi8ud7GvB3Co4evCzYpR6XtExy3kxwLfJ2Jj4Op
	lU9XK2z6hQ23EogKH2rQQpciocrdct1V22bgOYvG/pPuovgQg2+e3N8aJ3ppfANGncgBFTFGkNi
	jZrjp8eKFaQnOzojsUfRcVaT+uKE=
X-Google-Smtp-Source: AGHT+IHVeC+z+Yo1lS2m8xO+AkfViYaiC7WC9vZ8qAMw+hAwciUKOKzI5fgI9gHdB2VSHvU+bzaTHUgnQc98RGXuneY=
X-Received: by 2002:a05:6358:ed0e:b0:178:be64:c3bb with SMTP id
 hy14-20020a056358ed0e00b00178be64c3bbmr7862105rwb.14.1707044114243; Sun, 04
 Feb 2024 02:55:14 -0800 (PST)
MIME-Version: 1.0
References: <20240203211307.86988-1-alperyasinak1@gmail.com> <CANx9H-A4nWiiXBuFxMtgS5M8GfJd1qLgcjkiVoR5dtJj4XC8XQ@mail.gmail.com>
In-Reply-To: <CANx9H-A4nWiiXBuFxMtgS5M8GfJd1qLgcjkiVoR5dtJj4XC8XQ@mail.gmail.com>
From: Alper Ak <alperyasinak1@gmail.com>
Date: Sun, 4 Feb 2024 13:55:03 +0300
Message-ID: <CAGpma=4D7k5HEkfqJ2dnGOLOahNk2S2W7vLC62cMCuR-RUztwQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-scikit-build: upgrade 0.16.7 -> 0.17.6
To: Tim Orling <ticotimo@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000000ba12206108c2e8b"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Feb 2024 10:55:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108561

--0000000000000ba12206108c2e8b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the feedback, sent patch v2.

Tim Orling <ticotimo@gmail.com>, 4 =C5=9Eub 2024 Paz, 05:55 tarihinde =C5=
=9Funu yazd=C4=B1:

>
>
> On Sat, Feb 3, 2024 at 1:13=E2=80=AFPM Alper Ak <alperyasinak1@gmail.com>=
 wrote:
>
>> Moved to hatchling as a build backend and requires
>> hatch-fancy-pypi-readme, hatch-vcs. Also, added tomli as a RDEPENDS.
>
>
> We do not actually need tomli, since Python 3.11+ has built in tomllib.
> This gates it to Python 3.10 and lower:
> https://github.com/scikit-build/scikit-build/blob/main/pyproject.toml#L34
>
> (The host Python version should not matter, we use our own python3-native=
,
> which is currently 3.12.1)
>
>>
>>
>> As stated in the upstream, the license updated to MIT only.
>>
>> Changelog: https://github.com/scikit-build/scikit-build/releases
>>
>> Signed-off-by: alperak <alperyasinak1@gmail.com>
>> ---
>>  .../python/python3-scikit-build_0.16.7.bb     | 21 -----------------
>>  .../python/python3-scikit-build_0.17.6.bb     | 23 +++++++++++++++++++
>>  2 files changed, 23 insertions(+), 21 deletions(-)
>>  delete mode 100644 meta-python/recipes-devtools/python/
>> python3-scikit-build_0.16.7.bb
>>  create mode 100644 meta-python/recipes-devtools/python/
>> python3-scikit-build_0.17.6.bb
>>
>> diff --git a/meta-python/recipes-devtools/python/
>> python3-scikit-build_0.16.7.bb b/meta-python/recipes-devtools/python/
>> python3-scikit-build_0.16.7.bb
>> deleted file mode 100644
>> index c033c56ba..000000000
>> --- a/meta-python/recipes-devtools/python/python3-scikit-build_0.16.7.bb
>> +++ /dev/null
>> @@ -1,21 +0,0 @@
>> -SUMMARY =3D "Improved build system generator for Python
>> C/C++/Fortran/Cython extensions"
>> -LICENSE =3D "MIT & BSD-2-Clause"
>> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D7c96d2b08b3cec6d3c67fb864d1f=
d8cc"
>> -
>> -DEPENDS =3D "python3-setuptools-scm-native"
>> -
>> -PYPI_PACKAGE =3D "scikit-build"
>> -
>> -inherit pypi python_setuptools_build_meta
>> -SRC_URI[sha256sum] =3D
>> "a9b9cc7479b71e6c8d434596dfade025253aae23adb22a9a2d85850fd51cecfd"
>> -
>> -RDEPENDS:${PN} =3D " \
>> -       python3-distro \
>> -       python3-packaging \
>> -       python3-setuptools \
>> -       python3-typing-extensions \
>> -       python3-wheel \
>> -       cmake \
>> -"
>> -
>> -BBCLASSEXTEND =3D "native nativesdk"
>> diff --git a/meta-python/recipes-devtools/python/
>> python3-scikit-build_0.17.6.bb b/meta-python/recipes-devtools/python/
>> python3-scikit-build_0.17.6.bb
>> new file mode 100644
>> index 000000000..8f6e40fa0
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python3-scikit-build_0.17.6.bb
>> @@ -0,0 +1,23 @@
>> +SUMMARY =3D "Improved build system generator for Python
>> C/C++/Fortran/Cython extensions"
>> +LICENSE =3D "MIT"
>> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D7c96d2b08b3cec6d3c67fb864d1f=
d8cc"
>> +
>> +DEPENDS =3D "${PYTHON_PN}-hatch-vcs-native
>> ${PYTHON_PN}-hatch-fancy-pypi-readme-native"
>> +
>> +PYPI_PACKAGE =3D "scikit_build"
>> +
>> +inherit pypi python_hatchling
>> +
>> +SRC_URI[sha256sum] =3D
>> "b51a51a36b37c42650994b5047912f59b22e3210b23e321f287611f9ef6e5c9d"
>> +
>> +RDEPENDS:${PN} =3D " \
>> +       ${PYTHON_PN}-distro \
>> +       ${PYTHON_PN}-packaging \
>> +       ${PYTHON_PN}-setuptools \
>> +       ${PYTHON_PN}-tomli \
>> +       ${PYTHON_PN}-typing-extensions \
>> +       ${PYTHON_PN}-wheel \
>> +       cmake \
>> +"
>> +
>> +BBCLASSEXTEND =3D "native nativesdk"
>> --
>> 2.25.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#108556):
>> https://lists.openembedded.org/g/openembedded-devel/message/108556
>> Mute This Topic: https://lists.openembedded.org/mt/104145984/924729
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
>> ticotimo@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>

--0000000000000ba12206108c2e8b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for the feedback, sent patch v2.</div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Tim Orling &lt;<a h=
ref=3D"mailto:ticotimo@gmail.com">ticotimo@gmail.com</a>&gt;, 4 =C5=9Eub 20=
24 Paz, 05:55 tarihinde =C5=9Funu yazd=C4=B1:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex"><div><br></div><div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Feb 3, 2024 at 1:13=E2=
=80=AFPM Alper Ak &lt;<a href=3D"mailto:alperyasinak1@gmail.com" target=3D"=
_blank">alperyasinak1@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Moved to hatchling as a build backend and =
requires hatch-fancy-pypi-readme, hatch-vcs. Also, added tomli as a RDEPEND=
S.</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">We do not actu=
ally need tomli, since Python 3.11+ has built in tomllib. This gates it to =
Python 3.10 and lower:</div><div dir=3D"auto"><div><a href=3D"https://githu=
b.com/scikit-build/scikit-build/blob/main/pyproject.toml#L34" target=3D"_bl=
ank">https://github.com/scikit-build/scikit-build/blob/main/pyproject.toml#=
L34</a></div><br></div><div dir=3D"auto">(The host Python version should no=
t matter, we use our own python3-native, which is currently 3.12.1)</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex" dir=3D"auto"><br>
<br>
As stated in the upstream, the license updated to MIT only.<br>
<br>
Changelog: <a href=3D"https://github.com/scikit-build/scikit-build/releases=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/scikit-build/scik=
it-build/releases</a><br>
<br>
Signed-off-by: alperak &lt;<a href=3D"mailto:alperyasinak1@gmail.com" targe=
t=3D"_blank">alperyasinak1@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../python/<a href=3D"http://python3-scikit-build_0.16.7.bb" rel=3D"n=
oreferrer" target=3D"_blank">python3-scikit-build_0.16.7.bb</a>=C2=A0 =C2=
=A0 =C2=A0| 21 -----------------<br>
=C2=A0.../python/<a href=3D"http://python3-scikit-build_0.17.6.bb" rel=3D"n=
oreferrer" target=3D"_blank">python3-scikit-build_0.17.6.bb</a>=C2=A0 =C2=
=A0 =C2=A0| 23 +++++++++++++++++++<br>
=C2=A02 files changed, 23 insertions(+), 21 deletions(-)<br>
=C2=A0delete mode 100644 meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-scikit-build_0.16.7.bb" rel=3D"noreferrer" target=3D"_blank">py=
thon3-scikit-build_0.16.7.bb</a><br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-scikit-build_0.17.6.bb" rel=3D"noreferrer" target=3D"_blank">py=
thon3-scikit-build_0.17.6.bb</a><br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
scikit-build_0.16.7.bb" rel=3D"noreferrer" target=3D"_blank">python3-scikit=
-build_0.16.7.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http:=
//python3-scikit-build_0.16.7.bb" rel=3D"noreferrer" target=3D"_blank">pyth=
on3-scikit-build_0.16.7.bb</a><br>
deleted file mode 100644<br>
index c033c56ba..000000000<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-scikit-=
build_0.16.7.bb" rel=3D"noreferrer" target=3D"_blank">python3-scikit-build_=
0.16.7.bb</a><br>
+++ /dev/null<br>
@@ -1,21 +0,0 @@<br>
-SUMMARY =3D &quot;Improved build system generator for Python C/C++/Fortran=
/Cython extensions&quot;<br>
-LICENSE =3D &quot;MIT &amp; BSD-2-Clause&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D7c96d2b08b3cec6d3c67fb864d=
1fd8cc&quot;<br>
-<br>
-DEPENDS =3D &quot;python3-setuptools-scm-native&quot;<br>
-<br>
-PYPI_PACKAGE =3D &quot;scikit-build&quot;<br>
-<br>
-inherit pypi python_setuptools_build_meta<br>
-SRC_URI[sha256sum] =3D &quot;a9b9cc7479b71e6c8d434596dfade025253aae23adb22=
a9a2d85850fd51cecfd&quot;<br>
-<br>
-RDEPENDS:${PN} =3D &quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0python3-distro \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0python3-packaging \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0python3-setuptools \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0python3-typing-extensions \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0python3-wheel \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cmake \<br>
-&quot;<br>
-<br>
-BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
scikit-build_0.17.6.bb" rel=3D"noreferrer" target=3D"_blank">python3-scikit=
-build_0.17.6.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http:=
//python3-scikit-build_0.17.6.bb" rel=3D"noreferrer" target=3D"_blank">pyth=
on3-scikit-build_0.17.6.bb</a><br>
new file mode 100644<br>
index 000000000..8f6e40fa0<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-scikit-=
build_0.17.6.bb" rel=3D"noreferrer" target=3D"_blank">python3-scikit-build_=
0.17.6.bb</a><br>
@@ -0,0 +1,23 @@<br>
+SUMMARY =3D &quot;Improved build system generator for Python C/C++/Fortran=
/Cython extensions&quot;<br>
+LICENSE =3D &quot;MIT&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D7c96d2b08b3cec6d3c67fb864d=
1fd8cc&quot;<br>
+<br>
+DEPENDS =3D &quot;${PYTHON_PN}-hatch-vcs-native ${PYTHON_PN}-hatch-fancy-p=
ypi-readme-native&quot;<br>
+<br>
+PYPI_PACKAGE =3D &quot;scikit_build&quot;<br>
+<br>
+inherit pypi python_hatchling<br>
+<br>
+SRC_URI[sha256sum] =3D &quot;b51a51a36b37c42650994b5047912f59b22e3210b23e3=
21f287611f9ef6e5c9d&quot;<br>
+<br>
+RDEPENDS:${PN} =3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0${PYTHON_PN}-distro \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0${PYTHON_PN}-packaging \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0${PYTHON_PN}-setuptools \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0${PYTHON_PN}-tomli \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0${PYTHON_PN}-typing-extensions \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0${PYTHON_PN}-wheel \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cmake \<br>
+&quot;<br>
+<br>
+BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#108556): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/108556" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/108556</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/104145984/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/104145984/924729</a><br>
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
</blockquote></div>

--0000000000000ba12206108c2e8b--

