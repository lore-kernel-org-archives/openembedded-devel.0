Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web12.8940.1610223383263589304
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 09 Jan 2021 12:16:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Vxr6k3+5;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id p5so5898218qvs.7
        for <openembedded-devel@lists.openembedded.org>; Sat, 09 Jan 2021 12:16:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8bVPPjWXDOHyyiE1kc78y9eBgnF1j7d2SM4vxsJBHFI=;
        b=Vxr6k3+5SFBHLGOHEPxOhH6er1sPs9sfQFDCwJaoV4CcOyIZuG/R1KKXejJsW107rZ
         B6lHvOrsmQRYvCFCkXVRsl56W+isoMVvkh+w6ibodksLQn4KgbJZ9lV2Q+8OLbNijlYJ
         +UAU8vLifju72YK0YUy2DMzjiXFB9xhjz1U/KdBk/C8pEBCHLdTcTZVZuaYy8eKJkx4S
         l9nGWuOdfDqUCFgoZgxAxhwK0Jx9eLnYGOeSIbNc1QQLy8S6Om/CC5Dwd0QMQ5cvOfsN
         awe4z0q9+pnMbE4Cs+pDVN3Rpk5os554Ta9F6fCdqEXdIQCZ25sqvzRcLVvDqi4irHIE
         INcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8bVPPjWXDOHyyiE1kc78y9eBgnF1j7d2SM4vxsJBHFI=;
        b=ZARrm8KyOJAN3X/g8ipHzRQsujfnNN1UH6km4h2/Ny518DCTNZH3rarx4hYJvKHzNt
         VM9QOm6najwqPQk7u0qPoEhk+1GcwGMfTLDdl8m7ycTbrhulNI+mKyHIgt7mimYgxNhJ
         J+XmOPmNK9+nRvIQGOF920Z7lPA+pTk3bPLoL4Sh+c21GCgQFt6zGcWs4/WSy8WLMYzy
         LCtq5twjssHGoLUgWjSKb9gX6VdIN0Z1rZfJAn8OSOR8KzJRXGFiU9d0leTvdaPpTLCr
         S4y0flVdssSB62vy2QVp/8hFXbpnSwXVv5c20TwHKStFC/jIlW0NK51iBiV3d/7NG1nv
         ymSA==
X-Gm-Message-State: AOAM533CjC7q5Dr7TV/Tr6Fi0SvlmAXQOv+OpwzgQbCkKPB9Ch03NXW+
	3dPn/BnkSsuLc4UYIkp7l1DmwZs+M9/GU40+e3E=
X-Google-Smtp-Source: ABdhPJwROlFfZ5i3CK1rcAfE/P2SSYC9aWZMW8keX74WtfP4YUd/WQxvKtMRo+dg8K3XkFq0SL7L2zBg5B8giQhdo+g=
X-Received: by 2002:a0c:ea34:: with SMTP id t20mr9369619qvp.5.1610223382288;
 Sat, 09 Jan 2021 12:16:22 -0800 (PST)
MIME-Version: 1.0
References: <20201224065952.3714857-1-raj.khem@gmail.com> <CAEE5dN1hqOm_2WepkQ+iDnRvwSvXv=r7TtkQJReueawV5QQ3Eg@mail.gmail.com>
 <CAMKF1sr6PkZg4OeRNdNzD_AFORC6Kq8_hKrNLOOyfkAhOnFXOA@mail.gmail.com> <CAEE5dN34tiuNwK5g96NDUv4Y43D7Xj6x-5bX6z5AHS+3x5x5Qg@mail.gmail.com>
In-Reply-To: <CAEE5dN34tiuNwK5g96NDUv4Y43D7Xj6x-5bX6z5AHS+3x5x5Qg@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 9 Jan 2021 12:16:11 -0800
Message-ID: <CAMKF1spL3TKjK6U2LbcVLTX5u_4fLL3KZNvgdTRaZX4NG7pbDA@mail.gmail.com>
Subject: Re: [meta-oe][PATCH v3] beep: Update to 1.4.9 in new repository
To: Mark Jonas <toertel@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000b5dc0005b87d588e"

--000000000000b5dc0005b87d588e
Content-Type: text/plain; charset="UTF-8"

On Sat, Jan 9, 2021 at 11:12 AM Mark Jonas <toertel@gmail.com> wrote:

> Hi Khem,
>
> > This patch itself should be first upstreamed
>
> I had some doubts that removing -Werror would find love upstream.
> That's why I started investigating which warning caused the
> compilation to break. And then I realized that the upstream already
> compiles just fine with Clang 11 from https://apt.llvm.org/ on Ubuntu
> 20.04.
>
> Additionally, the removal of
>     ifneq ($(call pathsearch,$(COMPILER_clang)),)
> breaks the use of make without additional parameters and
> auto-detection of the installed compilers. That's what I experienced
> on Ubuntu with gcc before installing clang.



It will compile fine for native builds because it does not consider cross
compiling this patch mainly makes it use compiler from environment firstly

Because I might have gcc and clang installed on my build host but only have
clang cross compiler and no gcc cross compiler it will break in such cases

Warnings happen because it then tries to use gcc specific options which
clang rejects and warns as unknown options

>
>
> > On Sat, Jan 9, 2021 at 9:02 AM Mark Jonas <toertel@gmail.com> wrote:
> >>
> >> Hi Khem,
> >>
> >> I wanted to create a patch for beep's mainline so it could be used in
> >> meta-openembedded without your patch. That is, what hinders
> >> compilation with Clang 11 and -Werror. To my astonishment the
> >> unmodified beep v1.4.9 compiles just fine with clang-11 from
> >> https://apt.llvm.org/ on Ubuntu 20.04. And it definitely fails when
> >> building with meta-clang without your patch.
> >>
> >> What is the difference between the two Clangs?
> >>
> >> I have to admit that this is the first time I used clang.
> >>
> >> $ clang-11 --version
> >> Ubuntu clang version
> >> 11.0.1-++20201218093155+43ff75f2c3fe-1~exp1~20201218203809.158
> >> Target: x86_64-pc-linux-gnu
> >> Thread model: posix
> >> InstalledDir: /usr/bin
> >>
> >> $ make COMPILER_gcc=no COMPILER_clang=clang-11 LINKER_clang=clang-11
> >> /bin/sed  -e s/@PACKAGE_TARNAME@/beep/g -e s/@PACKAGE_VERSION@/1.4.9/g
> >> -e s/@DEFAULT_FREQ@/440/g -e s/@DEFAULT_LENGTH@/200/g -e
> >> s/@DEFAULT_DELAY@/100/g -e 's|[@]pkgdocdir@|/usr/share/doc/beep|g' <
> >> beep-config.h.in > beep-config.h.new
> >> mv -f beep-config.h.new beep-config.h
> >> clang-11 -MT beep-main.clang-o -MMD -MP -MF
> >> .deps/beep-main.clang-o.dep   -DPACKAGE_TARNAME='"beep"'
> >> -DPACKAGE_VERSION='"1.4.9"'    -Wall -Wextra -Weverything -Wno-padded
> >> -std=gnu99 -pedantic -Werror -fsanitize=undefined -O -g -o
> >> beep-main.clang-o -c beep-main.c
> >> /bin/sed  -e s/@PACKAGE_TARNAME@/beep/g -e s/@PACKAGE_VERSION@/1.4.9/g
> >> -e s/@DEFAULT_FREQ@/440/g -e s/@DEFAULT_LENGTH@/200/g -e
> >> s/@DEFAULT_DELAY@/100/g -e 's|[@]pkgdocdir@|/usr/share/doc/beep|g' <
> >> beep-usage.txt.in > beep-usage.txt.new
> >> mv -f beep-usage.txt.new beep-usage.txt
> >> echo '/* Auto-generated from `beep-usage.txt`. Modify that file
> >> instead. */' > beep-usage.c
> >> echo '#include "beep-usage.h"' >> beep-usage.c
> >> echo 'char beep_usage[] =' >> beep-usage.c
> >> set -e; IFS=""; while read line; do \
> >>     printf '  "%s\\n"\n' "${line}" >> beep-usage.c; \
> >> done < beep-usage.txt
> >> echo '  ;' >> beep-usage.c
> >> clang-11 -MT beep-usage.clang-o -MMD -MP -MF
> >> .deps/beep-usage.clang-o.dep   -DPACKAGE_TARNAME='"beep"'
> >> -DPACKAGE_VERSION='"1.4.9"'    -Wall -Wextra -Weverything -Wno-padded
> >> -std=gnu99 -pedantic -Werror -fsanitize=undefined -O -g -o
> >> beep-usage.clang-o -c beep-usage.c
> >> clang-11  -Wall -Wextra -Weverything -Wno-padded -std=gnu99 -pedantic
> >> -Werror -fsanitize=undefined -O -g   -o beep.clang beep-log.clang-o
> >> beep-main.clang-o beep-library.clang-o beep-usage.clang-o
> >> beep-drivers.clang-o beep-driver-console.clang-o
> >> beep-driver-evdev.clang-o
> >> cp -f beep.clang beep
> >> /bin/sed  -e s/@PACKAGE_TARNAME@/beep/g -e s/@PACKAGE_VERSION@/1.4.9/g
> >> -e s/@DEFAULT_FREQ@/440/g -e s/@DEFAULT_LENGTH@/200/g -e
> >> s/@DEFAULT_DELAY@/100/g -e 's|[@]pkgdocdir@|/usr/share/doc/beep|g' <
> >> beep.1.in > beep.1.new
> >> mv -f beep.1.new beep.1
> >>
> >> Cheers,
> >> Mark
> >>
> >> On Thu, Dec 24, 2020 at 7:59 AM Khem Raj <raj.khem@gmail.com> wrote:
> >> >
> >> > From: Mark Jonas <toertel@gmail.com>
> >> >
> >> > The previous version 1.2.2 of beep was provided by
> >> > http://johnath.com/beep and was released in 2002. The latest version
> 1.3
> >> > was released 2010-07-13. On https://github.com/johnath/beep the
> >> > development stopped 2013-02-07.
> >> >
> >> > In 2018 a developer worked on fixing CVE-2018-1000532 and realized
> that
> >> > fixing this would be more than just a simple patch. Because the
> original
> >> > repository was unmaintained for several years he created
> >> > https://github.com/spkr-beep/beep as the new home for beep.
> >> >
> >> > Debian switched to the new beep with Buster.
> >> >     https://packages.debian.org/buster/beep
> >> >
> >> > Alpine 3.11, Arch Linux, Fedora, and Ubuntu 20.04 also switched to the
> >> > same new beep.
> >> >
> >> > Fix build with clang
> >> >
> >> > Signed-off-by: Mark Jonas <toertel@gmail.com>
> >> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> > ---
> >> > v2: Fix build with clang
> >> > v3: Do not build with both clang and gcc
> >> >
> >> >  meta-oe/recipes-extended/beep/beep_1.2.2.bb   | 25 --------
> >> >  meta-oe/recipes-extended/beep/beep_1.4.9.bb   | 32 ++++++++++
> >> >  ...rror-as-it-fails-with-newer-clang-11.patch | 63
> +++++++++++++++++++
> >> >  3 files changed, 95 insertions(+), 25 deletions(-)
> >> >  delete mode 100644 meta-oe/recipes-extended/beep/beep_1.2.2.bb
> >> >  create mode 100644 meta-oe/recipes-extended/beep/beep_1.4.9.bb
> >> >  create mode 100644
> meta-oe/recipes-extended/beep/files/0001-Do-not-use-Werror-as-it-fails-with-newer-clang-11.patch
> >> >
> >> > diff --git a/meta-oe/recipes-extended/beep/beep_1.2.2.bb
> b/meta-oe/recipes-extended/beep/beep_1.2.2.bb
> >> > deleted file mode 100644
> >> > index cafc869645..0000000000
> >> > --- a/meta-oe/recipes-extended/beep/beep_1.2.2.bb
> >> > +++ /dev/null
> >> > @@ -1,25 +0,0 @@
> >> > -DESCRIPTION = "beep is a command line tool for linux that beeps the
> PC speaker"
> >> > -LICENSE = "GPL-2.0"
> >> > -LIC_FILES_CHKSUM =
> "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
> >> > -
> >> > -SRC_URI = "\
> >> > -    http://johnath.com/beep/beep-${PV}.tar.gz \
> >> > -    file://linux-input.patch \
> >> > -"
> >> > -
> >> > -SRC_URI[sha256sum] =
> "5c0445dac43950b7c7c3f235c6fb21f620ab3fd2f3aafaf09896e5730fcf49a1"
> >> > -
> >> > -S = "${WORKDIR}/${BPN}-${PV}"
> >> > -
> >> > -EXTRA_OEMAKE += 'CC="${CC}"'
> >> > -EXTRA_OEMAKE += 'FLAGS="${CFLAGS} ${LDFLAGS}"'
> >> > -
> >> > -do_configure[noexec] = "1"
> >> > -
> >> > -do_compile() {
> >> > -   oe_runmake
> >> > -}
> >> > -
> >> > -do_install() {
> >> > -       install -Dm 0755 ${B}/${PN} ${D}${bindir}/${PN}
> >> > -}
> >> > diff --git a/meta-oe/recipes-extended/beep/beep_1.4.9.bb
> b/meta-oe/recipes-extended/beep/beep_1.4.9.bb
> >> > new file mode 100644
> >> > index 0000000000..8d332b2faf
> >> > --- /dev/null
> >> > +++ b/meta-oe/recipes-extended/beep/beep_1.4.9.bb
> >> > @@ -0,0 +1,32 @@
> >> > +SUMMARY = "beep allows you to have the PC speaker issue beeps and
> beep patterns"
> >> > +DESCRIPTION = "beep allows you to have the PC speaker issue beeps
> and beep \
> >> > +patterns with given frequencies, durations, and spacing."
> >> > +HOMEPAGE = "https://github.com/spkr-beep/beep"
> >> > +BUGTRACKER = "https://github.com/spkr-beep/beep/issues"
> >> > +
> >> > +LICENSE = "GPLv2+"
> >> > +LIC_FILES_CHKSUM =
> "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> >> > +
> >> > +SRC_URI = "git://github.com/spkr-beep/beep.git;protocol=https \
> >> > +
>  file://0001-Do-not-use-Werror-as-it-fails-with-newer-clang-11.patch \
> >> > +"
> >> > +SRCREV = "8b85ddd09f73b9fd7caa5679298781a57af194ac"
> >> > +S = "${WORKDIR}/git"
> >> > +
> >> > +EXTRA_OEMAKE = " \
> >> > +    COMPILER_gcc='${CC}' \
> >> > +    LINKER_gcc='${CC}' \
> >> > +    COMPILER_clang=no \
> >> > +    LINKER_clang=no \
> >> > +"
> >> > +
> >> > +EXTRA_OEMAKE_toolchain-clang = " \
> >> > +    COMPILER_clang='${CC}' \
> >> > +    LINKER_clang='${CC}' \
> >> > +    COMPILER_gcc=no \
> >> > +    LINKER_gcc=no \
> >> > +"
> >> > +
> >> > +do_install() {
> >> > +    oe_runmake install DESTDIR='${D}'
> >> > +}
> >> > diff --git
> a/meta-oe/recipes-extended/beep/files/0001-Do-not-use-Werror-as-it-fails-with-newer-clang-11.patch
> b/meta-oe/recipes-extended/beep/files/0001-Do-not-use-Werror-as-it-fails-with-newer-clang-11.patch
> >> > new file mode 100644
> >> > index 0000000000..ba7681b983
> >> > --- /dev/null
> >> > +++
> b/meta-oe/recipes-extended/beep/files/0001-Do-not-use-Werror-as-it-fails-with-newer-clang-11.patch
> >> > @@ -0,0 +1,63 @@
> >> > +From 6b33adfa438e35b6a37cfb0364274370ef4f9fc1 Mon Sep 17 00:00:00
> 2001
> >> > +From: Khem Raj <raj.khem@gmail.com>
> >> > +Date: Wed, 23 Dec 2020 18:00:59 +0000
> >> > +Subject: [PATCH] Do not use -Werror as it fails with newer clang 11+
> >> > +
> >> > +Upstream-Status: Pending
> >> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> > +---
> >> > + GNUmakefile | 1 -
> >> > + 1 file changed, 1 deletion(-)
> >> > +
> >> > +--- a/GNUmakefile
> >> > ++++ b/GNUmakefile
> >> > +@@ -91,12 +91,13 @@ comma := ,
> >> > + # If supported by COMPILER_gcc, add given flags to CFLAGS_gcc.
> >> > + # Example usage:
> >> > + #   $(eval $(call CHECK_CFLAGS_gcc,-fasynchronous-unwind-tables))
> >> > +-define CHECK_CFLAGS_gcc
> >> > +-CFLAGS_gcc += $$(if $$(shell if $$(COMPILER_gcc) $(1) -x c -o
> compile-check.gcc-o -c - < /dev/null > /dev/null 2>&1; then echo yes; else
> :; fi; rm -f compile-check.gcc-o > /dev/null 2>&1),$(1))
> >> > +-endef
> >> > +
> >> > + COMPILER_gcc = gcc
> >> > + LINKER_gcc = gcc
> >> > ++ifneq ($(COMPILER_gcc),no)
> >> > ++define CHECK_CFLAGS_gcc
> >> > ++CFLAGS_gcc += $$(if $$(shell if $$(COMPILER_gcc) $(1) -x c -o
> compile-check.gcc-o -c - < /dev/null > /dev/null 2>&1; then echo yes; else
> :; fi; rm -f compile-check.gcc-o > /dev/null 2>&1),$(1))
> >> > ++endef
> >> > + CPPFLAGS_gcc =
> >> > + CFLAGS_gcc =
> >> > + CFLAGS_gcc += -std=gnu99 -pedantic
> >> > +@@ -113,30 +114,24 @@ CFLAGS_gcc += -save-temps=obj
> >> > + LDFLAGS_gcc =
> >> > + LIBS_gcc =
> >> > +
> >> > +-ifneq ($(call pathsearch,$(COMPILER_gcc)),)
> >> > +-ifneq ($(COMPILER_gcc)),no)
> >> > + COMPILERS += gcc
> >> > + endif
> >> > +-endif
> >> > +
> >> > + COMPILER_clang = clang
> >> > + LINKER_clang = clang
> >> > ++
> >> > ++ifneq ($(COMPILER_clang),no)
> >> > + CPPFLAGS_clang =
> >> > + CFLAGS_clang += -Wall -Wextra
> >> > + CFLAGS_clang += -Weverything
> >> > + CFLAGS_clang += -Wno-padded
> >> > + CFLAGS_clang += -std=gnu99 -pedantic
> >> > +-CFLAGS_clang += -Werror
> >> > +-CFLAGS_clang += -fsanitize=undefined
> >> > + CFLAGS_clang += -O -g
> >> > + LDFLAGS_clang =
> >> > + LIBS_clang =
> >> > +
> >> > +-ifneq ($(call pathsearch,$(COMPILER_clang)),)
> >> > +-ifneq ($(COMPILER_clang),no)
> >> > + COMPILERS += clang
> >> > + endif
> >> > +-endif
> >> > +
> >> > +
> >> > +
> ########################################################################
> >> > --
> >> > 2.29.2
> >> >
>

--000000000000b5dc0005b87d588e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sat, Jan 9, 2021 at 11:12 AM Mark Jonas &lt;<a href=3D"m=
ailto:toertel@gmail.com">toertel@gmail.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">Hi Khem,<br>
<br>
&gt; This patch itself should be first upstreamed<br>
<br>
I had some doubts that removing -Werror would find love upstream.<br>
That&#39;s why I started investigating which warning caused the<br>
compilation to break. And then I realized that the upstream already<br>
compiles just fine with Clang 11 from <a href=3D"https://apt.llvm.org/" rel=
=3D"noreferrer" target=3D"_blank">https://apt.llvm.org/</a> on Ubuntu<br>
20.04.<br>
<br>
Additionally, the removal of<br>
=C2=A0 =C2=A0 ifneq ($(call pathsearch,$(COMPILER_clang)),)<br>
breaks the use of make without additional parameters and<br>
auto-detection of the installed compilers. That&#39;s what I experienced<br=
>
on Ubuntu with gcc before installing clang.</blockquote><div dir=3D"auto"><=
br></div><div dir=3D"auto"><br></div><div dir=3D"auto">It will compile fine=
 for native builds because it does not consider cross compiling this patch =
mainly makes it use compiler from environment firstly</div><div dir=3D"auto=
"><br></div><div dir=3D"auto">Because I might have gcc and clang installed =
on my build host but only have clang cross compiler and no gcc cross compil=
er it will break in such cases</div><div dir=3D"auto"><br></div><div dir=3D=
"auto">Warnings happen because it then tries to use gcc specific options wh=
ich clang rejects and warns as unknown options=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex" dir=3D"auto"><br>
<br>
&gt; On Sat, Jan 9, 2021 at 9:02 AM Mark Jonas &lt;<a href=3D"mailto:toerte=
l@gmail.com" target=3D"_blank">toertel@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Hi Khem,<br>
&gt;&gt;<br>
&gt;&gt; I wanted to create a patch for beep&#39;s mainline so it could be =
used in<br>
&gt;&gt; meta-openembedded without your patch. That is, what hinders<br>
&gt;&gt; compilation with Clang 11 and -Werror. To my astonishment the<br>
&gt;&gt; unmodified beep v1.4.9 compiles just fine with clang-11 from<br>
&gt;&gt; <a href=3D"https://apt.llvm.org/" rel=3D"noreferrer" target=3D"_bl=
ank">https://apt.llvm.org/</a> on Ubuntu 20.04. And it definitely fails whe=
n<br>
&gt;&gt; building with meta-clang without your patch.<br>
&gt;&gt;<br>
&gt;&gt; What is the difference between the two Clangs?<br>
&gt;&gt;<br>
&gt;&gt; I have to admit that this is the first time I used clang.<br>
&gt;&gt;<br>
&gt;&gt; $ clang-11 --version<br>
&gt;&gt; Ubuntu clang version<br>
&gt;&gt; 11.0.1-++20201218093155+43ff75f2c3fe-1~exp1~20201218203809.158<br>
&gt;&gt; Target: x86_64-pc-linux-gnu<br>
&gt;&gt; Thread model: posix<br>
&gt;&gt; InstalledDir: /usr/bin<br>
&gt;&gt;<br>
&gt;&gt; $ make COMPILER_gcc=3Dno COMPILER_clang=3Dclang-11 LINKER_clang=3D=
clang-11<br>
&gt;&gt; /bin/sed=C2=A0 -e s/@PACKAGE_TARNAME@/beep/g -e s/@PACKAGE_VERSION=
@/1.4.9/g<br>
&gt;&gt; -e s/@DEFAULT_FREQ@/440/g -e s/@DEFAULT_LENGTH@/200/g -e<br>
&gt;&gt; s/@DEFAULT_DELAY@/100/g -e &#39;s|[@]pkgdocdir@|/usr/share/doc/bee=
p|g&#39; &lt;<br>
&gt;&gt; <a href=3D"http://beep-config.h.in" rel=3D"noreferrer" target=3D"_=
blank">beep-config.h.in</a> &gt; beep-config.h.new<br>
&gt;&gt; mv -f beep-config.h.new beep-config.h<br>
&gt;&gt; clang-11 -MT beep-main.clang-o -MMD -MP -MF<br>
&gt;&gt; .deps/beep-main.clang-o.dep=C2=A0 =C2=A0-DPACKAGE_TARNAME=3D&#39;&=
quot;beep&quot;&#39;<br>
&gt;&gt; -DPACKAGE_VERSION=3D&#39;&quot;1.4.9&quot;&#39;=C2=A0 =C2=A0 -Wall=
 -Wextra -Weverything -Wno-padded<br>
&gt;&gt; -std=3Dgnu99 -pedantic -Werror -fsanitize=3Dundefined -O -g -o<br>
&gt;&gt; beep-main.clang-o -c beep-main.c<br>
&gt;&gt; /bin/sed=C2=A0 -e s/@PACKAGE_TARNAME@/beep/g -e s/@PACKAGE_VERSION=
@/1.4.9/g<br>
&gt;&gt; -e s/@DEFAULT_FREQ@/440/g -e s/@DEFAULT_LENGTH@/200/g -e<br>
&gt;&gt; s/@DEFAULT_DELAY@/100/g -e &#39;s|[@]pkgdocdir@|/usr/share/doc/bee=
p|g&#39; &lt;<br>
&gt;&gt; <a href=3D"http://beep-usage.txt.in" rel=3D"noreferrer" target=3D"=
_blank">beep-usage.txt.in</a> &gt; beep-usage.txt.new<br>
&gt;&gt; mv -f beep-usage.txt.new beep-usage.txt<br>
&gt;&gt; echo &#39;/* Auto-generated from `beep-usage.txt`. Modify that fil=
e<br>
&gt;&gt; instead. */&#39; &gt; beep-usage.c<br>
&gt;&gt; echo &#39;#include &quot;beep-usage.h&quot;&#39; &gt;&gt; beep-usa=
ge.c<br>
&gt;&gt; echo &#39;char beep_usage[] =3D&#39; &gt;&gt; beep-usage.c<br>
&gt;&gt; set -e; IFS=3D&quot;&quot;; while read line; do \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0printf &#39;=C2=A0 &quot;%s\\n&quot;\n&#39; &qu=
ot;${line}&quot; &gt;&gt; beep-usage.c; \<br>
&gt;&gt; done &lt; beep-usage.txt<br>
&gt;&gt; echo &#39;=C2=A0 ;&#39; &gt;&gt; beep-usage.c<br>
&gt;&gt; clang-11 -MT beep-usage.clang-o -MMD -MP -MF<br>
&gt;&gt; .deps/beep-usage.clang-o.dep=C2=A0 =C2=A0-DPACKAGE_TARNAME=3D&#39;=
&quot;beep&quot;&#39;<br>
&gt;&gt; -DPACKAGE_VERSION=3D&#39;&quot;1.4.9&quot;&#39;=C2=A0 =C2=A0 -Wall=
 -Wextra -Weverything -Wno-padded<br>
&gt;&gt; -std=3Dgnu99 -pedantic -Werror -fsanitize=3Dundefined -O -g -o<br>
&gt;&gt; beep-usage.clang-o -c beep-usage.c<br>
&gt;&gt; clang-11=C2=A0 -Wall -Wextra -Weverything -Wno-padded -std=3Dgnu99=
 -pedantic<br>
&gt;&gt; -Werror -fsanitize=3Dundefined -O -g=C2=A0 =C2=A0-o beep.clang bee=
p-log.clang-o<br>
&gt;&gt; beep-main.clang-o beep-library.clang-o beep-usage.clang-o<br>
&gt;&gt; beep-drivers.clang-o beep-driver-console.clang-o<br>
&gt;&gt; beep-driver-evdev.clang-o<br>
&gt;&gt; cp -f beep.clang beep<br>
&gt;&gt; /bin/sed=C2=A0 -e s/@PACKAGE_TARNAME@/beep/g -e s/@PACKAGE_VERSION=
@/1.4.9/g<br>
&gt;&gt; -e s/@DEFAULT_FREQ@/440/g -e s/@DEFAULT_LENGTH@/200/g -e<br>
&gt;&gt; s/@DEFAULT_DELAY@/100/g -e &#39;s|[@]pkgdocdir@|/usr/share/doc/bee=
p|g&#39; &lt;<br>
&gt;&gt; <a href=3D"http://beep.1.in" rel=3D"noreferrer" target=3D"_blank">=
beep.1.in</a> &gt; beep.1.new<br>
&gt;&gt; mv -f beep.1.new beep.1<br>
&gt;&gt;<br>
&gt;&gt; Cheers,<br>
&gt;&gt; Mark<br>
&gt;&gt;<br>
&gt;&gt; On Thu, Dec 24, 2020 at 7:59 AM Khem Raj &lt;<a href=3D"mailto:raj=
.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; From: Mark Jonas &lt;<a href=3D"mailto:toertel@gmail.com" tar=
get=3D"_blank">toertel@gmail.com</a>&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; The previous version 1.2.2 of beep was provided by<br>
&gt;&gt; &gt; <a href=3D"http://johnath.com/beep" rel=3D"noreferrer" target=
=3D"_blank">http://johnath.com/beep</a> and was released in 2002. The lates=
t version 1.3<br>
&gt;&gt; &gt; was released 2010-07-13. On <a href=3D"https://github.com/joh=
nath/beep" rel=3D"noreferrer" target=3D"_blank">https://github.com/johnath/=
beep</a> the<br>
&gt;&gt; &gt; development stopped 2013-02-07.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; In 2018 a developer worked on fixing CVE-2018-1000532 and rea=
lized that<br>
&gt;&gt; &gt; fixing this would be more than just a simple patch. Because t=
he original<br>
&gt;&gt; &gt; repository was unmaintained for several years he created<br>
&gt;&gt; &gt; <a href=3D"https://github.com/spkr-beep/beep" rel=3D"noreferr=
er" target=3D"_blank">https://github.com/spkr-beep/beep</a> as the new home=
 for beep.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Debian switched to the new beep with Buster.<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://packages.debian.org/bus=
ter/beep" rel=3D"noreferrer" target=3D"_blank">https://packages.debian.org/=
buster/beep</a><br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Alpine 3.11, Arch Linux, Fedora, and Ubuntu 20.04 also switch=
ed to the<br>
&gt;&gt; &gt; same new beep.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Fix build with clang<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Signed-off-by: Mark Jonas &lt;<a href=3D"mailto:toertel@gmail=
.com" target=3D"_blank">toertel@gmail.com</a>&gt;<br>
&gt;&gt; &gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.=
com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt; v2: Fix build with clang<br>
&gt;&gt; &gt; v3: Do not build with both clang and gcc<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 meta-oe/recipes-extended/beep/<a href=3D"http://beep_1.=
2.2.bb" rel=3D"noreferrer" target=3D"_blank">beep_1.2.2.bb</a>=C2=A0 =C2=A0=
| 25 --------<br>
&gt;&gt; &gt;=C2=A0 meta-oe/recipes-extended/beep/<a href=3D"http://beep_1.=
4.9.bb" rel=3D"noreferrer" target=3D"_blank">beep_1.4.9.bb</a>=C2=A0 =C2=A0=
| 32 ++++++++++<br>
&gt;&gt; &gt;=C2=A0 ...rror-as-it-fails-with-newer-clang-11.patch | 63 ++++=
+++++++++++++++<br>
&gt;&gt; &gt;=C2=A0 3 files changed, 95 insertions(+), 25 deletions(-)<br>
&gt;&gt; &gt;=C2=A0 delete mode 100644 meta-oe/recipes-extended/beep/<a hre=
f=3D"http://beep_1.2.2.bb" rel=3D"noreferrer" target=3D"_blank">beep_1.2.2.=
bb</a><br>
&gt;&gt; &gt;=C2=A0 create mode 100644 meta-oe/recipes-extended/beep/<a hre=
f=3D"http://beep_1.4.9.bb" rel=3D"noreferrer" target=3D"_blank">beep_1.4.9.=
bb</a><br>
&gt;&gt; &gt;=C2=A0 create mode 100644 meta-oe/recipes-extended/beep/files/=
0001-Do-not-use-Werror-as-it-fails-with-newer-clang-11.patch<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; diff --git a/meta-oe/recipes-extended/beep/<a href=3D"http://=
beep_1.2.2.bb" rel=3D"noreferrer" target=3D"_blank">beep_1.2.2.bb</a> b/met=
a-oe/recipes-extended/beep/<a href=3D"http://beep_1.2.2.bb" rel=3D"noreferr=
er" target=3D"_blank">beep_1.2.2.bb</a><br>
&gt;&gt; &gt; deleted file mode 100644<br>
&gt;&gt; &gt; index cafc869645..0000000000<br>
&gt;&gt; &gt; --- a/meta-oe/recipes-extended/beep/<a href=3D"http://beep_1.=
2.2.bb" rel=3D"noreferrer" target=3D"_blank">beep_1.2.2.bb</a><br>
&gt;&gt; &gt; +++ /dev/null<br>
&gt;&gt; &gt; @@ -1,25 +0,0 @@<br>
&gt;&gt; &gt; -DESCRIPTION =3D &quot;beep is a command line tool for linux =
that beeps the PC speaker&quot;<br>
&gt;&gt; &gt; -LICENSE =3D &quot;GPL-2.0&quot;<br>
&gt;&gt; &gt; -LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D0636e73ff021=
5e8d672dc4c32c317bb3&quot;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -SRC_URI =3D &quot;\<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 <a href=3D"http://johnath.com/beep/beep-$%7BPV=
%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://johnath.com/beep/be=
ep-${PV}.tar.gz</a> \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 file://linux-input.patch \<br>
&gt;&gt; &gt; -&quot;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -SRC_URI[sha256sum] =3D &quot;5c0445dac43950b7c7c3f235c6fb21f=
620ab3fd2f3aafaf09896e5730fcf49a1&quot;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -S =3D &quot;${WORKDIR}/${BPN}-${PV}&quot;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -EXTRA_OEMAKE +=3D &#39;CC=3D&quot;${CC}&quot;&#39;<br>
&gt;&gt; &gt; -EXTRA_OEMAKE +=3D &#39;FLAGS=3D&quot;${CFLAGS} ${LDFLAGS}&qu=
ot;&#39;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -do_configure[noexec] =3D &quot;1&quot;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -do_compile() {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0oe_runmake<br>
&gt;&gt; &gt; -}<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; -do_install() {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0install -Dm 0755 ${B}/${PN} ${D}$=
{bindir}/${PN}<br>
&gt;&gt; &gt; -}<br>
&gt;&gt; &gt; diff --git a/meta-oe/recipes-extended/beep/<a href=3D"http://=
beep_1.4.9.bb" rel=3D"noreferrer" target=3D"_blank">beep_1.4.9.bb</a> b/met=
a-oe/recipes-extended/beep/<a href=3D"http://beep_1.4.9.bb" rel=3D"noreferr=
er" target=3D"_blank">beep_1.4.9.bb</a><br>
&gt;&gt; &gt; new file mode 100644<br>
&gt;&gt; &gt; index 0000000000..8d332b2faf<br>
&gt;&gt; &gt; --- /dev/null<br>
&gt;&gt; &gt; +++ b/meta-oe/recipes-extended/beep/<a href=3D"http://beep_1.=
4.9.bb" rel=3D"noreferrer" target=3D"_blank">beep_1.4.9.bb</a><br>
&gt;&gt; &gt; @@ -0,0 +1,32 @@<br>
&gt;&gt; &gt; +SUMMARY =3D &quot;beep allows you to have the PC speaker iss=
ue beeps and beep patterns&quot;<br>
&gt;&gt; &gt; +DESCRIPTION =3D &quot;beep allows you to have the PC speaker=
 issue beeps and beep \<br>
&gt;&gt; &gt; +patterns with given frequencies, durations, and spacing.&quo=
t;<br>
&gt;&gt; &gt; +HOMEPAGE =3D &quot;<a href=3D"https://github.com/spkr-beep/b=
eep" rel=3D"noreferrer" target=3D"_blank">https://github.com/spkr-beep/beep=
</a>&quot;<br>
&gt;&gt; &gt; +BUGTRACKER =3D &quot;<a href=3D"https://github.com/spkr-beep=
/beep/issues" rel=3D"noreferrer" target=3D"_blank">https://github.com/spkr-=
beep/beep/issues</a>&quot;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +LICENSE =3D &quot;GPLv2+&quot;<br>
&gt;&gt; &gt; +LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Db234ee4d69f5=
fce4486a80fdaf4a4263&quot;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +SRC_URI =3D &quot;git://<a href=3D"http://github.com/spkr-be=
ep/beep.git;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github.c=
om/spkr-beep/beep.git;protocol=3Dhttps</a> \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Do-not-=
use-Werror-as-it-fails-with-newer-clang-11.patch \<br>
&gt;&gt; &gt; +&quot;<br>
&gt;&gt; &gt; +SRCREV =3D &quot;8b85ddd09f73b9fd7caa5679298781a57af194ac&qu=
ot;<br>
&gt;&gt; &gt; +S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +EXTRA_OEMAKE =3D &quot; \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 COMPILER_gcc=3D&#39;${CC}&#39; \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 LINKER_gcc=3D&#39;${CC}&#39; \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 COMPILER_clang=3Dno \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 LINKER_clang=3Dno \<br>
&gt;&gt; &gt; +&quot;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +EXTRA_OEMAKE_toolchain-clang =3D &quot; \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 COMPILER_clang=3D&#39;${CC}&#39; \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 LINKER_clang=3D&#39;${CC}&#39; \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 COMPILER_gcc=3Dno \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 LINKER_gcc=3Dno \<br>
&gt;&gt; &gt; +&quot;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +do_install() {<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 oe_runmake install DESTDIR=3D&#39;${D}&#39;<br=
>
&gt;&gt; &gt; +}<br>
&gt;&gt; &gt; diff --git a/meta-oe/recipes-extended/beep/files/0001-Do-not-=
use-Werror-as-it-fails-with-newer-clang-11.patch b/meta-oe/recipes-extended=
/beep/files/0001-Do-not-use-Werror-as-it-fails-with-newer-clang-11.patch<br=
>
&gt;&gt; &gt; new file mode 100644<br>
&gt;&gt; &gt; index 0000000000..ba7681b983<br>
&gt;&gt; &gt; --- /dev/null<br>
&gt;&gt; &gt; +++ b/meta-oe/recipes-extended/beep/files/0001-Do-not-use-Wer=
ror-as-it-fails-with-newer-clang-11.patch<br>
&gt;&gt; &gt; @@ -0,0 +1,63 @@<br>
&gt;&gt; &gt; +From 6b33adfa438e35b6a37cfb0364274370ef4f9fc1 Mon Sep 17 00:=
00:00 2001<br>
&gt;&gt; &gt; +From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;&gt; &gt; +Date: Wed, 23 Dec 2020 18:00:59 +0000<br>
&gt;&gt; &gt; +Subject: [PATCH] Do not use -Werror as it fails with newer c=
lang 11+<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Upstream-Status: Pending<br>
&gt;&gt; &gt; +Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail=
.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;&gt; &gt; +---<br>
&gt;&gt; &gt; + GNUmakefile | 1 -<br>
&gt;&gt; &gt; + 1 file changed, 1 deletion(-)<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +--- a/GNUmakefile<br>
&gt;&gt; &gt; ++++ b/GNUmakefile<br>
&gt;&gt; &gt; +@@ -91,12 +91,13 @@ comma :=3D ,<br>
&gt;&gt; &gt; + # If supported by COMPILER_gcc, add given flags to CFLAGS_g=
cc.<br>
&gt;&gt; &gt; + # Example usage:<br>
&gt;&gt; &gt; + #=C2=A0 =C2=A0$(eval $(call CHECK_CFLAGS_gcc,-fasynchronous=
-unwind-tables))<br>
&gt;&gt; &gt; +-define CHECK_CFLAGS_gcc<br>
&gt;&gt; &gt; +-CFLAGS_gcc +=3D $$(if $$(shell if $$(COMPILER_gcc) $(1) -x =
c -o compile-check.gcc-o -c - &lt; /dev/null &gt; /dev/null 2&gt;&amp;1; th=
en echo yes; else :; fi; rm -f compile-check.gcc-o &gt; /dev/null 2&gt;&amp=
;1),$(1))<br>
&gt;&gt; &gt; +-endef<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; + COMPILER_gcc =3D gcc<br>
&gt;&gt; &gt; + LINKER_gcc =3D gcc<br>
&gt;&gt; &gt; ++ifneq ($(COMPILER_gcc),no)<br>
&gt;&gt; &gt; ++define CHECK_CFLAGS_gcc<br>
&gt;&gt; &gt; ++CFLAGS_gcc +=3D $$(if $$(shell if $$(COMPILER_gcc) $(1) -x =
c -o compile-check.gcc-o -c - &lt; /dev/null &gt; /dev/null 2&gt;&amp;1; th=
en echo yes; else :; fi; rm -f compile-check.gcc-o &gt; /dev/null 2&gt;&amp=
;1),$(1))<br>
&gt;&gt; &gt; ++endef<br>
&gt;&gt; &gt; + CPPFLAGS_gcc =3D<br>
&gt;&gt; &gt; + CFLAGS_gcc =3D<br>
&gt;&gt; &gt; + CFLAGS_gcc +=3D -std=3Dgnu99 -pedantic<br>
&gt;&gt; &gt; +@@ -113,30 +114,24 @@ CFLAGS_gcc +=3D -save-temps=3Dobj<br>
&gt;&gt; &gt; + LDFLAGS_gcc =3D<br>
&gt;&gt; &gt; + LIBS_gcc =3D<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +-ifneq ($(call pathsearch,$(COMPILER_gcc)),)<br>
&gt;&gt; &gt; +-ifneq ($(COMPILER_gcc)),no)<br>
&gt;&gt; &gt; + COMPILERS +=3D gcc<br>
&gt;&gt; &gt; + endif<br>
&gt;&gt; &gt; +-endif<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; + COMPILER_clang =3D clang<br>
&gt;&gt; &gt; + LINKER_clang =3D clang<br>
&gt;&gt; &gt; ++<br>
&gt;&gt; &gt; ++ifneq ($(COMPILER_clang),no)<br>
&gt;&gt; &gt; + CPPFLAGS_clang =3D<br>
&gt;&gt; &gt; + CFLAGS_clang +=3D -Wall -Wextra<br>
&gt;&gt; &gt; + CFLAGS_clang +=3D -Weverything<br>
&gt;&gt; &gt; + CFLAGS_clang +=3D -Wno-padded<br>
&gt;&gt; &gt; + CFLAGS_clang +=3D -std=3Dgnu99 -pedantic<br>
&gt;&gt; &gt; +-CFLAGS_clang +=3D -Werror<br>
&gt;&gt; &gt; +-CFLAGS_clang +=3D -fsanitize=3Dundefined<br>
&gt;&gt; &gt; + CFLAGS_clang +=3D -O -g<br>
&gt;&gt; &gt; + LDFLAGS_clang =3D<br>
&gt;&gt; &gt; + LIBS_clang =3D<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +-ifneq ($(call pathsearch,$(COMPILER_clang)),)<br>
&gt;&gt; &gt; +-ifneq ($(COMPILER_clang),no)<br>
&gt;&gt; &gt; + COMPILERS +=3D clang<br>
&gt;&gt; &gt; + endif<br>
&gt;&gt; &gt; +-endif<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; + ###########################################################=
#############<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; 2.29.2<br>
&gt;&gt; &gt;<br>
</blockquote></div></div>

--000000000000b5dc0005b87d588e--
