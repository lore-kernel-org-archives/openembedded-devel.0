Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 603EEC3ABB6
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 21:26:00 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.62414.1746480359351200690
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 May 2025 14:25:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=BqFxq+RD;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-39ee682e0ddso3313331f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 May 2025 14:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1746480358; x=1747085158; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nLWesn83Pz7V9BgF/MN4JhgdWp+7LBBdItqgt9Ft3eQ=;
        b=BqFxq+RD3UUCw1YHkO0zikvc3g5S3cw+ZgF58FZjRLuemdLaugHHxg6taBDmAJn7nM
         /fy0cF2wHnjcYdUEqvmqrIxFVLnAeCfzmOfMsI90tgL80h5FmORxe3AFIFTJQ57+Db3u
         BW9hh8DR4W5gdSlaZjid4FieFfYR1FK9JtLd0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746480358; x=1747085158;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nLWesn83Pz7V9BgF/MN4JhgdWp+7LBBdItqgt9Ft3eQ=;
        b=e/mxCzv22qTEH2aNVdxKZgndRAM0arn6fhJSAImeshf00S8hZSnxHMaP9XYd78mQtk
         fNn720xelC4JBvBbou9kQAQTq8HVUR1cCYyEI4lI0R8EN+dVqd6qIlY/mTUImUSbLo2P
         0FCY5SzmXSxzoiC78yZoPNy53I/Axe73LZ+DY2l18vpmD2bGOzkJsknNq96Qjmk+PYqc
         AtZbah1kwPIn5r0sd47DzRCLjr0vQXY7jjTrRTV+83wVrLPzeu06BT+yCw9iPeSuuGf/
         ThrOCruLKGWXh1VkYTAPQtpdlp33llueInRRkjfanp+ItTV8GM8/HfreUfJpJo+VyzDd
         vnrA==
X-Gm-Message-State: AOJu0Yw76ZSZHwNgXOIOaOzbRUUNebkY/O+816bEjM8Zh6D+hjqHJjsH
	xgB516YnmBq2znRUdsNgoZtcTzqMBEw/EoQxY5djTnezzRRbqj1UHIbpTnAHqRnd8Zqeia0qdV9
	qNU8PmcCrHoFPFh/VB8bPyxLRrpPbX330eKnkkw==
X-Gm-Gg: ASbGncvlZsAYzBqRzHNB7iNbaPITEFeOkIgWVvv/XFzNfZoFKMmBPlILb5aSwEeRdNi
	WmimVGB64DS7UOYuqutwIggcGyEuhkWBOhjIAz0POt4jA7LN9xyIcpqc6N2cJ+kx2atYbjsc7Hc
	LfAUJxCnT5Gkfmswg5Dk+2XpzELlf09FfDyAfKfmAKoEmZuZpXYrhrYBVxAteOMMZtHws=
X-Google-Smtp-Source: AGHT+IFcstYJx4d8RF8hUs0c8ApHJa0SxEvwOP7Tb2xG/4e1p+7vN+TG7MecgLtTEPuWyfZwY70tZ0mXRRbylDYzDrE=
X-Received: by 2002:a05:6000:2088:b0:3a0:6f92:ef7c with SMTP id
 ffacd0b85a97d-3a0ac0d91bemr337253f8f.17.1746480357614; Mon, 05 May 2025
 14:25:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250417123231.3063208-1-leon.anavi@konsulko.com> <20250417123231.3063208-2-leon.anavi@konsulko.com>
In-Reply-To: <20250417123231.3063208-2-leon.anavi@konsulko.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Mon, 5 May 2025 23:25:31 +0200
X-Gm-Features: ATxdqUE4W1NtgcbhOxUc9ansMbkwUzn0RtDcw5TUU9UhazrhWudH8-Ih_XvdmD4
Message-ID: <CAMSfU+7PNpvh15yrpQnW-BGqcR8RD2Lb13=T63C8t9iJodE2Fw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 2/6] python3-lazy-object-proxy: Upgrade
 1.10.0 -> 1.11.0
To: Leon Anavi <leon.anavi@konsulko.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000052b42706346a25a2"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 May 2025 21:26:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117331

--00000000000052b42706346a25a2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Le jeu. 17 avr. 2025 =C3=A0 14:32, Leon Anavi via lists.openembedded.org
<leon.anavi=3Dkonsulko.com@lists.openembedded.org> a =C3=A9crit :

> Upgrade to release 1.11.0:
>
> - Added Python 3.13 wheels.
> - Added support for __format__.
> - Dropped support for Python 3.8.
>
> License-Update: Updated copyright years
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>

This update may have broken reproducibility : See direct links:
*
https://autobuilder.yoctoproject.org/valkyrie/#/builders/87/builds/43/steps=
/40/logs/stdio
line 258
* diffoscope:
https://valkyrie.yocto.io/pub/repro-fail-openembedded/meta-python/oe-reprod=
ucible-20250503-7l8h_9ni/packages/diff-html/#reproducibleA-tmp---reproducib=
leA-tmp-deploy---reproducibleA-tmp-deploy-rpm---reproducibleA-tmp-deploy-rp=
m-core-_-----reproducibleA-tmp-deploy-rpm-core-_---python--lazy-object-prox=
y--.--.--r-.core-_--.rpm---content---content-content---.-usr-lib-python-.--=
-site-packages-lazy_object_proxy-__pycache__-_version.cpython----.pyc

This is weird, sstate contains a 1.10.0 version file but the rest of the
package is identical.
Any idea how that could have happened?


> ---
>  ...-proxy_1.10.0.bb =3D> python3-lazy-object-proxy_1.11.0.bb} | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>  rename meta-python/recipes-devtools/python/{
> python3-lazy-object-proxy_1.10.0.bb =3D> python3-lazy-object-proxy_1.11.0=
.bb}
> (55%)
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-lazy-object-proxy_1.10.0.bb b/meta-python/recipes-devtools/python=
/
> python3-lazy-object-proxy_1.11.0.bb
> similarity index 55%
> rename from meta-python/recipes-devtools/python/
> python3-lazy-object-proxy_1.10.0.bb
> rename to meta-python/recipes-devtools/python/
> python3-lazy-object-proxy_1.11.0.bb
> index 195f94705b..ebf9f84951 100644
> --- a/meta-python/recipes-devtools/python/
> python3-lazy-object-proxy_1.10.0.bb
> +++ b/meta-python/recipes-devtools/python/
> python3-lazy-object-proxy_1.11.0.bb
> @@ -2,10 +2,12 @@ SUMMARY =3D "A fast and thorough lazy object proxy"
>  HOMEPAGE =3D "https://python-lazy-object-proxy.readthedocs.io/"
>  LICENSE =3D "BSD-2-Clause"
>  SECTION =3D "devel/python"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd606e94f56c21c8e0cdde0b622dcd=
f57"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db44e35194fc96f303ff4302a2a575=
9dd"
>
>  DEPENDS +=3D "python3-setuptools-scm-native"
>
> -SRC_URI[sha256sum] =3D
> "78247b6d45f43a52ef35c25b5581459e85117225408a4128a3daf8bf9648ac69"
> +SRC_URI[sha256sum] =3D
> "18874411864c9fbbbaa47f9fc1dd7aea754c86cfde21278ef427639d1dd78e9c"
> +
> +PYPI_PACKAGE =3D "lazy_object_proxy"
>
>  inherit pypi python_setuptools_build_meta
> --
> 2.39.5
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116932):
> https://lists.openembedded.org/g/openembedded-devel/message/116932
> Mute This Topic: https://lists.openembedded.org/mt/112312248/4316185
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--00000000000052b42706346a25a2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><br><div class=3D"gmail_quote gmail_quote=
_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0jeu. 17 avr. 2025=
 =C3=A0=C2=A014:32, Leon Anavi via <a href=3D"http://lists.openembedded.org=
">lists.openembedded.org</a> &lt;leon.anavi=3D<a href=3D"mailto:konsulko.co=
m@lists.openembedded.org">konsulko.com@lists.openembedded.org</a>&gt; a =C3=
=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">U=
pgrade to release 1.11.0:<br>
<br>
- Added Python 3.13 wheels.<br>
- Added support for __format__.<br>
- Dropped support for Python 3.8.<br>
<br>
License-Update: Updated copyright years<br>
<br>
Signed-off-by: Leon Anavi &lt;<a href=3D"mailto:leon.anavi@konsulko.com" ta=
rget=3D"_blank">leon.anavi@konsulko.com</a>&gt;<br></blockquote><div><br></=
div><div>This update may have broken reproducibility : See direct links:</d=
iv><div>* <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builde=
rs/87/builds/43/steps/40/logs/stdio">https://autobuilder.yoctoproject.org/v=
alkyrie/#/builders/87/builds/43/steps/40/logs/stdio</a> line 258</div><div>=
* diffoscope: <a href=3D"https://valkyrie.yocto.io/pub/repro-fail-openembed=
ded/meta-python/oe-reproducible-20250503-7l8h_9ni/packages/diff-html/#repro=
ducibleA-tmp---reproducibleA-tmp-deploy---reproducibleA-tmp-deploy-rpm---re=
producibleA-tmp-deploy-rpm-core-_-----reproducibleA-tmp-deploy-rpm-core-_--=
-python--lazy-object-proxy--.--.--r-.core-_--.rpm---content---content-conte=
nt---.-usr-lib-python-.---site-packages-lazy_object_proxy-__pycache__-_vers=
ion.cpython----.pyc">https://valkyrie.yocto.io/pub/repro-fail-openembedded/=
meta-python/oe-reproducible-20250503-7l8h_9ni/packages/diff-html/#reproduci=
bleA-tmp---reproducibleA-tmp-deploy---reproducibleA-tmp-deploy-rpm---reprod=
ucibleA-tmp-deploy-rpm-core-_-----reproducibleA-tmp-deploy-rpm-core-_---pyt=
hon--lazy-object-proxy--.--.--r-.core-_--.rpm---content---content-content--=
-.-usr-lib-python-.---site-packages-lazy_object_proxy-__pycache__-_version.=
cpython----.pyc</a></div><div><br></div><div>This is weird, sstate contains=
 a 1.10.0 version file but the rest of the package is identical.</div><div>=
Any idea how that could have happened? <br></div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0...-<a href=3D"http://proxy_1.10.0.bb" rel=3D"noreferrer" target=3D"_=
blank">proxy_1.10.0.bb</a> =3D&gt; <a href=3D"http://python3-lazy-object-pr=
oxy_1.11.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-lazy-object-pro=
xy_1.11.0.bb</a>} | 6 ++++--<br>
=C2=A01 file changed, 4 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-lazy-object-proxy_1.10.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-=
lazy-object-proxy_1.10.0.bb</a> =3D&gt; <a href=3D"http://python3-lazy-obje=
ct-proxy_1.11.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-lazy-objec=
t-proxy_1.11.0.bb</a>} (55%)<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
lazy-object-proxy_1.10.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-l=
azy-object-proxy_1.10.0.bb</a> b/meta-python/recipes-devtools/python/<a hre=
f=3D"http://python3-lazy-object-proxy_1.11.0.bb" rel=3D"noreferrer" target=
=3D"_blank">python3-lazy-object-proxy_1.11.0.bb</a><br>
similarity index 55%<br>
rename from meta-python/recipes-devtools/python/<a href=3D"http://python3-l=
azy-object-proxy_1.10.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-la=
zy-object-proxy_1.10.0.bb</a><br>
rename to meta-python/recipes-devtools/python/<a href=3D"http://python3-laz=
y-object-proxy_1.11.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-lazy=
-object-proxy_1.11.0.bb</a><br>
index 195f94705b..ebf9f84951 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-lazy-ob=
ject-proxy_1.10.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-lazy-obj=
ect-proxy_1.10.0.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-lazy-ob=
ject-proxy_1.11.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-lazy-obj=
ect-proxy_1.11.0.bb</a><br>
@@ -2,10 +2,12 @@ SUMMARY =3D &quot;A fast and thorough lazy object proxy&q=
uot;<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"https://python-lazy-object-proxy.readth=
edocs.io/" rel=3D"noreferrer" target=3D"_blank">https://python-lazy-object-=
proxy.readthedocs.io/</a>&quot;<br>
=C2=A0LICENSE =3D &quot;BSD-2-Clause&quot;<br>
=C2=A0SECTION =3D &quot;devel/python&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dd606e94f56c21c8e0cdde0b622=
dcdf57&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Db44e35194fc96f303ff4302a2a=
5759dd&quot;<br>
<br>
=C2=A0DEPENDS +=3D &quot;python3-setuptools-scm-native&quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;78247b6d45f43a52ef35c25b5581459e85117225408a4=
128a3daf8bf9648ac69&quot;<br>
+SRC_URI[sha256sum] =3D &quot;18874411864c9fbbbaa47f9fc1dd7aea754c86cfde212=
78ef427639d1dd78e9c&quot;<br>
+<br>
+PYPI_PACKAGE =3D &quot;lazy_object_proxy&quot;<br>
<br>
=C2=A0inherit pypi python_setuptools_build_meta<br>
-- <br>
2.39.5<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#116932): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/116932" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/116932</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/112312248/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/112312248/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr" t=
arget=3D"_blank">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--00000000000052b42706346a25a2--

