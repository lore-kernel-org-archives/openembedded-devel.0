Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 270C7E7717D
	for <webhook@archiver.kernel.org>; Wed, 11 Dec 2024 10:18:34 +0000 (UTC)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
 by mx.groups.io with SMTP id smtpd.web10.7640.1733912312828226092
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Dec 2024 02:18:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eC0HYoZ1;
 spf=pass (domain: gmail.com, ip: 209.85.161.44, mailfrom: schonm@gmail.com)
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5f2d8f62290so470142eaf.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Dec 2024 02:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733912312; x=1734517112; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ckP4BsLFQKueJQs/wbGs7ZWjlksBC+diluKJ+BjoFyw=;
        b=eC0HYoZ1Qia/Rf5yR94OHEo/2m/s8tSLJppf0VV2sgDRl9UgPaDsuiGfmhLsLWFMtV
         dm1eJ0fGcie4UgdOkHn+Q24x8hW+lANCLmCZO3V6UoiyRY95cp1Qk3q8HmAAq2XYHprG
         SdQO+ihwqrflNDMRy6WD8upWNA7/TsaB2kGSpu3OMJ3u0TD5vHT2VzFqAgENbP6nTzNM
         OmUW/UrfgTUDJTl1ZoRBX3JhqdctJZBu7Q+ATY2tp9XKwlbNJH2XKIz7AI0ZsNvgkaVy
         TEV28Uy4Xltf1MSNS+FaupcRQsFuKeMv0plFpfimWK9AlRw5PHoB3/7i/3diWULby5Hz
         9yIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733912312; x=1734517112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ckP4BsLFQKueJQs/wbGs7ZWjlksBC+diluKJ+BjoFyw=;
        b=nJWCTp53G5SBxuUhu1UlzPZ1GoBGojmgMRR7rCttNMqk1VWLb0gwIKY6sETOJaYGDO
         ZRru+JL0e+yFArhgnTMKqxqmzax2SO+qQIL1fB6rUn/vehEwwonePyXwkexs2ngRTana
         Y2x6kyvMy505wCETyypSvzSOgQ9IBZcRn2T4JTpsMvJGWF4JAhjuUCwi3+xsiL0arqfD
         a2tJj0pu0TgFEknaBqrNJ0cbiIouhsTP8TxCAp1hXjUs6ffKRzQvkpMSaL0ZqVmQlTc+
         bMtxdPV/J9SWb1W7nacCUBa7etre8rWLJ69ljdg/w1LMeo1i8uBmK5jpJxMKndsayVht
         SUAQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4Pl7AnOdUieEzR5QZCpYvbEHU+CS5u3ilc3oOFedJo7fdQWVsUHNe3EPSB4hIzCo6fV6hOJVnKdlAeQtYDxptyJk=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyk0oMzM6SDNYaSf1J8KyoeePMon/jOoxweNmxESlYuwovWr/wq
	GiogAc63b9NdXFQtz+IKSCpHVa2KqaSWQH8DnKD0M4yz82ILv7xgZyPZueUvrqhnyX2hPLIm+97
	WKRad36OPiALZ1JZCL9LOtqsd3vs=
X-Gm-Gg: ASbGncvh+OdAfohBOkPDMcac6kcWOD1+qOD3vUBYt13JquAISdtAGD3DQAYMje/5hxZ
	9NrjoN/0lRo/Fe2GWL+f3Tnoio/TPE9K3Rw==
X-Google-Smtp-Source: AGHT+IG4mqBsduGVb0BXLVP4azOlBtsUQdFZ1EI3SNCGd7nspWqIkFfvuHtGIUOlMolHekSQaPHV2pn68T+QVNtjvis=
X-Received: by 2002:a05:6820:1b87:b0:5f2:c911:a6fa with SMTP id
 006d021491bc7-5f2da03d902mr1118781eaf.1.1733912311274; Wed, 11 Dec 2024
 02:18:31 -0800 (PST)
MIME-Version: 1.0
References: <20241204045407.2978-1-schonm@gmail.com> <CA+chaQdXHkju6U1355phTU64K6MMR+DrwBbXjyGTsiH+w-j=+A@mail.gmail.com>
 <34fde8bf-eeee-4900-b5ee-24849eebce9e@windriver.com> <CA+chaQc-T7-i6Ju9qiyaQVeR6a9gkonmyAXB4M3dVf1WiuRsFA@mail.gmail.com>
In-Reply-To: <CA+chaQc-T7-i6Ju9qiyaQVeR6a9gkonmyAXB4M3dVf1WiuRsFA@mail.gmail.com>
From: "J. S." <schonm@gmail.com>
Date: Wed, 11 Dec 2024 05:18:20 -0500
Message-ID: <CABTo8gA3Y=fPX2K1sYFxtMxtUrExvKcHxY2D0VfsR71=V835=g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] nodejs: upgrade 22.11.0 -> 22.12.0
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Changqing Li <changqing.li@windriver.com>, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Dec 2024 10:18:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114277

If it is easier to send a patch to revert to nodejs 22.11.0 I wouldn't oppo=
se.

On Wed, Dec 11, 2024 at 3:05=E2=80=AFAM Martin Jansa <martin.jansa@gmail.co=
m> wrote:
>
> On Wed, Dec 11, 2024 at 4:49=E2=80=AFAM Changqing Li <changqing.li@windri=
ver.com> wrote:
> >
> >
> > On 12/7/24 22:08, Martin Jansa wrote:
> >
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
> >
> > This seems to reintroduce io_uring support in embedded libuv from:
> > https://github.com/nodejs/node/pull/55114/files
> >
> > I cannot reproduce this issue since I cannot even compile nodejs succes=
sfully,
> >
> > poky master qemux86-64,  do_compile failed with error:
> >
> > g++: error: unrecognized command line option =E2=80=98-std=3Dgnu++20=E2=
=80=99; did you mean =E2=80=98-std=3Dgnu++2a=E2=80=99?
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
> >
> > I think the problem reproduces since io_uring support is enabled again =
by default in above commit, which is in 22.12.0.
> >
> > for now, UV_USE_IO_URING should still work, we can use export UV_USE_IO=
_URING=3D0 to disable io_uring, but as the doc
> >
> > said maybe UV_USE_IO_URING will be removed in the future version. so an=
other option is to add a patch to disable io_uring like
>
> Yes, unfortunately UV_USE_IO_URING doesn't avoid this issue.
>
> The old minimal reproducer I was using before (com.webos.app.minimal)
> doesn't trigger this now, only some other similar apps. I'm trying to
> find out which exact call triggers this (as it might be faster to
> figure out than bisecting nodejs).
>
> > this: https://git.openembedded.org/meta-openembedded/diff/meta-oe/recip=
es-devtools/nodejs/nodejs/0001-deps-disable-io_uring-support-in-libuv.patch=
?id=3D0d9351e9290f6750e44ab52536bbe9268d5afac3
> >
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
> > Yes,  this patch is added wrongly.
>
> Should I send a patch to just remove it (as it didn't do anything
> useful in this form) or wait a bit more until we have a complete fix?
>
> >
> > //Changqing
> >
> > I've restored the patch properly in:
> > https://lists.openembedded.org/g/openembedded-devel/message/114222
> > but it still isn't enough and recipes fail in do_package or
> > do_package_qa (depending on UID used on host).
> > Reverting to 22.11.0 avoids the issue. Anyone else seeing this?
> >
> > +Changqing Li
> >
> >
> >
> > On Wed, Dec 4, 2024 at 5:54=E2=80=AFAM J. S. via lists.openembedded.org
> > <schonm=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > License-Update: Add JSON parsing library under MIT license.
> >   https://github.com/nodejs/node/pull/56040/commits/27bcd103e775e00eb8d=
03ac37052bbd4ccb6d239
> >
> > Drop backported patch fix-build-with-icu-76.patch.  It is already
> > integrated in this version https://github.com/nodejs/node/pull/56040/co=
mmits/c3ca978d9c73d1a96f4d5c7bfa3c10ce786b8fe9
> >
> > Changelog: https://github.com/nodejs/node/blob/main/doc/changelogs/CHAN=
GELOG_V22.md#22.12.0
> >
> > Signed-off-by: Jason Schonberg <schonm@gmail.com>
> > ---
> >  .../oe-npm-cache                              |  0
> >  ....11.bb =3D> nodejs-oe-cache-native_22.12.bb} |  0
> >  .../nodejs/nodejs/fix-build-with-icu-76.patch | 29 -------------------
> >  .../{nodejs_22.11.0.bb =3D> nodejs_22.12.0.bb}  |  5 ++--
> >  4 files changed, 2 insertions(+), 32 deletions(-)
> >  rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-22.11 =3D> nod=
ejs-oe-cache-22.12}/oe-npm-cache (100%)
> >  rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_22.11.b=
b =3D> nodejs-oe-cache-native_22.12.bb} (100%)
> >  delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/fix-build-wi=
th-icu-76.patch
> >  rename meta-oe/recipes-devtools/nodejs/{nodejs_22.11.0.bb =3D> nodejs_=
22.12.0.bb} (97%)
> >
> > diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.11/oe-n=
pm-cache b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.12/oe-npm-cac=
he
> > similarity index 100%
> > rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.11/oe-np=
m-cache
> > rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.12/oe-npm-=
cache
> > diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.=
11.bb b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.12.bb
> > similarity index 100%
> > rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.1=
1.bb
> > rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.12.=
bb
> > diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/fix-build-with-icu-=
76.patch b/meta-oe/recipes-devtools/nodejs/nodejs/fix-build-with-icu-76.pat=
ch
> > deleted file mode 100644
> > index e8501bcdb..000000000
> > --- a/meta-oe/recipes-devtools/nodejs/nodejs/fix-build-with-icu-76.patc=
h
> > +++ /dev/null
> > @@ -1,29 +0,0 @@
> > -From 54299ac3a3d4e4520b8604dce43c2584092ccde2 Mon Sep 17 00:00:00 2001
> > -From: Michael Cho <michael@michaelcho.dev>
> > -Date: Sun, 27 Oct 2024 10:08:07 -0400
> > -Subject: [PATCH] build: fix building with system icu 76
> > -
> > -ICU 76 decided to reduce overlinking[^1] thus `icu-i18n` will no longe=
r
> > -add `icu-uc` when linking to shared libraries. This results in undefin=
ed
> > -symbols/references when trying to build with system ICU 76.
> > -
> > -[^1]: unicode-org/icu@199bc82
> > -
> > -Upstream-Status: Backport [https://github.com/nodejs/node/commit/81517=
faceac86497b3c8717837f491aa29a5e0f9]
> > ----
> > - configure.py | 2 +-
> > - 1 file changed, 1 insertion(+), 1 deletion(-)
> > -
> > -diff --git a/configure.py b/configure.py
> > -index a5f47af1748903..a4e210261e2e76 100755
> > ---- a/configure.py
> > -+++ b/configure.py
> > -@@ -1879,7 +1879,7 @@ def icu_download(path):
> > -   elif with_intl =3D=3D 'system-icu':
> > -     # ICU from pkg-config.
> > -     o['variables']['v8_enable_i18n_support'] =3D 1
> > --    pkgicu =3D pkg_config('icu-i18n')
> > -+    pkgicu =3D pkg_config(['icu-i18n', 'icu-uc'])
> > -     if not pkgicu[0]:
> > -       error('''Could not load pkg-config data for "icu-i18n".
> > -        See above errors or the README.md.''')
> > diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_22.11.0.bb b/meta-o=
e/recipes-devtools/nodejs/nodejs_22.12.0.bb
> > similarity index 97%
> > rename from meta-oe/recipes-devtools/nodejs/nodejs_22.11.0.bb
> > rename to meta-oe/recipes-devtools/nodejs/nodejs_22.12.0.bb
> > index 8cbf53978..194df4c33 100644
> > --- a/meta-oe/recipes-devtools/nodejs/nodejs_22.11.0.bb
> > +++ b/meta-oe/recipes-devtools/nodejs/nodejs_22.12.0.bb
> > @@ -1,7 +1,7 @@
> >  DESCRIPTION =3D "nodeJS Evented I/O for V8 JavaScript"
> >  HOMEPAGE =3D "http://nodejs.org"
> >  LICENSE =3D "MIT & ISC & BSD-2-Clause & BSD-3-Clause & Artistic-2.0 & =
Apache-2.0"
> > -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D25e89142a2f4b075904a9986c45=
fbdb2"
> > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0bd28a461eccad39f85a29e33e8=
f879f"
> >
> >  CVE_PRODUCT =3D "nodejs node.js"
> >
> > @@ -28,7 +28,6 @@ SRC_URI =3D "http://nodejs.org/dist/v${PV}/node-v${PV=
}.tar.xz \
> >             file://0001-deps-disable-io_uring-support-in-libuv.patch \
> >             file://0001-positional-args.patch \
> >             file://0001-custom-env.patch \
> > -           file://fix-build-with-icu-76.patch \
> >             file://run-ptest \
> >             "
> >  SRC_URI:append:class-target =3D " \
> > @@ -37,7 +36,7 @@ SRC_URI:append:class-target =3D " \
> >  SRC_URI:append:toolchain-clang:powerpc64le =3D " \
> >             file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch =
\
> >             "
> > -SRC_URI[sha256sum] =3D "bbf0297761d53aefda9d7855c57c7d2c272b83a7b5bad4=
fea9cb29006d8e1d35"
> > +SRC_URI[sha256sum] =3D "fe1bc4be004dc12721ea2cb671b08a21de01c6976960ef=
8a1248798589679e16"
> >
> >  S =3D "${WORKDIR}/node-v${PV}"
> >
> > --
> > 2.43.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#114193): https://lists.openembedded.org/g/openembed=
ded-devel/message/114193
> > Mute This Topic: https://lists.openembedded.org/mt/109914816/3617156
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[martin.jansa@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

