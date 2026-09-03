Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B6BCC624A4
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 08:23:29 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2830.1788423804908824041
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Sep 2026 01:23:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=OUnBC6Uk;
 spf=pass (domain: gmail.com, ip: 209.85.167.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-4b383347fa6so608482b6e.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Sep 2026 01:23:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788423804; cv=none;
        d=google.com; s=arc-20260327;
        b=aLIlFQAuSgtTpYHnXRhFW10fy0Ozdj5soHqktRwV5tXAK7GcmUD0INEaOO3hgVJdZP
         euYJlzREupach+A+cCPvhhH5CbdbjFvesFl400LY/3bl+Apz2x956CaUnVtr+7z4JMDz
         KioRVjAFmkV10/0CRHU/enYP/DHSUGlQxpzS0J1PW3VBi6nb/3UPB4s4a1Bmmcm06nVh
         4InIQgBWVGSEIYyQI/7x7d7SRrapFkTCH7j6hl1kPEEIFK1k0J/SmJSu/5V8m5+q0964
         ZG0mKFMSRVeF6I9F0vGpmzwbuo2TLb8XNG8ntp06aJvMpV46NilGaDE123xbdlKYYHbr
         nLeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bWJkxAePH73+ze1yMuY+GG5skYNB1U8QAdyb6KxbJN4=;
        fh=LZspYXC3IzyIN8FmVwz229n7pZIWt1HqVNc3WYXGu+o=;
        b=Fzf4t7dvvAaza5Dwx6Khs+FpjRItFLCRZtN5pvIMEswyqEoxaJcgdSmZFU+m96pLce
         +Mf7JD9BF/ApaWNRTZ3dg1Wqb81mWsefK80QNVuf0rnqHQZ1qrym+T7PWb7PV3nW0OBE
         n2vuDWzJSQJr+Q+dXUMv4rbh8RzBz6QUHVDRH1Wy1nAiIzq95ctT9UJ5tmp8X85ydYtG
         4kl7o/oOMQSyiKs9LtWcdWnqyQ7fLd3bN40L6c4v7YAv/7SEDEoCMBXq0JGuuwY8/nil
         5PAWtHOrGBIAy/49peu7M8yZ6hPxJVwSHkfBTpNyn9Ebat+LK6kTgoFVrGa9PFtWQXGL
         aMuQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788423804; x=1789028604; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bWJkxAePH73+ze1yMuY+GG5skYNB1U8QAdyb6KxbJN4=;
        b=OUnBC6UkTYFvWu1d76auWYV0qpeH4qEO6rrykv0Tqbv+ob0T0x2Xct23f2tsc1kjcb
         d5wvVcM9vm2j0bIl/YorGjyCCSrNzSjBo6Jf0cmCXn0z2T5u4ENdXkQv5lyUQWSiU0ue
         l7QA4Ycq0zIb9pVqVWl9AW+Sxlh6qj8FD/D3smfkUYR0dtFCViqY6uggmdEdD8eDLMy0
         AxXM5S6nKzea+UsVsnapfCcOoRdGHJ+50T4vw7Hi/K5VLEfTRI03Wdi8HlLPFg2hikfs
         rTWD4oCRJhJiwEJNXMNGLwHZlqmX5ZTddfquCkd2fxnJrivHQfjUnHF9ljmukO/q6ras
         dCpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788423804; x=1789028604;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bWJkxAePH73+ze1yMuY+GG5skYNB1U8QAdyb6KxbJN4=;
        b=tT6vIFXGb9nZoQNwcIZ4qTrgchdjDuvCpkr5gHaMezx+KaXu3Iux+s+c7ppIQR9ky5
         QYmS/+ba18lu22N+XiyzcHTLD18lAwQo3hPRlDTJ3XnAeeZg/yRkqEibslRlztZWuNLg
         uQN0JAcyeJ1QFUfBAKF38ttxaYr0RHLYxqytB8oi/mNc4DEzhhWidpdpHiXOLPT0Kq4J
         ldnFygOJ9CrjKj2UgdxZRP70qca7Bpa6I3Xna6Xf3EEafJfTQz/e6UabtbuQ8FpbPazh
         49W0j4qh9+hXSTR2kheVCzvPgolhl13pJRjzeoR/2qDzi5LiCcj6eNw75jDJV4Kqv3cV
         SaoQ==
X-Gm-Message-State: AFuF++mqGf0m+GCS5Ejcm7AxokTo7w7gyiQXLMTvBz6127WEbOLr4eQN
	ouACQ4dZ591K8HOTf8Xi2GPjGr+fhW15SuNoFuROZ+sdnKMX2VUmboSHJi5MSKOjvzAVCDAJMnq
	IH/tHfcOO1MYmRIXvR6IBty2W1Z3SwMUqTo+i
X-Gm-Gg: AYBFou3PeAo3ru4bZTv0XGJvPID6vG0uYOPPdqv6AG4S6B30TMz/0k/pEk8SRtjM96S
	Iyd2RXAFP+MI8zUhfYOtFk0ip/7zgTG+4kp7quqw5MYj0VU6yY6sZ2ewtPDSfeZ7UArKHfdjQ/T
	/6mpcdzJT2QJovz/UrILWHKIiXp0WgQi+YuS6rCZaNSJnh+C2PSN+W+1iCHAydyYx178INN8Uf+
	VoAclQLlMNWW7vwWcuW3+p8lQ13V/K75YmOx8rT9+ueinW8O6KqUgNcNftsPzrXzANjPz0XDMz0
	dcUBV2fTAREiVBvD6SGDGW5yXys05kypyazWeazrFC2lgNk=
X-Received: by 2002:a05:6808:15a0:b0:4b8:4703:db92 with SMTP id
 5614622812f47-4b84703dccfmr887611b6e.27.1788423803941; Thu, 03 Sep 2026
 01:23:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260903081916.156273-1-f_l_k@t-online.de> <20260903081916.156273-2-f_l_k@t-online.de>
In-Reply-To: <20260903081916.156273-2-f_l_k@t-online.de>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Thu, 3 Sep 2026 20:23:12 +1200
X-Gm-Features: AcwNN1VHLToKLdOYdOeY8xfI0kkLtYfd7RkAxE8blzL-vc_o4xwRLkKKOVMAE_I
Message-ID: <CADySD0ESmpePK6kdD=mhucv_=m=YikUkJTOewaT7b5j+7_OgRA@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH 2/6] gjs: update
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Sep 2026 08:23:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129711

will be good to include from and to version in the commit message

On Thu, Sep 3, 2026 at 8:19=E2=80=AFPM Markus Volk via lists.openembedded.o=
rg
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta-gnome/recipes-gnome/gjs/gjs_1.84.2.bb | 45 ------------------
>  meta-gnome/recipes-gnome/gjs/gjs_1.88.1.bb | 53 ++++++++++++++++++++++
>  2 files changed, 53 insertions(+), 45 deletions(-)
>  delete mode 100644 meta-gnome/recipes-gnome/gjs/gjs_1.84.2.bb
>  create mode 100644 meta-gnome/recipes-gnome/gjs/gjs_1.88.1.bb
>
> diff --git a/meta-gnome/recipes-gnome/gjs/gjs_1.84.2.bb b/meta-gnome/reci=
pes-gnome/gjs/gjs_1.84.2.bb
> deleted file mode 100644
> index 1330342426..0000000000
> --- a/meta-gnome/recipes-gnome/gjs/gjs_1.84.2.bb
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -SUMMARY =3D "Javascript bindings for GNOME"
> -LICENSE =3D "LGPL-2.0-or-later AND MIT"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8dcea832f6acf45d856abfeb2d51e=
c48"
> -
> -
> -DEPENDS =3D "mozjs-128 cairo"
> -
> -inherit gnomebase gobject-introspection gettext features_check upstream-=
version-is-even pkgconfig multilib_script
> -
> -SRC_URI[archive.sha256sum] =3D "35142edf345705636300291ec3a7d583f14969ff=
3fae0ff30f4a95b1e6740166"
> -SRC_URI +=3D " \
> -    file://0001-Support-cross-builds-a-bit-better.patch \
> -    file://0002-meson.build-Do-not-add-dir-installed-tests-when-inst.pat=
ch \
> -"
> -
> -# gobject-introspection is mandatory and cannot be configured
> -REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
> -GIR_MESON_OPTION =3D ""
> -
> -EXTRA_OEMESON =3D " \
> -    -Dinstalled_tests=3Dfalse \
> -    -Dskip_dbus_tests=3Dtrue \
> -    -Dskip_gtk_tests=3Dtrue \
> -"
> -
> -LDFLAGS:append:mipsarch =3D " -latomic"
> -LDFLAGS:append:powerpc =3D " -latomic"
> -LDFLAGS:append:powerpc64 =3D " -latomic"
> -LDFLAGS:append:riscv32 =3D " -latomic"
> -
> -FILES:${PN} +=3D "${datadir}/gjs-1.0/lsan"
> -
> -PACKAGES =3D+ "${PN}-valgrind"
> -FILES:${PN}-valgrind =3D "${datadir}/gjs-1.0/valgrind"
> -RDEPENDS:${PN}-valgrind +=3D "valgrind"
> -
> -# Valgrind not yet available on rv32/rv64
> -RDEPENDS:${PN}-valgrind:remove:riscv32 =3D "valgrind"
> -RDEPENDS:${PN}-valgrind:remove:riscv64 =3D "valgrind"
> -
> -MULTILIB_SCRIPTS:append =3D "${PN}:${libexecdir}/installed-tests/gjs/GIM=
arshallingTests-1.0.typelib \
> -                    ${PN}:${libexecdir}/installed-tests/gjs/Regress-1.0.=
typelib \
> -                    ${PN}:${libexecdir}/installed-tests/gjs/Utility-1.0.=
typelib \
> -                    ${PN}:${libexecdir}/installed-tests/gjs/WarnLib-1.0.=
typelib \
> -                    "
> diff --git a/meta-gnome/recipes-gnome/gjs/gjs_1.88.1.bb b/meta-gnome/reci=
pes-gnome/gjs/gjs_1.88.1.bb
> new file mode 100644
> index 0000000000..16c8636d84
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/gjs/gjs_1.88.1.bb
> @@ -0,0 +1,53 @@
> +SUMMARY =3D "Javascript bindings for GNOME"
> +HOMEPAGE =3D "https://gitlab.gnome.org/GNOME/gjs"
> +LICENSE =3D "LGPL-2.0-or-later AND MIT"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8dcea832f6acf45d856abfeb2d51e=
c48"
> +
> +DEPENDS =3D "mozjs-140 cairo glib-2.0 glib-2.0-native libffi"
> +
> +inherit meson pkgconfig gettext gobject-introspection features_check
> +
> +SRC_URI =3D "${GNOME_MIRROR}/${BPN}/${@oe.utils.trim_version("${PV}", 2)=
}/${BP}.tar.xz;name=3Darchive"
> +SRC_URI +=3D "file://0001-Support-cross-builds-a-bit-better.patch"
> +SRC_URI +=3D "file://0002-meson.build-Do-not-add-dir-installed-tests-whe=
n-inst.patch"
> +SRC_URI[archive.sha256sum] =3D "767bab80e665d672cb00563c25f0b392a9ec8c29=
96ed1d4454c698b4c2f0a3d9"
> +
> +# gobject-introspection is mandatory and cannot be configured
> +REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
> +GIR_MESON_OPTION =3D ""
> +
> +# readline and profiler are meson features with value 'auto' and would o=
therwise
> +# be picked up from whatever happens to be in the sysroot.
> +PACKAGECONFIG ??=3D "readline"
> +PACKAGECONFIG[readline] =3D "-Dreadline=3Denabled,-Dreadline=3Ddisabled,=
readline"
> +PACKAGECONFIG[profiler] =3D "-Dprofiler=3Denabled,-Dprofiler=3Ddisabled,=
sysprof"
> +
> +EXTRA_OEMESON =3D " \
> +    -Dinstalled_tests=3Dfalse \
> +    -Dskip_dbus_tests=3Dtrue \
> +    -Dskip_gtk_tests=3Dtrue \
> +    -Ddtrace=3Dfalse \
> +    -Dsystemtap=3Dfalse \
> +    -Dverbose_logs=3Dfalse \
> +    -Dbsymbolic_functions=3Dtrue \
> +"
> +
> +LDFLAGS:append:mipsarch =3D " -latomic"
> +LDFLAGS:append:powerpc =3D " -latomic"
> +LDFLAGS:append:powerpc64 =3D " -latomic"
> +LDFLAGS:append:riscv32 =3D " -latomic"
> +
> +FILES:${PN} +=3D "${datadir}/gjs-1.0/lsan"
> +
> +PACKAGES =3D+ "${PN}-valgrind"
> +FILES:${PN}-valgrind =3D "${datadir}/gjs-1.0/valgrind"
> +RDEPENDS:${PN}-valgrind +=3D "valgrind"
> +
> +# Valgrind not yet available on rv32/rv64
> +RDEPENDS:${PN}-valgrind:remove:riscv32 =3D "valgrind"
> +RDEPENDS:${PN}-valgrind:remove:riscv64 =3D "valgrind"
> +
> +# The GIMarshallingTests/Regress/Utility/WarnLib typelibs that the 1.84 =
recipe
> +# listed in MULTILIB_SCRIPTS are no longer produced by the build system.
> +
> +UPSTREAM_CHECK_GITTAGREGEX =3D "^(?P<pver>\d+\.\d*[02468]\.\d+)$"
> --
> 2.55.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#129703): https://lists.openembedded.org/g/openembedde=
d-devel/message/129703
> Mute This Topic: https://lists.openembedded.org/mt/121065944/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

