Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OfoZO-0005KH-0Q
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 Aug 2010 08:32:25 +0200
Received: by bwz10 with SMTP id 10so1691564bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 01 Aug 2010 23:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=bYRJXsZKaCjBtmTE3LSO2s9zVre60wKO5dEs3vF0PEw=;
	b=GsnzujJIhkq54zT+By1THrdcqUH6Tjz9TbMRnY70WN7fA9VSgsSFcz+VEMLZWvJmky
	KpGBxwQ2w3f22tPHgn1yc0jNl7F0tMK9tSPJFMPJRqvvOrVcZWgOHIVJxhLdkOtT1Jw/
	SlBGmsiLfiGx+rZsbhzmIaZh26k3tU2bNr4dw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=nV2UF0ynAShVw5uSCkEjXBymtPLppTy8CcdmbhyOEIr9m6ksrnT4/rCaM3iN63j0vR
	QmQA6GA1MhEGW1cBenAZlt1y1w7QQfcYxYIedGhgTAIubBCWBYMCcUisBW/tqHXRHY7o
	d3/M/8VetIbm/1y9LHdCN07MQ6eRHEuKmVBJk=
MIME-Version: 1.0
Received: by 10.204.46.23 with SMTP id h23mr3843038bkf.75.1280730716484; Sun, 
	01 Aug 2010 23:31:56 -0700 (PDT)
Received: by 10.204.60.208 with HTTP; Sun, 1 Aug 2010 23:31:56 -0700 (PDT)
In-Reply-To: <20100801223418.GD30928@gmail.com>
References: <1280089125-30217-1-git-send-email-fransmeulenbroeks@gmail.com>
	<20100801223418.GD30928@gmail.com>
Date: Mon, 2 Aug 2010 08:31:56 +0200
Message-ID: <AANLkTinm2OZc6VNGGcFHjHVYg5LUF534=h-7OZsNwcaa@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH 1/4] gcc4.2.x: patch Makefile.in for cross compile badness
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 02 Aug 2010 06:32:25 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/8/2 Khem Raj <raj.khem@gmail.com>

> On (25/07/10 22:18), Frans Meulenbroeks wrote:
> > When compiling gcc target code make passes -I(GMPINC)
> > but this one points to the host dir (it is set to HOST_GMPINC
> > which in oe points to tmp/sysroots/i686-linux/usr/include).
> > This patch breaks the env var $(INCLUDES) in two and
> > only uses the TARGET specific part for compiling libgcc
> > and the crt stuff.
> >
> > The patch has been verified by baking all affected recipes with
> > bitbake -c configure -b recipe
> >
> > Also introduced INC_PR
> >
> > Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
>
> Acked-by: Khem Raj <raj.khem@gmail.com>
>
> I think you should rename the patch to convey what it does
> makefile.in.patch is too generic.
>
> and wait for multimachine fixes to go in and retest these patches please.
> the ack holds for all the patches with above comments in this series.
>

Thanks, will do.
and will rename to fix-target-includes.patch unless someone coins a better
name

Frans

>
>
>
> > ---
> >  recipes/gcc/gcc-4.2.1.inc               |    3 ++
> >  recipes/gcc/gcc-4.2.1/Makefile.in.patch |   38
> +++++++++++++++++++++++++++++++
> >  recipes/gcc/gcc-4.2.2.inc               |    3 +-
> >  recipes/gcc/gcc-4.2.2/Makefile.in.patch |   38
> +++++++++++++++++++++++++++++++
> >  recipes/gcc/gcc-4.2.3.inc               |    3 +-
> >  recipes/gcc/gcc-4.2.3/Makefile.in.patch |   38
> +++++++++++++++++++++++++++++++
> >  recipes/gcc/gcc-4.2.4.inc               |    3 +-
> >  recipes/gcc/gcc-4.2.4/Makefile.in.patch |   38
> +++++++++++++++++++++++++++++++
> >  recipes/gcc/gcc-cross_4.2.1.bb          |    2 +-
> >  recipes/gcc/gcc_4.2.1.bb                |    2 +-
> >  10 files changed, 163 insertions(+), 5 deletions(-)
> >  create mode 100644 recipes/gcc/gcc-4.2.1/Makefile.in.patch
> >  create mode 100644 recipes/gcc/gcc-4.2.2/Makefile.in.patch
> >  create mode 100644 recipes/gcc/gcc-4.2.3/Makefile.in.patch
> >  create mode 100644 recipes/gcc/gcc-4.2.4/Makefile.in.patch
> >
> > diff --git a/recipes/gcc/gcc-4.2.1.inc b/recipes/gcc/gcc-4.2.1.inc
> > index 63876f7..fbee758 100644
> > --- a/recipes/gcc/gcc-4.2.1.inc
> > +++ b/recipes/gcc/gcc-4.2.1.inc
> > @@ -3,6 +3,8 @@ require gcc-common.inc
> >  DEPENDS = "mpfr gmp"
> >  NATIVEDEPS = "mpfr-native gmp-native"
> >
> > +INC_PR = "r22"
> > +
> >  SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=archive \
> >       file://100-uclibc-conf.patch \
> >       file://103-uclibc-conf-noupstream.patch \
> > @@ -33,6 +35,7 @@ SRC_URI =
> "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=archive \
> >       file://cache-amnesia.patch \
> >       file://gfortran.patch \
> >       file://pr34130.patch \
> > +     file://Makefile.in.patch \
> >  "
> >
> >  SRC_URI_avr32 = "
> http://ewi546.ewi.utwente.nl/tmp/avr32-gcc-4.2.1-atmel.1.0.3.tar.gz;name=atmel\
> > diff --git a/recipes/gcc/gcc-4.2.1/Makefile.in.patch
> b/recipes/gcc/gcc-4.2.1/Makefile.in.patch
> > new file mode 100644
> > index 0000000..6013f71
> > --- /dev/null
> > +++ b/recipes/gcc/gcc-4.2.1/Makefile.in.patch
> > @@ -0,0 +1,38 @@
> > +Index: gcc-4.2.4/gcc/Makefile.in
> > +===================================================================
> > +--- gcc-4.2.4.orig/gcc/Makefile.in
> > ++++ gcc-4.2.4/gcc/Makefile.in
> > +@@ -570,7 +570,7 @@ LIBGCC2_INCLUDES =
> > + TARGET_LIBGCC2_CFLAGS =
> > +
> > + # Options to use when compiling crtbegin/end.
> > +-CRTSTUFF_CFLAGS = -O2 $(GCC_CFLAGS) $(INCLUDES) $(MULTILIB_CFLAGS) -g0
> \
> > ++CRTSTUFF_CFLAGS = -O2 $(GCC_CFLAGS) $(TARGET_INCLUDES)
> $(MULTILIB_CFLAGS) -g0 \
> > +   -finhibit-size-directive -fno-inline-functions -fno-exceptions \
> > +   -fno-zero-initialized-in-bss -fno-toplevel-reorder \
> > +   $(INHIBIT_LIBC_CFLAGS)
> > +@@ -874,9 +874,13 @@ BUILD_ERRORS = build/errors.o
> > + # -I$(@D) and -I$(srcdir)/$(@D) cause the subdirectory of the file
> > + # currently being compiled, in both source trees, to be examined as
> well.
> > + # libintl.h will be found in ../intl if we are using the included
> libintl.
> > +-INCLUDES = -I. -I$(@D) -I$(srcdir) -I$(srcdir)/$(@D) \
> > ++#
> > ++# TARGET_INCLUDES is added to avoid that GMPINC (which points to the
> host
> > ++# include dir) is used for compiling libgcc.a
> > ++TARGET_INCLUDES = -I. -I$(@D) -I$(srcdir) -I$(srcdir)/$(@D) \
> > +        -I$(srcdir)/../include @INCINTL@ \
> > +-       $(CPPINC) $(GMPINC) $(DECNUMINC)
> > ++       $(CPPINC) $(DECNUMINC)
> > ++INCLUDES = $(TARGET_INCLUDES) $(GMPINC)
> > +
> > + .c.o:
> > +     $(CC) -c $(ALL_CFLAGS) $(ALL_CPPFLAGS) $< $(OUTPUT_OPTION)
> > +@@ -1485,7 +1489,7 @@ libgcc.a: $(LIBGCC_DEPS)
> > +     $(MAKE) \
> > +       CFLAGS="$(CFLAGS) $(WARN_CFLAGS)" \
> > +       CONFIG_H="$(TCONFIG_H)" TM_H="$(TM_H)" \
> > +-      INCLUDES="$(INCLUDES)" \
> > ++      INCLUDES="$(TARGET_INCLUDES)" \
> > +       MAKEOVERRIDES= \
> > +       -f libgcc.mk all
> > +
> > diff --git a/recipes/gcc/gcc-4.2.2.inc b/recipes/gcc/gcc-4.2.2.inc
> > index 2a5334a..5e11b3f 100644
> > --- a/recipes/gcc/gcc-4.2.2.inc
> > +++ b/recipes/gcc/gcc-4.2.2.inc
> > @@ -4,7 +4,7 @@ LICENSE = "GPLv3"
> >  DEPENDS = "mpfr gmp"
> >  NATIVEDEPS = "mpfr-native gmp-native"
> >
> > -INC_PR = "r16"
> > +INC_PR = "r17"
> >
> >  SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=archive \
> >       file://100-uclibc-conf.patch \
> > @@ -40,6 +40,7 @@ SRC_URI =
> "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=archive \
> >       file://pr34130.patch \
> >       file://fortran-static-linking.patch \
> >       file://intermask-bigendian.patch \
> > +     file://Makefile.in.patch \
> >  "
> >
> >
> > diff --git a/recipes/gcc/gcc-4.2.2/Makefile.in.patch
> b/recipes/gcc/gcc-4.2.2/Makefile.in.patch
> > new file mode 100644
> > index 0000000..6013f71
> > --- /dev/null
> > +++ b/recipes/gcc/gcc-4.2.2/Makefile.in.patch
> > @@ -0,0 +1,38 @@
> > +Index: gcc-4.2.4/gcc/Makefile.in
> > +===================================================================
> > +--- gcc-4.2.4.orig/gcc/Makefile.in
> > ++++ gcc-4.2.4/gcc/Makefile.in
> > +@@ -570,7 +570,7 @@ LIBGCC2_INCLUDES =
> > + TARGET_LIBGCC2_CFLAGS =
> > +
> > + # Options to use when compiling crtbegin/end.
> > +-CRTSTUFF_CFLAGS = -O2 $(GCC_CFLAGS) $(INCLUDES) $(MULTILIB_CFLAGS) -g0
> \
> > ++CRTSTUFF_CFLAGS = -O2 $(GCC_CFLAGS) $(TARGET_INCLUDES)
> $(MULTILIB_CFLAGS) -g0 \
> > +   -finhibit-size-directive -fno-inline-functions -fno-exceptions \
> > +   -fno-zero-initialized-in-bss -fno-toplevel-reorder \
> > +   $(INHIBIT_LIBC_CFLAGS)
> > +@@ -874,9 +874,13 @@ BUILD_ERRORS = build/errors.o
> > + # -I$(@D) and -I$(srcdir)/$(@D) cause the subdirectory of the file
> > + # currently being compiled, in both source trees, to be examined as
> well.
> > + # libintl.h will be found in ../intl if we are using the included
> libintl.
> > +-INCLUDES = -I. -I$(@D) -I$(srcdir) -I$(srcdir)/$(@D) \
> > ++#
> > ++# TARGET_INCLUDES is added to avoid that GMPINC (which points to the
> host
> > ++# include dir) is used for compiling libgcc.a
> > ++TARGET_INCLUDES = -I. -I$(@D) -I$(srcdir) -I$(srcdir)/$(@D) \
> > +        -I$(srcdir)/../include @INCINTL@ \
> > +-       $(CPPINC) $(GMPINC) $(DECNUMINC)
> > ++       $(CPPINC) $(DECNUMINC)
> > ++INCLUDES = $(TARGET_INCLUDES) $(GMPINC)
> > +
> > + .c.o:
> > +     $(CC) -c $(ALL_CFLAGS) $(ALL_CPPFLAGS) $< $(OUTPUT_OPTION)
> > +@@ -1485,7 +1489,7 @@ libgcc.a: $(LIBGCC_DEPS)
> > +     $(MAKE) \
> > +       CFLAGS="$(CFLAGS) $(WARN_CFLAGS)" \
> > +       CONFIG_H="$(TCONFIG_H)" TM_H="$(TM_H)" \
> > +-      INCLUDES="$(INCLUDES)" \
> > ++      INCLUDES="$(TARGET_INCLUDES)" \
> > +       MAKEOVERRIDES= \
> > +       -f libgcc.mk all
> > +
> > diff --git a/recipes/gcc/gcc-4.2.3.inc b/recipes/gcc/gcc-4.2.3.inc
> > index e947cba..dd4a739 100644
> > --- a/recipes/gcc/gcc-4.2.3.inc
> > +++ b/recipes/gcc/gcc-4.2.3.inc
> > @@ -4,7 +4,7 @@ LICENSE = "GPLv3"
> >  DEPENDS = "mpfr gmp"
> >  NATIVEDEPS = "mpfr-native gmp-native"
> >
> > -INC_PR = "r17"
> > +INC_PR = "r18"
> >
> >  SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=archive \
> >       file://100-uclibc-conf.patch \
> > @@ -39,6 +39,7 @@ SRC_URI =
> "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=archive \
> >       file://gcc-4.0.2-e300c2c3.patch \
> >       file://fortran-static-linking.patch \
> >       file://intermask-bigendian.patch \
> > +     file://Makefile.in.patch \
> >  "
> >
> >  SRC_URI_append_ep93xx = " \
> > diff --git a/recipes/gcc/gcc-4.2.3/Makefile.in.patch
> b/recipes/gcc/gcc-4.2.3/Makefile.in.patch
> > new file mode 100644
> > index 0000000..6013f71
> > --- /dev/null
> > +++ b/recipes/gcc/gcc-4.2.3/Makefile.in.patch
> > @@ -0,0 +1,38 @@
> > +Index: gcc-4.2.4/gcc/Makefile.in
> > +===================================================================
> > +--- gcc-4.2.4.orig/gcc/Makefile.in
> > ++++ gcc-4.2.4/gcc/Makefile.in
> > +@@ -570,7 +570,7 @@ LIBGCC2_INCLUDES =
> > + TARGET_LIBGCC2_CFLAGS =
> > +
> > + # Options to use when compiling crtbegin/end.
> > +-CRTSTUFF_CFLAGS = -O2 $(GCC_CFLAGS) $(INCLUDES) $(MULTILIB_CFLAGS) -g0
> \
> > ++CRTSTUFF_CFLAGS = -O2 $(GCC_CFLAGS) $(TARGET_INCLUDES)
> $(MULTILIB_CFLAGS) -g0 \
> > +   -finhibit-size-directive -fno-inline-functions -fno-exceptions \
> > +   -fno-zero-initialized-in-bss -fno-toplevel-reorder \
> > +   $(INHIBIT_LIBC_CFLAGS)
> > +@@ -874,9 +874,13 @@ BUILD_ERRORS = build/errors.o
> > + # -I$(@D) and -I$(srcdir)/$(@D) cause the subdirectory of the file
> > + # currently being compiled, in both source trees, to be examined as
> well.
> > + # libintl.h will be found in ../intl if we are using the included
> libintl.
> > +-INCLUDES = -I. -I$(@D) -I$(srcdir) -I$(srcdir)/$(@D) \
> > ++#
> > ++# TARGET_INCLUDES is added to avoid that GMPINC (which points to the
> host
> > ++# include dir) is used for compiling libgcc.a
> > ++TARGET_INCLUDES = -I. -I$(@D) -I$(srcdir) -I$(srcdir)/$(@D) \
> > +        -I$(srcdir)/../include @INCINTL@ \
> > +-       $(CPPINC) $(GMPINC) $(DECNUMINC)
> > ++       $(CPPINC) $(DECNUMINC)
> > ++INCLUDES = $(TARGET_INCLUDES) $(GMPINC)
> > +
> > + .c.o:
> > +     $(CC) -c $(ALL_CFLAGS) $(ALL_CPPFLAGS) $< $(OUTPUT_OPTION)
> > +@@ -1485,7 +1489,7 @@ libgcc.a: $(LIBGCC_DEPS)
> > +     $(MAKE) \
> > +       CFLAGS="$(CFLAGS) $(WARN_CFLAGS)" \
> > +       CONFIG_H="$(TCONFIG_H)" TM_H="$(TM_H)" \
> > +-      INCLUDES="$(INCLUDES)" \
> > ++      INCLUDES="$(TARGET_INCLUDES)" \
> > +       MAKEOVERRIDES= \
> > +       -f libgcc.mk all
> > +
> > diff --git a/recipes/gcc/gcc-4.2.4.inc b/recipes/gcc/gcc-4.2.4.inc
> > index e072731..513a63e 100644
> > --- a/recipes/gcc/gcc-4.2.4.inc
> > +++ b/recipes/gcc/gcc-4.2.4.inc
> > @@ -4,7 +4,7 @@ LICENSE = "GPLv3"
> >  DEPENDS = "mpfr gmp"
> >  NATIVEDEPS = "mpfr-native gmp-native"
> >
> > -INC_PR = "r11"
> > +INC_PR = "r12"
> >
> >  SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=archive \
> >       file://100-uclibc-conf.patch \
> > @@ -40,6 +40,7 @@ SRC_URI =
> "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=archive \
> >       file://fortran-static-linking.patch \
> >       file://intermask-bigendian.patch \
> >       file://libstdc++-hack-libtool-remove-lstdc++.patch \
> > +     file://Makefile.in.patch \
> >  "
> >
> >  SRC_URI_append_ep93xx = " \
> > diff --git a/recipes/gcc/gcc-4.2.4/Makefile.in.patch
> b/recipes/gcc/gcc-4.2.4/Makefile.in.patch
> > new file mode 100644
> > index 0000000..6013f71
> > --- /dev/null
> > +++ b/recipes/gcc/gcc-4.2.4/Makefile.in.patch
> > @@ -0,0 +1,38 @@
> > +Index: gcc-4.2.4/gcc/Makefile.in
> > +===================================================================
> > +--- gcc-4.2.4.orig/gcc/Makefile.in
> > ++++ gcc-4.2.4/gcc/Makefile.in
> > +@@ -570,7 +570,7 @@ LIBGCC2_INCLUDES =
> > + TARGET_LIBGCC2_CFLAGS =
> > +
> > + # Options to use when compiling crtbegin/end.
> > +-CRTSTUFF_CFLAGS = -O2 $(GCC_CFLAGS) $(INCLUDES) $(MULTILIB_CFLAGS) -g0
> \
> > ++CRTSTUFF_CFLAGS = -O2 $(GCC_CFLAGS) $(TARGET_INCLUDES)
> $(MULTILIB_CFLAGS) -g0 \
> > +   -finhibit-size-directive -fno-inline-functions -fno-exceptions \
> > +   -fno-zero-initialized-in-bss -fno-toplevel-reorder \
> > +   $(INHIBIT_LIBC_CFLAGS)
> > +@@ -874,9 +874,13 @@ BUILD_ERRORS = build/errors.o
> > + # -I$(@D) and -I$(srcdir)/$(@D) cause the subdirectory of the file
> > + # currently being compiled, in both source trees, to be examined as
> well.
> > + # libintl.h will be found in ../intl if we are using the included
> libintl.
> > +-INCLUDES = -I. -I$(@D) -I$(srcdir) -I$(srcdir)/$(@D) \
> > ++#
> > ++# TARGET_INCLUDES is added to avoid that GMPINC (which points to the
> host
> > ++# include dir) is used for compiling libgcc.a
> > ++TARGET_INCLUDES = -I. -I$(@D) -I$(srcdir) -I$(srcdir)/$(@D) \
> > +        -I$(srcdir)/../include @INCINTL@ \
> > +-       $(CPPINC) $(GMPINC) $(DECNUMINC)
> > ++       $(CPPINC) $(DECNUMINC)
> > ++INCLUDES = $(TARGET_INCLUDES) $(GMPINC)
> > +
> > + .c.o:
> > +     $(CC) -c $(ALL_CFLAGS) $(ALL_CPPFLAGS) $< $(OUTPUT_OPTION)
> > +@@ -1485,7 +1489,7 @@ libgcc.a: $(LIBGCC_DEPS)
> > +     $(MAKE) \
> > +       CFLAGS="$(CFLAGS) $(WARN_CFLAGS)" \
> > +       CONFIG_H="$(TCONFIG_H)" TM_H="$(TM_H)" \
> > +-      INCLUDES="$(INCLUDES)" \
> > ++      INCLUDES="$(TARGET_INCLUDES)" \
> > +       MAKEOVERRIDES= \
> > +       -f libgcc.mk all
> > +
> > diff --git a/recipes/gcc/gcc-cross_4.2.1.bb b/recipes/gcc/
> gcc-cross_4.2.1.bb
> > index ae7f2b7..359a817 100644
> > --- a/recipes/gcc/gcc-cross_4.2.1.bb
> > +++ b/recipes/gcc/gcc-cross_4.2.1.bb
> > @@ -1,4 +1,4 @@
> > -PR = "r21"
> > +PR = "${INC_PR}.0"
> >
> >  require gcc-${PV}.inc
> >  require gcc-cross4.inc
> > diff --git a/recipes/gcc/gcc_4.2.1.bb b/recipes/gcc/gcc_4.2.1.bb
> > index 9951efd..94faba1 100644
> > --- a/recipes/gcc/gcc_4.2.1.bb
> > +++ b/recipes/gcc/gcc_4.2.1.bb
> > @@ -1,4 +1,4 @@
> > -PR = "r15"
> > +PR = "${INC_PR}.0"
> >
> >  require gcc-${PV}.inc
> >  require gcc-configure-target.inc
> > --
> > 1.6.4.2
> >
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

