Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30D62C64EC4
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 17:51:13 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web10.21099.1678384266262574736
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Mar 2023 09:51:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ffuldl/c;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id bj30so2267749oib.6
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Mar 2023 09:51:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678384265;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WbE3/CQefq3OFGeLwhMZ4xlroGvfUgBxdvV306Brk7w=;
        b=Ffuldl/c2ioqCry+2naWWuRZwCVH/OLomiSLcqUugNfU6440Kzp0wiLZG6f79dzfKn
         c+6k1XfE7dWhGtk5k6KzqAuiyhwN5PoxFVeenV7huhf+Og6l+Ke9NnQXCSJ6SS8bJgAG
         aYmJ1zLJiC+Fty31A3P1I/lpPuNvkJuixDx2ndKRPEgiAhHKG7uTN0ZXp4B77gEnB8Kh
         y0ReS4U5eYKClt8B1aMv0ffHSbOlWv1SJgLE8dCdjMkQ+mdPOwSl6BwLqB3PkOwq/vwt
         2inD2QXefKWD5eFRKgP9o4LW6zJc39poLgOmCFe/TyFKWaM5exO2nW2q/bMHJGI9035H
         b+dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678384265;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WbE3/CQefq3OFGeLwhMZ4xlroGvfUgBxdvV306Brk7w=;
        b=EfAWKGcvNKuuNNoqiP/I9AB8KDH4Y1Vbvbkr5W2nYwewFLGMv7mFQn8uLlt7b96E4N
         YFHcdAr3vUa+EtPQgb9kP3JLtB8xExv09KjNVBs5jK6m+CTslcuAT5jiDT5pUW6QJGgw
         abuc2+Z0amTP1a3XZjsc8Bjop1xRGOqz1mWMMk5QIc78fFTPfAyundjwmRt347J78vVX
         LHlZnXMw3XXAjaJxwNpLGQhZjmld32vGOI06XI1NISZN8QMe65dc6kq+6ckZv2yA2Erd
         Hr1I8I97tGLNuiqr8c6leNy37+F+VB1Gy6jtIr6HUHJezoVv0KCaLazS8/6GveL/zX3k
         QSGA==
X-Gm-Message-State: AO0yUKUWm340pPzR630u1suwtgWbG8+HddqZNzW7FqmWQlMuTyLGKDfm
	i8Q1Q254GoZ01HEbXRF2cl1NDgXAPacoaPNxsnq9eyYj
X-Google-Smtp-Source: AK7set9W7RrpGoGmCpF0b76jdp9wVPttmjwSbcmCICGCwf7fYF331hOaNtee1+pnSDdV2YRYzzT68d1nsDmNZu3Wzm4=
X-Received: by 2002:a05:6808:8ed:b0:384:371a:a413 with SMTP id
 d13-20020a05680808ed00b00384371aa413mr6834060oic.4.1678384264026; Thu, 09 Mar
 2023 09:51:04 -0800 (PST)
MIME-Version: 1.0
References: <20230309084038.1182832-1-changqing.li@windriver.com>
In-Reply-To: <20230309084038.1182832-1-changqing.li@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 9 Mar 2023 09:50:38 -0800
Message-ID: <CAMKF1sqFz9vpd1atHDmT5pFxxDVtasLOAF7COYLH09jH-kw6tw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] liblockfile: upgrade 1.14 -> 1.17
To: Changqing Li <changqing.li@eng.windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Mar 2023 17:51:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101463

please rebase on master and resend

On Thu, Mar 9, 2023 at 12:40=E2=80=AFAM Changqing Li
<changqing.li@eng.windriver.com> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> Updated patches:
> configure.patch
> 0001-Makefile.in-redefine-LOCKPROG.patch
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  ...akefile.in-Don-t-try-to-run-ldconfig.patch | 12 +++----
>  .../0001-Makefile.in-add-DESTDIR.patch        |  6 ++--
>  ...001-Makefile.in-install-nfslock-libs.patch | 10 +++---
>  .../0001-Makefile.in-redefine-LOCKPROG.patch  | 34 ++++++++++++++-----
>  .../liblockfile/liblockfile/configure.patch   | 22 ++++++++----
>  ...iblockfile-fix-install-so-to-man-dir.patch |  8 ++---
>  ...iblockfile_1.14.bb =3D> liblockfile_1.17.bb} | 14 ++++----
>  7 files changed, 67 insertions(+), 39 deletions(-)
>  rename meta-oe/recipes-extended/liblockfile/{liblockfile_1.14.bb =3D> li=
blockfile_1.17.bb} (72%)
>
> diff --git a/meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefi=
le.in-Don-t-try-to-run-ldconfig.patch b/meta-oe/recipes-extended/liblockfil=
e/liblockfile/0001-Makefile.in-Don-t-try-to-run-ldconfig.patch
> index 5a1d9a995..0e814d4f5 100644
> --- a/meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefile.in-D=
on-t-try-to-run-ldconfig.patch
> +++ b/meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefile.in-D=
on-t-try-to-run-ldconfig.patch
> @@ -1,4 +1,4 @@
> -From 5876bd17caac96df70ef400bfeebb155c0bd7359 Mon Sep 17 00:00:00 2001
> +From 4d07cbaddeed8fe283d77336a6432c4074450722 Mon Sep 17 00:00:00 2001
>  From: Changqing Li <changqing.li@windriver.com>
>  Date: Wed, 8 Feb 2023 10:34:45 +0800
>  Subject: [PATCH] Makefile.in: Don't try to run ldconfig
> @@ -27,10 +27,10 @@ Signed-off-by: Changqing Li <changqing.li@windriver.c=
om>
>   1 file changed, 2 deletions(-)
>
>  diff --git a/Makefile.in b/Makefile.in
> -index bfa0acb..ae5be56 100644
> +index 232f1b6..5754ca5 100644
>  --- a/Makefile.in
>  +++ b/Makefile.in
> -@@ -58,7 +58,6 @@ install_shared:      shared install_static install_com=
mon
> +@@ -69,7 +69,6 @@ install_shared:      shared install_static install_com=
mon
>                         $(libdir)/liblockfile.so.$(SOVER)
>                 ln -s liblockfile.so.$(SOVER) $(libdir)/liblockfile.so.$(=
MAJOR)
>                 ln -s liblockfile.so.$(SOVER) $(libdir)/liblockfile.so
> @@ -38,14 +38,14 @@ index bfa0acb..ae5be56 100644
>
>   install_common:
>                 install -d -m 755 -g root -p $(includedir)
> -@@ -79,7 +78,6 @@ install_nfslib:      nfslib
> +@@ -90,7 +89,6 @@ install_nfslib:      nfslib
>                 install -m 755 nfslock.so.$(NFSVER) $(nfslockdir)
>                 ln -sf nfslock.so.$(NFSVER) $(libdir)/nfslock.so
>                 ln -sf nfslock.so.$(NFSVER) $(libdir)/nfslock.so.0
>  -              if test "$(DESTDIR)" =3D ""; then @LDCONFIG@; fi
>
> - clean:
> -               rm -f *.a *.o *.so *.so.* dotlockfile
> + test:         test-stamp
> +               @:
>  --
>  2.25.1
>
> diff --git a/meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefi=
le.in-add-DESTDIR.patch b/meta-oe/recipes-extended/liblockfile/liblockfile/=
0001-Makefile.in-add-DESTDIR.patch
> index ea415dd8b..2533b3a00 100644
> --- a/meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefile.in-a=
dd-DESTDIR.patch
> +++ b/meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefile.in-a=
dd-DESTDIR.patch
> @@ -1,4 +1,4 @@
> -From 67843dabe1177840697839b916fd899218893ec7 Mon Sep 17 00:00:00 2001
> +From 8e370a2f35d0c3472ddc9068fab19d0077434c61 Mon Sep 17 00:00:00 2001
>  From: Mingli Yu <mingli.yu@windriver.com>
>  Date: Thu, 19 Jul 2018 00:25:23 -0700
>  Subject: [PATCH] Makefile.in: add DESTDIR
> @@ -29,7 +29,7 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>   1 file changed, 5 insertions(+), 5 deletions(-)
>
>  diff --git a/Makefile.in b/Makefile.in
> -index 36a6d23..1e4130e 100644
> +index 9c74b35..8cbda1d 100644
>  --- a/Makefile.in
>  +++ b/Makefile.in
>  @@ -12,11 +12,11 @@ CC         =3D @CC@
> @@ -50,5 +50,5 @@ index 36a6d23..1e4130e 100644
>   MAILGROUP     =3D @MAILGROUP@
>
>  --
> -2.17.1
> +2.25.1
>
> diff --git a/meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefi=
le.in-install-nfslock-libs.patch b/meta-oe/recipes-extended/liblockfile/lib=
lockfile/0001-Makefile.in-install-nfslock-libs.patch
> index a6b297b59..f99ac2bf7 100644
> --- a/meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefile.in-i=
nstall-nfslock-libs.patch
> +++ b/meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefile.in-i=
nstall-nfslock-libs.patch
> @@ -1,4 +1,4 @@
> -From 631d46efff2a6d8970e202ba5422ebedd17a8d2f Mon Sep 17 00:00:00 2001
> +From 0f34d1d91d641c3d5c5bb2eb11bd6eec7cfaf738 Mon Sep 17 00:00:00 2001
>  From: Mingli Yu <mingli.yu@windriver.com>
>  Date: Thu, 19 Jul 2018 01:00:10 -0700
>  Subject: [PATCH] Makefile.in: install nfslock.so and nfslock.so.0
> @@ -14,10 +14,10 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>   1 file changed, 2 insertions(+)
>
>  diff --git a/Makefile.in b/Makefile.in
> -index 1e4130e..0f1b506 100644
> +index 8cbda1d..3a74811 100644
>  --- a/Makefile.in
>  +++ b/Makefile.in
> -@@ -77,6 +77,8 @@ install_common:
> +@@ -88,6 +88,8 @@ install_common:
>   install_nfslib:       nfslib
>                 install -d -m 755 -g root -p $(nfslockdir)
>                 install -m 755 nfslock.so.$(NFSVER) $(nfslockdir)
> @@ -25,7 +25,7 @@ index 1e4130e..0f1b506 100644
>  +              ln -sf nfslock.so.$(NFSVER) $(libdir)/nfslock.so.0
>                 if test "$(DESTDIR)" =3D ""; then @LDCONFIG@; fi
>
> - clean:
> + test:         test-stamp
>  --
> -2.17.1
> +2.25.1
>
> diff --git a/meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefi=
le.in-redefine-LOCKPROG.patch b/meta-oe/recipes-extended/liblockfile/libloc=
kfile/0001-Makefile.in-redefine-LOCKPROG.patch
> index 35549ff2d..c387db123 100644
> --- a/meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefile.in-r=
edefine-LOCKPROG.patch
> +++ b/meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefile.in-r=
edefine-LOCKPROG.patch
> @@ -1,4 +1,4 @@
> -From 9beb650712d448ad9c0899de9d98e9b623f9c249 Mon Sep 17 00:00:00 2001
> +From 05227e74b732f13ed5a2a98232676f98bba028e6 Mon Sep 17 00:00:00 2001
>  From: Mingli Yu <mingli.yu@windriver.com>
>  Date: Fri, 12 Aug 2022 11:18:15 +0800
>  Subject: [PATCH] Makefile.in: redefine LOCKPROG
> @@ -11,23 +11,41 @@ And it should be "/usr/bin/dotlockfile" on the target=
.
>  Upstream-Status: Inappropriate [oe specific]
>
>  Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> +
> +Update patch for 1.17, also redefine LOCKPROG in other lines
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
>  ---
> - Makefile.in | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> + Makefile.in | 8 ++++----
> + 1 file changed, 4 insertions(+), 4 deletions(-)
>
>  diff --git a/Makefile.in b/Makefile.in
> -index 6e53179..bfa0acb 100644
> +index e447cb2..e02d75e 100644
>  --- a/Makefile.in
>  +++ b/Makefile.in
> -@@ -42,7 +42,7 @@ dotlockfile: dotlockfile.o xlockfile.o
> -               $(CC) $(LDFLAGS) -o dotlockfile dotlockfile.o xlockfile.o
> +@@ -44,19 +44,19 @@ dotlockfile:       dotlockfile.o dlockfile.o
> +               $(CC) $(LDFLAGS) -o dotlockfile dotlockfile.o dlockfile.o
> +
> + dotlockfile.o:        dotlockfile.c
> +-              $(CC) $(CFLAGS) -DLOCKPROG=3D\"$(bindir)/dotlockfile\" \
> ++              $(CC) $(CFLAGS) -DLOCKPROG=3D\"/usr/bin/dotlockfile\" \
> +                       -c dotlockfile.c
>
>   lockfile.o:   lockfile.c
>  -              $(CC) $(CFLAGS) -DLIB -DLOCKPROG=3D\"$(bindir)/dotlockfil=
e\" \
>  +              $(CC) $(CFLAGS) -DLIB -DLOCKPROG=3D\"/usr/bin/dotlockfile=
\" \
> -                       -c lockfile.c
> +                       -DSTATIC -c lockfile.c
> +
> + solockfile.o: lockfile.c
> +-              $(CC) $(CFLAGS) -DLIB -DLOCKPROG=3D\"$(bindir)/dotlockfil=
e\" \
> ++              $(CC) $(CFLAGS) -DLIB -DLOCKPROG=3D\"/usr/bin/dotlockfile=
\" \
> +                       -c lockfile.c -o solockfile.o
> +
> + dlockfile.o:  lockfile.c
> +-              $(CC) $(CFLAGS) -DLOCKPROG=3D\"$(bindir)/dotlockfile\" \
> ++              $(CC) $(CFLAGS) -DLOCKPROG=3D\"/usr/bin/dotlockfile\" \
> +                       -c lockfile.c -o dlockfile.o
>
> - xlockfile.o:  lockfile.c
> + install_static:       static install_common
>  --
>  2.25.1
>
> diff --git a/meta-oe/recipes-extended/liblockfile/liblockfile/configure.p=
atch b/meta-oe/recipes-extended/liblockfile/liblockfile/configure.patch
> index ea13e11d2..56f2d05eb 100644
> --- a/meta-oe/recipes-extended/liblockfile/liblockfile/configure.patch
> +++ b/meta-oe/recipes-extended/liblockfile/liblockfile/configure.patch
> @@ -1,10 +1,17 @@
> +From fd3fce8c1a3d0c70a0ffd461fbbe7e2ef71dd3a7 Mon Sep 17 00:00:00 2001
> +From: Changqing Li <changqing.li@windriver.com>
> +Date: Tue, 7 Mar 2023 11:05:45 +0800
> +Subject: [PATCH] Update patch for 1.17
>
> -#
> -# Patch managed by http://www.mn-logistik.de/unsupported/pxa250/patcher
> -#
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + configure.ac | 8 +++++---
> + 1 file changed, 5 insertions(+), 3 deletions(-)
>
> ---- liblockfile-1.05/./configure.in~configure
> -+++ liblockfile-1.05/./configure.in
> +diff --git a/configure.ac b/configure.ac
> +index df26cee..76e9165 100644
> +--- a/configure.ac
> ++++ b/configure.ac
>  @@ -1,4 +1,5 @@
>  -AC_INIT(lockfile.c)
>  +AC_INIT
> @@ -12,7 +19,7 @@
>   AC_CONFIG_HEADER(autoconf.h)
>   AC_REVISION($Revision: 1.0 $)dnl
>
> -@@ -111,7 +112,8 @@
> +@@ -111,7 +112,8 @@ AC_SUBST(TARGETS)
>   AC_SUBST(INSTALL_TARGETS)
>   AC_SUBST(nfslockdir)
>
> @@ -23,3 +30,6 @@
>  -)
>  +])
>  +AC_OUTPUT
> +--
> +2.25.1
> +
> diff --git a/meta-oe/recipes-extended/liblockfile/liblockfile/liblockfile=
-fix-install-so-to-man-dir.patch b/meta-oe/recipes-extended/liblockfile/lib=
lockfile/liblockfile-fix-install-so-to-man-dir.patch
> index da2503339..046cd8e69 100644
> --- a/meta-oe/recipes-extended/liblockfile/liblockfile/liblockfile-fix-in=
stall-so-to-man-dir.patch
> +++ b/meta-oe/recipes-extended/liblockfile/liblockfile/liblockfile-fix-in=
stall-so-to-man-dir.patch
> @@ -1,4 +1,4 @@
> -From 363eb1aaeca914c7d36a2cdaf1417e4f87af4c22 Mon Sep 17 00:00:00 2001
> +From 079d04c187800e22f18723c74e41c4e46eef67f8 Mon Sep 17 00:00:00 2001
>  From: Mingli Yu <mingli.yu@windriver.com>
>  Date: Thu, 19 Jul 2018 01:12:47 -0700
>  Subject: [PATCH] Makefile.in: define dotlockfile.1 installed to man
> @@ -16,10 +16,10 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/Makefile.in b/Makefile.in
> -index 0f1b506..6e53179 100644
> +index 3a74811..e447cb2 100644
>  --- a/Makefile.in
>  +++ b/Makefile.in
> -@@ -71,7 +71,7 @@ install_common:
> +@@ -82,7 +82,7 @@ install_common:
>                 else \
>                   install -g root -m 755 dotlockfile $(bindir); \
>                 fi
> @@ -29,5 +29,5 @@ index 0f1b506..6e53179 100644
>
>   install_nfslib:       nfslib
>  --
> -2.17.1
> +2.25.1
>
> diff --git a/meta-oe/recipes-extended/liblockfile/liblockfile_1.14.bb b/m=
eta-oe/recipes-extended/liblockfile/liblockfile_1.17.bb
> similarity index 72%
> rename from meta-oe/recipes-extended/liblockfile/liblockfile_1.14.bb
> rename to meta-oe/recipes-extended/liblockfile/liblockfile_1.17.bb
> index e07dab3c7..68123e35a 100644
> --- a/meta-oe/recipes-extended/liblockfile/liblockfile_1.14.bb
> +++ b/meta-oe/recipes-extended/liblockfile/liblockfile_1.17.bb
> @@ -4,8 +4,8 @@ SECTION =3D "libs"
>  LICENSE =3D "LGPL-2.0-or-later & GPL-2.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3Df4ba6ad04fcb05cc30a4cfa5062=
c55a3"
>
> -SRC_URI =3D "${DEBIAN_MIRROR}/main/libl/liblockfile/liblockfile_1.14.ori=
g.tar.gz \
> -    ${DEBIAN_MIRROR}/main/libl/liblockfile/liblockfile_1.14-1.debian.tar=
.bz2;name=3D1.14-1 \
> +SRC_URI =3D "${DEBIAN_MIRROR}/main/libl/liblockfile/liblockfile_1.17.ori=
g.tar.gz \
> +    ${DEBIAN_MIRROR}/main/libl/liblockfile/liblockfile_1.17-1.debian.tar=
.bz2;name=3D1.17-1 \
>      file://configure.patch \
>      file://0001-Makefile.in-add-DESTDIR.patch \
>      file://0001-Makefile.in-install-nfslock-libs.patch \
> @@ -14,13 +14,13 @@ SRC_URI =3D "${DEBIAN_MIRROR}/main/libl/liblockfile/l=
iblockfile_1.14.orig.tar.gz \
>      file://0001-Makefile.in-Don-t-try-to-run-ldconfig.patch \
>  "
>
> -SRC_URI[md5sum] =3D "420c056ba0cc4d1477e402f70ba2f5eb"
> -SRC_URI[sha256sum] =3D "ab40d4a3e8cbc204f7e87fea637a4e4ddf9a1149aaa0a723=
a4267febd0b1d060"
> +SRC_URI[md5sum] =3D "918c4c07f7b99fc327db8bf39d3a1804"
> +SRC_URI[sha256sum] =3D "6e937f3650afab4aac198f348b89b1ca42edceb17fb6bb09=
18f642143ccfd15e"
>
> -SRC_URI[1.14-1.md5sum] =3D "f9a44928c3477d218c56252712ebc479"
> -SRC_URI[1.14-1.sha256sum] =3D "73f9be769e602149391588c28f0f4f5cda131e30f=
b94c0777dbb23d811ac21ff"
> +SRC_URI[1.17-1.md5sum] =3D "40415c5702f82681d9811e4e9e182813"
> +SRC_URI[1.17-1.sha256sum] =3D "e3657c0e3facfeccb58900c0b48d56cd68ad5f9f2=
4d1b4c6eaa69c26490fb673"
>
> -S =3D "${WORKDIR}/${BPN}"
> +S =3D "${WORKDIR}/${BP}"
>
>  inherit autotools-brokensep
>
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101442): https://lists.openembedded.org/g/openembedde=
d-devel/message/101442
> Mute This Topic: https://lists.openembedded.org/mt/97492257/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

