Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7780E7717B
	for <webhook@archiver.kernel.org>; Sat,  7 Dec 2024 15:59:40 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
 by mx.groups.io with SMTP id smtpd.web10.62577.1733587170995952311
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Dec 2024 07:59:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Nx0Q2pNV;
 spf=pass (domain: gmail.com, ip: 209.85.161.50, mailfrom: schonm@gmail.com)
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-5f1ed6ee4d6so1572067eaf.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Dec 2024 07:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733587170; x=1734191970; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NhYNdn7QLMF+l96HE4B0cpnlSCTgQCZciiZnKGewDcs=;
        b=Nx0Q2pNVCelfonPB5Kiw+G9fuEZWp6xn/VgrLtQDHgAfGTjdshZNfXOZ7NVlBV4dns
         BXx+rSswV4KshqocQHYR139w/THIC8ELxBcfPqemo9+qaySlIea4TxE/LIf+/GGXPImf
         KXeg67Y5or5FK+LRIUNO0dNmpyL41nUNhE2N998h3+xVTukot74E1bPa6GacE3uV7eBJ
         fW4+0Lxqkysn6/lb03FV/0dHhNCMxQqtBBParaeai5VJE4tI0H9G7qd5iGNdipjzCp12
         W1JTXwSUbkeXF52ACp8dWQe7Zs9Tq08SrclnMOTvN3fDxWWJvpMBYi7DTn5YjlB+3eQf
         4Xcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733587170; x=1734191970;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NhYNdn7QLMF+l96HE4B0cpnlSCTgQCZciiZnKGewDcs=;
        b=Oeb9pREwZ0pSVYq1ovV2jJsh5QUdKEYR2DbNxsge0FNKkAZaFPY59Ot+3rDQxqVPsh
         Q1ikoJzxK8WkvQhz7eKzFcrBf7Oq+XnvfZp0ZFTbFZZWpr741wQL4uEtIKrKPAMLoCJL
         H6Tq7X20kn57+eAF1Yt7f7oZfKtEec/LJcRYeNDffp8kp9NdJSiUGyAc96H/sN7tYlDj
         d+WzFmi3d7B9R24kHN1yvW14tdjyiJ2ABrftp2vpRv7DN0fPffRj73mQoXFhxQhAdIss
         tIlVwPZ0UWKFZazgNSPLCme3DPmdW9psckBIbBb9oVBliDQhCC+JQRdMHIDBEstpYKio
         NLhg==
X-Forwarded-Encrypted: i=1; AJvYcCXUOp5uu0kWqv6KX4nZxLZ+xVUXeih7zM+0G3DP5FOMYFOJr3iAKgg6lVpE9FV72M5XdbRATWAPb5bywXaRMiOmluk=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzRBA7k/eqYy5jTxhkdUAEzG8i3StPdZpbEu3M2chJ59e43s35C
	GGbgNY6J8Y2VKjISLgRnlSqiEKa8lAoAWatcQwg1nBdRCObZEtSCmhARuQP+9/BFtbdDw8ngyc1
	ew5ysGE9JHF3YhU6u44dg0xFWD4A=
X-Gm-Gg: ASbGnctIv4Si9uLqkmt1gf/6/jtEy+3Mno3ngLwPof1PlB8b/phlWRx7qXEIiv8tv88
	48QBcNsw6cz7G/I0y1lpQ7D67zr3Cgg==
X-Google-Smtp-Source: AGHT+IFukJR78SPY4u6oKo/BLsI/rxtQzBe3Al7MKPWsOC1nLlarVj9E/yYDn9+4hoso80bMJ9ga925suEsvgYKsxMU=
X-Received: by 2002:a05:6820:16a9:b0:5f2:5dfd:ecba with SMTP id
 006d021491bc7-5f286e777dbmr5042892eaf.1.1733587169870; Sat, 07 Dec 2024
 07:59:29 -0800 (PST)
MIME-Version: 1.0
References: <20241204045407.2978-1-schonm@gmail.com> <CA+chaQdXHkju6U1355phTU64K6MMR+DrwBbXjyGTsiH+w-j=+A@mail.gmail.com>
In-Reply-To: <CA+chaQdXHkju6U1355phTU64K6MMR+DrwBbXjyGTsiH+w-j=+A@mail.gmail.com>
From: "J. S." <schonm@gmail.com>
Date: Sat, 7 Dec 2024 10:59:18 -0500
Message-ID: <CABTo8gCw4_9AH557X=yDFvyY+dVPS+0My1atH2hu3jXrwSByEQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] nodejs: upgrade 22.11.0 -> 22.12.0
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Changqing Li <changqing.li@windriver.com>, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 07 Dec 2024 15:59:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114224

I'm currently seeing a failure building libpam using clang on aarch64.
But I think that is related to the recent upgrade of the libpam recipe
to version 1.7.0.

| aarch64-poky-linux-ld.lld: error: version script assignment of
'global' to symbol 'pam_sm_acct_mgmt' failed: symbol not defined
| aarch64-poky-linux-ld.lld: error: version script assignment of
'global' to symbol 'pam_sm_chauthtok' failed: symbol not defined
| aarch64-poky-linux-ld.lld: error: version script assignment of
'global' to symbol 'pam_sm_close_session' failed: symbol not defined
| aarch64-poky-linux-ld.lld: error: version script assignment of
'global' to symbol 'pam_sm_open_session' failed: symbol not defined
| aarch64-poky-linux-clang: error: linker command failed with exit
code 1 (use -v to see invocation)

On Sat, Dec 7, 2024 at 9:08=E2=80=AFAM Martin Jansa <martin.jansa@gmail.com=
> wrote:
>
> This seems to reintroduce io_uring support in embedded libuv from:
> https://github.com/nodejs/node/pull/55114/files
>
> which leads to the same issues as previous nodejs upgrade in:
> https://lists.openembedded.org/g/openembedded-devel/message/105583
> https://git.openembedded.org/meta-openembedded/commit/?id=3Dd08453978c31e=
e41d28206c6ff198d7d9d701d88
> https://git.openembedded.org/meta-openembedded/commit/?id=3D0d9351e9290f6=
750e44ab52536bbe9268d5afac3
> https://git.openembedded.org/meta-openembedded/commit/?id=3D7bb28628991ec=
9be9610540401f7c6cc4c19997f
>
> pseudo still doesn't support io_uring:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15244
>
> calling chown in hundreds recipes to work around pseudo limitation
> doesn't seem good work around.
>
> The UV_USE_IO_URING variable still exists in code (even after its
> documentation was removed in:
> https://github.com/louwers/node/commit/2b298e132d2f681270e9f3d5eb31349146=
53d2e1
> ) but it doesn't seem to work.
>
> It's failing because the
> 0001-deps-disable-io_uring-support-in-libuv.patch patch restored in:
> https://git.openembedded.org/meta-openembedded/diff/meta-oe/recipes-devto=
ols/nodejs/nodejs/0001-deps-disable-io_uring-support-in-libuv.patch?id=3D66=
52b031d7d4d9cabf16d481f3b82115f7d8e15a
> is wrong (it adds
> meta-oe/recipes-devtools/nodejs/nodejs/0001-deps-disable-io_uring-support=
-in-libuv.patch
> inside nodejs source instead of patching deps/uv/src/unix/linux.c).
>
> I've restored the patch properly in:
> https://lists.openembedded.org/g/openembedded-devel/message/114222
> but it still isn't enough and recipes fail in do_package or
> do_package_qa (depending on UID used on host).
>
> Reverting to 22.11.0 avoids the issue. Anyone else seeing this?
>
> +Changqing Li
>
>
>
> On Wed, Dec 4, 2024 at 5:54=E2=80=AFAM J. S. via lists.openembedded.org
> <schonm=3Dgmail.com@lists.openembedded.org> wrote:
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

