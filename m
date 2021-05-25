Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.10043.1621950891238413662
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 May 2021 06:54:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=k42FzWPo;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: schnitzeltony@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id a7so7694103plh.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 25 May 2021 06:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=31+ZzA/Q6WHJJQFIx7qrnz6l1x88WWZ8k4lRIK4kJLs=;
        b=k42FzWPozprdsYjlMdz3aoJsWQA+Xo8yX0Zkw4oQ2y6CjVXWqX0Ix+5I9a8VaBEpYj
         bn9ocOkTiADGciczjlSf5/MeDPAbLNntWBmIxG7kQ4014gFeVkjmdOqCe+8HV5Y5z3ED
         GN38DzmotwCm69UZzcGcAjaqTGNyhZSrEmKivilb3DSHUiHj6nI/IqktwtsplK6pWH8w
         5cT+0fJt06wuGvxuRs70Wk5htZxtqcvkQP2hk1GWLdd0N9gsZ8jAOIU9f8WACIPgJQyC
         6epvNqhGQIrDGXk1YrK5rQYhzNfA07aiOBATaKpHDNCqdr2Q0rEPn2WJa0kh3P2X+UCa
         q1zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=31+ZzA/Q6WHJJQFIx7qrnz6l1x88WWZ8k4lRIK4kJLs=;
        b=X39veKrA334oTTPu+cGgpt4cqbP4qD89PZALpUsc1Itelo7jighbaVuTHyKaJd44uP
         /4zAUTMvgGdXFKBVt4nKgtW/Rl0nCcGrkJwb+/1L/Zx3ls92CjuKxTdlZpc52QlTQWYR
         yN7KyX6IL1+L5ugRGg068sBkL6lvRstb5MK2Vlx55AaIJp+Hx7vUsHYGafUlyQ99jHcr
         EvdJRA2mDN8C+EuUo30fqRzr9ZPuUJ8Mzzum4BGtNIFQElcQb1BrdrwqHCgp2f8MCX37
         KJMYSLoIwqXpG2Df4ryLm11QQaQkbN73x/xMw3qyd4GvgZ72QBuZuoCUDpnR7xN0ybp0
         Kawg==
X-Gm-Message-State: AOAM5339Xj4S00mgfZlWZH2PZAYUnItoaxUxUdZwLHBmBLyIKdBLePO1
	pXnhvWkLNSp4mzfz9vFeTbaAo/rYuFGCNkHktQg=
X-Google-Smtp-Source: ABdhPJxrZB/t2XVLlEHDsl4CnTBRffEjA7mgsjmU6rofGDl8BN+hzGfnro8YMmPn7ZUoSsuj/aEaqybZuRc7sNdHT5Q=
X-Received: by 2002:a17:90b:2397:: with SMTP id mr23mr29811634pjb.77.1621950890413;
 Tue, 25 May 2021 06:54:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210525134042.3709858-1-dan.mcgregor@usask.ca>
In-Reply-To: <20210525134042.3709858-1-dan.mcgregor@usask.ca>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Tue, 25 May 2021 15:54:38 +0200
Message-ID: <CALbNGRQu18YjfuDnVvWmOwVtMAJCrDzX98h+_N101H7Dd=CcdQ@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] zsh: recipe overhaul
To: Dan McGregor <dan.mcgregor@usask.ca>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Daniel McGregor <daniel.mcgregor@vecima.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, May 25, 2021 at 3:41 PM Dan McGregor <dan.mcgregor@usask.ca> wrote:
Although my interest in zsh is limited, I get the feeling that this
turns zsh into an unmaintainable state and so far from upstream that
we are on ourselves in case of trouble.

Just my 2ct

Cheers

Andreas
>
> From: Daniel McGregor <daniel.mcgregor@vecima.com>
>
> Patch configure.ac to correct syntax for newer autoconf.
> Add support for pkgconfig finding pcre.
> Add default startup files and skeleton files
> Package modules and functions separately from the main package.
> Statically link line editor, and remove example module.
>
> Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
> ---
>  .../zsh/files/configure.ac.patch              | 172 ++++++++++++++++++
>  meta-oe/recipes-shells/zsh/files/dot.zshrc    |  16 ++
>  .../zsh/files/pcre-pkgconfig.patch            |  49 +++++
>  meta-oe/recipes-shells/zsh/files/zprofile     |   6 +
>  .../recipes-shells/zsh/files/zsh_profile.sh   |   5 +
>  meta-oe/recipes-shells/zsh/files/zshrc        |  45 +++++
>  meta-oe/recipes-shells/zsh/zsh_5.8.bb         | 156 ++++++++++++++--
>  7 files changed, 433 insertions(+), 16 deletions(-)
>  create mode 100644 meta-oe/recipes-shells/zsh/files/configure.ac.patch
>  create mode 100644 meta-oe/recipes-shells/zsh/files/dot.zshrc
>  create mode 100644 meta-oe/recipes-shells/zsh/files/pcre-pkgconfig.patch
>  create mode 100644 meta-oe/recipes-shells/zsh/files/zprofile
>  create mode 100644 meta-oe/recipes-shells/zsh/files/zsh_profile.sh
>  create mode 100644 meta-oe/recipes-shells/zsh/files/zshrc
>
> diff --git a/meta-oe/recipes-shells/zsh/files/configure.ac.patch b/meta-oe/recipes-shells/zsh/files/configure.ac.patch
> new file mode 100644
> index 0000000000..8e479cd23c
> --- /dev/null
> +++ b/meta-oe/recipes-shells/zsh/files/configure.ac.patch
> @@ -0,0 +1,172 @@
> +diff --git a/aclocal.m4 b/acinclude.m4
> +similarity index 98%
> +rename from aclocal.m4
> +rename to acinclude.m4
> +index e91be3c0d..26e0ae228 100644
> +--- a/aclocal.m4
> ++++ b/acinclude.m4
> +@@ -52,7 +52,7 @@ case "x$fp_cv_prog_cc_stdc" in
> + esac
> + ])
> +
> +-AC_DEFUN(AC_PROG_LN,
> ++AC_DEFUN([AC_PROG_LN],
> + [AC_MSG_CHECKING(whether ln works)
> + AC_CACHE_VAL(ac_cv_prog_LN,
> + [rm -f conftestdata conftestlink
> +@@ -64,14 +64,14 @@ then
> + else
> +   rm -f conftestdata
> +   ac_cv_prog_LN="cp"
> +-fi])dnl
> ++fi])
> + LN="$ac_cv_prog_LN"
> + if test "$ac_cv_prog_LN" = "ln"; then
> +   AC_MSG_RESULT(yes)
> + else
> +   AC_MSG_RESULT(no)
> + fi
> +-AC_SUBST(LN)dnl
> ++AC_SUBST(LN)
> + ])
> +
> + builtin(include, aczsh.m4)
> +diff --git a/aczsh.m4 b/aczsh.m4
> +index 0219ae2fb..3eb1ac6fc 100644
> +--- a/aczsh.m4
> ++++ b/aczsh.m4
> +@@ -38,7 +38,7 @@ dnl   This macro does not produce messages as it may be run several times
> + dnl   before finding the right type.
> + dnl
> +
> +-AC_DEFUN(zsh_64_BIT_TYPE,
> ++AC_DEFUN([zsh_64_BIT_TYPE],
> + [AC_TRY_RUN([
> + #ifdef HAVE_SYS_TYPES_H
> + #include <sys/types.h>
> +@@ -67,7 +67,7 @@ dnl
> + dnl Usage: zsh_SHARED_FUNCTION(name[,rettype[,paramtype]])
> + dnl
> +
> +-AC_DEFUN(zsh_SHARED_FUNCTION,
> ++AC_DEFUN([zsh_SHARED_FUNCTION],
> + [zsh_SHARED_SYMBOL($1, ifelse([$2], ,[int ],[$2]) $1 [(]ifelse([$3], ,[ ],[$3])[)], $1)])
> +
> + dnl
> +@@ -78,7 +78,7 @@ dnl
> + dnl Usage: zsh_SHARED_VARIABLE(name[,type])
> + dnl
> +
> +-AC_DEFUN(zsh_SHARED_VARIABLE,
> ++AC_DEFUN([zsh_SHARED_VARIABLE],
> + [zsh_SHARED_SYMBOL($1, ifelse([$2], ,[int ],[$2]) $1, [&$1])])
> +
> + dnl
> +@@ -94,7 +94,7 @@ dnl Usage: zsh_SHARED_SYMBOL(name,declaration,address)
> + dnl Sets zsh_cv_shared_$1 cache variable to yes/no
> + dnl
> +
> +-AC_DEFUN(zsh_SHARED_SYMBOL,
> ++AC_DEFUN([zsh_SHARED_SYMBOL],
> + [AC_CACHE_CHECK([if $1 is available in shared libraries],
> + zsh_cv_shared_$1,
> + [if test "$zsh_cv_func_dlsym_needs_underscore" = yes; then
> +@@ -184,7 +184,7 @@ dnl zsh_SYS_DYNAMIC_CLASH
> + dnl   Check whether symbol name clashes in shared libraries are acceptable.
> + dnl
> +
> +-AC_DEFUN(zsh_SYS_DYNAMIC_CLASH,
> ++AC_DEFUN([zsh_SYS_DYNAMIC_CLASH],
> + [AC_CACHE_CHECK([if name clashes in shared objects are OK],
> + zsh_cv_sys_dynamic_clash_ok,
> + [if test "$zsh_cv_func_dlsym_needs_underscore" = yes; then
> +@@ -259,7 +259,7 @@ dnl   Check whether symbols in one dynamically loaded library are
> + dnl   available to another dynamically loaded library.
> + dnl
> +
> +-AC_DEFUN(zsh_SYS_DYNAMIC_GLOBAL,
> ++AC_DEFUN([zsh_SYS_DYNAMIC_GLOBAL],
> + [AC_CACHE_CHECK([for working RTLD_GLOBAL],
> + zsh_cv_sys_dynamic_rtld_global,
> + [if test "$zsh_cv_func_dlsym_needs_underscore" = yes; then
> +@@ -329,7 +329,7 @@ dnl   Check whether symbols in the executable are available to dynamically
> + dnl   loaded libraries.
> + dnl
> +
> +-AC_DEFUN(zsh_SYS_DYNAMIC_EXECSYMS,
> ++AC_DEFUN([zsh_SYS_DYNAMIC_EXECSYMS],
> + [AC_CACHE_CHECK([whether symbols in the executable are available],
> + zsh_cv_sys_dynamic_execsyms,
> + [if test "$zsh_cv_func_dlsym_needs_underscore" = yes; then
> +@@ -398,7 +398,7 @@ dnl zsh_SYS_DYNAMIC_STRIP_EXE
> + dnl   Check whether it is safe to strip executables.
> + dnl
> +
> +-AC_DEFUN(zsh_SYS_DYNAMIC_STRIP_EXE,
> ++AC_DEFUN([zsh_SYS_DYNAMIC_STRIP_EXE],
> + [AC_REQUIRE([zsh_SYS_DYNAMIC_EXECSYMS])
> + AC_CACHE_CHECK([whether executables can be stripped],
> + zsh_cv_sys_dynamic_strip_exe,
> +@@ -471,7 +471,7 @@ dnl zsh_SYS_DYNAMIC_STRIP_EXE
> + dnl   Check whether it is safe to strip dynamically loaded libraries.
> + dnl
> +
> +-AC_DEFUN(zsh_SYS_DYNAMIC_STRIP_LIB,
> ++AC_DEFUN([zsh_SYS_DYNAMIC_STRIP_LIB],
> + [AC_CACHE_CHECK([whether libraries can be stripped],
> + zsh_cv_sys_dynamic_strip_lib,
> + [if test "$zsh_cv_func_dlsym_needs_underscore" = yes; then
> +@@ -535,7 +535,7 @@ dnl zsh_PATH_UTMP(filename)
> + dnl   Search for a specified utmp-type file.
> + dnl
> +
> +-AC_DEFUN(zsh_PATH_UTMP,
> ++AC_DEFUN([zsh_PATH_UTMP],
> + [AC_CACHE_CHECK([for $1 file], [zsh_cv_path_$1],
> + [for dir in /etc /usr/etc /var/adm /usr/adm /var/run /var/log ./conftest; do
> +   zsh_cv_path_$1=${dir}/$1
> +@@ -556,7 +556,7 @@ dnl zsh_TYPE_EXISTS(#includes, type name)
> + dnl   Check whether a specified type exists.
> + dnl
> +
> +-AC_DEFUN(zsh_TYPE_EXISTS,
> ++AC_DEFUN([zsh_TYPE_EXISTS],
> + [AC_CACHE_CHECK([for $2], [zsh_cv_type_exists_[]translit($2, [ ], [_])],
> + [AC_TRY_COMPILE([$1], [$2 testvar;],
> + [zsh_cv_type_exists_[]translit($2, [ ], [_])=yes],
> +@@ -575,7 +575,7 @@ dnl   Check whether a specified aggregate type exists and contains
> + dnl   a specified member.
> + dnl
> +
> +-AC_DEFUN(zsh_STRUCT_MEMBER,
> ++AC_DEFUN([zsh_STRUCT_MEMBER],
> + [AC_CACHE_CHECK([for $3 in $2], [zsh_cv_struct_member_[]translit($2, [ ], [_])_$3],
> + [AC_TRY_COMPILE([$1], [$2 testvar; testvar.$3;],
> + [zsh_cv_struct_member_[]translit($2, [ ], [_])_$3=yes],
> +@@ -595,7 +595,7 @@ dnl   After processing this macro, the configure script may refer to
> + dnl   and $tzsh_name, and @tzsh@ is defined for make substitutions.
> + dnl
> +
> +-AC_DEFUN(zsh_ARG_PROGRAM,
> ++AC_DEFUN([zsh_ARG_PROGRAM],
> + [AC_ARG_PROGRAM
> + # Un-double any \ or $ (doubled by AC_ARG_PROGRAM).
> + cat <<\EOF_SED > conftestsed
> +@@ -613,7 +613,7 @@ rm -f conftestsed
> + AC_SUBST(tzsh)dnl
> + ])
> +
> +-AC_DEFUN(zsh_COMPILE_FLAGS,
> ++AC_DEFUN([zsh_COMPILE_FLAGS],
> +     [AC_ARG_ENABLE(cppflags,
> +       AC_HELP_STRING([--enable-cppflags=...], [specify C preprocessor flags]),
> +       if test "$enableval" = "yes"
> +@@ -669,7 +669,7 @@ AC_DEFUN([zsh_CHECK_SOCKLEN_T],[
> + )
> +
> + dnl Check for limit $1 e.g. RLIMIT_RSS.
> +-AC_DEFUN(zsh_LIMIT_PRESENT,
> ++AC_DEFUN([zsh_LIMIT_PRESENT],
> + [AH_TEMPLATE([HAVE_]$1,
> + [Define to 1 if ]$1[ is present (whether or not as a macro).])
> + AC_CACHE_CHECK([for limit $1],
> diff --git a/meta-oe/recipes-shells/zsh/files/dot.zshrc b/meta-oe/recipes-shells/zsh/files/dot.zshrc
> new file mode 100644
> index 0000000000..e7a3f3d11d
> --- /dev/null
> +++ b/meta-oe/recipes-shells/zsh/files/dot.zshrc
> @@ -0,0 +1,16 @@
> +# ~/.zshrc: executed by zsh(1) for login shells.
> +
> +export PS1='%n@%m:%~%# '
> +umask 022
> +
> +# You may uncomment the following lines if you want `ls' to be colorized:
> +# export LS_OPTIONS='--color=auto'
> +# eval `dircolors`
> +# alias ls='ls $LS_OPTIONS'
> +# alias ll='ls $LS_OPTIONS -l'
> +# alias l='ls $LS_OPTIONS -lA'
> +#
> +# Some more alias to avoid making mistakes:
> +# alias rm='rm -i'
> +# alias cp='cp -i'
> +# alias mv='mv -i'
> diff --git a/meta-oe/recipes-shells/zsh/files/pcre-pkgconfig.patch b/meta-oe/recipes-shells/zsh/files/pcre-pkgconfig.patch
> new file mode 100644
> index 0000000000..51d0baf71d
> --- /dev/null
> +++ b/meta-oe/recipes-shells/zsh/files/pcre-pkgconfig.patch
> @@ -0,0 +1,49 @@
> +diff --git a/Src/Modules/pcre.mdd b/Src/Modules/pcre.mdd
> +index 6eb3c691b..12c10704e 100644
> +--- a/Src/Modules/pcre.mdd
> ++++ b/Src/Modules/pcre.mdd
> +@@ -1,5 +1,5 @@
> + name=zsh/pcre
> +-link=`if test x$enable_pcre = xyes && (pcre-config --version >/dev/null 2>/dev/null); then echo dynamic; else echo no; fi`
> ++link=`if test x$enable_pcre = xyes ; then echo dynamic; else echo no; fi`
> + load=no
> +
> + autofeatures="b:pcre_compile b:pcre_study b:pcre_match"
> +diff --git a/configure.ac b/configure.ac
> +index f2d65ecfc..5d7cabf89 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -661,17 +661,15 @@ AC_HEADER_TIME
> + AC_HEADER_STAT
> + AC_HEADER_SYS_WAIT
> +
> +-oldcflags="$CFLAGS"
> + if test x$enable_pcre = xyes; then
> +-AC_CHECK_PROG([PCRECONF], pcre-config, pcre-config)
> +-dnl Typically (meaning on this single RedHat 9 box in front of me)
> +-dnl pcre-config --cflags produces a -I output which needs to go into
> +-dnl CPPFLAGS else configure's preprocessor tests don't pick it up,
> +-dnl producing a warning.
> +-if test "x$ac_cv_prog_PCRECONF" = xpcre-config; then
> +-  CPPFLAGS="$CPPFLAGS `pcre-config --cflags`"
> +-fi
> ++PKG_CHECK_MODULES(PCREPKG, [libpcre], [
> ++               PCRE_LIB="${PCREPKG_LIBS}"
> ++               CPPFLAGS="$CPPFLAGS ${PCREPKG_CFLAGS}"
> ++               ], [
> ++               AC_MSG_ERROR([pcre not found, install the pcre-devel package or build with --disable-pcre])
> ++               ])
> + fi
> ++oldcflags="$CFLAGS"
> +
> + AC_CHECK_HEADERS(sys/time.h sys/times.h sys/select.h termcap.h termio.h \
> +                termios.h sys/param.h sys/filio.h string.h memory.h \
> +@@ -961,7 +959,7 @@ fi
> + if test x$enable_pcre = xyes; then
> + dnl pcre-config should probably be employed here
> + dnl AC_SEARCH_LIBS(pcre_compile, pcre)
> +-  LIBS="`$ac_cv_prog_PCRECONF --libs` $LIBS"
> ++  LIBS="$PCRE_LIB $LIBS"
> + fi
> +
> + dnl ---------------------
> diff --git a/meta-oe/recipes-shells/zsh/files/zprofile b/meta-oe/recipes-shells/zsh/files/zprofile
> new file mode 100644
> index 0000000000..1aeca53693
> --- /dev/null
> +++ b/meta-oe/recipes-shells/zsh/files/zprofile
> @@ -0,0 +1,6 @@
> +# /etc/zprofile: system-wide .profile file for the Z shell (zsh(1))
> +
> +[ -z "$PS1" ] || PS1='%n@%m:%~%# '
> +
> +# Source the system-wide bourne .profile
> +. @SYSCONFDIR@/profile
> diff --git a/meta-oe/recipes-shells/zsh/files/zsh_profile.sh b/meta-oe/recipes-shells/zsh/files/zsh_profile.sh
> new file mode 100644
> index 0000000000..eaa947e5bf
> --- /dev/null
> +++ b/meta-oe/recipes-shells/zsh/files/zsh_profile.sh
> @@ -0,0 +1,5 @@
> +# In case zsh is called as /bin/sh
> +if [ "$ZSH_VERSION" ]; then
> +       emulate -R zsh
> +       [ "PS1" = '\u@\h:\w\$ ' ] && PS1='%n@%m:%~%# '
> +fi
> diff --git a/meta-oe/recipes-shells/zsh/files/zshrc b/meta-oe/recipes-shells/zsh/files/zshrc
> new file mode 100644
> index 0000000000..37918523a9
> --- /dev/null
> +++ b/meta-oe/recipes-shells/zsh/files/zshrc
> @@ -0,0 +1,45 @@
> +# /etc/zshrc: system-wide .zshrc file for zsh(1).
> +#
> +# This file is sourced only for interactive shells. It
> +# should contain commands to set up aliases, functions,
> +# options, key bindings, etc.
> +#
> +# Global Order: zshenv, zprofile, zshrc, zlogin
> +
> +typeset -A key
> +
> +key[Home]=${terminfo[khome]}
> +key[End]=${terminfo[kend]}
> +key[Insert]=${terminfo[kich1]}
> +key[Delete]=${terminfo[kdch1]}
> +key[Up]=${terminfo[kcuu1]}
> +key[Down]=${terminfo[kcud1]}
> +key[Left]=${terminfo[kcub1]}
> +key[Right]=${terminfo[kcuf1]}
> +key[PageUp]=${terminfo[kpp]}
> +key[PageDown]=${terminfo[knp]}
> +
> +# setup key accordingly
> +[[ -n "${key[Home]}"    ]]  && bindkey -e "${key[Home]}"    beginning-of-line
> +[[ -n "${key[End]}"     ]]  && bindkey -e "${key[End]}"     end-of-line
> +[[ -n "${key[Insert]}"  ]]  && bindkey -e "${key[Insert]}"  overwrite-mode
> +[[ -n "${key[Delete]}"  ]]  && bindkey -e "${key[Delete]}"  delete-char
> +[[ -n "${key[Up]}"      ]]  && bindkey -e "${key[Up]}"      up-line-or-history
> +[[ -n "${key[Down]}"    ]]  && bindkey -e "${key[Down]}"    down-line-or-history
> +[[ -n "${key[Left]}"    ]]  && bindkey -e "${key[Left]}"    backward-char
> +[[ -n "${key[Right]}"   ]]  && bindkey -e "${key[Right]}"   forward-char
> +
> +unset key
> +
> +# Finally, make sure the terminal is in application mode, when zle is
> +# active. Only then are the values from $terminfo valid.
> +function zle-line-init () {
> +    emulate -L zsh
> +    printf '%s' $terminfo[smkx]
> +}
> +function zle-line-finish () {
> +    emulate -L zsh
> +    printf '%s' $terminfo[rmkx]
> +}
> +zle -N zle-line-init
> +zle -N zle-line-finish
> diff --git a/meta-oe/recipes-shells/zsh/zsh_5.8.bb b/meta-oe/recipes-shells/zsh/zsh_5.8.bb
> index 84df74cf82..4ddf67cf6e 100644
> --- a/meta-oe/recipes-shells/zsh/zsh_5.8.bb
> +++ b/meta-oe/recipes-shells/zsh/zsh_5.8.bb
> @@ -8,48 +8,172 @@ SECTION = "base/shell"
>  LICENSE = "zsh"
>  LIC_FILES_CHKSUM = "file://LICENCE;md5=1a4c4cda3e8096d2fd483ff2f4514fec"
>
> -DEPENDS = "ncurses bison-native libcap libpcre gdbm groff-native"
> +DEPENDS = "ncurses bison-native libcap groff-native"
>
> -SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/5.8/${BP}.tar.xz"
> -SRC_URI[sha256sum] = "dcc4b54cc5565670a65581760261c163d720991f0d06486da61f8d839b52de27"
> +SRC_URI = " \
> +    ${SOURCEFORGE_MIRROR}/${BPN}/${PV}/${BPN}-${PV}.tar.xz;name=zsh \
> +    ${SOURCEFORGE_MIRROR}/${BPN}/${PV}/${BPN}-${PV}-doc.tar.xz;name=zsh;name=zsh-doc \
> +    file://pcre-pkgconfig.patch \
> +    file://configure.ac.patch \
> +    file://zprofile \
> +    file://zshrc \
> +    file://zsh_profile.sh \
> +    file://dot.zshrc \
> +"
> +SRC_URI[zsh.sha256sum] = "dcc4b54cc5565670a65581760261c163d720991f0d06486da61f8d839b52de27"
> +SRC_URI[zsh-doc.sha256sum] = "9b4e939593cb5a76564d2be2e2bfbb6242509c0c56fd9ba52f5dba6cf06fdcc4"
> +
> +PACKAGECONFIG ??= " \
> +    nls pcre \
> +"
> +
> +PACKAGECONFIG[static] =    "--disable-dynamic,--enable-dynamic,,"
> +PACKAGECONFIG[maildir] =   "--enable-maildir-support,--disable-maildir-support,,"
> +PACKAGECONFIG[nls] =       "--enable-locale,--disable-locale,,"
> +PACKAGECONFIG[pcre] =      "--enable-pcre,--disable-pcre,libpcre,"
> +PACKAGECONFIG[gdbm] =      "--enable-gdbm,--disable-gdbm,gdbm,"
>
> -inherit autotools-brokensep gettext update-alternatives manpages
> +inherit autotools-brokensep gettext update-alternatives pkgconfig
> +
> +CACHED_CONFIGUREVARS += "zsh_cv_shared_environ=yes"
> +
> +# ZSH's configure script detect these wrong in the
> +# cross-compile case. It relies on compiling a program
> +# and running it to determine if zsh can be dlopened.
> +CACHED_CONFIGUREVARS += "zsh_cv_sys_dynamic_execsyms=yes"
> +CACHED_CONFIGUREVARS += "zsh_cv_sys_dynamic_rtld_global=yes"
> +CACHED_CONFIGUREVARS += "zsh_cv_sys_dynamic_strip_lib=yes"
>
>  EXTRA_OECONF = " \
>      --bindir=${base_bindir} \
>      --enable-etcdir=${sysconfdir} \
> -    --enable-fndir=${datadir}/${PN}/${PV}/functions \
> -    --enable-site-fndir=${datadir}/${PN}/site-functions \
> +    --enable-fndir=${datadir}/${BPN}/${PV}/functions \
> +    --enable-site-fndir=${datadir}/${BPN}/site-functions \
>      --with-term-lib='ncursesw ncurses' \
>      --with-tcsetpgrp \
>      --enable-cap \
>      --enable-multibyte \
> -    --disable-gdbm \
> -    --disable-dynamic \
> -    zsh_cv_shared_environ=yes \
> +    --enable-largefile \
> +    --disable-zsh-mem \
>  "
>
> +EXTRA_OECONF_append_libc-musl = " --enable-libc-musl "
> +
>  # Configure respects --bindir from EXTRA_OECONF, but then Src/Makefile will read bindir from environment
>  export bindir="${base_bindir}"
>
> -EXTRA_OEMAKE = "-e MAKEFLAGS="
> -
>  ALTERNATIVE_${PN} = "sh"
>  ALTERNATIVE_LINK_NAME[sh] = "${base_bindir}/sh"
>  ALTERNATIVE_TARGET[sh] = "${base_bindir}/${BPN}"
>  ALTERNATIVE_PRIORITY = "90"
>
> -export AUTOHEADER = "true"
> +do_configure_prepend() {
> +    #Always link in the line editor and exclude the example.
> +    cat > ${B}/config.modules << EOF
> +name=zsh/example modfile=Src/Modules/example.mdd link=no auto=no load=no
> +name=zsh/zle modfile=Src/Zle/zle.mdd link=static auto=no load=yes functions=Functions/Zle/*
> +name=zsh/zleparameter modfile=Src/Zle/zleparameter.mdd link=static auto=no load=yes
> +EOF
> +}
> +
> +do_compile_prepend() {
> +    # prevent make from regenerating the headers
> +    echo > ${S}/stamp-h.in
> +}
> +
> +do_install() {
> +    oe_runmake 'DESTDIR=${D}' install.bin install.modules install.fns install.runhelp
> +    oe_runmake 'DESTDIR=${D}' install.man || true
> +
> +    # Info dir listing isn't interesting at this point so remove it if it exists.
> +    if [ -e "${D}${infodir}/dir" ]; then
> +        rm -f ${D}${infodir}/dir
> +    fi
> +
> +    # Remove versioned zsh binary
> +    rm -f ${D}${base_bindir}/${BPN}-${PV} || true
> +
> +    # Set up restricted shells
> +    ln -sf ${BPN} ${D}${base_bindir}/rzsh
> +
> +    # install etc files
> +    install -m 0755 -d ${D}${sysconfdir}/profile.d ${D}${sysconfdir}/skel
> +    install -m 0644 ${WORKDIR}/zshrc ${D}${sysconfdir}/zshrc
> +    install -m 0644 ${WORKDIR}/zsh_profile.sh ${D}${sysconfdir}/profile.d/zsh.sh
> +    install -m 0644 ${WORKDIR}/dot.zshrc ${D}${sysconfdir}/skel/.zshrc
>
> -do_configure () {
> -    gnu-configize --force ${S}
> -    oe_runconf
> +    sed -e "s,@SYSCONFDIR@,${sysconfdir}," < ${WORKDIR}/zprofile > ${D}${sysconfdir}/zprofile
> +    echo '# /etc/zshenv: system-wide .zshenv file for zsh(1).' > ${D}${sysconfdir}/zshenv
> +    echo '# /etc/zlogin: system-wide .zlogin file for zsh(1).' > ${D}${sysconfdir}/zlogin
> +    echo '# /etc/zlogout: system-wide .zlogout file for zsh(1).' > ${D}${sysconfdir}/zlogout
> +    for s in zshenv zlogin zlogout zprofile
> +    do
> +      chmod 0644 ${D}${sysconfdir}/$s
> +      chown root:root ${D}${sysconfdir}/$s
> +    done
> +
> +    # install configuration examples
> +    install -d ${D}${datadir}/examples/${BPN}
> +    install -m 644 ${S}/StartupFiles/* ${D}${datadir}/examples/${BPN}
> +    rmdir --ignore-fail-on-non-empty ${D}/usr
>  }
>
>  pkg_postinst_${PN} () {
>      touch $D${sysconfdir}/shells
> +    grep -q "bin/rzsh" $D${sysconfdir}/shells || echo /bin/rzsh >> $D${sysconfdir}/shells
>      grep -q "bin/zsh" $D${sysconfdir}/shells || echo /bin/zsh >> $D${sysconfdir}/shells
>      grep -q "bin/sh" $D${sysconfdir}/shells || echo /bin/sh >> $D${sysconfdir}/shells
>  }
>
> -RRECOMMENDS_${PN} += "base-files"
> +pkg_postrm_${PN} () {
> +    sed -i "\!^${base_bindir}/rzsh$!d" $D${sysconfdir}/shells
> +    sed -i "\!^${base_bindir}/zsh$!d" $D${sysconfdir}/shells
> +}
> +
> +PACKAGE_BEFORE_PN =+ "${PN}-modules ${PN}-examples ${PN}-functions"
> +
> +FILES_${PN}-examples += "${datadir}/examples/${BPN}/*"
> +
> +FILES_${PN}-functions += " \
> +    ${datadir}/${BPN}/${PV}/scripts \
> +    ${datadir}/${BPN}/${PV}/functions \
> +    ${datadir}/${BPN}/site-functions \
> +"
> +
> +FILES_${PN}-dbg += "\
> +    ${libdir}/${BPN}/.debug/*.so \
> +    ${libdir}/${BPN}/${PV}/zsh/.debug/*.so \
> +    ${libdir}/${BPN}/${PV}/zsh/db/.debug/*.so \
> +    ${libdir}/${BPN}/${PV}/zsh/net/.debug/*.so \
> +    ${libdir}/${BPN}/${PV}/zsh/param/.debug/*.so \
> +"
> +
> +FILES_${PN}-doc += "\
> +    ${datadir}/${BPN}/${PV}/help \
> +    ${datadir}/${BPN}/${PV}/help/* \
> +"
> +
> +FILES_${PN}-modules += "\
> +    ${libdir}/${BPN}/*.so \
> +    ${libdir}/${BPN}/${PV}/zsh/*.so \
> +    ${libdir}/${BPN}/${PV}/zsh/db/*.so \
> +    ${libdir}/${BPN}/${PV}/zsh/net/*.so \
> +    ${libdir}/${BPN}/${PV}/zsh/param/*.so \
> +"
> +
> +CONFFILES_${PN} = " \
> +    ${sysconfdir}/zlogin \
> +    ${sysconfdir}/zlogout \
> +    ${sysconfdir}/zprofile \
> +    ${sysconfdir}/zshenv \
> +    ${sysconfdir}/zshrc \
> +    ${sysconfdir}/skel/.zshrc \
> +"
> +
> +RDEPENDS_${PN}-functions += "${PN}"
> +RDEPENDS_${PN}-modules += "${PN}"
> +RDEPENDS_${PN}-examples += "${PN}"
> +RRECOMMENDS_${PN} += "base-files ${PN}-functions ${PN}-modules"
> +RRECOMMENDS_${PN}-doc += "${PN}-examples"
> +
> +RPROVIDES_${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', '/bin/zsh /bin/sh', '', d)}"
> --
> 2.31.1
>
