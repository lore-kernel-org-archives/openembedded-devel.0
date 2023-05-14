Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDE20C77B7F
	for <webhook@archiver.kernel.org>; Sun, 14 May 2023 23:06:08 +0000 (UTC)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
 by mx.groups.io with SMTP id smtpd.web11.76728.1684105562878894158
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 May 2023 16:06:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=P7/3xo/0;
 spf=pass (domain: gmail.com, ip: 209.85.161.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-541fb831026so3902277eaf.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 14 May 2023 16:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684105562; x=1686697562;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z8nY15DQ5bnv+Yzt4r8A1RmI6niKlvGG9TciEEby/as=;
        b=P7/3xo/0ceJfBH1AKSZNjNIWPtf3NrjJnnNrz2i40B55XZoUTwmg1kh9CmMhuYzb+g
         x4XMjr0cdjbV9aLbLIXiwSYcIkg2w2So805QYIfKRLaCSiOP5MCu78cF1pdTcqrEdmTi
         mJXICcu5i01yGeNaROImFwzgRQ04YclDKlhKdl2YhOpZ8X9exxmFhUBXoT2WIxN53K2C
         pUb6Y3qFi3J5YTbv4sJV4D+5xZ78XGAxLKV3pUuHLQCtQQS/RHD2kYoYTlvNFKOBHgCG
         gbWbCpdWJQ/QO0XJeTgu8qvxZq+dpNNwjWBTEDNEk7JNGfwvXed3fcKeOts2L/NLRwkc
         4uzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684105562; x=1686697562;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z8nY15DQ5bnv+Yzt4r8A1RmI6niKlvGG9TciEEby/as=;
        b=ZbVJ8axW0m8EMubo46bcnhIuhhVHpkBXT+A6jp4FLCxAhEvASGRFdek7OWOpmG05PJ
         JeGKtk2n1YRke0/IqruZcbwLGsmyOddnrP5EivMs5YiAPqOVRs+o3Od0r+AE93IzwpYN
         jj+yUvLls3UefA7I4NfukaI2Dxqnxg4EvA1yRTGVgMhGBU99i7BGOW8XY2Dh6uuKsRF1
         HMkf9wiEl/dPUOaw/R/DQ5YAjvFA/z1GOJFzW0XoG90cJeps0D9Kh96Ri2w4VpPCxCNi
         cB2Lut6zNhNQXcm4BUUO/GBI/kV4GAQM4oXXbTdHTXMtznF6RSViqFGfeV46c7OjXtZW
         035w==
X-Gm-Message-State: AC+VfDxGwILAS7f9au/qoEt8s26FBtcM/pF3lBGaKIFOB9XkOrDqYDye
	+RdNV1yXDUlxyORVmEqT6e9TyD+oKb8vv4lXqiY=
X-Google-Smtp-Source: ACHHUZ58xbDyUCBf0oa9EK1VMTPEJDmENtHS0zOHbmRF+0Tddfv3AyUcJKUzEHlXubFRLBd9TFfYWkwOqS+jR73Qlv8=
X-Received: by 2002:a4a:ea06:0:b0:54b:ce85:490a with SMTP id
 x6-20020a4aea06000000b0054bce85490amr9756653ood.0.1684105561671; Sun, 14 May
 2023 16:06:01 -0700 (PDT)
MIME-Version: 1.0
References: <TY2PR02MB367872AE3A1AA146901FF92881749@TY2PR02MB3678.apcprd02.prod.outlook.com>
 <TY2PR02MB3678530BE6F0335EDB587A14817B9@TY2PR02MB3678.apcprd02.prod.outlook.com>
In-Reply-To: <TY2PR02MB3678530BE6F0335EDB587A14817B9@TY2PR02MB3678.apcprd02.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 14 May 2023 16:05:35 -0700
Message-ID: <CAMKF1sqWVBiTXbLMHYZNPeckrn5qy6b2GE41+p+hA6GQ+PDuGQ@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] networkmanager-openconnect: add new recipe
To: Petr Gotthard <petr.gotthard@advantech.cz>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 14 May 2023 23:06:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102590

its always good to resend whole series when you rebase and send v2, v3
and so on.

On Sun, May 14, 2023 at 3:13=E2=80=AFPM Petr Gotthard
<petr.gotthard@advantech.cz> wrote:
>
> Ping. Could you please have a look on this patch? It was likely missed du=
e to errors in my other NetworkManager related patches, but I double checke=
d this one is correct.
>
> -----Original Message-----
> From: Petr Gotthard
> Sent: Thursday, May 11, 2023 6:33 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: [meta-networking][PATCH] networkmanager-openconnect: add new rec=
ipe
>
> Integration of the OpenConnect VPN client to the NetworkManager https://g=
itlab.gnome.org/GNOME/NetworkManager-openconnect
>
> Signed-off-by: Petr Gotthard <petr.gotthard@advantech.cz>
> ---
>  .../networkmanager-openconnect_1.2.8.bb       | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 meta-networking/recipes-connectivity/networkmanager/n=
etworkmanager-openconnect_1.2.8.bb
>
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkm=
anager-openconnect_1.2.8.bb b/meta-networking/recipes-connectivity/networkm=
anager/networkmanager-openconnect_1.2.8.bb
> new file mode 100644
> index 0000000000..c978defbbf
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager
> +++ -openconnect_1.2.8.bb
> @@ -0,0 +1,46 @@
> +SUMMARY =3D "OpenConnect VPN client for NetworkManager"
> +SECTION =3D "net/misc"
> +
> +LICENSE =3D "GPL-2.0-or-later"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D186e8b54342da4f753a62b7748c94=
7db"
> +
> +DEPENDS =3D "glib-2.0-native intltool-native libxml2 networkmanager open=
connect"
> +
> +inherit gnomebase useradd
> +
> +SRC_URI =3D "${GNOME_MIRROR}/NetworkManager-openconnect/${@gnome_verdir(=
"${PV}")}/NetworkManager-openconnect-${PV}.tar.xz"
> +
> +SRC_URI[sha256sum] =3D "5dedaa785d82d8e239ddd082bfac5250c691e964464be180=
7b6827263633cdcc"
> +
> +S =3D "${WORKDIR}/NetworkManager-openconnect-${PV}"
> +
> +# meta-gnome in layers is required using gnome:
> +PACKAGECONFIG[gnome] =3D "--with-gnome,--without-gnome,gtk+3 gcr3 libnma=
 libsecret,"
> +PACKAGECONFIG[gtk4] =3D "--with-gtk4,--without-gtk4,gtk4,"
> +
> +do_configure:append() {
> +    # network-manager-openconnect.metainfo.xml is created in source fold=
er but
> +    # compile expects it in build folder. As long as nobody comes up wit=
h a
> +    # better solution just support build:
> +    if [ -e ${S}/appdata/network-manager-openconnect.metainfo.xml ]; the=
n
> +        mkdir -p ${B}/appdata
> +        cp -f ${S}/appdata/network-manager-openconnect.metainfo.xml ${B}=
/appdata/
> +    fi
> +}
> +
> +USERADD_PACKAGES =3D "${PN}"
> +USERADD_PARAM:${PN} =3D "--system nm-openconnect"
> +
> +FILES:${PN} +=3D " \
> +    ${libdir}/NetworkManager/*.so \
> +    ${nonarch_libdir}/NetworkManager/VPN/nm-openconnect-service.name \
> +"
> +
> +FILES:${PN}-staticdev +=3D " \
> +    ${libdir}/NetworkManager/*.a \
> +"
> +
> +RDEPENDS:${PN} =3D " \
> +    networkmanager \
> +    openconnect \
> +"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#102588): https://lists.openembedded.org/g/openembedde=
d-devel/message/102588
> Mute This Topic: https://lists.openembedded.org/mt/98831510/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

