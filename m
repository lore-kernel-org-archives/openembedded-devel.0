Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC343C433F5
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 03:51:34 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web09.5766.1639626693855378243
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Dec 2021 19:51:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JRdbaZvk;
 spf=pass (domain: gmail.com, ip: 209.85.222.182,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id 193so22127360qkh.10
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Dec 2021 19:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/9QGzQ+KYZiaCRZ+fGw4Ngt8ErYknWITI0MEfAuX/Fg=;
        b=JRdbaZvkR5Q6LxhbqWuvjLmDm+Xf8Zgyv1evlo5VLOaLCT+S8wjHYgEnLxWZV6ZDZz
         JxEmld5MLWqgNalE+zJ6bUm4Wjcwsx1bRgP1VtVXh+TbIsgFQigqFzp26GgCoB55hhNd
         D9eMtyhRocwXyzyOqkiVhTxFf2dvxAwmSVGunTNlJu3c17LwJDKG0BtmcHsCuTycim63
         h0/nkYLlpXqfFZ5zzi5gFpFseW6x17zf+CVfHIVpHquT7SKkDVkSk//vM5OGPnMess8D
         +hqPy1k1BKe3H+Q3mcVHhmunOPiQ1ABeGleUBLeLoOmnuwqa73FO2TMrNalMKJemMhez
         FuSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/9QGzQ+KYZiaCRZ+fGw4Ngt8ErYknWITI0MEfAuX/Fg=;
        b=LpH11rE2SMge959+og+8ujyoyCKZlPt6jdOMA5pdLqUd1nmQgopCsbI3j+BJ75KJI+
         Mu9pumcxip/fLwhWHDE25uIwYClbCDzsUH7G9Nn6NuWOFixwpHbX2QIm3IHoQYSnnVE4
         0zfSoR0m7Q3IwbQDAY8C2yNNIsxhW02D+qq8EEO5Y8bB+JOWW5R+NZkt5c2JS+SeOEb7
         ZJrJEbZg1Nq5G2d3oJLYdyBFubrGAF75jekMeGnku3ZrziLj4ji+p16iLGLvq3LrU/Yq
         c3wkQ/Vmk21SVSbEbqhZbEebtS2dDnTOx78gv5HaAPhkLbyNtFpW5KqgSNoMR67PtlT6
         svbw==
X-Gm-Message-State: AOAM530nBlr0tSEK+6hQSvaEiwGJ/euiUKtDFw3CTztZtGPb/A/Tqjsj
	T3jbxac/TxLk9pnpEilEfMCo+DyEkAyFIMD+oT8=
X-Google-Smtp-Source: 
 ABdhPJxrYHXmG/UpU/MG1JcCcL++BjyEqPUUtg6kvwxMwfQV5FNrIx22ZdRLS7Sl6PHV2dC7po39Mw61XjlCRefNCjE=
X-Received: by 2002:a05:620a:f94:: with SMTP id
 b20mr11027356qkn.463.1639626692615;
 Wed, 15 Dec 2021 19:51:32 -0800 (PST)
MIME-Version: 1.0
References: <20211215072835.1371-1-mingli.yu@windriver.com>
 <CAMKF1srh301NbKARXz6SPYJccoy-kMzwFJXo7mi65snXEydskA@mail.gmail.com>
 <5aec92e0-43bc-8bf5-08a4-cce18fc61fcd@windriver.com>
In-Reply-To: <5aec92e0-43bc-8bf5-08a4-cce18fc61fcd@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 15 Dec 2021 19:51:06 -0800
Message-ID: 
 <CAMKF1sqJ49_xmqr88NSE8Fqtz=d7Lwh8eUUm8mkKrQbq62yTCw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] php: Upgrade to 8.1.0
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Dec 2021 03:51:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94378

On Wed, Dec 15, 2021 at 6:34 PM Yu, Mingli <mingli.yu@windriver.com> wrote:
>
>
>
> On 12/16/21 2:05 AM, Khem Raj wrote:
> > [Please note: This e-mail is from an EXTERNAL e-mail address]
> >
> > Fails on x86_64
> >
> > | /home/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-poky-linux/php/8.1.0-r0/php-8.1.0/qemuwrapper:
> > line 2: 21613 Segmentation fault      (core dumped) PSEUDO_UNLOAD=1
> > qemu-x86_64 -r 3.2.0 -cpu core2duo -L
> > /home/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-poky-linux/php/8.1.0-r0/recipe-sysroot
> > -E LD_LIBRARY_PATH=/home/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-poky-linux/php/8.1.0-r0/recipe-sysroot/usr/lib:/home/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-poky-linux/php/8.1.0-r0/recipe-sysroot/lib
> > "$@"
> > | make: *** [Makefile:383: ext/opcache/jit/zend_jit_x86.c] Error 139
>
> I didn't reproduce the issue locally, anyway I will look into this.

I can see it fail on all different kind of builders and architectures
here is musl+qemuarm64 on ubuntu 18.04

https://errors.yoctoproject.org/Errors/Details/619373/

TOPDIR/build/tmp/work/cortexa57-yoe-linux-musl/php/8.1.0-r0/php-8.1.0/qemuwrapper
ext/opcache/minilua
TOPDIR/build/tmp/work/cortexa57-yoe-linux-musl/php/8.1.0-r0/php-8.1.0/ext/opcache/jit/dynasm/dynasm.lua
 -D ARM64=1 -o ext/opcache/jit/zend_jit_arm64.c
TOPDIR/build/tmp/work/cortexa57-yoe-linux-musl/php/8.1.0-r0/php-8.1.0/ext/opcache/jit/zend_jit_arm64.dasc
qemu-aarch64: ext/opcache/minilua: Invalid ELF image for this architecture
Makefile:383: recipe for target 'ext/opcache/jit/zend_jit_arm64.c' failed
make: *** [ext/opcache/jit/zend_jit_arm64.c] Error 255
make: *** Waiting for unfinished jobs....
ERROR: oe_runmake failed


>
> Thanks,
>
> >
> > see
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1797
> >
> > On Tue, Dec 14, 2021 at 11:28 PM Yu, Mingli <mingli.yu@windriver.com> wrote:
> >>
> >> From: Mingli Yu <mingli.yu@windriver.com>
> >>
> >> Rebase 2 patches to new version and enable openssl PACKAGECONFIG
> >> as OpenSSL 3.0 is now supported in the new version [1].
> >>
> >> [1] https://github.com/php/php-src/commit/7b34db0659dda933b1146a0ff249f25acca1d669
> >>
> >> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> >> ---
> >>   ...ext-opcache-config.m4-enable-opcache.patch | 50 +++++++++++--------
> >>   .../0011-use-qemuwrapper-for-minilua.patch    | 33 +++++++++---
> >>   .../php/{php_8.0.12.bb => php_8.1.0.bb}       |  4 +-
> >>   3 files changed, 57 insertions(+), 30 deletions(-)
> >>   rename meta-oe/recipes-devtools/php/{php_8.0.12.bb => php_8.1.0.bb} (98%)
> >>
> >> diff --git a/meta-oe/recipes-devtools/php/php/0001-ext-opcache-config.m4-enable-opcache.patch b/meta-oe/recipes-devtools/php/php/0001-ext-opcache-config.m4-enable-opcache.patch
> >> index 44534cc06..a967d6412 100644
> >> --- a/meta-oe/recipes-devtools/php/php/0001-ext-opcache-config.m4-enable-opcache.patch
> >> +++ b/meta-oe/recipes-devtools/php/php/0001-ext-opcache-config.m4-enable-opcache.patch
> >> @@ -1,6 +1,6 @@
> >> -From 8cabcf1043953a0fe48107204a2212609b8e6516 Mon Sep 17 00:00:00 2001
> >> -From: Claude Bing <cbing@cybernetics.com>
> >> -Date: Tue, 9 Nov 2021 12:59:15 -0500
> >> +From ca9b419f2c146061f73ee045cb0a069c18b40cd0 Mon Sep 17 00:00:00 2001
> >> +From: Mingli Yu <mingli.yu@windriver.com>
> >> +Date: Wed, 15 Dec 2021 14:00:08 +0800
> >>   Subject: [PATCH 01/11] ext/opcache/config.m4: enable opcache
> >>
> >>   We can't use AC_TRY_RUN to run programs in a cross compile
> >> @@ -17,15 +17,18 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
> >>   update patch to version 8.0.12
> >>   fix issue linking with librt
> >>   Signed-off-by: Claude Bing <cbing@cybernetics.com>
> >> +
> >> +update patch to version 8.1.0
> >> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> >>   ---
> >> - ext/opcache/config.m4 | 197 ++----------------------------------------
> >> - 1 file changed, 8 insertions(+), 189 deletions(-)
> >> + ext/opcache/config.m4 | 204 ++----------------------------------------
> >> + 1 file changed, 8 insertions(+), 196 deletions(-)
> >>
> >>   diff --git a/ext/opcache/config.m4 b/ext/opcache/config.m4
> >> -index 5492fd920c..95158ccfd9 100644
> >> +index 2a83fa2..9471b5d 100644
> >>   --- a/ext/opcache/config.m4
> >>   +++ b/ext/opcache/config.m4
> >> -@@ -101,202 +101,21 @@ if test "$PHP_OPCACHE" != "no"; then
> >> +@@ -108,209 +108,21 @@ if test "$PHP_OPCACHE" != "no"; then
> >>      AC_CHECK_FUNCS([mprotect])
> >>
> >>      AC_MSG_CHECKING(for sysvipc shared memory support)
> >> @@ -93,9 +96,10 @@ index 5492fd920c..95158ccfd9 100644
> >>   -  }
> >>   -  return 0;
> >>   -}
> >> --]])],[dnl
> >> +-]])],[have_shm_ipc=yes],[have_shm_ipc=no],[have_shm_ipc=no])
> >> +-  if test "$have_shm_ipc" = "yes"; then
> >>   -    AC_DEFINE(HAVE_SHM_IPC, 1, [Define if you have SysV IPC SHM support])
> >> --    have_shm_ipc=yes],[have_shm_ipc=no],[have_shm_ipc=no])
> >> +-  fi
> >>   +  AC_DEFINE(HAVE_SHM_IPC, 1, [Define if you have SysV IPC SHM support])
> >>   +  have_shm_ipc=yes
> >>      AC_MSG_RESULT([$have_shm_ipc])
> >> @@ -147,9 +151,19 @@ index 5492fd920c..95158ccfd9 100644
> >>   -  }
> >>   -  return 0;
> >>   -}
> >> --]])],[dnl
> >> +-]])],[have_shm_mmap_anon=yes],[have_shm_mmap_anon=no],[
> >> +-  case $host_alias in
> >> +-    *linux*)
> >> +-      have_shm_mmap_anon=yes
> >> +-      ;;
> >> +-    *)
> >> +-      have_shm_mmap_anon=no
> >> +-      ;;
> >> +-  esac
> >> +-])
> >> +-  if test "$have_shm_mmap_anon" = "yes"; then
> >>   -    AC_DEFINE(HAVE_SHM_MMAP_ANON, 1, [Define if you have mmap(MAP_ANON) SHM support])
> >> --    have_shm_mmap_anon=yes],[have_shm_mmap_anon=no],[have_shm_mmap_anon=no])
> >> +-  fi
> >>   +  AC_DEFINE(HAVE_SHM_MMAP_ANON, 1, [Define if you have mmap(MAP_ANON) SHM support])
> >>   +  have_shm_mmap_anon=yes
> >>      AC_MSG_RESULT([$have_shm_mmap_anon])
> >> @@ -219,16 +233,12 @@ index 5492fd920c..95158ccfd9 100644
> >>   -  }
> >>   -  return 0;
> >>   -}
> >> --]])],[dnl
> >> +-]])],[have_shm_mmap_posix=yes],[have_shm_mmap_posix=no],[have_shm_mmap_posix=no])
> >> +-  if test "$have_shm_mmap_posix" = "yes"; then
> >>   -    AC_DEFINE(HAVE_SHM_MMAP_POSIX, 1, [Define if you have POSIX mmap() SHM support])
> >> --    AC_MSG_RESULT([yes])
> >> --    have_shm_mmap_posix=yes
> >>   -    PHP_CHECK_LIBRARY(rt, shm_unlink, [PHP_ADD_LIBRARY(rt,1,OPCACHE_SHARED_LIBADD)])
> >> --  ],[
> >> --    AC_MSG_RESULT([no])
> >> --  ],[
> >> --    AC_MSG_RESULT([no])
> >> --  ])
> >> +-  fi
> >> +-  AC_MSG_RESULT([$have_shm_mmap_posix])
> >>   +  AC_DEFINE(HAVE_SHM_MMAP_POSIX, 1, [Define if you have POSIX mmap() SHM support])
> >>   +  AC_MSG_RESULT([yes])
> >>   +  have_shm_mmap_posix=yes
> >> @@ -237,5 +247,5 @@ index 5492fd920c..95158ccfd9 100644
> >>      PHP_NEW_EXTENSION(opcache,
> >>          ZendAccelerator.c \
> >>   --
> >> -2.25.1
> >> +2.17.1
> >>
> >> diff --git a/meta-oe/recipes-devtools/php/php/0011-use-qemuwrapper-for-minilua.patch b/meta-oe/recipes-devtools/php/php/0011-use-qemuwrapper-for-minilua.patch
> >> index 892a0460c..52d5c6696 100644
> >> --- a/meta-oe/recipes-devtools/php/php/0011-use-qemuwrapper-for-minilua.patch
> >> +++ b/meta-oe/recipes-devtools/php/php/0011-use-qemuwrapper-for-minilua.patch
> >> @@ -1,11 +1,28 @@
> >> ---- a/ext/opcache/jit/Makefile.frag    2021-10-19 06:34:32.000000000 -0400
> >> -+++ b/ext/opcache/jit/Makefile.frag    2021-11-15 15:10:41.437289836 -0500
> >> -@@ -3,7 +3,7 @@ $(builddir)/minilua: $(srcdir)/jit/dynas
> >> -       $(CC) $(srcdir)/jit/dynasm/minilua.c -lm -o $@
> >> +From 0f7b9264c5130b3ca0a20d326fb13ca8fc0a9969 Mon Sep 17 00:00:00 2001
> >> +From: Mingli Yu <mingli.yu@windriver.com>
> >> +Date: Wed, 15 Dec 2021 14:43:45 +0800
> >> +Subject: [PATCH] use qemuwrapper for minilua
> >> +
> >> +update to 8.1.0
> >> +
> >> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> >> +---
> >> + ext/opcache/jit/Makefile.frag | 2 +-
> >> + 1 file changed, 1 insertion(+), 1 deletion(-)
> >> +
> >> +diff --git a/ext/opcache/jit/Makefile.frag b/ext/opcache/jit/Makefile.frag
> >> +index 98c5cda..fb0e6f0 100644
> >> +--- a/ext/opcache/jit/Makefile.frag
> >> ++++ b/ext/opcache/jit/Makefile.frag
> >> +@@ -3,7 +3,7 @@ $(builddir)/minilua: $(srcdir)/jit/dynasm/minilua.c
> >> +       $(BUILD_CC) $(srcdir)/jit/dynasm/minilua.c -lm -o $@
> >>
> >> - $(builddir)/jit/zend_jit_x86.c: $(srcdir)/jit/zend_jit_x86.dasc $(srcdir)/jit/dynasm/*.lua $(builddir)/minilua
> >> --      $(builddir)/minilua $(srcdir)/jit/dynasm/dynasm.lua  $(DASM_FLAGS) -o $@ $(srcdir)/jit/zend_jit_x86.dasc
> >> -+      $(top_srcdir)/qemuwrapper $(builddir)/minilua $(srcdir)/jit/dynasm/dynasm.lua  $(DASM_FLAGS) -o $@ $(srcdir)/jit/zend_jit_x86.dasc
> >> + $(builddir)/jit/zend_jit_$(DASM_ARCH).c: $(srcdir)/jit/zend_jit_$(DASM_ARCH).dasc $(srcdir)/jit/dynasm/*.lua $(builddir)/minilua
> >> +-      $(builddir)/minilua $(srcdir)/jit/dynasm/dynasm.lua  $(DASM_FLAGS) -o $@ $(srcdir)/jit/zend_jit_$(DASM_ARCH).dasc
> >> ++      $(top_srcdir)/qemuwrapper $(builddir)/minilua $(srcdir)/jit/dynasm/dynasm.lua  $(DASM_FLAGS) -o $@ $(srcdir)/jit/zend_jit_$(DASM_ARCH).dasc
> >>
> >>    $(builddir)/jit/zend_jit.lo: \
> >> -       $(builddir)/jit/zend_jit_x86.c \
> >> +       $(builddir)/jit/zend_jit_$(DASM_ARCH).c \
> >> +--
> >> +2.17.1
> >> +
> >> diff --git a/meta-oe/recipes-devtools/php/php_8.0.12.bb b/meta-oe/recipes-devtools/php/php_8.1.0.bb
> >> similarity index 98%
> >> rename from meta-oe/recipes-devtools/php/php_8.0.12.bb
> >> rename to meta-oe/recipes-devtools/php/php_8.1.0.bb
> >> index 38771948f..29e124acf 100644
> >> --- a/meta-oe/recipes-devtools/php/php_8.0.12.bb
> >> +++ b/meta-oe/recipes-devtools/php/php_8.1.0.bb
> >> @@ -33,7 +33,7 @@ SRC_URI:append:class-target = " \
> >>             "
> >>
> >>   S = "${WORKDIR}/php-${PV}"
> >> -SRC_URI[sha256sum] = "b4886db1df322dc8fb128d8b34ae7e94f6fc682ecb29ff4f5a591d4de9feadbf"
> >> +SRC_URI[sha256sum] = "0725ed2baea125496a898455d501a77460218b2a0cfad773fa9322f491b82b61"
> >>
> >>
> >>   inherit autotools pkgconfig python3native gettext qemu
> >> @@ -77,7 +77,7 @@ EXTRA_OECONF:class-native = " \
> >>                   ${COMMON_EXTRA_OECONF} \
> >>   "
> >>
> >> -PACKAGECONFIG ??= "mysql sqlite3 imap opcache \
> >> +PACKAGECONFIG ??= "mysql sqlite3 imap opcache openssl \
> >>                      ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6 pam', d)} \
> >>   "
> >>   PACKAGECONFIG:class-native = ""
> >> --
> >> 2.17.1
> >>
> >>
> >> -=-=-=-=-=-=-=-=-=-=-=-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#94363): https://lists.openembedded.org/g/openembedded-devel/message/94363
> >> Mute This Topic: https://lists.openembedded.org/mt/87739886/1997914
> >> Group Owner: openembedded-devel+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> >> -=-=-=-=-=-=-=-=-=-=-=-
> >>

