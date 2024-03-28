Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24BDBC54E64
	for <webhook@archiver.kernel.org>; Thu, 28 Mar 2024 14:59:39 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web10.18616.1711637970799443659
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Mar 2024 07:59:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ee9pGPh1;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-2282597eff5so711412fac.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 28 Mar 2024 07:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711637970; x=1712242770; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kc800kxwmD4pb4WlSCbBSHq7HZE2aiweHWTGPQ6FXY0=;
        b=ee9pGPh1DbZDBFGXYFRtzeUqdn4fcvb52hrvNUO6vHiaW5SoLyViJ1ImV8cGikYcCM
         FispsLXOABBj1wGzdgzn9/f/Yz1f5eCumTI+LZO6h2LPSiFYIfnd0iAu8EUNNF+bVPR8
         Co+jANC/0l4JIAOYjTBXq9jBGbfXcteiP89KYM8NQ0XI4hz3ExmLx3nCilcWeYALYxQo
         6Dw9XHkMK9LIMRI7d3oQrt6XAfeKD8Gmz8OP0lzZ2oDdH4V33Go0ARWcCWlVueQ+i34G
         NaZ/nI+5o5HzI6g2VkbkQ0wh5SzvbUG0tkKhpJKpWeunEgjpjNNsg0T8cTbHPvBZWHTe
         BC3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711637970; x=1712242770;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kc800kxwmD4pb4WlSCbBSHq7HZE2aiweHWTGPQ6FXY0=;
        b=S3gP53NY6rd91UG/TtpOjIbsXsBZh9Jrfei4QRuqLk1k2VEb+j00JgahPt0pfFgwUz
         mopu5otT75p0VAyy4dp/WblPefGpG+ecr8eHNl/ZVfA2u+tRyBwNqp+I+UVamoVEoXoQ
         hNdc5CnAz9XtZXSGVBBDRFARQMXlTlcE0WTU8QD/ECnWpw9e4BP7MuofnnkGK5s83oTU
         Y2+1DjqD/xlKbXj3BZ+fTo6FaUBe5KWnkKSlUb9oCLSordtspOuy19Fe+q1cTViAUOwP
         tscqpLN2ieznGpCcHrbtYITcifP6C2rDJmhsppCzh0gxoKEz9S2ruNn1rUUMBGWCbeDm
         63fg==
X-Gm-Message-State: AOJu0YwqR9PK+R8FJ9+O0zCcYCQg7+XspdcHcQ3H3MJfvlQoXfFznIRn
	G+zU0fwP8Hvx5xLRnHYGqUO9u7wxwcytYxGy7rZ2uxSOkkkqluhlXzM18H5H5QjS2+4QsWNcG+0
	xxFnGwB1wMkO9ZLvvqDbdX/xYC8w=
X-Google-Smtp-Source: AGHT+IFmOXzUCp5jYa4J7CA7BzH2KUfE84DGNdATqIJLh+hEAtdzRxQQI08ht/r/5XRbNA1deglOylpA7tp/pqOHp9E=
X-Received: by 2002:a05:6870:7099:b0:21e:6732:76bb with SMTP id
 v25-20020a056870709900b0021e673276bbmr3265745oae.39.1711637970043; Thu, 28
 Mar 2024 07:59:30 -0700 (PDT)
MIME-Version: 1.0
References: <17C0EF38D333F803.24962@lists.openembedded.org> <WX62BS.0Y0GW21RF67J3@t-online.de>
In-Reply-To: <WX62BS.0Y0GW21RF67J3@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Mar 2024 07:59:03 -0700
Message-ID: <CAMKF1srn0kN66kGhqHB0Dq0jUVPnPNqwo8G056r=zwsyEumq5g@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCHv6] gnome-user-share: add recipe
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Mar 2024 14:59:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109671

I do not see v7

On Thu, Mar 28, 2024 at 6:03=E2=80=AFAM <f_l_k@t-online.de> wrote:
>
> one more update ;)
>
> mod-dnssd is moved to meta-webserver/recipes-httpd/apache-mod. I guess th=
ats where it belongs
>
> On Thu, Mar 28 2024 at 02:01:44 PM +01:00:00, Markus Volk <f_l_k@t-online=
.de> wrote:
>
> - add it as runtime dependency to gnome-control-center because without it=
, the file sharing options are hidden. - configure the paths to fit to open=
embedded env - add mod_dnssd runtime dependency for apache2 as this is a re=
quirement To enable the feature, PACKAGECONFIG httpd needs to be added. Thi=
s is not done by default to avoid apache2 runtime dependency just by includ=
ing this recipe. NOTE: Apache2 httpd doesn't need to be running. It'll get =
started and stopped on demand by systemd. Signed-off-by: Markus Volk <f_l_k=
@t-online.de> --- .../gnome-control-center_46.0.bb | 2 +- .../gnome-user-sh=
are/gnome-user-share_43.0.bb | 24 +++++++++++++++++++ .../recipes-httpd/apa=
che-mod/mod-dnssd_git.bb | 21 ++++++++++++++++ 3 files changed, 46 insertio=
ns(+), 1 deletion(-) create mode 100644 meta-gnome/recipes-gnome/gnome-user=
-share/gnome-user-share_43.0.bb create mode 100644 meta-webserver/recipes-h=
ttpd/apache-mod/mod-dnssd_git.bb diff --git a/meta-gnome/recipes-gnome/gnom=
e-control-center/gnome-control-center_46.0.bb b/meta-gnome/recipes-gnome/gn=
ome-control-center/gnome-control-center_46.0.bb index a691b8d3f..fe9f1efbc =
100644 --- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-ce=
nter_46.0.bb +++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-cont=
rol-center_46.0.bb @@ -69,4 +69,4 @@ FILES:${PN} +=3D " \ FILES:${PN}-dev +=
=3D "${datadir}/gettext" -RDEPENDS:${PN} +=3D "gsettings-desktop-schemas te=
cla system-config-printer cups-pk-helper" +RDEPENDS:${PN} +=3D "gsettings-d=
esktop-schemas tecla system-config-printer cups-pk-helper ${@bb.utils.conta=
ins('DISTRO_FEATURES', 'systemd', 'gnome-user-share', '' , d)}" diff --git =
a/meta-gnome/recipes-gnome/gnome-user-share/gnome-user-share_43.0.bb b/meta=
-gnome/recipes-gnome/gnome-user-share/gnome-user-share_43.0.bb new file mod=
e 100644 index 000000000..3ff8f938a --- /dev/null +++ b/meta-gnome/recipes-=
gnome/gnome-user-share/gnome-user-share_43.0.bb @@ -0,0 +1,24 @@ +SUMMARY =
=3D "This is gnome-user-share 43.0, a system for easy sharing of user files=
." +LICENSE=3D"GPL-2.0-only" +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94=
d55d512a9ba36caa9b7df079bae19f" + + +DEPENDS =3D " \ + glib-2.0-native \ + =
glib-2.0 \ + systemd \ +" + +inherit gnomebase gsettings features_check + +=
REQUIRED_DISTRO_FEATURES =3D "systemd" + +SRC_URI =3D "git://gitlab.gnome.o=
rg/GNOME/gnome-user-share.git;protocol=3Dhttps;branch=3Dmaster" +SRCREV =3D=
 "a0e790aa9494db9d1b1f48b4fc0d2f78e112044d" +S =3D "${WORKDIR}/git" + +PACK=
AGECONFIG ??=3D "modules" +PACKAGECONFIG[httpd] =3D "-Dhttpd=3D/usr/sbin/ht=
tpd,,,apache2 mod-dnssd" +PACKAGECONFIG[modules] =3D "-Dmodules_path=3D/usr=
/libexec/apache2/modules" + +FILES:${PN} +=3D "${systemd_user_unitdir}" dif=
f --git a/meta-webserver/recipes-httpd/apache-mod/mod-dnssd_git.bb b/meta-w=
ebserver/recipes-httpd/apache-mod/mod-dnssd_git.bb new file mode 100644 ind=
ex 000000000..25bd5f201 --- /dev/null +++ b/meta-webserver/recipes-httpd/ap=
ache-mod/mod-dnssd_git.bb @@ -0,0 +1,21 @@ +DESCRIPTION =3D "Avahi Module f=
or Apache2." +HOMEPAGE =3D "https://0pointer.de/lennart/projects/mod_dnssd/=
" +LICENSE =3D "Apache-2.0" +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b8=
3ef96387f14655fc854ddc3c6bd57" + +DEPENDS =3D "apache2 avahi" + +SRC_URI =
=3D "git://git.0pointer.de/mod_dnssd;protocol=3Dgit;branch=3Dmaster" +SRCRE=
V =3D "be2fb9f6158f800685de7a1bc01c39b6cf1fa12c" +PV =3D "0.6" + +S =3D "${=
WORKDIR}/git" + +EXTRA_OECONF =3D "--disable-lynx" + +inherit autotools pkg=
config + +do_install() { + install -Dm755 ${S}/src/.libs/mod_dnssd.so ${D}$=
{libexecdir}/apache2/modules/mod_dnssd.so +} +
> --
> 2.44.0
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D- Links: You receive all mess=
ages sent to this group. View/Reply Online (#109666): https://lists.openemb=
edded.org/g/openembedded-devel/message/109666 Mute This Topic: https://list=
s.openembedded.org/mt/105195949/3618223 Group Owner: openembedded-devel+own=
er@lists.openembedded.org Unsubscribe: https://lists.openembedded.org/g/ope=
nembedded-devel/unsub [f_l_k@t-online.de] -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-=3D-

