Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A8BAC5AD4C
	for <webhook@archiver.kernel.org>; Thu, 23 Nov 2023 16:50:49 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web10.95165.1700758248324616581
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Nov 2023 08:50:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k8X4rA2S;
 spf=pass (domain: gmail.com, ip: 209.85.210.42, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-6d7e8da5e8dso557210a34.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Nov 2023 08:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700758247; x=1701363047; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XL7HwlcNBh3/PRFFkPnatKvz2QSX7rT5YvC8j5JSBls=;
        b=k8X4rA2SnNkIYzL9LpGcBTI64Sqnvza8jw0xNp0YasoSv8Ay+h/4N8PhmZnu3fxs7H
         ofTgnHBne3BRzG2rBxC3pr2MDr3hne7v0RdhjVoZBe5sv/Rg4gMEZ8DfppO9E8k9CMIA
         40AUZLcCw0uhGx5nKgtM4zXIPMpIO8zydF125W6KZgVJTG23ue3G93R93aYDXtFOLhKU
         SRceV6dHIjr+Xx44HIvq1d9UqxN67mECB0F5FSrLi0hQRHahSqWqZw0tjWIXPbN+RYPG
         fviclQsnCLPmh9KGd7NB74Y3azTPZ3Npkq+qeDjM+frvHKoIg3WrN01r3SB68DK0lk/r
         yHcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700758247; x=1701363047;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XL7HwlcNBh3/PRFFkPnatKvz2QSX7rT5YvC8j5JSBls=;
        b=BHT7en1rChO964wTmAWIbyjwLAAPq4fRGhfMQHfOR0e5OjmHmu0wXnEtnOnAKl4aXV
         6yWqI6XBP9OBmioojcGJIic5Tsun7FcpUnQYAyU2YCbdG7uz/WA3cji1yd0gYXmyW9Zi
         Cc05M4Pc4sNXyxWPWGch+JK6pqywMgSSl3q0wBxSrxAHKMerUj8nMZRgsK3ESUjjHBBz
         lxLRMvZZoftbEs3qagfFczqiL1orWA9gvXptFsii2fnde/U84vcFymM/0lITEhOr/4oX
         H1MC+3M/O31VOrIDjScLv3jPLn5//hI95+SaQy+KLZVNKt0yqLYMNvXHflj7E0E+QBTY
         lNBQ==
X-Gm-Message-State: AOJu0Yx+ERpAifFxtoGdIfAgGIa+zRzOQbFHjame/Mzujo2qTwy/MmR6
	yNkudDXdnXwyMyUz3tP57zX95MX7RdUuru1G9NY=
X-Google-Smtp-Source: AGHT+IHrog4FCVFpqXfmnTRzJpPR/y/y6LAZyPhjjMK0/4Gl1b8NqR7AN3fft32kDGwYNXygi17eTTX+q65hX1WqHwM=
X-Received: by 2002:a05:6870:5d8b:b0:1f0:8122:554c with SMTP id
 fu11-20020a0568705d8b00b001f08122554cmr9043296oab.45.1700758247361; Thu, 23
 Nov 2023 08:50:47 -0800 (PST)
MIME-Version: 1.0
References: <179A4086F38671FD.6421@lists.openembedded.org> <WQ4L4S.ID0ZVJAVHQ0O3@t-online.de>
In-Reply-To: <WQ4L4S.ID0ZVJAVHQ0O3@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 23 Nov 2023 08:50:21 -0800
Message-ID: <CAMKF1sqAMXU_dXB-wTP8i5HU=+iLXnGq7X_M=cmVAQ6Yj8ZAVw@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] libcacard: fix version string in libcacard.pc
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Nov 2023 16:50:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107024

On Thu, Nov 23, 2023 at 8:35=E2=80=AFAM <f_l_k@t-online.de> wrote:
>
> Adding git-native to DEPENDS also fixes this issue. This should be the pr=
eferred way to fix I guess?

as long as it does not go over network it might be ok although it
elongates the depchain a bit
you can also insert the PV instead of hardcoding the version, that way
you dont have to worry about updating the patch with every version
bump

>
> On Thu, Nov 23 2023 at 01:33:02 PM +01:00:00, Markus Volk <f_l_k@t-online=
.de> wrote:
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de> --- ...n.build-set-hardcod=
ed-version-string.patch | 34 +++++++++++++++++++ .../recipes-support/spice/=
libcacard_2.8.1.bb | 5 ++- 2 files changed, 38 insertions(+), 1 deletion(-)=
 create mode 100644 meta-networking/recipes-support/spice/libcacard/0001-me=
son.build-set-hardcoded-version-string.patch diff --git a/meta-networking/r=
ecipes-support/spice/libcacard/0001-meson.build-set-hardcoded-version-strin=
g.patch b/meta-networking/recipes-support/spice/libcacard/0001-meson.build-=
set-hardcoded-version-string.patch new file mode 100644 index 000000000..b9=
d31c458 --- /dev/null +++ b/meta-networking/recipes-support/spice/libcacard=
/0001-meson.build-set-hardcoded-version-string.patch @@ -0,0 +1,34 @@ +From=
 dbfc08b9dc879e21bfacbd153948d21db36d50cd Mon Sep 17 00:00:00 2001 +From: M=
arkus Volk <f_l_k@t-online.de> +Date: Thu, 23 Nov 2023 13:20:40 +0100 +Subj=
ect: [PATCH] meson.build: set hardcoded version string + +Signed-off-by: Ma=
rkus Volk <f_l_k@t-online.de> + +This fixes version string in the pkgconfig=
 file and thus unbreaks spice build +| spice-common| Run-time dependency li=
bcacard found: NO +| +| ../git/subprojects/spice-common/meson.build:144:16:=
 ERROR: Dependency lookup for libcacard with method 'pkgconfig' failed: Inv=
alid version, need 'libcacard' ['>=3D 2.5.1'] found 'UNKNOWN'. +| +| A full=
 log can be found at /home/flk/poky/build/tmp/work/corei7-64-poky-linux/spi=
ce/0.15.2/build/meson-logs/meson-log.txt +| ERROR: meson failed + +Upstream=
-Status: Inappropriate [oe-specific] +--- + meson.build | 2 +- + 1 file cha=
nged, 1 insertion(+), 1 deletion(-) + +diff --git a/meson.build b/meson.bui=
ld +index 9cfe248..00745e5 100644 +--- a/meson.build ++++ b/meson.build +@@=
 -1,5 +1,5 @@ + project('libcacard', 'c', 'cpp', +- version: run_command('b=
uild-aux/git-version-gen', '@0@/.tarball-version'.format(meson.source_root(=
)), check: true).stdout().strip(), ++ version: '2.8.1', + license: 'LGPLv2.=
1', + default_options: ['warning_level=3D2'], + ) +-- +2.42.0 + diff --git =
a/meta-networking/recipes-support/spice/libcacard_2.8.1.bb b/meta-networkin=
g/recipes-support/spice/libcacard_2.8.1.bb index c81322e68..44cccba9d 10064=
4 --- a/meta-networking/recipes-support/spice/libcacard_2.8.1.bb +++ b/meta=
-networking/recipes-support/spice/libcacard_2.8.1.bb @@ -6,7 +6,10 @@ DEPEN=
DS =3D "glib-2.0 pcsc-lite nss" SRCREV =3D "7b07684ea6698d4885ff2062350ad87=
98a04de42" -SRC_URI =3D "git://gitlab.freedesktop.org/spice/libcacard.git;p=
rotocol=3Dhttps;branch=3Dmaster" +SRC_URI =3D " \ + git://gitlab.freedeskto=
p.org/spice/libcacard.git;protocol=3Dhttps;branch=3Dmaster \ + file://0001-=
meson.build-set-hardcoded-version-string.patch \ +" S =3D "${WORKDIR}/git"
> --
> 2.42.0
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D- Links: You receive all mess=
ages sent to this group. View/Reply Online (#107022): https://lists.openemb=
edded.org/g/openembedded-devel/message/107022 Mute This Topic: https://list=
s.openembedded.org/mt/102765737/3618223 Group Owner: openembedded-devel+own=
er@lists.openembedded.org Unsubscribe: https://lists.openembedded.org/g/ope=
nembedded-devel/unsub [f_l_k@t-online.de] -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-=3D-

