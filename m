Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OZ8zv-0004is-CN
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Jul 2010 22:56:08 +0200
Received: by bwz10 with SMTP id 10so240131bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Jul 2010 13:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=aBUrMKibmPM57bixdDhtPf24y/kv3/F/juE4OsDpnnc=;
	b=G8qHJ5teQOXJN7tp6AWLO/ISbM9mu9gM2Mr9mLqKunppZrlZ1ot4ZCANtmm5HzsEqo
	BRDJadLdFIfpHKFkbCdSoMHYMYd31mcolubrITfBZ5N+d6YMStMbiTUn6U0np1Q3dEyE
	b/7ELxiFFedhyuhyqwMjBmWYtr+rpJqTbIND0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=KQ+NZvjPapdUp8EcSlZifKSgnJ5wm4hf93288hB9AnjFLGMPZ9adoXpupmsOthuDqe
	TrAnXAaB9iGon1HJuhNXVsANg8uRml4/rc6+32gXVXEFTONQRhZ7xrQ1aA6QkObOGyF9
	Uah/yvOjRhwG7ZxOU3FE2iLUY7wygY+uWwJns=
MIME-Version: 1.0
Received: by 10.204.75.210 with SMTP id z18mr13826370bkj.190.1279140964598; 
	Wed, 14 Jul 2010 13:56:04 -0700 (PDT)
Received: by 10.204.66.68 with HTTP; Wed, 14 Jul 2010 13:56:04 -0700 (PDT)
In-Reply-To: <AANLkTikaTTK2ydMB4WuP2X5MpHybcQYCqyRNXQpoMt11@mail.gmail.com>
References: <AANLkTinu9HQ1P7ppw_mBT5lX2zUuZ31QIL-sPQDdkPqM@mail.gmail.com>
	<1278833542-16021-1-git-send-email-fransmeulenbroeks@gmail.com>
	<AANLkTikZcDFs2duycC7tzPCVdu6-8vqjQKF_etRBGiAR@mail.gmail.com>
	<AANLkTikaTTK2ydMB4WuP2X5MpHybcQYCqyRNXQpoMt11@mail.gmail.com>
Date: Wed, 14 Jul 2010 22:56:04 +0200
Message-ID: <AANLkTikx4BBXnvBmnvz6P-bcgHs8G3VZWEKe68NJmE1g@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] gcc 4.1.x: patch Makefile.in for cross compile badness
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
X-List-Received-Date: Wed, 14 Jul 2010 20:56:08 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/7/12 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

> 2010/7/12 Khem Raj <raj.khem@gmail.com>:
> > On Sun, Jul 11, 2010 at 12:32 AM, Frans Meulenbroeks
> > <fransmeulenbroeks@gmail.com> wrote:
> >> When compiling gcc target code make passes -I(GMPINC)
> >> but this one points to the host dir (it is set to HOST_GMPINC
> >> which in oe points to tmp/sysroots/i686-linux/usr/include)
> >> This patch breaks the env var $(INCLUDES) in two
> >> and only uses the TARGET specific part for compiling libgcc
> >> and the crt stuff.
> >>
> >> This has been fully tested with gcc 4.1.2. For 4.1.0 and 4.1.0 it is
> >> verified that the patch applies properly
> >>
> >> Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
> >>
> >
> > Acked-by: Khem Raj <raj.khem@gmail.com>
> >
> > Please bump PR too.
>
> Will do. Thanks for the Ack.
>

Applied after bumping PR and fixing the issue reported by woglinde

> >
> >> ---
> >>
> >> see also  the thread
> >> [RFC] gcc patch to avoid host include when compiling gcc-cross
> >> on the oe ML
> >>
> >> I'll apply if I get two acks. After that I'll try to find time to
> >> port it to newer versions too (but if someone else would like to
> >> give that a stab, be my guest).
> >> ---
> >>  recipes/gcc/gcc-4.1.0.inc               |    4 ++-
> >>  recipes/gcc/gcc-4.1.0/Makefile.in.patch |   47
> +++++++++++++++++++++++++++++++
> >>  recipes/gcc/gcc-4.1.1.inc               |    1 +
> >>  recipes/gcc/gcc-4.1.1/Makefile.in.patch |   47
> +++++++++++++++++++++++++++++++
> >>  recipes/gcc/gcc-4.1.2.inc               |    1 +
> >>  recipes/gcc/gcc-4.1.2/Makefile.in.patch |   47
> +++++++++++++++++++++++++++++++
> >>  6 files changed, 146 insertions(+), 1 deletions(-)
> >>  create mode 100644 recipes/gcc/gcc-4.1.0/Makefile.in.patch
> >>  create mode 100644 recipes/gcc/gcc-4.1.1/Makefile.in.patch
> >>  create mode 100644 recipes/gcc/gcc-4.1.2/Makefile.in.patch
> >>
> >> diff --git a/recipes/gcc/gcc-4.1.0.inc b/recipes/gcc/gcc-4.1.0.inc
> >> index bfaf699..34d3502 100644
> >> --- a/recipes/gcc/gcc-4.1.0.inc
> >> +++ b/recipes/gcc/gcc-4.1.0.inc
> >> @@ -11,7 +11,9 @@ SRC_URI =
> "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=archive \
> >>        file://arm-nolibfloat.patch \
> >>        file://arm-softfloat.patch \
> >>        file://zecke-xgcc-cpp.patch \
> >> -    file://pr34130.patch"
> >> +       file://pr34130.patch \
> >> +       file://Makefile.in.patch \
> >> +        "
> >>
> >>  SRC_URI_append_fail-fast = " file://zecke-no-host-includes.patch "
> >>
> >> diff --git a/recipes/gcc/gcc-4.1.0/Makefile.in.patch
> b/recipes/gcc/gcc-4.1.0/Makefile.in.patch
> >> new file mode 100644
> >> index 0000000..140116a
> >> --- /dev/null
> >> +++ b/recipes/gcc/gcc-4.1.0/Makefile.in.patch
> >> @@ -0,0 +1,47 @@
> >> +Index: gcc-4.1.2/gcc/Makefile.in
> >> +===================================================================
> >> +--- gcc-4.1.2.orig/gcc/Makefile.in
> >> ++++ gcc-4.1.2/gcc/Makefile.in
> >> +@@ -405,7 +405,7 @@ LIMITS_H_TEST = [ -f $(SYSTEM_HEADER_DIR
> >> + TARGET_SYSTEM_ROOT = @TARGET_SYSTEM_ROOT@
> >> +
> >> + xmake_file=@xmake_file@
> >> +-tmake_file=@tmake_file@
> >> ++tmake_file=@tmake_file@/home/frans/oe/tmp_angstrom/work/nios2-linux/gcc-cross-4.1.2-r22.1/temp/t-oe
> >> + out_file=$(srcdir)/config/@out_file@
> >> + out_object_file=@out_object_file@
> >> + md_file=$(srcdir)/config/@md_file@
> >> +@@ -548,7 +548,7 @@ LIBGCC2_INCLUDES =
> >> + TARGET_LIBGCC2_CFLAGS =
> >> +
> >> + # Options to use when compiling crtbegin/end.
> >> +-CRTSTUFF_CFLAGS = -O2 $(GCC_CFLAGS) $(INCLUDES) $(MULTILIB_CFLAGS) -g0
> \
> >> ++CRTSTUFF_CFLAGS = -O2 $(GCC_CFLAGS) $(TARGET_INCLUDES)
> $(MULTILIB_CFLAGS) -g0 \
> >> +   -finhibit-size-directive -fno-inline-functions -fno-exceptions \
> >> +   -fno-zero-initialized-in-bss -fno-unit-at-a-time \
> >> +   $(INHIBIT_LIBC_CFLAGS)
> >> +@@ -845,9 +845,13 @@ BUILD_VARRAY = build/varray.o
> >> + # -I$(@D) and -I$(srcdir)/$(@D) cause the subdirectory of the file
> >> + # currently being compiled, in both source trees, to be examined as
> well.
> >> + # libintl.h will be found in ../intl if we are using the included
> libintl.
> >> +-INCLUDES = -I. -I$(@D) -I$(srcdir) -I$(srcdir)/$(@D) \
> >> ++#
> >> ++# TARGET_INCLUDES is added to avoid that GMPINC (which points to the
> host
> >> ++# include dir) is used for compiling libgcc.a
> >> ++TARGET_INCLUDES = -I. -I$(@D) -I$(srcdir) -I$(srcdir)/$(@D) \
> >> +          -I$(srcdir)/../include @INCINTL@ \
> >> +-         $(CPPINC) $(GMPINC)
> >> ++         $(CPPINC)
> >> ++INCLUDES = $(TARGET_INCLUDES) $(GMPINC)
> >> +
> >> + .c.o:
> >> +       $(CC) -c $(ALL_CFLAGS) $(ALL_CPPFLAGS) $< $(OUTPUT_OPTION)
> >> +@@ -1379,7 +1383,7 @@ libgcc.a: $(LIBGCC_DEPS)
> >> +       $(MAKE) \
> >> +         CFLAGS="$(CFLAGS) $(WARN_CFLAGS)" \
> >> +         CONFIG_H="$(TCONFIG_H)" TM_H="$(TM_H)" \
> >> +-        INCLUDES="$(INCLUDES)" \
> >> ++        INCLUDES="$(TARGET_INCLUDES)" \
> >> +         MAKEOVERRIDES= \
> >> +         -f libgcc.mk all
> >> +
> >> diff --git a/recipes/gcc/gcc-4.1.1.inc b/recipes/gcc/gcc-4.1.1.inc
> >> index 3b813b0..19f2423 100644
> >> --- a/recipes/gcc/gcc-4.1.1.inc
> >> +++ b/recipes/gcc/gcc-4.1.1.inc
> >> @@ -32,6 +32,7 @@ SRC_URI =
> "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=archive \
> >>         file://gcc-4.1.1-e300cx.patch \
> >>         file://pr34130.patch \
> >>        file://sed-fixinc-backslash.patch \
> >> +       file://Makefile.in.patch \
> >>        "
> >>
> >>  SRC_URI_append_sh3  = " file://sh3-installfix-fixheaders.patch "
> >> diff --git a/recipes/gcc/gcc-4.1.1/Makefile.in.patch
> b/recipes/gcc/gcc-4.1.1/Makefile.in.patch
> >> new file mode 100644
> >> index 0000000..140116a
> >> --- /dev/null
> >> +++ b/recipes/gcc/gcc-4.1.1/Makefile.in.patch
> >> @@ -0,0 +1,47 @@
> >> +Index: gcc-4.1.2/gcc/Makefile.in
> >> +===================================================================
> >> +--- gcc-4.1.2.orig/gcc/Makefile.in
> >> ++++ gcc-4.1.2/gcc/Makefile.in
> >> +@@ -405,7 +405,7 @@ LIMITS_H_TEST = [ -f $(SYSTEM_HEADER_DIR
> >> + TARGET_SYSTEM_ROOT = @TARGET_SYSTEM_ROOT@
> >> +
> >> + xmake_file=@xmake_file@
> >> +-tmake_file=@tmake_file@
> >> ++tmake_file=@tmake_file@/home/frans/oe/tmp_angstrom/work/nios2-linux/gcc-cross-4.1.2-r22.1/temp/t-oe
> >> + out_file=$(srcdir)/config/@out_file@
> >> + out_object_file=@out_object_file@
> >> + md_file=$(srcdir)/config/@md_file@
> >> +@@ -548,7 +548,7 @@ LIBGCC2_INCLUDES =
> >> + TARGET_LIBGCC2_CFLAGS =
> >> +
> >> + # Options to use when compiling crtbegin/end.
> >> +-CRTSTUFF_CFLAGS = -O2 $(GCC_CFLAGS) $(INCLUDES) $(MULTILIB_CFLAGS) -g0
> \
> >> ++CRTSTUFF_CFLAGS = -O2 $(GCC_CFLAGS) $(TARGET_INCLUDES)
> $(MULTILIB_CFLAGS) -g0 \
> >> +   -finhibit-size-directive -fno-inline-functions -fno-exceptions \
> >> +   -fno-zero-initialized-in-bss -fno-unit-at-a-time \
> >> +   $(INHIBIT_LIBC_CFLAGS)
> >> +@@ -845,9 +845,13 @@ BUILD_VARRAY = build/varray.o
> >> + # -I$(@D) and -I$(srcdir)/$(@D) cause the subdirectory of the file
> >> + # currently being compiled, in both source trees, to be examined as
> well.
> >> + # libintl.h will be found in ../intl if we are using the included
> libintl.
> >> +-INCLUDES = -I. -I$(@D) -I$(srcdir) -I$(srcdir)/$(@D) \
> >> ++#
> >> ++# TARGET_INCLUDES is added to avoid that GMPINC (which points to the
> host
> >> ++# include dir) is used for compiling libgcc.a
> >> ++TARGET_INCLUDES = -I. -I$(@D) -I$(srcdir) -I$(srcdir)/$(@D) \
> >> +          -I$(srcdir)/../include @INCINTL@ \
> >> +-         $(CPPINC) $(GMPINC)
> >> ++         $(CPPINC)
> >> ++INCLUDES = $(TARGET_INCLUDES) $(GMPINC)
> >> +
> >> + .c.o:
> >> +       $(CC) -c $(ALL_CFLAGS) $(ALL_CPPFLAGS) $< $(OUTPUT_OPTION)
> >> +@@ -1379,7 +1383,7 @@ libgcc.a: $(LIBGCC_DEPS)
> >> +       $(MAKE) \
> >> +         CFLAGS="$(CFLAGS) $(WARN_CFLAGS)" \
> >> +         CONFIG_H="$(TCONFIG_H)" TM_H="$(TM_H)" \
> >> +-        INCLUDES="$(INCLUDES)" \
> >> ++        INCLUDES="$(TARGET_INCLUDES)" \
> >> +         MAKEOVERRIDES= \
> >> +         -f libgcc.mk all
> >> +
> >> diff --git a/recipes/gcc/gcc-4.1.2.inc b/recipes/gcc/gcc-4.1.2.inc
> >> index 3b6cf30..8771e18 100644
> >> --- a/recipes/gcc/gcc-4.1.2.inc
> >> +++ b/recipes/gcc/gcc-4.1.2.inc
> >> @@ -29,6 +29,7 @@ SRC_URI =
> "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2;name=archive \
> >>        file://gfortran.patch \
> >>         file://gcc-4.0.2-e300c2c3.patch \
> >>         file://pr34130.patch \
> >> +       file://Makefile.in.patch \
> >>        "
> >>
> >>  SRC_URI_append_sh3  = " file://sh3-installfix-fixheaders.patch "
> >> diff --git a/recipes/gcc/gcc-4.1.2/Makefile.in.patch
> b/recipes/gcc/gcc-4.1.2/Makefile.in.patch
> >> new file mode 100644
> >> index 0000000..140116a
> >> --- /dev/null
> >> +++ b/recipes/gcc/gcc-4.1.2/Makefile.in.patch
> >> @@ -0,0 +1,47 @@
> >> +Index: gcc-4.1.2/gcc/Makefile.in
> >> +===================================================================
> >> +--- gcc-4.1.2.orig/gcc/Makefile.in
> >> ++++ gcc-4.1.2/gcc/Makefile.in
> >> +@@ -405,7 +405,7 @@ LIMITS_H_TEST = [ -f $(SYSTEM_HEADER_DIR
> >> + TARGET_SYSTEM_ROOT = @TARGET_SYSTEM_ROOT@
> >> +
> >> + xmake_file=@xmake_file@
> >> +-tmake_file=@tmake_file@
> >> ++tmake_file=@tmake_file@/home/frans/oe/tmp_angstrom/work/nios2-linux/gcc-cross-4.1.2-r22.1/temp/t-oe
> >> + out_file=$(srcdir)/config/@out_file@
> >> + out_object_file=@out_object_file@
> >> + md_file=$(srcdir)/config/@md_file@
> >> +@@ -548,7 +548,7 @@ LIBGCC2_INCLUDES =
> >> + TARGET_LIBGCC2_CFLAGS =
> >> +
> >> + # Options to use when compiling crtbegin/end.
> >> +-CRTSTUFF_CFLAGS = -O2 $(GCC_CFLAGS) $(INCLUDES) $(MULTILIB_CFLAGS) -g0
> \
> >> ++CRTSTUFF_CFLAGS = -O2 $(GCC_CFLAGS) $(TARGET_INCLUDES)
> $(MULTILIB_CFLAGS) -g0 \
> >> +   -finhibit-size-directive -fno-inline-functions -fno-exceptions \
> >> +   -fno-zero-initialized-in-bss -fno-unit-at-a-time \
> >> +   $(INHIBIT_LIBC_CFLAGS)
> >> +@@ -845,9 +845,13 @@ BUILD_VARRAY = build/varray.o
> >> + # -I$(@D) and -I$(srcdir)/$(@D) cause the subdirectory of the file
> >> + # currently being compiled, in both source trees, to be examined as
> well.
> >> + # libintl.h will be found in ../intl if we are using the included
> libintl.
> >> +-INCLUDES = -I. -I$(@D) -I$(srcdir) -I$(srcdir)/$(@D) \
> >> ++#
> >> ++# TARGET_INCLUDES is added to avoid that GMPINC (which points to the
> host
> >> ++# include dir) is used for compiling libgcc.a
> >> ++TARGET_INCLUDES = -I. -I$(@D) -I$(srcdir) -I$(srcdir)/$(@D) \
> >> +          -I$(srcdir)/../include @INCINTL@ \
> >> +-         $(CPPINC) $(GMPINC)
> >> ++         $(CPPINC)
> >> ++INCLUDES = $(TARGET_INCLUDES) $(GMPINC)
> >> +
> >> + .c.o:
> >> +       $(CC) -c $(ALL_CFLAGS) $(ALL_CPPFLAGS) $< $(OUTPUT_OPTION)
> >> +@@ -1379,7 +1383,7 @@ libgcc.a: $(LIBGCC_DEPS)
> >> +       $(MAKE) \
> >> +         CFLAGS="$(CFLAGS) $(WARN_CFLAGS)" \
> >> +         CONFIG_H="$(TCONFIG_H)" TM_H="$(TM_H)" \
> >> +-        INCLUDES="$(INCLUDES)" \
> >> ++        INCLUDES="$(TARGET_INCLUDES)" \
> >> +         MAKEOVERRIDES= \
> >> +         -f libgcc.mk all
> >> +
> >> --
> >> 1.6.4.2
> >>
> >>
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >>
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
>

