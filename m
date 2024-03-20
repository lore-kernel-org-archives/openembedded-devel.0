Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEC4AC54E58
	for <webhook@archiver.kernel.org>; Wed, 20 Mar 2024 14:34:52 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web11.46451.1710945286441471192
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Mar 2024 07:34:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AJWh6Dma;
 spf=pass (domain: gmail.com, ip: 209.85.210.41, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6e6969855c8so1901397a34.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Mar 2024 07:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710945285; x=1711550085; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MjYMFU9TyXnY+LVo85LPHgourgEOZpFbuQG+USu2fUY=;
        b=AJWh6DmaGjbHh29jLChnAwnsCcW8gEFQ40pt3J+beqGGUpjY3YtyjVyciQpTBHEKtF
         sTRSLWMzT3LFRxYfX4xP+2shLnVIFGWmTO/lUckxrHvOz5PeaBeuTtZK++mTLdvyinsQ
         GlUv3su0CQ8GkOLDtFCOs5WB4v3rhPV2GRrYXhMliyR1RcqirKYf+csUFtNPnMEb9fae
         hpy1iMkjLEvKBY1ygN1QBbUpe+clZUsUxGkTwSPpewCbuVNptZaoWlkuDKRPFUYuHHm6
         YUHAIR+MwuWkFRM5uUqETsLDKC2xfNicfqcxyywM9RmhXbZliWeInHyNdsBqLbnO5ocS
         rF/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710945285; x=1711550085;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MjYMFU9TyXnY+LVo85LPHgourgEOZpFbuQG+USu2fUY=;
        b=jmb+NZ7+8VDiE0hnC1ir3IvpUuEoEq6g8AG28OX7rosJ8X6OYQ50+ptZUrLSjDxURJ
         qNZfKczFqe6GV2OOK8ZnvCZrpKowpUoWzavf6IXtqkZz8fBnnwhYmPcCd6+AZlxTGMHY
         1bcsO1LAho0lFMEPQCmb64oG+5RvlMG1JxLjuJwwt3LxjW0UQHiTFXTAnL5emZOpo6GK
         WcmwWYjuD+Vg1YcpXsnTkedKoBIS18Er3UKMTV/JAaaGmTYr4XPXXYSN0NmsG6HkvkO/
         U0nFKa3rBL0zGkheMwOazdGdjmbNGA3FFrtZfyfmtEqJUtibLTNk34LHcg5gm7aQleld
         /qwg==
X-Gm-Message-State: AOJu0Yz3twyBtXa11giioM/EfBTmYiRJQSxcVONdd15wAj/rM5NntxeD
	o2URTSiUuYHTLuiIi4xQ7aS5rzVdQH2zU+1yo5PSHAPK3lMOWMzagFhNByzIeUTrmccY//0MGfg
	lUYY7zqrzP8sF5IeG1Dbmdpp3378=
X-Google-Smtp-Source: AGHT+IF18SYnIpRu6e4qf0aaUL/EDJvnQpfTb5fn2aGFH2V2bJjUFIy7Yb2MphTrbqUqyo7jCMG+T8pSgdgWaRhATM4=
X-Received: by 2002:a05:6870:d215:b0:220:c3b8:16a5 with SMTP id
 g21-20020a056870d21500b00220c3b816a5mr6488682oac.26.1710945285472; Wed, 20
 Mar 2024 07:34:45 -0700 (PDT)
MIME-Version: 1.0
References: <17BE205582F63951.29196@lists.openembedded.org> <P19LAS.XNJ0HDKLN7IM@t-online.de>
In-Reply-To: <P19LAS.XNJ0HDKLN7IM@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 Mar 2024 07:34:19 -0700
Message-ID: <CAMKF1sr=j4b+r45zt+mvkD0kqUDoWofzLabiFhCDj=RFaDyq0g@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCHv2] freerdp3: add recipe
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Mar 2024 14:34:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109489

it ends in

https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/3727

I have pushed the fix for it into master-next to put ffmpeg dep as
part of package config.

On Tue, Mar 19, 2024 at 2:29=E2=80=AFAM Markus Volk <f_l_k@t-online.de> wro=
te:
>
> v2 removes fuse3 as a hard dependency. ffmpeg is still needed in any case=
 because of swscale
>
> On Tue, Mar 19 2024 at 10:27:58 AM +01:00:00, Markus Volk <f_l_k@t-online=
.de> wrote:
>
> freerdp3 is required to build gnome-remote-desktop-46.0 Signed-off-by: Ma=
rkus Volk <f_l_k@t-online.de> --- .../recipes-support/freerdp/freerdp3_3.4.=
0.bb | 59 +++++++++++++++++++ 1 file changed, 59 insertions(+) create mode =
100644 meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb diff --git a/meta-=
oe/recipes-support/freerdp/freerdp3_3.4.0.bb b/meta-oe/recipes-support/free=
rdp/freerdp3_3.4.0.bb new file mode 100644 index 000000000..f04be56c6 --- /=
dev/null +++ b/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb @@ -0,0 +1=
,59 @@ +DESCRIPTION =3D "FreeRDP RDP client & server library" +HOMEPAGE =3D=
 "http://www.freerdp.com" +LICENSE =3D "Apache-2.0" +LIC_FILES_CHKSUM =3D "=
file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57" + +DEPENDS =3D "open=
ssl ffmpeg libusb1 uriparser cairo icu pkcs11-helper zlib jpeg" + +inherit =
pkgconfig cmake + +SRCREV =3D "708f3764897e06297469a7b0507b3c9ecc041ad7" +S=
RC_URI =3D "git://github.com/FreeRDP/FreeRDP.git;branch=3Dmaster;protocol=
=3Dhttps" + +S =3D "${WORKDIR}/git" + +PACKAGECONFIG ??=3D " \ + ${@bb.util=
s.filter('DISTRO_FEATURES', 'pam pulseaudio wayland x11', d)} \ + gstreamer=
 cups pcsc \ +" + +EXTRA_OECMAKE =3D " \ + -DRDTK_FORCE_STATIC_BUILD=3DON \=
 + -DUWAC_FORCE_STATIC_BUILD=3DON \ + -DWITH_ADD=3DON \ + -DWITH_BINARY_VER=
SIONING=3DON \ + -DWITH_CHANNELS=3DON \ + -DWITH_CLIENT_CHANNELS=3DON \ + -=
DWITH_JPEG=3DON \ + -DWITH_PKCS11=3DON \ + -DWITH_SERVER_CHANNELS=3DON \ + =
-DWITH_SERVER=3DON \ + -DPKG_CONFIG_RELOCATABLE=3DOFF \ + -DWITH_ALSA=3DOFF=
 \ + -DWITH_CLIENT_SDL=3DOFF \ + -DWITH_SAMPLE=3DOFF \ + " + +X11_DEPS =3D =
"virtual/libx11 libxinerama libxext libxcursor libxv libxi libxrender libxf=
ixes libxdamage libxrandr libxkbfile" +PACKAGECONFIG[x11] =3D "-DWITH_X11=
=3DON -DWITH_XINERAMA=3DON -DWITH_XEXT=3DON -DWITH_XCURSOR=3DON -DWITH_XV=
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
> --
> 2.44.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109477): https://lists.openembedded.org/g/openembedde=
d-devel/message/109477
> Mute This Topic: https://lists.openembedded.org/mt/105020833/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

