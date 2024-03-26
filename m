Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38E66CD11DF
	for <webhook@archiver.kernel.org>; Tue, 26 Mar 2024 22:33:02 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web10.24147.1711492379564696526
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Mar 2024 15:32:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WZPHmUsW;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-609f359b7b1so69805587b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 26 Mar 2024 15:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711492379; x=1712097179; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zS2lGgH/xRzKMdk1cC3JQgGr1cZTpltyYHkQHSkQzyM=;
        b=WZPHmUsW+uvpjCeeb6vxoaq8VLYyAjMcVjXswTSD6nMDvE43BiGZY+mUQI/sJ7ik/Y
         64/pVrIcctEWn9fFFC2FESaB36xPzzcWsMLh+Cu89E3IH+BdDXcZFrg+aKanD6x6E/4z
         RTZ8oeA0yy9/veVveeCM4AFoyVwpA9GRyQWe6Afr0NMvs9K9ypNcshK0N8bCM9nz0ZHr
         ZWIfD/d3cKMHHXB8gKTeb1Il74z9JC9ZdWSYqwpK0eqzheEdBFt/YRx6O+EA+Y0wwEl+
         4aSDYyF5HZGq0o2ibb51+fb6hHqrT+Kry0hxWloYf9SiBqbf4ahv/Xss5pXutbW+apOm
         auog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711492379; x=1712097179;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zS2lGgH/xRzKMdk1cC3JQgGr1cZTpltyYHkQHSkQzyM=;
        b=Y7u2R/dXJwA837ZIoL/8QNA3Y4dJB6CUKMVbTHgAp1ZoPK29WiAGTG8D0l6GvgnQfp
         IZPiXvqtB26vEIOehG7StEhd+PeHX5N2bxlUPgDkbQd/dNM0qswrfmm+6kK8v2VWTwyF
         pivq4OuoR+AhrayLi46alzCYXnl9syPk9lKg1QbKRiYImyYDAY1ZYRUNU/V/gAE8uwFG
         67EDT/ieoFueXvajIO7ANuUoTAGeSk27VeuZFxytf17l1r5ZBz3Y8vcaLzqgdFyOfbpu
         waXBUVY7ILvpq5sxShT/eruxAO9eYBPIVogJOXcBnQwb5XtCzlWoEe+0AdoECFi/INTN
         DhCA==
X-Gm-Message-State: AOJu0YzvDxHng/3MHCDb1gDLXjovugxa2k3UWxxVBcrkbRhfB9bW+z8o
	29YjQyJMmQrvBsnUjNbrIFvTRHScUzPsz355WMPQboEZToPakZUEMu2+88JSUFQA/6dlGgle7Rl
	SEhzndg9cMh0HNwNTL5DDfGkPv3I=
X-Google-Smtp-Source: AGHT+IFzu6C0sweUUEpw7ZpEDlKaqNwuaO+Ymh9F/bdP8tksP9efLrl8k7+fd1udyb5jt/zr293kweYZ+pTWUcnTAnU=
X-Received: by 2002:a25:bd8f:0:b0:dcc:97e4:bc61 with SMTP id
 f15-20020a25bd8f000000b00dcc97e4bc61mr9982803ybh.57.1711492378481; Tue, 26
 Mar 2024 15:32:58 -0700 (PDT)
MIME-Version: 1.0
References: <20240326192523.116673-1-alperyasinak1@gmail.com>
In-Reply-To: <20240326192523.116673-1-alperyasinak1@gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Tue, 26 Mar 2024 15:32:47 -0700
Message-ID: <CANx9H-DSoZft5rstJqdpGhZbx+KVkL7vyLqn+ePhBnNRb2C3zg@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-portalocker: enable ptest
To: Alper Ak <alperyasinak1@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000415cc4061497df95"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Mar 2024 22:33:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109632

--000000000000415cc4061497df95
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 26, 2024 at 12:25=E2=80=AFPM Alper Ak <alperyasinak1@gmail.com>=
 wrote:

> * test_combined.py deleted because it is not a functional test. It checks
> if the 'combine' function work correctly which is parse README.rst and
> LICENSE.
>

Thank you for this simplification. It is very much appreciated.

>
> * Ptest and library example tested on qemux86-64 and qemuarm64
>
> * Add ptest into PTESTS_FAST_META_PYTHON


Thank you so much for your ptest help.

>
>
> qemux86-64:
>
> Testsuite summary
> TOTAL: 21
> PASS: 21
> SKIP: 0
> XFAIL: 0
> FAIL: 0
> XPASS: 0
> ERROR: 0
> DURATION: 11
> END: /usr/lib/python3-portalocker/ptest
> 2024-03-26T18:47
> STOP: ptest-runner
> TOTAL: 1 FAIL: 0
>
> qemuarm64:
>
> Testsuite summary
> TOTAL: 21
> PASS: 21
> SKIP: 0
> XFAIL: 0
> FAIL: 0
> XPASS: 0
> ERROR: 0
> DURATION: 11
> END: /usr/lib/python3-portalocker/ptest
> 2024-03-26T18:52
> STOP: ptest-runner
> TOTAL: 1 FAIL: 0
>
> Signed-off-by: alperak <alperyasinak1@gmail.com>
> ---
>  .../ptest-packagelists-meta-python.inc        |  1 +
>  .../python3-portalocker/run-ptest             |  3 +++
>  .../python3-portalocker_2.8.2.bb              | 26 ++++++++++++++++---
>  3 files changed, 26 insertions(+), 4 deletions(-)
>  create mode 100644
> meta-python/recipes-extended/python3-portalocker/python3-portalocker/run-=
ptest
>
> diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc
> b/meta-python/conf/include/ptest-packagelists-meta-python.inc
> index ec26f768e..ccb443182 100644
> --- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
> +++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
> @@ -40,6 +40,7 @@ PTESTS_FAST_META_PYTHON =3D "\
>      python3-parse-type \
>      python3-platformdirs \
>      python3-polyline \
> +    python3-portalocker \
>      python3-precise-runner \
>      python3-prettytable \
>      python3-pydantic \
> diff --git
> a/meta-python/recipes-extended/python3-portalocker/python3-portalocker/ru=
n-ptest
> b/meta-python/recipes-extended/python3-portalocker/python3-portalocker/ru=
n-ptest
> new file mode 100644
> index 000000000..8d2017d39
> --- /dev/null
> +++
> b/meta-python/recipes-extended/python3-portalocker/python3-portalocker/ru=
n-ptest
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +pytest --automake
> diff --git a/meta-python/recipes-extended/python3-portalocker/
> python3-portalocker_2.8.2.bb
> b/meta-python/recipes-extended/python3-portalocker/
> python3-portalocker_2.8.2.bb
> index 69578ba84..c45a3fcda 100644
> --- a/meta-python/recipes-extended/python3-portalocker/
> python3-portalocker_2.8.2.bb
> +++ b/meta-python/recipes-extended/python3-portalocker/
> python3-portalocker_2.8.2.bb
> @@ -8,11 +8,29 @@ SRC_URI[sha256sum] =3D
> "2b035aa7828e46c58e9b31390ee1f169b98e1066ab10b9a6a861fe7e25
>
>  DEPENDS +=3D "python3-setuptools-scm-native"
>
> -inherit pypi python_setuptools_build_meta
> +inherit pypi python_setuptools_build_meta ptest
>
> -BBCLASSEXTEND =3D "native nativesdk"
> +SRC_URI +=3D " \
> +       file://run-ptest \
> +"
> +
> +RDEPENDS:${PN}-ptest +=3D " \
> +       python3-multiprocessing \
> +       python3-pytest \
> +       python3-redis \
> +       python3-unittest-automake-output \
> +       redis \
> +"
> +
> +do_install_ptest() {
> +       install -d ${D}${PTEST_PATH}/tests
> +       cp -rf ${S}/portalocker_tests/* ${D}${PTEST_PATH}/tests/
> +       rm -rf ${D}${PTEST_PATH}/tests/test_combined.py
> +}
>
>  RDEPENDS:${PN} +=3D " \
> -        python3-fcntl \
> -        python3-logging \
> +       python3-fcntl \
> +       python3-logging \
>  "
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109626):
> https://lists.openembedded.org/g/openembedded-devel/message/109626
> Mute This Topic: https://lists.openembedded.org/mt/105164685/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000415cc4061497df95
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Mar 26, 2024 at 12:25=E2=80=AFPM Alper Ak &lt;<a hr=
ef=3D"mailto:alperyasinak1@gmail.com">alperyasinak1@gmail.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-l=
eft-color:rgb(204,204,204)">* test_combined.py deleted because it is not a =
functional test. It checks if the &#39;combine&#39; function work correctly=
 which is parse README.rst and LICENSE.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Thank you for th=
is simplification. It is very much appreciated.</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-=
left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)"><br>
* Ptest and library example tested on qemux86-64 and qemuarm64<br>
<br>
* Add ptest into PTESTS_FAST_META_PYTHON</blockquote><div dir=3D"auto"><br>=
</div><div dir=3D"auto">Thank you so much for your ptest help.</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-wi=
dth:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,=
204,204)" dir=3D"auto"><br>
<br>
qemux86-64:<br>
<br>
Testsuite summary<br>
TOTAL: 21<br>
PASS: 21<br>
SKIP: 0<br>
XFAIL: 0<br>
FAIL: 0<br>
XPASS: 0<br>
ERROR: 0<br>
DURATION: 11<br>
END: /usr/lib/python3-portalocker/ptest<br>
2024-03-26T18:47<br>
STOP: ptest-runner<br>
TOTAL: 1 FAIL: 0<br>
<br>
qemuarm64:<br>
<br>
Testsuite summary<br>
TOTAL: 21<br>
PASS: 21<br>
SKIP: 0<br>
XFAIL: 0<br>
FAIL: 0<br>
XPASS: 0<br>
ERROR: 0<br>
DURATION: 11<br>
END: /usr/lib/python3-portalocker/ptest<br>
2024-03-26T18:52<br>
STOP: ptest-runner<br>
TOTAL: 1 FAIL: 0<br>
<br>
Signed-off-by: alperak &lt;<a href=3D"mailto:alperyasinak1@gmail.com" targe=
t=3D"_blank">alperyasinak1@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../ptest-packagelists-meta-python.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 1 +<br>
=C2=A0.../python3-portalocker/run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 3 +++<br>
=C2=A0.../<a href=3D"http://python3-portalocker_2.8.2.bb" rel=3D"noreferrer=
" target=3D"_blank">python3-portalocker_2.8.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 26 ++++++++++++++++---<br>
=C2=A03 files changed, 26 insertions(+), 4 deletions(-)<br>
=C2=A0create mode 100644 meta-python/recipes-extended/python3-portalocker/p=
ython3-portalocker/run-ptest<br>
<br>
diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/=
meta-python/conf/include/ptest-packagelists-meta-python.inc<br>
index ec26f768e..ccb443182 100644<br>
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc<br>
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc<br>
@@ -40,6 +40,7 @@ PTESTS_FAST_META_PYTHON =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0python3-parse-type \<br>
=C2=A0 =C2=A0 =C2=A0python3-platformdirs \<br>
=C2=A0 =C2=A0 =C2=A0python3-polyline \<br>
+=C2=A0 =C2=A0 python3-portalocker \<br>
=C2=A0 =C2=A0 =C2=A0python3-precise-runner \<br>
=C2=A0 =C2=A0 =C2=A0python3-prettytable \<br>
=C2=A0 =C2=A0 =C2=A0python3-pydantic \<br>
diff --git a/meta-python/recipes-extended/python3-portalocker/python3-porta=
locker/run-ptest b/meta-python/recipes-extended/python3-portalocker/python3=
-portalocker/run-ptest<br>
new file mode 100644<br>
index 000000000..8d2017d39<br>
--- /dev/null<br>
+++ b/meta-python/recipes-extended/python3-portalocker/python3-portalocker/=
run-ptest<br>
@@ -0,0 +1,3 @@<br>
+#!/bin/sh<br>
+<br>
+pytest --automake<br>
diff --git a/meta-python/recipes-extended/python3-portalocker/<a href=3D"ht=
tp://python3-portalocker_2.8.2.bb" rel=3D"noreferrer" target=3D"_blank">pyt=
hon3-portalocker_2.8.2.bb</a> b/meta-python/recipes-extended/python3-portal=
ocker/<a href=3D"http://python3-portalocker_2.8.2.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">python3-portalocker_2.8.2.bb</a><br>
index 69578ba84..c45a3fcda 100644<br>
--- a/meta-python/recipes-extended/python3-portalocker/<a href=3D"http://py=
thon3-portalocker_2.8.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-po=
rtalocker_2.8.2.bb</a><br>
+++ b/meta-python/recipes-extended/python3-portalocker/<a href=3D"http://py=
thon3-portalocker_2.8.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-po=
rtalocker_2.8.2.bb</a><br>
@@ -8,11 +8,29 @@ SRC_URI[sha256sum] =3D &quot;2b035aa7828e46c58e9b31390ee1=
f169b98e1066ab10b9a6a861fe7e25<br>
<br>
=C2=A0DEPENDS +=3D &quot;python3-setuptools-scm-native&quot;<br>
<br>
-inherit pypi python_setuptools_build_meta<br>
+inherit pypi python_setuptools_build_meta ptest<br>
<br>
-BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
+SRC_URI +=3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
+&quot;<br>
+<br>
+RDEPENDS:${PN}-ptest +=3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0python3-multiprocessing \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0python3-pytest \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0python3-redis \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0python3-unittest-automake-output \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0redis \<br>
+&quot;<br>
+<br>
+do_install_ptest() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${PTEST_PATH}/tests<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -rf ${S}/portalocker_tests/* ${D}${PTEST_PAT=
H}/tests/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${D}${PTEST_PATH}/tests/test_combined.py=
<br>
+}<br>
<br>
=C2=A0RDEPENDS:${PN} +=3D &quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 python3-fcntl \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 python3-logging \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0python3-fcntl \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0python3-logging \<br>
=C2=A0&quot;<br>
+<br>
+BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#109626): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/109626" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/109626</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/105164685/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/105164685/924729</a><br>
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

--000000000000415cc4061497df95--

