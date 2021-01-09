Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web11.7478.1610217617774538980
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 09 Jan 2021 10:40:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KZSaAYFm;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id v5so8781152qtv.7
        for <openembedded-devel@lists.openembedded.org>; Sat, 09 Jan 2021 10:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VONXFsdQZ3I8nYZEelab1NeAyDOBQduAqBrObt+su80=;
        b=KZSaAYFmH1iHp3QBMEoelu+MWk1wTrB3gvHsJfkCoE0Zx2hAJAXhq5h3Igv8f+s58b
         Pv/Kx5eIpYQ1DCp4aGC0T4zWYgdwp3Y+VLBvYKkmSgVVTgG6zHA2iG7RIdo8Y4FgK22w
         GH6n0B6RFLCQzKxZyCwb24kQHzsQXur1CYmIjhcPG7BhLWTZfrDK8dqZx1s9yXn1b7H9
         VVBqdReY9Ukbl3Tf0fmWafaPjKedGaCI8oq6HNvxRL4unJzCHZ2KJJpbzbm88kqyDdIn
         P2WQkBBN954+SGxGpEckX5ALCvMN29YuwCJt9TBzXh647q7IAMjwcPReRdaiBP9DvYLM
         muGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VONXFsdQZ3I8nYZEelab1NeAyDOBQduAqBrObt+su80=;
        b=EraTU8vLem7gOwgcYUCIzEsb4F8rpKRSY1Cy0O7kT/cs2B2/JJWjIxuh0qLaNqqSd5
         dIPUTwBQDIZdWCTaMx6zLZx7yV+6sQS0k1LhDIJyjtCrbETQxH4aXVty8gy/hkRRhC1Q
         3cd14vUB+zh/cYhA1HRmlwOAp+EDVh2bxZyK7mFONv1Mxp3+RTATTFiWjMBc6OqrgeOH
         7UxE6k1JBGAUA8SO4Vv8NklkcmiR/xAht181pQexhqdy+fg8WROR8KFM+AqV2acnxkkL
         s4IxtNLQsrpoDu+VAoVg7mu7rSDCalMr0f/pnKFMD1ZudeBkbeZ9o9CvICk+Ou4KJoAF
         n1SA==
X-Gm-Message-State: AOAM530qKDzy0Y1fW6o95A+B/VaK0SUbeS9mBS9LQDnzotd/fC4ZfQd3
	2j7/U66QRTPaEoWX+WDWeqRJT2k9RpL8DwiOWb4=
X-Google-Smtp-Source: ABdhPJzLIOXo1smHznGXBpo0YYpyqhU+Do0YKAFIXbOJ21GnittAErYpngiQy4Zsj9/jSBqHVh8T1wRDfFmLl9bjrtw=
X-Received: by 2002:a05:622a:1c3:: with SMTP id t3mr8869516qtw.378.1610217616805;
 Sat, 09 Jan 2021 10:40:16 -0800 (PST)
MIME-Version: 1.0
References: <20201224065952.3714857-1-raj.khem@gmail.com> <CAEE5dN1hqOm_2WepkQ+iDnRvwSvXv=r7TtkQJReueawV5QQ3Eg@mail.gmail.com>
In-Reply-To: <CAEE5dN1hqOm_2WepkQ+iDnRvwSvXv=r7TtkQJReueawV5QQ3Eg@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 9 Jan 2021 10:40:05 -0800
Message-ID: <CAMKF1sr6PkZg4OeRNdNzD_AFORC6Kq8_hKrNLOOyfkAhOnFXOA@mail.gmail.com>
Subject: Re: [meta-oe][PATCH v3] beep: Update to 1.4.9 in new repository
To: Mark Jonas <toertel@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000000f940105b87c01b2"

--0000000000000f940105b87c01b2
Content-Type: text/plain; charset="UTF-8"

This patch itself should be first upstreamed

On Sat, Jan 9, 2021 at 9:02 AM Mark Jonas <toertel@gmail.com> wrote:

> Hi Khem,
>
> I wanted to create a patch for beep's mainline so it could be used in
> meta-openembedded without your patch. That is, what hinders
> compilation with Clang 11 and -Werror. To my astonishment the
> unmodified beep v1.4.9 compiles just fine with clang-11 from
> https://apt.llvm.org/ on Ubuntu 20.04. And it definitely fails when
> building with meta-clang without your patch.
>
> What is the difference between the two Clangs?
>
> I have to admit that this is the first time I used clang.
>
> $ clang-11 --version
> Ubuntu clang version
> 11.0.1-++20201218093155+43ff75f2c3fe-1~exp1~20201218203809.158
> Target: x86_64-pc-linux-gnu
> Thread model: posix
> InstalledDir: /usr/bin
>
> $ make COMPILER_gcc=no COMPILER_clang=clang-11 LINKER_clang=clang-11
> /bin/sed  -e s/@PACKAGE_TARNAME@/beep/g -e s/@PACKAGE_VERSION@/1.4.9/g
> -e s/@DEFAULT_FREQ@/440/g -e s/@DEFAULT_LENGTH@/200/g -e
> s/@DEFAULT_DELAY@/100/g -e 's|[@]pkgdocdir@|/usr/share/doc/beep|g' <
> beep-config.h.in > beep-config.h.new
> mv -f beep-config.h.new beep-config.h
> clang-11 -MT beep-main.clang-o -MMD -MP -MF
> .deps/beep-main.clang-o.dep   -DPACKAGE_TARNAME='"beep"'
> -DPACKAGE_VERSION='"1.4.9"'    -Wall -Wextra -Weverything -Wno-padded
> -std=gnu99 -pedantic -Werror -fsanitize=undefined -O -g -o
> beep-main.clang-o -c beep-main.c
> /bin/sed  -e s/@PACKAGE_TARNAME@/beep/g -e s/@PACKAGE_VERSION@/1.4.9/g
> -e s/@DEFAULT_FREQ@/440/g -e s/@DEFAULT_LENGTH@/200/g -e
> s/@DEFAULT_DELAY@/100/g -e 's|[@]pkgdocdir@|/usr/share/doc/beep|g' <
> beep-usage.txt.in > beep-usage.txt.new
> mv -f beep-usage.txt.new beep-usage.txt
> echo '/* Auto-generated from `beep-usage.txt`. Modify that file
> instead. */' > beep-usage.c
> echo '#include "beep-usage.h"' >> beep-usage.c
> echo 'char beep_usage[] =' >> beep-usage.c
> set -e; IFS=""; while read line; do \
>     printf '  "%s\\n"\n' "${line}" >> beep-usage.c; \
> done < beep-usage.txt
> echo '  ;' >> beep-usage.c
> clang-11 -MT beep-usage.clang-o -MMD -MP -MF
> .deps/beep-usage.clang-o.dep   -DPACKAGE_TARNAME='"beep"'
> -DPACKAGE_VERSION='"1.4.9"'    -Wall -Wextra -Weverything -Wno-padded
> -std=gnu99 -pedantic -Werror -fsanitize=undefined -O -g -o
> beep-usage.clang-o -c beep-usage.c
> clang-11  -Wall -Wextra -Weverything -Wno-padded -std=gnu99 -pedantic
> -Werror -fsanitize=undefined -O -g   -o beep.clang beep-log.clang-o
> beep-main.clang-o beep-library.clang-o beep-usage.clang-o
> beep-drivers.clang-o beep-driver-console.clang-o
> beep-driver-evdev.clang-o
> cp -f beep.clang beep
> /bin/sed  -e s/@PACKAGE_TARNAME@/beep/g -e s/@PACKAGE_VERSION@/1.4.9/g
> -e s/@DEFAULT_FREQ@/440/g -e s/@DEFAULT_LENGTH@/200/g -e
> s/@DEFAULT_DELAY@/100/g -e 's|[@]pkgdocdir@|/usr/share/doc/beep|g' <
> beep.1.in > beep.1.new
> mv -f beep.1.new beep.1
>
> Cheers,
> Mark
>
> On Thu, Dec 24, 2020 at 7:59 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > From: Mark Jonas <toertel@gmail.com>
> >
> > The previous version 1.2.2 of beep was provided by
> > http://johnath.com/beep and was released in 2002. The latest version 1.3
> > was released 2010-07-13. On https://github.com/johnath/beep the
> > development stopped 2013-02-07.
> >
> > In 2018 a developer worked on fixing CVE-2018-1000532 and realized that
> > fixing this would be more than just a simple patch. Because the original
> > repository was unmaintained for several years he created
> > https://github.com/spkr-beep/beep as the new home for beep.
> >
> > Debian switched to the new beep with Buster.
> >     https://packages.debian.org/buster/beep
> >
> > Alpine 3.11, Arch Linux, Fedora, and Ubuntu 20.04 also switched to the
> > same new beep.
> >
> > Fix build with clang
> >
> > Signed-off-by: Mark Jonas <toertel@gmail.com>
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> > v2: Fix build with clang
> > v3: Do not build with both clang and gcc
> >
> >  meta-oe/recipes-extended/beep/beep_1.2.2.bb   | 25 --------
> >  meta-oe/recipes-extended/beep/beep_1.4.9.bb   | 32 ++++++++++
> >  ...rror-as-it-fails-with-newer-clang-11.patch | 63 +++++++++++++++++++
> >  3 files changed, 95 insertions(+), 25 deletions(-)
> >  delete mode 100644 meta-oe/recipes-extended/beep/beep_1.2.2.bb
> >  create mode 100644 meta-oe/recipes-extended/beep/beep_1.4.9.bb
> >  create mode 100644
> meta-oe/recipes-extended/beep/files/0001-Do-not-use-Werror-as-it-fails-with-newer-clang-11.patch
> >
> > diff --git a/meta-oe/recipes-extended/beep/beep_1.2.2.bb
> b/meta-oe/recipes-extended/beep/beep_1.2.2.bb
> > deleted file mode 100644
> > index cafc869645..0000000000
> > --- a/meta-oe/recipes-extended/beep/beep_1.2.2.bb
> > +++ /dev/null
> > @@ -1,25 +0,0 @@
> > -DESCRIPTION = "beep is a command line tool for linux that beeps the PC
> speaker"
> > -LICENSE = "GPL-2.0"
> > -LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
> > -
> > -SRC_URI = "\
> > -    http://johnath.com/beep/beep-${PV}.tar.gz \
> > -    file://linux-input.patch \
> > -"
> > -
> > -SRC_URI[sha256sum] =
> "5c0445dac43950b7c7c3f235c6fb21f620ab3fd2f3aafaf09896e5730fcf49a1"
> > -
> > -S = "${WORKDIR}/${BPN}-${PV}"
> > -
> > -EXTRA_OEMAKE += 'CC="${CC}"'
> > -EXTRA_OEMAKE += 'FLAGS="${CFLAGS} ${LDFLAGS}"'
> > -
> > -do_configure[noexec] = "1"
> > -
> > -do_compile() {
> > -   oe_runmake
> > -}
> > -
> > -do_install() {
> > -       install -Dm 0755 ${B}/${PN} ${D}${bindir}/${PN}
> > -}
> > diff --git a/meta-oe/recipes-extended/beep/beep_1.4.9.bb
> b/meta-oe/recipes-extended/beep/beep_1.4.9.bb
> > new file mode 100644
> > index 0000000000..8d332b2faf
> > --- /dev/null
> > +++ b/meta-oe/recipes-extended/beep/beep_1.4.9.bb
> > @@ -0,0 +1,32 @@
> > +SUMMARY = "beep allows you to have the PC speaker issue beeps and beep
> patterns"
> > +DESCRIPTION = "beep allows you to have the PC speaker issue beeps and
> beep \
> > +patterns with given frequencies, durations, and spacing."
> > +HOMEPAGE = "https://github.com/spkr-beep/beep"
> > +BUGTRACKER = "https://github.com/spkr-beep/beep/issues"
> > +
> > +LICENSE = "GPLv2+"
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> > +
> > +SRC_URI = "git://github.com/spkr-beep/beep.git;protocol=https \
> > +
>  file://0001-Do-not-use-Werror-as-it-fails-with-newer-clang-11.patch \
> > +"
> > +SRCREV = "8b85ddd09f73b9fd7caa5679298781a57af194ac"
> > +S = "${WORKDIR}/git"
> > +
> > +EXTRA_OEMAKE = " \
> > +    COMPILER_gcc='${CC}' \
> > +    LINKER_gcc='${CC}' \
> > +    COMPILER_clang=no \
> > +    LINKER_clang=no \
> > +"
> > +
> > +EXTRA_OEMAKE_toolchain-clang = " \
> > +    COMPILER_clang='${CC}' \
> > +    LINKER_clang='${CC}' \
> > +    COMPILER_gcc=no \
> > +    LINKER_gcc=no \
> > +"
> > +
> > +do_install() {
> > +    oe_runmake install DESTDIR='${D}'
> > +}
> > diff --git
> a/meta-oe/recipes-extended/beep/files/0001-Do-not-use-Werror-as-it-fails-with-newer-clang-11.patch
> b/meta-oe/recipes-extended/beep/files/0001-Do-not-use-Werror-as-it-fails-with-newer-clang-11.patch
> > new file mode 100644
> > index 0000000000..ba7681b983
> > --- /dev/null
> > +++
> b/meta-oe/recipes-extended/beep/files/0001-Do-not-use-Werror-as-it-fails-with-newer-clang-11.patch
> > @@ -0,0 +1,63 @@
> > +From 6b33adfa438e35b6a37cfb0364274370ef4f9fc1 Mon Sep 17 00:00:00 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Wed, 23 Dec 2020 18:00:59 +0000
> > +Subject: [PATCH] Do not use -Werror as it fails with newer clang 11+
> > +
> > +Upstream-Status: Pending
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + GNUmakefile | 1 -
> > + 1 file changed, 1 deletion(-)
> > +
> > +--- a/GNUmakefile
> > ++++ b/GNUmakefile
> > +@@ -91,12 +91,13 @@ comma := ,
> > + # If supported by COMPILER_gcc, add given flags to CFLAGS_gcc.
> > + # Example usage:
> > + #   $(eval $(call CHECK_CFLAGS_gcc,-fasynchronous-unwind-tables))
> > +-define CHECK_CFLAGS_gcc
> > +-CFLAGS_gcc += $$(if $$(shell if $$(COMPILER_gcc) $(1) -x c -o
> compile-check.gcc-o -c - < /dev/null > /dev/null 2>&1; then echo yes; else
> :; fi; rm -f compile-check.gcc-o > /dev/null 2>&1),$(1))
> > +-endef
> > +
> > + COMPILER_gcc = gcc
> > + LINKER_gcc = gcc
> > ++ifneq ($(COMPILER_gcc),no)
> > ++define CHECK_CFLAGS_gcc
> > ++CFLAGS_gcc += $$(if $$(shell if $$(COMPILER_gcc) $(1) -x c -o
> compile-check.gcc-o -c - < /dev/null > /dev/null 2>&1; then echo yes; else
> :; fi; rm -f compile-check.gcc-o > /dev/null 2>&1),$(1))
> > ++endef
> > + CPPFLAGS_gcc =
> > + CFLAGS_gcc =
> > + CFLAGS_gcc += -std=gnu99 -pedantic
> > +@@ -113,30 +114,24 @@ CFLAGS_gcc += -save-temps=obj
> > + LDFLAGS_gcc =
> > + LIBS_gcc =
> > +
> > +-ifneq ($(call pathsearch,$(COMPILER_gcc)),)
> > +-ifneq ($(COMPILER_gcc)),no)
> > + COMPILERS += gcc
> > + endif
> > +-endif
> > +
> > + COMPILER_clang = clang
> > + LINKER_clang = clang
> > ++
> > ++ifneq ($(COMPILER_clang),no)
> > + CPPFLAGS_clang =
> > + CFLAGS_clang += -Wall -Wextra
> > + CFLAGS_clang += -Weverything
> > + CFLAGS_clang += -Wno-padded
> > + CFLAGS_clang += -std=gnu99 -pedantic
> > +-CFLAGS_clang += -Werror
> > +-CFLAGS_clang += -fsanitize=undefined
> > + CFLAGS_clang += -O -g
> > + LDFLAGS_clang =
> > + LIBS_clang =
> > +
> > +-ifneq ($(call pathsearch,$(COMPILER_clang)),)
> > +-ifneq ($(COMPILER_clang),no)
> > + COMPILERS += clang
> > + endif
> > +-endif
> > +
> > +
> > +
> ########################################################################
> > --
> > 2.29.2
> >
>

--0000000000000f940105b87c01b2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">This patch itself should be first upstreamed=C2=A0</div><=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Sat, Jan 9, 2021 at 9:02 AM Mark Jonas &lt;<a href=3D"mailto:toertel@gmail=
.com">toertel@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">Hi Khem,<br>
<br>
I wanted to create a patch for beep&#39;s mainline so it could be used in<b=
r>
meta-openembedded without your patch. That is, what hinders<br>
compilation with Clang 11 and -Werror. To my astonishment the<br>
unmodified beep v1.4.9 compiles just fine with clang-11 from<br>
<a href=3D"https://apt.llvm.org/" rel=3D"noreferrer" target=3D"_blank">http=
s://apt.llvm.org/</a> on Ubuntu 20.04. And it definitely fails when<br>
building with meta-clang without your patch.<br>
<br>
What is the difference between the two Clangs?<br>
<br>
I have to admit that this is the first time I used clang.<br>
<br>
$ clang-11 --version<br>
Ubuntu clang version<br>
11.0.1-++20201218093155+43ff75f2c3fe-1~exp1~20201218203809.158<br>
Target: x86_64-pc-linux-gnu<br>
Thread model: posix<br>
InstalledDir: /usr/bin<br>
<br>
$ make COMPILER_gcc=3Dno COMPILER_clang=3Dclang-11 LINKER_clang=3Dclang-11<=
br>
/bin/sed=C2=A0 -e s/@PACKAGE_TARNAME@/beep/g -e s/@PACKAGE_VERSION@/1.4.9/g=
<br>
-e s/@DEFAULT_FREQ@/440/g -e s/@DEFAULT_LENGTH@/200/g -e<br>
s/@DEFAULT_DELAY@/100/g -e &#39;s|[@]pkgdocdir@|/usr/share/doc/beep|g&#39; =
&lt;<br>
<a href=3D"http://beep-config.h.in" rel=3D"noreferrer" target=3D"_blank">be=
ep-config.h.in</a> &gt; beep-config.h.new<br>
mv -f beep-config.h.new beep-config.h<br>
clang-11 -MT beep-main.clang-o -MMD -MP -MF<br>
.deps/beep-main.clang-o.dep=C2=A0 =C2=A0-DPACKAGE_TARNAME=3D&#39;&quot;beep=
&quot;&#39;<br>
-DPACKAGE_VERSION=3D&#39;&quot;1.4.9&quot;&#39;=C2=A0 =C2=A0 -Wall -Wextra =
-Weverything -Wno-padded<br>
-std=3Dgnu99 -pedantic -Werror -fsanitize=3Dundefined -O -g -o<br>
beep-main.clang-o -c beep-main.c<br>
/bin/sed=C2=A0 -e s/@PACKAGE_TARNAME@/beep/g -e s/@PACKAGE_VERSION@/1.4.9/g=
<br>
-e s/@DEFAULT_FREQ@/440/g -e s/@DEFAULT_LENGTH@/200/g -e<br>
s/@DEFAULT_DELAY@/100/g -e &#39;s|[@]pkgdocdir@|/usr/share/doc/beep|g&#39; =
&lt;<br>
<a href=3D"http://beep-usage.txt.in" rel=3D"noreferrer" target=3D"_blank">b=
eep-usage.txt.in</a> &gt; beep-usage.txt.new<br>
mv -f beep-usage.txt.new beep-usage.txt<br>
echo &#39;/* Auto-generated from `beep-usage.txt`. Modify that file<br>
instead. */&#39; &gt; beep-usage.c<br>
echo &#39;#include &quot;beep-usage.h&quot;&#39; &gt;&gt; beep-usage.c<br>
echo &#39;char beep_usage[] =3D&#39; &gt;&gt; beep-usage.c<br>
set -e; IFS=3D&quot;&quot;; while read line; do \<br>
=C2=A0 =C2=A0 printf &#39;=C2=A0 &quot;%s\\n&quot;\n&#39; &quot;${line}&quo=
t; &gt;&gt; beep-usage.c; \<br>
done &lt; beep-usage.txt<br>
echo &#39;=C2=A0 ;&#39; &gt;&gt; beep-usage.c<br>
clang-11 -MT beep-usage.clang-o -MMD -MP -MF<br>
.deps/beep-usage.clang-o.dep=C2=A0 =C2=A0-DPACKAGE_TARNAME=3D&#39;&quot;bee=
p&quot;&#39;<br>
-DPACKAGE_VERSION=3D&#39;&quot;1.4.9&quot;&#39;=C2=A0 =C2=A0 -Wall -Wextra =
-Weverything -Wno-padded<br>
-std=3Dgnu99 -pedantic -Werror -fsanitize=3Dundefined -O -g -o<br>
beep-usage.clang-o -c beep-usage.c<br>
clang-11=C2=A0 -Wall -Wextra -Weverything -Wno-padded -std=3Dgnu99 -pedanti=
c<br>
-Werror -fsanitize=3Dundefined -O -g=C2=A0 =C2=A0-o beep.clang beep-log.cla=
ng-o<br>
beep-main.clang-o beep-library.clang-o beep-usage.clang-o<br>
beep-drivers.clang-o beep-driver-console.clang-o<br>
beep-driver-evdev.clang-o<br>
cp -f beep.clang beep<br>
/bin/sed=C2=A0 -e s/@PACKAGE_TARNAME@/beep/g -e s/@PACKAGE_VERSION@/1.4.9/g=
<br>
-e s/@DEFAULT_FREQ@/440/g -e s/@DEFAULT_LENGTH@/200/g -e<br>
s/@DEFAULT_DELAY@/100/g -e &#39;s|[@]pkgdocdir@|/usr/share/doc/beep|g&#39; =
&lt;<br>
<a href=3D"http://beep.1.in" rel=3D"noreferrer" target=3D"_blank">beep.1.in=
</a> &gt; beep.1.new<br>
mv -f beep.1.new beep.1<br>
<br>
Cheers,<br>
Mark<br>
<br>
On Thu, Dec 24, 2020 at 7:59 AM Khem Raj &lt;<a href=3D"mailto:raj.khem@gma=
il.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Mark Jonas &lt;<a href=3D"mailto:toertel@gmail.com" target=3D"_b=
lank">toertel@gmail.com</a>&gt;<br>
&gt;<br>
&gt; The previous version 1.2.2 of beep was provided by<br>
&gt; <a href=3D"http://johnath.com/beep" rel=3D"noreferrer" target=3D"_blan=
k">http://johnath.com/beep</a> and was released in 2002. The latest version=
 1.3<br>
&gt; was released 2010-07-13. On <a href=3D"https://github.com/johnath/beep=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/johnath/beep</a> =
the<br>
&gt; development stopped 2013-02-07.<br>
&gt;<br>
&gt; In 2018 a developer worked on fixing CVE-2018-1000532 and realized tha=
t<br>
&gt; fixing this would be more than just a simple patch. Because the origin=
al<br>
&gt; repository was unmaintained for several years he created<br>
&gt; <a href=3D"https://github.com/spkr-beep/beep" rel=3D"noreferrer" targe=
t=3D"_blank">https://github.com/spkr-beep/beep</a> as the new home for beep=
.<br>
&gt;<br>
&gt; Debian switched to the new beep with Buster.<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://packages.debian.org/buster/beep"=
 rel=3D"noreferrer" target=3D"_blank">https://packages.debian.org/buster/be=
ep</a><br>
&gt;<br>
&gt; Alpine 3.11, Arch Linux, Fedora, and Ubuntu 20.04 also switched to the=
<br>
&gt; same new beep.<br>
&gt;<br>
&gt; Fix build with clang<br>
&gt;<br>
&gt; Signed-off-by: Mark Jonas &lt;<a href=3D"mailto:toertel@gmail.com" tar=
get=3D"_blank">toertel@gmail.com</a>&gt;<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; v2: Fix build with clang<br>
&gt; v3: Do not build with both clang and gcc<br>
&gt;<br>
&gt;=C2=A0 meta-oe/recipes-extended/beep/<a href=3D"http://beep_1.2.2.bb" r=
el=3D"noreferrer" target=3D"_blank">beep_1.2.2.bb</a>=C2=A0 =C2=A0| 25 ----=
----<br>
&gt;=C2=A0 meta-oe/recipes-extended/beep/<a href=3D"http://beep_1.4.9.bb" r=
el=3D"noreferrer" target=3D"_blank">beep_1.4.9.bb</a>=C2=A0 =C2=A0| 32 ++++=
++++++<br>
&gt;=C2=A0 ...rror-as-it-fails-with-newer-clang-11.patch | 63 +++++++++++++=
++++++<br>
&gt;=C2=A0 3 files changed, 95 insertions(+), 25 deletions(-)<br>
&gt;=C2=A0 delete mode 100644 meta-oe/recipes-extended/beep/<a href=3D"http=
://beep_1.2.2.bb" rel=3D"noreferrer" target=3D"_blank">beep_1.2.2.bb</a><br=
>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-extended/beep/<a href=3D"http=
://beep_1.4.9.bb" rel=3D"noreferrer" target=3D"_blank">beep_1.4.9.bb</a><br=
>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-extended/beep/files/0001-Do-n=
ot-use-Werror-as-it-fails-with-newer-clang-11.patch<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-extended/beep/<a href=3D"http://beep_1.2.=
2.bb" rel=3D"noreferrer" target=3D"_blank">beep_1.2.2.bb</a> b/meta-oe/reci=
pes-extended/beep/<a href=3D"http://beep_1.2.2.bb" rel=3D"noreferrer" targe=
t=3D"_blank">beep_1.2.2.bb</a><br>
&gt; deleted file mode 100644<br>
&gt; index cafc869645..0000000000<br>
&gt; --- a/meta-oe/recipes-extended/beep/<a href=3D"http://beep_1.2.2.bb" r=
el=3D"noreferrer" target=3D"_blank">beep_1.2.2.bb</a><br>
&gt; +++ /dev/null<br>
&gt; @@ -1,25 +0,0 @@<br>
&gt; -DESCRIPTION =3D &quot;beep is a command line tool for linux that beep=
s the PC speaker&quot;<br>
&gt; -LICENSE =3D &quot;GPL-2.0&quot;<br>
&gt; -LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D0636e73ff0215e8d672dc=
4c32c317bb3&quot;<br>
&gt; -<br>
&gt; -SRC_URI =3D &quot;\<br>
&gt; -=C2=A0 =C2=A0 <a href=3D"http://johnath.com/beep/beep-$%7BPV%7D.tar.g=
z" rel=3D"noreferrer" target=3D"_blank">http://johnath.com/beep/beep-${PV}.=
tar.gz</a> \<br>
&gt; -=C2=A0 =C2=A0 file://linux-input.patch \<br>
&gt; -&quot;<br>
&gt; -<br>
&gt; -SRC_URI[sha256sum] =3D &quot;5c0445dac43950b7c7c3f235c6fb21f620ab3fd2=
f3aafaf09896e5730fcf49a1&quot;<br>
&gt; -<br>
&gt; -S =3D &quot;${WORKDIR}/${BPN}-${PV}&quot;<br>
&gt; -<br>
&gt; -EXTRA_OEMAKE +=3D &#39;CC=3D&quot;${CC}&quot;&#39;<br>
&gt; -EXTRA_OEMAKE +=3D &#39;FLAGS=3D&quot;${CFLAGS} ${LDFLAGS}&quot;&#39;<=
br>
&gt; -<br>
&gt; -do_configure[noexec] =3D &quot;1&quot;<br>
&gt; -<br>
&gt; -do_compile() {<br>
&gt; -=C2=A0 =C2=A0oe_runmake<br>
&gt; -}<br>
&gt; -<br>
&gt; -do_install() {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0install -Dm 0755 ${B}/${PN} ${D}${bindir}/=
${PN}<br>
&gt; -}<br>
&gt; diff --git a/meta-oe/recipes-extended/beep/<a href=3D"http://beep_1.4.=
9.bb" rel=3D"noreferrer" target=3D"_blank">beep_1.4.9.bb</a> b/meta-oe/reci=
pes-extended/beep/<a href=3D"http://beep_1.4.9.bb" rel=3D"noreferrer" targe=
t=3D"_blank">beep_1.4.9.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000000..8d332b2faf<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-extended/beep/<a href=3D"http://beep_1.4.9.bb" r=
el=3D"noreferrer" target=3D"_blank">beep_1.4.9.bb</a><br>
&gt; @@ -0,0 +1,32 @@<br>
&gt; +SUMMARY =3D &quot;beep allows you to have the PC speaker issue beeps =
and beep patterns&quot;<br>
&gt; +DESCRIPTION =3D &quot;beep allows you to have the PC speaker issue be=
eps and beep \<br>
&gt; +patterns with given frequencies, durations, and spacing.&quot;<br>
&gt; +HOMEPAGE =3D &quot;<a href=3D"https://github.com/spkr-beep/beep" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/spkr-beep/beep</a>&quo=
t;<br>
&gt; +BUGTRACKER =3D &quot;<a href=3D"https://github.com/spkr-beep/beep/iss=
ues" rel=3D"noreferrer" target=3D"_blank">https://github.com/spkr-beep/beep=
/issues</a>&quot;<br>
&gt; +<br>
&gt; +LICENSE =3D &quot;GPLv2+&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Db234ee4d69f5fce4486a8=
0fdaf4a4263&quot;<br>
&gt; +<br>
&gt; +SRC_URI =3D &quot;git://<a href=3D"http://github.com/spkr-beep/beep.g=
it;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github.com/spkr-b=
eep/beep.git;protocol=3Dhttps</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Do-not-use-Werro=
r-as-it-fails-with-newer-clang-11.patch \<br>
&gt; +&quot;<br>
&gt; +SRCREV =3D &quot;8b85ddd09f73b9fd7caa5679298781a57af194ac&quot;<br>
&gt; +S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; +<br>
&gt; +EXTRA_OEMAKE =3D &quot; \<br>
&gt; +=C2=A0 =C2=A0 COMPILER_gcc=3D&#39;${CC}&#39; \<br>
&gt; +=C2=A0 =C2=A0 LINKER_gcc=3D&#39;${CC}&#39; \<br>
&gt; +=C2=A0 =C2=A0 COMPILER_clang=3Dno \<br>
&gt; +=C2=A0 =C2=A0 LINKER_clang=3Dno \<br>
&gt; +&quot;<br>
&gt; +<br>
&gt; +EXTRA_OEMAKE_toolchain-clang =3D &quot; \<br>
&gt; +=C2=A0 =C2=A0 COMPILER_clang=3D&#39;${CC}&#39; \<br>
&gt; +=C2=A0 =C2=A0 LINKER_clang=3D&#39;${CC}&#39; \<br>
&gt; +=C2=A0 =C2=A0 COMPILER_gcc=3Dno \<br>
&gt; +=C2=A0 =C2=A0 LINKER_gcc=3Dno \<br>
&gt; +&quot;<br>
&gt; +<br>
&gt; +do_install() {<br>
&gt; +=C2=A0 =C2=A0 oe_runmake install DESTDIR=3D&#39;${D}&#39;<br>
&gt; +}<br>
&gt; diff --git a/meta-oe/recipes-extended/beep/files/0001-Do-not-use-Werro=
r-as-it-fails-with-newer-clang-11.patch b/meta-oe/recipes-extended/beep/fil=
es/0001-Do-not-use-Werror-as-it-fails-with-newer-clang-11.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..ba7681b983<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-extended/beep/files/0001-Do-not-use-Werror-as-it=
-fails-with-newer-clang-11.patch<br>
&gt; @@ -0,0 +1,63 @@<br>
&gt; +From 6b33adfa438e35b6a37cfb0364274370ef4f9fc1 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
&gt; +Date: Wed, 23 Dec 2020 18:00:59 +0000<br>
&gt; +Subject: [PATCH] Do not use -Werror as it fails with newer clang 11+<=
br>
&gt; +<br>
&gt; +Upstream-Status: Pending<br>
&gt; +Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; +---<br>
&gt; + GNUmakefile | 1 -<br>
&gt; + 1 file changed, 1 deletion(-)<br>
&gt; +<br>
&gt; +--- a/GNUmakefile<br>
&gt; ++++ b/GNUmakefile<br>
&gt; +@@ -91,12 +91,13 @@ comma :=3D ,<br>
&gt; + # If supported by COMPILER_gcc, add given flags to CFLAGS_gcc.<br>
&gt; + # Example usage:<br>
&gt; + #=C2=A0 =C2=A0$(eval $(call CHECK_CFLAGS_gcc,-fasynchronous-unwind-t=
ables))<br>
&gt; +-define CHECK_CFLAGS_gcc<br>
&gt; +-CFLAGS_gcc +=3D $$(if $$(shell if $$(COMPILER_gcc) $(1) -x c -o comp=
ile-check.gcc-o -c - &lt; /dev/null &gt; /dev/null 2&gt;&amp;1; then echo y=
es; else :; fi; rm -f compile-check.gcc-o &gt; /dev/null 2&gt;&amp;1),$(1))=
<br>
&gt; +-endef<br>
&gt; +<br>
&gt; + COMPILER_gcc =3D gcc<br>
&gt; + LINKER_gcc =3D gcc<br>
&gt; ++ifneq ($(COMPILER_gcc),no)<br>
&gt; ++define CHECK_CFLAGS_gcc<br>
&gt; ++CFLAGS_gcc +=3D $$(if $$(shell if $$(COMPILER_gcc) $(1) -x c -o comp=
ile-check.gcc-o -c - &lt; /dev/null &gt; /dev/null 2&gt;&amp;1; then echo y=
es; else :; fi; rm -f compile-check.gcc-o &gt; /dev/null 2&gt;&amp;1),$(1))=
<br>
&gt; ++endef<br>
&gt; + CPPFLAGS_gcc =3D<br>
&gt; + CFLAGS_gcc =3D<br>
&gt; + CFLAGS_gcc +=3D -std=3Dgnu99 -pedantic<br>
&gt; +@@ -113,30 +114,24 @@ CFLAGS_gcc +=3D -save-temps=3Dobj<br>
&gt; + LDFLAGS_gcc =3D<br>
&gt; + LIBS_gcc =3D<br>
&gt; +<br>
&gt; +-ifneq ($(call pathsearch,$(COMPILER_gcc)),)<br>
&gt; +-ifneq ($(COMPILER_gcc)),no)<br>
&gt; + COMPILERS +=3D gcc<br>
&gt; + endif<br>
&gt; +-endif<br>
&gt; +<br>
&gt; + COMPILER_clang =3D clang<br>
&gt; + LINKER_clang =3D clang<br>
&gt; ++<br>
&gt; ++ifneq ($(COMPILER_clang),no)<br>
&gt; + CPPFLAGS_clang =3D<br>
&gt; + CFLAGS_clang +=3D -Wall -Wextra<br>
&gt; + CFLAGS_clang +=3D -Weverything<br>
&gt; + CFLAGS_clang +=3D -Wno-padded<br>
&gt; + CFLAGS_clang +=3D -std=3Dgnu99 -pedantic<br>
&gt; +-CFLAGS_clang +=3D -Werror<br>
&gt; +-CFLAGS_clang +=3D -fsanitize=3Dundefined<br>
&gt; + CFLAGS_clang +=3D -O -g<br>
&gt; + LDFLAGS_clang =3D<br>
&gt; + LIBS_clang =3D<br>
&gt; +<br>
&gt; +-ifneq ($(call pathsearch,$(COMPILER_clang)),)<br>
&gt; +-ifneq ($(COMPILER_clang),no)<br>
&gt; + COMPILERS +=3D clang<br>
&gt; + endif<br>
&gt; +-endif<br>
&gt; +<br>
&gt; +<br>
&gt; + ####################################################################=
####<br>
&gt; --<br>
&gt; 2.29.2<br>
&gt;<br>
</blockquote></div></div>

--0000000000000f940105b87c01b2--
