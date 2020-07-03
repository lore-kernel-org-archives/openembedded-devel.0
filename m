Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
 by mx.groups.io with SMTP id smtpd.web11.1993.1593792273941769166
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jul 2020 09:04:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PQCk+Svl;
 spf=pass (domain: gmail.com, ip: 209.85.166.49, mailfrom: ticotimo@gmail.com)
Received: by mail-io1-f49.google.com with SMTP id f23so32953111iof.6
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Jul 2020 09:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gTJwoJxOwimjTaWd8hrwMJccycLRYSSf7lDi5Dtcncc=;
        b=PQCk+SvlllIzm14DwdtBkt6KNC30mkr0tmo2SDmI9x3NLwjosgP3IP5Alj3bVeiSOe
         lB9oQ5Wsv2SFl4nkFQzTnHJpxrbm5A5dLOnuS2y/dvwi92Yt0pfddBDQ6gLaabSWOwgw
         c2g7F/0TF5RlQSln1Ht9T9NxQI7IwF9kZxqaUZe4tb64xNZqQnGEZbBBX6yGp/ITgnhg
         a1Ge+GGEGbS1bZfS4dB2tZL4FrtH+PezaJ5FqML830eZPRfbOd/f8JBMWpbthbQNYUl+
         0s1EmW6cqfFjDbiJotLOhP2nyFXRqKN2XlYpknmEXlEF21d2JD2UjNjKgxTNuwb4rr83
         ++Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gTJwoJxOwimjTaWd8hrwMJccycLRYSSf7lDi5Dtcncc=;
        b=i3/vK4mktQG3bbGxVc1YYoZb2EPwFefUSnKAkuaNmYW3qlyTKmDE5FSdOamiDvTv1c
         65pdA0pokFDx/1juXf5V3+gAkNNwT9X9PRNfetOKmCLr/2bqzMCtSgkV5v/oRy4gZDBx
         EKIo5Bplzr2kPg3H+xGbDACRUA0QjfXMyVij4UFbQVJ+j388zwMjiIyiwlfyGZQaiwJ2
         ZhtqJyTTsVGZqE6nJ2G9tZ92wD2qZuA52VSSBRi9Rwml+e1q7bIpmGHLCn53ME0Z+I6u
         avG5Ap1vtQAy0dP7f7gx34Udq+213Qk8r51UAqnzbSSoCoDDNCRtYz3vCNC1GAHa2ik+
         2gNg==
X-Gm-Message-State: AOAM5308+dliyXF088VvR0FTFuhd3qpa+Vpkp0etXomZCyNWuisWSQQ7
	oeLXp9lLhpxHkzqf4gONe8RsXEHNsdPhpW1kXoA=
X-Google-Smtp-Source: ABdhPJz8/WelSTAa1QkQ4DPhvlO4oIvmidp2hiIEdCznRCyYuWPOEABKOu52+yUfvRtKR8N4sEg7CDDVayjwff8iXv0=
X-Received: by 2002:a02:aa1b:: with SMTP id r27mr38584026jam.89.1593792273211;
 Fri, 03 Jul 2020 09:04:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200703155514.39291-1-sakib.sajal@windriver.com>
In-Reply-To: <20200703155514.39291-1-sakib.sajal@windriver.com>
From: "Tim Orling" <ticotimo@gmail.com>
Date: Fri, 3 Jul 2020 09:04:22 -0700
Message-ID: <CANx9H-CZW7OChSwGRi42JgVF4N-DG4AWCYzA0VtcWmzAwhpiEA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-requests-toolbelt: add ptest
To: Sakib Sajal <sakib.sajal@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004a67bc05a98bae1c"

--0000000000004a67bc05a98bae1c
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 3, 2020 at 8:55 AM Sakib Sajal <sakib.sajal@windriver.com>
wrote:

> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>  .../python/python3-requests-toolbelt/run-ptest  |  3 +++
>  .../python/python3-requests-toolbelt_0.9.1.bb   | 17 +++++++++++++++--
>  2 files changed, 18 insertions(+), 2 deletions(-)
>  create mode 100644
> meta-python/recipes-devtools/python/python3-requests-toolbelt/run-ptest
>
> diff --git
> a/meta-python/recipes-devtools/python/python3-requests-toolbelt/run-ptest
> b/meta-python/recipes-devtools/python/python3-requests-toolbelt/run-ptest
> new file mode 100644
> index 000000000..b63c4de0d
> --- /dev/null
> +++
> b/meta-python/recipes-devtools/python/python3-requests-toolbelt/run-ptest
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'|
> sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e
> 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" ||
> $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk
> '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" ||
> $NF=="XPASS") {$NF="";print $0}else{print}}'


Seems like these two run-ptest files are very similar...please consider an
extensible way to reduce duplication. For instance, the ptest-perl.bbclass
provides a run-ptest script that is nearly universal. For python, we
probably need some templating. Food for thought and improving our code base.

>
> diff --git a/meta-python/recipes-devtools/python/
> python3-requests-toolbelt_0.9.1.bb b/meta-python/recipes-devtools/python/
> python3-requests-toolbelt_0.9.1.bb
> index 3beb39718..e075c019d 100644
> --- a/meta-python/recipes-devtools/python/
> python3-requests-toolbelt_0.9.1.bb
> +++ b/meta-python/recipes-devtools/python/
> python3-requests-toolbelt_0.9.1.bb
> @@ -5,12 +5,25 @@ AUTHOR = "Ian Cordasco, Cory Benfield"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=71760e0f1dda8cff91b0bc9246caf571"
>
> +SRC_URI = "file://run-ptest \
> +          "
> +
>  SRC_URI[md5sum] = "b1509735c4b4cf95df2619facbc3672e"
>  SRC_URI[sha256sum] =
> "968089d4584ad4ad7c171454f0a5c6dac23971e9472521ea3b6d49d610aa6fc0"
>
> -inherit setuptools3
> -inherit pypi
> +inherit pypi setuptools3 ptest
>
>  RDEPENDS_${PN} += " \
>      ${PYTHON_PN}-requests (>=2.0.1) \
>  "
> +
> +RDEPENDS_${PN}-ptest += " \
> +       ${PYTHON_PN}-pytest \
> +       ${PYTHON_PN}-betamax \
> +       ${PYTHON_PN}-mock \
> +"
> +
> +do_install_ptest() {
> +       install -d ${D}${PTEST_PATH}/tests
> +       cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> +}
> --
> 2.27.0
>
> 
>

--0000000000004a67bc05a98bae1c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Jul 3, 2020 at 8:55 AM Sakib Sajal &lt;<a href=3D"=
mailto:sakib.sajal@windriver.com">sakib.sajal@windriver.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-lef=
t-color:rgb(204,204,204)">Signed-off-by: Sakib Sajal &lt;<a href=3D"mailto:=
sakib.sajal@windriver.com" target=3D"_blank">sakib.sajal@windriver.com</a>&=
gt;<br>
---<br>
=C2=A0.../python/python3-requests-toolbelt/run-ptest=C2=A0 |=C2=A0 3 +++<b=
r>
=C2=A0.../python/<a href=3D"http://python3-requests-toolbelt_0.9.1.bb" rel=
=
=3D"noreferrer" target=3D"_blank">python3-requests-toolbelt_0.9.1.bb</a>=
=C2=A0 =C2=A0| 17 +++++++++++++++--<br>
=C2=A02 files changed, 18 insertions(+), 2 deletions(-)<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-reque=
sts-toolbelt/run-ptest<br>
<br>
diff --git a/meta-python/recipes-devtools/python/python3-requests-toolbelt=
/run-ptest b/meta-python/recipes-devtools/python/python3-requests-toolbelt/=
run-ptest<br>
new file mode 100644<br>
index 000000000..b63c4de0d<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/python3-requests-toolbelt/run-pt=
est<br>
@@ -0,0 +1,3 @@<br>
+#!/bin/sh<br>
+<br>
+pytest -o log_cli=3Dtrue -o log_cli_level=3DINFO | sed -e &#39;s/\[...%\]=
//g&#39;| sed -e &#39;s/PASSED/PASS/g&#39;| sed -e &#39;s/FAILED/FAIL/g&#39=
;|sed -e &#39;s/SKIPPED/SKIP/g&#39;| awk &#39;{if ($NF=3D=3D&quot;PASS&quot=
; || $NF=3D=3D&quot;FAIL&quot; || $NF=3D=3D&quot;SKIP&quot; || $NF=3D=3D&qu=
ot;XFAIL&quot; || $NF=3D=3D&quot;XPASS&quot;){printf &quot;%s: %s\n&quot;, =
$NF, $0}else{print}}&#39;| awk &#39;{if ($NF=3D=3D&quot;PASS&quot; || $NF=
=3D=3D&quot;FAIL&quot; || $NF=3D=3D&quot;SKIP&quot; || $NF=3D=3D&quot;XFAI=
L&quot; || $NF=3D=3D&quot;XPASS&quot;) {$NF=3D&quot;&quot;;print $0}else{pr=
int}}&#39;</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Seems =
like these two run-ptest files are very similar...please consider an extens=
ible way to reduce duplication. For instance, the ptest-perl.bbclass provid=
es a run-ptest script that is nearly universal. For python, we probably nee=
d some templating. Food for thought and improving our code base.</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-=
width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(20=
4,204,204)"><br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3=
-requests-toolbelt_0.9.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-r=
equests-toolbelt_0.9.1.bb</a> b/meta-python/recipes-devtools/python/<a href=
=
=3D"http://python3-requests-toolbelt_0.9.1.bb" rel=3D"noreferrer" target=
=3D"_blank">python3-requests-toolbelt_0.9.1.bb</a><br>
index 3beb39718..e075c019d 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-reques=
ts-toolbelt_0.9.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-requests=
-toolbelt_0.9.1.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-reques=
ts-toolbelt_0.9.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-requests=
-toolbelt_0.9.1.bb</a><br>
@@ -5,12 +5,25 @@ AUTHOR =3D &quot;Ian Cordasco, Cory Benfield&quot;<br>
=C2=A0LICENSE =3D &quot;Apache-2.0&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D71760e0f1dda8cff91b0=
bc9246caf571&quot;<br>
<br>
+SRC_URI =3D &quot;file://run-ptest \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
+<br>
=C2=A0SRC_URI[md5sum] =3D &quot;b1509735c4b4cf95df2619facbc3672e&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;968089d4584ad4ad7c171454f0a5c6dac23971e=
9472521ea3b6d49d610aa6fc0&quot;<br>
<br>
-inherit setuptools3<br>
-inherit pypi<br>
+inherit pypi setuptools3 ptest<br>
<br>
=C2=A0RDEPENDS_${PN} +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${PYTHON_PN}-requests (&gt;=3D2.0.1) \<br>
=C2=A0&quot;<br>
+<br>
+RDEPENDS_${PN}-ptest +=3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0${PYTHON_PN}-pytest \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0${PYTHON_PN}-betamax \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0${PYTHON_PN}-mock \<br>
+&quot;<br>
+<br>
+do_install_ptest() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${PTEST_PATH}/tests<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/<b=
r>
+}<br>
-- <br>
2.27.0<br>
<br>
<br>
</blockquote></div></div>

--0000000000004a67bc05a98bae1c--
