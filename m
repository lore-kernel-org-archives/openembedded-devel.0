Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BC69C7EE22
	for <webhook@archiver.kernel.org>; Thu, 11 May 2023 23:51:39 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
 by mx.groups.io with SMTP id smtpd.web10.12224.1683849093463748647
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 May 2023 16:51:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Gm20M9ti;
 spf=pass (domain: gmail.com, ip: 209.85.161.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-54fba751417so1470908eaf.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 May 2023 16:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683849093; x=1686441093;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N/0M9nxazfnfwz8Lpx2N2Sd0v+oKeAa8qMBVhsScf3Y=;
        b=Gm20M9tipE7sYdbBiWoMgv7++8M3e+/PgFIFqcfKnBNR3O0vs7wg0TQNnPYna9tEXn
         C+CQUO5KfE8xZAAe5CvJtcvhrZ/sQX6PlrMoG2Lu9hFi78NHFL+5b8E6mvGNZB/KaWbi
         buyIfskgxkcQw0HU6BUDi8t57J/L3AdrhRUsdPAHYM3jila9PtiL67jqL5UoRqOQPtuW
         z/AFUvdZVg0h3mltaUxiUva8OOHQeIMTbIKO6YP1y2sDowm0AExOVS3rL/YdT/26Srms
         EzaZQuuFqGp8DTkzYTXdD7te6jJGyzk44yD3jzq3IbUUicHSs2cbhbCZQQHaWn07/Knq
         CKCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683849093; x=1686441093;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N/0M9nxazfnfwz8Lpx2N2Sd0v+oKeAa8qMBVhsScf3Y=;
        b=E+Q74eQL+93DjzylO3IuTEyTLjnMLAw7E6fMnd7zebHE10rbsUO8xmAvg/x8ddHDy2
         9oaD+/X+rXByM+eyfi2kvPrwhlLPR2DVq3agrPbnIXQD5Q1EnrWU71Dflm6VWsvfE91y
         /BPuKUioN9ORVl2fYL1DvIjS7S+75PIlYL0eqKcnEpX0SIvNSlC23o/2Xei/a03Nsak9
         I5Gp3Ezz3tUrdohLPAXPWmsePyFXpnOQAyi9S9XOHmDlHja7kqL/YABEnaBeXYGmxqCy
         88DCmHJbss7T7Qab+QZOj7eCROlZpdolLU0sVyqfP/CBoptrIwLWlmycnbKaofpc4SOp
         32Iw==
X-Gm-Message-State: AC+VfDxiX+LZNjw90v2i/39XJEtQ2bIJu3RThHJICZLMhcp3/vSxoJhg
	tohdnZ1mq8mI9zMMSFyJoj9uNe6sTnS3D4xCONeKpvCgJg4=
X-Google-Smtp-Source: ACHHUZ4CjXGH3Epkfjm/yzjEvG82unm/9VcMDmyyH8ViulqwZV8QHuocgRSdTWB/y1Nxvfc8ST2AqLk8//zNq0VnEy0=
X-Received: by 2002:a05:6808:289a:b0:384:167d:736b with SMTP id
 eu26-20020a056808289a00b00384167d736bmr5596236oib.15.1683849092496; Thu, 11
 May 2023 16:51:32 -0700 (PDT)
MIME-Version: 1.0
References: <TY2PR02MB3678CB86F8FECE2510FB308881749@TY2PR02MB3678.apcprd02.prod.outlook.com>
In-Reply-To: <TY2PR02MB3678CB86F8FECE2510FB308881749@TY2PR02MB3678.apcprd02.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 11 May 2023 16:51:06 -0700
Message-ID: <CAMKF1sqzMVOThwJyGnPJYs_oX+qeAUC2XKK+Z+C3wL9CVgdc-g@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] networkmanager-fortisslvpn: add new recipe
To: Petr Gotthard <petr.gotthard@advantech.cz>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 May 2023 23:51:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102553

Fails to compile

https://errors.yoctoproject.org/Errors/Details/703718/

On Thu, May 11, 2023 at 9:33=E2=80=AFAM Petr Gotthard
<petr.gotthard@advantech.cz> wrote:
>
> Fortinet SSLVPN support for NetworkManager
> https://gitlab.gnome.org/GNOME/NetworkManager-fortisslvpn
>
> Signed-off-by: Petr Gotthard <petr.gotthard@advantech.cz>
> ---
>  .../networkmanager-fortisslvpn_1.4.0.bb       | 66 +++++++++++++++++++
>  1 file changed, 66 insertions(+)
>  create mode 100644 meta-networking/recipes-connectivity/networkmanager/n=
etworkmanager-fortisslvpn_1.4.0.bb
>
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkm=
anager-fortisslvpn_1.4.0.bb b/meta-networking/recipes-connectivity/networkm=
anager/networkmanager-fortisslvpn_1.4.0.bb
> new file mode 100644
> index 0000000000..afaece245b
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager-=
fortisslvpn_1.4.0.bb
> @@ -0,0 +1,66 @@
> +SUMMARY =3D "Fortinet SSLVPN support for NetworkManager"
> +SECTION =3D "net/misc"
> +
> +LICENSE =3D "GPL-2.0-or-later"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6=
552"
> +
> +DEPENDS =3D "glib-2.0-native libxml2-native networkmanager ppp"
> +
> +inherit gnomebase gettext useradd
> +
> +SRC_URI =3D "${GNOME_MIRROR}/NetworkManager-fortisslvpn/${@gnome_verdir(=
"${PV}")}/NetworkManager-fortisslvpn-${PV}.tar.xz"
> +SRC_URI[sha256sum] =3D "b055e26349b516b23585798ab3ef57b436b014800e92a8ac=
732cfc8e76c5dafa"
> +
> +S =3D "${WORKDIR}/NetworkManager-fortisslvpn-${PV}"
> +
> +# meta-gnome in layers is required using gnome:
> +PACKAGECONFIG[gnome] =3D "--with-gnome,--without-gnome,gtk+3 libnma libs=
ecret,"
> +PACKAGECONFIG[gtk4] =3D "--with-gtk4,--without-gtk4,gtk4,"
> +
> +EXTRA_OECONF =3D "--with-pppd-plugin-dir=3D${libdir}/pppd/${@get_ppp_ver=
sion(d)}"
> +
> +def get_ppp_version(d):
> +    import re
> +
> +    pppd_plugin =3D d.expand('${STAGING_LIBDIR}/pppd')
> +    if not os.path.isdir(pppd_plugin):
> +        return None
> +
> +    bb.debug(1, "pppd plugin dir %s" % pppd_plugin)
> +    r =3D re.compile(r"\d*\.\d*\.\d*")
> +    for f in os.listdir(pppd_plugin):
> +        if os.path.isdir(os.path.join(pppd_plugin, f)):
> +            ma =3D r.match(f)
> +            if ma:
> +                bb.debug(1, "pppd version dir %s" % f)
> +                return f
> +            else:
> +                bb.debug(1, "under pppd plugin dir %s" % f)
> +
> +    return None
> +
> +# gdbus-codegen requires target directories to exist
> +do_configure:append() {
> +    mkdir -p ${B}/properties
> +    mkdir -p ${B}/src
> +}
> +
> +USERADD_PACKAGES =3D "${PN}"
> +USERADD_PARAM:${PN} =3D "--system nm-fortisslvpn"
> +
> +FILES:${PN} +=3D " \
> +    ${libdir}/NetworkManager/*.so \
> +    ${libdir}/pppd/*/*.so \
> +    ${nonarch_libdir}/NetworkManager/VPN/nm-fortisslvpn-service.name \
> +"
> +
> +FILES:${PN}-staticdev +=3D " \
> +    ${libdir}/NetworkManager/*.a \
> +    ${libdir}/pppd/*/*.a \
> +"
> +
> +RDEPENDS:${PN} =3D " \
> +    networkmanager \
> +    openfortivpn \
> +    ppp \
> +"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#102548): https://lists.openembedded.org/g/openembedde=
d-devel/message/102548
> Mute This Topic: https://lists.openembedded.org/mt/98831519/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

