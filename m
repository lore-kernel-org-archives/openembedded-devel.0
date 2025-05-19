Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E8C3C2D0CD
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 08:59:12 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.46854.1747645145579450526
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 May 2025 01:59:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NGk0XicT;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-551eb17123cso2157439e87.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 May 2025 01:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747645143; x=1748249943; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FWWanE5j7nKYa1Mn1/sWQMIl9HMpEuidAXKIY5zANgs=;
        b=NGk0XicTVrALWOWf0+aGrBKCH8O3JohD+u1R/mv8Xm3Rur4pL638urly5I8d+bhOD0
         A/gzvU+3dQ8E7FPPDwWZcCmC+XlDKLFeuKYu4gRo0fEPukiWkq6BayTgWcrdFVWL98iU
         YbWSMa/dvaQD5m11iqSxkDiefsaKIXGgTgVf3dmDHdwjcJBOxvf93WlZFlXarAKqoLzG
         Ut2qw5ZWYWjTRifvuNhE9dpnNPWqC33wFE+LmVVjce88Q4dfr81NFaaHoI2jlQ2+zCeA
         lU39Y85IEqYfacErsuNSYBWM22bW3pVORmGn3ilOOiH2PWevVqVlAXoJh5qbhlaIgG4a
         kkAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747645143; x=1748249943;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FWWanE5j7nKYa1Mn1/sWQMIl9HMpEuidAXKIY5zANgs=;
        b=jgbbOMPWZp+4HZLQK0z+snyBSN/i6TWHjLzIX0wRKQUGGiTAdfOyE7qcQjWe+tqj8z
         hVcEsPB2m/Pb4SZ9HSNoKDtaPVkegonE2uhm/hzVNVsKj58heO5bcf/kOI5O7/xV0sd2
         hqx9YCLbCAjKr1e/z1Ud9+ht5iTe7GAI6gt4qReh5cr+mp+1DxgI2o7C91GoWzKJDgax
         /7P2WpMCHYCCJy6+RCck9bLC1+FVow833mE0tjWSKe2DnczYzIywCklSeteAb4vh3tvn
         wpHAeQz1D0mEKCPa4mjLhpRsJPVr4V/V4qSiHm4NdzsPI7sGZxt2pPS1ctrWhFiTWAOp
         Q88A==
X-Forwarded-Encrypted: i=1; AJvYcCVrlMuMQxW5yvmHlEfNx4lPw3vgyqOAyRjLiU+ivsxZDd+8Nz1VMfX5Q7mT58xkvSO9gazYOzXvwUYys5EPwjpeS9I=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxFo38tRvP1r5slZX2fU8j+52D3Ob1Ay6HFZzqHQvDkFvz/eHSH
	I8vZdyFaYAM+FxqxK7YGEWpWZOwbIBvoM6yVMRRMq371QdNgy2UX23GvPZzQJBgOlWavUkS2zA5
	zQQHMfTe6ehgMfhfmkb+rioPZazNIvXW9BLhd
X-Gm-Gg: ASbGnctpmdnLHIzIOmzeyHixlClJQEqLEieKo0cGKt1WahxCLRFgegYAZAL9dj1VYll
	cd0I10Y5chSVo2n8/N5zpf0LVGT0E5IJjNtLQ3JMRZVwd6svomoffo8F07bkyJwtJHwvuM6Ccc7
	9MQxDww4SkQ8t92ZYh1y7O6gFafl8H2+8JcuI=
X-Google-Smtp-Source: AGHT+IG8qAHaRoCBovdWFv8unSr0ZyBQe7gTGvBTCrqHUDKWWUvz3yrutqZeFpYMQWAybH0FCGZm+bqE13Q7l3QjXM4=
X-Received: by 2002:a05:6512:2616:b0:54d:6aa1:8f5a with SMTP id
 2adb3069b0e04-550e71a732dmr2611586e87.13.1747645143251; Mon, 19 May 2025
 01:59:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250518173309.3600728-1-raj.khem@gmail.com> <1840E09C179AB46A.6581@lists.openembedded.org>
In-Reply-To: <1840E09C179AB46A.6581@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 19 May 2025 10:58:50 +0200
X-Gm-Features: AX0GCFvaHNGLox5YcjBz6KAhSqFwwGp2NP_UqcZgX3be2rPIC4O2AbZ0WiiJD0M
Message-ID: <CA+chaQekOt515auBiqy88AnyuYi+rmZ=ZBm1_Ez_kpv03PGMMA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 1/4] python3-pandas: Upgrade to 2.2.3
To: martin.jansa@gmail.com
Cc: raj.khem@gmail.com, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 May 2025 08:59:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117475

On Mon, May 19, 2025 at 10:33=E2=80=AFAM Martin Jansa via
lists.openembedded.org <martin.jansa=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Hi,
>
> with this update I'm seeing:
> ERROR: QA Issue: File
> /usr/src/debug/python3-pandas/2.2.3/pandas/_libs/sparse.cpython-313-aarch=
64-linux-gnu.so.p/pandas/_libs/sparse.pyx.c
> in package python3-pandas-src contains reference to TMPDIR
> [buildpaths]
>
> Have you seen it as well or is it something specific to my setup?

http://errors.yoctoproject.org/Errors/Details/855166/

it's from:
# grep core2 /OE/build/oe-core/tmp/work/core2-64-oe-linux/python3-pandas/2.=
2.3/package/usr/src/debug/python3-pandas/2.2.3/pandas/_libs/sparse.cpython-=
313-x86_64-linux-gnu.so.p/pandas/_libs/sparse.pyx.c
#warning "/OE/build/oe-core/tmp/work/core2-64-oe-linux/python3-pandas/2.2.3=
/pandas-2.2.3/pandas/_libs/sparse.pyx:286:15:
: __weakref__ is unsupported in the Limited API when running on Python
<3.9."
#pragma message("/OE/build/oe-core/tmp/work/core2-64-oe-linux/python3-panda=
s/2.2.3/pandas-2.2.3/pandas/_libs/sparse.pyx:286:15:
: __weakref__ is unsupported in the Limited API when running on Python
<3.9.")


>
> On Sun, May 18, 2025 at 7:33=E2=80=AFPM Khem Raj via lists.openembedded.o=
rg
> <raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > Fixes build with cython >=3D3.1
> > Drop patch to pin numpy to 1.x
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  ...ion-to-specify-numpy-header-location.patch |  5 ----
> >  ...Downgrade-numpy-version-needs-to-1.x.patch | 27 -------------------
> >  ...t.toml-don-t-pin-dependency-versions.patch | 11 +++-----
> >  ...andas_2.2.2.bb =3D> python3-pandas_2.2.3.bb} |  3 +--
> >  4 files changed, 4 insertions(+), 42 deletions(-)
> >  delete mode 100644 meta-python/recipes-devtools/python/python3-pandas/=
0001-pyproject.toml-Downgrade-numpy-version-needs-to-1.x.patch
> >  rename meta-python/recipes-devtools/python/{python3-pandas_2.2.2.bb =
=3D> python3-pandas_2.2.3.bb} (87%)
> >
> > diff --git a/meta-python/recipes-devtools/python/python3-pandas/0001-BL=
D-add-option-to-specify-numpy-header-location.patch b/meta-python/recipes-d=
evtools/python/python3-pandas/0001-BLD-add-option-to-specify-numpy-header-l=
ocation.patch
> > index 87023a24ec..e83576eb62 100644
> > --- a/meta-python/recipes-devtools/python/python3-pandas/0001-BLD-add-o=
ption-to-specify-numpy-header-location.patch
> > +++ b/meta-python/recipes-devtools/python/python3-pandas/0001-BLD-add-o=
ption-to-specify-numpy-header-location.patch
> > @@ -25,15 +25,10 @@ Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.co=
m>
> >   2 files changed, 11 insertions(+), 3 deletions(-)
> >   create mode 100644 meson.options
> >
> > -diff --git a/meson.options b/meson.options
> > -new file mode 100644
> > -index 0000000000..3d3a18d145
> >  --- /dev/null
> >  +++ b/meson.options
> >  @@ -0,0 +1 @@
> >  +option('numpy_inc_dir', type : 'string', description : 'The absolute =
path to the numpy headers')
> > -diff --git a/pandas/meson.build b/pandas/meson.build
> > -index 435103a..a08c77a 100644
> >  --- a/pandas/meson.build
> >  +++ b/pandas/meson.build
> >  @@ -3,17 +3,24 @@ incdir_numpy =3D run_command(py,
> > diff --git a/meta-python/recipes-devtools/python/python3-pandas/0001-py=
project.toml-Downgrade-numpy-version-needs-to-1.x.patch b/meta-python/recip=
es-devtools/python/python3-pandas/0001-pyproject.toml-Downgrade-numpy-versi=
on-needs-to-1.x.patch
> > deleted file mode 100644
> > index b0ef8ce00c..0000000000
> > --- a/meta-python/recipes-devtools/python/python3-pandas/0001-pyproject=
.toml-Downgrade-numpy-version-needs-to-1.x.patch
> > +++ /dev/null
> > @@ -1,27 +0,0 @@
> > -From d81d95274d84ac51fc02e0fa91affc7f3cbefccb Mon Sep 17 00:00:00 2001
> > -From: Khem Raj <raj.khem@gmail.com>
> > -Date: Sat, 24 Aug 2024 10:21:43 -0700
> > -Subject: [PATCH] pyproject.toml: Downgrade numpy version needs to 1.x
> > -
> > -Drop it when numpy is upgraded to 2.x or newer in core
> > -
> > -Upstream-Status: Inappropriate [OE workaround]
> > -
> > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ----
> > - pyproject.toml | 2 +-
> > - 1 file changed, 1 insertion(+), 1 deletion(-)
> > -
> > -diff --git a/pyproject.toml b/pyproject.toml
> > -index 5158d60..d3daa78 100644
> > ---- a/pyproject.toml
> > -+++ b/pyproject.toml
> > -@@ -8,7 +8,7 @@ requires =3D [
> > -     "Cython>=3D3.0.5",  # Note: sync with setup.py, environment.yml a=
nd asv.conf.json
> > -     # Force numpy higher than 2.0rc1, so that built wheels are compat=
ible
> > -     # with both numpy 1 and 2
> > --    "numpy>=3D2.0.0rc1",
> > -+    "numpy>=3D1.24.0",
> > -     "versioneer[toml]"
> > - ]
> > -
> > diff --git a/meta-python/recipes-devtools/python/python3-pandas/0001-py=
project.toml-don-t-pin-dependency-versions.patch b/meta-python/recipes-devt=
ools/python/python3-pandas/0001-pyproject.toml-don-t-pin-dependency-version=
s.patch
> > index f60f43a5b0..950f25303f 100644
> > --- a/meta-python/recipes-devtools/python/python3-pandas/0001-pyproject=
.toml-don-t-pin-dependency-versions.patch
> > +++ b/meta-python/recipes-devtools/python/python3-pandas/0001-pyproject=
.toml-don-t-pin-dependency-versions.patch
> > @@ -14,8 +14,6 @@ Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> >   pyproject.toml | 6 +++---
> >   1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > -diff --git a/pyproject.toml b/pyproject.toml
> > -index db9f055799..5158d60f59 100644
> >  --- a/pyproject.toml
> >  +++ b/pyproject.toml
> >  @@ -2,10 +2,10 @@
> > @@ -27,11 +25,8 @@ index db9f055799..5158d60f59 100644
> >  +    "meson-python>=3D0.13.1",
> >  +    "meson>=3D1.2.1",
> >       "wheel",
> > --    "Cython=3D=3D3.0.5",  # Note: sync with setup.py, environment.yml=
 and asv.conf.json
> > +-    "Cython~=3D3.0.5",  # Note: sync with setup.py, environment.yml a=
nd asv.conf.json
> >  +    "Cython>=3D3.0.5",  # Note: sync with setup.py, environment.yml a=
nd asv.conf.json
> > -     # Force numpy higher than 2.0rc1, so that built wheels are compat=
ible
> > +     # Force numpy higher than 2.0, so that built wheels are compatibl=
e
> >       # with both numpy 1 and 2
> > -     "numpy>=3D2.0.0rc1",
> > ---
> > -2.39.2
> > -
> > +     "numpy>=3D2.0",
> > diff --git a/meta-python/recipes-devtools/python/python3-pandas_2.2.2.b=
b b/meta-python/recipes-devtools/python/python3-pandas_2.2.3.bb
> > similarity index 87%
> > rename from meta-python/recipes-devtools/python/python3-pandas_2.2.2.bb
> > rename to meta-python/recipes-devtools/python/python3-pandas_2.2.3.bb
> > index b956f5ca2f..3e41e4aa6f 100644
> > --- a/meta-python/recipes-devtools/python/python3-pandas_2.2.2.bb
> > +++ b/meta-python/recipes-devtools/python/python3-pandas_2.2.3.bb
> > @@ -8,12 +8,11 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dcb81909290=
1ddb13a7d0a4f5e05f098a"
> >
> >  SRC_URI +=3D " \
> >              file://0001-pyproject.toml-don-t-pin-dependency-versions.p=
atch \
> > -            file://0001-pyproject.toml-Downgrade-numpy-version-needs-t=
o-1.x.patch \
> >              "
> >
> >  SRC_URI:append:class-target =3D " file://0001-BLD-add-option-to-specif=
y-numpy-header-location.patch "
> >
> > -SRC_URI[sha256sum] =3D "9e79019aba43cb4fda9e4d983f8e88ca0373adbb697ae9=
c6c43093218de28b54"
> > +SRC_URI[sha256sum] =3D "4f18ba62b61d7e192368b84517265a99b4d7ee8912f870=
8660fb4a366cc82667"
> >
> >  inherit pkgconfig pypi python_mesonpy cython
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117474): https://lists.openembedded.org/g/openembedde=
d-devel/message/117474
> Mute This Topic: https://lists.openembedded.org/mt/113179377/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

