Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8397E77173
	for <webhook@archiver.kernel.org>; Sun,  8 Dec 2024 08:41:43 +0000 (UTC)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
 by mx.groups.io with SMTP id smtpd.web10.76012.1733647297119479069
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Dec 2024 00:41:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TIWPypbe;
 spf=pass (domain: gmail.com, ip: 209.85.161.49, mailfrom: schonm@gmail.com)
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5f29c983cb1so398331eaf.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Dec 2024 00:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733647296; x=1734252096; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nJlNtzn3fxpWzu0Z3AgIkTozEBhwrtWgjssKBADgrNA=;
        b=TIWPypbe4wsqiyXsZ2BGpWXhmapqRYxSt+KuQizJ/KAieuwnu1C3rYWb0gdjFw5sLp
         IK4iPgXoADvPjGxIwBSMz96c/Rlx5Hbx/ck3fS3+lwZvq/v2xUDshEM0v11dyFQOzrwR
         4Z7cGkzyxfmKO3UOXOUofuR+heA6053E7N9wh/x6aQeI6cuQD9KuVvIh9+lgEkd88FID
         TZOq4scRU5yz06htlZBc6MZjfFNi21Vec3eevSBuE9qpHm8n0rkYSFqz2ioOtShVo/Vw
         TSIUu9mN6khCW0UkEy4VqQU+qmNRo8snAIoSNZ0lc9lXG6IYtPJ/0ZiTIrw39vVGFOD+
         MhaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733647296; x=1734252096;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nJlNtzn3fxpWzu0Z3AgIkTozEBhwrtWgjssKBADgrNA=;
        b=RuD32PHjoaaas4nLoC6Jli/ZED/nrN1G3X+gUlm9aE3f+oJJLQDqai7ZA06QG7cBCd
         iHuQrsfRF7/rzqX8apVpnC4fLAuPAd9loSVZO6ccwpxVgZdEyAbanlIIAVQ03xCH1Kx6
         PnJJur7uVELIHls/D8GKB6UWoqRB5VuFREJpvjlmlaxt8+B46R/OnSqGxCaIOXgduazB
         nSrBAkBIpODvmI9/6jHLc68wRDeGjfBtyrd55635yZ8aDJIVO8XaMLLnAjwnEUL2W5Hz
         NVnzSA+7Sjn5j2Bi2N3Dq3WyHLW4rfXLi6MwJoVtFWDdxHfjmAXhCcYbAnHXNrugd2D1
         q6MA==
X-Forwarded-Encrypted: i=1; AJvYcCVLTZRf75McssGLdXYAzo68lK5+1qoeouSGIO/3IivKMaTzUxRjIgcRgrMkzhYvOwsz9Lo2/qaDPLfOK4XzGJbr9N4=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwJ5bjeTSnzgD2muhUHLHFYUIjDPygIIMUNJe6LJV9Z6hk/zGBb
	vzTp3Lp8B/qzfQFtFonC7DoNTsiYNaNn/u487S2BTusVx1uPoVD0+uqjXMxx1wScVozHWiXGFCh
	tiBvtIcxGknD+4hZuOG0ASDcWHCY=
X-Gm-Gg: ASbGncsiGtgd3icetPRHpZmH8pN0Pmf8QabBAiPoFpZucHbHEln7lpyE2kaCuObCZ4Y
	A9UprarhfHtDCi+Q5VE8ixoM/oDER5g==
X-Google-Smtp-Source: AGHT+IG9p2cN5rmj9AqurcofQsFU2IMPievY3gFv8VmnEIBSAfxuItWi51kHEoZQk+HsQfNw9fzDJu7EElnHi77ZRMo=
X-Received: by 2002:a05:6820:150d:b0:5e5:c456:8996 with SMTP id
 006d021491bc7-5f28700dad2mr7695284eaf.4.1733647295855; Sun, 08 Dec 2024
 00:41:35 -0800 (PST)
MIME-Version: 1.0
References: <20241204045407.2978-1-schonm@gmail.com> <CA+chaQdXHkju6U1355phTU64K6MMR+DrwBbXjyGTsiH+w-j=+A@mail.gmail.com>
 <CABTo8gCw4_9AH557X=yDFvyY+dVPS+0My1atH2hu3jXrwSByEQ@mail.gmail.com>
In-Reply-To: <CABTo8gCw4_9AH557X=yDFvyY+dVPS+0My1atH2hu3jXrwSByEQ@mail.gmail.com>
From: "J. S." <schonm@gmail.com>
Date: Sun, 8 Dec 2024 03:41:25 -0500
Message-ID: <CABTo8gCVzuJ670sZpfvcg93LsLue_pqnYnQ2Wq0UVWPZtW1c0g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] nodejs: upgrade 22.11.0 -> 22.12.0
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Changqing Li <changqing.li@windriver.com>, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Dec 2024 08:41:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114225

Martin,

Building against master-next of meta-openembedded and master-next of
oe-core, with the pam patch reverted (so that I'm building with libpam
1.6.1) I don't encounter issues building core-image-minimal.  I'm
using clang and including nodejs 22.12.0 in my image.

For me, the build completes successfully.  I don't doubt that you are
seeing a problem.  I would really like to understand why I'm not
seeing it in my environment.  Perhaps you have different PACKAGECONFIG
variables set?

Thanks,
Jason Schonberg

=3D=3D=3D
MACHINE=3D"raspberrypi5"
DL_DIR=3D"/home/jason/yocto-downloads"
LICENSE_FLAGS_ACCEPTED:append =3D "commercial synaptics-killswitch"
TOOLCHAIN =3D "clang"
DISTRO_FEATURES +=3D "ld-is-lld opengl ptest systemd usrmerge x11"
CORE_IMAGE_EXTRA_INSTALL +=3D "nodejs"
=3D=3D=3D
BBLAYERS ?=3D " \
  /home/jason/yocto/poky/meta \
  /home/jason/yocto/poky/meta-poky \
  /home/jason/yocto/poky/meta-yocto-bsp \
  /home/jason/yocto/meta-clang \
  /home/jason/yocto/meta-raspberrypi \
  /home/jason/yocto/meta-openembedded/meta-oe \
  /home/jason/yocto/meta-openembedded/meta-python \
  /home/jason/yocto/meta-openembedded/meta-perl \
  /home/jason/yocto/meta-openembedded/meta-networking \
  /home/jason/yocto/meta-openembedded/meta-gnome \
  /home/jason/yocto/meta-openembedded/meta-multimedia \
  /home/jason/yocto/meta-openembedded/meta-xfce \
  /home/jason/yocto/meta-openembedded/meta-webserver \
  "
=3D=3D=3D
Build Configuration:
BB_VERSION           =3D "2.9.1"
BUILD_SYS            =3D "x86_64-linux"
NATIVELSBSTRING      =3D "universal"
TARGET_SYS           =3D "aarch64-poky-linux"
MACHINE              =3D "raspberrypi5"
DISTRO               =3D "poky"
DISTRO_VERSION       =3D "5.1"
TUNE_FEATURES        =3D "aarch64 crypto cortexa76"
TARGET_FPU           =3D ""
meta
meta-poky
meta-yocto-bsp       =3D "master-next:fea80002d5a2cb1d02c6dd4fa6bb91a0475b5=
319"
meta-clang           =3D "master:147349b7334b8a25b96bb08c2361ae0ae95e7eb6"
meta-raspberrypi     =3D "master:aea47ad612bcfbfe07fb941694d3012e018607c0"
meta-oe
meta-python
meta-perl
meta-networking
meta-gnome
meta-multimedia
meta-xfce
meta-webserver       =3D "master-next:c22d454157d2c16f14bbfeffddefb6281cdaf=
d1d"

On Sat, Dec 7, 2024 at 10:59=E2=80=AFAM J. S. <schonm@gmail.com> wrote:
>
> I'm currently seeing a failure building libpam using clang on aarch64.
> But I think that is related to the recent upgrade of the libpam recipe
> to version 1.7.0.
>
> | aarch64-poky-linux-ld.lld: error: version script assignment of
> 'global' to symbol 'pam_sm_acct_mgmt' failed: symbol not defined
> | aarch64-poky-linux-ld.lld: error: version script assignment of
> 'global' to symbol 'pam_sm_chauthtok' failed: symbol not defined
> | aarch64-poky-linux-ld.lld: error: version script assignment of
> 'global' to symbol 'pam_sm_close_session' failed: symbol not defined
> | aarch64-poky-linux-ld.lld: error: version script assignment of
> 'global' to symbol 'pam_sm_open_session' failed: symbol not defined
> | aarch64-poky-linux-clang: error: linker command failed with exit
> code 1 (use -v to see invocation)
>
> On Sat, Dec 7, 2024 at 9:08=E2=80=AFAM Martin Jansa <martin.jansa@gmail.c=
om> wrote:
> >
> > This seems to reintroduce io_uring support in embedded libuv from:
> > https://github.com/nodejs/node/pull/55114/files
> >
> > which leads to the same issues as previous nodejs upgrade in:
> > https://lists.openembedded.org/g/openembedded-devel/message/105583
> > https://git.openembedded.org/meta-openembedded/commit/?id=3Dd08453978c3=
1ee41d28206c6ff198d7d9d701d88
> > https://git.openembedded.org/meta-openembedded/commit/?id=3D0d9351e9290=
f6750e44ab52536bbe9268d5afac3
> > https://git.openembedded.org/meta-openembedded/commit/?id=3D7bb28628991=
ec9be9610540401f7c6cc4c19997f
> >
> > pseudo still doesn't support io_uring:
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15244
> >
> > calling chown in hundreds recipes to work around pseudo limitation
> > doesn't seem good work around.
> >
> > The UV_USE_IO_URING variable still exists in code (even after its
> > documentation was removed in:
> > https://github.com/louwers/node/commit/2b298e132d2f681270e9f3d5eb313491=
4653d2e1
> > ) but it doesn't seem to work.
> >
> > It's failing because the
> > 0001-deps-disable-io_uring-support-in-libuv.patch patch restored in:
> > https://git.openembedded.org/meta-openembedded/diff/meta-oe/recipes-dev=
tools/nodejs/nodejs/0001-deps-disable-io_uring-support-in-libuv.patch?id=3D=
6652b031d7d4d9cabf16d481f3b82115f7d8e15a
> > is wrong (it adds
> > meta-oe/recipes-devtools/nodejs/nodejs/0001-deps-disable-io_uring-suppo=
rt-in-libuv.patch
> > inside nodejs source instead of patching deps/uv/src/unix/linux.c).
> >
> > I've restored the patch properly in:
> > https://lists.openembedded.org/g/openembedded-devel/message/114222
> > but it still isn't enough and recipes fail in do_package or
> > do_package_qa (depending on UID used on host).
> >
> > Reverting to 22.11.0 avoids the issue. Anyone else seeing this?
> >
> > +Changqing Li
> >
> >
> >
> > On Wed, Dec 4, 2024 at 5:54=E2=80=AFAM J. S. via lists.openembedded.org
> > <schonm=3Dgmail.com@lists.openembedded.org> wrote:
> > >
> > > License-Update: Add JSON parsing library under MIT license.
> > >   https://github.com/nodejs/node/pull/56040/commits/27bcd103e775e00eb=
8d03ac37052bbd4ccb6d239
> > >
> > > Drop backported patch fix-build-with-icu-76.patch.  It is already
> > > integrated in this version https://github.com/nodejs/node/pull/56040/=
commits/c3ca978d9c73d1a96f4d5c7bfa3c10ce786b8fe9
> > >
> > > Changelog: https://github.com/nodejs/node/blob/main/doc/changelogs/CH=
ANGELOG_V22.md#22.12.0
> > >
> > > Signed-off-by: Jason Schonberg <schonm@gmail.com>
> > > ---
> > >  .../oe-npm-cache                              |  0
> > >  ....11.bb =3D> nodejs-oe-cache-native_22.12.bb} |  0
> > >  .../nodejs/nodejs/fix-build-with-icu-76.patch | 29 -----------------=
--
> > >  .../{nodejs_22.11.0.bb =3D> nodejs_22.12.0.bb}  |  5 ++--
> > >  4 files changed, 2 insertions(+), 32 deletions(-)
> > >  rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-22.11 =3D> n=
odejs-oe-cache-22.12}/oe-npm-cache (100%)
> > >  rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_22.11=
.bb =3D> nodejs-oe-cache-native_22.12.bb} (100%)
> > >  delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/fix-build-=
with-icu-76.patch
> > >  rename meta-oe/recipes-devtools/nodejs/{nodejs_22.11.0.bb =3D> nodej=
s_22.12.0.bb} (97%)
> > >
> > > diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.11/oe=
-npm-cache b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.12/oe-npm-c=
ache
> > > similarity index 100%
> > > rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.11/oe-=
npm-cache
> > > rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.12/oe-np=
m-cache
> > > diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_2=
2.11.bb b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.12.bb
> > > similarity index 100%
> > > rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22=
.11.bb
> > > rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.1=
2.bb
> > > diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/fix-build-with-ic=
u-76.patch b/meta-oe/recipes-devtools/nodejs/nodejs/fix-build-with-icu-76.p=
atch
> > > deleted file mode 100644
> > > index e8501bcdb..000000000
> > > --- a/meta-oe/recipes-devtools/nodejs/nodejs/fix-build-with-icu-76.pa=
tch
> > > +++ /dev/null
> > > @@ -1,29 +0,0 @@
> > > -From 54299ac3a3d4e4520b8604dce43c2584092ccde2 Mon Sep 17 00:00:00 20=
01
> > > -From: Michael Cho <michael@michaelcho.dev>
> > > -Date: Sun, 27 Oct 2024 10:08:07 -0400
> > > -Subject: [PATCH] build: fix building with system icu 76
> > > -
> > > -ICU 76 decided to reduce overlinking[^1] thus `icu-i18n` will no lon=
ger
> > > -add `icu-uc` when linking to shared libraries. This results in undef=
ined
> > > -symbols/references when trying to build with system ICU 76.
> > > -
> > > -[^1]: unicode-org/icu@199bc82
> > > -
> > > -Upstream-Status: Backport [https://github.com/nodejs/node/commit/815=
17faceac86497b3c8717837f491aa29a5e0f9]
> > > ----
> > > - configure.py | 2 +-
> > > - 1 file changed, 1 insertion(+), 1 deletion(-)
> > > -
> > > -diff --git a/configure.py b/configure.py
> > > -index a5f47af1748903..a4e210261e2e76 100755
> > > ---- a/configure.py
> > > -+++ b/configure.py
> > > -@@ -1879,7 +1879,7 @@ def icu_download(path):
> > > -   elif with_intl =3D=3D 'system-icu':
> > > -     # ICU from pkg-config.
> > > -     o['variables']['v8_enable_i18n_support'] =3D 1
> > > --    pkgicu =3D pkg_config('icu-i18n')
> > > -+    pkgicu =3D pkg_config(['icu-i18n', 'icu-uc'])
> > > -     if not pkgicu[0]:
> > > -       error('''Could not load pkg-config data for "icu-i18n".
> > > -        See above errors or the README.md.''')
> > > diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_22.11.0.bb b/meta=
-oe/recipes-devtools/nodejs/nodejs_22.12.0.bb
> > > similarity index 97%
> > > rename from meta-oe/recipes-devtools/nodejs/nodejs_22.11.0.bb
> > > rename to meta-oe/recipes-devtools/nodejs/nodejs_22.12.0.bb
> > > index 8cbf53978..194df4c33 100644
> > > --- a/meta-oe/recipes-devtools/nodejs/nodejs_22.11.0.bb
> > > +++ b/meta-oe/recipes-devtools/nodejs/nodejs_22.12.0.bb
> > > @@ -1,7 +1,7 @@
> > >  DESCRIPTION =3D "nodeJS Evented I/O for V8 JavaScript"
> > >  HOMEPAGE =3D "http://nodejs.org"
> > >  LICENSE =3D "MIT & ISC & BSD-2-Clause & BSD-3-Clause & Artistic-2.0 =
& Apache-2.0"
> > > -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D25e89142a2f4b075904a9986c=
45fbdb2"
> > > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0bd28a461eccad39f85a29e33=
e8f879f"
> > >
> > >  CVE_PRODUCT =3D "nodejs node.js"
> > >
> > > @@ -28,7 +28,6 @@ SRC_URI =3D "http://nodejs.org/dist/v${PV}/node-v${=
PV}.tar.xz \
> > >             file://0001-deps-disable-io_uring-support-in-libuv.patch =
\
> > >             file://0001-positional-args.patch \
> > >             file://0001-custom-env.patch \
> > > -           file://fix-build-with-icu-76.patch \
> > >             file://run-ptest \
> > >             "
> > >  SRC_URI:append:class-target =3D " \
> > > @@ -37,7 +36,7 @@ SRC_URI:append:class-target =3D " \
> > >  SRC_URI:append:toolchain-clang:powerpc64le =3D " \
> > >             file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.patc=
h \
> > >             "
> > > -SRC_URI[sha256sum] =3D "bbf0297761d53aefda9d7855c57c7d2c272b83a7b5ba=
d4fea9cb29006d8e1d35"
> > > +SRC_URI[sha256sum] =3D "fe1bc4be004dc12721ea2cb671b08a21de01c6976960=
ef8a1248798589679e16"
> > >
> > >  S =3D "${WORKDIR}/node-v${PV}"
> > >
> > > --
> > > 2.43.0
> > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#114193): https://lists.openembedded.org/g/openemb=
edded-devel/message/114193
> > > Mute This Topic: https://lists.openembedded.org/mt/109914816/3617156
> > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsu=
b [martin.jansa@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >

