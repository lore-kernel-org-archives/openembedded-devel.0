Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC041E7717D
	for <webhook@archiver.kernel.org>; Wed, 11 Dec 2024 12:36:24 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.9879.1733920576441565053
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Dec 2024 04:36:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AaLINHJ2;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5401c68b89eso757414e87.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Dec 2024 04:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733920574; x=1734525374; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3zzsYChi5w/Dp/3z27IOe/tu1G7jZsOBbTz/uaROcKI=;
        b=AaLINHJ2B67LnMjHOJc+JyqMjqg/zph63ETznk9d3dGMn/XUYXRbQSqrXfs/7X5xJa
         OAiXDHwMBz5Ziq2G6ciSPgbnh3gxivbLyo0A3tc4ucPFJvxhePgzxkEjNOSZiNVr57x2
         rHrHNX7Aq7lDCYFVOhyaPPIa9lSB6KWMaRX08XFUJEu2RWGEsdWNUQO1HYK7UWQYzbGX
         ryEfGIj7nAIPAPKWDF42G8XHzYOU9467wKhytDtbPmVM3O3rX8Fxpu4+DTrAqGPz9fvL
         a5deCv79Kk2knInedyp5cd5eEK4S07ZIgfcMrcxErO9wZ5pWhGsHz07HkH75F69i6TKE
         1dsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733920574; x=1734525374;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3zzsYChi5w/Dp/3z27IOe/tu1G7jZsOBbTz/uaROcKI=;
        b=qzIlUSpIdsc3hH4pbk3HXRcZNlXxACzas3v77rxAmYjgIqAFd+YcDX0mivvR3Jee8a
         WtU0zL0CkKiYcFd2jAMn0WJx0ypvN4n3MrteemcI6jCIhBcSfaCp31Gi82nitqqZP3WF
         HP8LGlj7F9O74i4/jNJKF5DnMXfwrEYqP81I984Jfw9YUWMJIu2yBHJ1yg33VUAmqFqH
         UqfI+FRD/Bm3wisdSTURZLd1qLIfncNYj+KcdGu0Dnu3aAJBKUUZnThKv2mJTWS9BzVy
         KjVh1qtuh4+75129Ipov/Pg0RHZ/u3vhuuCHVZResw5DcdkTJP6H74V4HoimgNzCs5vy
         Sb9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUDHNU2sxT6G2pRTwY+2ur9cHRKqqbvbHU7Xte+/+RJnjgSwzfOwkJcVyO3to1xpqihHDKON4rm/waIZRYaWJ7+2nY=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwWytFeabfLkHT/fmuBvrSXelenrrjJwQZGy0wxV3SXM0IN0lH0
	svmDPtvxjdXTymADPaVZhFW1uJs0RmzCUCKpVmxHb9BPV71Bpp7TYe+aFSdzzv4fnO0/jVEaWME
	z2XfNXk8Qqaw/qyUwOc3Zl/NnqR0=
X-Gm-Gg: ASbGncuiSIlASKxJAkcEEVHi09eFNflnIBimyC+AQ+maK5IwRVisL7ea3MkW4UpEgpC
	pV/Nlt7Ke72g/iaFhb8wD1IFJDqdeebUzws3cVQ==
X-Google-Smtp-Source: AGHT+IFKFVkqXBe7ztm2/i6zXYtF9+OfVfrcIG+V2K61+J+ZA65TIA6pkUylYC8CRflF50roPFDVuTCPs5i8sjOHyqA=
X-Received: by 2002:a05:6512:2824:b0:540:20c5:f847 with SMTP id
 2adb3069b0e04-5402a7890e4mr760483e87.22.1733920574022; Wed, 11 Dec 2024
 04:36:14 -0800 (PST)
MIME-Version: 1.0
References: <20241204045407.2978-1-schonm@gmail.com> <CA+chaQdXHkju6U1355phTU64K6MMR+DrwBbXjyGTsiH+w-j=+A@mail.gmail.com>
 <34fde8bf-eeee-4900-b5ee-24849eebce9e@windriver.com> <CA+chaQc-T7-i6Ju9qiyaQVeR6a9gkonmyAXB4M3dVf1WiuRsFA@mail.gmail.com>
 <CABTo8gA3Y=fPX2K1sYFxtMxtUrExvKcHxY2D0VfsR71=V835=g@mail.gmail.com>
In-Reply-To: <CABTo8gA3Y=fPX2K1sYFxtMxtUrExvKcHxY2D0VfsR71=V835=g@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 11 Dec 2024 13:36:01 +0100
Message-ID: <CA+chaQehE5=0phBadO=bg7Finw8AKHcsNW489N+07VutfHp_LQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] nodejs: upgrade 22.11.0 -> 22.12.0
To: "J. S." <schonm@gmail.com>
Cc: Changqing Li <changqing.li@windriver.com>, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Dec 2024 12:36:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114278

It doesn't fail for me with:
g++: error: unrecognized command line option =E2=80=98-std=3Dgnu++20=E2=80=
=99; did you
mean =E2=80=98-std=3Dgnu++2a=E2=80=99?

was it target nodejs or nodejs-native failing for you? I'm using
reasonably new host OS (ubuntu 20.04, 22.10, gentoo) with new enough
gcc to recognize gnu++20.

It seems to be added since v22.2.0 already with
https://github.com/nodejs/node/pull/52838
https://github.com/nodejs/node/commit/e4b187433de1f71019f248b94b11fcdd6f22c=
359

Did previous 22.11 build for you?

For the host-user-contaminated issues I've reported I've verified that
reverting libuv upgrade (as in
https://git.openembedded.org/meta-openembedded-contrib/commit/?h=3Djansa/no=
dejs&id=3Dec3963c2ec7387e3771364a1bdddea963b3ef075)
avoids this issue again, but I'm still trying to narrow it down a bit
or find some small reproducer to more easily debug pseudo (and I'm
currently failing even to capture full pseudo logs with PSEUDO_DEBUG
env variable).

So I don't mind keeping this version in master (if nobody else suffers
from these host-user-contaminated issues) unless revert to 22.11 fixes
the nodejs build for changqing (which doesn't seem likely to me).

Regards,

On Wed, Dec 11, 2024 at 11:18=E2=80=AFAM J. S. <schonm@gmail.com> wrote:
>
> If it is easier to send a patch to revert to nodejs 22.11.0 I wouldn't op=
pose.
>
> On Wed, Dec 11, 2024 at 3:05=E2=80=AFAM Martin Jansa <martin.jansa@gmail.=
com> wrote:
> >
> > On Wed, Dec 11, 2024 at 4:49=E2=80=AFAM Changqing Li <changqing.li@wind=
river.com> wrote:
> > >
> > >
> > > On 12/7/24 22:08, Martin Jansa wrote:
> > >
> > > CAUTION: This email comes from a non Wind River email account!
> > > Do not click links or open attachments unless you recognize the sende=
r and know the content is safe.
> > >
> > > This seems to reintroduce io_uring support in embedded libuv from:
> > > https://github.com/nodejs/node/pull/55114/files
> > >
> > > I cannot reproduce this issue since I cannot even compile nodejs succ=
essfully,
> > >
> > > poky master qemux86-64,  do_compile failed with error:
> > >
> > > g++: error: unrecognized command line option =E2=80=98-std=3Dgnu++20=
=E2=80=99; did you mean =E2=80=98-std=3Dgnu++2a=E2=80=99?
> > >
> > > which leads to the same issues as previous nodejs upgrade in:
> > > https://lists.openembedded.org/g/openembedded-devel/message/105583
> > > https://git.openembedded.org/meta-openembedded/commit/?id=3Dd08453978=
c31ee41d28206c6ff198d7d9d701d88
> > > https://git.openembedded.org/meta-openembedded/commit/?id=3D0d9351e92=
90f6750e44ab52536bbe9268d5afac3
> > > https://git.openembedded.org/meta-openembedded/commit/?id=3D7bb286289=
91ec9be9610540401f7c6cc4c19997f
> > >
> > > pseudo still doesn't support io_uring:
> > > https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15244
> > >
> > > calling chown in hundreds recipes to work around pseudo limitation
> > > doesn't seem good work around.
> > >
> > > The UV_USE_IO_URING variable still exists in code (even after its
> > > documentation was removed in:
> > > https://github.com/louwers/node/commit/2b298e132d2f681270e9f3d5eb3134=
914653d2e1
> > >
> > > I think the problem reproduces since io_uring support is enabled agai=
n by default in above commit, which is in 22.12.0.
> > >
> > > for now, UV_USE_IO_URING should still work, we can use export UV_USE_=
IO_URING=3D0 to disable io_uring, but as the doc
> > >
> > > said maybe UV_USE_IO_URING will be removed in the future version. so =
another option is to add a patch to disable io_uring like
> >
> > Yes, unfortunately UV_USE_IO_URING doesn't avoid this issue.
> >
> > The old minimal reproducer I was using before (com.webos.app.minimal)
> > doesn't trigger this now, only some other similar apps. I'm trying to
> > find out which exact call triggers this (as it might be faster to
> > figure out than bisecting nodejs).
> >
> > > this: https://git.openembedded.org/meta-openembedded/diff/meta-oe/rec=
ipes-devtools/nodejs/nodejs/0001-deps-disable-io_uring-support-in-libuv.pat=
ch?id=3D0d9351e9290f6750e44ab52536bbe9268d5afac3
> > >
> > > ) but it doesn't seem to work.
> > >
> > > It's failing because the
> > > 0001-deps-disable-io_uring-support-in-libuv.patch patch restored in:
> > > https://git.openembedded.org/meta-openembedded/diff/meta-oe/recipes-d=
evtools/nodejs/nodejs/0001-deps-disable-io_uring-support-in-libuv.patch?id=
=3D6652b031d7d4d9cabf16d481f3b82115f7d8e15a
> > > is wrong (it adds
> > > meta-oe/recipes-devtools/nodejs/nodejs/0001-deps-disable-io_uring-sup=
port-in-libuv.patch
> > > inside nodejs source instead of patching deps/uv/src/unix/linux.c).
> > >
> > > Yes,  this patch is added wrongly.
> >
> > Should I send a patch to just remove it (as it didn't do anything
> > useful in this form) or wait a bit more until we have a complete fix?
> >
> > >
> > > //Changqing
> > >
> > > I've restored the patch properly in:
> > > https://lists.openembedded.org/g/openembedded-devel/message/114222
> > > but it still isn't enough and recipes fail in do_package or
> > > do_package_qa (depending on UID used on host).
> > > Reverting to 22.11.0 avoids the issue. Anyone else seeing this?
> > >
> > > +Changqing Li
> > >
> > >
> > >
> > > On Wed, Dec 4, 2024 at 5:54=E2=80=AFAM J. S. via lists.openembedded.o=
rg
> > > <schonm=3Dgmail.com@lists.openembedded.org> wrote:
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

