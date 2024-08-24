Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 733D4C52D6F
	for <webhook@archiver.kernel.org>; Sat, 24 Aug 2024 05:39:53 +0000 (UTC)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
 by mx.groups.io with SMTP id smtpd.web10.8033.1724477965248793405
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Aug 2024 22:39:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fJ5Dwgc1;
 spf=pass (domain: gmail.com, ip: 209.85.161.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5d5e1c86b83so2117036eaf.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Aug 2024 22:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724477964; x=1725082764; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6no8eNS/T3m8QeQZ7tHhKHWxggXkHiN0l7zf+lnwFaE=;
        b=fJ5Dwgc1YYidY9EI8W5YrrHnAj36Qs8uvgCfejSWBPBHAepEwOtvvKtvzgsSiqk1gu
         2X5mV8nTavwbixeleDzYrfUKf2W+93uEB3bRAJuc4vWujuJYkjIhxQG+U6RACnUhLR/y
         rHeF00mcijJQiXib23Qpjg0tyWbXr1SQJm/qKeHhnxbf891jC/QTOl7YhxlC1NBezVcB
         /7sMfrjeYgtJPVChbjpoBoQCyg3DFTJwnWN5khQFGZAYb2L2EgFNqIVesAoEkqRIFwaS
         J/1RY6zd2eqJSSzw6F00DGQKG/9yMhfg25k5PdeUJBecQVjVDxW2NooZhSl/GbSHtPGg
         Vhew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724477964; x=1725082764;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6no8eNS/T3m8QeQZ7tHhKHWxggXkHiN0l7zf+lnwFaE=;
        b=WLse2P6pCFef6WTtQKLPOr15oF/SsNL6zLNauQrIpf+pndL4zYuEVhUI9lkzZGg7JK
         Js2jZ5o6x9DvRGGjVUrHqwKmpDAKTNCsP26TxWQbHl0bmh7VVlxVraF32nOJhQ0R5CDg
         DbdOvLONTi5EriD/8r2bweM5t66TNiwZnVQQN4OlOZr2SDXO4BwpAxNu8qdeNoSOF9oT
         9JdmpzIWGOBFeLWjQ4JnqmqxU8ILYRT1cgSDLASzzRH/6E3V3pEH3VmwWAzHjbfCXL2e
         26EsTwaciBVpxkP/L5lbSAOW7gN90p9HGybT4Drs3x5SsCE9fEn+HgH4vObmMd9PsBEE
         trUw==
X-Gm-Message-State: AOJu0Yyj7ZRL4GKLbH1tHXY0Nw5K0Ad/Uo+NebonWG3Ajf4BNZQ2HfIw
	EFZ0kC3N5GE+5zA5fMDpBmKtk3rjeTm14tm4WSJHJrK9u2vAexqa9s4RW7BF5kNIQsvsin8RI69
	/Vc3gBjcHbkNBrJKtMHFL8NAI/meBy4yf
X-Google-Smtp-Source: AGHT+IG5ojhSW6eC+hZ+w3q7o4Y1x4naR03Zq71hPyiW738CBnDjob9xQFNxfF/Kf3VR6mw8XafV1kg84IO4snmfdUE=
X-Received: by 2002:a05:6820:2220:b0:5da:a4a7:8f5a with SMTP id
 006d021491bc7-5dcc61b52d4mr5063541eaf.4.1724477964245; Fri, 23 Aug 2024
 22:39:24 -0700 (PDT)
MIME-Version: 1.0
References: <88b75d895a22439a271d83df9e66c7dc2a1e75e6.1724391421.git.joerg.sommer@navimatix.de>
In-Reply-To: <88b75d895a22439a271d83df9e66c7dc2a1e75e6.1724391421.git.joerg.sommer@navimatix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 23 Aug 2024 22:38:57 -0700
Message-ID: <CAMKF1soF+xff2H3HZhAa=f9yUN-r7=MkdagH6vC8OEy6-WAm2g@mail.gmail.com>
Subject: Re: [oe] [PATCH] bluealsa: upgrade 4.0.0+git -> 4.3.0
To: joerg.sommer@navimatix.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 24 Aug 2024 05:39:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111917

This resulted in
ERROR: bluealsa-4.3.0-r0 do_package: QA Issue: bluealsa:
Files/directories were installed but not shipped in any package:
  /usr/share
  /usr/share/dbus-1
  /usr/share/dbus-1/system.d
  /usr/share/dbus-1/system.d/bluealsa.conf
Please set FILES such that these items are packaged. Alternatively if
they are unneeded, avoid installing them

I have appended a patchlet to the original patch please check it in
master-next and see if all is ok.


On Thu, Aug 22, 2024 at 10:37=E2=80=AFPM J=C3=B6rg Sommer via
lists.openembedded.org
<joerg.sommer=3Dnavimatix.de@lists.openembedded.org> wrote:
>
> From: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
>
> The change in the license file was the update of the year in the copyrigh=
t
> line.
>
> glib-2.0-native and python3-packaging-native (with python3native) is
> required to have gdbus-codegen at build time.
>
> Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
> ---
>  .../{bluealsa_git.bb =3D> bluealsa_4.3.0.bb}    | 36 ++++++++++++-------
>  1 file changed, 24 insertions(+), 12 deletions(-)
>  rename meta-multimedia/recipes-multimedia/bluealsa/{bluealsa_git.bb =3D>=
 bluealsa_4.3.0.bb} (67%)
>
> diff --git a/meta-multimedia/recipes-multimedia/bluealsa/bluealsa_git.bb =
b/meta-multimedia/recipes-multimedia/bluealsa/bluealsa_4.3.0.bb
> similarity index 67%
> rename from meta-multimedia/recipes-multimedia/bluealsa/bluealsa_git.bb
> rename to meta-multimedia/recipes-multimedia/bluealsa/bluealsa_4.3.0.bb
> index 5007c88ff..ba43b4378 100644
> --- a/meta-multimedia/recipes-multimedia/bluealsa/bluealsa_git.bb
> +++ b/meta-multimedia/recipes-multimedia/bluealsa/bluealsa_4.3.0.bb
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
> +DEPENDS +=3D "alsa-lib bluez5 dbus glib-2.0-native python3-packaging-nat=
ive sbc"
>
>  SRC_URI =3D "git://github.com/Arkq/bluez-alsa.git;protocol=3Dhttps;branc=
h=3Dmaster"
>
> -SRCREV =3D "dd05a1baa261b94da9ba977b5e3392c8b4dc7a5e"
> -PV =3D "4.0.0+git"
> +SRCREV =3D "959573c2cccef5cf074f5b2fa7941abbd699c5f4"
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
> @@ -35,9 +45,10 @@ PACKAGECONFIG[systemd] =3D "--enable-systemd --with-sy=
stemdsystemunitdir=3D${systemd
>  PACKAGECONFIG[test] =3D "--enable-test,--disable-test,libcheck libsndfil=
e1"
>  PACKAGECONFIG[upower] =3D "--enable-upower,--disable-upower,,upower"
>
> -inherit autotools pkgconfig systemd
> +inherit autotools pkgconfig python3native systemd
>
> -EXTRA_OECONF =3D " \
> +# These proprietary codecs are not available in Yocto
> +EXTRA_OECONF =3D "\
>      --disable-aptx \
>      --disable-lc3plus \
>      --disable-ldac \
> @@ -45,11 +56,12 @@ EXTRA_OECONF =3D " \
>  "
>
>  PACKAGE_BEFORE_PN =3D "${PN}-aplay"
> -RRECOMMENDS:${PN} =3D "${PN}-aplay"
>
> -FILES:${PN}-aplay =3D "${bindir}/bluealsa-aplay"
> +FILES:${PN}-aplay +=3D "${bindir}/bluealsa-aplay"
>  FILES:${PN} +=3D "${libdir}/alsa-lib/*"
>
> +RRECOMMENDS:${PN} =3D "${PN}-aplay"
> +
>  SYSTEMD_PACKAGES +=3D "${PN}-aplay"
>  SYSTEMD_SERVICE:${PN} =3D "bluealsa.service"
>  SYSTEMD_SERVICE:${PN}-aplay =3D "bluealsa-aplay.service"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111909): https://lists.openembedded.org/g/openembedde=
d-devel/message/111909
> Mute This Topic: https://lists.openembedded.org/mt/108051676/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

