Return-Path: <douglas.royds@taitradio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F74DC433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 21:22:06 +0000 (UTC)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com
 [209.85.161.47])
 by mx.groups.io with SMTP id smtpd.web11.4734.1645478525356134190
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:22:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@taitradio.com header.s=google header.b=NJRnWjn5;
 spf=pass (domain: taitradio.com, ip: 209.85.161.47,
 mailfrom: douglas.royds@taitradio.com)
Received: by mail-oo1-f47.google.com with SMTP id
 w10-20020a4ae08a000000b0031bdf7a6d76so14799046oos.10
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=taitradio.com; s=google;
        h=mime-version:message-id:in-reply-to:from:date:subject
         :content-transfer-encoding;
        bh=zk4KkrsVt1XF0DKg013JAofesa69V7RF/ke/wvbCSIM=;
        b=NJRnWjn53NQVEDDfPsC0rZGFY017q70NWoIBHnpnZ1De4KHyRQ9Stui0kFI2eBSuxi
         92Okh+9oXeaX/kOKC547rnl+sH/N689r53hVph7QUfcPtEeM5fgR9xylH9TJSOfaOwHc
         4waRMMtpshRXSWIqTgeetKgm6yYhb0gnST90k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:x-gm-message-state:message-id:in-reply-to:from:date
         :subject:content-transfer-encoding;
        bh=zk4KkrsVt1XF0DKg013JAofesa69V7RF/ke/wvbCSIM=;
        b=qDzOGY++jZjZ6Ej/sO6VFeo5nMEFg0GbqVlYVq1tjnPRWc+ExEOwYB39/bKbqPu7OX
         LZqp1MVI7qS5wosBo4qgrdHHKOhZhVBtdrEKELH8KuBGrCLnCGDi8Wb4qjaiHhqSsPGL
         0qQGNbLI9a4AFUWp+CF3q/4vFv23zh9SATssWO8XuyDL3dVR1vwjjH24CwoxS0k/TA3Q
         NrIDuUZmze0xtgHu09m7iyR7xb1/YbtJNWiPrpm3ZhXt9jRE7UbMHVtq5qBt1Jf/X/m2
         RdNXO4M00jhh7poeyBEkZApCVmnH4sg6tdqU63qxAwkQ7v0eJp4L42xxRxctDW+UmOrD
         kFoQ==
MIME-Version: 1.0
X-Gm-Message-State: AOAM531CaZF+t1Ks3zrDfC7wqIick03Nc4McGakEEPHnSAMPmskJsfxt
	7Ji8p4xnNM+g2v1MbN+SeXks8GVl4PgCatKTuvN4UflT06Emb6aeNww9z8qVZ4iFT9XjtSOGJYh
	zwIJo5UCMMEdz9WOkBzr3xMqfgIaE0gB1DvqOOWQzAw==
X-Google-Smtp-Source: 
 ABdhPJzMrTf8gMxigRxIQeAlpj0nsjkr0YaM5lpsorq3FUa940sBMBpIO3jBuLvhMCdcVVDP8bflfg==
X-Received: by 2002:a05:6870:678d:b0:d3:115a:4046 with SMTP id
 gc13-20020a056870678d00b000d3115a4046mr343236oab.181.1645478524443;
        Mon, 21 Feb 2022 13:22:04 -0800 (PST)
Received: from acheron ([202.37.96.2])
        by smtp.gmail.com with ESMTPSA id
 eq37sm27416527oab.19.2022.02.21.13.22.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 13:22:04 -0800 (PST)
Message-ID: <6214027c.1c69fb81.dfd71.92a5@mx.google.com>
Received: by acheron (sSMTP sendmail emulation);
 Tue, 22 Feb 2022 10:21:59 +1300
In-Reply-To: <20220221041039.4036356-1-douglas.royds@taitradio.com>
From: Douglas Royds <douglas.royds@taitradio.com>
Date: Mon, 21 Feb 2022 16:34:03 +1300
Subject: [meta-oe][PATCH v2] libgpiod: RDEPENDS bats, python3-packaging for
 libgpiod-ptest
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Feb 2022 21:22:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95428

When ptest is included in the DISTRO_FEATURES, we were adding bats and
python3-packaging to the libgpiod RDEPENDS, and unwittingly dragging bash a=
nd
python3 into the rootfs whether libgpiod-ptest was installed or not.

Add bats and python3-packaging to the RDEPENDS for the libgpiod-ptest packa=
ge only.

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
 meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb b/meta-oe/r=
ecipes-support/libgpiod/libgpiod_1.6.3.bb
index 51b74ba5b..c08e38712 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
@@ -14,7 +14,7 @@ SRC_URI[sha256sum] =3D "841be9d788f00bab08ef22c4be5c39866=
f0e46cb100a3ae49ed816ac9c
=20
 inherit autotools pkgconfig python3native ptest
=20
-PACKAGECONFIG[tests] =3D "--enable-tests,--disable-tests,kmod udev glib-2.=
0 catch2,bats python3-packaging"
+PACKAGECONFIG[tests] =3D "--enable-tests,--disable-tests,kmod udev glib-2.=
0 catch2"
 PACKAGECONFIG[cxx] =3D "--enable-bindings-cxx,--disable-bindings-cxx"
 PACKAGECONFIG[python3] =3D "--enable-bindings-python,--disable-bindings-py=
thon,python3"
=20
@@ -54,6 +54,7 @@ RRECOMMENDS:${PN}-ptest +=3D " \
     coreutils \
     ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3-unittest', '=
', d)} \
 "
+RDEPENDS:${PN}-ptest +=3D "${@bb.utils.contains('PACKAGECONFIG', 'tests', =
'bats python3-packaging', '', d)}"
=20
 PACKAGECONFIG:append =3D " ${@bb.utils.contains('DISTRO_FEATURES', 'ptest'=
, 'tests', '', d)}"
=20
--=20
2.32.0


--=20
---------
Tait Communications is changing its domain name from=A0
@taitradio.com <http://taitradio.com>=A0to=A0@taitcommunications.com=20
<http://taitcommunications.com>=A0on 22 February 2022.=A0 =A0Email contacts=
 will=20
change, for example jo.smith=A0at=A0taitradio.com <http://taitradio.com>=A0
becomes jo.smith=A0at=A0taitcommunications.com <http://taitcommunications.c=
om>.=A0
 Existing email and other name formats using=A0@taitradio=A0will continue t=
o=20
work for some time.
----------
Tait Communications =E4ndert seinen=20
Domainnamen per 22. Februar 2022 von @taitradio.com <http://taitradio.com>=
=A0
in=A0@taitcommunications.com <http://taitcommunications.com>. =A0 Die=20
E-Mail-Kontakte werden sich =E4ndern, zum Beispiel wird jo.smith=A0at=A0
taitradio.com <http://taitradio.com>=A0zu jo.smith=A0at=A0taitcommunication=
s.com=20
<http://taitcommunications.com>.=A0 Bestehende E-Mail- und andere=20
Namensformate, die @taitradio verwenden, werden noch eine Zeit lang=20
funktionieren.
----------
A Tait Communications est=E1 mudando efetivamente=20
seu dom=EDnio de=A0@taitradio.com <http://taitradio.com>=A0para=A0
@taitcommunications.com <http://taitcommunications.com>=A0em 22 de fevereir=
o=20
de 2022. Todos os nossos endere=E7os de e-mail ser=E3o alterados com essa=
=20
mudan=E7a, por exemplo joao.silva=A0@=A0taitradio.com <http://taitradio.com=
>=A0ir=E1=20
virar joao.silva=A0@=A0taitcommunications.com <http://taitcommunications.co=
m>.=20
Os e-mail existentes atualmente cujo dom=EDnio =E9=A0@taitradio=A0ainda con=
tinuar=E3o=20
funcionando por um determinado per=EDodo de tempo.
----------
Tait=20
Communications cambiar=E1 su nombre de dominio de=A0@taitradio.com=20
<http://taitradio.com>=A0a=A0@taitcommunications.com=20
<http://taitcommunications.com>=A0el 22 de febrero de 2022. Todos los=20
contactos de correo electr=F3nico cambiar=E1n, por ejemplo, jo.smith=A0en=
=A0
taitradio.com <http://taitradio.com>=A0se convierte en jo.smith=A0en=A0
taitcommunications.com <http://taitcommunications.com>. Los correos=20
electr=F3nicos=A0existentes y otros formatos de nombre que utilizan=A0@tait=
radio=A0
todav=EDa seguir=E1n funcionando durante alg=FAn tiempo.
----------
Tait=20
Communications change son nom de domaine de @taitradio.com=20
<http://taitradio.com>=A0=E0=A0@taitcommunications.com=20
<http://taitcommunications.com>=A0le 22 f=E9vrier 2022. =A0 Les contacts pa=
r=20
courriel changeront, par exemple jo.smith=A0at=A0taitradio.com=20
<http://taitradio.com>=A0devient jo.smith=A0at=A0taitcommunications.com=20
<http://taitcommunications.com>.=A0 Les adresses =E9lectroniques et autres=
=20
formats de noms existants utilisant @taitradio continueront =E0 fonctionner=
=20
pendant un certain temps.
This communication is confidential. We only send=20
and receive email on the
basis of the terms set out at=20
www.taitradio.com/email_disclaimer=20
<http://www.taitradio.com/email_disclaimer>


