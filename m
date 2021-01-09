Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web08.7814.1610219579620964051
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 09 Jan 2021 11:12:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KShf3hpQ;
 spf=pass (domain: gmail.com, ip: 209.85.210.43, mailfrom: toertel@gmail.com)
Received: by mail-ot1-f43.google.com with SMTP id a109so13136722otc.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 09 Jan 2021 11:12:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cCozIci3qJd/VPUvNDnSsgj3iMfo4wHPJnmkgv7QMq8=;
        b=KShf3hpQg9xT40ORfmfiJUlinEq3sYi2Xt1Labo1iKKBaSSIqEnvYH51v7dEpTCpk4
         OMKbJVhepnnb9UWqiMcEz2f6mQ+5M5D+Dxni++w0Ru9R3wN8tsBfpmow6GlafIlRBXif
         wZ+4wQiSAa4MUisP6OqrHX43YD0XvReSVyKhgbV3y0OY9bQKWoAUxLXn+U1yTADz7xrk
         pjr6cEyWSHUjz4iNoz/nSOvME3UYUDvm8d5vRaPP3BKOXM828JEDzccZcru1sgl9z9WO
         735rlpOthRAFxCnd5L98Evv7Cja5ZlxPNre/DL0CZZC9FBmEJ3zZQ6kUY9Dz/a0Tc6lZ
         PGtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cCozIci3qJd/VPUvNDnSsgj3iMfo4wHPJnmkgv7QMq8=;
        b=r4KfK7do2DJ0WVBSubidfrI861SY6qebkdy7t5DrWg1dpZ/XGhH7lFg7pH8tBYrdYp
         38wPBRvwM0LOeZa8lk5KAxNyRJbt0Jtb4FmdjBL8Vdn8ke+9gZrO0Kdbc2fn3mTAyFjR
         OjN8wEG5uoRc1AemxPjSX+1ph3stKzWtuMnel0btAgIf5oMU6z+miMsGfiN+LlXT1Kcl
         NM5nWWdwTi6k4eC1776A6xEYH07hcs1geyAZ0cGR23v4H6gXgMXmzjwYbiM+eZpQyGY6
         3Vy2OwFESrxJK6k/y26KysZLrKHp9y3uumrr3jhSzflljWLR1Owa8hGkvaEJIZqLhj8p
         iWww==
X-Gm-Message-State: AOAM531jORMNgoOeeNPjOJc96+SaVJX+jNTctEtaIPccozZNLq90Fwtj
	QUuEJ6MNURYUOtouTftvVMWRK1u5+c0o9J6vnLo=
X-Google-Smtp-Source: ABdhPJwIKYDdlKJi8qhcXVUYbr7OOdLyTx5JLxiE59IkOwIVnjY0vxb2sPZVts8ggwM1iQtOWFcVNt0HOCit5uo8aQI=
X-Received: by 2002:a9d:1c6:: with SMTP id e64mr6630954ote.50.1610219578924;
 Sat, 09 Jan 2021 11:12:58 -0800 (PST)
MIME-Version: 1.0
References: <20201224065952.3714857-1-raj.khem@gmail.com> <CAEE5dN1hqOm_2WepkQ+iDnRvwSvXv=r7TtkQJReueawV5QQ3Eg@mail.gmail.com>
 <CAMKF1sr6PkZg4OeRNdNzD_AFORC6Kq8_hKrNLOOyfkAhOnFXOA@mail.gmail.com>
In-Reply-To: <CAMKF1sr6PkZg4OeRNdNzD_AFORC6Kq8_hKrNLOOyfkAhOnFXOA@mail.gmail.com>
From: "Mark Jonas" <toertel@gmail.com>
Date: Sat, 9 Jan 2021 20:12:47 +0100
Message-ID: <CAEE5dN34tiuNwK5g96NDUv4Y43D7Xj6x-5bX6z5AHS+3x5x5Qg@mail.gmail.com>
Subject: Re: [meta-oe][PATCH v3] beep: Update to 1.4.9 in new repository
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hi Khem,

> This patch itself should be first upstreamed

I had some doubts that removing -Werror would find love upstream.
That's why I started investigating which warning caused the
compilation to break. And then I realized that the upstream already
compiles just fine with Clang 11 from https://apt.llvm.org/ on Ubuntu
20.04.

Additionally, the removal of
    ifneq ($(call pathsearch,$(COMPILER_clang)),)
breaks the use of make without additional parameters and
auto-detection of the installed compilers. That's what I experienced
on Ubuntu with gcc before installing clang.

> On Sat, Jan 9, 2021 at 9:02 AM Mark Jonas <toertel@gmail.com> wrote:
>>
>> Hi Khem,
>>
>> I wanted to create a patch for beep's mainline so it could be used in
>> meta-openembedded without your patch. That is, what hinders
>> compilation with Clang 11 and -Werror. To my astonishment the
>> unmodified beep v1.4.9 compiles just fine with clang-11 from
>> https://apt.llvm.org/ on Ubuntu 20.04. And it definitely fails when
>> building with meta-clang without your patch.
>>
>> What is the difference between the two Clangs?
>>
>> I have to admit that this is the first time I used clang.
>>
>> $ clang-11 --version
>> Ubuntu clang version
>> 11.0.1-++20201218093155+43ff75f2c3fe-1~exp1~20201218203809.158
>> Target: x86_64-pc-linux-gnu
>> Thread model: posix
>> InstalledDir: /usr/bin
>>
>> $ make COMPILER_gcc=no COMPILER_clang=clang-11 LINKER_clang=clang-11
>> /bin/sed  -e s/@PACKAGE_TARNAME@/beep/g -e s/@PACKAGE_VERSION@/1.4.9/g
>> -e s/@DEFAULT_FREQ@/440/g -e s/@DEFAULT_LENGTH@/200/g -e
>> s/@DEFAULT_DELAY@/100/g -e 's|[@]pkgdocdir@|/usr/share/doc/beep|g' <
>> beep-config.h.in > beep-config.h.new
>> mv -f beep-config.h.new beep-config.h
>> clang-11 -MT beep-main.clang-o -MMD -MP -MF
>> .deps/beep-main.clang-o.dep   -DPACKAGE_TARNAME='"beep"'
>> -DPACKAGE_VERSION='"1.4.9"'    -Wall -Wextra -Weverything -Wno-padded
>> -std=gnu99 -pedantic -Werror -fsanitize=undefined -O -g -o
>> beep-main.clang-o -c beep-main.c
>> /bin/sed  -e s/@PACKAGE_TARNAME@/beep/g -e s/@PACKAGE_VERSION@/1.4.9/g
>> -e s/@DEFAULT_FREQ@/440/g -e s/@DEFAULT_LENGTH@/200/g -e
>> s/@DEFAULT_DELAY@/100/g -e 's|[@]pkgdocdir@|/usr/share/doc/beep|g' <
>> beep-usage.txt.in > beep-usage.txt.new
>> mv -f beep-usage.txt.new beep-usage.txt
>> echo '/* Auto-generated from `beep-usage.txt`. Modify that file
>> instead. */' > beep-usage.c
>> echo '#include "beep-usage.h"' >> beep-usage.c
>> echo 'char beep_usage[] =' >> beep-usage.c
>> set -e; IFS=""; while read line; do \
>>     printf '  "%s\\n"\n' "${line}" >> beep-usage.c; \
>> done < beep-usage.txt
>> echo '  ;' >> beep-usage.c
>> clang-11 -MT beep-usage.clang-o -MMD -MP -MF
>> .deps/beep-usage.clang-o.dep   -DPACKAGE_TARNAME='"beep"'
>> -DPACKAGE_VERSION='"1.4.9"'    -Wall -Wextra -Weverything -Wno-padded
>> -std=gnu99 -pedantic -Werror -fsanitize=undefined -O -g -o
>> beep-usage.clang-o -c beep-usage.c
>> clang-11  -Wall -Wextra -Weverything -Wno-padded -std=gnu99 -pedantic
>> -Werror -fsanitize=undefined -O -g   -o beep.clang beep-log.clang-o
>> beep-main.clang-o beep-library.clang-o beep-usage.clang-o
>> beep-drivers.clang-o beep-driver-console.clang-o
>> beep-driver-evdev.clang-o
>> cp -f beep.clang beep
>> /bin/sed  -e s/@PACKAGE_TARNAME@/beep/g -e s/@PACKAGE_VERSION@/1.4.9/g
>> -e s/@DEFAULT_FREQ@/440/g -e s/@DEFAULT_LENGTH@/200/g -e
>> s/@DEFAULT_DELAY@/100/g -e 's|[@]pkgdocdir@|/usr/share/doc/beep|g' <
>> beep.1.in > beep.1.new
>> mv -f beep.1.new beep.1
>>
>> Cheers,
>> Mark
>>
>> On Thu, Dec 24, 2020 at 7:59 AM Khem Raj <raj.khem@gmail.com> wrote:
>> >
>> > From: Mark Jonas <toertel@gmail.com>
>> >
>> > The previous version 1.2.2 of beep was provided by
>> > http://johnath.com/beep and was released in 2002. The latest version 1.3
>> > was released 2010-07-13. On https://github.com/johnath/beep the
>> > development stopped 2013-02-07.
>> >
>> > In 2018 a developer worked on fixing CVE-2018-1000532 and realized that
>> > fixing this would be more than just a simple patch. Because the original
>> > repository was unmaintained for several years he created
>> > https://github.com/spkr-beep/beep as the new home for beep.
>> >
>> > Debian switched to the new beep with Buster.
>> >     https://packages.debian.org/buster/beep
>> >
>> > Alpine 3.11, Arch Linux, Fedora, and Ubuntu 20.04 also switched to the
>> > same new beep.
>> >
>> > Fix build with clang
>> >
>> > Signed-off-by: Mark Jonas <toertel@gmail.com>
>> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> > ---
>> > v2: Fix build with clang
>> > v3: Do not build with both clang and gcc
>> >
>> >  meta-oe/recipes-extended/beep/beep_1.2.2.bb   | 25 --------
>> >  meta-oe/recipes-extended/beep/beep_1.4.9.bb   | 32 ++++++++++
>> >  ...rror-as-it-fails-with-newer-clang-11.patch | 63 +++++++++++++++++++
>> >  3 files changed, 95 insertions(+), 25 deletions(-)
>> >  delete mode 100644 meta-oe/recipes-extended/beep/beep_1.2.2.bb
>> >  create mode 100644 meta-oe/recipes-extended/beep/beep_1.4.9.bb
>> >  create mode 100644 meta-oe/recipes-extended/beep/files/0001-Do-not-use-Werror-as-it-fails-with-newer-clang-11.patch
>> >
>> > diff --git a/meta-oe/recipes-extended/beep/beep_1.2.2.bb b/meta-oe/recipes-extended/beep/beep_1.2.2.bb
>> > deleted file mode 100644
>> > index cafc869645..0000000000
>> > --- a/meta-oe/recipes-extended/beep/beep_1.2.2.bb
>> > +++ /dev/null
>> > @@ -1,25 +0,0 @@
>> > -DESCRIPTION = "beep is a command line tool for linux that beeps the PC speaker"
>> > -LICENSE = "GPL-2.0"
>> > -LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
>> > -
>> > -SRC_URI = "\
>> > -    http://johnath.com/beep/beep-${PV}.tar.gz \
>> > -    file://linux-input.patch \
>> > -"
>> > -
>> > -SRC_URI[sha256sum] = "5c0445dac43950b7c7c3f235c6fb21f620ab3fd2f3aafaf09896e5730fcf49a1"
>> > -
>> > -S = "${WORKDIR}/${BPN}-${PV}"
>> > -
>> > -EXTRA_OEMAKE += 'CC="${CC}"'
>> > -EXTRA_OEMAKE += 'FLAGS="${CFLAGS} ${LDFLAGS}"'
>> > -
>> > -do_configure[noexec] = "1"
>> > -
>> > -do_compile() {
>> > -   oe_runmake
>> > -}
>> > -
>> > -do_install() {
>> > -       install -Dm 0755 ${B}/${PN} ${D}${bindir}/${PN}
>> > -}
>> > diff --git a/meta-oe/recipes-extended/beep/beep_1.4.9.bb b/meta-oe/recipes-extended/beep/beep_1.4.9.bb
>> > new file mode 100644
>> > index 0000000000..8d332b2faf
>> > --- /dev/null
>> > +++ b/meta-oe/recipes-extended/beep/beep_1.4.9.bb
>> > @@ -0,0 +1,32 @@
>> > +SUMMARY = "beep allows you to have the PC speaker issue beeps and beep patterns"
>> > +DESCRIPTION = "beep allows you to have the PC speaker issue beeps and beep \
>> > +patterns with given frequencies, durations, and spacing."
>> > +HOMEPAGE = "https://github.com/spkr-beep/beep"
>> > +BUGTRACKER = "https://github.com/spkr-beep/beep/issues"
>> > +
>> > +LICENSE = "GPLv2+"
>> > +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>> > +
>> > +SRC_URI = "git://github.com/spkr-beep/beep.git;protocol=https \
>> > +           file://0001-Do-not-use-Werror-as-it-fails-with-newer-clang-11.patch \
>> > +"
>> > +SRCREV = "8b85ddd09f73b9fd7caa5679298781a57af194ac"
>> > +S = "${WORKDIR}/git"
>> > +
>> > +EXTRA_OEMAKE = " \
>> > +    COMPILER_gcc='${CC}' \
>> > +    LINKER_gcc='${CC}' \
>> > +    COMPILER_clang=no \
>> > +    LINKER_clang=no \
>> > +"
>> > +
>> > +EXTRA_OEMAKE_toolchain-clang = " \
>> > +    COMPILER_clang='${CC}' \
>> > +    LINKER_clang='${CC}' \
>> > +    COMPILER_gcc=no \
>> > +    LINKER_gcc=no \
>> > +"
>> > +
>> > +do_install() {
>> > +    oe_runmake install DESTDIR='${D}'
>> > +}
>> > diff --git a/meta-oe/recipes-extended/beep/files/0001-Do-not-use-Werror-as-it-fails-with-newer-clang-11.patch b/meta-oe/recipes-extended/beep/files/0001-Do-not-use-Werror-as-it-fails-with-newer-clang-11.patch
>> > new file mode 100644
>> > index 0000000000..ba7681b983
>> > --- /dev/null
>> > +++ b/meta-oe/recipes-extended/beep/files/0001-Do-not-use-Werror-as-it-fails-with-newer-clang-11.patch
>> > @@ -0,0 +1,63 @@
>> > +From 6b33adfa438e35b6a37cfb0364274370ef4f9fc1 Mon Sep 17 00:00:00 2001
>> > +From: Khem Raj <raj.khem@gmail.com>
>> > +Date: Wed, 23 Dec 2020 18:00:59 +0000
>> > +Subject: [PATCH] Do not use -Werror as it fails with newer clang 11+
>> > +
>> > +Upstream-Status: Pending
>> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> > +---
>> > + GNUmakefile | 1 -
>> > + 1 file changed, 1 deletion(-)
>> > +
>> > +--- a/GNUmakefile
>> > ++++ b/GNUmakefile
>> > +@@ -91,12 +91,13 @@ comma := ,
>> > + # If supported by COMPILER_gcc, add given flags to CFLAGS_gcc.
>> > + # Example usage:
>> > + #   $(eval $(call CHECK_CFLAGS_gcc,-fasynchronous-unwind-tables))
>> > +-define CHECK_CFLAGS_gcc
>> > +-CFLAGS_gcc += $$(if $$(shell if $$(COMPILER_gcc) $(1) -x c -o compile-check.gcc-o -c - < /dev/null > /dev/null 2>&1; then echo yes; else :; fi; rm -f compile-check.gcc-o > /dev/null 2>&1),$(1))
>> > +-endef
>> > +
>> > + COMPILER_gcc = gcc
>> > + LINKER_gcc = gcc
>> > ++ifneq ($(COMPILER_gcc),no)
>> > ++define CHECK_CFLAGS_gcc
>> > ++CFLAGS_gcc += $$(if $$(shell if $$(COMPILER_gcc) $(1) -x c -o compile-check.gcc-o -c - < /dev/null > /dev/null 2>&1; then echo yes; else :; fi; rm -f compile-check.gcc-o > /dev/null 2>&1),$(1))
>> > ++endef
>> > + CPPFLAGS_gcc =
>> > + CFLAGS_gcc =
>> > + CFLAGS_gcc += -std=gnu99 -pedantic
>> > +@@ -113,30 +114,24 @@ CFLAGS_gcc += -save-temps=obj
>> > + LDFLAGS_gcc =
>> > + LIBS_gcc =
>> > +
>> > +-ifneq ($(call pathsearch,$(COMPILER_gcc)),)
>> > +-ifneq ($(COMPILER_gcc)),no)
>> > + COMPILERS += gcc
>> > + endif
>> > +-endif
>> > +
>> > + COMPILER_clang = clang
>> > + LINKER_clang = clang
>> > ++
>> > ++ifneq ($(COMPILER_clang),no)
>> > + CPPFLAGS_clang =
>> > + CFLAGS_clang += -Wall -Wextra
>> > + CFLAGS_clang += -Weverything
>> > + CFLAGS_clang += -Wno-padded
>> > + CFLAGS_clang += -std=gnu99 -pedantic
>> > +-CFLAGS_clang += -Werror
>> > +-CFLAGS_clang += -fsanitize=undefined
>> > + CFLAGS_clang += -O -g
>> > + LDFLAGS_clang =
>> > + LIBS_clang =
>> > +
>> > +-ifneq ($(call pathsearch,$(COMPILER_clang)),)
>> > +-ifneq ($(COMPILER_clang),no)
>> > + COMPILERS += clang
>> > + endif
>> > +-endif
>> > +
>> > +
>> > + ########################################################################
>> > --
>> > 2.29.2
>> >
