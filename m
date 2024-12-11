Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4522E7717D
	for <webhook@archiver.kernel.org>; Wed, 11 Dec 2024 23:32:06 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web11.8496.1733959923061684343
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Dec 2024 15:32:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WenIiZmp;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-2967af48248so3636451fac.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Dec 2024 15:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733959922; x=1734564722; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=So2pPeHioI8CzCx16HTv2F6Cqe0ATBqfeJvFTnpxfBw=;
        b=WenIiZmpqNfIdQfg4DjAW+EV3+viLo8n0N+ESwfURkif2TbHUluhE5jXnHvzXutloV
         k54H7VywMULJo49lqE0dIXbbvNgTbYvBPQLZWwG5WAjaGr/523H9x+CN/2yyd+6Vwxnh
         Ajb2WADy85KHQaUmK/zf4Q5KSZ3zPiIgq0oK0F9c08VgbxKk4wtjKPWE1XuARc+nAQjc
         UfxilY1A9KLyH7aX7iPz2shNFM33qYaJXARzKYU6MOf9wx2Fv/A3bF0f3KEsIm7dK/Xx
         qK4eARDoVfXquYPuYCsQhazllzK5PqnDfGyQdPDDPSNtVRtuvwUhMI9Gn9TbbjT+sUS5
         vcbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733959922; x=1734564722;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=So2pPeHioI8CzCx16HTv2F6Cqe0ATBqfeJvFTnpxfBw=;
        b=GkoNG9QRa86K4A4PqR16dS4xuiGLoKLC1KVSmbqlbnhy2xz1/sAGtt7Akfy8ByaDbW
         PEqaqkP+QNeGrzYG67nBmHXKT/yQ18u++YlFnmHu+w26MuO4z1wDuBKpdiQRkS1w3jWU
         ml/j0n+Kitl/tbknmxlLnhMIr03nuufGM36oHuVAKgQaUeU6i9Oszqj5PqP3RNb/oMWM
         HsFQAzqU4gAlTdnkMhskdjoIgIvxCfiPDRIZMJcGcg0R/pXNcu7jfPot9cEAWHCzVZd9
         JesNgCuy+emzQH7HJsKoq55dsU2Czmv+7C1XeNrUiatcvF6zyFf+eatahjVjThjJtlXW
         Mirw==
X-Forwarded-Encrypted: i=1; AJvYcCWCeNo0s5xCTTXOfQJONrefQQERz+8miWNg/l72+c9RadPCcohlG/O0NThs9YA8gndYU7KJzdhdKSD2FX+xo2UM6mw=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyE8DzJXR0NSn+h0emnjzpJMmTCyaS7HpNqChpB+/0PAJV3LNnB
	tjV1m3sg6PCQGcCq2BvmPv/0wJ8LyGynVwGjel5dW/enB4dWQl0mnSle3ZLYEqk3hL1K/Ziaiar
	cdpXuWoVjaPDMkZAftr8zzyOXcoE=
X-Gm-Gg: ASbGnctdUP4tivWO600cJ3B6+xiJSK44DT7hXPrcGJM7Um5Gu+lx0Ef6HvLLyXEptKi
	URmajCqYx/ecDaVvWVRDOoNhT/yGRQvANDbd37GgV2fZJs3Powg==
X-Google-Smtp-Source: AGHT+IG8AvKg4L1izzH2VVG9iHRFXZIRYnR53A4uqc63KtGJA2JRyl2dY64lCle0w/zywnEVT7V2WwFaerztTjsE0Gs=
X-Received: by 2002:a05:6870:d20a:b0:29e:d36:6e39 with SMTP id
 586e51a60fabf-2a012c0e2e9mr2868199fac.10.1733959921970; Wed, 11 Dec 2024
 15:32:01 -0800 (PST)
MIME-Version: 1.0
References: <20241204045407.2978-1-schonm@gmail.com> <CA+chaQdXHkju6U1355phTU64K6MMR+DrwBbXjyGTsiH+w-j=+A@mail.gmail.com>
 <34fde8bf-eeee-4900-b5ee-24849eebce9e@windriver.com> <CA+chaQc-T7-i6Ju9qiyaQVeR6a9gkonmyAXB4M3dVf1WiuRsFA@mail.gmail.com>
 <CABTo8gA3Y=fPX2K1sYFxtMxtUrExvKcHxY2D0VfsR71=V835=g@mail.gmail.com> <CA+chaQehE5=0phBadO=bg7Finw8AKHcsNW489N+07VutfHp_LQ@mail.gmail.com>
In-Reply-To: <CA+chaQehE5=0phBadO=bg7Finw8AKHcsNW489N+07VutfHp_LQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 11 Dec 2024 15:31:35 -0800
Message-ID: <CAMKF1srzH5zXm-5GwpfcZzVSzBaNP2NE0_VKNH_zZOf1A1nuvA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] nodejs: upgrade 22.11.0 -> 22.12.0
To: martin.jansa@gmail.com
Cc: "J. S." <schonm@gmail.com>, Changqing Li <changqing.li@windriver.com>, 
	openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Dec 2024 23:32:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114286

On Wed, Dec 11, 2024 at 4:36=E2=80=AFAM Martin Jansa via
lists.openembedded.org <martin.jansa=3Dgmail.com@lists.openembedded.org>
wrote:
>
> It doesn't fail for me with:
> g++: error: unrecognized command line option =E2=80=98-std=3Dgnu++20=E2=
=80=99; did you
> mean =E2=80=98-std=3Dgnu++2a=E2=80=99?

This seems to be the host compiler being too old  < gcc10 see
https://gcc.gnu.org/projects/cxx-status.html#cxx20

nodejs20+ expects atleast gcc10 these days see
https://github.com/nodejs/node/pull/46806

>
> was it target nodejs or nodejs-native failing for you? I'm using
> reasonably new host OS (ubuntu 20.04, 22.10, gentoo) with new enough
> gcc to recognize gnu++20.
>
> It seems to be added since v22.2.0 already with
> https://github.com/nodejs/node/pull/52838
> https://github.com/nodejs/node/commit/e4b187433de1f71019f248b94b11fcdd6f2=
2c359
>
> Did previous 22.11 build for you?

>
> For the host-user-contaminated issues I've reported I've verified that
> reverting libuv upgrade (as in
> https://git.openembedded.org/meta-openembedded-contrib/commit/?h=3Djansa/=
nodejs&id=3Dec3963c2ec7387e3771364a1bdddea963b3ef075)
> avoids this issue again, but I'm still trying to narrow it down a bit
> or find some small reproducer to more easily debug pseudo (and I'm
> currently failing even to capture full pseudo logs with PSEUDO_DEBUG
> env variable).
>
> So I don't mind keeping this version in master (if nobody else suffers
> from these host-user-contaminated issues) unless revert to 22.11 fixes
> the nodejs build for changqing (which doesn't seem likely to me).

I think we need to fix pseudo and it might be best of all, reverting
will only buy
limited time.

>
> Regards,
>
> On Wed, Dec 11, 2024 at 11:18=E2=80=AFAM J. S. <schonm@gmail.com> wrote:
> >
> > If it is easier to send a patch to revert to nodejs 22.11.0 I wouldn't =
oppose.
> >
> > On Wed, Dec 11, 2024 at 3:05=E2=80=AFAM Martin Jansa <martin.jansa@gmai=
l.com> wrote:
> > >
> > > On Wed, Dec 11, 2024 at 4:49=E2=80=AFAM Changqing Li <changqing.li@wi=
ndriver.com> wrote:
> > > >
> > > >
> > > > On 12/7/24 22:08, Martin Jansa wrote:
> > > >
> > > > CAUTION: This email comes from a non Wind River email account!
> > > > Do not click links or open attachments unless you recognize the sen=
der and know the content is safe.
> > > >
> > > > This seems to reintroduce io_uring support in embedded libuv from:
> > > > https://github.com/nodejs/node/pull/55114/files
> > > >
> > > > I cannot reproduce this issue since I cannot even compile nodejs su=
ccessfully,
> > > >
> > > > poky master qemux86-64,  do_compile failed with error:
> > > >
> > > > g++: error: unrecognized command line option =E2=80=98-std=3Dgnu++2=
0=E2=80=99; did you mean =E2=80=98-std=3Dgnu++2a=E2=80=99?
> > > >
> > > > which leads to the same issues as previous nodejs upgrade in:
> > > > https://lists.openembedded.org/g/openembedded-devel/message/105583
> > > > https://git.openembedded.org/meta-openembedded/commit/?id=3Dd084539=
78c31ee41d28206c6ff198d7d9d701d88
> > > > https://git.openembedded.org/meta-openembedded/commit/?id=3D0d9351e=
9290f6750e44ab52536bbe9268d5afac3
> > > > https://git.openembedded.org/meta-openembedded/commit/?id=3D7bb2862=
8991ec9be9610540401f7c6cc4c19997f
> > > >
> > > > pseudo still doesn't support io_uring:
> > > > https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15244
> > > >
> > > > calling chown in hundreds recipes to work around pseudo limitation
> > > > doesn't seem good work around.
> > > >
> > > > The UV_USE_IO_URING variable still exists in code (even after its
> > > > documentation was removed in:
> > > > https://github.com/louwers/node/commit/2b298e132d2f681270e9f3d5eb31=
34914653d2e1
> > > >
> > > > I think the problem reproduces since io_uring support is enabled ag=
ain by default in above commit, which is in 22.12.0.
> > > >
> > > > for now, UV_USE_IO_URING should still work, we can use export UV_US=
E_IO_URING=3D0 to disable io_uring, but as the doc
> > > >
> > > > said maybe UV_USE_IO_URING will be removed in the future version. s=
o another option is to add a patch to disable io_uring like
> > >
> > > Yes, unfortunately UV_USE_IO_URING doesn't avoid this issue.
> > >
> > > The old minimal reproducer I was using before (com.webos.app.minimal)
> > > doesn't trigger this now, only some other similar apps. I'm trying to
> > > find out which exact call triggers this (as it might be faster to
> > > figure out than bisecting nodejs).
> > >
> > > > this: https://git.openembedded.org/meta-openembedded/diff/meta-oe/r=
ecipes-devtools/nodejs/nodejs/0001-deps-disable-io_uring-support-in-libuv.p=
atch?id=3D0d9351e9290f6750e44ab52536bbe9268d5afac3
> > > >
> > > > ) but it doesn't seem to work.
> > > >
> > > > It's failing because the
> > > > 0001-deps-disable-io_uring-support-in-libuv.patch patch restored in=
:
> > > > https://git.openembedded.org/meta-openembedded/diff/meta-oe/recipes=
-devtools/nodejs/nodejs/0001-deps-disable-io_uring-support-in-libuv.patch?i=
d=3D6652b031d7d4d9cabf16d481f3b82115f7d8e15a
> > > > is wrong (it adds
> > > > meta-oe/recipes-devtools/nodejs/nodejs/0001-deps-disable-io_uring-s=
upport-in-libuv.patch
> > > > inside nodejs source instead of patching deps/uv/src/unix/linux.c).
> > > >
> > > > Yes,  this patch is added wrongly.
> > >
> > > Should I send a patch to just remove it (as it didn't do anything
> > > useful in this form) or wait a bit more until we have a complete fix?
> > >
> > > >
> > > > //Changqing
> > > >
> > > > I've restored the patch properly in:
> > > > https://lists.openembedded.org/g/openembedded-devel/message/114222
> > > > but it still isn't enough and recipes fail in do_package or
> > > > do_package_qa (depending on UID used on host).
> > > > Reverting to 22.11.0 avoids the issue. Anyone else seeing this?
> > > >
> > > > +Changqing Li
> > > >
> > > >
> > > >
> > > > On Wed, Dec 4, 2024 at 5:54=E2=80=AFAM J. S. via lists.openembedded=
.org
> > > > <schonm=3Dgmail.com@lists.openembedded.org> wrote:
> > > >
> > > > License-Update: Add JSON parsing library under MIT license.
> > > >   https://github.com/nodejs/node/pull/56040/commits/27bcd103e775e00=
eb8d03ac37052bbd4ccb6d239
> > > >
> > > > Drop backported patch fix-build-with-icu-76.patch.  It is already
> > > > integrated in this version https://github.com/nodejs/node/pull/5604=
0/commits/c3ca978d9c73d1a96f4d5c7bfa3c10ce786b8fe9
> > > >
> > > > Changelog: https://github.com/nodejs/node/blob/main/doc/changelogs/=
CHANGELOG_V22.md#22.12.0
> > > >
> > > > Signed-off-by: Jason Schonberg <schonm@gmail.com>
> > > > ---
> > > >  .../oe-npm-cache                              |  0
> > > >  ....11.bb =3D> nodejs-oe-cache-native_22.12.bb} |  0
> > > >  .../nodejs/nodejs/fix-build-with-icu-76.patch | 29 ---------------=
----
> > > >  .../{nodejs_22.11.0.bb =3D> nodejs_22.12.0.bb}  |  5 ++--
> > > >  4 files changed, 2 insertions(+), 32 deletions(-)
> > > >  rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-22.11 =3D>=
 nodejs-oe-cache-22.12}/oe-npm-cache (100%)
> > > >  rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_22.=
11.bb =3D> nodejs-oe-cache-native_22.12.bb} (100%)
> > > >  delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/fix-buil=
d-with-icu-76.patch
> > > >  rename meta-oe/recipes-devtools/nodejs/{nodejs_22.11.0.bb =3D> nod=
ejs_22.12.0.bb} (97%)
> > > >
> > > > diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.11/=
oe-npm-cache b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.12/oe-npm=
-cache
> > > > similarity index 100%
> > > > rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.11/o=
e-npm-cache
> > > > rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.12/oe-=
npm-cache
> > > > diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native=
_22.11.bb b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.12.bb
> > > > similarity index 100%
> > > > rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_=
22.11.bb
> > > > rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22=
.12.bb
> > > > diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/fix-build-with-=
icu-76.patch b/meta-oe/recipes-devtools/nodejs/nodejs/fix-build-with-icu-76=
.patch
> > > > deleted file mode 100644
> > > > index e8501bcdb..000000000
> > > > --- a/meta-oe/recipes-devtools/nodejs/nodejs/fix-build-with-icu-76.=
patch
> > > > +++ /dev/null
> > > > @@ -1,29 +0,0 @@
> > > > -From 54299ac3a3d4e4520b8604dce43c2584092ccde2 Mon Sep 17 00:00:00 =
2001
> > > > -From: Michael Cho <michael@michaelcho.dev>
> > > > -Date: Sun, 27 Oct 2024 10:08:07 -0400
> > > > -Subject: [PATCH] build: fix building with system icu 76
> > > > -
> > > > -ICU 76 decided to reduce overlinking[^1] thus `icu-i18n` will no l=
onger
> > > > -add `icu-uc` when linking to shared libraries. This results in und=
efined
> > > > -symbols/references when trying to build with system ICU 76.
> > > > -
> > > > -[^1]: unicode-org/icu@199bc82
> > > > -
> > > > -Upstream-Status: Backport [https://github.com/nodejs/node/commit/8=
1517faceac86497b3c8717837f491aa29a5e0f9]
> > > > ----
> > > > - configure.py | 2 +-
> > > > - 1 file changed, 1 insertion(+), 1 deletion(-)
> > > > -
> > > > -diff --git a/configure.py b/configure.py
> > > > -index a5f47af1748903..a4e210261e2e76 100755
> > > > ---- a/configure.py
> > > > -+++ b/configure.py
> > > > -@@ -1879,7 +1879,7 @@ def icu_download(path):
> > > > -   elif with_intl =3D=3D 'system-icu':
> > > > -     # ICU from pkg-config.
> > > > -     o['variables']['v8_enable_i18n_support'] =3D 1
> > > > --    pkgicu =3D pkg_config('icu-i18n')
> > > > -+    pkgicu =3D pkg_config(['icu-i18n', 'icu-uc'])
> > > > -     if not pkgicu[0]:
> > > > -       error('''Could not load pkg-config data for "icu-i18n".
> > > > -        See above errors or the README.md.''')
> > > > diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_22.11.0.bb b/me=
ta-oe/recipes-devtools/nodejs/nodejs_22.12.0.bb
> > > > similarity index 97%
> > > > rename from meta-oe/recipes-devtools/nodejs/nodejs_22.11.0.bb
> > > > rename to meta-oe/recipes-devtools/nodejs/nodejs_22.12.0.bb
> > > > index 8cbf53978..194df4c33 100644
> > > > --- a/meta-oe/recipes-devtools/nodejs/nodejs_22.11.0.bb
> > > > +++ b/meta-oe/recipes-devtools/nodejs/nodejs_22.12.0.bb
> > > > @@ -1,7 +1,7 @@
> > > >  DESCRIPTION =3D "nodeJS Evented I/O for V8 JavaScript"
> > > >  HOMEPAGE =3D "http://nodejs.org"
> > > >  LICENSE =3D "MIT & ISC & BSD-2-Clause & BSD-3-Clause & Artistic-2.=
0 & Apache-2.0"
> > > > -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D25e89142a2f4b075904a998=
6c45fbdb2"
> > > > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0bd28a461eccad39f85a29e=
33e8f879f"
> > > >
> > > >  CVE_PRODUCT =3D "nodejs node.js"
> > > >
> > > > @@ -28,7 +28,6 @@ SRC_URI =3D "http://nodejs.org/dist/v${PV}/node-v=
${PV}.tar.xz \
> > > >             file://0001-deps-disable-io_uring-support-in-libuv.patc=
h \
> > > >             file://0001-positional-args.patch \
> > > >             file://0001-custom-env.patch \
> > > > -           file://fix-build-with-icu-76.patch \
> > > >             file://run-ptest \
> > > >             "
> > > >  SRC_URI:append:class-target =3D " \
> > > > @@ -37,7 +36,7 @@ SRC_URI:append:class-target =3D " \
> > > >  SRC_URI:append:toolchain-clang:powerpc64le =3D " \
> > > >             file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.pa=
tch \
> > > >             "
> > > > -SRC_URI[sha256sum] =3D "bbf0297761d53aefda9d7855c57c7d2c272b83a7b5=
bad4fea9cb29006d8e1d35"
> > > > +SRC_URI[sha256sum] =3D "fe1bc4be004dc12721ea2cb671b08a21de01c69769=
60ef8a1248798589679e16"
> > > >
> > > >  S =3D "${WORKDIR}/node-v${PV}"
> > > >
> > > > --
> > > > 2.43.0
> > > >
> > > >
> > > >
> > > >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#114278): https://lists.openembedded.org/g/openembedde=
d-devel/message/114278
> Mute This Topic: https://lists.openembedded.org/mt/109914816/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

