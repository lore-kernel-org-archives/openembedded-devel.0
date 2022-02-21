Return-Path: <douglas.royds@taitradio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9BE4C4332F
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 20:27:04 +0000 (UTC)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com
 [209.85.166.175])
 by mx.groups.io with SMTP id smtpd.web11.4077.1645475222801587919
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Feb 2022 12:27:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@taitradio.com header.s=google header.b=IYn9NlxE;
 spf=pass (domain: taitradio.com, ip: 209.85.166.175,
 mailfrom: douglas.royds@taitradio.com)
Received: by mail-il1-f175.google.com with SMTP id q4so4157633ilt.0
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Feb 2022 12:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=taitradio.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=cmFoELYR/wp9r50/Gt/uc9b+ZYXx15MKkDyZIeYyzVA=;
        b=IYn9NlxEif3soQzgAE80G81utb164Bhg6gVrEyqLqZJtuefsTQDYWtb2XjH0fSoIIQ
         HbVTEgKpjzyLoaUvELEYO+jcP9IB0iTC7hv74ZtHs6KMRRX7pFYsuzxFJtS7qS5Y0W3F
         sGtP6ep14dJHfeLHEWLq/PRx8+IWQ+wOA9YS0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=cmFoELYR/wp9r50/Gt/uc9b+ZYXx15MKkDyZIeYyzVA=;
        b=PW9NCOijTRLzajQTfAr53c6vCxLaLmjcZgUm7xD4BmZ0hb6mc7UJljru2/zcU/fzjp
         8IUqMqoJ5ud+7gngNnPgAwLRk0FVhT1XDTHGY++zK2vR6r9B8vore2iMpcx80yrDxnGy
         DUtk7hBwK1Ob6YWueDPgkX36wHBnojUXLH5Mxl2HGkZ+2wUSfCQB7POn/+/Ju95UL255
         hdI+5U68i8T1FiZRlTyvB9EYI6P4yfJKuaCwLZ/WESe2rG3VN1SIFJasCqsr3b4a6JcG
         YTyrlwcq0xyusc89/SvjxsQoV1gCruJE1wGu6xF2Bun6SLevMagaAbeRh7jYlUmv3DG9
         Da/Q==
X-Gm-Message-State: AOAM533qhoRIi1LDldNt7Jiw7ro9L+zv098onr7NA5yqWQgH3uLQ99T+
	gdG5CJG+xNMM2ukxZHjihQg+mteh3pe3EfnyDMlXrz4mSkLUP922xl7gq18Mklr88LNofuSExti
	K1LHXcqC0iq+xo3dKOJ+cD79RIbtpR9zXSVO8cD5GNcgYg34oP35op0iThg==
X-Google-Smtp-Source: 
 ABdhPJwrE0o/qiazSuDiY/+Saxvf8qtZ3spH0xotpXqiaD1O+xZ+6132RRs/Dfu2A3yyPU9I0HwiCSGH/+/QoynGofo=
X-Received: by 2002:a05:6e02:15c8:b0:2bd:fdca:18a8 with SMTP id
 q8-20020a056e0215c800b002bdfdca18a8mr17152838ilu.320.1645475221930; Mon, 21
 Feb 2022 12:27:01 -0800 (PST)
MIME-Version: 1.0
References: <20220221041039.4036356-1-douglas.royds@taitradio.com>
In-Reply-To: <20220221041039.4036356-1-douglas.royds@taitradio.com>
From: Douglas Royds <douglas.royds@taitradio.com>
Date: Tue, 22 Feb 2022 09:26:51 +1300
Message-ID: 
 <CAFimOt5ZrGjVaec6Ox5eWYwSsGq3Fa_2q7AUuJfteFc+wJWRhw@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] libgpiod: RRECOMMENDS bats, python3-packaging
 for libgpiod-ptest
To: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000171dbc05d88d0e7e"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Feb 2022 20:27:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95427

--000000000000171dbc05d88d0e7e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I should be adding this to the RDEPENDS:${PN}-ptest, not the RRECOMMENDS.
I'll send another patch ...

On Mon, 21 Feb 2022 at 17:10, Douglas Royds <douglas.royds@taitradio.com>
wrote:

> When ptest is included in the DISTRO_FEATURES, we were adding bats and
> python3-packaging to the libgpiod RDEPENDS, and unwittingly dragging bash
> and
> python3 into the rootfs whether libgpiod-ptest was installed or not.
>
> Add bats and python3-packaging to the RRECOMMENDS for the libgpiod-ptest
> package only.
>
> Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
> ---
>  meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
> b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
> index 51b74ba5b..c5323b417 100644
> --- a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
> +++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
> @@ -14,7 +14,7 @@ SRC_URI[sha256sum] =3D
> "841be9d788f00bab08ef22c4be5c39866f0e46cb100a3ae49ed816ac9c
>
>  inherit autotools pkgconfig python3native ptest
>
> -PACKAGECONFIG[tests] =3D "--enable-tests,--disable-tests,kmod udev glib-=
2.0
> catch2,bats python3-packaging"
> +PACKAGECONFIG[tests] =3D "--enable-tests,--disable-tests,kmod udev glib-=
2.0
> catch2"
>  PACKAGECONFIG[cxx] =3D "--enable-bindings-cxx,--disable-bindings-cxx"
>  PACKAGECONFIG[python3] =3D
> "--enable-bindings-python,--disable-bindings-python,python3"
>
> @@ -53,6 +53,7 @@ RRECOMMENDS:${PN}-ptest +=3D " \
>      kernel-module-gpio-mockup \
>      coreutils \
>      ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3-unittest',
> '', d)} \
> +    ${@bb.utils.contains('PACKAGECONFIG', 'tests', 'bats
> python3-packaging', '', d)} \
>  "
>
>  PACKAGECONFIG:append =3D " ${@bb.utils.contains('DISTRO_FEATURES', 'ptes=
t',
> 'tests', '', d)}"
> --
> 2.32.0
>
>

--=20
---------
Tait Communications is changing its domain name from=C2=A0
@taitradio.com <http://taitradio.com>=C2=A0to=C2=A0@taitcommunications.com=
=20
<http://taitcommunications.com>=C2=A0on 22 February 2022.=C2=A0 =C2=A0Email=
 contacts will=20
change, for example jo.smith=C2=A0at=C2=A0taitradio.com <http://taitradio.c=
om>=C2=A0
becomes jo.smith=C2=A0at=C2=A0taitcommunications.com <http://taitcommunicat=
ions.com>.=C2=A0
 Existing email and other name formats using=C2=A0@taitradio=C2=A0will cont=
inue to=20
work for some time.
----------
Tait Communications =C3=A4ndert seinen=20
Domainnamen per 22. Februar 2022 von @taitradio.com <http://taitradio.com>=
=C2=A0
in=C2=A0@taitcommunications.com <http://taitcommunications.com>. =C2=A0 Die=
=20
E-Mail-Kontakte werden sich =C3=A4ndern, zum Beispiel wird jo.smith=C2=A0at=
=C2=A0
taitradio.com <http://taitradio.com>=C2=A0zu jo.smith=C2=A0at=C2=A0taitcomm=
unications.com=20
<http://taitcommunications.com>.=C2=A0 Bestehende E-Mail- und andere=20
Namensformate, die @taitradio verwenden, werden noch eine Zeit lang=20
funktionieren.
----------
A Tait Communications est=C3=A1 mudando efetivamente=20
seu dom=C3=ADnio de=C2=A0@taitradio.com <http://taitradio.com>=C2=A0para=C2=
=A0
@taitcommunications.com <http://taitcommunications.com>=C2=A0em 22 de fever=
eiro=20
de 2022. Todos os nossos endere=C3=A7os de e-mail ser=C3=A3o alterados com =
essa=20
mudan=C3=A7a, por exemplo joao.silva=C2=A0@=C2=A0taitradio.com <http://tait=
radio.com>=C2=A0ir=C3=A1=20
virar joao.silva=C2=A0@=C2=A0taitcommunications.com <http://taitcommunicati=
ons.com>.=20
Os e-mail existentes atualmente cujo dom=C3=ADnio =C3=A9=C2=A0@taitradio=C2=
=A0ainda continuar=C3=A3o=20
funcionando por um determinado per=C3=ADodo de tempo.
----------
Tait=20
Communications cambiar=C3=A1 su nombre de dominio de=C2=A0@taitradio.com=20
<http://taitradio.com>=C2=A0a=C2=A0@taitcommunications.com=20
<http://taitcommunications.com>=C2=A0el 22 de febrero de 2022. Todos los=20
contactos de correo electr=C3=B3nico cambiar=C3=A1n, por ejemplo, jo.smith=
=C2=A0en=C2=A0
taitradio.com <http://taitradio.com>=C2=A0se convierte en jo.smith=C2=A0en=
=C2=A0
taitcommunications.com <http://taitcommunications.com>. Los correos=20
electr=C3=B3nicos=C2=A0existentes y otros formatos de nombre que utilizan=
=C2=A0@taitradio=C2=A0
todav=C3=ADa seguir=C3=A1n funcionando durante alg=C3=BAn tiempo.
----------
Tait=20
Communications change son nom de domaine de @taitradio.com=20
<http://taitradio.com>=C2=A0=C3=A0=C2=A0@taitcommunications.com=20
<http://taitcommunications.com>=C2=A0le 22 f=C3=A9vrier 2022. =C2=A0 Les co=
ntacts par=20
courriel changeront, par exemple jo.smith=C2=A0at=C2=A0taitradio.com=20
<http://taitradio.com>=C2=A0devient jo.smith=C2=A0at=C2=A0taitcommunication=
s.com=20
<http://taitcommunications.com>.=C2=A0 Les adresses =C3=A9lectroniques et a=
utres=20
formats de noms existants utilisant @taitradio continueront =C3=A0 fonction=
ner=20
pendant un certain temps.
This communication is confidential. We only send=20
and receive email on the
basis of the terms set out at=20
www.taitradio.com/email_disclaimer=20
<http://www.taitradio.com/email_disclaimer>


--000000000000171dbc05d88d0e7e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I should be adding this to the RDEPENDS:${PN}-ptest, not t=
he=20
RRECOMMENDS. I&#39;ll send another patch ...
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Mon, 21 Feb 2022 at 17:10, Douglas Royds &lt;<a href=3D"mailto:douglas.r=
oyds@taitradio.com">douglas.royds@taitradio.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">When ptest is included in th=
e DISTRO_FEATURES, we were adding bats and<br>
python3-packaging to the libgpiod RDEPENDS, and unwittingly dragging bash a=
nd<br>
python3 into the rootfs whether libgpiod-ptest was installed or not.<br>
<br>
Add bats and python3-packaging to the RRECOMMENDS for the libgpiod-ptest pa=
ckage only.<br>
<br>
Signed-off-by: Douglas Royds &lt;<a href=3D"mailto:douglas.royds@taitradio.=
com" target=3D"_blank">douglas.royds@taitradio.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-support/libgpiod/<a href=3D"http://libgpiod_1.6.3.bb"=
 rel=3D"noreferrer" target=3D"_blank">libgpiod_1.6.3.bb</a> | 3 ++-<br>
=C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta-oe/recipes-support/libgpiod/<a href=3D"http://libgpiod_1.=
6.3.bb" rel=3D"noreferrer" target=3D"_blank">libgpiod_1.6.3.bb</a> b/meta-o=
e/recipes-support/libgpiod/<a href=3D"http://libgpiod_1.6.3.bb" rel=3D"nore=
ferrer" target=3D"_blank">libgpiod_1.6.3.bb</a><br>
index 51b74ba5b..c5323b417 100644<br>
--- a/meta-oe/recipes-support/libgpiod/<a href=3D"http://libgpiod_1.6.3.bb"=
 rel=3D"noreferrer" target=3D"_blank">libgpiod_1.6.3.bb</a><br>
+++ b/meta-oe/recipes-support/libgpiod/<a href=3D"http://libgpiod_1.6.3.bb"=
 rel=3D"noreferrer" target=3D"_blank">libgpiod_1.6.3.bb</a><br>
@@ -14,7 +14,7 @@ SRC_URI[sha256sum] =3D &quot;841be9d788f00bab08ef22c4be5c=
39866f0e46cb100a3ae49ed816ac9c<br>
<br>
=C2=A0inherit autotools pkgconfig python3native ptest<br>
<br>
-PACKAGECONFIG[tests] =3D &quot;--enable-tests,--disable-tests,kmod udev gl=
ib-2.0 catch2,bats python3-packaging&quot;<br>
+PACKAGECONFIG[tests] =3D &quot;--enable-tests,--disable-tests,kmod udev gl=
ib-2.0 catch2&quot;<br>
=C2=A0PACKAGECONFIG[cxx] =3D &quot;--enable-bindings-cxx,--disable-bindings=
-cxx&quot;<br>
=C2=A0PACKAGECONFIG[python3] =3D &quot;--enable-bindings-python,--disable-b=
indings-python,python3&quot;<br>
<br>
@@ -53,6 +53,7 @@ RRECOMMENDS:${PN}-ptest +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0kernel-module-gpio-mockup \<br>
=C2=A0 =C2=A0 =C2=A0coreutils \<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;pyth=
on3&#39;, &#39;python3-unittest&#39;, &#39;&#39;, d)} \<br>
+=C2=A0 =C2=A0 ${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;tests&#39=
;, &#39;bats python3-packaging&#39;, &#39;&#39;, d)} \<br>
=C2=A0&quot;<br>
<br>
=C2=A0PACKAGECONFIG:append =3D &quot; ${@bb.utils.contains(&#39;DISTRO_FEAT=
URES&#39;, &#39;ptest&#39;, &#39;tests&#39;, &#39;&#39;, d)}&quot;<br>
-- <br>
2.32.0<br>
<br>
</blockquote></div>

<br>
---------<br>Tait Communications is changing its domain name from=C2=A0<str=
ong>@<a href=3D"http://taitradio.com" target=3D"_blank">taitradio.com</a></=
strong>=C2=A0to=C2=A0<strong>@<a href=3D"http://taitcommunications.com" tar=
get=3D"_blank">taitco<wbr>mmunications.com</a>=C2=A0on 22 February 2022</st=
rong>.=C2=A0 =C2=A0Email contacts will change, for example jo.smith=C2=A0<s=
trong>at</strong>=C2=A0<a href=3D"http://taitradio.com" target=3D"_blank">t=
aitradio.com</a>=C2=A0<wbr>becomes jo.smith=C2=A0<strong>at</strong>=C2=A0<=
a href=3D"http://taitcommunications.com" target=3D"_blank">taitcommunicatio=
ns<wbr>.com</a>.=C2=A0 Existing email and other name formats using=C2=A0<st=
rong>@taitradio</strong>=C2=A0will continue to work for some time.<br>-----=
-----<br>Tait Communications =C3=A4ndert seinen Domainnamen per 22. Februar=
 2022 von @<a href=3D"http://taitradio.com" target=3D"_blank">taitradio.com=
</a>=C2=A0in=C2=A0<strong>@<a href=3D"http://taitcommunications.com" target=
=3D"_blank">taitcommuni<wbr>cations.com</a></strong>. =C2=A0 Die E-Mail-Kon=
takte werden sich =C3=A4ndern, zum Beispiel wird jo.smith=C2=A0<strong>at=
=C2=A0</strong><a href=3D"http://taitradio.com" target=3D"_blank">taitradio=
.com</a>=C2=A0zu jo.smith=C2=A0<strong>at=C2=A0</strong><a href=3D"http://t=
aitcommunications.com" target=3D"_blank">taitcommunications<wbr>.com</a>.=
=C2=A0 Bestehende E-Mail- und andere Namensformate, die @taitradio verwende=
n, werden noch eine Zeit lang funktionieren.<br>----------<br>A Tait Commun=
ications est=C3=A1 mudando efetivamente seu dom=C3=ADnio de=C2=A0<strong>@<=
/strong><a href=3D"http://taitradio.com" target=3D"_blank">taitradio.com</a=
>=C2=A0para=C2=A0<strong>@</strong><a href=3D"http://taitcommunications.com=
" target=3D"_blank">taitco<wbr>mmunications.com</a>=C2=A0em 22 de fevereiro=
 de 2022. Todos os nossos endere=C3=A7os de e-mail ser=C3=A3o alterados com=
 essa mudan=C3=A7a, por exemplo joao.silva=C2=A0<strong>@</strong>=C2=A0<a =
href=3D"http://taitradio.com" target=3D"_blank">taitradio.com</a>=C2=A0ir=
=C3=A1 virar joao.silva=C2=A0<strong>@</strong>=C2=A0<a href=3D"http://tait=
communications.com" target=3D"_blank">taitcommunication<wbr>s.com</a>. Os e=
-mail existentes atualmente cujo dom=C3=ADnio =C3=A9=C2=A0<strong>@taitradi=
o</strong>=C2=A0ainda continuar=C3=A3o funcionando por um determinado per=
=C3=ADodo de tempo.<br>----------<br>Tait Communications cambiar=C3=A1 su n=
ombre de dominio de=C2=A0<strong>@</strong><a href=3D"http://taitradio.com"=
 target=3D"_blank">taitradio.com</a>=C2=A0a=C2=A0<strong>@</strong><a href=
=3D"http://taitcommunications.com" target=3D"_blank">taitcommu<wbr>nication=
s.com</a>=C2=A0el 22 de febrero de 2022. Todos los contactos de correo elec=
tr=C3=B3nico cambiar=C3=A1n, por ejemplo, jo.smith=C2=A0<strong>en</strong>=
=C2=A0<a href=3D"http://taitradio.com" target=3D"_blank">taitradio.com</a>=
=C2=A0se convierte en jo.smith=C2=A0<strong>en</strong>=C2=A0<a href=3D"htt=
p://taitcommunications.com" target=3D"_blank">taitcommunications<wbr>.com</=
a>. Los correos electr=C3=B3nicos=C2=A0existentes y otros formatos de nombr=
e que utilizan=C2=A0<strong>@taitradio</strong>=C2=A0todav=C3=ADa seguir=C3=
=A1n funcionando durante alg=C3=BAn tiempo.<br>----------<br>Tait Communica=
tions change son nom de domaine de @<a href=3D"http://taitradio.com" target=
=3D"_blank">taitradio.com</a>=C2=A0=C3=A0=C2=A0<strong>@<a href=3D"http://t=
aitcommunications.com" target=3D"_blank">taitcommunic<wbr>ations.com</a></s=
trong>=C2=A0le 22 f=C3=A9vrier 2022. =C2=A0 Les contacts par courriel chang=
eront, par exemple jo.smith=C2=A0<strong>at=C2=A0</strong><a href=3D"http:/=
/taitradio.com" target=3D"_blank">taitradio.com</a>=C2=A0<wbr>devient jo.sm=
ith=C2=A0<strong>at=C2=A0</strong><a href=3D"http://taitcommunications.com"=
 target=3D"_blank">taitcommunications<wbr>.com</a>.=C2=A0 Les adresses =C3=
=A9lectroniques et autres formats de noms existants utilisant @taitradio co=
ntinueront =C3=A0 fonctionner pendant un certain temps.<div><br><hr>This co=
mmunication is confidential. We only send and receive email on the<br>basis=
 of the terms set out at <a href=3D"http://www.taitradio.com/email_disclaim=
er" target=3D"_blank">www.taitradio.com/email_<wbr>disclaimer</a><div><hr><=
/div></div>
--000000000000171dbc05d88d0e7e--

