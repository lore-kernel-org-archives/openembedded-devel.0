Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
 by mx.groups.io with SMTP id smtpd.web12.6180.1610211778000245457
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 09 Jan 2021 09:02:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UQVf/fB/;
 spf=pass (domain: gmail.com, ip: 209.85.161.42, mailfrom: toertel@gmail.com)
Received: by mail-oo1-f42.google.com with SMTP id y14so3151989oom.10
        for <openembedded-devel@lists.openembedded.org>; Sat, 09 Jan 2021 09:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UzU4Z2aRa4NFBnXV5e+Qop+g7MParMTSLJqaV6fnJ/0=;
        b=UQVf/fB/MOwQ6klCc94FiRqdkkwwiziIxafq07fNuN/7QAUmSsVueYyH9XYVFhtxDu
         8r2/pO7sIgpyAoFOBBQbG2BKNh0WqaVbG4Nw5AhvKzwcL76uLhI7YqHc+3EKikm29EIi
         4IUPDi8n7mo+t8zsFigzdRk8HHb0MbFUtEDTkWTwZVDJdnFwymgrkWl4r6zohwacZddN
         mUJ/9bfZtt2j1rlLc6HG6/oR8m4m/tVvHuDSUV9IiKJOFT9Fc+rQM1Va6aCZz02AVFq9
         BsQlK/dl8dl0hNaXVl0WEjq5ZyrsXtfR1WWL6j5Ye6+rOnI8a4EigqUwmz2rZpOOvUKZ
         TPyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UzU4Z2aRa4NFBnXV5e+Qop+g7MParMTSLJqaV6fnJ/0=;
        b=jff4Z+PyAKZI2qaIEFs1P1mmkDGCyV3EQ6KMH+O3ksNSPDHdgwDL/hHr9DfjEoRt6R
         pXTVHCSNmxNsPCb8ztcTbzLXZbezuBhlKdXNIXtLIYHnfPUI2EyXvZ9L+tU2wo0qdXpq
         jJFUnEHHSZZXRznuyJoEJXu+LwjJrW2oTd0Z9UFWCokGD3zjTCQgSvkgPF0c4ydyDhaU
         +qbzhlGgjNQC62UfH6zFndfVcaS4/XAlaxrnQBM0J9u3UOd3ICiCPHhPkI0fk+eIHx1b
         kbgmw+SoA69Tk2dudGAPKjpo9iGURw3xzEEKoYr8jc+oLcist7xB+APi8DWhsM4y7BPa
         eFyA==
X-Gm-Message-State: AOAM531lH8rcQyju3oytGGjIvpklXQR6GqpuO8DaJM00gHFeKSoN7C/U
	H9HYYdn08FuSDxeo44FO4Np9zUvTwkXFoLg56n8=
X-Google-Smtp-Source: ABdhPJzjOjgb3iP15X5wxW785nKPgiMbUMiDlwzzrCu9R8X8G+cDYFfU0DQG+6kneYKYu83Sdb4twCN6Xe6DDLgVwCo=
X-Received: by 2002:a4a:bc8d:: with SMTP id m13mr7794581oop.63.1610211777251;
 Sat, 09 Jan 2021 09:02:57 -0800 (PST)
MIME-Version: 1.0
References: <20201224065952.3714857-1-raj.khem@gmail.com>
In-Reply-To: <20201224065952.3714857-1-raj.khem@gmail.com>
From: "Mark Jonas" <toertel@gmail.com>
Date: Sat, 9 Jan 2021 18:02:46 +0100
Message-ID: <CAEE5dN1hqOm_2WepkQ+iDnRvwSvXv=r7TtkQJReueawV5QQ3Eg@mail.gmail.com>
Subject: Re: [meta-oe][PATCH v3] beep: Update to 1.4.9 in new repository
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hi Khem,

I wanted to create a patch for beep's mainline so it could be used in
meta-openembedded without your patch. That is, what hinders
compilation with Clang 11 and -Werror. To my astonishment the
unmodified beep v1.4.9 compiles just fine with clang-11 from
https://apt.llvm.org/ on Ubuntu 20.04. And it definitely fails when
building with meta-clang without your patch.

What is the difference between the two Clangs?

I have to admit that this is the first time I used clang.

$ clang-11 --version
Ubuntu clang version
11.0.1-++20201218093155+43ff75f2c3fe-1~exp1~20201218203809.158
Target: x86_64-pc-linux-gnu
Thread model: posix
InstalledDir: /usr/bin

$ make COMPILER_gcc=no COMPILER_clang=clang-11 LINKER_clang=clang-11
/bin/sed  -e s/@PACKAGE_TARNAME@/beep/g -e s/@PACKAGE_VERSION@/1.4.9/g
-e s/@DEFAULT_FREQ@/440/g -e s/@DEFAULT_LENGTH@/200/g -e
s/@DEFAULT_DELAY@/100/g -e 's|[@]pkgdocdir@|/usr/share/doc/beep|g' <
beep-config.h.in > beep-config.h.new
mv -f beep-config.h.new beep-config.h
clang-11 -MT beep-main.clang-o -MMD -MP -MF
.deps/beep-main.clang-o.dep   -DPACKAGE_TARNAME='"beep"'
-DPACKAGE_VERSION='"1.4.9"'    -Wall -Wextra -Weverything -Wno-padded
-std=gnu99 -pedantic -Werror -fsanitize=undefined -O -g -o
beep-main.clang-o -c beep-main.c
/bin/sed  -e s/@PACKAGE_TARNAME@/beep/g -e s/@PACKAGE_VERSION@/1.4.9/g
-e s/@DEFAULT_FREQ@/440/g -e s/@DEFAULT_LENGTH@/200/g -e
s/@DEFAULT_DELAY@/100/g -e 's|[@]pkgdocdir@|/usr/share/doc/beep|g' <
beep-usage.txt.in > beep-usage.txt.new
mv -f beep-usage.txt.new beep-usage.txt
echo '/* Auto-generated from `beep-usage.txt`. Modify that file
instead. */' > beep-usage.c
echo '#include "beep-usage.h"' >> beep-usage.c
echo 'char beep_usage[] =' >> beep-usage.c
set -e; IFS=""; while read line; do \
    printf '  "%s\\n"\n' "${line}" >> beep-usage.c; \
done < beep-usage.txt
echo '  ;' >> beep-usage.c
clang-11 -MT beep-usage.clang-o -MMD -MP -MF
.deps/beep-usage.clang-o.dep   -DPACKAGE_TARNAME='"beep"'
-DPACKAGE_VERSION='"1.4.9"'    -Wall -Wextra -Weverything -Wno-padded
-std=gnu99 -pedantic -Werror -fsanitize=undefined -O -g -o
beep-usage.clang-o -c beep-usage.c
clang-11  -Wall -Wextra -Weverything -Wno-padded -std=gnu99 -pedantic
-Werror -fsanitize=undefined -O -g   -o beep.clang beep-log.clang-o
beep-main.clang-o beep-library.clang-o beep-usage.clang-o
beep-drivers.clang-o beep-driver-console.clang-o
beep-driver-evdev.clang-o
cp -f beep.clang beep
/bin/sed  -e s/@PACKAGE_TARNAME@/beep/g -e s/@PACKAGE_VERSION@/1.4.9/g
-e s/@DEFAULT_FREQ@/440/g -e s/@DEFAULT_LENGTH@/200/g -e
s/@DEFAULT_DELAY@/100/g -e 's|[@]pkgdocdir@|/usr/share/doc/beep|g' <
beep.1.in > beep.1.new
mv -f beep.1.new beep.1

Cheers,
Mark

On Thu, Dec 24, 2020 at 7:59 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> From: Mark Jonas <toertel@gmail.com>
>
> The previous version 1.2.2 of beep was provided by
> http://johnath.com/beep and was released in 2002. The latest version 1.3
> was released 2010-07-13. On https://github.com/johnath/beep the
> development stopped 2013-02-07.
>
> In 2018 a developer worked on fixing CVE-2018-1000532 and realized that
> fixing this would be more than just a simple patch. Because the original
> repository was unmaintained for several years he created
> https://github.com/spkr-beep/beep as the new home for beep.
>
> Debian switched to the new beep with Buster.
>     https://packages.debian.org/buster/beep
>
> Alpine 3.11, Arch Linux, Fedora, and Ubuntu 20.04 also switched to the
> same new beep.
>
> Fix build with clang
>
> Signed-off-by: Mark Jonas <toertel@gmail.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v2: Fix build with clang
> v3: Do not build with both clang and gcc
>
>  meta-oe/recipes-extended/beep/beep_1.2.2.bb   | 25 --------
>  meta-oe/recipes-extended/beep/beep_1.4.9.bb   | 32 ++++++++++
>  ...rror-as-it-fails-with-newer-clang-11.patch | 63 +++++++++++++++++++
>  3 files changed, 95 insertions(+), 25 deletions(-)
>  delete mode 100644 meta-oe/recipes-extended/beep/beep_1.2.2.bb
>  create mode 100644 meta-oe/recipes-extended/beep/beep_1.4.9.bb
>  create mode 100644 meta-oe/recipes-extended/beep/files/0001-Do-not-use-Werror-as-it-fails-with-newer-clang-11.patch
>
> diff --git a/meta-oe/recipes-extended/beep/beep_1.2.2.bb b/meta-oe/recipes-extended/beep/beep_1.2.2.bb
> deleted file mode 100644
> index cafc869645..0000000000
> --- a/meta-oe/recipes-extended/beep/beep_1.2.2.bb
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -DESCRIPTION = "beep is a command line tool for linux that beeps the PC speaker"
> -LICENSE = "GPL-2.0"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
> -
> -SRC_URI = "\
> -    http://johnath.com/beep/beep-${PV}.tar.gz \
> -    file://linux-input.patch \
> -"
> -
> -SRC_URI[sha256sum] = "5c0445dac43950b7c7c3f235c6fb21f620ab3fd2f3aafaf09896e5730fcf49a1"
> -
> -S = "${WORKDIR}/${BPN}-${PV}"
> -
> -EXTRA_OEMAKE += 'CC="${CC}"'
> -EXTRA_OEMAKE += 'FLAGS="${CFLAGS} ${LDFLAGS}"'
> -
> -do_configure[noexec] = "1"
> -
> -do_compile() {
> -   oe_runmake
> -}
> -
> -do_install() {
> -       install -Dm 0755 ${B}/${PN} ${D}${bindir}/${PN}
> -}
> diff --git a/meta-oe/recipes-extended/beep/beep_1.4.9.bb b/meta-oe/recipes-extended/beep/beep_1.4.9.bb
> new file mode 100644
> index 0000000000..8d332b2faf
> --- /dev/null
> +++ b/meta-oe/recipes-extended/beep/beep_1.4.9.bb
> @@ -0,0 +1,32 @@
> +SUMMARY = "beep allows you to have the PC speaker issue beeps and beep patterns"
> +DESCRIPTION = "beep allows you to have the PC speaker issue beeps and beep \
> +patterns with given frequencies, durations, and spacing."
> +HOMEPAGE = "https://github.com/spkr-beep/beep"
> +BUGTRACKER = "https://github.com/spkr-beep/beep/issues"
> +
> +LICENSE = "GPLv2+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> +
> +SRC_URI = "git://github.com/spkr-beep/beep.git;protocol=https \
> +           file://0001-Do-not-use-Werror-as-it-fails-with-newer-clang-11.patch \
> +"
> +SRCREV = "8b85ddd09f73b9fd7caa5679298781a57af194ac"
> +S = "${WORKDIR}/git"
> +
> +EXTRA_OEMAKE = " \
> +    COMPILER_gcc='${CC}' \
> +    LINKER_gcc='${CC}' \
> +    COMPILER_clang=no \
> +    LINKER_clang=no \
> +"
> +
> +EXTRA_OEMAKE_toolchain-clang = " \
> +    COMPILER_clang='${CC}' \
> +    LINKER_clang='${CC}' \
> +    COMPILER_gcc=no \
> +    LINKER_gcc=no \
> +"
> +
> +do_install() {
> +    oe_runmake install DESTDIR='${D}'
> +}
> diff --git a/meta-oe/recipes-extended/beep/files/0001-Do-not-use-Werror-as-it-fails-with-newer-clang-11.patch b/meta-oe/recipes-extended/beep/files/0001-Do-not-use-Werror-as-it-fails-with-newer-clang-11.patch
> new file mode 100644
> index 0000000000..ba7681b983
> --- /dev/null
> +++ b/meta-oe/recipes-extended/beep/files/0001-Do-not-use-Werror-as-it-fails-with-newer-clang-11.patch
> @@ -0,0 +1,63 @@
> +From 6b33adfa438e35b6a37cfb0364274370ef4f9fc1 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Wed, 23 Dec 2020 18:00:59 +0000
> +Subject: [PATCH] Do not use -Werror as it fails with newer clang 11+
> +
> +Upstream-Status: Pending
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + GNUmakefile | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +--- a/GNUmakefile
> ++++ b/GNUmakefile
> +@@ -91,12 +91,13 @@ comma := ,
> + # If supported by COMPILER_gcc, add given flags to CFLAGS_gcc.
> + # Example usage:
> + #   $(eval $(call CHECK_CFLAGS_gcc,-fasynchronous-unwind-tables))
> +-define CHECK_CFLAGS_gcc
> +-CFLAGS_gcc += $$(if $$(shell if $$(COMPILER_gcc) $(1) -x c -o compile-check.gcc-o -c - < /dev/null > /dev/null 2>&1; then echo yes; else :; fi; rm -f compile-check.gcc-o > /dev/null 2>&1),$(1))
> +-endef
> +
> + COMPILER_gcc = gcc
> + LINKER_gcc = gcc
> ++ifneq ($(COMPILER_gcc),no)
> ++define CHECK_CFLAGS_gcc
> ++CFLAGS_gcc += $$(if $$(shell if $$(COMPILER_gcc) $(1) -x c -o compile-check.gcc-o -c - < /dev/null > /dev/null 2>&1; then echo yes; else :; fi; rm -f compile-check.gcc-o > /dev/null 2>&1),$(1))
> ++endef
> + CPPFLAGS_gcc =
> + CFLAGS_gcc =
> + CFLAGS_gcc += -std=gnu99 -pedantic
> +@@ -113,30 +114,24 @@ CFLAGS_gcc += -save-temps=obj
> + LDFLAGS_gcc =
> + LIBS_gcc =
> +
> +-ifneq ($(call pathsearch,$(COMPILER_gcc)),)
> +-ifneq ($(COMPILER_gcc)),no)
> + COMPILERS += gcc
> + endif
> +-endif
> +
> + COMPILER_clang = clang
> + LINKER_clang = clang
> ++
> ++ifneq ($(COMPILER_clang),no)
> + CPPFLAGS_clang =
> + CFLAGS_clang += -Wall -Wextra
> + CFLAGS_clang += -Weverything
> + CFLAGS_clang += -Wno-padded
> + CFLAGS_clang += -std=gnu99 -pedantic
> +-CFLAGS_clang += -Werror
> +-CFLAGS_clang += -fsanitize=undefined
> + CFLAGS_clang += -O -g
> + LDFLAGS_clang =
> + LIBS_clang =
> +
> +-ifneq ($(call pathsearch,$(COMPILER_clang)),)
> +-ifneq ($(COMPILER_clang),no)
> + COMPILERS += clang
> + endif
> +-endif
> +
> +
> + ########################################################################
> --
> 2.29.2
>
