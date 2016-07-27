Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id 18B9D606BF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jul 2016 00:54:15 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id q83so4233567iod.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jul 2016 17:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to; bh=tlhqX2lDNvZ2tBwpBIjMwyqh0+g9wZwuQoF4UPq3Yek=;
	b=XhhV/t2qvcBhZmE5x5ypU1TkLNvecz/zo98jBXam0k0WI1rBlF9J7Ww/yzqi9fU7SE
	DmFTJj8cN5QMppz/StZxDKS+5tk+PhjJm5XESw3XcNJBQdAHHuJqgZsmPq3a3z4tjVkZ
	SvOzTbHChQv2ggI5mD2+Vzxoj/hAcfKn62uNKghw2RW6eP5D6dnbxa76zr6J4vq1sfo3
	1/FBw/bSquHsfqQVQGA7rZm5jCT2SeH4+NCzodCfA3cRqx34wqUC8J1/pZGimzogPolI
	Yc0aWH3FYZ+HesyF9Zskdc/gt/jTh01Erbdli3ebcttFNEWRjG7SBAYrIwnTa6KTQsg2
	rwDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to;
	bh=tlhqX2lDNvZ2tBwpBIjMwyqh0+g9wZwuQoF4UPq3Yek=;
	b=aL1iiJWG1mPTuSYV9UgH41pvPzxFx24gmn/puxc0LWPfRHdtnEzgr5IoRWVmZ08HsE
	x88dxhkfjD3o/9WupkXm3NdH22njhJDEYnCKMV+Q46SW5FpfdRXpkrdfPQnT1REggscg
	lROacf36fMRSNIHkeUm9RWq1EtSgzSulUHW6IHrsRw+CaE4+dVZNwUhPwXi3balw2Tkj
	cnW2UtUiGl2bw+6c0ABiOLufVWUkE3w478wivSNUOltKGIujkRwzJDYp3jtVmO2CSjnx
	5TySosugSGvTM7KvTSJHIzrshtQCqyZLBeGv2s4mkIbNXbP5FYKxfym08g+2LLOgmOHR
	yCtg==
X-Gm-Message-State: AEkoouuJDLOuHm2iDf6SGUwUd9vCilrrT4ETGNeVZ4IYpQNr/BX106/+slRJT9YqY0t6Cw0G7vKAKlwKeEIYBQ==
X-Received: by 10.107.131.170 with SMTP id n42mr29647437ioi.126.1469580856064; 
	Tue, 26 Jul 2016 17:54:16 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.21.197 with HTTP; Tue, 26 Jul 2016 17:53:56 -0700 (PDT)
In-Reply-To: <20160724120116.mdahisqaltbr53ya@jama>
References: <1466195689-14012-1-git-send-email-kergoth@gmail.com>
	<20160724120116.mdahisqaltbr53ya@jama>
From: Christopher Larson <chris_larson@mentor.com>
Date: Tue, 26 Jul 2016 17:53:56 -0700
X-Google-Sender-Auth: k8BfFXrZg03pqGJ3wX0YI4ZdUQs
Message-ID: <CABcZANnqHaRdUuVv_J8vcm7QxdC9u9vkZzcXV6YUJcRHmD9B4A@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-multimedia][PATCH] libebml: don't rely on make -e, obey LDFLAGS
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Jul 2016 00:54:18 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Jul 24, 2016 at 5:01 AM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> On Fri, Jun 17, 2016 at 01:34:49PM -0700, Christopher Larson wrote:
> > From: Christopher Larson <chris_larson@mentor.com>
> >
> > We need to obey LDFLAGS to get the correct hash style for external
> toolchains,
> > and passing vars explicitly is better than relying on implicitly
> overriding
> > everything blindly from the environment.
> >
> > Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> > ---
> >  .../recipes-mkv/libebml/libebml/ldflags.patch      | 57
> ++++++++++++++++++++++
> >  .../libebml/libebml/override-uname.patch           | 42 ++++++++++++++++
> >  .../recipes-mkv/libebml/libebml_1.3.0.bb           | 44
> +++++++++++++++--
> >  3 files changed, 138 insertions(+), 5 deletions(-)
> >  create mode 100644
> meta-multimedia/recipes-mkv/libebml/libebml/ldflags.patch
> >  create mode 100644
> meta-multimedia/recipes-mkv/libebml/libebml/override-uname.patch
> >
> > diff --git a/meta-multimedia/recipes-mkv/libebml/libebml/ldflags.patch
> b/meta-multimedia/recipes-mkv/libebml/libebml/ldflags.patch
> > new file mode 100644
> > index 0000000..a01c754
> > --- /dev/null
> > +++ b/meta-multimedia/recipes-mkv/libebml/libebml/ldflags.patch
> > @@ -0,0 +1,57 @@
> > +Use LD and obey LDFLAGS
> > +
> > +Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> > +Upstream-Status: Pending
> > +
> > +diff --git a/make/linux/Makefile b/make/linux/Makefile
> > +index 391b6e3..a2ac13e 100644
> > +--- a/make/linux/Makefile
> > ++++ b/make/linux/Makefile
> > +@@ -64,6 +64,7 @@ objects_so:=$(patsubst %$(EXTENSION),%.lo,$(sources))
> > + WARNINGFLAGS=-Wall -Wextra -Wno-unknown-pragmas -ansi
> -fno-gnu-keywords -Wshadow
> > + COMPILEFLAGS=$(WARNINGFLAGS) $(CXXFLAGS) $(CPPFLAGS) $(DEBUGFLAGS)
> $(INCLUDE)
> > + DEPENDFLAGS  = $(CXXFLAGS) $(INCLUDE)
> > ++LINKFLAGS=$(LDFLAGS)
> > +
> > + ifeq (Darwin,$(shell uname -s))
> > + all: staticlib
> > +@@ -91,7 +92,7 @@ $(LIBRARY): $(objects)
> > +     $(RANLIB) $@
> > +
> > + $(LIBRARY_SO): $(objects_so)
> > +-    $(CXX) -shared -Wl,-soname,$(LIBRARY_SO_VER) -o $(LIBRARY_SO_VER)
> $(objects_so)
> > ++    $(LD) $(LINKFLAGS) -shared -Wl,-soname,$(LIBRARY_SO_VER) -o
> $(LIBRARY_SO_VER) $(objects_so)
> > +     rm -f $(LIBRARY_SO)
> > +     ln -s $(LIBRARY_SO_VER) $(LIBRARY_SO)
> > +
> > +diff --git a/make/mingw32/Makefile b/make/mingw32/Makefile
> > +index e5986ef..6ca16aa 100644
> > +--- a/make/mingw32/Makefile
> > ++++ b/make/mingw32/Makefile
> > +@@ -18,6 +18,7 @@ DEBUGFLAGS=-g -DDEBUG
> > + endif
> > + CROSS   =
> > + CXX     = $(CROSS)g++
> > ++LD      = $(CXX)
> > + CC      = $(CROSS)gcc
> > + WINDRES = $(CROSS)windres
> > + RANLIB  = $(CROSS)ranlib
> > +@@ -33,6 +34,7 @@ LIBS = libebml.a
> > + endif
> > + INCS = -I"$(shell pwd)/../.."
> > + COMPILEFLAGS = $(DEBUGFLAGS) $(INCS) $(DLLFLAGS) $(CXXFLAGS)
> > ++LINKFLAGS = $(LDFLAGS)
> > +
> > + .PHONY: all all-before all-after clean clean-custom
> > +
> > +@@ -54,7 +56,7 @@ libebml.a: $(OBJ)
> > +     $(RANLIB) $@
> > +
> > + libebml.dll: $(OBJ)
> > +-    $(CXX) -shared -Wl,--export-all -Wl,--out-implib=$@.a -o $@ $(OBJ)
> > ++    $(LD) $(LINKFLAGS) -shared -Wl,--export-all -Wl,--out-implib=$@.a
> -o $@ $(OBJ)
> > +
> > + depend:
> > +     @echo Calculating dependecies:
> > +--
> > +2.8.0
> > diff --git
> a/meta-multimedia/recipes-mkv/libebml/libebml/override-uname.patch
> b/meta-multimedia/recipes-mkv/libebml/libebml/override-uname.patch
> > new file mode 100644
> > index 0000000..57eb345
> > --- /dev/null
> > +++ b/meta-multimedia/recipes-mkv/libebml/libebml/override-uname.patch
> > @@ -0,0 +1,42 @@
> > +Allow override of the 'uname -s' for cross-compilation
> > +
> > +Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> > +Upstream-Status: Pending
> > +
> > +diff --git a/make/linux/Makefile b/make/linux/Makefile
> > +index a2ac13e..4188bee 100644
> > +--- a/make/linux/Makefile
> > ++++ b/make/linux/Makefile
> > +@@ -9,9 +9,11 @@
> > + # 'make DEBUG=yes'.
> > + #
> > +
> > ++TARGET_OS ?= $(shell uname -s)
> > ++
> > + # Paths
> > + # BeOS wants the libs and headers in /boot/home/config
> > +-ifeq (BeOS,$(shell uname -s))
> > ++ifeq (BeOS,$(TARGET_OS))
> > + prefix=/boot/home/config
> > + else
> > + prefix=/usr/local
> > +@@ -66,7 +68,7 @@ COMPILEFLAGS=$(WARNINGFLAGS) $(CXXFLAGS) $(CPPFLAGS)
> $(DEBUGFLAGS) $(INCLUDE)
> > + DEPENDFLAGS  = $(CXXFLAGS) $(INCLUDE)
> > + LINKFLAGS=$(LDFLAGS)
> > +
> > +-ifeq (Darwin,$(shell uname -s))
> > ++ifeq (Darwin,$(TARGET_OS))
> > + all: staticlib
> > + else
> > + all: staticlib sharedlib
> > +@@ -116,7 +118,7 @@ depend:
> > +             $(CXX) $(DEPENDFLAGS) -MM -MT $$o $$i >> .depend ; \
> > +     done
> > +
> > +-ifeq (Darwin,$(shell uname -s))
> > ++ifeq (Darwin,$(TARGET_OS))
> > + install: install_staticlib install_headers
> > + else
> > + install: install_staticlib install_sharedlib install_headers
> > +--
> > +2.8.0
> > diff --git a/meta-multimedia/recipes-mkv/libebml/libebml_1.3.0.bb
> b/meta-multimedia/recipes-mkv/libebml/libebml_1.3.0.bb
> > index 71e2bfc..b756a39 100644
> > --- a/meta-multimedia/recipes-mkv/libebml/libebml_1.3.0.bb
> > +++ b/meta-multimedia/recipes-mkv/libebml/libebml_1.3.0.bb
> > @@ -2,15 +2,49 @@ SUMMARY = "libebml is a C++ libary to parse EBML files"
> >  LICENSE = "LGPLv2.1"
> >  LIC_FILES_CHKSUM =
> "file://LICENSE.LGPL;md5=f14599a2f089f6ff8c97e2baa4e3d575"
> >
> > -SRC_URI = "
> http://dl.matroska.org/downloads/libebml/libebml-${PV}.tar.bz2"
> > +SRC_URI = "\
> > +    http://dl.matroska.org/downloads/libebml/libebml-${PV}.tar.bz2 \
> > +    file://ldflags.patch \
> > +    file://override-uname.patch \
> > +"
> >  SRC_URI[md5sum] = "efec729bf5a51e649e1d9d1f61c0ae7a"
> >  SRC_URI[sha256sum] =
> "83b074d6b62715aa0080406ea84d33df2e44b5d874096640233a4db49b8096de"
> >
> > -EXTRA_OEMAKE = "-e MAKEFLAGS="
> > +do_unpack[postfuncs] += "dos2unix"
> >
> > -do_compile() {
> > -    cd ${S}/make/linux
> > -    oe_runmake CROSS="${TARGET_PREFIX}"
> > +dos2unix () {
> > +    cr="$(printf '\r')"
> > +    for f in make/*/Makefile; do
> > +        tr -d "$cr" <"$f" >"$f.new" && \
> > +            mv "$f.new" "$f"
> > +    done
> > +}
>
> This doesn't seem to work now:
>
> | NOTE: Unpacking
> /home/jenkins/oe/world/shr-core/meta-openembedded/meta-multimedia/recipes-mkv/libebml/libebml/override-uname.patch
> to
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/libebml/1.3.0-r0/
> | DEBUG: Python function base_do_unpack finished
> | DEBUG: Python function do_unpack finished
> | DEBUG: Executing python function do_qa_unpack
> | NOTE: Checking has ${S} been created
> | DEBUG: Python function do_qa_unpack finished
> | DEBUG: Executing shell function dos2unix
> |
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/libebml/1.3.0-r0/temp/run.dos2unix.30265:
> 104:
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/libebml/1.3.0-r0/temp/run.dos2unix.30265:
> cannot open make/*/Makefile: No such file
> | WARNING: exit code 2 from a shell command.
> | ERROR: Function failed: dos2unix (log file is located at
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/libebml/1.3.0-r0/temp/log.do_unpack.30265)
> NOTE: recipe libebml-1.3.0-r0: task do_unpack: Failed


Looks like fallout from the removal of the default 'dirs' flag, I'll take
care of it when I get back from vacation if nobody gets to it first. Thanks.
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

