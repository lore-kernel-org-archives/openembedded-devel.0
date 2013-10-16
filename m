Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f172.google.com (mail-ie0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id E613A6CCA3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Oct 2013 04:20:01 +0000 (UTC)
Received: by mail-ie0-f172.google.com with SMTP id tp5so376475ieb.31
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2013 21:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=2I/Yb9JE5F9rsRqA7NgvW/Ai7xva3ErC2GxtKfOKLjs=;
	b=CyNdn4bFnayJZEGxgqR7BYAvBAKR/toWhXKZ5FRnUJRLvmH9vfsulRV/xyD1Gto+5j
	UL9tiP52LmHN+2aAECK/3G4q4zL0JBMk1cwgRMpFA/mVi1UQoOs3PHSsTKENgMXU703Y
	2Gm6j1AYrcTd2mwxmxkRVHdZ40NIDOhyUy66I8abph8d1CLKyOrWVQg1ttdT9wQBcdas
	sbzK47Z46RJ6jlFARRFDxJ1ItDzI9tlsDoBdy3zF9WZKpOGofXH6iUaDNvVUdYWjjWyr
	IYAH/A3y+koXzUQ+8ePiqNkC+6NjjdX9GuKaoTyStf5ssnzAlFykPVN8GvqPkw0VhPF8
	RWcw==
MIME-Version: 1.0
X-Received: by 10.50.26.36 with SMTP id i4mr522241igg.33.1381897203348; Tue,
	15 Oct 2013 21:20:03 -0700 (PDT)
Received: by 10.50.5.225 with HTTP; Tue, 15 Oct 2013 21:20:03 -0700 (PDT)
In-Reply-To: <20131016004738.GI3703@jama>
References: <1381653835-32079-1-git-send-email-raj.khem@gmail.com>
	<1381653835-32079-4-git-send-email-raj.khem@gmail.com>
	<20131016004738.GI3703@jama>
Date: Tue, 15 Oct 2013 21:20:03 -0700
Message-ID: <CAMKF1spG22HW2xdHXHTE_28STBiXKenX5xXrnSRTK587YGOHyQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH 4/6] libmikmod: Upgrade libmikmod_3.2.0.bb -> libmikmod_3.3.2.bb
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Oct 2013 04:20:02 -0000
Content-Type: text/plain; charset=UTF-8

On Tuesday, October 15, 2013, Martin Jansa wrote:

> On Sun, Oct 13, 2013 at 01:43:53AM -0700, Khem Raj wrote:
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  .../mikmod/libmikmod/autofoo.patch                 |  16 --
> >  .../mikmod/libmikmod/ldflags.patch                 |  12 --
> >  .../recipes-multimedia/mikmod/libmikmod/m4.patch   | 197
> ---------------------
> >  .../libmikmod/obsolete_automake_macros.patch       |  15 --
> >  .../{libmikmod_3.2.0.bb => libmikmod_3.3.2.bb}     |   9 +-
> >  5 files changed, 2 insertions(+), 247 deletions(-)
> >  delete mode 100644
> meta-oe/recipes-multimedia/mikmod/libmikmod/autofoo.patch
> >  delete mode 100644
> meta-oe/recipes-multimedia/mikmod/libmikmod/ldflags.patch
> >  delete mode 100644 meta-oe/recipes-multimedia/mikmod/libmikmod/m4.patch
> >  delete mode 100644
> meta-oe/recipes-multimedia/mikmod/libmikmod/obsolete_automake_macros.patch
> >  rename meta-oe/recipes-multimedia/mikmod/{libmikmod_3.2.0.bb =>
> libmikmod_3.3.2.bb} (68%)
> >
> > diff --git a/meta-oe/recipes-multimedia/mikmod/libmikmod/autofoo.patch
> b/meta-oe/recipes-multimedia/mikmod/libmikmod/autofoo.patch
> > deleted file mode 100644
> > index 22d8170..0000000
> > --- a/meta-oe/recipes-multimedia/mikmod/libmikmod/autofoo.patch
> > +++ /dev/null
> > @@ -1,16 +0,0 @@
> > -
> > -#
> > -# Patch managed by http://www.holgerschurig.de/patcher.html
> > -#
> > -
> > ---- libmikmod-3.2.0-beta2/configure.in~autofoo
> > -+++ libmikmod-3.2.0-beta2/configure.in
> > -@@ -415,8 +415,6 @@
> > -
> > - AC_CHECK_FUNCS(setenv snprintf srandom)
> > - AC_REPLACE_FUNCS(strcasecmp strdup strstr)
> > --# Change extension, as we use libtool
> > --LIBOBJS="`echo $LIBOBJS|sed -e 's/\.o/\.lo/g'`"
> > -
> > - AC_HEADER_EGREP(srandom,math.h,AC_DEFINE(SRANDOM_IN_MATH_H))
> > -
> > diff --git a/meta-oe/recipes-multimedia/mikmod/libmikmod/ldflags.patch
> b/meta-oe/recipes-multimedia/mikmod/libmikmod/ldflags.patch
> > deleted file mode 100644
> > index de31139..0000000
> > --- a/meta-oe/recipes-multimedia/mikmod/libmikmod/ldflags.patch
> > +++ /dev/null
> > @@ -1,12 +0,0 @@
> > -diff -urN libmikmod-3.1.12.orig/libmikmod/Makefile.in
> libmikmod-3.1.12/libmikmod/Makefile.in
> > ---- libmikmod-3.1.12.orig/libmikmod/Makefile.in      2004-01-21
> 17:43:52.000000000 +0000
> > -+++ libmikmod-3.1.12/libmikmod/Makefile.in   2009-04-02
> 11:28:01.000000000 +0000
> > -@@ -72,7 +72,7 @@
> > -     rm -f Makefile
> > -
> > - $(LIB): $(OBJ)
> > --    $(LIBTOOL) --mode=link $(CC) -version-info 3:0:0 -o $@ $(OBJ)
> $(LIBRARY_LIB) -rpath $(DESTDIR)$(libdir)
> > -+    $(LIBTOOL) --mode=link $(CC) $(LDFLAGS) -version-info 3:0:0 -o $@
> $(OBJ) $(LIBRARY_LIB) -rpath $(DESTDIR)$(libdir)
> > -
> > - dl_hpux.lo: $(top_srcdir)/dlapi/dl_hpux.c \
> > -                     $(top_srcdir)/dlapi/dlfcn.h
> > diff --git a/meta-oe/recipes-multimedia/mikmod/libmikmod/m4.patch
> b/meta-oe/recipes-multimedia/mikmod/libmikmod/m4.patch
> > deleted file mode 100644
> > index ac7f2d7..0000000
> > --- a/meta-oe/recipes-multimedia/mikmod/libmikmod/m4.patch
> > +++ /dev/null
> > @@ -1,197 +0,0 @@
> > ---- /dev/null
> > -+++ libmikmod-3.2.0-beta2/m4/esd.m4
> > -@@ -0,0 +1,194 @@
> > -+# Configure paths for ESD
> > -+# Manish Singh    98-9-30
> > -+# stolen back from Frank Belew
> > -+# stolen from Manish Singh
> > -+# Shamelessly stolen from Owen Taylor
> > -+
> > -+dnl AM_PATH_ESD([MINIMUM-VERSION, [ACTION-IF-FOUND [,
> ACTION-IF-NOT-FOUND]]])
> > -+dnl Test for ESD, and define ESD_CFLAGS and ESD_LIBS
> > -+dnl
> > -+AC_DEFUN(AM_PATH_ESD,
> > -+[dnl
> > -+dnl Get the cflags and libraries from the esd-config script
> > -+dnl
> > -+AC_ARG_WITH(esd-prefiIt looks like 3.3.2 archive was removed today and
> there is only 3.3.3.
>
> Old is still available on proper SF mirror:
> http://sourceforge.net/projects/mikmod/files/libmikmod/3.3.2/


Hmm I will update it to 3.3.3 and resend

>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com <javascript:;>
>

