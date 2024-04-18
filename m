Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7391C4345F
	for <webhook@archiver.kernel.org>; Thu, 18 Apr 2024 14:28:43 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web11.14555.1713450520630784269
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Apr 2024 07:28:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D6iTzItu;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: ticotimo@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2d715638540so12276381fa.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Apr 2024 07:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713450519; x=1714055319; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=u9BVkD/sLx9B5azM4wAjUPr2cb1b96OroG4qQAqFYmM=;
        b=D6iTzItuGmg6u1xe/FGF/pu3O7tCaz7+Zy2YKP5jbHz76A1il7xbb8LXv5FWtcaio5
         VNnwo/mJIcjgWWV9zKAC7a5uCIRmQ6uhBj/FIM7BsTKmoci5Sy+A5uRiO6vKt55suodd
         771BQogMOVrsDl7x02sekVQpEmpa2Dkp0Tr2i/ua2IOj5ldsgM6OSjFcVl5iY7bZRIHz
         pnso/2e5YpOLMnRJaVVqsTFUgRWt4/OYQ0bORwVo9PzR1pQosPSRQUpKAmebbjxiTAWZ
         pzF9PK4G9obwpgE+iy94IyuilBsvvphDwakw6GqM29LFXZUl4hAjKt2cIoAy/xHsv71U
         C5tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713450519; x=1714055319;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u9BVkD/sLx9B5azM4wAjUPr2cb1b96OroG4qQAqFYmM=;
        b=DoZks9NZmh2BMf6GO3UEiecIhMrxg7meF/QKGhfUL6UEHj/Qdq1jEDPgC808jHRewJ
         3eXCEYmCa7yZXkrdcVDb8Wk+mrgrzoxyjsFUqe94HnhoTqkdpM+V5hoa2dLpaKkbBJij
         bRzAu8c9FIDt56KZc8KFg8Z9KPuktTr9ju963+xT1TCFvsEg9xVG8tAirUA3Oq6so/o9
         GlFN89eVHNMEBltpmpNbdngmZVQsvI/75Et7hgQCeWzlJvIwO/JMyMB4ctQZBScIi/QX
         o0LAX3p7qO2YAHj483PEhSyl5H0X1eS86XfSqv8KtexvP7TzlDJOvhSorzwd5zCmgX/p
         cvkA==
X-Gm-Message-State: AOJu0YwiEXMNyMXotcM9lK6fRM3OSaa4UiEX0lO7qu6iKsQaCycC64eF
	KfChgrxBOSPAfyHI+oVIcSm79vPxa/d4WjnkTf9fNuaEUZthC/thg25s+6mQZ2LCCc5oRVkDJuu
	kWzvmxFyNZzhd4PXHv4aZIoqo2sA=
X-Google-Smtp-Source: AGHT+IEX+5xeW1Z1cku3Z8JQPfvgwhMKVil2xpAKgwPVYovI4frJaI4UMeZ0nLEZqQGoA2HA38mfsNtqpPA4uBWt5ME=
X-Received: by 2002:a2e:b550:0:b0:2d8:da4c:5909 with SMTP id
 a16-20020a2eb550000000b002d8da4c5909mr1598826ljn.51.1713450518210; Thu, 18
 Apr 2024 07:28:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240418090122.3806-1-gudnimar@noxmedical.com>
In-Reply-To: <20240418090122.3806-1-gudnimar@noxmedical.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 18 Apr 2024 07:28:26 -0700
Message-ID: <CANx9H-DLauDMx75MsCqqm9LRSOm=mJ0RYcFTC2QFXNAgH04Zfw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-twisted: upgrade 22.10.0 -> 24.3.0
To: gudnimar@noxmedical.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000007a704c06165fc93a"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Apr 2024 14:28:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110053

--0000000000007a704c06165fc93a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 18, 2024 at 2:01=E2=80=AFAM Gu=C3=B0ni M=C3=A1r Gilbert via lis=
ts.openembedded.org
<gudnimar=3Dnoxmedical.com@lists.openembedded.org> wrote:

> Changelogs between 22.10.0 and 24.3.0 can be found here:
>
> https://github.com/twisted/twisted/releases/tag/twisted-24.3.0
> https://github.com/twisted/twisted/releases/tag/twisted-23.10.0
> https://github.com/twisted/twisted/releases/tag/twisted-23.8.0
>
> Summary of changes relevant for the Yocto build:
> - Brings official support for Python 3.11 and 3.12, only Python 3.8 and
> above supported.
> - python3-twisted-conch: python3-pyasn1 is no longer a runtime dependency
> (23.8.0)
> - PYPI_PACKAGE name was changed from 'Twisted' to 'twisted' to make
> fetching work
>
> Signed-off-by: Gu=C3=B0ni M=C3=A1r Gilbert <gudnimar@noxmedical.com>
> ---
> ...twisted_22.10.0.bb =3D> python3-twisted_24.3.0.bb} | 13 ++++---------
> 1 file changed, 4 insertions(+), 9 deletions(-)
> rename meta-python/recipes-devtools/python/{python3-twisted_22.10.0.bb =
=3D>
> python3-twisted_24.3.0.bb} (93%)
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-twisted_22.10.0.bb b/meta-python/recipes-devtools/python/
> python3-twisted_24.3.0.bb
> similarity index 93%
> rename from meta-python/recipes-devtools/python/python3-twisted_22.10.0.b=
b
> rename to meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb
> index 20b9ce254..be2246623 100644
> --- a/meta-python/recipes-devtools/python/python3-twisted_22.10.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb
> @@ -4,11 +4,11 @@ Twisted supports TCP, UDP, SSL/TLS, multicast, Unix
> sockets, a large number of p
> HOMEPAGE =3D "http://www.twistedmatrix.com"
>
> LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0f8d67f84b6e178c92d471011b224=
5fc"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc1c5d2c2493b848f83864bdedd67b=
bf5"
>
> -SRC_URI[sha256sum] =3D
> "32acbd40a94f5f46e7b42c109bfae2b302250945561783a8b7a059048f2d4d31"
> +SRC_URI[sha256sum] =3D
> "6b38b6ece7296b5e122c9eb17da2eeab3d98a198f50ca9efd00fb03e5b4fd4ae"
>
> -PYPI_PACKAGE =3D "Twisted"
> +PYPI_PACKAGE =3D "twisted"
>

This is the default, so not explicitly needed. The capitalized name was
previously needed to match the tarball file name.


>
> inherit pypi python_setuptools_build_meta
>
> @@ -65,7 +65,7 @@ RDEPENDS:${PN}-core =3D "python3-appdirs \
> python3-zopeinterface \
> "
> RDEPENDS:${PN}-test =3D "${PN}"
> -RDEPENDS:${PN}-conch =3D "${PN}-core ${PN}-protocols python3-bcrypt
> python3-cryptography python3-pyasn1 python3-pickle"
> +RDEPENDS:${PN}-conch =3D "${PN}-core ${PN}-protocols python3-bcrypt
> python3-cryptography python3-pickle"
> RDEPENDS:${PN}-mail =3D "${PN}-core ${PN}-protocols"
> RDEPENDS:${PN}-names =3D "${PN}-core"
> RDEPENDS:${PN}-news =3D "${PN}-core ${PN}-protocols"
> @@ -75,8 +75,6 @@ RDEPENDS:${PN}-words +=3D "${PN}-core"
> RDEPENDS:${PN}-flow +=3D "${PN}-core"
> RDEPENDS:${PN}-pair +=3D "${PN}-core"
>
> -FILES:${PN} =3D
> "${PYTHON_SITEPACKAGES_DIR}/${PYPI_PACKAGE}-${PV}.dist-info/*"
> -
> FILES:${PN}-test =3D " \
> ${PYTHON_SITEPACKAGES_DIR}/twisted/test \
> ${PYTHON_SITEPACKAGES_DIR}/twisted/*/test \
> @@ -85,8 +83,6 @@ FILES:${PN}-test =3D " \
>
> FILES:${PN}-protocols =3D " \
> ${PYTHON_SITEPACKAGES_DIR}/twisted/protocols/*.py* \
> - ${PYTHON_SITEPACKAGES_DIR}/twisted/protocols/gps/ \
> - ${PYTHON_SITEPACKAGES_DIR}/twisted/protocols/mice/ \
> ${PYTHON_SITEPACKAGES_DIR}/twisted/protocols/haproxy \
> ${PYTHON_SITEPACKAGES_DIR}/twisted/protocols/__pycache__/*pyc \
> "
> @@ -124,7 +120,6 @@ FILES:${PN}-core =3D " \
> ${PYTHON_SITEPACKAGES_DIR}/twisted/*.py* \
> ${PYTHON_SITEPACKAGES_DIR}/twisted/python/*.py* \
> ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/*.py* \
> - ${PYTHON_SITEPACKAGES_DIR}/Twisted*egg-info \
> ${PYTHON_SITEPACKAGES_DIR}/twisted/logger \
> ${PYTHON_SITEPACKAGES_DIR}/twisted/_threads \
> ${PYTHON_SITEPACKAGES_DIR}/twisted/positioning \
> --
> 2.34.1
>
>
> Warning: Copyright Nox Health. This communication is confidential and may
> contain privileged information. By the use of email over the Internet or
> other communication systems, Nox Health is not waiving either
> confidentiality of, or legal privilege in, the content of the email and o=
f
> any attachments. If the recipient of this message is not the intended
> addressee, please call Nox Health immediately by calling (+1) 888.505.028=
0
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110049):
> https://lists.openembedded.org/g/openembedded-devel/message/110049
> Mute This Topic: https://lists.openembedded.org/mt/105594516/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000007a704c06165fc93a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Apr 18, 2024 at 2:01=E2=80=AFAM Gu=C3=B0ni M=C3=A1r=
 Gilbert via <a href=3D"http://lists.openembedded.org">lists.openembedded.o=
rg</a> &lt;gudnimar=3D<a href=3D"mailto:noxmedical.com@lists.openembedded.o=
rg">noxmedical.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-widt=
h:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,20=
4,204)"><div>Changelogs between 22.10.0 and 24.3.0 can be found here:<br>
<br>
<a href=3D"https://github.com/twisted/twisted/releases/tag/twisted-24.3.0" =
target=3D"_blank">https://github.com/twisted/twisted/releases/tag/twisted-2=
4.3.0</a><br>
<a href=3D"https://github.com/twisted/twisted/releases/tag/twisted-23.10.0"=
 target=3D"_blank">https://github.com/twisted/twisted/releases/tag/twisted-=
23.10.0</a><br>
<a href=3D"https://github.com/twisted/twisted/releases/tag/twisted-23.8.0" =
target=3D"_blank">https://github.com/twisted/twisted/releases/tag/twisted-2=
3.8.0</a><br>
<br>
Summary of changes relevant for the Yocto build:<br>
- Brings official support for Python 3.11 and 3.12, only Python 3.8 and abo=
ve supported.<br>
- python3-twisted-conch: python3-pyasn1 is no longer a runtime dependency (=
23.8.0)<br>
- PYPI_PACKAGE name was changed from &#39;Twisted&#39; to &#39;twisted&#39;=
 to make fetching work<br>
<br>
Signed-off-by: Gu=C3=B0ni M=C3=A1r Gilbert &lt;<a href=3D"mailto:gudnimar@n=
oxmedical.com" target=3D"_blank">gudnimar@noxmedical.com</a>&gt;<br>
---<br>
 ...<a href=3D"http://twisted_22.10.0.bb" target=3D"_blank">twisted_22.10.0=
.bb</a> =3D&gt; <a href=3D"http://python3-twisted_24.3.0.bb" target=3D"_bla=
nk">python3-twisted_24.3.0.bb</a>} | 13 ++++---------<br>
 1 file changed, 4 insertions(+), 9 deletions(-)<br>
 rename meta-python/recipes-devtools/python/{<a href=3D"http://python3-twis=
ted_22.10.0.bb" target=3D"_blank">python3-twisted_22.10.0.bb</a> =3D&gt; <a=
 href=3D"http://python3-twisted_24.3.0.bb" target=3D"_blank">python3-twiste=
d_24.3.0.bb</a>} (93%)<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
twisted_22.10.0.bb" target=3D"_blank">python3-twisted_22.10.0.bb</a> b/meta=
-python/recipes-devtools/python/<a href=3D"http://python3-twisted_24.3.0.bb=
" target=3D"_blank">python3-twisted_24.3.0.bb</a><br>
similarity index 93%<br>
rename from meta-python/recipes-devtools/python/<a href=3D"http://python3-t=
wisted_22.10.0.bb" target=3D"_blank">python3-twisted_22.10.0.bb</a><br>
rename to meta-python/recipes-devtools/python/<a href=3D"http://python3-twi=
sted_24.3.0.bb" target=3D"_blank">python3-twisted_24.3.0.bb</a><br>
index 20b9ce254..be2246623 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-twisted=
_22.10.0.bb" target=3D"_blank">python3-twisted_22.10.0.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-twisted=
_24.3.0.bb" target=3D"_blank">python3-twisted_24.3.0.bb</a><br>
@@ -4,11 +4,11 @@ Twisted supports TCP, UDP, SSL/TLS, multicast, Unix socke=
ts, a large number of p<br>
 HOMEPAGE =3D &quot;<a href=3D"http://www.twistedmatrix.com" target=3D"_bla=
nk">http://www.twistedmatrix.com</a>&quot;<br>
 <br>
 LICENSE =3D &quot;MIT&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D0f8d67f84b6e178c92d471011b=
2245fc&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dc1c5d2c2493b848f83864bdedd=
67bbf5&quot;<br>
 <br>
-SRC_URI[sha256sum] =3D &quot;32acbd40a94f5f46e7b42c109bfae2b30225094556178=
3a8b7a059048f2d4d31&quot;<br>
+SRC_URI[sha256sum] =3D &quot;6b38b6ece7296b5e122c9eb17da2eeab3d98a198f50ca=
9efd00fb03e5b4fd4ae&quot;<br>
 <br>
-PYPI_PACKAGE =3D &quot;Twisted&quot;<br>
+PYPI_PACKAGE =3D &quot;twisted&quot;</div></blockquote><div dir=3D"auto"><=
br></div><div dir=3D"auto">This is the default, so not explicitly needed. T=
he capitalized name was previously needed to match the tarball file name.</=
div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padd=
ing-left:1ex;border-left-color:rgb(204,204,204)"><div dir=3D"auto"><br>
 <br>
 inherit pypi python_setuptools_build_meta<br>
 <br>
@@ -65,7 +65,7 @@ RDEPENDS:${PN}-core =3D &quot;python3-appdirs \<br>
                        python3-zopeinterface \<br>
 &quot;<br>
 RDEPENDS:${PN}-test =3D &quot;${PN}&quot;<br>
-RDEPENDS:${PN}-conch =3D &quot;${PN}-core ${PN}-protocols python3-bcrypt p=
ython3-cryptography python3-pyasn1 python3-pickle&quot;<br>
+RDEPENDS:${PN}-conch =3D &quot;${PN}-core ${PN}-protocols python3-bcrypt p=
ython3-cryptography python3-pickle&quot;<br>
 RDEPENDS:${PN}-mail =3D &quot;${PN}-core ${PN}-protocols&quot;<br>
 RDEPENDS:${PN}-names =3D &quot;${PN}-core&quot;<br>
 RDEPENDS:${PN}-news =3D &quot;${PN}-core ${PN}-protocols&quot;<br>
@@ -75,8 +75,6 @@ RDEPENDS:${PN}-words +=3D &quot;${PN}-core&quot;<br>
 RDEPENDS:${PN}-flow +=3D &quot;${PN}-core&quot;<br>
 RDEPENDS:${PN}-pair +=3D &quot;${PN}-core&quot;<br>
 <br>
-FILES:${PN} =3D &quot;${PYTHON_SITEPACKAGES_DIR}/${PYPI_PACKAGE}-${PV}.dis=
t-info/*&quot;<br>
-<br>
 FILES:${PN}-test =3D &quot; \<br>
     ${PYTHON_SITEPACKAGES_DIR}/twisted/test \<br>
     ${PYTHON_SITEPACKAGES_DIR}/twisted/*/test \<br>
@@ -85,8 +83,6 @@ FILES:${PN}-test =3D &quot; \<br>
 <br>
 FILES:${PN}-protocols =3D &quot; \<br>
     ${PYTHON_SITEPACKAGES_DIR}/twisted/protocols/*.py* \<br>
-    ${PYTHON_SITEPACKAGES_DIR}/twisted/protocols/gps/ \<br>
-    ${PYTHON_SITEPACKAGES_DIR}/twisted/protocols/mice/ \<br>
     ${PYTHON_SITEPACKAGES_DIR}/twisted/protocols/haproxy \<br>
     ${PYTHON_SITEPACKAGES_DIR}/twisted/protocols/__pycache__/*pyc \<br>
 &quot;<br>
@@ -124,7 +120,6 @@ FILES:${PN}-core =3D &quot; \<br>
     ${PYTHON_SITEPACKAGES_DIR}/twisted/*.py* \<br>
     ${PYTHON_SITEPACKAGES_DIR}/twisted/python/*.py* \<br>
     ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/*.py* \<br>
-    ${PYTHON_SITEPACKAGES_DIR}/Twisted*egg-info \<br>
     ${PYTHON_SITEPACKAGES_DIR}/twisted/logger \<br>
     ${PYTHON_SITEPACKAGES_DIR}/twisted/_threads \<br>
     ${PYTHON_SITEPACKAGES_DIR}/twisted/positioning \<br>
-- <br>
2.34.1<br>

<br><br><p style=3D"font-family:Verdana;font-size:10pt;color:rgb(102,102,10=
2)"></p><p style=3D"font-family:Verdana;font-size:8pt;color:rgb(102,102,102=
)">Warning:  Copyright Nox Health.  This communication is confidential and =
may contain privileged information.  By the use of email over the Internet =
or other communication systems, Nox Health is not waiving either confidenti=
ality of, or legal privilege in, the content of the email and of any attach=
ments.  If the recipient of this message is not the intended addressee, ple=
ase call Nox Health immediately by calling (+1) 888.505.0280</p></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#110049): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/110049" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/110049</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/105594516/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/105594516/924729</a><br>
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

--0000000000007a704c06165fc93a--

