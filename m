Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4CABC2BD09
	for <webhook@archiver.kernel.org>; Thu, 27 Jun 2024 22:12:21 +0000 (UTC)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
 by mx.groups.io with SMTP id smtpd.web10.4356.1719526336855266351
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Jun 2024 15:12:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gEfF1ngf;
 spf=pass (domain: gmail.com, ip: 209.85.161.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5b53bb4bebaso4598486eaf.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 27 Jun 2024 15:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719526336; x=1720131136; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ajcpyaen78YYzrzbv09leghjdZ82ieKQvJUsn48HKZ4=;
        b=gEfF1ngfl7sK909/hP1dK47NrEgsYRujVdXWw6Nw+nAn/KcUDFVctWFn/KoPJZIzPN
         dPf+PsFMez9J/c3CMOW3xEmu2bcf58HXh5C/Xh+9WJ0ZrUwe1GjMneG1DTS+XqeVC4mN
         Cq2rd3/k8WxPo1U0clEh+9Eto1Wq1mHT/ByBF5cvI2yp8gqXYm1NVYPmzK9A+TVkaQ1j
         3NWkXieprTj5HxjqzzB2lLr1DL75wYX5ZLWmRTKM6dIQMJ05ztpKu1Ixd0/w7m2JGkef
         3czmJX+4orRoxeuia0blsTzE59SKgiGqFeG+XfU95/Ot8nfJxN2o5Bzlf/v0B1dhrzqT
         npJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719526336; x=1720131136;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ajcpyaen78YYzrzbv09leghjdZ82ieKQvJUsn48HKZ4=;
        b=f4NkNj5YaCcFmEzd2BGehdexNHSjzsiesTksFuhuKAGUzHv85R9u61d+yg6ddqa66V
         GMn6TYEsNM8q6505L73s+lod7xP3BO5JJKXDqPgU22Cs5T/jPbzlou09qUXllXyW89dj
         rAbgGEr6EYJQfKgnE80JxsJgP8N0jzsqC1+YyeGD3xIAf0zxRTMzyYurozL1kBwND16t
         tbnzHkAz59R3UWThSz1AaZm8ZNWo8yNI9RJbeGQ5S9H31nQOY9r5ztDmM9YDZfpeGNO1
         sLz7ELTTTHb7mvx9sDsAUDPubRY2AqMW5Cy4zz4wiE6ydKq2LST2z5WmUV5Gkeyk1O1b
         Lg/A==
X-Gm-Message-State: AOJu0YxFkRzgrMxxy8uvyuTJ2iGgVuDY6bksgb4yZUm0y2PX9Rh/9aTU
	aPUclBzYHzsBI3CrEVFBw+kIpp6ZXwiN3jlvnDJBMliBXHuK4MHWJcuyqSHvBCw4r6V6//gaBXY
	c0yvyFQarMmhTbKn0SQE1vdQ6KS1qqy96
X-Google-Smtp-Source: AGHT+IGPBb1sxiKrhaJARmUHh+jMURh+5BpNhC7H1AiWQNJKg+sM1LHqJDMuP0s6dRgcxvjo93AKI3MhdEgofAxpG8M=
X-Received: by 2002:a05:6870:b622:b0:255:26da:54f3 with SMTP id
 586e51a60fabf-25cfcda3b03mr16053427fac.4.1719526335787; Thu, 27 Jun 2024
 15:12:15 -0700 (PDT)
MIME-Version: 1.0
References: <b749b3d6caa6aadb7505462366c9f15fb4f143ad.1719386889.git.joerg.sommer@navimatix.de>
In-Reply-To: <b749b3d6caa6aadb7505462366c9f15fb4f143ad.1719386889.git.joerg.sommer@navimatix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 27 Jun 2024 15:11:49 -0700
Message-ID: <CAMKF1so7sQ9hs8CFyM4Ar1t32g8Q+=yBBWFmq9cOegTJL8ZDzA@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][PATCH] bluealsa: upgrade 4.0.0+git -> 4.2.0
To: joerg.sommer@navimatix.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Jun 2024 22:12:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111130

This failed to build with ptest enabled see
https://errors.yoctoproject.org/Errors/Details/788362/

On Wed, Jun 26, 2024 at 12:28=E2=80=AFAM J=C3=B6rg Sommer via
lists.openembedded.org
<joerg.sommer=3Dnavimatix.de@lists.openembedded.org> wrote:
>
> From: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
>
> The change in the license file was the update of the year in the copyrigh=
t
> line.
>
> glib-2.0-native is required to have gdbus-codegen at build time.
>
> Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
> ---
>  .../{bluealsa_git.bb =3D> bluealsa_4.2.0.bb}    | 29 +++++++++++++------
>  1 file changed, 20 insertions(+), 9 deletions(-)
>  rename meta-multimedia/recipes-multimedia/bluealsa/{bluealsa_git.bb =3D>=
 bluealsa_4.2.0.bb} (70%)
>
> diff --git a/meta-multimedia/recipes-multimedia/bluealsa/bluealsa_git.bb =
b/meta-multimedia/recipes-multimedia/bluealsa/bluealsa_4.2.0.bb
> similarity index 70%
> rename from meta-multimedia/recipes-multimedia/bluealsa/bluealsa_git.bb
> rename to meta-multimedia/recipes-multimedia/bluealsa/bluealsa_4.2.0.bb
> index 5007c88ff..47ebda6ed 100644
> --- a/meta-multimedia/recipes-multimedia/bluealsa/bluealsa_git.bb
> +++ b/meta-multimedia/recipes-multimedia/bluealsa/bluealsa_4.2.0.bb
> @@ -1,22 +1,30 @@
>  SUMMARY =3D "Bluetooth Audio ALSA Backend"
> +DESCRIPTION =3D "\
> +    BlueALSA is a replacement for BlueZ >=3D 5, with which one can achie=
ve the \
> +    same Bluetooth audio profile support as with PulseAudio, but with fe=
wer \
> +    dependencies and at a lower level in the software stack. It is desig=
ned \
> +    specifically for use on small, low-powered, dedicated audio or audio=
/visual \
> +    systems where the high-level audio management features of PulseAudio=
 or \
> +    PipeWire are not required. \
> +"
>  HOMEPAGE =3D "https://github.com/Arkq/bluez-alsa"
> +BUGTRACKER =3D "https://github.com/arkq/bluez-alsa/issues"
>  SECTION =3D "libs"
>
>  LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D8449a4f133a93f6254b496d4fb476=
e83"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D143bc4e73f39cc5e89d6e096ac031=
5ba"
> +
> +DEPENDS +=3D "alsa-lib bluez5 dbus glib-2.0-native sbc"
>
>  SRC_URI =3D "git://github.com/Arkq/bluez-alsa.git;protocol=3Dhttps;branc=
h=3Dmaster"
>
> -SRCREV =3D "dd05a1baa261b94da9ba977b5e3392c8b4dc7a5e"
> -PV =3D "4.0.0+git"
> +SRCREV =3D "261f184f41f7bf572051e5f124d687ade185a46e"
>
> -S  =3D "${WORKDIR}/git"
> -
> -DEPENDS +=3D "alsa-lib bluez5 dbus glib-2.0 sbc"
> +S =3D "${WORKDIR}/git"
>
>  PACKAGECONFIG ??=3D "aplay cli hcitop ${@bb.utils.filter('DISTRO_FEATURE=
S', 'systemd', d)}"
> -PACKAGECONFIG[a2dpconf]  =3D "--enable-a2dpconf,--disable-a2dpconf"
> -PACKAGECONFIG[aac]  =3D "--enable-aac,--disable-aac,fdk-aac"
> +PACKAGECONFIG[a2dpconf] =3D "--enable-a2dpconf,--disable-a2dpconf"
> +PACKAGECONFIG[aac] =3D "--enable-aac,--disable-aac,fdk-aac"
>  PACKAGECONFIG[aplay] =3D "--enable-aplay,--disable-aplay"
>  PACKAGECONFIG[cli] =3D "--enable-cli,--disable-cli"
>  PACKAGECONFIG[coverage] =3D "--with-coverage,--without-coverage,lcov-nat=
ive"
> @@ -25,8 +33,10 @@ PACKAGECONFIG[debug-time] =3D "--enable-debug-time,--d=
isable-debug-time"
>  PACKAGECONFIG[faststream] =3D "--enable-faststream,--disable-faststream"
>  PACKAGECONFIG[hcitop] =3D "--enable-hcitop,--disable-hcitop,libbsd ncurs=
es"
>  PACKAGECONFIG[libunwind] =3D "--with-libunwind,--without-libunwind,libun=
wind"
> +PACKAGECONFIG[midi] =3D "--enable-midi,--disable-midi"
>  PACKAGECONFIG[mp3lame] =3D "--enable-mp3lame,--disable-mp3lame,lame"
>  PACKAGECONFIG[mpg123] =3D "--enable-mpg123,--disable-mpg123,mpg123,mpg12=
3"
> +PACKAGECONFIG[msbc] =3D "--enable-msbc,--disable-msbc,spandsp"
>  PACKAGECONFIG[ofono] =3D "--enable-ofono,--disable-ofono,ofono"
>  PACKAGECONFIG[payloadcheck] =3D "--enable-payloadcheck,--disable-payload=
check"
>  PACKAGECONFIG[rfcomm] =3D "--enable-rfcomm,--disable-rfcomm"
> @@ -37,7 +47,8 @@ PACKAGECONFIG[upower] =3D "--enable-upower,--disable-up=
ower,,upower"
>
>  inherit autotools pkgconfig systemd
>
> -EXTRA_OECONF =3D " \
> +# These proprietary codecs are not available in Yocto
> +EXTRA_OECONF =3D "\
>      --disable-aptx \
>      --disable-lc3plus \
>      --disable-ldac \
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111082): https://lists.openembedded.org/g/openembedde=
d-devel/message/111082
> Mute This Topic: https://lists.openembedded.org/mt/106885813/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

