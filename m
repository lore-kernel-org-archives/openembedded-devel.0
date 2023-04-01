Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3262C76196
	for <webhook@archiver.kernel.org>; Sat,  1 Apr 2023 13:09:58 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web11.20550.1680354590288629675
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Apr 2023 06:09:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qJgL7VlL;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-17fcc07d6c4so11981507fac.8
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 Apr 2023 06:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680354589;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fnvm7/LrsXmh2aa2ln1rqmIstuhgjHdezeTp4yBj2ZQ=;
        b=qJgL7VlLd5lMB9NoCt5BLuziIM/4Dv7T5ipbbqdpALfbDEhF9RXCXFnkTvOS39/Jj5
         zIAhiI88EMEaa8VqbnjYayGoGMKIItEI+UYEKQPlMc4sRSMMvc0biAfPOEB3S3N59IwY
         MGrYNskMfTYOHYicjy+1puQ4aF1kA6lycjMfYVG9QVuFoESiqVl28xgT167wwFqDipsL
         eo06uKJB8Dl8X4MOPLOvzMigo2/75v1daJpR88L9DGsRbMJXXuey6orb0UknkN+WTayK
         YumHlJO/Bvso2IF1Gmr/YGhWKJhrpARod2RkNr9rVZPu+lbs27UvmZKrmmWv4hqsVFZz
         39Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680354589;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fnvm7/LrsXmh2aa2ln1rqmIstuhgjHdezeTp4yBj2ZQ=;
        b=KuE8aEY8v9Z8RsUoRw8kMqHgmW1aCQvaPfp455OHViP+DFkE067K3SCsrCj2rW/s1w
         gzln49gVdBfkPxUSM8t3jE+mztHKDRhJU6DS5k7WAZ3sHcjYMlk5HB//oWXAWg89jGyU
         8OA/Pxdxvd4LoCb0lJ8gVqHfP/PC4Qf8Z5H942dMaiSvhXxuY2amyWqUiIzuKbLeGICU
         Tr0JhCO5ZFR0fcq+qE/qsGgHMyFTBc3eUhWkDSpjsWW08XOyP4wwrOXx9W7wl5068w1y
         W8Xc38Xuag1jIKynZiOnl4pGW2PYW1KYkag35xEjzGjanAzybjwipC7Tn9hJvkXrS2CF
         rwYA==
X-Gm-Message-State: AO0yUKWxlDTF1ZmbHszcB0tNdSh7oKfLAf+/6r9whhC0TKN2VoeHZPVI
	f8GbJMQFHB4HIyx3Az8vGSMn/A48AnB9Unfp5q6qTQlA4mo=
X-Google-Smtp-Source: AKy350YUU6MEjX5LHXSUrvssCgPrfMcAJvKKlkxU7jBy0puNSoybOa4CiH/+U4+E9a3MtURgwPyppALsW+8kpWRKBC0=
X-Received: by 2002:a05:6870:cd0e:b0:17a:a52d:9df7 with SMTP id
 qk14-20020a056870cd0e00b0017aa52d9df7mr10749385oab.4.1680354589302; Sat, 01
 Apr 2023 06:09:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230331094145.2362159-1-xiangyu.chen@eng.windriver.com>
In-Reply-To: <20230331094145.2362159-1-xiangyu.chen@eng.windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 1 Apr 2023 06:09:23 -0700
Message-ID: <CAMKF1spbvF1hXwDEF2sBYPU0WODpkpdv0TiGKnJBBKQncUs0zQ@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH v4 0/3] update protobuf package from 3.21.12
 to 4.22.2
To: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Apr 2023 13:09:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101868

next error

https://errors.yoctoproject.org/Errors/Details/699337/

On Fri, Mar 31, 2023 at 2:42=E2=80=AFAM Xiangyu Chen
<xiangyu.chen@eng.windriver.com> wrote:
>
> From: Xiangyu Chen <xiangyu.chen@windriver.com>
>
> The series patches are upgrading protobuf package to latest version and a=
dd support which is
> depending protobuf package.
>
> Changes:
> v3->v4:
> 1. fix build failure under qemuarm
> 2. fix protobuf-c-native build failure
>
> Tested compiling protobuf/protobuf-native on qemuarm(clang) and x86-64(gc=
c)
> Tested compiling protobuf-c/protobuf-c-native on qemuarm(clang) and x86-6=
4(gcc)
> Tested compiling mosh on qemuarm(clang) and x86-64(gcc)
>
> ##### log of building qemuarm with clang (protobuf-c-native/protobuf fail=
ed before):
>
> poky/build-upstream$ bitbake protobuf protobuf-native protobuf-c protobuf=
-c-native mosh
> /usr/lib/python3/dist-packages/html5lib/_trie/_base.py:3: DeprecationWarn=
ing: Using or importing the ABCs from 'collections' instead of from 'collec=
tions.abc' is deprecated since Python 3.3, and in 3.9 it will stop working
>   from collections import Mapping
> NOTE: Reconnecting to bitbake server...
> Loading cache: 100% |####################################################=
###########################################################################=
#######################################| Time: 0:00:00
> Loaded 3049 entries from dependency cache.
> NOTE: Resolving any missing task queue dependencies
>
> Build Configuration:
> BB_VERSION           =3D "2.3.1"
> BUILD_SYS            =3D "x86_64-linux"
> NATIVELSBSTRING      =3D "universal"
> TARGET_SYS           =3D "arm-poky-linux-gnueabi"
> MACHINE              =3D "qemuarm"
> DISTRO               =3D "poky"
> DISTRO_VERSION       =3D "4.1+snapshot-51c56c35dcbdf990c764f62babdb303568=
d7c879"
> TUNE_FEATURES        =3D "arm vfp cortexa15 neon thumb callconvention-har=
d"
> TARGET_FPU           =3D "hard"
> meta
> meta-poky
> meta-yocto-bsp       =3D "master:51c56c35dcbdf990c764f62babdb303568d7c879=
"
> meta-oe              =3D "master-dev:a06ee7ad9f58f055cdd08e3807e36e0c21b3=
02d1"
> meta-clang           =3D "HEAD:371097cdaa0175119a6710390d11a4e967188968"
>
> Initialising tasks: 100% |###############################################=
###########################################################################=
#######################################| Time: 0:00:01
> Sstate summary: Wanted 27 Local 0 Mirrors 0 Missed 27 Current 312 (0% mat=
ch, 92% complete)
> NOTE: Executing Tasks
> WARNING: mosh-1.4.0-r0 do_fetch: Failed to fetch URL http://mosh.mit.edu/=
mosh-1.4.0.tar.gz, attempting MIRRORS if available
> WARNING: protobuf-4.22.2-r0 do_fetch: Failed to fetch URL gitsm://github.=
com/protocolbuffers/protobuf.git;branch=3D22.x;protocol=3Dhttps, attempting=
 MIRRORS if available
> WARNING: protobuf-c-1.4.1-r0 do_fetch: Failed to fetch URL git://github.c=
om/protobuf-c/protobuf-c.git;branch=3Dmaster;protocol=3Dhttps, attempting M=
IRRORS if available
> NOTE: Tasks Summary: Attempted 1254 tasks of which 1182 didn't need to be=
 rerun and all succeeded.
>
> Summary: There were 3 WARNING messages.
>
> #### end of log
>
> v2->v3:
> 1. fix mosh compile failure
> 2. fix protobuf-c compile failure under clang
>
> protobuf,protobuf-c and mosh tested under both clang and gcc mode.
>
>
> v1->v2:
> The v2[1] patch for upgrading protobuf from 3.21.12 to 4.22.2.
> After upgrading the protobuf, the package protobuf-c cannot compile anymo=
re[2] due to the latest version
> protobuf is using c++14 and some of API name has been changed, so use ano=
ther patch to add support of
> protobuf latest version in protobuf-c.
>
>
> Ref:
> [1] v1 thread please refer to https://lists.openembedded.org/g/openembedd=
ed-devel/message/101784
> [2] https://errors.yoctoproject.org/Errors/Details/698756/
>
>
> Xiangyu Chen (3):
>   protobuf: upgrade 3.21.12 -> 4.22.2
>   protobuf-c: add support of protobuf 4.22.x
>   mosh: add support of protobuf 4.22.x
>
>  ...re.ac-add-support-of-protobuf-4.22.x.patch |  63 ++++
>  .../recipes-connectivity/mosh/mosh_1.4.0.bb   |   7 +-
>  ...ot-compile-the-code-which-was-genera.patch | 147 ++++++++
>  .../0001-add-support-of-protobuf-4.22.x.patch | 315 ++++++++++++++++++
>  .../protobuf/protobuf-c_1.4.1.bb              |   6 +-
>  ...e-respect-CXX-LDFLAGS-variables-fix-.patch |  15 +-
>  ...protobuf_3.21.12.bb =3D> protobuf_4.22.2.bb} |  11 +-
>  7 files changed, 552 insertions(+), 12 deletions(-)
>  create mode 100644 meta-oe/recipes-connectivity/mosh/mosh/0001-configure=
.ac-add-support-of-protobuf-4.22.x.patch
>  create mode 100644 meta-oe/recipes-devtools/protobuf/protobuf-c/0001-Mak=
efile.am-do-not-compile-the-code-which-was-genera.patch
>  create mode 100644 meta-oe/recipes-devtools/protobuf/protobuf-c/0001-add=
-support-of-protobuf-4.22.x.patch
>  rename meta-oe/recipes-devtools/protobuf/{protobuf_3.21.12.bb =3D> proto=
buf_4.22.2.bb} (86%)
>
> --
> 2.34.1
>

