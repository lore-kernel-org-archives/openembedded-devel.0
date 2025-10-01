Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DD06CCA470
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 01:36:28 +0000 (UTC)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
 by mx.groups.io with SMTP id smtpd.web10.6104.1759282581514534339
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Sep 2025 18:36:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CH8aTB9g;
 spf=pass (domain: gmail.com, ip: 209.85.161.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-64a760e5281so411207eaf.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Sep 2025 18:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759282580; x=1759887380; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lXwLJDb2Za35/xxsUXJdNrP5f5CQiswLvEdZFSN5Egs=;
        b=CH8aTB9gpTU4S/ECmvra6BMGscw+1jRCExDgMZPF5tDGNegDEIl5JKM7sEzxpNFJKW
         bJMpbFTi97P+xwz0PJMz+redMym4juUHlwI3aGfsZHe0Z01KBvCcHNE5tZfKu/BpAlOM
         jrkP5RD0QHk8UhlRCMJJKNLZUjv102qYZhIi9pXDw+3eQ6dEwMsrZJORedMY0Ej1n0M5
         ernI4p+CtM23fWNPV/pBHfgvvjdhEtHolx/h0bgnO+447J0Io8R8CwPgl1cK72cJAdIQ
         g+LcQI3qrtx6HYys2+iqRBe6XqsyTAnb/AA9DMYsSp7wAViQWqt2dcF3Unvle7hyqwHT
         LZsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759282580; x=1759887380;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lXwLJDb2Za35/xxsUXJdNrP5f5CQiswLvEdZFSN5Egs=;
        b=f4eVTqLFO4UFtvwUiCLl9Xw7jcUY0mtQbFOFKlZn2FF5ZaQhlSih+u9SBqqlBSqpNA
         Y6fhSlhfE3xrG7yzp+R0XjhBvzv2R3Lf/kNBlQ9A8qXugf1NvAcMAwo/ETjxAU+YO/yT
         SLg+wpm0ArAobtPpJDJtwMh4YwLU/YwzNxhqTY5MyfxcbC0DvHCy+Z4jsddekWeg/HGl
         OdNrxWiD0wW8UfR1965Mi3Z/E/fCvYeTqb2Yh7LskSixp3xx8rDxC1KL5N8gHfDIc1iN
         tqekYhYVNZAjEepYKV7w1c0RIcIDFuJ5T0ZVV24NRtJHHAQge+WKSc1XdMfZEzPuKhKe
         Px9w==
X-Gm-Message-State: AOJu0YxfR+K/tHJqILmbhm3z6fzxmepnWHG18FQ0RC9fN4hWvvQDUJx8
	7YtOqysD/apEViDjryXmnXB+mt1k9QNF5c70Xr12cK9DYX3CtidbU5ryK5V/8jWBNa+DdojBHQW
	wNcP82ivv4FLmMDICyjFTGqGGzAE4CVs=
X-Gm-Gg: ASbGncuXIwWxxDyj5PWgRt87AGYNREwDw2h8ROyR6Lq+wdGxGTsDmEzfLiCXmsUO6EN
	IlDFMKlajtJETRH13Jyjwq2Cpm9poBYWWemYsvcUHEUYLhR75vAIdfHNs/CbgY/Uie+xXCHgZ1t
	veP+dTy8ljgq9twji6hEMGwOQ/Yjwt0d3CSnM2VaSFBnw8b6jYuRtlilC1BVD8kowjbEF9rsbyj
	V1km5ksyAjPKDWjFmetu1nu5y9Bouk=
X-Google-Smtp-Source: AGHT+IFe64GIvqzi8dZpktPZgvECwJ2AlxTuQ8mEMN7B2tphl/ll5q9W9PQ3Ri369tWsOBw84CIJsEGMSTkK4pLKrnI=
X-Received: by 2002:a05:6808:1b22:b0:43d:20c9:974f with SMTP id
 5614622812f47-43fa40f879amr944429b6e.12.1759282580469; Tue, 30 Sep 2025
 18:36:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250930091841.1693131-1-ankur.tyagi85@gmail.com>
 <20250930091841.1693131-2-ankur.tyagi85@gmail.com> <344744b7-3ae9-4dda-89cb-c3660141aaac@gmail.com>
In-Reply-To: <344744b7-3ae9-4dda-89cb-c3660141aaac@gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Wed, 1 Oct 2025 14:36:08 +1300
X-Gm-Features: AS18NWDUDPTTZIs_vjAYaZP_DXzCywp-O9RatEFlfKigBTLE2e-Q_L81yml_Fyg
Message-ID: <CADySD0H9hMGddph_ckA1j2uQ=-1Eo8ZzNTbmJPO_Z956zeQU-A@mail.gmail.com>
Subject: Re: [oe][meta-oe][walnascar][PATCH 01/22] zlog: upgrade 1.2.16 -> 1.2.18
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 01:36:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120086

fair enough, please drop this patch and I'll send another one for the CVE.

On Wed, Oct 1, 2025 at 9:25=E2=80=AFAM Gyorgy Sarvari <skandigraun@gmail.co=
m> wrote:
>
> I am not able to accept relicensed updates in stable branches.
> If you could send that CVE patch separately, that would be nice
> though... (if you have time for that)
>
> On 9/30/25 11:18, Ankur Tyagi wrote:
> > From: Gyorgy Sarvari <skandigraun@gmail.com>
> >
> > Switched to cmake. Added a backported patch to be able to use
> > the latest version of cmake.
> >
> > Also, add a new patch to avoid overwritingg all the CFLAGS set by Yocto=
,
> > which helps with avoiding the inclusion of TMPDIR in the generated file=
s.
> >
> > License-Update: License changed to Apache2:
> > https://github.com/HardySimpson/zlog/commit/1a7b1a6fb956b92a4079ccc91f3=
0da21f34ca063
> >
> > Changelog:
> > 1.2.18:
> > - patched severe vulnerability CVE-2024-22857
> > - restructured build system
> >
> > 1.2.17:
> > - Change Lience to Apache 2.0, for more people
> >
> > Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > (cherry picked from commit 8891ca87488384c0ab65b5d77c1278187080753d)
> > Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > ---
> >  ...01-Don-t-overwrite-systemwide-cflags.patch | 31 +++++++++++++++++++
> >  .../files/upgrade_cmake_minimum_version.patch | 25 +++++++++++++++
> >  meta-oe/recipes-extended/zlog/zlog_1.2.16.bb  | 17 ----------
> >  meta-oe/recipes-extended/zlog/zlog_1.2.18.bb  | 14 +++++++++
> >  4 files changed, 70 insertions(+), 17 deletions(-)
> >  create mode 100644 meta-oe/recipes-extended/zlog/files/0001-Don-t-over=
write-systemwide-cflags.patch
> >  create mode 100644 meta-oe/recipes-extended/zlog/files/upgrade_cmake_m=
inimum_version.patch
> >  delete mode 100644 meta-oe/recipes-extended/zlog/zlog_1.2.16.bb
> >  create mode 100644 meta-oe/recipes-extended/zlog/zlog_1.2.18.bb
> >
> > diff --git a/meta-oe/recipes-extended/zlog/files/0001-Don-t-overwrite-s=
ystemwide-cflags.patch b/meta-oe/recipes-extended/zlog/files/0001-Don-t-ove=
rwrite-systemwide-cflags.patch
> > new file mode 100644
> > index 0000000000..f09f517b98
> > --- /dev/null
> > +++ b/meta-oe/recipes-extended/zlog/files/0001-Don-t-overwrite-systemwi=
de-cflags.patch
> > @@ -0,0 +1,31 @@
> > +From ee35b6507993e79fc594e3b7ad50174e33e68daa Mon Sep 17 00:00:00 2001
> > +From: Gyorgy Sarvari <skandigraun@gmail.com>
> > +Date: Wed, 24 Sep 2025 11:22:29 +0200
> > +Subject: [PATCH] Don't overwrite systemwide cflags
> > +
> > +Instead of overriding the cflags from the system, just append to them.
> > +
> > +Upstream-Status: Submitted [https://github.com/HardySimpson/zlog/pull/=
306]
> > +
> > +Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> > +---
> > + CMakeLists.txt | 6 +++---
> > + 1 file changed, 3 insertions(+), 3 deletions(-)
> > +
> > +diff --git a/CMakeLists.txt b/CMakeLists.txt
> > +index 8981934..f2bd574 100644
> > +--- a/CMakeLists.txt
> > ++++ b/CMakeLists.txt
> > +@@ -33,9 +33,9 @@ SET(ZLOG_SO_VERSION ${CPACK_PACKAGE_VERSION_MAJOR})
> > + message(STATUS "platform : ${CMAKE_SYSTEM}")
> > +
> > + add_definitions("-g -Wall -Wstrict-prototypes")
> > +-set(CMAKE_C_FLAGS "-std=3Dc99 -pedantic -D_DEFAULT_SOURCE")
> > +-set(CMAKE_C_FLAGS_DEBUG "-ggdb3 -DDEBUG")
> > +-set(CMAKE_C_FLAGS_RELEASE "-O2")
> > ++set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -std=3Dc99 -pedantic -D_DEFAULT_S=
OURCE")
> > ++set(CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG} -ggdb3 -DDEBUG")
> > ++set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -O2")
> > +
> > + if (WIN32)
> > +     set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -DWINVER=3D0x0500 -D_WIN32_WI=
NNT=3D0x0500 ")
> > diff --git a/meta-oe/recipes-extended/zlog/files/upgrade_cmake_minimum_=
version.patch b/meta-oe/recipes-extended/zlog/files/upgrade_cmake_minimum_v=
ersion.patch
> > new file mode 100644
> > index 0000000000..9d02066d57
> > --- /dev/null
> > +++ b/meta-oe/recipes-extended/zlog/files/upgrade_cmake_minimum_version=
.patch
> > @@ -0,0 +1,25 @@
> > +From 3715879775f725260aeda14f94887bbc7a007e29 Mon Sep 17 00:00:00 2001
> > +From: haydenZhou <mfkhao2009@outlook.com>
> > +Date: Sun, 8 Jun 2025 10:45:05 +0800
> > +Subject: [PATCH] upgrade cmake minimum version
> > +
> > +Upstream-Status: Backport [https://github.com/HardySimpson/zlog/commit=
/3715879775f725260aeda14f94887bbc7a007e29]
> > +
> > +Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> > +---
> > + CMakeLists.txt | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/CMakeLists.txt b/CMakeLists.txt
> > +index 5ddaf8d..31a1553 100644
> > +--- a/CMakeLists.txt
> > ++++ b/CMakeLists.txt
> > +@@ -14,7 +14,7 @@
> > + # limitations under the License.
> > + #/
> > +
> > +-cmake_minimum_required(VERSION 2.8.5)
> > ++cmake_minimum_required(VERSION 3.12)
> > +
> > + message(STATUS "path : ${CMAKE_FIND_ROOT_PATH}")
> > + project(zlog)
> > diff --git a/meta-oe/recipes-extended/zlog/zlog_1.2.16.bb b/meta-oe/rec=
ipes-extended/zlog/zlog_1.2.16.bb
> > deleted file mode 100644
> > index b75802f09f..0000000000
> > --- a/meta-oe/recipes-extended/zlog/zlog_1.2.16.bb
> > +++ /dev/null
> > @@ -1,17 +0,0 @@
> > -DESCRIPTION =3D "Zlog is a pure C logging library"
> > -HOMEPAGE =3D "https://github.com/HardySimpson/zlog"
> > -LICENSE =3D "LGPL-2.1-only"
> > -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b36=
4516c"
> > -
> > -SRCREV =3D "dc2c284664757fce6ef8f96f8b3ab667a53ef489"
> > -SRC_URI =3D "git://github.com/HardySimpson/zlog;branch=3Dmaster;protoc=
ol=3Dhttps"
> > -
> > -S =3D "${WORKDIR}/git"
> > -
> > -inherit pkgconfig
> > -
> > -EXTRA_OEMAKE =3D "CC=3D'${CC}' LD=3D'${LD}' LIBRARY_PATH=3D${baselib}"
> > -
> > -do_install() {
> > -    oe_runmake install PREFIX=3D${D}${exec_prefix} INSTALL=3Dinstall
> > -}
> > diff --git a/meta-oe/recipes-extended/zlog/zlog_1.2.18.bb b/meta-oe/rec=
ipes-extended/zlog/zlog_1.2.18.bb
> > new file mode 100644
> > index 0000000000..268f022b51
> > --- /dev/null
> > +++ b/meta-oe/recipes-extended/zlog/zlog_1.2.18.bb
> > @@ -0,0 +1,14 @@
> > +DESCRIPTION =3D "Zlog is a pure C logging library"
> > +HOMEPAGE =3D "https://github.com/HardySimpson/zlog"
> > +LICENSE =3D "Apache-2.0"
> > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D86d3f3a95c324c9479bd8986968=
f4327"
> > +
> > +SRC_URI =3D "git://github.com/HardySimpson/zlog;branch=3Dmaster;protoc=
ol=3Dhttps;tag=3D${PV} \
> > +           file://upgrade_cmake_minimum_version.patch \
> > +           file://0001-Don-t-overwrite-systemwide-cflags.patch"
> > +SRCREV =3D "7fe61ca6265516e9327a51fc394b2adb126c2ef3"
> > +
> > +S =3D "${WORKDIR}/git"
> > +
> > +inherit cmake
> > +
>

