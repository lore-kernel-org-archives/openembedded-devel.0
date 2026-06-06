Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C59ECD6E55
	for <webhook@archiver.kernel.org>; Sat,  6 Jun 2026 04:29:09 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10450.1780720139694825696
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Jun 2026 21:28:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=oM8Un1Ak;
 spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-4864a5c83f1so1754717b6e.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 05 Jun 2026 21:28:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780720139; cv=none;
        d=google.com; s=arc-20240605;
        b=BFnArgWWAEbVAUoUakIb/HuSrpiW7QJGXq8P8WVjKKgcGQurkSRp6bvuMa3II1+lL7
         eeFtTksIiNhpTZ5ecUsXWsUN00Sap7WaQt/cuOlyzDNcXweWn7K2ELohq1W3TsINSJDl
         u+PR4IXMq0K0heN4d1H2Mqkf/EnnhE+waPG7/2gOPH2hEl/z+svwuzFiQXfbHSDs4W/A
         BAEtU1EKgreqAiPWY1NE087keotkBsNbwNZh2ZPoFSqSEKc2zulxjoCYVvTSnX8akh2Y
         D8bpXMACl3caeq2A0Lj42Y+pLFLTe1+IdQX3DSa4D33E9RReTO4nVG5ZgdRqOZAcod1p
         EspA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1LcSSxF5ifZtCggQzMoQiYKsNZ2942qQWTiNjZRaXGw=;
        fh=i0UEVGX6XKvJAmzXVKuwop3O/ShkJNeDIU5NtFbZzgQ=;
        b=aF/Q4VYcoIpc1Dmd/mEOk105bzorZQkVtukDSvnCGFnoNvY9xfOkbwCHRLg7HtBFW2
         h3NTGEnrh+fM/LyCYbkIj45f0OsgQ7a83WXxu7aVOQsR28QD8JXJkZMr1kd0eQ/EeHjm
         ZEdLe26iq71LL3bFrG5sXKbutL8CIjtMo4HY6QYOUNBe2inpp5AIdpIkhTANoUeGw80Z
         bdks5rk40q7j3xNWce203Ej8EaTlAiDcwMlzIVEWfuZyAubummwNr2fs1oGdUe+6VJDw
         sekhcZi0F0nGYgyw6aWsX4reo4qAW2DSKRzsYoyycL2Ogorxk+Imt+5a1m1lJSVUqnOZ
         Sm6w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780720139; x=1781324939; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1LcSSxF5ifZtCggQzMoQiYKsNZ2942qQWTiNjZRaXGw=;
        b=oM8Un1AkybOFBj1v0L9PCdWbVKRtrcSAdUCj7soXSp0ZHYV3Ty9AQyr2Q3Kbb27nsW
         zjw6qg/fsksi1BxNz1s0UyjqbmbG3n/ysw1iBqyK04K8Icfe59ge00qDBLUEFEu4SBFK
         9rahAuPcxSu/xA4yMbksayoAe26WH2MbVBm+BnEuLE1f8z+kxQ9ZUvQ/rLRTOBXtLAa+
         h0ZF3qH/LnJ29HZXVTSsks5YGhK5NajLrBVmYdPp2LeV6XK8KDUJzVOyjP0XyXkthUek
         SdLt3WE6vDmyA2ktcyKx3mJzuWENk4R+1fEKcqKjZcnU54I8F/IgwqqWHf7TPSZuQRmM
         apCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780720139; x=1781324939;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1LcSSxF5ifZtCggQzMoQiYKsNZ2942qQWTiNjZRaXGw=;
        b=a3vh+Yg2Z7lfFSXMlUPPgcIrxV4lGNqY9WF2Zr/m/KrXMWEjllLKnTrAaO8dhtufxg
         A4wHJVfBqzBdCvWZAzQWJGHNUZbnKb/4cNm4ZbejR2aZtbrKZUs3PyjObXJGeQkSRMzE
         7h3pEXl8yiijgXG173Jk0QjAqxh/aAGGKEQztsE5pMs12N5XYgsbQp73sP8Vpk4y3zQL
         c8HsVdTMlu/drVuP3uwbju9paVuKZE2Btskt/fXDk2NetmNtysB8GOY88djjynPf+qj0
         NddQ/IsEDkWJq9XzhowU/P6HoRXkCxFduLU/lZmCQOxTGXT7oBNOYhyuyfhkBHUoEJ7B
         PFzA==
X-Gm-Message-State: AOJu0Yw+jnnYKjjO6nWO9tknCcbstnkkJpanznoKPeddNwpHjqVNBp0u
	oLyGAZx7GpR74C3aqNtRYmz3W0fUDZuG8Jb39LBPpY9bxjZbNHBmzdmoQExMB4CfJttneUNuOBk
	mdC1KyFvDjp/UDcnkU5MDBd6KFAN8YsM=
X-Gm-Gg: Acq92OGyiPijBuI/NIh936kpfPjV7OSTietkiPO9XPZca7qUDVrygjwMCMI8Bc7/QNr
	l8cea3OBY6f3k38COiiDoy08eXlU5dnb0DsYg1mhENzUOybeePqULN9H1s3FMlaYZdP9AZ11UWN
	2nRMIanaQv2QCGh3RO08if0D4BsD62oZTzL1RyBkRC9mvadEfdv8OPYjkMurRyQb9shVn3PRW3f
	UwCDbGYsoAI6JBPJY1vY3W6YdPEdWl8O9X4yfSbaIfwTgAgQuUq4eDz1Rkk14xk8WyVdrOJ89e/
	EOyhnoT489LsFkBssvWk
X-Received: by 2002:a05:6808:1454:b0:45e:f0af:5148 with SMTP id
 5614622812f47-4868de84142mr3622376b6e.30.1780720138594; Fri, 05 Jun 2026
 21:28:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260523123907.2609140-1-ankur.tyagi85@gmail.com>
 <20260523123907.2609140-2-ankur.tyagi85@gmail.com> <CA+s=J=yqdHHStXHOk_yYgBYRiW_vKGqpx_DBJJeDZkBzptc_hg@mail.gmail.com>
 <CADySD0GX_yqgfqJcvTZOYnXiuFuWKQwTyQwVinESDV2Fv95orw@mail.gmail.com>
In-Reply-To: <CADySD0GX_yqgfqJcvTZOYnXiuFuWKQwTyQwVinESDV2Fv95orw@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Sat, 6 Jun 2026 16:28:47 +1200
X-Gm-Features: AVVi8CcdIkfygCHig6A2iqYAgiXCpoj4Rfr4SdnMjhiYwR7zOiL-xdElneXTNas
Message-ID: <CADySD0E6YYLU_pmB7XYqY57Pz3_M887LfVABe92EJ1FuNP1kkw@mail.gmail.com>
Subject: Re: [oe][meta-oe][scarthgap][PATCH 2/3] redis: upgrade 7.2.12 -> 7.2.14
To: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 06 Jun 2026 04:29:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127406

Please drop this patch, submitted new patch
https://lists.openembedded.org/g/openembedded-devel/message/127379

On Mon, May 25, 2026 at 4:02=E2=80=AFPM Ankur Tyagi <ankur.tyagi85@gmail.co=
m> wrote:
>
> On Mon, May 25, 2026 at 2:44=E2=80=AFPM Anuj Mittal
> <anuj.mittal@oss.qualcomm.com> wrote:
> >
> > On Sat, May 23, 2026 at 8:39=E2=80=AFPM Ankur Tyagi via lists.openembed=
ded.org
> > <ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
> > >
> > > From: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > >
> > > Also refreshed patches to resolve patch fuzz QA issue.
> > >
> > > Bug and security fix release
> > > https://github.com/redis/redis/releases/tag/7.2.13
> > > https://github.com/redis/redis/releases/tag/7.2.14
> > >
> > > Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > > ---
> > >  .../0001-hiredis-use-default-CC-if-it-is-set.patch   | 12 ++++++++--=
--
> > >  ...e-Makefile-to-use-environment-build-setting.patch |  6 +++---
> > >  .../0003-hack-to-force-use-of-libc-malloc.patch      |  8 ++++----
> > >  .../redis/0004-src-Do-not-reset-FINAL_LIBS.patch     |  6 +++---
> > >  ...GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch | 10 +++++-----
> > >  .../0006-Define-correct-gregs-for-RISCV32.patch      |  8 ++++----
> > >  .../redis/{redis_7.2.12.bb =3D> redis_7.2.14.bb}       |  2 +-
> > >  7 files changed, 28 insertions(+), 24 deletions(-)
> > >  rename meta-oe/recipes-extended/redis/{redis_7.2.12.bb =3D> redis_7.=
2.14.bb} (97%)
> >
> > Fails with error:
> >
> >
> > ERROR: redis-7.2.14-r0 do_patch: QA Issue: Fuzz detected:
> >
> > Applying patch 0001-hiredis-use-default-CC-if-it-is-set.patch
> > patching file deps/hiredis/Makefile
> > Hunk #1 succeeded at 36 with fuzz 2 (offset -6 lines).
> >
> >
> > Applying patch 0003-hack-to-force-use-of-libc-malloc.patch
> > patching file src/Makefile
> > Hunk #1 succeeded at 13 with fuzz 2.
> >
> >
> > Applying patch 0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER=
.patch
> > patching file src/zmalloc.c
> > Hunk #1 succeeded at 32 with fuzz 2 (offset 4 lines).
> >
> >
> > The context lines in the patches can be updated with devtool:
> >
> >     devtool modify redis
> >     devtool finish --force-patch-refresh redis <layer_path>
> >
> > Don't forget to review changes done by devtool!
> >
> > Patch log indicates that patches do not apply cleanly. [patch-fuzz]
> >
>
> odd, I'll try to reproduce the issue and send v2 later on.
> Thanks for the feedback.
>
> >
> > >
> > > diff --git a/meta-oe/recipes-extended/redis/redis/0001-hiredis-use-de=
fault-CC-if-it-is-set.patch b/meta-oe/recipes-extended/redis/redis/0001-hir=
edis-use-default-CC-if-it-is-set.patch
> > > index 51a6e9c957..035f533661 100644
> > > --- a/meta-oe/recipes-extended/redis/redis/0001-hiredis-use-default-C=
C-if-it-is-set.patch
> > > +++ b/meta-oe/recipes-extended/redis/redis/0001-hiredis-use-default-C=
C-if-it-is-set.patch
> > > @@ -1,4 +1,4 @@
> > > -From 67990f216f2fbbc8a6699c700dfc089aa617905f Mon Sep 17 00:00:00 20=
01
> > > +From 61ae3e0277ac92323584bbe75ce79de6e030e84a Mon Sep 17 00:00:00 20=
01
> > >  From: Venture Research <tech@ventureresearch.com>
> > >  Date: Fri, 8 Feb 2013 17:39:52 -0600
> > >  Subject: [PATCH] hiredis: use default CC if it is set
> > > @@ -6,6 +6,10 @@ MIME-Version: 1.0
> > >  Content-Type: text/plain; charset=3DUTF-8
> > >  Content-Transfer-Encoding: 8bit
> > >
> > > +MIME-Version: 1.0
> > > +Content-Type: text/plain; charset=3DUTF-8
> > > +Content-Transfer-Encoding: 8bit
> > > +
> > >  Instead of trying to automagically figure out CC, which breaks with =
OE
> > >  as CC has spaces in it, just skip it if one was already passed in.
> > >
> > > @@ -23,15 +27,15 @@ Signed-off-by: Andreas M=C3=BCller <schnitzeltony=
@gmail.com>
> > >   1 file changed, 2 deletions(-)
> > >
> > >  diff --git a/deps/hiredis/Makefile b/deps/hiredis/Makefile
> > > -index 7e41c97..54717e3 100644
> > > +index bd2106b..9ce768d 100644
> > >  --- a/deps/hiredis/Makefile
> > >  +++ b/deps/hiredis/Makefile
> > > -@@ -42,8 +42,6 @@ endef
> > > +@@ -36,8 +36,6 @@ endef
> > >   export REDIS_TEST_CONFIG
> > >
> > >   # Fallback to gcc when $CC is not in $PATH.
> > >  -CC:=3D$(shell sh -c 'type $${CC%% *} >/dev/null 2>/dev/null && echo=
 $(CC) || echo gcc')
> > >  -CXX:=3D$(shell sh -c 'type $${CXX%% *} >/dev/null 2>/dev/null && ec=
ho $(CXX) || echo g++')
> > >   OPTIMIZATION?=3D-O3
> > > - WARNINGS=3D-Wall -W -Wstrict-prototypes -Wwrite-strings -Wno-missin=
g-field-initializers
> > > + WARNINGS=3D-Wall -Wextra -Werror -Wstrict-prototypes -Wwrite-string=
s -Wno-missing-field-initializers
> > >   DEBUG_FLAGS?=3D -g -ggdb
> > > diff --git a/meta-oe/recipes-extended/redis/redis/0002-lua-update-Mak=
efile-to-use-environment-build-setting.patch b/meta-oe/recipes-extended/red=
is/redis/0002-lua-update-Makefile-to-use-environment-build-setting.patch
> > > index 17b533669b..c163aaae8b 100644
> > > --- a/meta-oe/recipes-extended/redis/redis/0002-lua-update-Makefile-t=
o-use-environment-build-setting.patch
> > > +++ b/meta-oe/recipes-extended/redis/redis/0002-lua-update-Makefile-t=
o-use-environment-build-setting.patch
> > > @@ -1,4 +1,4 @@
> > > -From ef989aab052510bfda32b2b325a5f80b76c42677 Mon Sep 17 00:00:00 20=
01
> > > +From a35a89981e28fb118efa86a798dacda826eb6f74 Mon Sep 17 00:00:00 20=
01
> > >  From: Venture Research <tech@ventureresearch.com>
> > >  Date: Fri, 8 Feb 2013 20:22:19 -0600
> > >  Subject: [PATCH] lua: update Makefile to use environment build setti=
ngs
> > > @@ -23,10 +23,10 @@ Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
> > >   3 files changed, 6 insertions(+), 12 deletions(-)
> > >
> > >  diff --git a/deps/Makefile b/deps/Makefile
> > > -index cbe3aef..76bc222 100644
> > > +index 3bf0363..fd8765a 100644
> > >  --- a/deps/Makefile
> > >  +++ b/deps/Makefile
> > > -@@ -81,7 +81,6 @@ endif
> > > +@@ -94,7 +94,6 @@ endif
> > >   # lua's Makefile defines AR=3D"ar rcu", which is unusual, and makes=
 it more
> > >   # challenging to cross-compile lua (and redis).  These defines make=
 it easier
> > >   # to fit redis into cross-compilation environments, which typically=
 set AR.
> > > diff --git a/meta-oe/recipes-extended/redis/redis/0003-hack-to-force-=
use-of-libc-malloc.patch b/meta-oe/recipes-extended/redis/redis/0003-hack-t=
o-force-use-of-libc-malloc.patch
> > > index f1021eef6c..f142ff6ec2 100644
> > > --- a/meta-oe/recipes-extended/redis/redis/0003-hack-to-force-use-of-=
libc-malloc.patch
> > > +++ b/meta-oe/recipes-extended/redis/redis/0003-hack-to-force-use-of-=
libc-malloc.patch
> > > @@ -1,4 +1,4 @@
> > > -From b9586abcb803747301f6cc4ff93c7642bef693ea Mon Sep 17 00:00:00 20=
01
> > > +From a6246b17e94a2f7ad3560787a476b18aa7a45358 Mon Sep 17 00:00:00 20=
01
> > >  From: Venture Research <tech@ventureresearch.com>
> > >  Date: Wed, 6 Feb 2013 20:51:02 -0600
> > >  Subject: [PATCH] hack to force use of libc malloc
> > > @@ -20,7 +20,7 @@ Signed-off-by: Alistair Francis <alistair.francis@w=
dc.com>
> > >   1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > >  diff --git a/src/Makefile b/src/Makefile
> > > -index 7d75c83..35dd314 100644
> > > +index 6a87909..b8e0d44 100644
> > >  --- a/src/Makefile
> > >  +++ b/src/Makefile
> > >  @@ -13,7 +13,8 @@
> > > @@ -31,5 +31,5 @@ index 7d75c83..35dd314 100644
> > >  +# use fake uname option to force use of generic libc
> > >  +uname_S :=3D "USE_LIBC_MALLOC"
> > >   uname_M :=3D $(shell sh -c 'uname -m 2>/dev/null || echo not')
> > > - OPTIMIZATION?=3D-O2
> > > - DEPENDENCY_TARGETS=3Dhiredis linenoise lua hdr_histogram
> > > + CLANG :=3D $(findstring clang,$(shell sh -c '$(CC) --version | head=
 -1'))
> > > + OPTIMIZATION?=3D-O3
> > > diff --git a/meta-oe/recipes-extended/redis/redis/0004-src-Do-not-res=
et-FINAL_LIBS.patch b/meta-oe/recipes-extended/redis/redis/0004-src-Do-not-=
reset-FINAL_LIBS.patch
> > > index 958106e261..ecf8714d33 100644
> > > --- a/meta-oe/recipes-extended/redis/redis/0004-src-Do-not-reset-FINA=
L_LIBS.patch
> > > +++ b/meta-oe/recipes-extended/redis/redis/0004-src-Do-not-reset-FINA=
L_LIBS.patch
> > > @@ -1,4 +1,4 @@
> > > -From a4d87aca1c00c53b386ee7490223971e00873add Mon Sep 17 00:00:00 20=
01
> > > +From 1b59adad94137eedfbcddb27adae74b80b4e0909 Mon Sep 17 00:00:00 20=
01
> > >  From: Khem Raj <raj.khem@gmail.com>
> > >  Date: Tue, 10 Sep 2019 20:04:26 -0700
> > >  Subject: [PATCH] src: Do not reset FINAL_LIBS
> > > @@ -16,10 +16,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > >  diff --git a/src/Makefile b/src/Makefile
> > > -index 35dd314..3770f96 100644
> > > +index b8e0d44..3a68fa6 100644
> > >  --- a/src/Makefile
> > >  +++ b/src/Makefile
> > > -@@ -93,7 +93,7 @@ endif
> > > +@@ -122,7 +122,7 @@ endif
> > >
> > >   FINAL_CFLAGS=3D$(STD) $(WARN) $(OPT) $(DEBUG) $(CFLAGS) $(REDIS_CFL=
AGS)
> > >   FINAL_LDFLAGS=3D$(LDFLAGS) $(REDIS_LDFLAGS) $(DEBUG)
> > > diff --git a/meta-oe/recipes-extended/redis/redis/0005-Define-_GNU_SO=
URCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch b/meta-oe/recipes-extended/redi=
s/redis/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch
> > > index d73c66c9d0..cd8fae4074 100644
> > > --- a/meta-oe/recipes-extended/redis/redis/0005-Define-_GNU_SOURCE-to=
-get-PTHREAD_MUTEX_INITIALIZER.patch
> > > +++ b/meta-oe/recipes-extended/redis/redis/0005-Define-_GNU_SOURCE-to=
-get-PTHREAD_MUTEX_INITIALIZER.patch
> > > @@ -1,4 +1,4 @@
> > > -From 2e6311c9c7cd85bf63eab8fe92c08ec1ec01b6fc Mon Sep 17 00:00:00 20=
01
> > > +From 5a58c573d486411a3a1585ca42bee70a661a983d Mon Sep 17 00:00:00 20=
01
> > >  From: Khem Raj <raj.khem@gmail.com>
> > >  Date: Sat, 21 Dec 2019 12:09:51 -0800
> > >  Subject: [PATCH] Define _GNU_SOURCE to get PTHREAD_MUTEX_INITIALIZER
> > > @@ -16,12 +16,12 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > >   1 file changed, 1 insertion(+)
> > >
> > >  diff --git a/src/zmalloc.c b/src/zmalloc.c
> > > -index 1f33d09..5e182d1 100644
> > > +index bbfa386..93e07ff 100644
> > >  --- a/src/zmalloc.c
> > >  +++ b/src/zmalloc.c
> > > -@@ -28,6 +28,7 @@
> > > -  * POSSIBILITY OF SUCH DAMAGE.
> > > -  */
> > > +@@ -32,6 +32,7 @@
> > > + #include "config.h"
> > > + #include "solarisfixes.h"
> > >
> > >  +#define _GNU_SOURCE
> > >   #include <stdio.h>
> > > diff --git a/meta-oe/recipes-extended/redis/redis/0006-Define-correct=
-gregs-for-RISCV32.patch b/meta-oe/recipes-extended/redis/redis/0006-Define=
-correct-gregs-for-RISCV32.patch
> > > index bb3f5c607e..dd44797437 100644
> > > --- a/meta-oe/recipes-extended/redis/redis/0006-Define-correct-gregs-=
for-RISCV32.patch
> > > +++ b/meta-oe/recipes-extended/redis/redis/0006-Define-correct-gregs-=
for-RISCV32.patch
> > > @@ -1,4 +1,4 @@
> > > -From 6149911f7a6fbaef3ed418408e2b501fa9479ffa Mon Sep 17 00:00:00 20=
01
> > > +From 8a16ff40b75671725e4bd92b50a5f083460e796b Mon Sep 17 00:00:00 20=
01
> > >  From: Khem Raj <raj.khem@gmail.com>
> > >  Date: Mon, 26 Oct 2020 21:32:22 -0700
> > >  Subject: [PATCH] Define correct gregs for RISCV32
> > > @@ -14,10 +14,10 @@ Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
> > >   1 file changed, 24 insertions(+), 2 deletions(-)
> > >
> > >  diff --git a/src/debug.c b/src/debug.c
> > > -index bb76c5d..55a0696 100644
> > > +index 684f692..2ee151f 100644
> > >  --- a/src/debug.c
> > >  +++ b/src/debug.c
> > > -@@ -1067,7 +1067,9 @@ static void* getAndSetMcontextEip(ucontext_t *=
uc, void *eip) {
> > > +@@ -1215,7 +1215,9 @@ static void* getAndSetMcontextEip(ucontext_t *=
uc, void *eip) {
> > >       #endif
> > >   #elif defined(__linux__)
> > >       /* Linux */
> > > @@ -28,7 +28,7 @@ index bb76c5d..55a0696 100644
> > >       GET_SET_RETURN(uc->uc_mcontext.gregs[14], eip);
> > >       #elif defined(__X86_64__) || defined(__x86_64__)
> > >       GET_SET_RETURN(uc->uc_mcontext.gregs[16], eip);
> > > -@@ -1234,8 +1236,28 @@ void logRegisters(ucontext_t *uc) {
> > > +@@ -1401,8 +1403,28 @@ void logRegisters(ucontext_t *uc) {
> > >       #endif
> > >   /* Linux */
> > >   #elif defined(__linux__)
> > > diff --git a/meta-oe/recipes-extended/redis/redis_7.2.12.bb b/meta-oe=
/recipes-extended/redis/redis_7.2.14.bb
> > > similarity index 97%
> > > rename from meta-oe/recipes-extended/redis/redis_7.2.12.bb
> > > rename to meta-oe/recipes-extended/redis/redis_7.2.14.bb
> > > index 2b4087a74b..93235e3707 100644
> > > --- a/meta-oe/recipes-extended/redis/redis_7.2.12.bb
> > > +++ b/meta-oe/recipes-extended/redis/redis_7.2.14.bb
> > > @@ -17,7 +17,7 @@ SRC_URI =3D "http://download.redis.io/releases/${BP=
}.tar.gz \
> > >             file://0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITI=
ALIZER.patch \
> > >             file://0006-Define-correct-gregs-for-RISCV32.patch \
> > >            "
> > > -SRC_URI[sha256sum] =3D "97c60478a7c777ac914ca9d87a7e88ba265926456107=
e758c62d8f971d0196bc"
> > > +SRC_URI[sha256sum] =3D "21326da3f66c0aead4c8204c0ac52ff905337a77cadd=
169f75ac22835ea30025"
> > >
> > >  inherit autotools-brokensep pkgconfig update-rc.d systemd useradd
> > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#127177): https://lists.openembedded.org/g/openemb=
edded-devel/message/127177
> > > Mute This Topic: https://lists.openembedded.org/mt/119453647/3616702
> > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsu=
b [anuj.mittal@oss.qualcomm.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >

