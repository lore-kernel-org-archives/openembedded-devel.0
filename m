Return-Path: <douglas.royds@taitradio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E640BC433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 04:37:11 +0000 (UTC)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com
 [209.85.161.44])
 by mx.groups.io with SMTP id smtpd.web12.7151.1645418231289929710
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Feb 2022 20:37:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@taitradio.com header.s=google header.b=ZtBDaBay;
 spf=pass (domain: taitradio.com, ip: 209.85.161.44,
 mailfrom: douglas.royds@taitradio.com)
Received: by mail-oo1-f44.google.com with SMTP id
 k13-20020a4a948d000000b003172f2f6bdfso11729447ooi.1
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Feb 2022 20:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=taitradio.com; s=google;
        h=mime-version:message-id:from:date:subject:content-transfer-encoding;
        bh=Ubd2pgudLqgdOnC7udOoaj1O4LvdCg3EQB0d6wpbM7A=;
        b=ZtBDaBayLCXXqa4XflZEmWoZJallMO7cdJPcazZxaj5sup6HOMyFFkes1XmTZpSGu/
         bJOBq93drN7sM4Qwf4svm85+YVwSItG87H60dJ6K0ao8vK/rdap5hSLN0lMLrr8+KwyP
         REGx2FnBVAcc9QzKcq95MSk/YA+9VT4W08GyA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:x-gm-message-state:message-id:from:date:subject
         :content-transfer-encoding;
        bh=Ubd2pgudLqgdOnC7udOoaj1O4LvdCg3EQB0d6wpbM7A=;
        b=bLOrw4i1dODg5pTCKSocxTDkQF167KaOo2lbosba2D6itSyNpkFhuQCEyoXxP0BMy5
         zdtgTGxWNw4+/KCqeZDqjq/9RPupqddXJTt2Dvx+SoczXxkT2P4Rm6LPZOFLcH9fcuw/
         pxI1Yv6wkxLgHZyllPGuAj+qg97SLV8b19Y/MOr+E1J8UU+C9eoIk2QoSjZX5QuzWP/3
         smMv9wAjeAy+XcvEl9wG9ojf1YabdFrxyI+8qJhJyssubm61h/VdDrPkNlmrtzVt56tA
         qjbzi5Z2Dgv3LeQbwIDJ9NXNPF6C9N37QEhLtYNImpyK1pffQ3lGuGjIyZw8d0+zp77x
         YZZQ==
MIME-Version: 1.0
X-Gm-Message-State: AOAM533G9qiFqSPY/eFaba3rWyjWUs1Mc4WBGTPty3v/GSdu+TtwSeHf
	lYBcHpMeWyh01I1gDKDSxF/Zpu+jRKp5QCTAWizhfYgijO7FxRejl18E2+AUlAfia2Q40ouyl/e
	GboDJBZJI+6TtyRHA0RqLFTC7ZtUsH6w84lXFEQqItQ==
X-Google-Smtp-Source: 
 ABdhPJzBfj/X7bKnBgAK80bZjcfTLF9MjxZQhpir23pX/GNXUykgY9MfCfIyduzgnGiMhlEBAS8meA==
X-Received: by 2002:a05:6870:468f:b0:d3:501c:8eb9 with SMTP id
 a15-20020a056870468f00b000d3501c8eb9mr7189330oap.239.1645418230403;
        Sun, 20 Feb 2022 20:37:10 -0800 (PST)
Received: from acheron ([202.37.96.2])
        by smtp.gmail.com with ESMTPSA id z4sm4563338ooi.0.2022.02.20.20.37.08
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Feb 2022 20:37:10 -0800 (PST)
Message-ID: <621316f6.1c69fb81.be8e5.9f34@mx.google.com>
Received: by acheron (sSMTP sendmail emulation);
 Mon, 21 Feb 2022 17:37:05 +1300
From: Douglas Royds <douglas.royds@taitradio.com>
Date: Mon, 21 Feb 2022 16:34:03 +1300
Subject: [meta-oe][PATCH] libgpiod: RRECOMMENDS bats, python3-packaging for
 libgpiod-ptest
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Feb 2022 04:37:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95397

When ptest is included in the DISTRO_FEATURES, we were adding bats and
python3-packaging to the libgpiod RDEPENDS, and unwittingly dragging bash a=
nd
python3 into the rootfs whether libgpiod-ptest was installed or not.

Add bats and python3-packaging to the RRECOMMENDS for the libgpiod-ptest pa=
ckage only.

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
 meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb b/meta-oe/r=
ecipes-support/libgpiod/libgpiod_1.6.3.bb
index 51b74ba5b..c5323b417 100644
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
@@ -53,6 +53,7 @@ RRECOMMENDS:${PN}-ptest +=3D " \
     kernel-module-gpio-mockup \
     coreutils \
     ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3-unittest', '=
', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'tests', 'bats python3-packaging=
', '', d)} \
 "
=20
 PACKAGECONFIG:append =3D " ${@bb.utils.contains('DISTRO_FEATURES', 'ptest'=
, 'tests', '', d)}"
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


