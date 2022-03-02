Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B538C433F5
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 01:27:17 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web08.2744.1646184435692673273
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Mar 2022 17:27:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TkXc09ap;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: ticotimo@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id qt6so496505ejb.11
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Mar 2022 17:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WHDrRM3wDY+/lScwFkKpG1XyPVirOQYvZlblzBt77SQ=;
        b=TkXc09apbj83Kzq2SXLQ5U3qLiTjAxIcB2/LEwbpYzv6dZ4jKZqlhMYN9bmOMVWDsV
         0anekuSGuWWc3M9qiccJM6prhpWZztVSNS5LSD0TEYH+Ixw+ULAghQGtCeXMfnM6tHeT
         4hB9zBLK0+rW5pP8xX2UCmKIZ+N95HraAJmha17ybXbWxWztpm2EjH9fbUgyITKEm7Vs
         /YeH7+bGUK+FsQuKhLj7do99N1l/SI9VzkeltYzHxg6c+GRGvRpTy2zyV3DYuQAXmLnK
         nbyKThB1vlgSQE0Q4PQD+h4S+PfD6emr+T4N6edEa6FNyoJjRm5yJ4jqjvxeC4hmG3GB
         WGeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WHDrRM3wDY+/lScwFkKpG1XyPVirOQYvZlblzBt77SQ=;
        b=T5r1cpouBTU+bUXarG4yLeYXsJJaUXH90TV8NmYJTyG2NVIh0FakgwotPDKFK3tU16
         TBVGHgNUxNCd8/acdXtTP2+e+eEL33jjhBJjjEgz0oMGGYHXOi5NYh8fcUe5TZdCg6LU
         BaH1UdAoTXK7BIh7gsXUJET/SGx968TDTCconLfCHESz2Adu9S6KzNmmZT0tPQVUBP+r
         UZqIFeJwmqX9F9QhgZtNTu4E2sxa4BS/BaQKWS1WQfvsoTct2XjQKUKUBB64qsatHxjx
         Ge/mnXn+xqRKNFbqOYRXZ8SxIhzFXGoA12FN9YHVYmmOwdh74sf5JbTV2dPh6PioKrrP
         V6OA==
X-Gm-Message-State: AOAM533KgxS1Fw3Tk4Mx3mBRxjJPm1QA6bUZStwf9XeuQfKQ4nPuYHCV
	eMFSRuBVCxRpjBXypVogrzcOtCV9pWD8+oOmk94=
X-Google-Smtp-Source: 
 ABdhPJyOkc8B3DlVHrW8m8BzinWF3Ba3dgo8z/5y6FSvZqFmiihq8/Xclkr6YBQ0oEGpOjBHyHoM2rkDRd8R47Jxw8g=
X-Received: by 2002:a17:907:7fa2:b0:6d8:2397:42 with SMTP id
 qk34-20020a1709077fa200b006d823970042mr1743856ejc.218.1646184433966; Tue, 01
 Mar 2022 17:27:13 -0800 (PST)
MIME-Version: 1.0
References: <16D7387992424A4A.7393@lists.openembedded.org>
In-Reply-To: <16D7387992424A4A.7393@lists.openembedded.org>
From: Tim Orling <ticotimo@gmail.com>
Date: Tue, 1 Mar 2022 17:27:03 -0800
Message-ID: 
 <CANx9H-BPrFaFEr-_5yYjVxf4_Hsk5j-mLoAE9oghZ271d7O_+w@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] ptyhon3-ipy: drop recipe
To: ticotimo@gmail.com
Cc: Tim Orling <tim.orling@konsulko.com>,
 openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000006be37305d9322e51"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Mar 2022 01:27:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95676

--0000000000006be37305d9322e51
Content-Type: text/plain; charset="UTF-8"

Typo in subject line :(

On Fri, Feb 25, 2022 at 7:31 PM Tim Orling via lists.openembedded.org
<ticotimo=gmail.com@lists.openembedded.org> wrote:

> Does not build with bdist_wheel. If you need this package please work
> with upstream to update to PEP-517 packaging.
>
> Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> ---
>  .../packagegroups/packagegroup-meta-python.bb |  2 --
>  .../python/python3-ipy/run-ptest              |  3 --
>  .../python/python3-ipy_1.01.bb                | 32 -------------------
>  3 files changed, 37 deletions(-)
>  delete mode 100644
> meta-python/recipes-devtools/python/python3-ipy/run-ptest
>  delete mode 100644 meta-python/recipes-devtools/python/
> python3-ipy_1.01.bb
>
> diff --git a/meta-python/recipes-core/packagegroups/
> packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/
> packagegroup-meta-python.bb
> index 2b20937f78..ae9c86e7fb 100644
> --- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> +++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> @@ -190,7 +190,6 @@ RDEPENDS:packagegroup-meta-python3 = "\
>      python3-intelhex \
>      python3-intervals \
>      python3-ipaddress \
> -    python3-ipy \
>      python3-ipython \
>      python3-ipython-genutils \
>      python3-iso3166 \
> @@ -500,7 +499,6 @@ RDEPENDS:packagegroup-meta-python3-ptest = "\
>      python3-html2text-ptest \
>      python3-inflection-ptest \
>      python3-intervals-ptest \
> -    python3-ipy-ptest \
>      python3-iso3166-ptest \
>      python3-jdcal-ptest \
>      python3-jinja2-ptest \
> diff --git a/meta-python/recipes-devtools/python/python3-ipy/run-ptest
> b/meta-python/recipes-devtools/python/python3-ipy/run-ptest
> deleted file mode 100644
> index b63c4de0d9..0000000000
> --- a/meta-python/recipes-devtools/python/python3-ipy/run-ptest
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -#!/bin/sh
> -
> -pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'|
> sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e
> 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" ||
> $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk
> '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" ||
> $NF=="XPASS") {$NF="";print $0}else{print}}'
> diff --git a/meta-python/recipes-devtools/python/python3-ipy_1.01.bb
> b/meta-python/recipes-devtools/python/python3-ipy_1.01.bb
> deleted file mode 100644
> index 8b39679e45..0000000000
> --- a/meta-python/recipes-devtools/python/python3-ipy_1.01.bb
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -SUMMARY = "IPy - class and tools for handling of IPv4 and IPv6 addresses
> and networks"
> -DESCRIPTION = "IPy is a Python module for handling IPv4 and IPv6
> Addresses and Networks \
> -in a fashion similar to perl's Net::IP and friends. The IP class allows \
> -a comfortable parsing and handling for most notations in use for IPv4 \
> -and IPv6 Addresses and Networks."
> -SECTION = "devel/python"
> -HOMEPAGE = "https://github.com/autocracy/python-ipy"
> -
> -LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=848d24919845901b4f48bae5f13252e6"
> -
> -SRC_URI[md5sum] = "d6cf83e7f418ebbd23324ba1c658b907"
> -SRC_URI[sha256sum] =
> "edeca741dea2d54aca568fa23740288c3fe86c0f3ea700344571e9ef14a7cc1a"
> -
> -inherit pypi setuptools3 ptest
> -
> -SRC_URI += " \
> -       file://run-ptest \
> -"
> -
> -RDEPENDS:${PN}-ptest += " \
> -       ${PYTHON_PN}-pytest \
> -"
> -
> -do_install_ptest() {
> -       install -d ${D}${PTEST_PATH}/test/
> -       cp -rf ${S}/test/* ${D}${PTEST_PATH}/test
> -}
> -
> -PYPI_PACKAGE = "IPy"
> -
> -BBCLASSEXTEND = "native"
> --
> 2.30.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95533):
> https://lists.openembedded.org/g/openembedded-devel/message/95533
> Mute This Topic: https://lists.openembedded.org/mt/89404377/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000006be37305d9322e51
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Typo in subject line :(</div><div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Feb 25, 2022 at 7:31 =
PM Tim Orling via <a href=3D"http://lists.openembedded.org">lists.openembed=
ded.org</a> &lt;ticotimo=3D<a href=3D"mailto:gmail.com@lists.openembedded.o=
rg">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">Does not build with bdist_wheel. If you need this package =
please work<br>
with upstream to update to PEP-517 packaging.<br>
<br>
Signed-off-by: Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.com" ta=
rget=3D"_blank">tim.orling@konsulko.com</a>&gt;<br>
---<br>
=C2=A0.../packagegroups/<a href=3D"http://packagegroup-meta-python.bb" rel=
=3D"noreferrer" target=3D"_blank">packagegroup-meta-python.bb</a> |=C2=A0 2=
 --<br>
=C2=A0.../python/python3-ipy/run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 3 --<br>
=C2=A0.../python/<a href=3D"http://python3-ipy_1.01.bb" rel=3D"noreferrer" =
target=3D"_blank">python3-ipy_1.01.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 | 32 -------------------<br>
=C2=A03 files changed, 37 deletions(-)<br>
=C2=A0delete mode 100644 meta-python/recipes-devtools/python/python3-ipy/ru=
n-ptest<br>
=C2=A0delete mode 100644 meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-ipy_1.01.bb" rel=3D"noreferrer" target=3D"_blank">python3-ipy_1=
.01.bb</a><br>
<br>
diff --git a/meta-python/recipes-core/packagegroups/<a href=3D"http://packa=
gegroup-meta-python.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-m=
eta-python.bb</a> b/meta-python/recipes-core/packagegroups/<a href=3D"http:=
//packagegroup-meta-python.bb" rel=3D"noreferrer" target=3D"_blank">package=
group-meta-python.bb</a><br>
index 2b20937f78..ae9c86e7fb 100644<br>
--- a/meta-python/recipes-core/packagegroups/<a href=3D"http://packagegroup=
-meta-python.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-meta-pyt=
hon.bb</a><br>
+++ b/meta-python/recipes-core/packagegroups/<a href=3D"http://packagegroup=
-meta-python.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-meta-pyt=
hon.bb</a><br>
@@ -190,7 +190,6 @@ RDEPENDS:packagegroup-meta-python3 =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0python3-intelhex \<br>
=C2=A0 =C2=A0 =C2=A0python3-intervals \<br>
=C2=A0 =C2=A0 =C2=A0python3-ipaddress \<br>
-=C2=A0 =C2=A0 python3-ipy \<br>
=C2=A0 =C2=A0 =C2=A0python3-ipython \<br>
=C2=A0 =C2=A0 =C2=A0python3-ipython-genutils \<br>
=C2=A0 =C2=A0 =C2=A0python3-iso3166 \<br>
@@ -500,7 +499,6 @@ RDEPENDS:packagegroup-meta-python3-ptest =3D &quot;\<br=
>
=C2=A0 =C2=A0 =C2=A0python3-html2text-ptest \<br>
=C2=A0 =C2=A0 =C2=A0python3-inflection-ptest \<br>
=C2=A0 =C2=A0 =C2=A0python3-intervals-ptest \<br>
-=C2=A0 =C2=A0 python3-ipy-ptest \<br>
=C2=A0 =C2=A0 =C2=A0python3-iso3166-ptest \<br>
=C2=A0 =C2=A0 =C2=A0python3-jdcal-ptest \<br>
=C2=A0 =C2=A0 =C2=A0python3-jinja2-ptest \<br>
diff --git a/meta-python/recipes-devtools/python/python3-ipy/run-ptest b/me=
ta-python/recipes-devtools/python/python3-ipy/run-ptest<br>
deleted file mode 100644<br>
index b63c4de0d9..0000000000<br>
--- a/meta-python/recipes-devtools/python/python3-ipy/run-ptest<br>
+++ /dev/null<br>
@@ -1,3 +0,0 @@<br>
-#!/bin/sh<br>
-<br>
-pytest -o log_cli=3Dtrue -o log_cli_level=3DINFO | sed -e &#39;s/\[...%\]/=
/g&#39;| sed -e &#39;s/PASSED/PASS/g&#39;| sed -e &#39;s/FAILED/FAIL/g&#39;=
|sed -e &#39;s/SKIPPED/SKIP/g&#39;| awk &#39;{if ($NF=3D=3D&quot;PASS&quot;=
 || $NF=3D=3D&quot;FAIL&quot; || $NF=3D=3D&quot;SKIP&quot; || $NF=3D=3D&quo=
t;XFAIL&quot; || $NF=3D=3D&quot;XPASS&quot;){printf &quot;%s: %s\n&quot;, $=
NF, $0}else{print}}&#39;| awk &#39;{if ($NF=3D=3D&quot;PASS&quot; || $NF=3D=
=3D&quot;FAIL&quot; || $NF=3D=3D&quot;SKIP&quot; || $NF=3D=3D&quot;XFAIL&qu=
ot; || $NF=3D=3D&quot;XPASS&quot;) {$NF=3D&quot;&quot;;print $0}else{print}=
}&#39;<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
ipy_1.01.bb" rel=3D"noreferrer" target=3D"_blank">python3-ipy_1.01.bb</a> b=
/meta-python/recipes-devtools/python/<a href=3D"http://python3-ipy_1.01.bb"=
 rel=3D"noreferrer" target=3D"_blank">python3-ipy_1.01.bb</a><br>
deleted file mode 100644<br>
index 8b39679e45..0000000000<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-ipy_1.0=
1.bb" rel=3D"noreferrer" target=3D"_blank">python3-ipy_1.01.bb</a><br>
+++ /dev/null<br>
@@ -1,32 +0,0 @@<br>
-SUMMARY =3D &quot;IPy - class and tools for handling of IPv4 and IPv6 addr=
esses and networks&quot;<br>
-DESCRIPTION =3D &quot;IPy is a Python module for handling IPv4 and IPv6 Ad=
dresses and Networks \<br>
-in a fashion similar to perl&#39;s Net::IP and friends. The IP class allow=
s \<br>
-a comfortable parsing and handling for most notations in use for IPv4 \<br=
>
-and IPv6 Addresses and Networks.&quot;<br>
-SECTION =3D &quot;devel/python&quot;<br>
-HOMEPAGE =3D &quot;<a href=3D"https://github.com/autocracy/python-ipy" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/autocracy/python-ipy</=
a>&quot;<br>
-<br>
-LICENSE =3D &quot;BSD-3-Clause&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D848d24919845901b4f48bae5f1=
3252e6&quot;<br>
-<br>
-SRC_URI[md5sum] =3D &quot;d6cf83e7f418ebbd23324ba1c658b907&quot;<br>
-SRC_URI[sha256sum] =3D &quot;edeca741dea2d54aca568fa23740288c3fe86c0f3ea70=
0344571e9ef14a7cc1a&quot;<br>
-<br>
-inherit pypi setuptools3 ptest<br>
-<br>
-SRC_URI +=3D &quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
-&quot;<br>
-<br>
-RDEPENDS:${PN}-ptest +=3D &quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0${PYTHON_PN}-pytest \<br>
-&quot;<br>
-<br>
-do_install_ptest() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${PTEST_PATH}/test/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -rf ${S}/test/* ${D}${PTEST_PATH}/test<br>
-}<br>
-<br>
-PYPI_PACKAGE =3D &quot;IPy&quot;<br>
-<br>
-BBCLASSEXTEND =3D &quot;native&quot;<br>
-- <br>
2.30.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#95533): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/95533" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/95533</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/89404377/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
89404377/924729</a><br>
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

--0000000000006be37305d9322e51--

