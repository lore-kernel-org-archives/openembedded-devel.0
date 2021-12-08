Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE220C433EF
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 06:05:01 +0000 (UTC)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com
 [209.85.221.179])
 by mx.groups.io with SMTP id smtpd.web11.8625.1638943498726039625
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Dec 2021 22:04:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JeiyJj0e;
 spf=pass (domain: gmail.com, ip: 209.85.221.179,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f179.google.com with SMTP id m16so858825vkl.13
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Dec 2021 22:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cX/uiRh4cntPLZpxsSxGpA4NMZowWYJGi8g34v6wTBM=;
        b=JeiyJj0eabU1aH1SfRmXPOn5fzb3SVGOBdWhqqYh6ax0oZkItOMzsvmAfdhnh+7qk/
         nk6xjzpNfXYGTy46fJb41CGcSje1e6EjEkzzLsPGMyZoDY3kguFdHHPAqzYvGDWMbEAo
         cswucqh7o9CsdiJbJYzigreBulVfMYjFfHR4IGmBDoQfPYDRtrI59oz443PkbyupPSAJ
         pYIkmCW1ArS8faE79kqaDTA9LP4PO+N5YlSKNwA6kOONA8SwxQ7hxZ2Z2q58M1a7Mz/w
         KEoJK1BgofPHOpkIhIFzDwjuCGgIDRB4hcHW+WHyhxHIzBLMeY/gz//WHh0RWtGJz7cX
         uADg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cX/uiRh4cntPLZpxsSxGpA4NMZowWYJGi8g34v6wTBM=;
        b=7XBK9lSP7HvydaVjyyHLAo3+6ybCn5HK7CBSw6oEkfV3Rut++lhOqJGcSF1zsIxxt0
         ie6Rov1pLJJTyo/PLX78ntjHX2Mej0F3OJ189HSV87hK9Yujs8KzN7yqSyUPinXfYzGP
         AeT7W6MAYmjnLbj8nh6ibx2/CrhqwxIljp68YeapvSuOVgHVuhan1rhZ9ochRqUbGp+D
         HiUV0sNnFnGKBBUd97RR+BRWs4juH9RNY/h54M7C3XrB1bGhnusMSFd3rtK+Ek15sAEf
         ywd+7mcVvQk6p/uFhr1wxcrC6TQkQEhiwT1dIePjVKDQbwF7g/QM/nl8uwhhAB0Ar/2j
         m3Iw==
X-Gm-Message-State: AOAM530Lxfemw6IiMj8//2ZF6i81rGaX6eQ7d0Ntg0HjnQ9dgyh0GUv4
	BIdKLbeFjj8mQCcN3YgRTijeMesR+FjotJzgilY=
X-Google-Smtp-Source: 
 ABdhPJzn56kW8cisU74kdjJWMmoukvtWu30NOgmobzXUYtBghsQsG92HNLvZxBUDu+MbmWnW8+yjPeqEL4dHEJCXbi4=
X-Received: by 2002:a05:6122:2005:: with SMTP id
 l5mr59917235vkd.4.1638943497487;
 Tue, 07 Dec 2021 22:04:57 -0800 (PST)
MIME-Version: 1.0
References: <20211208021417.3352488-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20211208021417.3352488-1-open.source@oleksandr-kravchuk.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 8 Dec 2021 07:04:46 +0100
Message-ID: 
 <CANNYZj9A7XVf8h7ASVzXtz_kLWG6E8TEcSzt++vi2V=K5=1DHQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] python3: udpate to 3.10.1
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f9894a05d29c440d"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Dec 2021 06:05:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94247

--000000000000f9894a05d29c440d
Content-Type: text/plain; charset="UTF-8"

Wrong mailing list :)

Alex

On Wed 8. Dec 2021 at 3.14, Oleksandr Kravchuk <
open.source@oleksandr-kravchuk.com> wrote:

> Refreshed patches.
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  ...ib-termcap-to-linker-flags-to-avoid-.patch |  6 ++---
>  ...hell-version-of-python-config-that-w.patch |  7 +++---
>  ...-search-system-for-headers-libraries.patch |  6 ++---
>  ...e-stdin-I-O-errors-same-way-as-maste.patch |  8 +++----
>  ...-use-prefix-value-from-build-configu.patch |  8 +++----
>  ...file-do-not-compile-.pyc-in-parallel.patch |  7 +++---
>  ...-qemu-wrapper-when-gathering-profile.patch |  7 +++---
>  ...sts-due-to-load-variability-on-YP-AB.patch | 17 ++++++-------
>  ...FLAG_REF-always-for-interned-strings.patch |  4 ++--
>  ...-detection-of-mips-architecture-for-.patch | 20 +++++++---------
>  ...fig-append-STAGING_LIBDIR-python-sys.patch |  4 ++--
>  ...asename-to-replace-CC-for-checking-c.patch | 24 +++++++++----------
>  ...g.py-use-platlibdir-also-for-purelib.patch |  8 +++----
>  ...pes.test_find-skip-without-tools-sdk.patch |  7 +++---
>  ...le.py-correct-the-test-output-format.patch | 14 +++++------
>  ...report-missing-dependencies-for-disa.patch | 10 ++++----
>  ...up.py-do-not-add-a-curses-include-pa.patch | 11 +++++----
>  ...tutils-prefix-is-inside-staging-area.patch |  6 ++---
>  .../python3/avoid_warning_about_tkinter.patch |  6 ++---
>  .../python/python3/cgi_py.patch               |  4 ++--
>  .../python/python3/crosspythonpath.patch      | 15 +++++++++---
>  .../python/python3/makerace.patch             |  6 ++---
>  .../python/python3/python-config.patch        | 10 ++++----
>  .../{python3_3.10.0.bb => python3_3.10.1.bb}  |  2 +-
>  24 files changed, 109 insertions(+), 108 deletions(-)
>  rename meta/recipes-devtools/python/{python3_3.10.0.bb =>
> python3_3.10.1.bb} (99%)
>
> diff --git
> a/meta/recipes-devtools/python/python3/0001-Do-not-add-usr-lib-termcap-to-linker-flags-to-avoid-.patch
> b/meta/recipes-devtools/python/python3/0001-Do-not-add-usr-lib-termcap-to-linker-flags-to-avoid-.patch
> index 59592821d7..62ef6efc28 100644
> ---
> a/meta/recipes-devtools/python/python3/0001-Do-not-add-usr-lib-termcap-to-linker-flags-to-avoid-.patch
> +++
> b/meta/recipes-devtools/python/python3/0001-Do-not-add-usr-lib-termcap-to-linker-flags-to-avoid-.patch
> @@ -1,4 +1,4 @@
> -From 039c53dd5baddec3359a05be0bff46a3b32bbb84 Mon Sep 17 00:00:00 2001
> +From 80f872e4573f542d33f91514538755557d566f79 Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Fri, 25 Jan 2019 19:04:13 +0100
>  Subject: [PATCH] Do not add /usr/lib/termcap to linker flags to avoid host
> @@ -12,10 +12,10 @@ Signed-off-by: Alexander Kanavin <
> alex.kanavin@gmail.com>
>   1 file changed, 1 deletion(-)
>
>  diff --git a/setup.py b/setup.py
> -index 20d7f35..ab18ff0 100644
> +index 43e807f..11b5cf5 100644
>  --- a/setup.py
>  +++ b/setup.py
> -@@ -957,7 +957,6 @@ class PyBuildExt(build_ext):
> +@@ -1149,7 +1149,6 @@ class PyBuildExt(build_ext):
>                                                        'termcap'):
>                   readline_libs.append('termcap')
>               self.add(Extension('readline', ['readline.c'],
> diff --git
> a/meta/recipes-devtools/python/python3/0001-Do-not-use-the-shell-version-of-python-config-that-w.patch
> b/meta/recipes-devtools/python/python3/0001-Do-not-use-the-shell-version-of-python-config-that-w.patch
> index 83fd52d87f..d98f243cb1 100644
> ---
> a/meta/recipes-devtools/python/python3/0001-Do-not-use-the-shell-version-of-python-config-that-w.patch
> +++
> b/meta/recipes-devtools/python/python3/0001-Do-not-use-the-shell-version-of-python-config-that-w.patch
> @@ -1,4 +1,4 @@
> -From 148861fa16f2aaacd518770f337ea54b5182f981 Mon Sep 17 00:00:00 2001
> +From 2406432449784243b7590009d42bd0e871253b2e Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Tue, 29 Jan 2019 15:03:01 +0100
>  Subject: [PATCH] Do not use the shell version of python-config that was
> @@ -9,15 +9,16 @@ outputs directories correctly.
>
>  Upstream-Status: Inappropriate [oe-specific]
>  Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +
>  ---
>   Makefile.pre.in | 9 +++------
>   1 file changed, 3 insertions(+), 6 deletions(-)
>
>  diff --git a/Makefile.pre.in b/Makefile.pre.in
> -index 2d2e11f..cc19942 100644
> +index ee85f35..f0aedb7 100644
>  --- a/Makefile.pre.in
>  +++ b/Makefile.pre.in
> -@@ -1431,12 +1431,9 @@ python-config: $(srcdir)/Misc/python-config.in
> Misc/python-config.sh
> +@@ -1640,12 +1640,9 @@ python-config: $(srcdir)/Misc/python-config.in
> Misc/python-config.sh
>         sed -e "s,@EXENAME@,$(BINDIR)/python$(LDVERSION)$(EXE)," <
> $(srcdir)/Misc/python-config.in >python-config.py
>         @ # Replace makefile compat. variable references with shell script
> compat. ones; $(VAR) -> ${VAR}
>         LC_ALL=C sed -e 's,\$$(\([A-Za-z0-9_]*\)),\$$\{\1\},g' <
> Misc/python-config.sh >python-config
> diff --git
> a/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
> b/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
> index 46179ba1d1..27a5992880 100644
> ---
> a/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
> +++
> b/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
> @@ -1,4 +1,4 @@
> -From cebb772d718a8f798ed5ae311a6e3e61534bea95 Mon Sep 17 00:00:00 2001
> +From df1a5e4bc6c8523eaa33daa2a90707fe6c6bddb6 Mon Sep 17 00:00:00 2001
>  From: Jeremy Puhlman <jpuhlman@mvista.com>
>  Date: Wed, 4 Mar 2020 00:06:42 +0000
>  Subject: [PATCH] Don't search system for headers/libraries
> @@ -11,10 +11,10 @@ Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
>  diff --git a/setup.py b/setup.py
> -index 95e3e11..32a4d42 100644
> +index c190002..5ef368d 100644
>  --- a/setup.py
>  +++ b/setup.py
> -@@ -840,8 +840,8 @@ class PyBuildExt(build_ext):
> +@@ -854,8 +854,8 @@ class PyBuildExt(build_ext):
>               add_dir_to_list(self.compiler.include_dirs,
>                               sysconfig.get_config_var("INCLUDEDIR"))
>
> diff --git
> a/meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch
> b/meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch
> index d6aa9501a7..df5179e877 100644
> ---
> a/meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch
> +++
> b/meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch
> @@ -1,4 +1,4 @@
> -From d8521ee967937184eadc59fff1a30740ad181a98 Mon Sep 17 00:00:00 2001
> +From 86061629f4a179e740a17e53dd2c98ab47af2fe2 Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex@linutronix.de>
>  Date: Thu, 16 Sep 2021 16:35:37 +0200
>  Subject: [PATCH] Lib/pty.py: handle stdin I/O errors same way as master
> I/O
> @@ -24,12 +24,13 @@ So let's treat both channels the same.
>
>  Upstream-Status: Submitted [https://github.com/python/cpython/pull/28388]
>  Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> +
>  ---
>   Lib/pty.py | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
>  diff --git a/Lib/pty.py b/Lib/pty.py
> -index 8d8ce40df5..35439c6b96 100644
> +index 8d8ce40..35439c6 100644
>  --- a/Lib/pty.py
>  +++ b/Lib/pty.py
>  @@ -154,7 +154,10 @@ def _copy(master_fd, master_read=_read,
> stdin_read=_read):
> @@ -44,6 +45,3 @@ index 8d8ce40df5..35439c6b96 100644
>               if not data:
>                   fds.remove(STDIN_FILENO)
>               else:
> ---
> -2.20.1
> -
> diff --git
> a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
> b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
> index b72c709130..ad384231a5 100644
> ---
> a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
> +++
> b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
> @@ -1,4 +1,4 @@
> -From aceaa16e25a8ab6a00f906c340843999635c8e23 Mon Sep 17 00:00:00 2001
> +From 2d4bde19e0df7244e1cd17c4f4a255d488cb3e56 Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex@linutronix.de>
>  Date: Fri, 10 Sep 2021 12:28:31 +0200
>  Subject: [PATCH] Lib/sysconfig.py: use prefix value from build
> configuration
> @@ -9,12 +9,13 @@ native python.
>
>  Upstream-Status: Inappropriate [oe-core cross builds]
>  Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> +
>  ---
>   Lib/sysconfig.py | 5 +++++
>   1 file changed, 5 insertions(+)
>
>  diff --git a/Lib/sysconfig.py b/Lib/sysconfig.py
> -index 95b48f6..84f6427 100644
> +index e64bcdc..40c6b3e 100644
>  --- a/Lib/sysconfig.py
>  +++ b/Lib/sysconfig.py
>  @@ -613,6 +613,11 @@ def get_config_vars(*args):
> @@ -29,6 +30,3 @@ index 95b48f6..84f6427 100644
>           # For backward compatibility, see issue19555
>           SO = _CONFIG_VARS.get('EXT_SUFFIX')
>           if SO is not None:
> ---
> -2.20.1
> -
> diff --git
> a/meta/recipes-devtools/python/python3/0001-Makefile-do-not-compile-.pyc-in-parallel.patch
> b/meta/recipes-devtools/python/python3/0001-Makefile-do-not-compile-.pyc-in-parallel.patch
> index ea1efa9cac..2f037ecb09 100644
> ---
> a/meta/recipes-devtools/python/python3/0001-Makefile-do-not-compile-.pyc-in-parallel.patch
> +++
> b/meta/recipes-devtools/python/python3/0001-Makefile-do-not-compile-.pyc-in-parallel.patch
> @@ -1,4 +1,4 @@
> -From c501e121a872cbcef8ffe626c1de173a125be9f8 Mon Sep 17 00:00:00 2001
> +From c960837b8fd83074bab5148236f3d0595468cea4 Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Thu, 16 Jan 2020 12:34:20 +0100
>  Subject: [PATCH] Makefile: do not compile .pyc in parallel
> @@ -17,15 +17,16 @@
> https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20211130-yr_o1a8d/pa
>
>  Upstream-Status: Inappropriate [see issues above]
>  Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +
>  ---
>   Makefile.pre.in | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
>
>  diff --git a/Makefile.pre.in b/Makefile.pre.in
> -index 1241112..5dfdf44 100644
> +index edd70d4..5e13ba2 100644
>  --- a/Makefile.pre.in
>  +++ b/Makefile.pre.in
> -@@ -1457,30 +1457,30 @@ libinstall:    build_all
> $(srcdir)/Modules/xxmodule.c
> +@@ -1601,30 +1601,30 @@ libinstall:    build_all
> $(srcdir)/Modules/xxmodule.c
>         fi
>         -PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
>                 $(PYTHON_FOR_BUILD) -Wi $(DESTDIR)$(LIBDEST)/compileall.py
> \
> diff --git
> a/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
> b/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
> index fa7735ff93..e1dabc92a3 100644
> ---
> a/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
> +++
> b/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
> @@ -1,19 +1,20 @@
> -From cf6a9100902484e4d028ee88742dd2487b014a98 Mon Sep 17 00:00:00 2001
> +From 9f85089cc3a21d5ff235bb37c6c9758f2b70497d Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Wed, 30 Jan 2019 12:41:04 +0100
>  Subject: [PATCH] Makefile.pre: use qemu wrapper when gathering profile
> data
>
>  Upstream-Status: Inappropriate [oe-core specific]
>  Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +
>  ---
>   Makefile.pre.in | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
>  diff --git a/Makefile.pre.in b/Makefile.pre.in
> -index a3a02a7..d5503dd 100644
> +index f0aedb7..edd70d4 100644
>  --- a/Makefile.pre.in
>  +++ b/Makefile.pre.in
> -@@ -507,8 +507,7 @@ build_all_generate_profile:
> +@@ -519,8 +519,7 @@ build_all_generate_profile:
>         $(MAKE) @DEF_MAKE_RULE@ CFLAGS_NODIST="$(CFLAGS_NODIST)
> $(PGO_PROF_GEN_FLAG)" LDFLAGS_NODIST="$(LDFLAGS_NODIST)
> $(PGO_PROF_GEN_FLAG)" LIBS="$(LIBS)"
>
>   run_profile_task:
> diff --git
> a/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch
> b/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch
> index a49d603d47..96c5a3c840 100644
> ---
> a/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch
> +++
> b/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch
> @@ -1,9 +1,8 @@
> -From 0b25b66d4f54bd74615c9ff10f3fae8f0d1c548d Mon Sep 17 00:00:00 2001
> +From 7171aeee22a0b7ab57cdf3d1ae15530549f8f92a Mon Sep 17 00:00:00 2001
>  From: Yi Fan Yu <yifan.yu@windriver.com>
>  Date: Thu, 1 Apr 2021 13:08:37 -0700
>  Subject: [PATCH] Skip failing tests due to load variability on YP AB
>
> -
>  Skip these tests until AB-INT is solved.
>
>  [YOCTO #14296]
> @@ -11,16 +10,17 @@ Skip these tests until AB-INT is solved.
>  Upstream-Status: Inappropriate [OE-Specific]
>
>  Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
> +
>  ---
>   Lib/test/_test_multiprocessing.py | 2 ++
>   Lib/test/test_time.py             | 1 +
>   2 files changed, 3 insertions(+)
>
>  diff --git a/Lib/test/_test_multiprocessing.py
> b/Lib/test/_test_multiprocessing.py
> -index fd3b430..cda29f6 100644
> +index 3bc5b8f..a6e106d 100644
>  --- a/Lib/test/_test_multiprocessing.py
>  +++ b/Lib/test/_test_multiprocessing.py
> -@@ -568,6 +568,7 @@ def test_close(self):
> +@@ -568,6 +568,7 @@ class _TestProcess(BaseTestCase):
>
>           close_queue(q)
>
> @@ -28,7 +28,7 @@ index fd3b430..cda29f6 100644
>       def test_many_processes(self):
>           if self.TYPE == 'threads':
>               self.skipTest('test not appropriate for
> {}'.format(self.TYPE))
> -@@ -4715,6 +4716,7 @@ def signal_and_sleep(cls, sem, period):
> +@@ -4817,6 +4818,7 @@ class TestWait(unittest.TestCase):
>           sem.release()
>           time.sleep(period)
>
> @@ -37,10 +37,10 @@ index fd3b430..cda29f6 100644
>           from multiprocessing.connection import wait
>
>  diff --git a/Lib/test/test_time.py b/Lib/test/test_time.py
> -index 3258298..adcf407 100644
> +index 875615a..aebaa8c 100644
>  --- a/Lib/test/test_time.py
>  +++ b/Lib/test/test_time.py
> -@@ -474,6 +474,7 @@ def test_monotonic(self):
> +@@ -474,6 +474,7 @@ class TimeTestCase(unittest.TestCase):
>       def test_perf_counter(self):
>           time.perf_counter()
>
> @@ -48,6 +48,3 @@ index 3258298..adcf407 100644
>       def test_process_time(self):
>           # process_time() should not include time spend during a sleep
>           start = time.process_time()
> ---
> -2.17.1
> -
> diff --git
> a/meta/recipes-devtools/python/python3/0001-Use-FLAG_REF-always-for-interned-strings.patch
> b/meta/recipes-devtools/python/python3/0001-Use-FLAG_REF-always-for-interned-strings.patch
> index 793385de91..993ac243fc 100644
> ---
> a/meta/recipes-devtools/python/python3/0001-Use-FLAG_REF-always-for-interned-strings.patch
> +++
> b/meta/recipes-devtools/python/python3/0001-Use-FLAG_REF-always-for-interned-strings.patch
> @@ -1,4 +1,4 @@
> -From 9f63e83b1cec872917647b11155edaffe399d103 Mon Sep 17 00:00:00 2001
> +From d7217b79a4e125d4fcc1087743171b94d91d1121 Mon Sep 17 00:00:00 2001
>  From: Inada Naoki <songofacandy@gmail.com>
>  Date: Sat, 14 Jul 2018 00:46:11 +0900
>  Subject: [PATCH] Use FLAG_REF always for interned strings
> @@ -11,7 +11,7 @@ Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
>   1 file changed, 7 insertions(+), 2 deletions(-)
>
>  diff --git a/Python/marshal.c b/Python/marshal.c
> -index c4538bd..2437160 100644
> +index 4125240..341c9aa 100644
>  --- a/Python/marshal.c
>  +++ b/Python/marshal.c
>  @@ -298,9 +298,14 @@ w_ref(PyObject *v, char *flag, WFILE *p)
> diff --git
> a/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch
> b/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch
> index c4fae09a5b..fc2241b5b9 100644
> ---
> a/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch
> +++
> b/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch
> @@ -1,7 +1,8 @@
> -From 1ad771d86728ee2ed30e202e9768d8d825f96467 Mon Sep 17 00:00:00 2001
> +From 7cfa712eecf02edaefaf0e51f3c8a31933b88db1 Mon Sep 17 00:00:00 2001
>  From: Matthias Schoepfer <matthias.schoepfer@ithinx.io>
>  Date: Fri, 31 May 2019 15:34:34 +0200
>  Subject: [PATCH] bpo-36852: proper detection of mips architecture for soft
> +
>   float
>
>  When (cross) compiling for softfloat mips, __mips_hard_float will not be
> @@ -13,18 +14,18 @@ to do this in a more autoconf/autotools manner.
>  Upstream-Status: Submitted [https://github.com/python/cpython/pull/13196]
>  Signed-off-by: Matthias Schoepfer <matthias.schoepfer@ithinx.io>
>
> -%% original patch:
> 0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch
> +
>  ---
>   configure.ac | 175 +++++++--------------------------------------------
>   1 file changed, 21 insertions(+), 154 deletions(-)
>
>  diff --git a/configure.ac b/configure.ac
> -index ede710e..bc81b0b 100644
> +index 299786b..d0db062 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -710,160 +710,27 @@ fi
> - MULTIARCH=$($CC --print-multiarch 2>/dev/null)
> - AC_SUBST(MULTIARCH)
> +@@ -718,160 +718,27 @@ then
> + fi
> +
>
>  -AC_MSG_CHECKING([for the platform triplet based on compiler
> characteristics])
>  -cat >> conftest.c <<EOF
> @@ -202,8 +203,5 @@ index ede710e..bc81b0b 100644
>  +      ;;
>  +esac
>
> - if test x$PLATFORM_TRIPLET != x && test x$MULTIARCH != x; then
> -   if test x$PLATFORM_TRIPLET != x$MULTIARCH; then
> ---
> -2.24.1
> -
> + if test x$PLATFORM_TRIPLET != xdarwin; then
> +   MULTIARCH=$($CC --print-multiarch 2>/dev/null)
> diff --git
> a/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
> b/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
> index b323ed4dd0..1a1e3e960c 100644
> ---
> a/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
> +++
> b/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
> @@ -1,4 +1,4 @@
> -From 3a98c2eab187289dc8c55e36738c2c0f4216d906 Mon Sep 17 00:00:00 2001
> +From 8a91a3047222ac533c2ca00b6d27cf6f992e6b11 Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Thu, 31 Jan 2019 16:46:30 +0100
>  Subject: [PATCH] distutils/sysconfig: append
> @@ -14,7 +14,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com
> >
>   1 file changed, 2 insertions(+)
>
>  diff --git a/Lib/sysconfig.py b/Lib/sysconfig.py
> -index a78c0b1..f5c5efe 100644
> +index 40c6b3e..ac94cc7 100644
>  --- a/Lib/sysconfig.py
>  +++ b/Lib/sysconfig.py
>  @@ -474,6 +474,8 @@ def _init_posix(vars):
> diff --git
> a/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
> b/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
> index bfddc1ad52..6bb85fcb34 100644
> ---
> a/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
> +++
> b/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
> @@ -1,4 +1,4 @@
> -From 5f9eea2c4f8716830f6c8855a3e10872119fae32 Mon Sep 17 00:00:00 2001
> +From 9f68a27eb34394a00f1011c06900c609f15fb15c Mon Sep 17 00:00:00 2001
>  From: Changqing Li <changqing.li@windriver.com>
>  Date: Mon, 22 Oct 2018 15:19:51 +0800
>  Subject: [PATCH] python3: use cc_basename to replace CC for checking
> compiler
> @@ -27,10 +27,10 @@ Signed-off-by: Changqing Li <
> changqing.li@windriver.com>
>   1 file changed, 10 insertions(+), 9 deletions(-)
>
>  diff --git a/configure.ac b/configure.ac
> -index d60f052..e491e24 100644
> +index 0c06914..299786b 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -54,6 +54,7 @@ AC_CONFIG_HEADER(pyconfig.h)
> +@@ -61,6 +61,7 @@ AC_CONFIG_HEADER(pyconfig.h)
>   AC_CANONICAL_HOST
>   AC_SUBST(build)
>   AC_SUBST(host)
> @@ -38,7 +38,7 @@ index d60f052..e491e24 100644
>
>   # pybuilddir.txt will be created by --generate-posix-vars in the Makefile
>   rm -f pybuilddir.txt
> -@@ -689,7 +690,7 @@ AC_MSG_RESULT($with_cxx_main)
> +@@ -688,7 +689,7 @@ AC_MSG_RESULT($with_cxx_main)
>   preset_cxx="$CXX"
>   if test -z "$CXX"
>   then
> @@ -47,7 +47,7 @@ index d60f052..e491e24 100644
>           gcc)    AC_PATH_TOOL(CXX, [g++], [g++], [notfound]) ;;
>           cc)     AC_PATH_TOOL(CXX, [c++], [c++], [notfound]) ;;
>           clang|*/clang)     AC_PATH_TOOL(CXX, [clang++], [clang++],
> [notfound]) ;;
> -@@ -975,7 +976,7 @@ rmdir CaseSensitiveTestDir
> +@@ -976,7 +977,7 @@ rmdir CaseSensitiveTestDir
>
>   case $ac_sys_system in
>   hp*|HP*)
> @@ -56,7 +56,7 @@ index d60f052..e491e24 100644
>       cc|*/cc) CC="$CC -Ae";;
>       esac;;
>   esac
> -@@ -1366,7 +1367,7 @@ else
> +@@ -1374,7 +1375,7 @@ else
>   fi],
>   [AC_MSG_RESULT(no)])
>   if test "$Py_LTO" = 'true' ; then
> @@ -65,7 +65,7 @@ index d60f052..e491e24 100644
>       *clang*)
>         AC_SUBST(LLVM_AR)
>         AC_PATH_TOOL(LLVM_AR, llvm-ar, '', ${llvm_path})
> -@@ -1456,7 +1457,7 @@ then
> +@@ -1467,7 +1468,7 @@ then
>     fi
>   fi
>   LLVM_PROF_ERR=no
> @@ -74,7 +74,7 @@ index d60f052..e491e24 100644
>     *clang*)
>       # Any changes made here should be reflected in the GCC+Darwin case
> below
>       PGO_PROF_GEN_FLAG="-fprofile-instr-generate"
> -@@ -1517,7 +1518,7 @@ esac
> +@@ -1528,7 +1529,7 @@ esac
>   # compiler and platform.  BASECFLAGS tweaks need to be made even if the
>   # user set OPT.
>
> @@ -83,7 +83,7 @@ index d60f052..e491e24 100644
>       *clang*)
>           cc_is_clang=1
>           ;;
> -@@ -1653,7 +1654,7 @@ yes)
> +@@ -1664,7 +1665,7 @@ yes)
>
>       # ICC doesn't recognize the option, but only emits a warning
>       ## XXX does it emit an unused result warning and can it be disabled?
> @@ -92,7 +92,7 @@ index d60f052..e491e24 100644
>       *icc*)
>       ac_cv_disable_unused_result_warning=no
>       ;;
> -@@ -1993,7 +1994,7 @@ yes)
> +@@ -2018,7 +2019,7 @@ yes)
>       ;;
>   esac
>
> @@ -101,7 +101,7 @@ index d60f052..e491e24 100644
>   *icc*)
>       # ICC needs -fp-model strict or floats behave badly
>       CFLAGS_NODIST="$CFLAGS_NODIST -fp-model strict"
> -@@ -2765,7 +2766,7 @@ then
> +@@ -2836,7 +2837,7 @@ then
>                 then
>                         LINKFORSHARED="-Wl,--export-dynamic"
>                 fi;;
> @@ -110,7 +110,7 @@ index d60f052..e491e24 100644
>                   *gcc*)
>                     if $CC -Xlinker --help 2>&1 | grep export-dynamic
> >/dev/null
>                     then
> -@@ -5507,7 +5508,7 @@ if test "$have_gcc_asm_for_x87" = yes; then
> +@@ -5622,7 +5623,7 @@ if test "$have_gcc_asm_for_x87" = yes; then
>       # Some versions of gcc miscompile inline asm:
>       # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=46491
>       # http://gcc.gnu.org/ml/gcc/2010-11/msg00366.html
> diff --git
> a/meta/recipes-devtools/python/python3/0001-sysconfig.py-use-platlibdir-also-for-purelib.patch
> b/meta/recipes-devtools/python/python3/0001-sysconfig.py-use-platlibdir-also-for-purelib.patch
> index 2b5a7d308c..4fb63a9b7a 100644
> ---
> a/meta/recipes-devtools/python/python3/0001-sysconfig.py-use-platlibdir-also-for-purelib.patch
> +++
> b/meta/recipes-devtools/python/python3/0001-sysconfig.py-use-platlibdir-also-for-purelib.patch
> @@ -1,4 +1,4 @@
> -From 93346d1a2f5d4f7085391bc7c1230d85ebe00606 Mon Sep 17 00:00:00 2001
> +From 9162460d81ccc725fb04a14b27d0bf4afcfb69c9 Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex@linutronix.de>
>  Date: Sun, 12 Sep 2021 21:44:36 +0200
>  Subject: [PATCH] sysconfig.py: use platlibdir also for purelib
> @@ -8,12 +8,13 @@ is not correct.
>
>  Upstream-Status: Inappropriate [oe-core specific]
>  Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> +
>  ---
>   Lib/sysconfig.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/Lib/sysconfig.py b/Lib/sysconfig.py
> -index b70d392..c418acd 100644
> +index daf9f00..e64bcdc 100644
>  --- a/Lib/sysconfig.py
>  +++ b/Lib/sysconfig.py
>  @@ -27,7 +27,7 @@ _INSTALL_SCHEMES = {
> @@ -25,6 +26,3 @@ index b70d392..c418acd 100644
>           'platlib':
> '{platbase}/{platlibdir}/python{py_version_short}/site-packages',
>           'include':
>
> '{installed_base}/include/python{py_version_short}{abiflags}',
> ---
> -2.20.1
> -
> diff --git
> a/meta/recipes-devtools/python/python3/0001-test_ctypes.test_find-skip-without-tools-sdk.patch
> b/meta/recipes-devtools/python/python3/0001-test_ctypes.test_find-skip-without-tools-sdk.patch
> index 7d684b3c43..371021c0a9 100644
> ---
> a/meta/recipes-devtools/python/python3/0001-test_ctypes.test_find-skip-without-tools-sdk.patch
> +++
> b/meta/recipes-devtools/python/python3/0001-test_ctypes.test_find-skip-without-tools-sdk.patch
> @@ -1,4 +1,4 @@
> -From 7a2bddfa437be633bb6945d0e6b7d6f27da870ad Mon Sep 17 00:00:00 2001
> +From 13aa6449c47980c7270dad2527c3911517bf34e6 Mon Sep 17 00:00:00 2001
>  From: Tim Orling <timothy.t.orling@intel.com>
>  Date: Fri, 18 Jun 2021 11:56:50 -0700
>  Subject: [PATCH] test_ctypes.test_find: skip without tools-sdk
> @@ -10,15 +10,16 @@ easiest way to dynamically check for that is looking
> for
>  Upstream-Status: Inappropriate [oe-specific]
>
>  Signed-off-by: Tim Orling <timothy.t.orlign@intel.com>
> +
>  ---
>   Lib/ctypes/test/test_find.py | 2 ++
>   1 file changed, 2 insertions(+)
>
>  diff --git a/Lib/ctypes/test/test_find.py b/Lib/ctypes/test/test_find.py
> -index 92ac184..0d009d1 100644
> +index 1ff9d01..59def26 100644
>  --- a/Lib/ctypes/test/test_find.py
>  +++ b/Lib/ctypes/test/test_find.py
> -@@ -112,10 +112,12 @@ class FindLibraryLinux(unittest.TestCase):
> +@@ -113,10 +113,12 @@ class FindLibraryLinux(unittest.TestCase):
>                   # LD_LIBRARY_PATH)
>                   self.assertEqual(find_library(libname), 'lib%s.so' %
> libname)
>
> diff --git
> a/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch
> b/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch
> index c3d1e06d00..c762f98307 100644
> ---
> a/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch
> +++
> b/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch
> @@ -1,4 +1,4 @@
> -From b94995e0c694ec9561efec0d1a59b323340e6105 Mon Sep 17 00:00:00 2001
> +From 46856e692377d21be3562f6f90c242f5c9594ae2 Mon Sep 17 00:00:00 2001
>  From: Mingli Yu <mingli.yu@windriver.com>
>  Date: Mon, 5 Aug 2019 15:57:39 +0800
>  Subject: [PATCH] test_locale.py: correct the test output format
> @@ -23,19 +23,19 @@ Before this patch:
>
>  Upstream-Status: Submitted [https://github.com/python/cpython/pull/15132]
>
> -
>  Rebased for 3.9.4, still not accepted upstream Signed-off-by: Alejandro
> Hernandez <alejandro@enedino.org>
>
>  Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> +
>  ---
>   Lib/test/test_locale.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> -Index: Python-3.9.4/Lib/test/test_locale.py
> -===================================================================
> ---- Python-3.9.4.orig/Lib/test/test_locale.py
> -+++ Python-3.9.4/Lib/test/test_locale.py
> -@@ -562,7 +562,7 @@ class TestMiscellaneous(unittest.TestCas
> +diff --git a/Lib/test/test_locale.py b/Lib/test/test_locale.py
> +index f844e62..04df0c2 100644
> +--- a/Lib/test/test_locale.py
> ++++ b/Lib/test/test_locale.py
> +@@ -564,7 +564,7 @@ class TestMiscellaneous(unittest.TestCase):
>               self.skipTest('test needs Turkish locale')
>           loc = locale.getlocale(locale.LC_CTYPE)
>           if verbose:
> diff --git
> a/meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-missing-dependencies-for-disa.patch
> b/meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-missing-dependencies-for-disa.patch
> index 5823273af3..0ead57e465 100644
> ---
> a/meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-missing-dependencies-for-disa.patch
> +++
> b/meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-missing-dependencies-for-disa.patch
> @@ -1,4 +1,4 @@
> -From a2dd127b4163aff6cc35af0d0251321964232ad4 Mon Sep 17 00:00:00 2001
> +From 246c5ffe75a2d494e415d8a7522df9fe22056d41 Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Mon, 7 Oct 2019 13:22:14 +0200
>  Subject: [PATCH] setup.py: do not report missing dependencies for disabled
> @@ -14,14 +14,14 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>  Signed-off-by: Alejandro Hernandez Samaniego <alejandro@enedino.org>
>
>  ---
> - setup.py | 4 ++++
> - 1 file changed, 4 insertions(+)
> + setup.py | 8 ++++++++
> + 1 file changed, 8 insertions(+)
>
>  diff --git a/setup.py b/setup.py
> -index 7691258..ec3f2a4 100644
> +index 2be4738..62f0e18 100644
>  --- a/setup.py
>  +++ b/setup.py
> -@@ -408,6 +408,14 @@ class PyBuildExt(build_ext):
> +@@ -517,6 +517,14 @@ class PyBuildExt(build_ext):
>                   print("%-*s   %-*s   %-*s" % (longest, e, longest, f,
>                                                 longest, g))
>
> diff --git
> a/meta/recipes-devtools/python/python3/0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch
> b/meta/recipes-devtools/python/python3/0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch
> index e04a91605c..30d2906439 100644
> ---
> a/meta/recipes-devtools/python/python3/0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch
> +++
> b/meta/recipes-devtools/python/python3/0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch
> @@ -1,4 +1,4 @@
> -From 863c09f640a5dfd33ff22915b0d5fee7bc5df70a Mon Sep 17 00:00:00 2001
> +From 788cd0464ee2b175493a0167ceee8c0045ce323c Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Sun, 16 Feb 2020 17:50:25 +0100
>  Subject: [PATCH] configure.ac, setup.py: do not add a curses include
> path from
> @@ -11,16 +11,17 @@ as dnf failures).
>
>  Upstream-Status: Inappropriate [oe-core specific]
>  Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +
>  ---
>   configure.ac | 6 ------
>   setup.py     | 2 --
>   2 files changed, 8 deletions(-)
>
>  diff --git a/configure.ac b/configure.ac
> -index 915f475..c911011 100644
> +index e5e3df8..bfdd987 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -4828,12 +4828,6 @@ then
> +@@ -5092,12 +5092,6 @@ then
>     [Define if you have struct stat.st_mtimensec])
>   fi
>
> @@ -34,10 +35,10 @@ index 915f475..c911011 100644
>
>   # On Solaris, term.h requires curses.h
>  diff --git a/setup.py b/setup.py
> -index b0f1541..7208cd0 100644
> +index 62f0e18..c190002 100644
>  --- a/setup.py
>  +++ b/setup.py
> -@@ -973,8 +973,6 @@ class PyBuildExt(build_ext):
> +@@ -1169,8 +1169,6 @@ class PyBuildExt(build_ext):
>           panel_library = 'panel'
>           if curses_library == 'ncursesw':
>               curses_defines.append(('HAVE_NCURSESW', '1'))
> diff --git
> a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
> b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
> index cc64e3ecf7..bb2984cc71 100644
> ---
> a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
> +++
> b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
> @@ -1,4 +1,4 @@
> -From f6411021856bafedd784748ec33494151e783b51 Mon Sep 17 00:00:00 2001
> +From 99cfdb5f3debd38f50b73a7713161f8b56ce842e Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Tue, 14 May 2013 15:00:26 -0700
>  Subject: [PATCH] python3: Add target and native recipes
> @@ -12,6 +12,7 @@ Signed-Off: Michael 'Mickey' Lauer <
> mickey@vanille-media.de>
>  Signed-off-by: Phil Blundell <philb@gnu.org>
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
> +
>  ---
>   Lib/distutils/sysconfig.py | 14 +++++++++++---
>   1 file changed, 11 insertions(+), 3 deletions(-)
> @@ -55,6 +56,3 @@ index 3414a76..361d3a1 100644
>                                    "python" + get_python_version())
>           if standard_lib:
>               return libpython
> ---
> -2.20.1
> -
> diff --git
> a/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patch
> b/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patch
> index 184540e794..2de72b7199 100644
> ---
> a/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patch
> +++
> b/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patch
> @@ -1,4 +1,4 @@
> -From ba7202700578d435b07cfdfb7b57e83185752800 Mon Sep 17 00:00:00 2001
> +From 6a23d52c905cd1f6a5944255903ec86ea8b904bb Mon Sep 17 00:00:00 2001
>  From: Andrei Gherzan <andrei@gherzan.ro>
>  Date: Mon, 28 Jan 2019 15:57:54 +0000
>  Subject: [PATCH] _tkinter module needs tk module along with tcl. tk is
> not yet
> @@ -15,10 +15,10 @@ Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
>  diff --git a/setup.py b/setup.py
> -index ab18ff0..7691258 100644
> +index 11b5cf5..2be4738 100644
>  --- a/setup.py
>  +++ b/setup.py
> -@@ -1706,8 +1706,8 @@ class PyBuildExt(build_ext):
> +@@ -1895,8 +1895,8 @@ class PyBuildExt(build_ext):
>           self.detect_decimal()
>           self.detect_ctypes()
>           self.detect_multiprocessing()
> diff --git a/meta/recipes-devtools/python/python3/cgi_py.patch
> b/meta/recipes-devtools/python/python3/cgi_py.patch
> index 6c4ba54320..81e6099cfb 100644
> --- a/meta/recipes-devtools/python/python3/cgi_py.patch
> +++ b/meta/recipes-devtools/python/python3/cgi_py.patch
> @@ -1,4 +1,4 @@
> -From 62336285cba38017b35cb761c03f0c7e80a671a3 Mon Sep 17 00:00:00 2001
> +From 5b0d1212d661e9a8a36738279fc9109f96eebd25 Mon Sep 17 00:00:00 2001
>  From: Mark Hatle <mark.hatle@windriver.com>
>  Date: Wed, 21 Sep 2011 20:55:33 -0500
>  Subject: [PATCH] Lib/cgi.py: Update the script as mentioned in the comment
> @@ -12,7 +12,7 @@ Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>   1 file changed, 1 insertion(+), 10 deletions(-)
>
>  diff --git a/Lib/cgi.py b/Lib/cgi.py
> -index 8cf6687..094c7b4 100755
> +index 6cb8cf2..a873ff3 100755
>  --- a/Lib/cgi.py
>  +++ b/Lib/cgi.py
>  @@ -1,13 +1,4 @@
> diff --git a/meta/recipes-devtools/python/python3/crosspythonpath.patch
> b/meta/recipes-devtools/python/python3/crosspythonpath.patch
> index d789ab57d4..5bb25264da 100644
> --- a/meta/recipes-devtools/python/python3/crosspythonpath.patch
> +++ b/meta/recipes-devtools/python/python3/crosspythonpath.patch
> @@ -1,4 +1,8 @@
> -configure.ac: add CROSSPYTHONPATH into PYTHONPATH for PYTHON_FOR_BUILD
> +From baa3a232e64e9bf5ae945366efdb8088ccf9b828 Mon Sep 17 00:00:00 2001
> +From: Ricardo Ribalda <ricardo@ribalda.com>
> +Date: Tue, 18 Nov 2014 03:35:33 -0500
> +Subject: [PATCH] configure.ac: add CROSSPYTHONPATH into PYTHONPATH for
> + PYTHON_FOR_BUILD
>
>  When building x86->x86 the system will try to execute .so and related
> items
>  from the default PYTHONPATH.  This will fail if the target CPU contains
> @@ -10,11 +14,16 @@ Upstream-Status: Inappropriate [OE-Core integration
> specific]
>  Credits-to: Mark Hatle <mark.hatle@windriver.com>
>  Credits-to: Jackie Huang <jackie.huang@windriver.com>
>  Signed-off-by: Ricardo Ribalda <ricardo@ribalda.com>
> +
> +---
> + configure.ac | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
>  diff --git a/configure.ac b/configure.ac
> -index 4ab19a6..7036a53 100644
> +index d0db062..e5e3df8 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -76,7 +76,7 @@ if test "$cross_compiling" = yes; then
> +@@ -83,7 +83,7 @@ if test "$cross_compiling" = yes; then
>             AC_MSG_ERROR([python$PACKAGE_VERSION interpreter not found])
>         fi
>           AC_MSG_RESULT($interp)
> diff --git a/meta/recipes-devtools/python/python3/makerace.patch
> b/meta/recipes-devtools/python/python3/makerace.patch
> index b150c1cb38..2c06784ffc 100644
> --- a/meta/recipes-devtools/python/python3/makerace.patch
> +++ b/meta/recipes-devtools/python/python3/makerace.patch
> @@ -1,4 +1,4 @@
> -From 8b8583fb4f2bb3421e31ef06d17c04deec431c7e Mon Sep 17 00:00:00 2001
> +From 7cc02dfa593d1350a689d64a7a6f2dc6478afe24 Mon Sep 17 00:00:00 2001
>  From: Richard Purdie <richard.purdie@linuxfoundation.org>
>  Date: Tue, 13 Jul 2021 23:19:29 +0100
>  Subject: [PATCH] python3: Fix make race
> @@ -18,10 +18,10 @@ Signed-off-by: Richard Purdie <
> richard.purdie@linuxfoundation.org>
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/Makefile.pre.in b/Makefile.pre.in
> -index 69d47a2..c471b60 100644
> +index 5e13ba2..026bffd 100644
>  --- a/Makefile.pre.in
>  +++ b/Makefile.pre.in
> -@@ -1528,7 +1528,7 @@ TESTSUBDIRS=     ctypes/test \
> +@@ -1527,7 +1527,7 @@ TESTSUBDIRS=     ctypes/test \
>                 unittest/test unittest/test/testmock
>
>   TEST_MODULES=@TEST_MODULES@
> diff --git a/meta/recipes-devtools/python/python3/python-config.patch
> b/meta/recipes-devtools/python/python3/python-config.patch
> index c53f646af3..4da399e46e 100644
> --- a/meta/recipes-devtools/python/python3/python-config.patch
> +++ b/meta/recipes-devtools/python/python3/python-config.patch
> @@ -1,4 +1,4 @@
> -From 57d073c12e7bede29919117b0141df14015eb27f Mon Sep 17 00:00:00 2001
> +From 8632f25ac4e2c53a3c2c8a1b4fc97fc86e8aad5a Mon Sep 17 00:00:00 2001
>  From: Tyler Hall <tylerwhall@gmail.com>
>  Date: Sun, 4 May 2014 20:06:43 -0400
>  Subject: [PATCH] python-config: Revert to using distutils.sysconfig
> @@ -16,11 +16,11 @@ Upstream-Status: Inappropriate [Embedded Specific]
>  Signed-off-by: Tyler Hall <tylerwhall@gmail.com>
>
>  ---
> - Misc/python-config.in | 10 +++++-----
> - 1 file changed, 5 insertions(+), 5 deletions(-)
> + Misc/python-config.in | 12 +++++++-----
> + 1 file changed, 7 insertions(+), 5 deletions(-)
>
>  diff --git a/Misc/python-config.in b/Misc/python-config.in
> -index ebd99da..13e57ae 100644
> +index ebd99da..0492e08 100644
>  --- a/Misc/python-config.in
>  +++ b/Misc/python-config.in
>  @@ -6,7 +6,9 @@
> @@ -34,7 +34,7 @@ index ebd99da..13e57ae 100644
>
>   valid_opts = ['prefix', 'exec-prefix', 'includes', 'libs', 'cflags',
>                 'ldflags', 'extension-suffix', 'help', 'abiflags',
> 'configdir',
> -@@ -35,14 +35,14 @@ if '--help' in opt_flags:
> +@@ -35,14 +37,14 @@ if '--help' in opt_flags:
>
>   for opt in opt_flags:
>       if opt == '--prefix':
> diff --git a/meta/recipes-devtools/python/python3_3.10.0.bb
> b/meta/recipes-devtools/python/python3_3.10.1.bb
> similarity index 99%
> rename from meta/recipes-devtools/python/python3_3.10.0.bb
> rename to meta/recipes-devtools/python/python3_3.10.1.bb
> index 24e6c04fe9..a51fc8f415 100644
> --- a/meta/recipes-devtools/python/python3_3.10.0.bb
> +++ b/meta/recipes-devtools/python/python3_3.10.1.bb
> @@ -40,7 +40,7 @@ SRC_URI:append:class-native = " \
>             file://12-distutils-prefix-is-inside-staging-area.patch \
>             file://0001-Don-t-search-system-for-headers-libraries.patch \
>             "
> -SRC_URI[sha256sum] =
> "5a99f8e7a6a11a7b98b4e75e0d1303d3832cada5534068f69c7b6222a7b1b002"
> +SRC_URI[sha256sum] =
> "a7f1265b6e1a5de1ec5c3ec7019ab53413469934758311e9d240c46e5ae6e177"
>
>  # exclude pre-releases for both python 2.x and 3.x
>  UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#94243):
> https://lists.openembedded.org/g/openembedded-devel/message/94243
> Mute This Topic: https://lists.openembedded.org/mt/87580545/1686489
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000f9894a05d29c440d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Wrong mailing list :)</div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">Alex</div><div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Wed 8. Dec 2021 at 3.14, Oleksandr Kravchuk &lt=
;<a href=3D"mailto:open.source@oleksandr-kravchuk.com">open.source@oleksand=
r-kravchuk.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:sol=
id;padding-left:1ex;border-left-color:rgb(204,204,204)">Refreshed patches.<=
br>
<br>
Signed-off-by: Oleksandr Kravchuk &lt;<a href=3D"mailto:open.source@oleksan=
dr-kravchuk.com" target=3D"_blank">open.source@oleksandr-kravchuk.com</a>&g=
t;<br>
---<br>
=C2=A0...ib-termcap-to-linker-flags-to-avoid-.patch |=C2=A0 6 ++---<br>
=C2=A0...hell-version-of-python-config-that-w.patch |=C2=A0 7 +++---<br>
=C2=A0...-search-system-for-headers-libraries.patch |=C2=A0 6 ++---<br>
=C2=A0...e-stdin-I-O-errors-same-way-as-maste.patch |=C2=A0 8 +++----<br>
=C2=A0...-use-prefix-value-from-build-configu.patch |=C2=A0 8 +++----<br>
=C2=A0...file-do-not-compile-.pyc-in-parallel.patch |=C2=A0 7 +++---<br>
=C2=A0...-qemu-wrapper-when-gathering-profile.patch |=C2=A0 7 +++---<br>
=C2=A0...sts-due-to-load-variability-on-YP-AB.patch | 17 ++++++-------<br>
=C2=A0...FLAG_REF-always-for-interned-strings.patch |=C2=A0 4 ++--<br>
=C2=A0...-detection-of-mips-architecture-for-.patch | 20 +++++++---------<b=
r>
=C2=A0...fig-append-STAGING_LIBDIR-python-sys.patch |=C2=A0 4 ++--<br>
=C2=A0...asename-to-replace-CC-for-checking-c.patch | 24 +++++++++---------=
-<br>
=C2=A0...g.py-use-platlibdir-also-for-purelib.patch |=C2=A0 8 +++----<br>
=C2=A0...pes.test_find-skip-without-tools-sdk.patch |=C2=A0 7 +++---<br>
=C2=A0...le.py-correct-the-test-output-format.patch | 14 +++++------<br>
=C2=A0...report-missing-dependencies-for-disa.patch | 10 ++++----<br>
=C2=A0...up.py-do-not-add-a-curses-include-pa.patch | 11 +++++----<br>
=C2=A0...tutils-prefix-is-inside-staging-area.patch |=C2=A0 6 ++---<br>
=C2=A0.../python3/avoid_warning_about_tkinter.patch |=C2=A0 6 ++---<br>
=C2=A0.../python/python3/cgi_py.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 4 ++--<br>
=C2=A0.../python/python3/crosspythonpath.patch=C2=A0 =C2=A0 =C2=A0 | 15 +++=
++++++---<br>
=C2=A0.../python/python3/makerace.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 6 ++---<br>
=C2=A0.../python/python3/python-config.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1=
0 ++++----<br>
=C2=A0.../{<a href=3D"http://python3_3.10.0.bb" rel=3D"noreferrer" target=
=3D"_blank">python3_3.10.0.bb</a> =3D&gt; <a href=3D"http://python3_3.10.1.=
bb" rel=3D"noreferrer" target=3D"_blank">python3_3.10.1.bb</a>}=C2=A0 |=C2=
=A0 2 +-<br>
=C2=A024 files changed, 109 insertions(+), 108 deletions(-)<br>
=C2=A0rename meta/recipes-devtools/python/{<a href=3D"http://python3_3.10.0=
.bb" rel=3D"noreferrer" target=3D"_blank">python3_3.10.0.bb</a> =3D&gt; <a =
href=3D"http://python3_3.10.1.bb" rel=3D"noreferrer" target=3D"_blank">pyth=
on3_3.10.1.bb</a>} (99%)<br>
<br>
diff --git a/meta/recipes-devtools/python/python3/0001-Do-not-add-usr-lib-t=
ermcap-to-linker-flags-to-avoid-.patch b/meta/recipes-devtools/python/pytho=
n3/0001-Do-not-add-usr-lib-termcap-to-linker-flags-to-avoid-.patch<br>
index 59592821d7..62ef6efc28 100644<br>
--- a/meta/recipes-devtools/python/python3/0001-Do-not-add-usr-lib-termcap-=
to-linker-flags-to-avoid-.patch<br>
+++ b/meta/recipes-devtools/python/python3/0001-Do-not-add-usr-lib-termcap-=
to-linker-flags-to-avoid-.patch<br>
@@ -1,4 +1,4 @@<br>
-From 039c53dd5baddec3359a05be0bff46a3b32bbb84 Mon Sep 17 00:00:00 2001<br>
+From 80f872e4573f542d33f91514538755557d566f79 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com"=
 target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
=C2=A0Date: Fri, 25 Jan 2019 19:04:13 +0100<br>
=C2=A0Subject: [PATCH] Do not add /usr/lib/termcap to linker flags to avoid=
 host<br>
@@ -12,10 +12,10 @@ Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:=
alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br=
>
=C2=A0 1 file changed, 1 deletion(-)<br>
<br>
=C2=A0diff --git a/setup.py b/setup.py<br>
-index 20d7f35..ab18ff0 100644<br>
+index 43e807f..11b5cf5 100644<br>
=C2=A0--- a/setup.py<br>
=C2=A0+++ b/setup.py<br>
-@@ -957,7 +957,6 @@ class PyBuildExt(build_ext):<br>
+@@ -1149,7 +1149,6 @@ class PyBuildExt(build_ext):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;termcap&#39;):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 readline_lib=
s.append(&#39;termcap&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.add(Extension(&#39;re=
adline&#39;, [&#39;readline.c&#39;],<br>
diff --git a/meta/recipes-devtools/python/python3/0001-Do-not-use-the-shell=
-version-of-python-config-that-w.patch b/meta/recipes-devtools/python/pytho=
n3/0001-Do-not-use-the-shell-version-of-python-config-that-w.patch<br>
index 83fd52d87f..d98f243cb1 100644<br>
--- a/meta/recipes-devtools/python/python3/0001-Do-not-use-the-shell-versio=
n-of-python-config-that-w.patch<br>
+++ b/meta/recipes-devtools/python/python3/0001-Do-not-use-the-shell-versio=
n-of-python-config-that-w.patch<br>
@@ -1,4 +1,4 @@<br>
-From 148861fa16f2aaacd518770f337ea54b5182f981 Mon Sep 17 00:00:00 2001<br>
+From 2406432449784243b7590009d42bd0e871253b2e Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com"=
 target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
=C2=A0Date: Tue, 29 Jan 2019 15:03:01 +0100<br>
=C2=A0Subject: [PATCH] Do not use the shell version of python-config that w=
as<br>
@@ -9,15 +9,16 @@ outputs directories correctly.<br>
<br>
=C2=A0Upstream-Status: Inappropriate [oe-specific]<br>
=C2=A0Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@g=
mail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
+<br>
=C2=A0---<br>
=C2=A0 <a href=3D"http://Makefile.pre.in" rel=3D"noreferrer" target=3D"_bla=
nk">Makefile.pre.in</a> | 9 +++------<br>
=C2=A0 1 file changed, 3 insertions(+), 6 deletions(-)<br>
<br>
=C2=A0diff --git a/<a href=3D"http://Makefile.pre.in" rel=3D"noreferrer" ta=
rget=3D"_blank">Makefile.pre.in</a> b/<a href=3D"http://Makefile.pre.in" re=
l=3D"noreferrer" target=3D"_blank">Makefile.pre.in</a><br>
-index 2d2e11f..cc19942 100644<br>
+index ee85f35..f0aedb7 100644<br>
=C2=A0--- a/<a href=3D"http://Makefile.pre.in" rel=3D"noreferrer" target=3D=
"_blank">Makefile.pre.in</a><br>
=C2=A0+++ b/<a href=3D"http://Makefile.pre.in" rel=3D"noreferrer" target=3D=
"_blank">Makefile.pre.in</a><br>
-@@ -1431,12 +1431,9 @@ python-config: $(srcdir)/Misc/<a href=3D"http://pyt=
hon-config.in" rel=3D"noreferrer" target=3D"_blank">python-config.in</a> Mi=
sc/python-config.sh<br>
+@@ -1640,12 +1640,9 @@ python-config: $(srcdir)/Misc/<a href=3D"http://pyt=
hon-config.in" rel=3D"noreferrer" target=3D"_blank">python-config.in</a> Mi=
sc/python-config.sh<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -e &quot;s,@EXENAME@,$(BINDIR)/python$(LDVE=
RSION)$(EXE),&quot; &lt; $(srcdir)/Misc/<a href=3D"http://python-config.in"=
 rel=3D"noreferrer" target=3D"_blank">python-config.in</a> &gt;python-confi=
g.py<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 @ # Replace makefile compat. variable reference=
s with shell script compat. ones; $(VAR) -&gt; ${VAR}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 LC_ALL=3DC sed -e &#39;s,\$$(\([A-Za-z0-9_]*\))=
,\$$\{\1\},g&#39; &lt; Misc/python-config.sh &gt;python-config<br>
diff --git a/meta/recipes-devtools/python/python3/0001-Don-t-search-system-=
for-headers-libraries.patch b/meta/recipes-devtools/python/python3/0001-Don=
-t-search-system-for-headers-libraries.patch<br>
index 46179ba1d1..27a5992880 100644<br>
--- a/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-hea=
ders-libraries.patch<br>
+++ b/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-hea=
ders-libraries.patch<br>
@@ -1,4 +1,4 @@<br>
-From cebb772d718a8f798ed5ae311a6e3e61534bea95 Mon Sep 17 00:00:00 2001<br>
+From df1a5e4bc6c8523eaa33daa2a90707fe6c6bddb6 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Jeremy Puhlman &lt;<a href=3D"mailto:jpuhlman@mvista.com" targe=
t=3D"_blank">jpuhlman@mvista.com</a>&gt;<br>
=C2=A0Date: Wed, 4 Mar 2020 00:06:42 +0000<br>
=C2=A0Subject: [PATCH] Don&#39;t search system for headers/libraries<br>
@@ -11,10 +11,10 @@ Signed-off-by: Jeremy Puhlman &lt;<a href=3D"mailto:jpu=
hlman@mvista.com" target=3D"_blank">jpuhlman@mvista.com</a>&gt;<br>
=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
=C2=A0diff --git a/setup.py b/setup.py<br>
-index 95e3e11..32a4d42 100644<br>
+index c190002..5ef368d 100644<br>
=C2=A0--- a/setup.py<br>
=C2=A0+++ b/setup.py<br>
-@@ -840,8 +840,8 @@ class PyBuildExt(build_ext):<br>
+@@ -854,8 +854,8 @@ class PyBuildExt(build_ext):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 add_dir_to_list(self.compi=
ler.include_dirs,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sysconfig.get_config_var(&quot;INCLUDEDIR&q=
uot;))<br>
<br>
diff --git a/meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-st=
din-I-O-errors-same-way-as-maste.patch b/meta/recipes-devtools/python/pytho=
n3/0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch<br>
index d6aa9501a7..df5179e877 100644<br>
--- a/meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-stdin-I-O=
-errors-same-way-as-maste.patch<br>
+++ b/meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-stdin-I-O=
-errors-same-way-as-maste.patch<br>
@@ -1,4 +1,4 @@<br>
-From d8521ee967937184eadc59fff1a30740ad181a98 Mon Sep 17 00:00:00 2001<br>
+From 86061629f4a179e740a17e53dd2c98ab47af2fe2 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de" tar=
get=3D"_blank">alex@linutronix.de</a>&gt;<br>
=C2=A0Date: Thu, 16 Sep 2021 16:35:37 +0200<br>
=C2=A0Subject: [PATCH] Lib/pty.py: handle stdin I/O errors same way as mast=
er I/O<br>
@@ -24,12 +24,13 @@ So let&#39;s treat both channels the same.<br>
<br>
=C2=A0Upstream-Status: Submitted [<a href=3D"https://github.com/python/cpyt=
hon/pull/28388" rel=3D"noreferrer" target=3D"_blank">https://github.com/pyt=
hon/cpython/pull/28388</a>]<br>
=C2=A0Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutroni=
x.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
+<br>
=C2=A0---<br>
=C2=A0 Lib/pty.py | 5 ++++-<br>
=C2=A0 1 file changed, 4 insertions(+), 1 deletion(-)<br>
<br>
=C2=A0diff --git a/Lib/pty.py b/Lib/pty.py<br>
-index 8d8ce40df5..35439c6b96 100644<br>
+index 8d8ce40..35439c6 100644<br>
=C2=A0--- a/Lib/pty.py<br>
=C2=A0+++ b/Lib/pty.py<br>
=C2=A0@@ -154,7 +154,10 @@ def _copy(master_fd, master_read=3D_read, stdin_=
read=3D_read):<br>
@@ -44,6 +45,3 @@ index 8d8ce40df5..35439c6b96 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not data:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fds.remove(S=
TDIN_FILENO)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
--- <br>
-2.20.1<br>
-<br>
diff --git a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use=
-prefix-value-from-build-configu.patch b/meta/recipes-devtools/python/pytho=
n3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch<br>
index b72c709130..ad384231a5 100644<br>
--- a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix=
-value-from-build-configu.patch<br>
+++ b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix=
-value-from-build-configu.patch<br>
@@ -1,4 +1,4 @@<br>
-From aceaa16e25a8ab6a00f906c340843999635c8e23 Mon Sep 17 00:00:00 2001<br>
+From 2d4bde19e0df7244e1cd17c4f4a255d488cb3e56 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de" tar=
get=3D"_blank">alex@linutronix.de</a>&gt;<br>
=C2=A0Date: Fri, 10 Sep 2021 12:28:31 +0200<br>
=C2=A0Subject: [PATCH] Lib/sysconfig.py: use prefix value from build config=
uration<br>
@@ -9,12 +9,13 @@ native python.<br>
<br>
=C2=A0Upstream-Status: Inappropriate [oe-core cross builds]<br>
=C2=A0Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutroni=
x.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
+<br>
=C2=A0---<br>
=C2=A0 Lib/sysconfig.py | 5 +++++<br>
=C2=A0 1 file changed, 5 insertions(+)<br>
<br>
=C2=A0diff --git a/Lib/sysconfig.py b/Lib/sysconfig.py<br>
-index 95b48f6..84f6427 100644<br>
+index e64bcdc..40c6b3e 100644<br>
=C2=A0--- a/Lib/sysconfig.py<br>
=C2=A0+++ b/Lib/sysconfig.py<br>
=C2=A0@@ -613,6 +613,11 @@ def get_config_vars(*args):<br>
@@ -29,6 +30,3 @@ index 95b48f6..84f6427 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # For backward compatibility, see issue1=
9555<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SO =3D _CONFIG_VARS.get(&#39;EXT_SUFFIX&=
#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if SO is not None:<br>
--- <br>
-2.20.1<br>
-<br>
diff --git a/meta/recipes-devtools/python/python3/0001-Makefile-do-not-comp=
ile-.pyc-in-parallel.patch b/meta/recipes-devtools/python/python3/0001-Make=
file-do-not-compile-.pyc-in-parallel.patch<br>
index ea1efa9cac..2f037ecb09 100644<br>
--- a/meta/recipes-devtools/python/python3/0001-Makefile-do-not-compile-.py=
c-in-parallel.patch<br>
+++ b/meta/recipes-devtools/python/python3/0001-Makefile-do-not-compile-.py=
c-in-parallel.patch<br>
@@ -1,4 +1,4 @@<br>
-From c501e121a872cbcef8ffe626c1de173a125be9f8 Mon Sep 17 00:00:00 2001<br>
+From c960837b8fd83074bab5148236f3d0595468cea4 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com"=
 target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
=C2=A0Date: Thu, 16 Jan 2020 12:34:20 +0100<br>
=C2=A0Subject: [PATCH] Makefile: do not compile .pyc in parallel<br>
@@ -17,15 +17,16 @@ <a href=3D"https://autobuilder.yocto.io/pub/repro-fail/=
oe-reproducible-20211130-yr_o1a8d/pa" rel=3D"noreferrer" target=3D"_blank">=
https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20211130-yr_o1a=
8d/pa</a><br>
<br>
=C2=A0Upstream-Status: Inappropriate [see issues above]<br>
=C2=A0Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@g=
mail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
+<br>
=C2=A0---<br>
=C2=A0 <a href=3D"http://Makefile.pre.in" rel=3D"noreferrer" target=3D"_bla=
nk">Makefile.pre.in</a> | 12 ++++++------<br>
=C2=A0 1 file changed, 6 insertions(+), 6 deletions(-)<br>
<br>
=C2=A0diff --git a/<a href=3D"http://Makefile.pre.in" rel=3D"noreferrer" ta=
rget=3D"_blank">Makefile.pre.in</a> b/<a href=3D"http://Makefile.pre.in" re=
l=3D"noreferrer" target=3D"_blank">Makefile.pre.in</a><br>
-index 1241112..5dfdf44 100644<br>
+index edd70d4..5e13ba2 100644<br>
=C2=A0--- a/<a href=3D"http://Makefile.pre.in" rel=3D"noreferrer" target=3D=
"_blank">Makefile.pre.in</a><br>
=C2=A0+++ b/<a href=3D"http://Makefile.pre.in" rel=3D"noreferrer" target=3D=
"_blank">Makefile.pre.in</a><br>
-@@ -1457,30 +1457,30 @@ libinstall:=C2=A0 =C2=A0 build_all $(srcdir)/Modul=
es/xxmodule.c<br>
+@@ -1601,30 +1601,30 @@ libinstall:=C2=A0 =C2=A0 build_all $(srcdir)/Modul=
es/xxmodule.c<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -PYTHONPATH=3D$(DESTDIR)$(LIBDEST)=C2=A0 $(RUNS=
HARED) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(PYTHON_FOR_BUILD)=
 -Wi $(DESTDIR)$(LIBDEST)/compileall.py \<br>
diff --git a/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qem=
u-wrapper-when-gathering-profile.patch b/meta/recipes-devtools/python/pytho=
n3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch<br>
index fa7735ff93..e1dabc92a3 100644<br>
--- a/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapp=
er-when-gathering-profile.patch<br>
+++ b/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapp=
er-when-gathering-profile.patch<br>
@@ -1,19 +1,20 @@<br>
-From cf6a9100902484e4d028ee88742dd2487b014a98 Mon Sep 17 00:00:00 2001<br>
+From 9f85089cc3a21d5ff235bb37c6c9758f2b70497d Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com"=
 target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
=C2=A0Date: Wed, 30 Jan 2019 12:41:04 +0100<br>
=C2=A0Subject: [PATCH] Makefile.pre: use qemu wrapper when gathering profil=
e data<br>
<br>
=C2=A0Upstream-Status: Inappropriate [oe-core specific]<br>
=C2=A0Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@g=
mail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
+<br>
=C2=A0---<br>
=C2=A0 <a href=3D"http://Makefile.pre.in" rel=3D"noreferrer" target=3D"_bla=
nk">Makefile.pre.in</a> | 3 +--<br>
=C2=A0 1 file changed, 1 insertion(+), 2 deletions(-)<br>
<br>
=C2=A0diff --git a/<a href=3D"http://Makefile.pre.in" rel=3D"noreferrer" ta=
rget=3D"_blank">Makefile.pre.in</a> b/<a href=3D"http://Makefile.pre.in" re=
l=3D"noreferrer" target=3D"_blank">Makefile.pre.in</a><br>
-index a3a02a7..d5503dd 100644<br>
+index f0aedb7..edd70d4 100644<br>
=C2=A0--- a/<a href=3D"http://Makefile.pre.in" rel=3D"noreferrer" target=3D=
"_blank">Makefile.pre.in</a><br>
=C2=A0+++ b/<a href=3D"http://Makefile.pre.in" rel=3D"noreferrer" target=3D=
"_blank">Makefile.pre.in</a><br>
-@@ -507,8 +507,7 @@ build_all_generate_profile:<br>
+@@ -519,8 +519,7 @@ build_all_generate_profile:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(MAKE) @DEF_MAKE_RULE@ CFLAGS_NODIST=3D&quot;$=
(CFLAGS_NODIST) $(PGO_PROF_GEN_FLAG)&quot; LDFLAGS_NODIST=3D&quot;$(LDFLAGS=
_NODIST) $(PGO_PROF_GEN_FLAG)&quot; LIBS=3D&quot;$(LIBS)&quot;<br>
<br>
=C2=A0 run_profile_task:<br>
diff --git a/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-d=
ue-to-load-variability-on-YP-AB.patch b/meta/recipes-devtools/python/python=
3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch<br>
index a49d603d47..96c5a3c840 100644<br>
--- a/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-l=
oad-variability-on-YP-AB.patch<br>
+++ b/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-l=
oad-variability-on-YP-AB.patch<br>
@@ -1,9 +1,8 @@<br>
-From 0b25b66d4f54bd74615c9ff10f3fae8f0d1c548d Mon Sep 17 00:00:00 2001<br>
+From 7171aeee22a0b7ab57cdf3d1ae15530549f8f92a Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Yi Fan Yu &lt;<a href=3D"mailto:yifan.yu@windriver.com" target=
=3D"_blank">yifan.yu@windriver.com</a>&gt;<br>
=C2=A0Date: Thu, 1 Apr 2021 13:08:37 -0700<br>
=C2=A0Subject: [PATCH] Skip failing tests due to load variability on YP AB<=
br>
<br>
-<br>
=C2=A0Skip these tests until AB-INT is solved.<br>
<br>
=C2=A0[YOCTO #14296]<br>
@@ -11,16 +10,17 @@ Skip these tests until AB-INT is solved.<br>
=C2=A0Upstream-Status: Inappropriate [OE-Specific]<br>
<br>
=C2=A0Signed-off-by: Yi Fan Yu &lt;<a href=3D"mailto:yifan.yu@windriver.com=
" target=3D"_blank">yifan.yu@windriver.com</a>&gt;<br>
+<br>
=C2=A0---<br>
=C2=A0 Lib/test/_test_multiprocessing.py | 2 ++<br>
=C2=A0 Lib/test/test_time.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 1 +<br>
=C2=A0 2 files changed, 3 insertions(+)<br>
<br>
=C2=A0diff --git a/Lib/test/_test_multiprocessing.py b/Lib/test/_test_multi=
processing.py<br>
-index fd3b430..cda29f6 100644<br>
+index 3bc5b8f..a6e106d 100644<br>
=C2=A0--- a/Lib/test/_test_multiprocessing.py<br>
=C2=A0+++ b/Lib/test/_test_multiprocessing.py<br>
-@@ -568,6 +568,7 @@ def test_close(self):<br>
+@@ -568,6 +568,7 @@ class _TestProcess(BaseTestCase):<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 close_queue(q)<br>
<br>
@@ -28,7 +28,7 @@ index fd3b430..cda29f6 100644<br>
=C2=A0 =C2=A0 =C2=A0 def test_many_processes(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.TYPE =3D=3D &#39;threads&#39;:<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.skipTest(&#39;test no=
t appropriate for {}&#39;.format(self.TYPE))<br>
-@@ -4715,6 +4716,7 @@ def signal_and_sleep(cls, sem, period):<br>
+@@ -4817,6 +4818,7 @@ class TestWait(unittest.TestCase):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sem.release()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 time.sleep(period)<br>
<br>
@@ -37,10 +37,10 @@ index fd3b430..cda29f6 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from multiprocessing.connection import w=
ait<br>
<br>
=C2=A0diff --git a/Lib/test/test_time.py b/Lib/test/test_time.py<br>
-index 3258298..adcf407 100644<br>
+index 875615a..aebaa8c 100644<br>
=C2=A0--- a/Lib/test/test_time.py<br>
=C2=A0+++ b/Lib/test/test_time.py<br>
-@@ -474,6 +474,7 @@ def test_monotonic(self):<br>
+@@ -474,6 +474,7 @@ class TimeTestCase(unittest.TestCase):<br>
=C2=A0 =C2=A0 =C2=A0 def test_perf_counter(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 time.perf_counter()<br>
<br>
@@ -48,6 +48,3 @@ index 3258298..adcf407 100644<br>
=C2=A0 =C2=A0 =C2=A0 def test_process_time(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # process_time() should not include time=
 spend during a sleep<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 start =3D time.process_time()<br>
--- <br>
-2.17.1<br>
-<br>
diff --git a/meta/recipes-devtools/python/python3/0001-Use-FLAG_REF-always-=
for-interned-strings.patch b/meta/recipes-devtools/python/python3/0001-Use-=
FLAG_REF-always-for-interned-strings.patch<br>
index 793385de91..993ac243fc 100644<br>
--- a/meta/recipes-devtools/python/python3/0001-Use-FLAG_REF-always-for-int=
erned-strings.patch<br>
+++ b/meta/recipes-devtools/python/python3/0001-Use-FLAG_REF-always-for-int=
erned-strings.patch<br>
@@ -1,4 +1,4 @@<br>
-From 9f63e83b1cec872917647b11155edaffe399d103 Mon Sep 17 00:00:00 2001<br>
+From d7217b79a4e125d4fcc1087743171b94d91d1121 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Inada Naoki &lt;<a href=3D"mailto:songofacandy@gmail.com" targe=
t=3D"_blank">songofacandy@gmail.com</a>&gt;<br>
=C2=A0Date: Sat, 14 Jul 2018 00:46:11 +0900<br>
=C2=A0Subject: [PATCH] Use FLAG_REF always for interned strings<br>
@@ -11,7 +11,7 @@ Signed-off-by: Joshua Watt &lt;<a href=3D"mailto:JPEWhack=
er@gmail.com" target=3D"_blank">JPEWhacker@gmail.com</a>&gt;<br>
=C2=A0 1 file changed, 7 insertions(+), 2 deletions(-)<br>
<br>
=C2=A0diff --git a/Python/marshal.c b/Python/marshal.c<br>
-index c4538bd..2437160 100644<br>
+index 4125240..341c9aa 100644<br>
=C2=A0--- a/Python/marshal.c<br>
=C2=A0+++ b/Python/marshal.c<br>
=C2=A0@@ -298,9 +298,14 @@ w_ref(PyObject *v, char *flag, WFILE *p)<br>
diff --git a/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-det=
ection-of-mips-architecture-for-.patch b/meta/recipes-devtools/python/pytho=
n3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch<br>
index c4fae09a5b..fc2241b5b9 100644<br>
--- a/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-=
of-mips-architecture-for-.patch<br>
+++ b/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-=
of-mips-architecture-for-.patch<br>
@@ -1,7 +1,8 @@<br>
-From 1ad771d86728ee2ed30e202e9768d8d825f96467 Mon Sep 17 00:00:00 2001<br>
+From 7cfa712eecf02edaefaf0e51f3c8a31933b88db1 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Matthias Schoepfer &lt;<a href=3D"mailto:matthias.schoepfer@ith=
inx.io" target=3D"_blank">matthias.schoepfer@ithinx.io</a>&gt;<br>
=C2=A0Date: Fri, 31 May 2019 15:34:34 +0200<br>
=C2=A0Subject: [PATCH] bpo-36852: proper detection of mips architecture for=
 soft<br>
+<br>
=C2=A0 float<br>
<br>
=C2=A0When (cross) compiling for softfloat mips, __mips_hard_float will not=
 be<br>
@@ -13,18 +14,18 @@ to do this in a more autoconf/autotools manner.<br>
=C2=A0Upstream-Status: Submitted [<a href=3D"https://github.com/python/cpyt=
hon/pull/13196" rel=3D"noreferrer" target=3D"_blank">https://github.com/pyt=
hon/cpython/pull/13196</a>]<br>
=C2=A0Signed-off-by: Matthias Schoepfer &lt;<a href=3D"mailto:matthias.scho=
epfer@ithinx.io" target=3D"_blank">matthias.schoepfer@ithinx.io</a>&gt;<br>
<br>
-%% original patch: 0001-bpo-36852-proper-detection-of-mips-architecture-fo=
r-.patch<br>
+<br>
=C2=A0---<br>
=C2=A0 <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a> | 175 +++++++--------------------------------------------=
<br>
=C2=A0 1 file changed, 21 insertions(+), 154 deletions(-)<br>
<br>
=C2=A0diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" targe=
t=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"nore=
ferrer" target=3D"_blank">configure.ac</a><br>
-index ede710e..bc81b0b 100644<br>
+index 299786b..d0db062 100644<br>
=C2=A0--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
=C2=A0+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
-@@ -710,160 +710,27 @@ fi<br>
- MULTIARCH=3D$($CC --print-multiarch 2&gt;/dev/null)<br>
- AC_SUBST(MULTIARCH)<br>
+@@ -718,160 +718,27 @@ then<br>
+ fi<br>
+ <br>
<br>
=C2=A0-AC_MSG_CHECKING([for the platform triplet based on compiler characte=
ristics])<br>
=C2=A0-cat &gt;&gt; conftest.c &lt;&lt;EOF<br>
@@ -202,8 +203,5 @@ index ede710e..bc81b0b 100644<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 ;;<br>
=C2=A0+esac=C2=A0 <br>
<br>
- if test x$PLATFORM_TRIPLET !=3D x &amp;&amp; test x$MULTIARCH !=3D x; the=
n<br>
-=C2=A0 =C2=A0if test x$PLATFORM_TRIPLET !=3D x$MULTIARCH; then<br>
--- <br>
-2.24.1<br>
-<br>
+ if test x$PLATFORM_TRIPLET !=3D xdarwin; then<br>
+=C2=A0 =C2=A0MULTIARCH=3D$($CC --print-multiarch 2&gt;/dev/null)<br>
diff --git a/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-=
append-STAGING_LIBDIR-python-sys.patch b/meta/recipes-devtools/python/pytho=
n3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch<br>
index b323ed4dd0..1a1e3e960c 100644<br>
--- a/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-=
STAGING_LIBDIR-python-sys.patch<br>
+++ b/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-=
STAGING_LIBDIR-python-sys.patch<br>
@@ -1,4 +1,4 @@<br>
-From 3a98c2eab187289dc8c55e36738c2c0f4216d906 Mon Sep 17 00:00:00 2001<br>
+From 8a91a3047222ac533c2ca00b6d27cf6f992e6b11 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com"=
 target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
=C2=A0Date: Thu, 31 Jan 2019 16:46:30 +0100<br>
=C2=A0Subject: [PATCH] distutils/sysconfig: append<br>
@@ -14,7 +14,7 @@ Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:al=
ex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
=C2=A0 1 file changed, 2 insertions(+)<br>
<br>
=C2=A0diff --git a/Lib/sysconfig.py b/Lib/sysconfig.py<br>
-index a78c0b1..f5c5efe 100644<br>
+index 40c6b3e..ac94cc7 100644<br>
=C2=A0--- a/Lib/sysconfig.py<br>
=C2=A0+++ b/Lib/sysconfig.py<br>
=C2=A0@@ -474,6 +474,8 @@ def _init_posix(vars):<br>
diff --git a/meta/recipes-devtools/python/python3/0001-python3-use-cc_basen=
ame-to-replace-CC-for-checking-c.patch b/meta/recipes-devtools/python/pytho=
n3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch<br>
index bfddc1ad52..6bb85fcb34 100644<br>
--- a/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-=
replace-CC-for-checking-c.patch<br>
+++ b/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-=
replace-CC-for-checking-c.patch<br>
@@ -1,4 +1,4 @@<br>
-From 5f9eea2c4f8716830f6c8855a3e10872119fae32 Mon Sep 17 00:00:00 2001<br>
+From 9f68a27eb34394a00f1011c06900c609f15fb15c Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.com" =
target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
=C2=A0Date: Mon, 22 Oct 2018 15:19:51 +0800<br>
=C2=A0Subject: [PATCH] python3: use cc_basename to replace CC for checking =
compiler<br>
@@ -27,10 +27,10 @@ Signed-off-by: Changqing Li &lt;<a href=3D"mailto:chang=
qing.li@windriver.com" target=3D"_blank">changqing.li@windriver.com</a>&gt;=
<br>
=C2=A0 1 file changed, 10 insertions(+), 9 deletions(-)<br>
<br>
=C2=A0diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" targe=
t=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"nore=
ferrer" target=3D"_blank">configure.ac</a><br>
-index d60f052..e491e24 100644<br>
+index 0c06914..299786b 100644<br>
=C2=A0--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
=C2=A0+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
-@@ -54,6 +54,7 @@ AC_CONFIG_HEADER(pyconfig.h)<br>
+@@ -61,6 +61,7 @@ AC_CONFIG_HEADER(pyconfig.h)<br>
=C2=A0 AC_CANONICAL_HOST<br>
=C2=A0 AC_SUBST(build)<br>
=C2=A0 AC_SUBST(host)<br>
@@ -38,7 +38,7 @@ index d60f052..e491e24 100644<br>
<br>
=C2=A0 # pybuilddir.txt will be created by --generate-posix-vars in the Mak=
efile<br>
=C2=A0 rm -f pybuilddir.txt<br>
-@@ -689,7 +690,7 @@ AC_MSG_RESULT($with_cxx_main)<br>
+@@ -688,7 +689,7 @@ AC_MSG_RESULT($with_cxx_main)<br>
=C2=A0 preset_cxx=3D&quot;$CXX&quot;<br>
=C2=A0 if test -z &quot;$CXX&quot;<br>
=C2=A0 then<br>
@@ -47,7 +47,7 @@ index d60f052..e491e24 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gcc)=C2=A0 =C2=A0 AC_PATH_TOOL(CXX, [g++=
], [g++], [notfound]) ;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cc)=C2=A0 =C2=A0 =C2=A0AC_PATH_TOOL(CXX,=
 [c++], [c++], [notfound]) ;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clang|*/clang)=C2=A0 =C2=A0 =C2=A0AC_PAT=
H_TOOL(CXX, [clang++], [clang++], [notfound]) ;;<br>
-@@ -975,7 +976,7 @@ rmdir CaseSensitiveTestDir<br>
+@@ -976,7 +977,7 @@ rmdir CaseSensitiveTestDir<br>
<br>
=C2=A0 case $ac_sys_system in<br>
=C2=A0 hp*|HP*)<br>
@@ -56,7 +56,7 @@ index d60f052..e491e24 100644<br>
=C2=A0 =C2=A0 =C2=A0 cc|*/cc) CC=3D&quot;$CC -Ae&quot;;;<br>
=C2=A0 =C2=A0 =C2=A0 esac;;<br>
=C2=A0 esac<br>
-@@ -1366,7 +1367,7 @@ else<br>
+@@ -1374,7 +1375,7 @@ else<br>
=C2=A0 fi],<br>
=C2=A0 [AC_MSG_RESULT(no)])<br>
=C2=A0 if test &quot;$Py_LTO&quot; =3D &#39;true&#39; ; then<br>
@@ -65,7 +65,7 @@ index d60f052..e491e24 100644<br>
=C2=A0 =C2=A0 =C2=A0 *clang*)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_SUBST(LLVM_AR)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_PATH_TOOL(LLVM_AR, llvm-ar, &#39;&#39;, ${ll=
vm_path})<br>
-@@ -1456,7 +1457,7 @@ then<br>
+@@ -1467,7 +1468,7 @@ then<br>
=C2=A0 =C2=A0 fi<br>
=C2=A0 fi<br>
=C2=A0 LLVM_PROF_ERR=3Dno<br>
@@ -74,7 +74,7 @@ index d60f052..e491e24 100644<br>
=C2=A0 =C2=A0 *clang*)<br>
=C2=A0 =C2=A0 =C2=A0 # Any changes made here should be reflected in the GCC=
+Darwin case below<br>
=C2=A0 =C2=A0 =C2=A0 PGO_PROF_GEN_FLAG=3D&quot;-fprofile-instr-generate&quo=
t;<br>
-@@ -1517,7 +1518,7 @@ esac<br>
+@@ -1528,7 +1529,7 @@ esac<br>
=C2=A0 # compiler and platform.=C2=A0 BASECFLAGS tweaks need to be made eve=
n if the<br>
=C2=A0 # user set OPT.<br>
<br>
@@ -83,7 +83,7 @@ index d60f052..e491e24 100644<br>
=C2=A0 =C2=A0 =C2=A0 *clang*)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cc_is_clang=3D1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
-@@ -1653,7 +1654,7 @@ yes)<br>
+@@ -1664,7 +1665,7 @@ yes)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 # ICC doesn&#39;t recognize the option, but only emits=
 a warning<br>
=C2=A0 =C2=A0 =C2=A0 ## XXX does it emit an unused result warning and can i=
t be disabled?<br>
@@ -92,7 +92,7 @@ index d60f052..e491e24 100644<br>
=C2=A0 =C2=A0 =C2=A0 *icc*)<br>
=C2=A0 =C2=A0 =C2=A0 ac_cv_disable_unused_result_warning=3Dno<br>
=C2=A0 =C2=A0 =C2=A0 ;;<br>
-@@ -1993,7 +1994,7 @@ yes)<br>
+@@ -2018,7 +2019,7 @@ yes)<br>
=C2=A0 =C2=A0 =C2=A0 ;;<br>
=C2=A0 esac<br>
<br>
@@ -101,7 +101,7 @@ index d60f052..e491e24 100644<br>
=C2=A0 *icc*)<br>
=C2=A0 =C2=A0 =C2=A0 # ICC needs -fp-model strict or floats behave badly<br=
>
=C2=A0 =C2=A0 =C2=A0 CFLAGS_NODIST=3D&quot;$CFLAGS_NODIST -fp-model strict&=
quot;<br>
-@@ -2765,7 +2766,7 @@ then<br>
+@@ -2836,7 +2837,7 @@ then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 LINKFORSHARED=3D&quot;-Wl,--export-dynamic&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi;;<br>
@@ -110,7 +110,7 @@ index d60f052..e491e24 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *gcc*)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if $C=
C -Xlinker --help 2&gt;&amp;1 | grep export-dynamic &gt;/dev/null<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 then<=
br>
-@@ -5507,7 +5508,7 @@ if test &quot;$have_gcc_asm_for_x87&quot; =3D yes; t=
hen<br>
+@@ -5622,7 +5623,7 @@ if test &quot;$have_gcc_asm_for_x87&quot; =3D yes; t=
hen<br>
=C2=A0 =C2=A0 =C2=A0 # Some versions of gcc miscompile inline asm:<br>
=C2=A0 =C2=A0 =C2=A0 # <a href=3D"http://gcc.gnu.org/bugzilla/show_bug.cgi?=
id=3D46491" rel=3D"noreferrer" target=3D"_blank">http://gcc.gnu.org/bugzill=
a/show_bug.cgi?id=3D46491</a><br>
=C2=A0 =C2=A0 =C2=A0 # <a href=3D"http://gcc.gnu.org/ml/gcc/2010-11/msg0036=
6.html" rel=3D"noreferrer" target=3D"_blank">http://gcc.gnu.org/ml/gcc/2010=
-11/msg00366.html</a><br>
diff --git a/meta/recipes-devtools/python/python3/0001-sysconfig.py-use-pla=
tlibdir-also-for-purelib.patch b/meta/recipes-devtools/python/python3/0001-=
sysconfig.py-use-platlibdir-also-for-purelib.patch<br>
index 2b5a7d308c..4fb63a9b7a 100644<br>
--- a/meta/recipes-devtools/python/python3/0001-sysconfig.py-use-platlibdir=
-also-for-purelib.patch<br>
+++ b/meta/recipes-devtools/python/python3/0001-sysconfig.py-use-platlibdir=
-also-for-purelib.patch<br>
@@ -1,4 +1,4 @@<br>
-From 93346d1a2f5d4f7085391bc7c1230d85ebe00606 Mon Sep 17 00:00:00 2001<br>
+From 9162460d81ccc725fb04a14b27d0bf4afcfb69c9 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de" tar=
get=3D"_blank">alex@linutronix.de</a>&gt;<br>
=C2=A0Date: Sun, 12 Sep 2021 21:44:36 +0200<br>
=C2=A0Subject: [PATCH] sysconfig.py: use platlibdir also for purelib<br>
@@ -8,12 +8,13 @@ is not correct.<br>
<br>
=C2=A0Upstream-Status: Inappropriate [oe-core specific]<br>
=C2=A0Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutroni=
x.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
+<br>
=C2=A0---<br>
=C2=A0 Lib/sysconfig.py | 2 +-<br>
=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
=C2=A0diff --git a/Lib/sysconfig.py b/Lib/sysconfig.py<br>
-index b70d392..c418acd 100644<br>
+index daf9f00..e64bcdc 100644<br>
=C2=A0--- a/Lib/sysconfig.py<br>
=C2=A0+++ b/Lib/sysconfig.py<br>
=C2=A0@@ -27,7 +27,7 @@ _INSTALL_SCHEMES =3D {<br>
@@ -25,6 +26,3 @@ index b70d392..c418acd 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;platlib&#39;: &#39;{platbase}/{plat=
libdir}/python{py_version_short}/site-packages&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;include&#39;:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;{installed_base}/incl=
ude/python{py_version_short}{abiflags}&#39;,<br>
--- <br>
-2.20.1<br>
-<br>
diff --git a/meta/recipes-devtools/python/python3/0001-test_ctypes.test_fin=
d-skip-without-tools-sdk.patch b/meta/recipes-devtools/python/python3/0001-=
test_ctypes.test_find-skip-without-tools-sdk.patch<br>
index 7d684b3c43..371021c0a9 100644<br>
--- a/meta/recipes-devtools/python/python3/0001-test_ctypes.test_find-skip-=
without-tools-sdk.patch<br>
+++ b/meta/recipes-devtools/python/python3/0001-test_ctypes.test_find-skip-=
without-tools-sdk.patch<br>
@@ -1,4 +1,4 @@<br>
-From 7a2bddfa437be633bb6945d0e6b7d6f27da870ad Mon Sep 17 00:00:00 2001<br>
+From 13aa6449c47980c7270dad2527c3911517bf34e6 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Tim Orling &lt;<a href=3D"mailto:timothy.t.orling@intel.com" ta=
rget=3D"_blank">timothy.t.orling@intel.com</a>&gt;<br>
=C2=A0Date: Fri, 18 Jun 2021 11:56:50 -0700<br>
=C2=A0Subject: [PATCH] test_ctypes.test_find: skip without tools-sdk<br>
@@ -10,15 +10,16 @@ easiest way to dynamically check for that is looking fo=
r<br>
=C2=A0Upstream-Status: Inappropriate [oe-specific]<br>
<br>
=C2=A0Signed-off-by: Tim Orling &lt;<a href=3D"mailto:timothy.t.orlign@inte=
l.com" target=3D"_blank">timothy.t.orlign@intel.com</a>&gt;<br>
+<br>
=C2=A0---<br>
=C2=A0 Lib/ctypes/test/test_find.py | 2 ++<br>
=C2=A0 1 file changed, 2 insertions(+)<br>
<br>
=C2=A0diff --git a/Lib/ctypes/test/test_find.py b/Lib/ctypes/test/test_find=
.py<br>
-index 92ac184..0d009d1 100644<br>
+index 1ff9d01..59def26 100644<br>
=C2=A0--- a/Lib/ctypes/test/test_find.py<br>
=C2=A0+++ b/Lib/ctypes/test/test_find.py<br>
-@@ -112,10 +112,12 @@ class FindLibraryLinux(unittest.TestCase):<br>
+@@ -113,10 +113,12 @@ class FindLibraryLinux(unittest.TestCase):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # LD_LIBRARY=
_PATH)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertE=
qual(find_library(libname), &#39;lib%s.so&#39; % libname)<br>
<br>
diff --git a/meta/recipes-devtools/python/python3/0001-test_locale.py-corre=
ct-the-test-output-format.patch b/meta/recipes-devtools/python/python3/0001=
-test_locale.py-correct-the-test-output-format.patch<br>
index c3d1e06d00..c762f98307 100644<br>
--- a/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-=
test-output-format.patch<br>
+++ b/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-=
test-output-format.patch<br>
@@ -1,4 +1,4 @@<br>
-From b94995e0c694ec9561efec0d1a59b323340e6105 Mon Sep 17 00:00:00 2001<br>
+From 46856e692377d21be3562f6f90c242f5c9594ae2 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriver.com" target=
=3D"_blank">mingli.yu@windriver.com</a>&gt;<br>
=C2=A0Date: Mon, 5 Aug 2019 15:57:39 +0800<br>
=C2=A0Subject: [PATCH] test_locale.py: correct the test output format<br>
@@ -23,19 +23,19 @@ Before this patch:<br>
<br>
=C2=A0Upstream-Status: Submitted [<a href=3D"https://github.com/python/cpyt=
hon/pull/15132" rel=3D"noreferrer" target=3D"_blank">https://github.com/pyt=
hon/cpython/pull/15132</a>]<br>
<br>
-<br>
=C2=A0Rebased for 3.9.4, still not accepted upstream Signed-off-by: Alejand=
ro Hernandez &lt;<a href=3D"mailto:alejandro@enedino.org" target=3D"_blank"=
>alejandro@enedino.org</a>&gt;<br>
<br>
=C2=A0Signed-off-by: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriver.co=
m" target=3D"_blank">mingli.yu@windriver.com</a>&gt;<br>
+<br>
=C2=A0---<br>
=C2=A0 Lib/test/test_locale.py | 2 +-<br>
=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
-Index: Python-3.9.4/Lib/test/test_locale.py<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- Python-3.9.4.orig/Lib/test/test_locale.py<br>
-+++ Python-3.9.4/Lib/test/test_locale.py<br>
-@@ -562,7 +562,7 @@ class TestMiscellaneous(unittest.TestCas<br>
+diff --git a/Lib/test/test_locale.py b/Lib/test/test_locale.py<br>
+index f844e62..04df0c2 100644<br>
+--- a/Lib/test/test_locale.py<br>
++++ b/Lib/test/test_locale.py<br>
+@@ -564,7 +564,7 @@ class TestMiscellaneous(unittest.TestCase):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.skipTest(&#39;test ne=
eds Turkish locale&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 loc =3D locale.getlocale(locale.LC_CTYPE=
)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if verbose:<br>
diff --git a/meta/recipes-devtools/python/python3/0017-setup.py-do-not-repo=
rt-missing-dependencies-for-disa.patch b/meta/recipes-devtools/python/pytho=
n3/0017-setup.py-do-not-report-missing-dependencies-for-disa.patch<br>
index 5823273af3..0ead57e465 100644<br>
--- a/meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-miss=
ing-dependencies-for-disa.patch<br>
+++ b/meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-miss=
ing-dependencies-for-disa.patch<br>
@@ -1,4 +1,4 @@<br>
-From a2dd127b4163aff6cc35af0d0251321964232ad4 Mon Sep 17 00:00:00 2001<br>
+From 246c5ffe75a2d494e415d8a7522df9fe22056d41 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com"=
 target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
=C2=A0Date: Mon, 7 Oct 2019 13:22:14 +0200<br>
=C2=A0Subject: [PATCH] setup.py: do not report missing dependencies for dis=
abled<br>
@@ -14,14 +14,14 @@ Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Marti=
n.Jansa@gmail.com" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
=C2=A0Signed-off-by: Alejandro Hernandez Samaniego &lt;<a href=3D"mailto:al=
ejandro@enedino.org" target=3D"_blank">alejandro@enedino.org</a>&gt;<br>
<br>
=C2=A0---<br>
- setup.py | 4 ++++<br>
- 1 file changed, 4 insertions(+)<br>
+ setup.py | 8 ++++++++<br>
+ 1 file changed, 8 insertions(+)<br>
<br>
=C2=A0diff --git a/setup.py b/setup.py<br>
-index 7691258..ec3f2a4 100644<br>
+index 2be4738..62f0e18 100644<br>
=C2=A0--- a/setup.py<br>
=C2=A0+++ b/setup.py<br>
-@@ -408,6 +408,14 @@ class PyBuildExt(build_ext):<br>
+@@ -517,6 +517,14 @@ class PyBuildExt(build_ext):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print(&quot;=
%-*s=C2=A0 =C2=A0%-*s=C2=A0 =C2=A0%-*s&quot; % (longest, e, longest, f,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 longest, g))<br>
<br>
diff --git a/meta/recipes-devtools/python/python3/0020-configure.ac-setup.p=
y-do-not-add-a-curses-include-pa.patch b/meta/recipes-devtools/python/pytho=
n3/0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch<br>
index e04a91605c..30d2906439 100644<br>
--- a/meta/recipes-devtools/python/python3/0020-configure.ac-setup.py-do-no=
t-add-a-curses-include-pa.patch<br>
+++ b/meta/recipes-devtools/python/python3/0020-configure.ac-setup.py-do-no=
t-add-a-curses-include-pa.patch<br>
@@ -1,4 +1,4 @@<br>
-From 863c09f640a5dfd33ff22915b0d5fee7bc5df70a Mon Sep 17 00:00:00 2001<br>
+From 788cd0464ee2b175493a0167ceee8c0045ce323c Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com"=
 target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
=C2=A0Date: Sun, 16 Feb 2020 17:50:25 +0100<br>
=C2=A0Subject: [PATCH] <a href=3D"http://configure.ac" rel=3D"noreferrer" t=
arget=3D"_blank">configure.ac</a>, setup.py: do not add a curses include pa=
th from<br>
@@ -11,16 +11,17 @@ as dnf failures).<br>
<br>
=C2=A0Upstream-Status: Inappropriate [oe-core specific]<br>
=C2=A0Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@g=
mail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
+<br>
=C2=A0---<br>
=C2=A0 <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a> | 6 ------<br>
=C2=A0 setup.py=C2=A0 =C2=A0 =C2=A0| 2 --<br>
=C2=A0 2 files changed, 8 deletions(-)<br>
<br>
=C2=A0diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" targe=
t=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"nore=
ferrer" target=3D"_blank">configure.ac</a><br>
-index 915f475..c911011 100644<br>
+index e5e3df8..bfdd987 100644<br>
=C2=A0--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
=C2=A0+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
-@@ -4828,12 +4828,6 @@ then<br>
+@@ -5092,12 +5092,6 @@ then<br>
=C2=A0 =C2=A0 [Define if you have struct stat.st_mtimensec])<br>
=C2=A0 fi<br>
<br>
@@ -34,10 +35,10 @@ index 915f475..c911011 100644<br>
<br>
=C2=A0 # On Solaris, term.h requires curses.h<br>
=C2=A0diff --git a/setup.py b/setup.py<br>
-index b0f1541..7208cd0 100644<br>
+index 62f0e18..c190002 100644<br>
=C2=A0--- a/setup.py<br>
=C2=A0+++ b/setup.py<br>
-@@ -973,8 +973,6 @@ class PyBuildExt(build_ext):<br>
+@@ -1169,8 +1169,6 @@ class PyBuildExt(build_ext):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 panel_library =3D &#39;panel&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if curses_library =3D=3D &#39;ncursesw&#=
39;:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 curses_defines.append((&#3=
9;HAVE_NCURSESW&#39;, &#39;1&#39;))<br>
diff --git a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-in=
side-staging-area.patch b/meta/recipes-devtools/python/python3/12-distutils=
-prefix-is-inside-staging-area.patch<br>
index cc64e3ecf7..bb2984cc71 100644<br>
--- a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-st=
aging-area.patch<br>
+++ b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-st=
aging-area.patch<br>
@@ -1,4 +1,4 @@<br>
-From f6411021856bafedd784748ec33494151e783b51 Mon Sep 17 00:00:00 2001<br>
+From 99cfdb5f3debd38f50b73a7713161f8b56ce842e Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0Date: Tue, 14 May 2013 15:00:26 -0700<br>
=C2=A0Subject: [PATCH] python3: Add target and native recipes<br>
@@ -12,6 +12,7 @@ Signed-Off: Michael &#39;Mickey&#39; Lauer &lt;<a href=3D=
"mailto:mickey@vanille-media.de" target=3D"_blank">mickey@vanille-media.de<=
/a>&gt;<br>
=C2=A0Signed-off-by: Phil Blundell &lt;<a href=3D"mailto:philb@gnu.org" tar=
get=3D"_blank">philb@gnu.org</a>&gt;<br>
=C2=A0Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0Signed-off-by: Alejandro Hernandez &lt;<a href=3D"mailto:alejandro.he=
rnandez@linux.intel.com" target=3D"_blank">alejandro.hernandez@linux.intel.=
com</a>&gt;<br>
+<br>
=C2=A0---<br>
=C2=A0 Lib/distutils/sysconfig.py | 14 +++++++++++---<br>
=C2=A0 1 file changed, 11 insertions(+), 3 deletions(-)<br>
@@ -55,6 +56,3 @@ index 3414a76..361d3a1 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;python&quot; + ge=
t_python_version())<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if standard_lib:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return libpython<br>
--- <br>
-2.20.1<br>
-<br>
diff --git a/meta/recipes-devtools/python/python3/avoid_warning_about_tkint=
er.patch b/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter=
.patch<br>
index 184540e794..2de72b7199 100644<br>
--- a/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patc=
h<br>
+++ b/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patc=
h<br>
@@ -1,4 +1,4 @@<br>
-From ba7202700578d435b07cfdfb7b57e83185752800 Mon Sep 17 00:00:00 2001<br>
+From 6a23d52c905cd1f6a5944255903ec86ea8b904bb Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Andrei Gherzan &lt;<a href=3D"mailto:andrei@gherzan.ro" target=
=3D"_blank">andrei@gherzan.ro</a>&gt;<br>
=C2=A0Date: Mon, 28 Jan 2019 15:57:54 +0000<br>
=C2=A0Subject: [PATCH] _tkinter module needs tk module along with tcl. tk i=
s not yet<br>
@@ -15,10 +15,10 @@ Signed-off-by: Andrei Gherzan &lt;<a href=3D"mailto:and=
rei@gherzan.ro" target=3D"_blank">andrei@gherzan.ro</a>&gt;<br>
=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
=C2=A0diff --git a/setup.py b/setup.py<br>
-index ab18ff0..7691258 100644<br>
+index 11b5cf5..2be4738 100644<br>
=C2=A0--- a/setup.py<br>
=C2=A0+++ b/setup.py<br>
-@@ -1706,8 +1706,8 @@ class PyBuildExt(build_ext):<br>
+@@ -1895,8 +1895,8 @@ class PyBuildExt(build_ext):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.detect_decimal()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.detect_ctypes()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.detect_multiprocessing()<br>
diff --git a/meta/recipes-devtools/python/python3/cgi_py.patch b/meta/recip=
es-devtools/python/python3/cgi_py.patch<br>
index 6c4ba54320..81e6099cfb 100644<br>
--- a/meta/recipes-devtools/python/python3/cgi_py.patch<br>
+++ b/meta/recipes-devtools/python/python3/cgi_py.patch<br>
@@ -1,4 +1,4 @@<br>
-From 62336285cba38017b35cb761c03f0c7e80a671a3 Mon Sep 17 00:00:00 2001<br>
+From 5b0d1212d661e9a8a36738279fc9109f96eebd25 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Mark Hatle &lt;<a href=3D"mailto:mark.hatle@windriver.com" targ=
et=3D"_blank">mark.hatle@windriver.com</a>&gt;<br>
=C2=A0Date: Wed, 21 Sep 2011 20:55:33 -0500<br>
=C2=A0Subject: [PATCH] Lib/cgi.py: Update the script as mentioned in the co=
mment<br>
@@ -12,7 +12,7 @@ Signed-off-by: Mark Hatle &lt;<a href=3D"mailto:mark.hatl=
e@windriver.com" target=3D"_blank">mark.hatle@windriver.com</a>&gt;<br>
=C2=A0 1 file changed, 1 insertion(+), 10 deletions(-)<br>
<br>
=C2=A0diff --git a/Lib/cgi.py b/Lib/cgi.py<br>
-index 8cf6687..094c7b4 100755<br>
+index 6cb8cf2..a873ff3 100755<br>
=C2=A0--- a/Lib/cgi.py<br>
=C2=A0+++ b/Lib/cgi.py<br>
=C2=A0@@ -1,13 +1,4 @@<br>
diff --git a/meta/recipes-devtools/python/python3/crosspythonpath.patch b/m=
eta/recipes-devtools/python/python3/crosspythonpath.patch<br>
index d789ab57d4..5bb25264da 100644<br>
--- a/meta/recipes-devtools/python/python3/crosspythonpath.patch<br>
+++ b/meta/recipes-devtools/python/python3/crosspythonpath.patch<br>
@@ -1,4 +1,8 @@<br>
-<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">confi=
gure.ac</a>: add CROSSPYTHONPATH into PYTHONPATH for PYTHON_FOR_BUILD<br>
+From baa3a232e64e9bf5ae945366efdb8088ccf9b828 Mon Sep 17 00:00:00 2001<br>
+From: Ricardo Ribalda &lt;<a href=3D"mailto:ricardo@ribalda.com" target=3D=
"_blank">ricardo@ribalda.com</a>&gt;<br>
+Date: Tue, 18 Nov 2014 03:35:33 -0500<br>
+Subject: [PATCH] <a href=3D"http://configure.ac" rel=3D"noreferrer" target=
=3D"_blank">configure.ac</a>: add CROSSPYTHONPATH into PYTHONPATH for<br>
+ PYTHON_FOR_BUILD<br>
<br>
=C2=A0When building x86-&gt;x86 the system will try to execute .so and rela=
ted items<br>
=C2=A0from the default PYTHONPATH.=C2=A0 This will fail if the target CPU c=
ontains<br>
@@ -10,11 +14,16 @@ Upstream-Status: Inappropriate [OE-Core integration spe=
cific]<br>
=C2=A0Credits-to: Mark Hatle &lt;<a href=3D"mailto:mark.hatle@windriver.com=
" target=3D"_blank">mark.hatle@windriver.com</a>&gt;<br>
=C2=A0Credits-to: Jackie Huang &lt;<a href=3D"mailto:jackie.huang@windriver=
.com" target=3D"_blank">jackie.huang@windriver.com</a>&gt;<br>
=C2=A0Signed-off-by: Ricardo Ribalda &lt;<a href=3D"mailto:ricardo@ribalda.=
com" target=3D"_blank">ricardo@ribalda.com</a>&gt;<br>
+<br>
+---<br>
+ <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">conf=
igure.ac</a> | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
=C2=A0diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" targe=
t=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"nore=
ferrer" target=3D"_blank">configure.ac</a><br>
-index 4ab19a6..7036a53 100644<br>
+index d0db062..e5e3df8 100644<br>
=C2=A0--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
=C2=A0+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
-@@ -76,7 +76,7 @@ if test &quot;$cross_compiling&quot; =3D yes; then<br>
+@@ -83,7 +83,7 @@ if test &quot;$cross_compiling&quot; =3D yes; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_MSG_ERROR([python$PACKAGE_VERS=
ION interpreter not found])<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_MSG_RESULT($interp)<br>
diff --git a/meta/recipes-devtools/python/python3/makerace.patch b/meta/rec=
ipes-devtools/python/python3/makerace.patch<br>
index b150c1cb38..2c06784ffc 100644<br>
--- a/meta/recipes-devtools/python/python3/makerace.patch<br>
+++ b/meta/recipes-devtools/python/python3/makerace.patch<br>
@@ -1,4 +1,4 @@<br>
-From 8b8583fb4f2bb3421e31ef06d17c04deec431c7e Mon Sep 17 00:00:00 2001<br>
+From 7cc02dfa593d1350a689d64a7a6f2dc6478afe24 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfounda=
tion.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<br>
=C2=A0Date: Tue, 13 Jul 2021 23:19:29 +0100<br>
=C2=A0Subject: [PATCH] python3: Fix make race<br>
@@ -18,10 +18,10 @@ Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:ric=
hard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoun=
dation.org</a>&gt;<br>
=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
=C2=A0diff --git a/<a href=3D"http://Makefile.pre.in" rel=3D"noreferrer" ta=
rget=3D"_blank">Makefile.pre.in</a> b/<a href=3D"http://Makefile.pre.in" re=
l=3D"noreferrer" target=3D"_blank">Makefile.pre.in</a><br>
-index 69d47a2..c471b60 100644<br>
+index 5e13ba2..026bffd 100644<br>
=C2=A0--- a/<a href=3D"http://Makefile.pre.in" rel=3D"noreferrer" target=3D=
"_blank">Makefile.pre.in</a><br>
=C2=A0+++ b/<a href=3D"http://Makefile.pre.in" rel=3D"noreferrer" target=3D=
"_blank">Makefile.pre.in</a><br>
-@@ -1528,7 +1528,7 @@ TESTSUBDIRS=3D=C2=A0 =C2=A0 =C2=A0ctypes/test \<br>
+@@ -1527,7 +1527,7 @@ TESTSUBDIRS=3D=C2=A0 =C2=A0 =C2=A0ctypes/test \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unittest/test unitt=
est/test/testmock<br>
<br>
=C2=A0 TEST_MODULES=3D@TEST_MODULES@<br>
diff --git a/meta/recipes-devtools/python/python3/python-config.patch b/met=
a/recipes-devtools/python/python3/python-config.patch<br>
index c53f646af3..4da399e46e 100644<br>
--- a/meta/recipes-devtools/python/python3/python-config.patch<br>
+++ b/meta/recipes-devtools/python/python3/python-config.patch<br>
@@ -1,4 +1,4 @@<br>
-From 57d073c12e7bede29919117b0141df14015eb27f Mon Sep 17 00:00:00 2001<br>
+From 8632f25ac4e2c53a3c2c8a1b4fc97fc86e8aad5a Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Tyler Hall &lt;<a href=3D"mailto:tylerwhall@gmail.com" target=
=3D"_blank">tylerwhall@gmail.com</a>&gt;<br>
=C2=A0Date: Sun, 4 May 2014 20:06:43 -0400<br>
=C2=A0Subject: [PATCH] python-config: Revert to using distutils.sysconfig<b=
r>
@@ -16,11 +16,11 @@ Upstream-Status: Inappropriate [Embedded Specific]<br>
=C2=A0Signed-off-by: Tyler Hall &lt;<a href=3D"mailto:tylerwhall@gmail.com"=
 target=3D"_blank">tylerwhall@gmail.com</a>&gt;<br>
<br>
=C2=A0---<br>
- Misc/<a href=3D"http://python-config.in" rel=3D"noreferrer" target=3D"_bl=
ank">python-config.in</a> | 10 +++++-----<br>
- 1 file changed, 5 insertions(+), 5 deletions(-)<br>
+ Misc/<a href=3D"http://python-config.in" rel=3D"noreferrer" target=3D"_bl=
ank">python-config.in</a> | 12 +++++++-----<br>
+ 1 file changed, 7 insertions(+), 5 deletions(-)<br>
<br>
=C2=A0diff --git a/Misc/<a href=3D"http://python-config.in" rel=3D"noreferr=
er" target=3D"_blank">python-config.in</a> b/Misc/<a href=3D"http://python-=
config.in" rel=3D"noreferrer" target=3D"_blank">python-config.in</a><br>
-index ebd99da..13e57ae 100644<br>
+index ebd99da..0492e08 100644<br>
=C2=A0--- a/Misc/<a href=3D"http://python-config.in" rel=3D"noreferrer" tar=
get=3D"_blank">python-config.in</a><br>
=C2=A0+++ b/Misc/<a href=3D"http://python-config.in" rel=3D"noreferrer" tar=
get=3D"_blank">python-config.in</a><br>
=C2=A0@@ -6,7 +6,9 @@<br>
@@ -34,7 +34,7 @@ index ebd99da..13e57ae 100644<br>
<br>
=C2=A0 valid_opts =3D [&#39;prefix&#39;, &#39;exec-prefix&#39;, &#39;includ=
es&#39;, &#39;libs&#39;, &#39;cflags&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;ldflags&#39;, =
&#39;extension-suffix&#39;, &#39;help&#39;, &#39;abiflags&#39;, &#39;config=
dir&#39;,<br>
-@@ -35,14 +35,14 @@ if &#39;--help&#39; in opt_flags:<br>
+@@ -35,14 +37,14 @@ if &#39;--help&#39; in opt_flags:<br>
<br>
=C2=A0 for opt in opt_flags:<br>
=C2=A0 =C2=A0 =C2=A0 if opt =3D=3D &#39;--prefix&#39;:<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3_3.10.0.=
bb" rel=3D"noreferrer" target=3D"_blank">python3_3.10.0.bb</a> b/meta/recip=
es-devtools/python/<a href=3D"http://python3_3.10.1.bb" rel=3D"noreferrer" =
target=3D"_blank">python3_3.10.1.bb</a><br>
similarity index 99%<br>
rename from meta/recipes-devtools/python/<a href=3D"http://python3_3.10.0.b=
b" rel=3D"noreferrer" target=3D"_blank">python3_3.10.0.bb</a><br>
rename to meta/recipes-devtools/python/<a href=3D"http://python3_3.10.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">python3_3.10.1.bb</a><br>
index 24e6c04fe9..a51fc8f415 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3_3.10.0.bb" rel=
=3D"noreferrer" target=3D"_blank">python3_3.10.0.bb</a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3_3.10.1.bb" rel=
=3D"noreferrer" target=3D"_blank">python3_3.10.1.bb</a><br>
@@ -40,7 +40,7 @@ SRC_URI:append:class-native =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://12-distutils-prefix-is-ins=
ide-staging-area.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Don-t-search-system-f=
or-headers-libraries.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-SRC_URI[sha256sum] =3D &quot;5a99f8e7a6a11a7b98b4e75e0d1303d3832cada553406=
8f69c7b6222a7b1b002&quot;<br>
+SRC_URI[sha256sum] =3D &quot;a7f1265b6e1a5de1ec5c3ec7019ab5341346993475831=
1e9d240c46e5ae6e177&quot;<br>
<br>
=C2=A0# exclude pre-releases for both python 2.x and 3.x<br>
=C2=A0UPSTREAM_CHECK_REGEX =3D &quot;[Pp]ython-(?P&lt;pver&gt;\d+(\.\d+)+).=
tar&quot;<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#94243): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/94243" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/94243</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87580545/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/87580545/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" =
target=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000f9894a05d29c440d--

