Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web12.391.1611942060612147511
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Jan 2021 09:41:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GEB7CeD7;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id n15so9502875qkh.8
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 Jan 2021 09:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Blz4T+EIEBX8vCmN1586wnklZSlWprY8S08naS8u3TU=;
        b=GEB7CeD7ykWa0BH2276WAasg+9wEdObLli2QP6cAE8yAINWuxiLQa5fiGgBozEzujv
         Q3FFsckla2Q96ZwGl6j5lqaZshBI+AL9QjaT6HZtoiq+wtVFXiMK8PPDbfSpzDVTo89n
         kAW03+zMfoN7q/6NjZ8nOlkDFcko04zplZ5PDhh1mdx4SaUcyz0msHNQB/n2UpyqDB30
         3RCtIa+QSMzDV8nzNHceBsAFSOA/GzcXZ+ZejRrlfSjk2gkW+kywiZx8J0EBLHJo8o4A
         Sxg408pfQkliu6FORfNkoGH0bk81KyVC710EOmtVImDUZYxRrQvvyo9sdn8INz1yoFdW
         1Y4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Blz4T+EIEBX8vCmN1586wnklZSlWprY8S08naS8u3TU=;
        b=rXpbm5Yw+JMMCxkuaWtba3E1fDlFpVJJ1It/rSobv66lfpHzPTrMOY5HeY/uTyMOLS
         nyLM4IDawp2I/PMrHLaHrmfhGXuBgma5KTtdiF8RmwFFBt1qZGsLdYRi6/TgJPRX6joL
         W5GUfFXNTVRJRdlvw1/iH1faEAK/5C16wSxHyzra1Jc21IOz4kMHKOi6WTqo7i8MXKik
         s2YtnjOBEOgLcpzQ3tcChs+FsspyeLUyXI6kR4qLRH5/+48lWOZwTOV9CSZoJYJ+VbEG
         DpmAT7DbmuhPjtTBOUv6Su8WVjEFrJHM07+FUSy5Lp9lfjj+YXetiyx5qsC+bx65+DSW
         ekHw==
X-Gm-Message-State: AOAM533Yh4ZvU/7+s3fycich19kwFqCINzJ5XqYUwd0SuUOu2LZ2xPYV
	/hT+Jk2FJutTbimEaz2XoE0GFdlF5N1CKj62w0o=
X-Google-Smtp-Source: ABdhPJwlwf3b+tSjZJXP4pDYYwgkfApDZld+0dKzLCXV7IWdWfbqrr6I/FQMlPm8HpNO+pn8qHJFo54ViqxteqwPLCM=
X-Received: by 2002:a37:9b8b:: with SMTP id d133mr4835558qke.71.1611942059670;
 Fri, 29 Jan 2021 09:40:59 -0800 (PST)
MIME-Version: 1.0
References: <20210129171655.20687-1-leon.anavi@konsulko.com>
In-Reply-To: <20210129171655.20687-1-leon.anavi@konsulko.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 29 Jan 2021 09:40:33 -0800
Message-ID: <CAMKF1so_8ngp-Qt0qyDGzYGFxOqv+S1jcykGpHm96y4PRv8jng@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-prctl: Upgrade 1.7 -> 1.8.1
To: Leon Anavi <leon.anavi@konsulko.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 29, 2021 at 9:17 AM Leon Anavi <leon.anavi@konsulko.com> wrote:
>
> Upgrade to release 1.8.1:
>
> - Master was renamed to main
> - Backwards compatibility fixes
> - Install dependencies before trying to build/publish
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  .../0001-support-cross-complication.patch             | 11 ++++++-----
>  .../{python3-prctl_1.7.bb => python3-prctl_1.8.1.bb}  |  8 ++++----
>  2 files changed, 10 insertions(+), 9 deletions(-)
>  rename meta-python/recipes-devtools/python/{python3-prctl_1.7.bb => python3-prctl_1.8.1.bb} (70%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-prctl/0001-support-cross-complication.patch b/meta-python/recipes-devtools/python/python3-prctl/0001-support-cross-complication.patch
> index 775ae1b2e..98d250c74 100644
> --- a/meta-python/recipes-devtools/python/python3-prctl/0001-support-cross-complication.patch
> +++ b/meta-python/recipes-devtools/python/python3-prctl/0001-support-cross-complication.patch
> @@ -1,4 +1,4 @@
> -From 9a16800738547d117284354bbcad7dd77d9d0344 Mon Sep 17 00:00:00 2001
> +From 5f3911737c63a098caf73f1365320fe1b3a7638b Mon Sep 17 00:00:00 2001
>  From: Hongxu Jia <hongxu.jia@windriver.com>
>  Date: Thu, 21 Apr 2016 03:05:57 -0400
>  Subject: [PATCH] support cross-complication
> @@ -6,12 +6,13 @@ Subject: [PATCH] support cross-complication
>  Upstream-Status: Inappropriate [oe specific]
>
>  Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>  ---
>   setup.py | 35 -----------------------------------
>   1 file changed, 35 deletions(-)
>
>  diff --git a/setup.py b/setup.py
> -index 658d1a5..e8be7eb 100755
> +index eb83cfe..3f9567b 100755
>  --- a/setup.py
>  +++ b/setup.py
>  @@ -13,41 +13,6 @@ import sys
> @@ -38,13 +39,13 @@ index 658d1a5..e8be7eb 100755
>  -    sys.stderr.write("You need to install gcc to build this module\n")
>  -    sys.exit(1)
>  -
> --sp = subprocess.Popen(['cpp'], stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
> +-sp = subprocess.Popen(['cpp'], stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE, env=os.environ)
>  -sp.communicate('#include <sys/prctl.h>\n'.encode())
>  -if sp.returncode:
>  -    sys.stderr.write("You need to install libc development headers to build this module\n")
>  -    exit = True
>  -
> --sp = subprocess.Popen(['cpp'], stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
> +-sp = subprocess.Popen(['cpp'], stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE, env=os.environ)
>  -sp.communicate('#include <sys/capability.h>\n'.encode())
>  -if sp.returncode:
>  -    sys.stderr.write("You need to install libcap development headers to build this module\n")
> @@ -57,5 +58,5 @@ index 658d1a5..e8be7eb 100755
>                      sources = ['_prctlmodule.c'],
>                      depends = ['securebits.h'],
>  --
> -2.8.1
> +2.17.1
>
> diff --git a/meta-python/recipes-devtools/python/python3-prctl_1.7.bb b/meta-python/recipes-devtools/python/python3-prctl_1.8.1.bb
> similarity index 70%
> rename from meta-python/recipes-devtools/python/python3-prctl_1.7.bb
> rename to meta-python/recipes-devtools/python/python3-prctl_1.8.1.bb
> index 54620a066..b87a470b4 100644
> --- a/meta-python/recipes-devtools/python/python3-prctl_1.7.bb
> +++ b/meta-python/recipes-devtools/python/python3-prctl_1.8.1.bb
> @@ -5,15 +5,15 @@ limitations in C and linux. This module provides a nice non-messy python(ic) \
>  interface."
>  SECTION = "devel/python"
>  LICENSE = "GPLv3"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=23ff9f50449d4bd0e513df16e4d9755f"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=1475481f9ec754d758859bd2c75f6f6f"
>
>  S = "${WORKDIR}/git"
>  B = "${S}"
>
> -SRCREV = "57cd0a7cad76e8f8792eea22ee5b5d17bae0a90f"
> -PV = "1.7+git${SRCPV}"
> +SRCREV = "5e12e398eb5c4e30d7b29b02458c76d2cc780700"

could you describe why this changed ?

> +PV = "1.8.1+git${SRCPV}"
>
> -SRC_URI = "git://github.com/seveas/python-prctl;branch=master \
> +SRC_URI = "git://github.com/seveas/python-prctl;branch=main\
>             file://0001-support-cross-complication.patch \
>  "
>  inherit setuptools3 python3native
> --
> 2.17.1
>
>
> 
>
