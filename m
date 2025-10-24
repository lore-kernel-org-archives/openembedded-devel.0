Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 203FDCCD1BF
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 00:13:01 +0000 (UTC)
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
 by mx.groups.io with SMTP id smtpd.web10.5365.1761264771469372195
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Oct 2025 17:12:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ekmBU15Z;
 spf=pass (domain: gmail.com, ip: 74.125.224.54, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-63e17c0fefbso1559468d50.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Oct 2025 17:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761264770; x=1761869570; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0Zyu+xk0Zu4zRY5I1WMaWgenYVNaB/7oh7KJ577SGq0=;
        b=ekmBU15ZJPsKpKueZUcoW3UIQxsg2r05lR9UBbetwKVK6IifC+L7R4c9uWMPGZgISA
         5Uciah12Xw8hoBY0gQQa9/NneJ8LwAcxKYGxfYe3qQs67SXEeuDyrTXka4a+AbQTKheA
         kf4LVsnN8mM1N1A+BiwLtMkgmrjqWtW0OUQmt8k0JVpYJAYlxlzKN1ZWzist0PmhkeVI
         W/hoO3QNxoxXzO6NfkmSKRQP5BcW/lp/wfN0ODUbbtfd0uy1vjWvXwrgPvwDo3B93S25
         /L4EfM9ej4cbZ9uNHbJ6vJbTYmRf7BfNVUjcOqJaKf8jkzO9jyxfREdbxUV1X1jrw7Yh
         GYiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761264770; x=1761869570;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Zyu+xk0Zu4zRY5I1WMaWgenYVNaB/7oh7KJ577SGq0=;
        b=cASZSbrq/E2xjTcs3P86ozb76dIPIUeagkaC7Dm9CzBciDlPUpdQZaa8OiL4J9Vd1n
         H90SSyq/bW8A8k+6yWg4WDZm6QBLRHC0tX1jJw7wZ4ap+mR0LSLuwyIGurqrBD88j0yI
         A97aQs9J9p3zlRTS/QY+C7F9l3iqjn7rwnr9wwoC2bPeQGJqMc+vvh8uMkbAwnmv/Dpw
         nnjEY1o75k4xUSpSlcUSTfSh13PO4y4ZqYcl+j6vbU/SDXh85+7s+HcRY5Cy9YRvsMIY
         2NEo+21pMhVPxak/B/V/Cm7zw6Nus6ruy97RMlzzzXuadV3EWKhyaoOYxH6iwleu2Kog
         Xt0Q==
X-Gm-Message-State: AOJu0YxX+NvkorN225iqfmGeOGc41WIHxof4IQ/ce6zfMd3/fpM0Wssl
	XAfgznShQEQYGXQb2RNbJpsv9WVvxHkZ67vuVFKxVpLEXmAEihq5zMnXUYxrg2OXXmKNdiVP7Ae
	Q65qxf9AX6B88jR1WnbK+cDQ0FN2MVmQ=
X-Gm-Gg: ASbGnctK6UnxeTJUA53eFf8QOux7Bm+DSRFKcQ4wGdVXNGgwkLgbKXaM9FG0VySXuRg
	LaHhdGPR9ERK0+jZkrqzzNuagnz7CkdFknHfkd+2z7iWYX9UKIQ04C0Wo83D02Xwg2uG4W0wRHt
	E9ThJ5B1weSo2fXEvUBAaMjvnCyLmDdjHzRQn2vWNqDA6Ir4t0/dldboZwc2tlFxtB8QCd80jN/
	KSzgai4VmlNFj5jp67Ft+5cfVls9H/Xy81K6lWd2RRwIksKJLaSbFeDOVyuGuo7C2kuLjwlrkG0
	eZmGxoAvqf61irYjsiTOmEvyz4/Tw/PHsfq+EhXQBvDQxYh0/Fl053XXReko8Be8x8LGF9x7HTz
	ejMNz
X-Google-Smtp-Source: AGHT+IGEi4MKEI9JBFB36c5CBko0U78CCln4B+i6RtO5KIi13T3vqVufNQq5WfSsxGegO9zRPslUhSSxSMffTo4fxl0=
X-Received: by 2002:a05:690e:4292:20b0:63e:4677:f2a with SMTP id
 956f58d0204a3-63f435611eemr283983d50.41.1761264770507; Thu, 23 Oct 2025
 17:12:50 -0700 (PDT)
MIME-Version: 1.0
References: <20251023212901.841481-1-skandigraun@gmail.com>
In-Reply-To: <20251023212901.841481-1-skandigraun@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 23 Oct 2025 17:12:39 -0700
X-Gm-Features: AS18NWDb-C_hUHxL1kdXCvO8RFe0ER-M4ZwIsy7qx020dnQ3MMmIq3ObpQNmOgU
Message-ID: <CAMKF1sr-6ed+3o-SnapvsoW7oHv8B5EzQxwrYzEOgtYyuUjWFQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][kirkstone][PATCH] python3-pint: fix ptests
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000000684d0641dc69a7"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Oct 2025 00:13:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120941

--00000000000000684d0641dc69a7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Do we need this on master

On Thu, Oct 23, 2025 at 2:29=E2=80=AFPM Gyorgy Sarvari via lists.openembedd=
ed.org
<skandigraun=3Dgmail.com@lists.openembedded.org> wrote:

> 1. Add missing ptest dependency (pytest-subtest)
>
> 2. The testsuite is installed in both the site-packages and ${PTEST_PATH}
> folders, however some dependencies are only available in the site-package=
s
> folder, so many test cases fail.
> At this point of the branch lifecycle I decided not to refactor the
> recipe, but
> rather to just use the installation in the site-packages dir to run the
> tests (switch to that folder in the run-ptest script)
>
> 3. Fix the run-ptest script to output PASS/FAIL status.
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  meta-python/recipes-devtools/python/python3-pint/run-ptest | 3 ++-
>  meta-python/recipes-devtools/python/python3-pint_0.19.1.bb | 6 +-----
>  2 files changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pint/run-ptest
> b/meta-python/recipes-devtools/python/python3-pint/run-ptest
> index 5cec711696..6abbb5de73 100644
> --- a/meta-python/recipes-devtools/python/python3-pint/run-ptest
> +++ b/meta-python/recipes-devtools/python/python3-pint/run-ptest
> @@ -1,3 +1,4 @@
>  #!/bin/sh
>
> -pytest
> +cd /usr/lib/python3*/site-packages/pint
> +pytest -o log_cli=3Dtrue -o log_cli_level=3DINFO | sed -e 's/\[...%\]//g=
'|
> sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e
> 's/SKIPPED/SKIP/g'| awk '{if ($NF=3D=3D"PASS" || $NF=3D=3D"FAIL" || $NF=
=3D=3D"SKIP" ||
> $NF=3D=3D"XFAIL" || $NF=3D=3D"XPASS"){printf "%s: %s\n", $NF, $0}else{pri=
nt}}'| awk
> '{if ($NF=3D=3D"PASS" || $NF=3D=3D"FAIL" || $NF=3D=3D"SKIP" || $NF=3D=3D"=
XFAIL" ||
> $NF=3D=3D"XPASS") {$NF=3D"";print $0}else{print}}'
> diff --git a/meta-python/recipes-devtools/python/python3-pint_0.19.1.bb
> b/meta-python/recipes-devtools/python/python3-pint_0.19.1.bb
> index e1c471e064..4402908a35 100644
> --- a/meta-python/recipes-devtools/python/python3-pint_0.19.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-pint_0.19.1.bb
> @@ -27,9 +27,5 @@ RDEPENDS:${PN} +=3D " \
>
>  RDEPENDS:${PN}-ptest +=3D " \
>         ${PYTHON_PN}-pytest \
> +        ${PYTHON_PN}-pytest-subtests \
>  "
> -
> -do_install_ptest() {
> -       install -d ${D}${PTEST_PATH}/testsuite
> -       cp -rf ${S}/pint/testsuite/* ${D}${PTEST_PATH}/testsuite/
> -}
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#120940):
> https://lists.openembedded.org/g/openembedded-devel/message/120940
> Mute This Topic: https://lists.openembedded.org/mt/115918828/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000000684d0641dc69a7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Do we need this on master=C2=A0</div><div><br><div class=
=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr=
">On Thu, Oct 23, 2025 at 2:29=E2=80=AFPM Gyorgy Sarvari via <a href=3D"htt=
p://lists.openembedded.org">lists.openembedded.org</a> &lt;skandigraun=3D<a=
 href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembed=
ded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">1. Add missi=
ng ptest dependency (pytest-subtest)<br>
<br>
2. The testsuite is installed in both the site-packages and ${PTEST_PATH}<b=
r>
folders, however some dependencies are only available in the site-packages<=
br>
folder, so many test cases fail.<br>
At this point of the branch lifecycle I decided not to refactor the recipe,=
 but<br>
rather to just use the installation in the site-packages dir to run the<br>
tests (switch to that folder in the run-ptest script)<br>
<br>
3. Fix the run-ptest script to output PASS/FAIL status.<br>
<br>
Signed-off-by: Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@gmail.com" =
target=3D"_blank">skandigraun@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta-python/recipes-devtools/python/python3-pint/run-ptest | 3 ++-<br=
>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-pint_0.=
19.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-pint_0.19.1.bb</a> | =
6 +-----<br>
=C2=A02 files changed, 3 insertions(+), 6 deletions(-)<br>
<br>
diff --git a/meta-python/recipes-devtools/python/python3-pint/run-ptest b/m=
eta-python/recipes-devtools/python/python3-pint/run-ptest<br>
index 5cec711696..6abbb5de73 100644<br>
--- a/meta-python/recipes-devtools/python/python3-pint/run-ptest<br>
+++ b/meta-python/recipes-devtools/python/python3-pint/run-ptest<br>
@@ -1,3 +1,4 @@<br>
=C2=A0#!/bin/sh<br>
<br>
-pytest<br>
+cd /usr/lib/python3*/site-packages/pint<br>
+pytest -o log_cli=3Dtrue -o log_cli_level=3DINFO | sed -e &#39;s/\[...%\]/=
/g&#39;| sed -e &#39;s/PASSED/PASS/g&#39;| sed -e &#39;s/FAILED/FAIL/g&#39;=
|sed -e &#39;s/SKIPPED/SKIP/g&#39;| awk &#39;{if ($NF=3D=3D&quot;PASS&quot;=
 || $NF=3D=3D&quot;FAIL&quot; || $NF=3D=3D&quot;SKIP&quot; || $NF=3D=3D&quo=
t;XFAIL&quot; || $NF=3D=3D&quot;XPASS&quot;){printf &quot;%s: %s\n&quot;, $=
NF, $0}else{print}}&#39;| awk &#39;{if ($NF=3D=3D&quot;PASS&quot; || $NF=3D=
=3D&quot;FAIL&quot; || $NF=3D=3D&quot;SKIP&quot; || $NF=3D=3D&quot;XFAIL&qu=
ot; || $NF=3D=3D&quot;XPASS&quot;) {$NF=3D&quot;&quot;;print $0}else{print}=
}&#39;<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
pint_0.19.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-pint_0.19.1.bb=
</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pint_0=
.19.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-pint_0.19.1.bb</a><b=
r>
index e1c471e064..4402908a35 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-pint_0.=
19.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-pint_0.19.1.bb</a><br=
>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pint_0.=
19.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-pint_0.19.1.bb</a><br=
>
@@ -27,9 +27,5 @@ RDEPENDS:${PN} +=3D &quot; \<br>
<br>
=C2=A0RDEPENDS:${PN}-ptest +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PYTHON_PN}-pytest \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PYTHON_PN}-pytest-subtests \<br>
=C2=A0&quot;<br>
-<br>
-do_install_ptest() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${PTEST_PATH}/testsuite<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -rf ${S}/pint/testsuite/* ${D}${PTEST_PATH}/=
testsuite/<br>
-}<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#120940): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/120940" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/120940</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/115918828/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/115918828/1997914</a><br>
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

--00000000000000684d0641dc69a7--

