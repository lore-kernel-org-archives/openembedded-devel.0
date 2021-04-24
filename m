Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web12.5476.1619263456171847565
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Apr 2021 04:24:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KSNwL/bS;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: peron.clem@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id s15so60259583edd.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 24 Apr 2021 04:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=nNns4WLpwEZiXeF/uvFJe7nDa3tYwpTlUDGjFZvBrC0=;
        b=KSNwL/bSTdMAxYsz+8Wktf6Ud8FVR4GIGIb++8B9yOFn0mBrT8LiuNSZy4N7/fIxd/
         w53NbA0S8yUVpFThW3hofE+SrWZamyAB6zL4zeT1O9JBaXQi98TpPiJq/0ujakX/dGgp
         ftj6tunb9/6Appx+l6qWIvVoQ7E814kgT29kElyOVxdLYG20hklkKYHDrAmWvgKHc4co
         Y5ROiMaDaXNFGeCMZy8DNMyQUE1cwd7B08+v8QbR8JwFr2N4c7bOAqaJxLJkRIzXPHpj
         Q0kUf5McCLSfu72C3liD+YuTOBb10JLQxxyGQU3h5as2etLvIoA2/jdfNlhA4Pd4EfDj
         M1vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=nNns4WLpwEZiXeF/uvFJe7nDa3tYwpTlUDGjFZvBrC0=;
        b=BQ7N2v5Ng5GNwR4IT+2xOfSn8eWD1b+gfo1dRUyeIU2/SxKrSC5Xq/FH6Zxkmw6ne9
         NiFmNH2eHT2dCGdQF6Jtqn6XTYiupJbHET5eO149vZcbbvwe60ocvNJbQJ164NOjJT65
         Z95ztMcyi29LEWPHBxIEju6ThufUTL2yb0rp75gPWJZXNJV8GcXFS6C07lTXxDNUIQ9q
         al+K/v9mNb+FvbFl5uJaooDAu4Xw9TGUMCRgtItmd0UMoBtU9w3uPuPKd0WT1JwQI284
         CGbpNH6wTjZSaK5pYDVk24Fx+BvnRpGhKv776pUDbVbkt/gPzHVIW/GJytOJMhRMWWFH
         dHQw==
X-Gm-Message-State: AOAM5330CPl/C29/TL8ikQaSkszcwhY2F3oXGUg8iHkGRQYaC9KbdwMb
	ZKpAHRRPLj2GBADX5ipN+jFwOFUxcmqSUDx+y7M=
X-Google-Smtp-Source: ABdhPJxPmTh6n8wFwO12xZygmxIlaV7uRqspnwLhFZwwSyHHIK0yKvHdwcCM4E1ep+fru8tztJ7UwAN4+nJX3cuFrFc=
X-Received: by 2002:a50:eb82:: with SMTP id y2mr2025805edr.190.1619263454625;
 Sat, 24 Apr 2021 04:24:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210424102451.885867-1-peron.clem@gmail.com> <CAJiuCcf7mOszQNA=+mQmrr0ZrFsew+e_N_=316qgLtsoU0j-Cw@mail.gmail.com>
 <CA+chaQekMoLrC0m-gyPC3nAU6JxMOGHwU0J3PNqRiafembWKHw@mail.gmail.com>
In-Reply-To: <CA+chaQekMoLrC0m-gyPC3nAU6JxMOGHwU0J3PNqRiafembWKHw@mail.gmail.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Sat, 24 Apr 2021 13:24:03 +0200
Message-ID: <CAJiuCcew5bi+kR=FEWjYzjSJSHzG_pDyrrGjqEVFNzNRNaQRmQ@mail.gmail.com>
Subject: Re: [oe] [PATCH] [RFC] gator: Add new package
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Martin,

On Sat, 24 Apr 2021 at 12:45, Martin Jansa <martin.jansa@gmail.com> wrote:
>
> Why do you want to build only the daemon?
>
> There are already 4 variants of this recipe in various layers (at least =
by what's reported on layerindex):
> http://git.linaro.org/openembedded/meta-linaro.git/tree/meta-linaro/reci=
pes-kernel/gator/gator_git.bb?h=3Dmaster
> https://github.com/webosose/meta-webosose/blob/master/meta-webos/recipes=
-core/gator/gator_git.bb
> https://github.com/kratsg/meta-l1calo/blob/master/recipes-kernel/gator/g=
ator_git.bb
> https://github.com/robseb/meta-intelfpga/blob/master/recipes-devtools/ga=
tor/gator_git.bb
>
> so sharing some recipe which would suit most of these needs in meta-oe i=
s definitely welcome, but starting with just a daemon will just complicate =
things to these layers.

New gator daemon doesn't need a kernel module anymore, it's now fully user=
space.

Regards,
Clement

>
> But I understand that building the kernel modules for wider range of ker=
nels in different MACHINEs is quite pain (been there:
> https://github.com/shr-project/meta-webosose/commit/f4674ac6fa18a0a96cef=
efa49ebf397a383a88f1
> and given up shortly after:
> https://github.com/shr-project/meta-webosose/commit/d4bc575623dfbfad780f=
c39fef47d55d4d6e698d
> as I don't really use gator, it was just one of many build issues in 'bi=
tbake world' I was looking at).
>
> Regards,
>
> On Sat, Apr 24, 2021 at 3:29 AM Cl=C3=A9ment P=C3=A9ron <peron.clem@gmai=
l.com> wrote:
>>
>> Hi,
>>
>> I have some questions regarding my patch.
>>
>> On Sat, 24 Apr 2021 at 12:24, Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail=
.com> wrote:
>> >
>> > To communicate with the target device, Streamline requires the
>> > gator daemon, gatord, to be running on the device.
>>
>> Is gator the correct name for this package? or would gatord be better?
>>
>> >
>> > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
>> > ---
>> >  .../gator/0001-gator-don-t-strip-debug.patch  | 24 +++++++++++++++++=
++
>> >  meta-oe/recipes-devtools/gator/gator_7.5.0.bb | 22 +++++++++++++++++
>> >  2 files changed, 46 insertions(+)
>> >  create mode 100644 meta-oe/recipes-devtools/gator/gator/0001-gator-d=
on-t-strip-debug.patch
>> >  create mode 100644 meta-oe/recipes-devtools/gator/gator_7.5.0.bb
>> >
>> > diff --git a/meta-oe/recipes-devtools/gator/gator/0001-gator-don-t-st=
rip-debug.patch b/meta-oe/recipes-devtools/gator/gator/0001-gator-don-t-str=
ip-debug.patch
>> > new file mode 100644
>> > index 000000000000..8e59fffa1fc2
>> > --- /dev/null
>> > +++ b/meta-oe/recipes-devtools/gator/gator/0001-gator-don-t-strip-deb=
ug.patch
>> > @@ -0,0 +1,24 @@
>> > +From 370e9c97f1bc07a63aa87e954823c0063058aad7 Mon Sep 17 00:00:00 20=
01
>> > +From: =3D?UTF-8?q?Cl=3DC3=3DA9ment=3D20P=3DC3=3DA9ron?=3D <cpe@outsi=
ght.tech>
>> > +Date: Fri, 16 Apr 2021 15:27:16 +0200
>> > +Subject: [PATCH] gator: don't strip debug
>> > +
>> > +---
>> > + daemon/Makefile | 2 --
>> > + 1 file changed, 2 deletions(-)
>> > +
>> > +diff --git a/daemon/Makefile b/daemon/Makefile
>> > +index ba5f29cfeb10..6807948310f9 100644
>> > +--- a/daemon/Makefile
>> > ++++ b/daemon/Makefile
>> > +@@ -26,8 +26,6 @@ ifeq ($(shell expr `$(CXX) -dumpversion | cut -f1 =
-d.` \>=3D 5),1)
>> > +       CXXFLAGS +=3D -fno-sized-deallocation
>> > + endif
>> > +
>> > +-# -s strips the binary of debug info
>> > +-LDFLAGS     +=3D -s
>> > + LDLIBS      +=3D -lrt -lm -pthread
>> > + TARGET      :=3D $(OBJ_DIR)gatord
>> > + ESCAPE_EXE  :=3D $(OBJ_DIR)escape/escape
>> > +--
>> > +2.25.1
>> > diff --git a/meta-oe/recipes-devtools/gator/gator_7.5.0.bb b/meta-oe/=
recipes-devtools/gator/gator_7.5.0.bb
>> > new file mode 100644
>> > index 000000000000..8e15b1ca5fc5
>> > --- /dev/null
>> > +++ b/meta-oe/recipes-devtools/gator/gator_7.5.0.bb
>> > @@ -0,0 +1,22 @@
>> > +SUMMARY =3D "DS-5 Streamine Gator daemon"
>> > +DESCRIPTION =3D "Target-side daemon gathering data for ARM Streamlin=
e Performance Analyzer."
>> > +
>> > +LICENSE =3D "GPL-2.0-only"
>> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fda=
f4a4263"
>> > +LICENSE_libsensors =3D "LGPL-2.1-or-later"
>>
>> Gator git specifies that:
>>
>> -libsensors source code in daemon/libsensors licensed under LGPL-2.1-or=
-later
>> -mxml source code in daemon/mxml licensed under APACHE-2.0 WITH
>> Mini-XML-exception
>> -perf_event.h from Linux userspace kernel headers in daemon/k licensed
>> under GPL-2.0-only WITH Linux-syscall-note.
>>
>> I'm not sure how to properly reflect this in the recipe.
>>
>> Thanks for your help,
>> Clement
>>
>> > +
>> > +SRCREV =3D "6088d3533146d7b7c9700b8e396292053240b25f"
>> > +SRC_URI =3D "git://github.com/ARM-software/gator.git;protocol=3Dhttp=
;branch=3Dmaster \
>> > +          file://0001-gator-don-t-strip-debug.patch;patchdir=3D.. \
>> > +         "
>> > +
>> > +S =3D "${WORKDIR}/git/daemon"
>> > +
>> > +EXTRA_OEMAKE =3D "'CFLAGS=3D${CFLAGS} ${TARGET_CC_ARCH} -D_DEFAULT_S=
OURCE -DETCDIR=3D\"${sysconfdir}\"' \
>> > +    'LDFLAGS=3D${LDFLAGS} ${TARGET_CC_ARCH}' 'CROSS_COMPILE=3D${TARG=
ET_PREFIX}' \
>> > +    'CXXFLAGS=3D${CXXFLAGS} ${TARGET_CC_ARCH} -fno-rtti' CC=3D'${CC}=
' CXX=3D'${CXX}'"
>> > +
>> > +do_install() {
>> > +       install -d ${D}${sbindir}
>> > +       install -m 0755 ${S}/gatord ${D}${sbindir}/gatord
>> > +}
>> > --
>> > 2.25.1
>> >
>>
>>=20
>>
