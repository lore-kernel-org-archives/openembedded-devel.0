Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C9B7C021A0
	for <webhook@archiver.kernel.org>; Sat, 15 Feb 2025 04:26:58 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web11.3588.1739593611502806275
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Feb 2025 20:26:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZsA7Sgky;
 spf=pass (domain: gmail.com, ip: 209.85.210.41, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-726f989dc12so1424391a34.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Feb 2025 20:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739593611; x=1740198411; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Za3dy2NgOzEdFmkACYUc3IltdDU32qfiAReIz1TmLJ4=;
        b=ZsA7SgkyL4jyQM0xv4F3STkivxbQXCbdKR5bEKcZLkNfHXcMvHFT9Vm9iIyttkuPpR
         rdWXRjDDgOCZWmRDGtL6sRWnvlnHHABq0gc+n15rFzUtWan4fUDu53FeZ6In2MJxnhx8
         svGv4h855p9N4khtHqErwtZ2zUJctRjGDgnDsgxHbuUB0hxmT89o+Fh8DSNauXBYBPMK
         MiJPCfZtiqdseEzDWmQpLxKUB8Yrc4GrHMpF02POW6wWf9tsgUfC9JaJUCaacePEuxKg
         Fwq5/4c3llvJjm/vjEEBnKbx/RbMi11gN4jkCHc7XH7H6kgILvg2B5s8ALQdGdQCSxOn
         IE1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739593611; x=1740198411;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Za3dy2NgOzEdFmkACYUc3IltdDU32qfiAReIz1TmLJ4=;
        b=jmwV/s/HYFMQPdZDiI7HO2/YtNIz0QNQZ0j4MloMHf2+RdxZXDBL/Vq0K5/cLdQpRH
         JbIDwEH1pVZyz8HK6mWyNp1h+AbcybR9VknhiH5xYTqXU4JEbOCaXITi7vsH0dz0FjQG
         bsPe/PJFSQgf9c2X7r1jVCtwHiyy7tkWBMa6gDYN1zR0G1b5YElYoDNa79b6vPNa71ve
         BGN+ZaDbDgIPXlWFcObg1e+jKuLLr4Mp3m+gKE9hW6LPKtCUbecjk+e3NuaMhe9DZLw1
         hhkQ757XzqlBM0iRImAa4XfcaIhRoMOqqq9a3TUBFhApzuZsd6EcQjYf9dFM9plI4CIb
         4p9A==
X-Gm-Message-State: AOJu0YzezLP/fYh+hodvv0GhF0ArlJgfp8DXYvx52qLLg/EpMFASTbyV
	EyiI7i1zWXhIlWWiRBvPH4Wgg1ENGf+1yFDG5mA/HopHI9TiZoHt8B0tys+r8XMq7HJ+JxzMDsC
	dFHP57TgTXbs65rQZlnTduiJcUbgUmZdohHE=
X-Gm-Gg: ASbGncuFMXUVbjCV7GRGQ7q+ybFzNrvLcTJjJjijV3YBgQdxt1BO8iVpRrpun+Gnjq5
	nm5/na4zd+U/iburI5DYZVbG7ynR7RY/50vrjROVxjgrDp9Jecc2ybK1RPO9nYM3oP1AsfWI=
X-Google-Smtp-Source: AGHT+IGE/A1vHdCFbOM/cSOzVZpo5hA57Z3aAyX4lj6SleOfSKxAozeF1qntFkH6x8JelKS81Uqrsye+H/ani4zJMzk=
X-Received: by 2002:a05:6830:6585:b0:727:6e8:41ea with SMTP id
 46e09a7af769-7271207278cmr1099871a34.16.1739593610779; Fri, 14 Feb 2025
 20:26:50 -0800 (PST)
MIME-Version: 1.0
References: <20250214085152.1273827-1-ravi@prevas.dk> <CAMKF1sqpSNU4qOkmxDjh_pkPSvfQtPZP-QxOdQ8_i-ho+DijtQ@mail.gmail.com>
In-Reply-To: <CAMKF1sqpSNU4qOkmxDjh_pkPSvfQtPZP-QxOdQ8_i-ho+DijtQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 14 Feb 2025 20:26:24 -0800
X-Gm-Features: AWEUYZnmXIb3WFjDMkNBFTGvssZB38HTQXt8fWh_0E6sh3_j2CwkNNYX2vTqZiA
Message-ID: <CAMKF1sr6mWenrk2d=uzeFnQH8nchcYWQ2GmfYtok+5Erg_pNKA@mail.gmail.com>
Subject: Re: [meta-oe][PATCH v3] systemd-netlogd: new recipe
To: Rasmus Villemoes <ravi@prevas.dk>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Feb 2025 04:26:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115493

you might look into musl patches for systemd in oe-core e.g.
meta/recipes-core/systemd/systemd/0003-missing_type.h-add-comparison_fn_t.p=
atch
or perhaps disable it for musl target as well.

On Fri, Feb 14, 2025 at 8:25=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> it fails on musl
>
> | FAILED: systemd-netlogd.p/src_netlog_netlog-network.c.o
>    | x86_64-yoe-linux-musl-clang -target x86_64-yoe-linux-musl -m64
> -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse -mlittle-endian
> --dyld-prefix=3D/usr -Qunused-arguments -fstack-protector-
>    =E2=86=AA strong -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security
> -Werror=3Dformat-security
> --sysroot=3D/home/kraj01/yoe/build/tmp/work/core2-64-yoe-linux-musl/syste=
md-netlogd/1.4.4/recipe-sysroot
> -
>    =E2=86=AA Isystemd-netlogd.p -I. -I../git -I../git/src/share
> -I../git/src/netlog -Isrc -fdiagnostics-color=3Dalways
> -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11
> -Werror=3Dundef -
>    =E2=86=AA Werror=3Dformat=3D2 -Wformat-security -Wformat-nonliteral
> -Wmissing-include-dirs -Werror=3Dold-style-definition
> -Werror=3Dpointer-arith -Winit-self -Wdeclaration-after-statement
> -Wfloat-equal -
>    =E2=86=AA Werror=3Dmissing-prototypes -Werror=3Dimplicit-function-decl=
aration
> -Werror=3Dmissing-declarations -Werror=3Dreturn-type
> -Werror=3Dincompatible-pointer-types -Werror=3Dshadow -Wstrict-prototypes
> -
>    =E2=86=AA Wredundant-decls -Wmissing-noreturn -Wendif-labels
> -Wstrict-aliasing=3D2 -Wwrite-strings -Wno-unused-parameter
> -Wno-missing-field-initializers -Wno-unused-result -Werror=3Doverflow
> -Werror=3D
>    =E2=86=AA sign-compare -Wdate-time -Wnested-externs -ffast-math -fno-c=
ommon
> -fdiagnostics-show-option -fno-strict-aliasing -fvisibility=3Dhidden
> -fstack-protector -fstack-protector-strong -fPIE --
>    =E2=86=AA param=3Dssp-buffer-size=3D4 -include config.h -O2 -g
> -fmacro-prefix-map=3D/home/kraj01/yoe/build/tmp/work/core2-64-yoe-linux-m=
usl/systemd-netlogd/1.4.4/git=3D/usr/src/debug/systemd-netlogd/1.4.4
>    =E2=86=AA -fdebug-prefix-map=3D/home/kraj01/yoe/build/tmp/work/core2-6=
4-yoe-linux-musl/systemd-netlogd/1.4.4/git=3D/usr/src/debug/systemd-netlogd=
/1.4.4
> -fmacro-prefix-map=3D/home/kraj01/yoe/build/tmp/
>    =E2=86=AA work/core2-64-yoe-linux-musl/systemd-netlogd/1.4.4/build=3D/=
usr/src/debug/systemd-netlogd/1.4.4
> -fdebug-prefix-map=3D/home/kraj01/yoe/build/tmp/work/core2-64-yoe-linux-m=
usl/systemd-netlogd/1.
>    =E2=86=AA 4.4/build=3D/usr/src/debug/systemd-netlogd/1.4.4
> -fdebug-prefix-map=3D/home/kraj01/yoe/build/tmp/work/core2-64-yoe-linux-m=
usl/systemd-netlogd/1.4.4/recipe-sysroot=3D
> -fmacro-prefix-map=3D/home/
>    =E2=86=AA kraj01/yoe/build/tmp/work/core2-64-yoe-linux-musl/systemd-ne=
tlogd/1.4.4/recipe-sysroot=3D
> -fdebug-prefix-map=3D/home/kraj01/yoe/build/tmp/work/core2-64-yoe-linux-m=
usl/systemd-netlogd/1.4.4/
>    =E2=86=AA recipe-sysroot-native=3D
> -fmacro-prefix-map=3D/home/kraj01/yoe/build/tmp/work/core2-64-yoe-linux-m=
usl/systemd-netlogd/1.4.4/recipe-sysroot-native=3D
> -pipe -MD -MQ systemd-netlogd.p/
>    =E2=86=AA src_netlog_netlog-network.c.o -MF
> systemd-netlogd.p/src_netlog_netlog-network.c.o.d -o
> systemd-netlogd.p/src_netlog_netlog-network.c.o -c
> ../git/src/netlog/netlog-network.c
>    | In file included from ../git/src/netlog/netlog-network.c:11:
>    | In file included from ../git/src/netlog/netlog-manager.h:7:
>    | In file included from ../git/src/netlog/netlog-dtls.h:7:
>    | In file included from ../git/src/share/socket-util.h:16:
>    | ../git/src/share/util.h:65:70: error: unknown type name 'comparison_=
fn_t'
>    |    65 | static inline void qsort_safe(void *base, size_t nmemb,
> size_t size, comparison_fn_t compar) {
>    |       |
>            ^
>    | 1 error generated.
>
> On Fri, Feb 14, 2025 at 12:52=E2=80=AFAM Rasmus Villemoes <ravi@prevas.dk=
> wrote:
> >
> > From: Rasmus Villemoes <ravi@prevas.dk>
> >
> > In some deployments, the log aggregator collects log messages in the
> > syslog format, so systemd-journal-upload and friends can not be
> > used.
> >
> > systemd-netlogd is a daemon for filling that gap.
> >
> > Signed-off-by: Rasmus Villemoes <ravi@prevas.dk>
> > ---
> > v2: add systemd as required distro feature
> > v3: also inherit the features_check class to make that have effect
> >
> >  .../systemd-netlogd/systemd-netlogd_1.4.4.bb  | 27 +++++++++++++++++++
> >  1 file changed, 27 insertions(+)
> >  create mode 100644 meta-oe/recipes-support/systemd-netlogd/systemd-net=
logd_1.4.4.bb
> >
> > diff --git a/meta-oe/recipes-support/systemd-netlogd/systemd-netlogd_1.=
4.4.bb b/meta-oe/recipes-support/systemd-netlogd/systemd-netlogd_1.4.4.bb
> > new file mode 100644
> > index 0000000000..f95cfdb418
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/systemd-netlogd/systemd-netlogd_1.4.4.bb
> > @@ -0,0 +1,27 @@
> > +SUMMARY =3D "Forwards messages from the journal to other hosts over th=
e network using the Syslog Protocol"
> > +
> > +LICENSE =3D "LGPL-2.1-or-later"
> > +LIC_FILES_CHKSUM =3D "file://LICENSE.LGPL2.1;md5=3D4fbd65380cdd2559510=
79008b364516c"
> > +
> > +SRC_URI =3D "git://github.com/systemd/systemd-netlogd.git;protocol=3Dh=
ttps;branch=3Dmain"
> > +SRCREV =3D "b03cc3b1a75048c7cf19467d8918a4b7320767e6"
> > +
> > +inherit meson systemd pkgconfig useradd features_check
> > +
> > +REQUIRED_DISTRO_FEATURES =3D "systemd"
> > +
> > +S =3D "${WORKDIR}/git"
> > +
> > +DEPENDS +=3D "systemd"
> > +DEPENDS +=3D "openssl"
> > +DEPENDS +=3D "gperf-native"
> > +DEPENDS +=3D "python3-sphinx-native"
> > +
> > +# systemd-netlogd uses prefix and sysconfdir in a weird way.
> > +EXTRA_OEMESON +=3D "--prefix ${libdir}/systemd --sysconfdir ${sysconfd=
ir}/systemd"
> > +
> > +FILES:${PN} +=3D "${libdir}"
> > +
> > +USERADD_PACKAGES =3D "${PN}"
> > +GROUPADD_PARAM:${PN} =3D "-r systemd-journal"
> > +USERADD_PARAM:${PN} =3D "--system -d / -M --shell /sbin/nologin -g sys=
temd-journal systemd-journal-netlog"
> > --
> > 2.48.1
> >

