Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C91ECC54E58
	for <webhook@archiver.kernel.org>; Wed, 20 Mar 2024 16:22:33 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web10.49634.1710951748257482875
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Mar 2024 09:22:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YtNVd5aR;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-221822a7dc7so38987fac.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Mar 2024 09:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710951747; x=1711556547; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oNLPq3J4BVjyMq0bAnZfvPiStfiU3ukCCRtH1EA1O9E=;
        b=YtNVd5aRJBaLZfe15Hmg8hTBN5mw427rgwm+x3dPUFNuLE8SqOuMRpOP+d22HYfAEf
         hBi6Oa202MwbCqdGvu/PSbQgmFVo4cSAsgY6Ol3K7ue/+Dghjt6qFc+ZcPWXsMqzbPDu
         PqqZIkU1FXTnkU30u5Ugdr0yvlILyIuFx7URLGtITdVxE9KE2syUh7BgVyfDG3Cqm/fD
         tcyO08maRRg9k9oFBnX9BqLii8TEwVZ7ilWsPK3TbbqQm01vlKoaBMMHFTErHR+msXEX
         B6gFHiRr0fAuYyqv0goJ0MremWgqEBH9njYOMRwWSyqRfcO+LiQsx5MQeDlSZlMYXb6y
         YiEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710951747; x=1711556547;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oNLPq3J4BVjyMq0bAnZfvPiStfiU3ukCCRtH1EA1O9E=;
        b=w4M1VhUzZYopWibnBAsXcKj48o2shIOxZ8Io2tVFel/MY344IJeIhnbF7xf/sKZaDO
         dSlIcPSoJv4uyrtZawM9Uwnn1hccQEEO8w4mUbVyQt2G9Iy9bOq9MgzHBxvJLEm49vwH
         +RArjx0baiFPEcYRsYFBHiSriHQsCblvHqtBq4Z/qlNEUQKaIoWk9BqOIWg0vMNj7ao4
         acR49AzSkEEH0QSRFjA0100cjE2aEzACrmEMLhlrP2loGl0ZpcLxFCFA5r1fCavOeLnI
         ap3qzta/tY04XygcFQUJZ+IbnEqlgp8uH2v9glyreZe1cctOvsrHgdoy3/298rcDSYz4
         THfg==
X-Gm-Message-State: AOJu0YyFyB29CJXgilws5EdnEEclKbLF0dxDMW9+fUN1PTuVX7ASTq+d
	h+Cbqh8y0RHik/zIqlo3QZQvzb9JJ9SQVpCh5hZSJNK+39tmSgrJSkaPbOxs1dqYssuLdltJvpz
	lSn9acQjTMjWgdfuI8VHK8QnWs9nrf1FHBYo=
X-Google-Smtp-Source: AGHT+IGDKbs+LaVzDo4I7Jac884tRcEGS6wPJUwNlHyK5HDMHh5uwXLzmJB9OHwbZcFDVjaT1Z7lIBbc75/01vG/3s4=
X-Received: by 2002:a05:6870:a40c:b0:221:c9ef:43c with SMTP id
 m12-20020a056870a40c00b00221c9ef043cmr22057102oal.1.1710951747469; Wed, 20
 Mar 2024 09:22:27 -0700 (PDT)
MIME-Version: 1.0
References: <17BE205582F63951.29196@lists.openembedded.org>
 <P19LAS.XNJ0HDKLN7IM@t-online.de> <CAMKF1sr=j4b+r45zt+mvkD0kqUDoWofzLabiFhCDj=RFaDyq0g@mail.gmail.com>
In-Reply-To: <CAMKF1sr=j4b+r45zt+mvkD0kqUDoWofzLabiFhCDj=RFaDyq0g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 Mar 2024 09:22:01 -0700
Message-ID: <CAMKF1sqhYPiFY3AfwDzydNJaJuF8ye_ng2OuynGH6y+uyenKiA@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCHv2] freerdp3: add recipe
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Mar 2024 16:22:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109491

next issue, it can not find heimdal krb5 module.

https://errors.yoctoproject.org/Errors/Details/759578/

On Wed, Mar 20, 2024 at 7:34=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> it ends in
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/3727
>
> I have pushed the fix for it into master-next to put ffmpeg dep as
> part of package config.
>
> On Tue, Mar 19, 2024 at 2:29=E2=80=AFAM Markus Volk <f_l_k@t-online.de> w=
rote:
> >
> > v2 removes fuse3 as a hard dependency. ffmpeg is still needed in any ca=
se because of swscale
> >
> > On Tue, Mar 19 2024 at 10:27:58 AM +01:00:00, Markus Volk <f_l_k@t-onli=
ne.de> wrote:
> >
> > freerdp3 is required to build gnome-remote-desktop-46.0 Signed-off-by: =
Markus Volk <f_l_k@t-online.de> --- .../recipes-support/freerdp/freerdp3_3.=
4.0.bb | 59 +++++++++++++++++++ 1 file changed, 59 insertions(+) create mod=
e 100644 meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb diff --git a/met=
a-oe/recipes-support/freerdp/freerdp3_3.4.0.bb b/meta-oe/recipes-support/fr=
eerdp/freerdp3_3.4.0.bb new file mode 100644 index 000000000..f04be56c6 ---=
 /dev/null +++ b/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb @@ -0,0 =
+1,59 @@ +DESCRIPTION =3D "FreeRDP RDP client & server library" +HOMEPAGE =
=3D "http://www.freerdp.com" +LICENSE =3D "Apache-2.0" +LIC_FILES_CHKSUM =
=3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57" + +DEPENDS =3D =
"openssl ffmpeg libusb1 uriparser cairo icu pkcs11-helper zlib jpeg" + +inh=
erit pkgconfig cmake + +SRCREV =3D "708f3764897e06297469a7b0507b3c9ecc041ad=
7" +SRC_URI =3D "git://github.com/FreeRDP/FreeRDP.git;branch=3Dmaster;proto=
col=3Dhttps" + +S =3D "${WORKDIR}/git" + +PACKAGECONFIG ??=3D " \ + ${@bb.u=
tils.filter('DISTRO_FEATURES', 'pam pulseaudio wayland x11', d)} \ + gstrea=
mer cups pcsc \ +" + +EXTRA_OECMAKE =3D " \ + -DRDTK_FORCE_STATIC_BUILD=3DO=
N \ + -DUWAC_FORCE_STATIC_BUILD=3DON \ + -DWITH_ADD=3DON \ + -DWITH_BINARY_=
VERSIONING=3DON \ + -DWITH_CHANNELS=3DON \ + -DWITH_CLIENT_CHANNELS=3DON \ =
+ -DWITH_JPEG=3DON \ + -DWITH_PKCS11=3DON \ + -DWITH_SERVER_CHANNELS=3DON \=
 + -DWITH_SERVER=3DON \ + -DPKG_CONFIG_RELOCATABLE=3DOFF \ + -DWITH_ALSA=3D=
OFF \ + -DWITH_CLIENT_SDL=3DOFF \ + -DWITH_SAMPLE=3DOFF \ + " + +X11_DEPS =
=3D "virtual/libx11 libxinerama libxext libxcursor libxv libxi libxrender l=
ibxfixes libxdamage libxrandr libxkbfile" +PACKAGECONFIG[x11] =3D "-DWITH_X=
11=3DON -DWITH_XINERAMA=3DON -DWITH_XEXT=3DON -DWITH_XCURSOR=3DON -DWITH_XV=
=3DON -DWITH_XI=3DON -DWITH_XRENDER=3DON -DWITH_XFIXES=3DON -DWITH_XDAMAGE=
=3DON -DWITH_XRANDR=3DON -DWITH_XKBFILE=3DON,-DWITH_X11=3DOFF,${X11_DEPS}" =
+PACKAGECONFIG[wayland] =3D "-DWITH_WAYLAND=3DON,-DWITH_WAYLAND=3DOFF,wayla=
nd wayland-native libxkbcommon" +PACKAGECONFIG[pam] =3D "-DWITH_PAM=3DON,-D=
WITH_PAM=3DOFF,libpam" +PACKAGECONFIG[pulseaudio] =3D "-DWITH_PULSEAUDIO=3D=
ON,-DWITH_PULSEAUDIO=3DOFF,pulseaudio" +PACKAGECONFIG[gstreamer] =3D "-DWIT=
H_GSTREAMER_1_0=3DON,-DWITH_GSTREAMER_1_0=3DOFF,gstreamer1.0 gstreamer1.0-p=
lugins-base" +PACKAGECONFIG[cups] =3D "-DWITH_CUPS=3DON,-DWITH_CUPS=3DOFF,c=
ups" +PACKAGECONFIG[fuse] =3D "-DWITH_FUSE=3DON,-DWITH_FUSE=3DOFF,fuse3,fus=
e3" +PACKAGECONFIG[pcsc] =3D "-DWITH_PCSC=3DON,-DWITH_PCSC=3DOFF,pcsc-lite"=
 +PACKAGECONFIG[manpages] =3D "-DWITH_MANPAGES=3DON,-DWITH_MANPAGES=3DOFF, =
libxslt-native docbook-xsl-stylesheets-native" +PACKAGECONFIG[ffmpeg] =3D "=
-DWITH_DSP_FFMPEG=3DON -DWITH_FFMPEG=3DON, -DWITH_DSP_FFMPEG=3DOFF -DWITH_F=
FMPEG=3DOFF" +PACKAGECONFIG[openh264] =3D "-DWITH_OPENH264=3DON,-DWITH_OPEN=
H264=3DOFF,openh264" +PACKAGECONFIG[opencl] =3D "-DWITH_OPENCL=3DON,-DWITH_=
OPENCL=3DOFF,opencl-icd-loader" +PACKAGECONFIG[lame] =3D "-DWITH_LAME=3DON,=
-DWITH_LAME=3DOFF,lame" +PACKAGECONFIG[faad] =3D "-DWITH_FAAD=3DON,-DWITH_F=
AAD=3DOFF,faad2" +PACKAGECONFIG[faac] =3D "-DWITH_FAAD=3DON,-DWITH_FAAD=3DO=
FF,faac" + +do_configure:append() { + sed -i -e 's|${WORKDIR}||g' ${B}/incl=
ude/freerdp/buildflags.h + sed -i -e 's|${WORKDIR}||g' ${B}/winpr/include/w=
inpr/buildflags.h +} + +FILES:${PN} +=3D "${datadir}"
> > --
> > 2.44.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#109477): https://lists.openembedded.org/g/openembed=
ded-devel/message/109477
> > Mute This Topic: https://lists.openembedded.org/mt/105020833/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

