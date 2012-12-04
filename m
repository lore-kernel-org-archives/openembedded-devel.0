Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tfpk2-0001iR-0p
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 11:28:45 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so2093995eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Dec 2012 02:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=rdLn/1cOfTLjLQqD14vt2RmAcoUYgIBWLgiU2Ejqme0=;
	b=gr5RYrKNhLMWTw2Kt8RGx9iBbEimNIIJEgQGIEZHT5d5pqACp7jXTMgCxpn7jmr+on
	IgmxbMyp4YcqHlG8gPY6UZ/+pv9r5FeVQGdZmZeWRvuhEhutSlDG456CS/bioM28Orhp
	4qUyuII89lAAKVGlOe9JEQtmeTnegBW5zCWgQ6xEubdtlhMC5UzavEzowT73mv1rRwMw
	F3bZd/IUtNWzcumM6lltFERizTcbrXdTZh0ZaKP9YUhlA2U6q3kqKCF6fWaXT1rZW8Ba
	olM9j3KzAI54TcB3lgFo3xWjL3S8p7047IiHivzfGGRUjEaoPh+S8oi0z42SR0hw4o9H
	Dw8g==
Received: by 10.14.215.194 with SMTP id e42mr47007266eep.32.1354616059699;
	Tue, 04 Dec 2012 02:14:19 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e2sm1718260eeo.8.2012.12.04.02.14.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 04 Dec 2012 02:14:18 -0800 (PST)
Date: Tue, 4 Dec 2012 11:14:12 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121204101412.GB14870@jama.jama.net>
References: <1353937823-29509-1-git-send-email-ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <1353937823-29509-1-git-send-email-ross.burton@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] meta-oe: remove guile, it's in oe-core now
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
X-List-Received-Date: Tue, 04 Dec 2012 10:28:45 -0000
X-Groupsio-MsgNum: 41954
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IiVenqGWf+H9Y6IX"
Content-Disposition: inline

--IiVenqGWf+H9Y6IX
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 26, 2012 at 01:50:23PM +0000, Ross Burton wrote:
> Signed-off-by: Ross Burton <ross.burton@intel.com>

Also there is bad charset defined in this patch:
Content-Type: text/plain; charset=3Dy
Content-Transfer-Encoding: 8bit

$ git am -s patches/cur/1354615270.14870_19.jama\:2\,RS
fatal: cannot convert from y to UTF-8

I'll apply it manually.

Cheers,

> ---
>  meta-oe/recipes-support/guile/guile-1.8.7/18.diff  | 1743 --------------=
------
>  .../guile/guile-1.8.7/configure-fix.patch          |   10 -
>  .../guile/guile-native-1.8.7/cpp-linemarkers.patch |    8 -
>  .../guile/guile-native-1.8.7/reloc.patch           |   22 -
>  meta-oe/recipes-support/guile/guile-native.inc     |   13 -
>  .../recipes-support/guile/guile-native_1.8.7.bb    |   13 -
>  meta-oe/recipes-support/guile/guile.inc            |   47 -
>  meta-oe/recipes-support/guile/guile_1.8.7.bb       |   14 -
>  8 files changed, 1870 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/guile/guile-1.8.7/18.diff
>  delete mode 100644 meta-oe/recipes-support/guile/guile-1.8.7/configure-f=
ix.patch
>  delete mode 100644 meta-oe/recipes-support/guile/guile-native-1.8.7/cpp-=
linemarkers.patch
>  delete mode 100644 meta-oe/recipes-support/guile/guile-native-1.8.7/relo=
c.patch
>  delete mode 100644 meta-oe/recipes-support/guile/guile-native.inc
>  delete mode 100644 meta-oe/recipes-support/guile/guile-native_1.8.7.bb
>  delete mode 100644 meta-oe/recipes-support/guile/guile.inc
>  delete mode 100644 meta-oe/recipes-support/guile/guile_1.8.7.bb
>=20
> diff --git a/meta-oe/recipes-support/guile/guile-1.8.7/18.diff b/meta-oe/=
recipes-support/guile/guile-1.8.7/18.diff
> deleted file mode 100644
> index 9c9eefb..0000000
> --- a/meta-oe/recipes-support/guile/guile-1.8.7/18.diff
> +++ /dev/null
> @@ -1,1743 +0,0 @@
> -diff --git a/LICENSE b/LICENSE
> -index 213e34a..dda451e 100644
> ---- a/LICENSE
> -+++ b/LICENSE
> -@@ -1,2 +1,2 @@
> - Guile is covered under the terms of the GNU Lesser General Public
> --License, version 2.1.  See COPYING.LESSER.
> -+License, version 2.1 or later.  See COPYING.LESSER.
> -diff --git a/NEWS b/NEWS
> -index 0dcc411..564484f 100644
> ---- a/NEWS
> -+++ b/NEWS
> -@@ -5,6 +5,19 @@ See the end for copying conditions.
> - Please send Guile bug reports to bug-guile@gnu.org.
> -=20
> - =0C
> -+Changes in 1.8.8 (since 1.8.7)
> -+
> -+* Bugs fixed
> -+
> -+** Fix possible buffer overruns when parsing numbers
> -+** Avoid clash with system setjmp/longjmp on IA64
> -+** Don't dynamically link an extension that is already registered
> -+** Fix `wrong type arg' exceptions with IPv6 addresses
> -+** Fix typos in `(srfi srfi-19)'
> -+** Have `(srfi srfi-35)' provide named struct vtables
> -+** Fix some Interix build problems
> -+
> -+=0C
> - Changes in 1.8.7 (since 1.8.6)
> -=20
> - * Bugs fixed
> -diff --git a/THANKS b/THANKS
> -index 47d3cfa..48a105a 100644
> ---- a/THANKS
> -+++ b/THANKS
> -@@ -50,6 +50,7 @@ For fixes or providing information which led to a fix:
> -          Roland Haeder
> - 	   Sven Hartrumpf
> - 	   Eric Hanchrow
> -+	   Judy Hawkins
> -             Sam Hocevar
> - 	Patrick Horgan
> -            Ales Hvezda
> -@@ -64,12 +65,15 @@ For fixes or providing information which led to a fi=
x:
> -        Matthias K=F6ppe
> -            Matt Kraai
> -          Daniel Kraft
> -+            Jay Krell
> -            Jeff Long
> - 	  Marco Maggi
> -         Gregory Marton
> -+      Kjetil S. Matheussen
> -         Antoine Mathys
> -             Dan McMahill
> -           Roger Mc Murtrie
> -+          Scott McPeak
> -             Tim Mooney
> -         Han-Wen Nienhuys
> -             Jan Nieuwenhuizen
> -diff --git a/doc/ref/api-modules.texi b/doc/ref/api-modules.texi
> -index 9aeb08a..f6393db 100644
> ---- a/doc/ref/api-modules.texi
> -+++ b/doc/ref/api-modules.texi
> -@@ -758,7 +758,7 @@ Record definition with @code{define-record-type} (@p=
xref{SRFI-9}).
> - Read hash extension @code{#,()} (@pxref{SRFI-10}).
> -=20
> - @item (srfi srfi-11)
> --Multiple-value handling with @code{let-values} and @code{let-values*}
> -+Multiple-value handling with @code{let-values} and @code{let*-values}
> - (@pxref{SRFI-11}).
> -=20
> - @item (srfi srfi-13)
> -diff --git a/doc/ref/guile.texi b/doc/ref/guile.texi
> -index 7c17b36..3d9cde4 100644
> ---- a/doc/ref/guile.texi
> -+++ b/doc/ref/guile.texi
> -@@ -13,8 +13,8 @@ This reference manual documents Guile, GNU's Ubiquitou=
s Intelligent
> - Language for Extensions.  This is edition @value{MANUAL-EDITION}
> - corresponding to Guile @value{VERSION}.
> -=20
> --Copyright (C) 1996, 1997, 2000, 2001, 2002, 2003, 2004, 2005 Free
> --Software Foundation.
> -+Copyright (C) 1996, 1997, 2000, 2001, 2002, 2003, 2004, 2005, 2006,
> -+2007, 2008, 2009, 2010 Free Software Foundation.
> -=20
> - Permission is granted to copy, distribute and/or modify this document
> - under the terms of the GNU Free Documentation License, Version 1.2 or
> -diff --git a/doc/ref/posix.texi b/doc/ref/posix.texi
> -index 1cb273a..0a7e342 100644
> ---- a/doc/ref/posix.texi
> -+++ b/doc/ref/posix.texi
> -@@ -2310,8 +2310,8 @@ Convert a network address from an integer to a pri=
ntable string.
> -=20
> - @lisp
> - (inet-ntop AF_INET 2130706433) @result{} "127.0.0.1"
> --(inet-ntop AF_INET6 (- (expt 2 128) 1)) @result{}
> --ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff
> -+(inet-ntop AF_INET6 (- (expt 2 128) 1))
> -+  @result{} "ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff"
> - @end lisp
> - @end deffn
> -=20
> -@@ -2882,8 +2882,8 @@ same as @code{make-socket-address} would take to m=
ake such an object
> - (@pxref{Network Socket Address}).  The return value is unspecified.
> -=20
> - @example
> --(connect sock AF_INET INADDR_LOCALHOST 23)
> --(connect sock (make-socket-address AF_INET INADDR_LOCALHOST 23))
> -+(connect sock AF_INET INADDR_LOOPBACK 23)
> -+(connect sock (make-socket-address AF_INET INADDR_LOOPBACK 23))
> - @end example
> - @end deffn
> -=20
> -diff --git a/ice-9/debugging/ice-9-debugger-extensions.scm b/ice-9/debug=
ging/ice-9-debugger-extensions.scm
> -index a8b8c97..fe04fc0 100644
> ---- a/ice-9/debugging/ice-9-debugger-extensions.scm
> -+++ b/ice-9/debugging/ice-9-debugger-extensions.scm
> -@@ -39,7 +39,8 @@
> -       (else
> -        (define-module (ice-9 debugger))))
> -=20
> --(use-modules (ice-9 debugging steps))
> -+(use-modules (ice-9 debugging steps)
> -+             (ice-9 debugging trace))
> -=20
> - (define (assert-continuable state)
> -   ;; Check that debugger is in a state where `continuing' makes sense.
> -diff --git a/libguile/__scm.h b/libguile/__scm.h
> -index b198f9d..e75f1a9 100644
> ---- a/libguile/__scm.h
> -+++ b/libguile/__scm.h
> -@@ -3,7 +3,7 @@
> - #ifndef SCM___SCM_H
> - #define SCM___SCM_H
> -=20
> --/* Copyright (C) 1995,1996,1998,1999,2000,2001,2002,2003, 2006, 2007, 2=
008 Free Software Foundation, Inc.
> -+/* Copyright (C) 1995,1996,1998,1999,2000,2001,2002,2003, 2006, 2007, 2=
008, 2010 Free Software Foundation, Inc.
> -  *
> -  * This library is free software; you can redistribute it and/or
> -  * modify it under the terms of the GNU Lesser General Public
> -@@ -359,11 +359,9 @@
> - #define SCM_T_INT32_MIN   SCM_I_TYPE_MIN(scm_t_int32,SCM_T_UINT32_MAX)
> - #define SCM_T_INT32_MAX   SCM_I_TYPE_MAX(scm_t_int32,SCM_T_UINT32_MAX)
> -=20
> --#if SCM_HAVE_T_INT64
> - #define SCM_T_UINT64_MAX  SCM_I_UTYPE_MAX(scm_t_uint64)
> - #define SCM_T_INT64_MIN   SCM_I_TYPE_MIN(scm_t_int64,SCM_T_UINT64_MAX)
> - #define SCM_T_INT64_MAX   SCM_I_TYPE_MAX(scm_t_int64,SCM_T_UINT64_MAX)
> --#endif
> -=20
> - #if SCM_SIZEOF_LONG_LONG
> - #define SCM_I_ULLONG_MAX  SCM_I_UTYPE_MAX(unsigned long long)
> -@@ -409,19 +407,28 @@
> -     typedef struct {
> -       ucontext_t ctx;
> -       int fresh;
> --    } jmp_buf;
> --#   define setjmp(JB)				        \
> -+    } scm_i_jmp_buf;
> -+#   define SCM_I_SETJMP(JB)			        \
> -       ( (JB).fresh =3D 1,				        \
> -         getcontext (&((JB).ctx)),			\
> -         ((JB).fresh ? ((JB).fresh =3D 0, 0) : 1) )
> --#   define longjmp(JB,VAL) scm_ia64_longjmp (&(JB), VAL)
> --    void scm_ia64_longjmp (jmp_buf *, int);
> -+#   define SCM_I_LONGJMP(JB,VAL) scm_ia64_longjmp (&(JB), VAL)
> -+    void scm_ia64_longjmp (scm_i_jmp_buf *, int);
> - #  else                 	/* ndef __ia64__ */
> - #   include <setjmp.h>
> - #  endif			/* ndef __ia64__ */
> - # endif				/* ndef _CRAY1 */
> - #endif				/* ndef vms */
> -=20
> -+/* For any platform where SCM_I_SETJMP hasn't been defined in some
> -+   special way above, map SCM_I_SETJMP, SCM_I_LONGJMP and
> -+   scm_i_jmp_buf to setjmp, longjmp and jmp_buf. */
> -+#ifndef SCM_I_SETJMP
> -+#define scm_i_jmp_buf jmp_buf
> -+#define SCM_I_SETJMP setjmp
> -+#define SCM_I_LONGJMP longjmp
> -+#endif
> -+
> - /* James Clark came up with this neat one instruction fix for
> -  * continuations on the SPARC.  It flushes the register windows so
> -  * that all the state of the process is contained in the stack.
> -diff --git a/libguile/continuations.c b/libguile/continuations.c
> -index 69d2569..84a7fed 100644
> ---- a/libguile/continuations.c
> -+++ b/libguile/continuations.c
> -@@ -127,7 +127,7 @@ scm_make_continuation (int *first)
> -   continuation->offset =3D continuation->stack - src;
> -   memcpy (continuation->stack, src, sizeof (SCM_STACKITEM) * stack_size=
);
> -=20
> --  *first =3D !setjmp (continuation->jmpbuf);
> -+  *first =3D !SCM_I_SETJMP (continuation->jmpbuf);
> -   if (*first)
> -     {
> - #ifdef __ia64__
> -@@ -224,12 +224,12 @@ copy_stack_and_call (scm_t_contregs *continuation,=
 SCM val,
> -   scm_i_set_last_debug_frame (continuation->dframe);
> -=20
> -   continuation->throw_value =3D val;
> --  longjmp (continuation->jmpbuf, 1);
> -+  SCM_I_LONGJMP (continuation->jmpbuf, 1);
> - }
> -=20
> - #ifdef __ia64__
> - void
> --scm_ia64_longjmp (jmp_buf *JB, int VAL)
> -+scm_ia64_longjmp (scm_i_jmp_buf *JB, int VAL)
> - {
> -   scm_i_thread *t =3D SCM_I_CURRENT_THREAD;
> -=20
> -diff --git a/libguile/continuations.h b/libguile/continuations.h
> -index f6fb96a..c61ab2d 100644
> ---- a/libguile/continuations.h
> -+++ b/libguile/continuations.h
> -@@ -43,7 +43,7 @@ SCM_API scm_t_bits scm_tc16_continuation;
> - typedef struct=20
> - {
> -   SCM throw_value;
> --  jmp_buf jmpbuf;
> -+  scm_i_jmp_buf jmpbuf;
> -   SCM dynenv;
> - #ifdef __ia64__
> -   void *backing_store;
> -diff --git a/libguile/extensions.c b/libguile/extensions.c
> -index 1090b8b..29cb58c 100644
> ---- a/libguile/extensions.c
> -+++ b/libguile/extensions.c
> -@@ -76,6 +76,7 @@ load_extension (SCM lib, SCM init)
> -     {
> -       extension_t *ext;
> -       char *clib, *cinit;
> -+      int found =3D 0;
> -=20
> -       scm_dynwind_begin (0);
> -=20
> -@@ -89,10 +90,14 @@ load_extension (SCM lib, SCM init)
> - 	    && !strcmp (ext->init, cinit))
> - 	  {
> - 	    ext->func (ext->data);
> -+            found =3D 1;
> - 	    break;
> - 	  }
> -=20
> -       scm_dynwind_end ();
> -+
> -+      if (found)
> -+        return;
> -     }
> -=20
> -   /* Dynamically link the library. */
> -diff --git a/libguile/filesys.c b/libguile/filesys.c
> -index 70dfe15..c8acb13 100644
> ---- a/libguile/filesys.c
> -+++ b/libguile/filesys.c
> -@@ -23,6 +23,9 @@
> - #ifdef __hpux
> - #define _POSIX_C_SOURCE 199506L  /* for readdir_r */
> - #endif
> -+#if defined(__INTERIX) && !defined(_REENTRANT)
> -+# define _REENTRANT   /* ask Interix for readdir_r prototype */
> -+#endif
> -=20
> - #ifdef HAVE_CONFIG_H
> - #  include <config.h>
> -diff --git a/libguile/gen-scmconfig.c b/libguile/gen-scmconfig.c
> -index 85ebfae..e5de31d 100644
> ---- a/libguile/gen-scmconfig.c
> -+++ b/libguile/gen-scmconfig.c
> -@@ -315,28 +315,10 @@ main (int argc, char *argv[])
> -     return 1;
> -=20
> -   pf ("\n");
> --  pf ("/* 64-bit integer -- if available SCM_HAVE_T_INT64 will be 1 and=
\n"
> --      "   scm_t_int64 will be a suitable type, otherwise SCM_HAVE_T_INT=
64\n"
> --      "   will be 0. */\n");
> --  if (SCM_I_GSC_T_INT64)
> --  {
> --    pf ("#define SCM_HAVE_T_INT64 1 /* 0 or 1 */\n");
> --    pf ("typedef %s scm_t_int64;\n", SCM_I_GSC_T_INT64);
> --  }
> --  else
> --    pf ("#define SCM_HAVE_T_INT64 0 /* 0 or 1 */\n");
> --
> --  pf ("\n");
> --  pf ("/* 64-bit unsigned integer -- if available SCM_HAVE_T_UINT64 wil=
l\n"
> --      "   be 1 and scm_t_uint64 will be a suitable type, otherwise\n"
> --      "   SCM_HAVE_T_UINT64 will be 0. */\n");
> --  if (SCM_I_GSC_T_UINT64)
> --  {
> --    pf ("#define SCM_HAVE_T_UINT64 1 /* 0 or 1 */\n");
> --    pf ("typedef %s scm_t_uint64;\n", SCM_I_GSC_T_UINT64);
> --  }
> --  else
> --    pf ("#define SCM_HAVE_T_UINT64 0 /* 0 or 1 */\n");
> -+  pf ("#define SCM_HAVE_T_INT64 1 /* 0 or 1 */\n");
> -+  pf ("typedef %s scm_t_int64;\n", SCM_I_GSC_T_INT64);
> -+  pf ("#define SCM_HAVE_T_UINT64 1 /* 0 or 1 */\n");
> -+  pf ("typedef %s scm_t_uint64;\n", SCM_I_GSC_T_UINT64);
> -=20
> -   pf ("\n");
> -   pf ("/* scm_t_ptrdiff_t and size, always defined -- defined to long i=
f\n"
> -diff --git a/libguile/hashtab.c b/libguile/hashtab.c
> -index ea7fc69..1f1569c 100644
> ---- a/libguile/hashtab.c
> -+++ b/libguile/hashtab.c
> -@@ -1,4 +1,4 @@
> --/* Copyright (C) 1995,1996,1998,1999,2000,2001, 2003, 2004, 2006, 2008 =
Free Software Foundation, Inc.
> -+/* Copyright (C) 1995,1996,1998,1999,2000,2001, 2003, 2004, 2006, 2008,=
 2010 Free Software Foundation, Inc.
> -  *=20
> -  * This library is free software; you can redistribute it and/or
> -  * modify it under the terms of the GNU Lesser General Public
> -@@ -911,74 +911,6 @@ SCM_DEFINE (scm_hashx_remove_x, "hashx-remove!", 4,=
 0, 0,
> -=20
> - /* Hash table iterators */
> -=20
> --static const char s_scm_hash_fold[];
> --
> --SCM
> --scm_internal_hash_fold (SCM (*fn) (), void *closure, SCM init, SCM tabl=
e)
> --{
> --  long i, n;
> --  SCM buckets, result =3D init;
> -- =20
> --  if (SCM_HASHTABLE_P (table))
> --    buckets =3D SCM_HASHTABLE_VECTOR (table);
> --  else
> --    buckets =3D table;
> -- =20
> --  n =3D SCM_SIMPLE_VECTOR_LENGTH (buckets);
> --  for (i =3D 0; i < n; ++i)
> --    {
> --      SCM ls =3D SCM_SIMPLE_VECTOR_REF (buckets, i), handle;
> --      while (!scm_is_null (ls))
> --	{
> --	  if (!scm_is_pair (ls))
> --	    scm_wrong_type_arg (s_scm_hash_fold, SCM_ARG3, buckets);
> --	  handle =3D SCM_CAR (ls);
> --	  if (!scm_is_pair (handle))
> --	    scm_wrong_type_arg (s_scm_hash_fold, SCM_ARG3, buckets);
> --	  result =3D fn (closure, SCM_CAR (handle), SCM_CDR (handle), result);
> --	  ls =3D SCM_CDR (ls);
> --	}
> --    }
> --
> --  return result;
> --}
> --
> --/* The following redundant code is here in order to be able to support
> --   hash-for-each-handle.  An alternative would have been to replace
> --   this code and scm_internal_hash_fold above with a single
> --   scm_internal_hash_fold_handles, but we don't want to promote such
> --   an API. */
> --
> --static const char s_scm_hash_for_each[];
> --
> --void
> --scm_internal_hash_for_each_handle (SCM (*fn) (), void *closure, SCM tab=
le)
> --{
> --  long i, n;
> --  SCM buckets;
> -- =20
> --  if (SCM_HASHTABLE_P (table))
> --    buckets =3D SCM_HASHTABLE_VECTOR (table);
> --  else
> --    buckets =3D table;
> -- =20
> --  n =3D SCM_SIMPLE_VECTOR_LENGTH (buckets);
> --  for (i =3D 0; i < n; ++i)
> --    {
> --      SCM ls =3D SCM_SIMPLE_VECTOR_REF (buckets, i), handle;
> --      while (!scm_is_null (ls))
> --	{
> --	  if (!scm_is_pair (ls))
> --	    scm_wrong_type_arg (s_scm_hash_for_each, SCM_ARG3, buckets);
> --	  handle =3D SCM_CAR (ls);
> --	  if (!scm_is_pair (handle))
> --	    scm_wrong_type_arg (s_scm_hash_for_each, SCM_ARG3, buckets);
> --	  fn (closure, handle);
> --	  ls =3D SCM_CDR (ls);
> --	}
> --    }
> --}
> --
> - SCM_DEFINE (scm_hash_fold, "hash-fold", 3, 0, 0,=20
> -             (SCM proc, SCM init, SCM table),
> - 	    "An iterator over hash-table elements.\n"
> -@@ -1067,6 +999,72 @@ SCM_DEFINE (scm_hash_map_to_list, "hash-map->list"=
, 2, 0, 0,
> -=20
> - =0C
> -=20
> -+SCM
> -+scm_internal_hash_fold (SCM (*fn) (), void *closure, SCM init, SCM tabl=
e)
> -+{
> -+  long i, n;
> -+  SCM buckets, result =3D init;
> -+ =20
> -+  if (SCM_HASHTABLE_P (table))
> -+    buckets =3D SCM_HASHTABLE_VECTOR (table);
> -+  else
> -+    buckets =3D table;
> -+ =20
> -+  n =3D SCM_SIMPLE_VECTOR_LENGTH (buckets);
> -+  for (i =3D 0; i < n; ++i)
> -+    {
> -+      SCM ls =3D SCM_SIMPLE_VECTOR_REF (buckets, i), handle;
> -+      while (!scm_is_null (ls))
> -+	{
> -+	  if (!scm_is_pair (ls))
> -+	    scm_wrong_type_arg (s_scm_hash_fold, SCM_ARG3, buckets);
> -+	  handle =3D SCM_CAR (ls);
> -+	  if (!scm_is_pair (handle))
> -+	    scm_wrong_type_arg (s_scm_hash_fold, SCM_ARG3, buckets);
> -+	  result =3D fn (closure, SCM_CAR (handle), SCM_CDR (handle), result);
> -+	  ls =3D SCM_CDR (ls);
> -+	}
> -+    }
> -+
> -+  return result;
> -+}
> -+
> -+/* The following redundant code is here in order to be able to support
> -+   hash-for-each-handle.  An alternative would have been to replace
> -+   this code and scm_internal_hash_fold above with a single
> -+   scm_internal_hash_fold_handles, but we don't want to promote such
> -+   an API. */
> -+
> -+void
> -+scm_internal_hash_for_each_handle (SCM (*fn) (), void *closure, SCM tab=
le)
> -+{
> -+  long i, n;
> -+  SCM buckets;
> -+ =20
> -+  if (SCM_HASHTABLE_P (table))
> -+    buckets =3D SCM_HASHTABLE_VECTOR (table);
> -+  else
> -+    buckets =3D table;
> -+ =20
> -+  n =3D SCM_SIMPLE_VECTOR_LENGTH (buckets);
> -+  for (i =3D 0; i < n; ++i)
> -+    {
> -+      SCM ls =3D SCM_SIMPLE_VECTOR_REF (buckets, i), handle;
> -+      while (!scm_is_null (ls))
> -+	{
> -+	  if (!scm_is_pair (ls))
> -+	    scm_wrong_type_arg (s_scm_hash_for_each, SCM_ARG3, buckets);
> -+	  handle =3D SCM_CAR (ls);
> -+	  if (!scm_is_pair (handle))
> -+	    scm_wrong_type_arg (s_scm_hash_for_each, SCM_ARG3, buckets);
> -+	  fn (closure, handle);
> -+	  ls =3D SCM_CDR (ls);
> -+	}
> -+    }
> -+}
> -+
> -+=0C
> -+
> -=20
> - void
> - scm_hashtab_prehistory ()
> -diff --git a/libguile/iselect.h b/libguile/iselect.h
> -index 5a4b30d..b23a641 100644
> ---- a/libguile/iselect.h
> -+++ b/libguile/iselect.h
> -@@ -38,7 +38,12 @@
> - #ifdef FD_SET
> -=20
> - #define SELECT_TYPE fd_set
> -+#if defined(__INTERIX) && FD_SETSIZE =3D=3D 4096
> -+/* Interix defines FD_SETSIZE 4096 but select rejects that. */
> -+#define SELECT_SET_SIZE 1024
> -+#else
> - #define SELECT_SET_SIZE FD_SETSIZE
> -+#endif
> -=20
> - #else /* no FD_SET */
> -=20
> -diff --git a/libguile/numbers.c b/libguile/numbers.c
> -index 2e1635f..4f5ab31 100644
> ---- a/libguile/numbers.c
> -+++ b/libguile/numbers.c
> -@@ -1,4 +1,4 @@
> --/* Copyright (C) 1995,1996,1997,1998,1999,2000,2001,2002,2003,2004,2005=
, 2006, 2007, 2008, 2009 Free Software Foundation, Inc.
> -+/* Copyright (C) 1995,1996,1997,1998,1999,2000,2001,2002,2003,2004,2005=
, 2006, 2007, 2008, 2009, 2010 Free Software Foundation, Inc.
> -  *
> -  * Portions Copyright 1990, 1991, 1992, 1993 by AT&T Bell Laboratories
> -  * and Bellcore.  See scm_divide.
> -@@ -620,7 +620,14 @@ guile_ieee_init (void)
> - #elif HAVE_DINFINITY
> -   /* OSF */
> -   extern unsigned int DINFINITY[2];
> --  guile_Inf =3D (*((double *) (DINFINITY)));
> -+  union
> -+  {
> -+    double d;
> -+    int i[2];
> -+  } alias;
> -+  alias.i[0] =3D DINFINITY[0];
> -+  alias.i[1] =3D DINFINITY[1];
> -+  guile_Inf =3D alias.d;
> - #else
> -   double tmp =3D 1e+10;
> -   guile_Inf =3D tmp;
> -@@ -651,7 +658,14 @@ guile_ieee_init (void)
> -   {
> -     /* OSF */
> -     extern unsigned int DQNAN[2];
> --    guile_NaN =3D (*((double *)(DQNAN)));
> -+    union
> -+    {
> -+      double d;
> -+      int i[2];
> -+    } alias;
> -+    alias.i[0] =3D DQNAN[0];
> -+    alias.i[1] =3D DQNAN[1];
> -+    guile_NaN =3D alias.d;
> -   }
> - #else
> -   guile_NaN =3D guile_Inf / guile_Inf;
> -@@ -2663,17 +2677,26 @@ mem2decimal_from_point (SCM result, const char* =
mem, size_t len,
> - 	case 'l': case 'L':
> - 	case 's': case 'S':
> - 	  idx++;
> -+          if (idx =3D=3D len)
> -+            return SCM_BOOL_F;
> -+
> - 	  start =3D idx;
> - 	  c =3D mem[idx];
> - 	  if (c =3D=3D '-')
> - 	    {
> - 	      idx++;
> -+              if (idx =3D=3D len)
> -+                return SCM_BOOL_F;
> -+
> - 	      sign =3D -1;
> - 	      c =3D mem[idx];
> - 	    }
> - 	  else if (c =3D=3D '+')
> - 	    {
> - 	      idx++;
> -+              if (idx =3D=3D len)
> -+                return SCM_BOOL_F;
> -+
> - 	      sign =3D 1;
> - 	      c =3D mem[idx];
> - 	    }
> -@@ -2789,8 +2812,10 @@ mem2ureal (const char* mem, size_t len, unsigned =
int *p_idx,
> - 	  SCM divisor;
> -=20
> - 	  idx++;
> -+          if (idx =3D=3D len)
> -+            return SCM_BOOL_F;
> -=20
> --	  divisor =3D mem2uinteger (mem, len, &idx, radix, &x);
> -+          divisor =3D mem2uinteger (mem, len, &idx, radix, &x);
> - 	  if (scm_is_false (divisor))
> - 	    return SCM_BOOL_F;
> -=20
> -@@ -2911,11 +2936,15 @@ mem2complex (const char* mem, size_t len, unsign=
ed int idx,
> - 	      if (c =3D=3D '+')
> - 		{
> - 		  idx++;
> -+                  if (idx =3D=3D len)
> -+                    return SCM_BOOL_F;
> - 		  sign =3D 1;
> - 		}
> - 	      else if (c =3D=3D '-')
> - 		{
> - 		  idx++;
> -+                  if (idx =3D=3D len)
> -+                    return SCM_BOOL_F;
> - 		  sign =3D -1;
> - 		}
> - 	      else
> -@@ -5869,8 +5898,6 @@ scm_i_range_error (SCM bad_val, SCM min, SCM max)
> - #define SCM_FROM_TYPE_PROTO(arg) scm_from_uint32 (arg)
> - #include "libguile/conv-uinteger.i.c"
> -=20
> --#if SCM_HAVE_T_INT64
> --
> - #define TYPE                     scm_t_int64
> - #define TYPE_MIN                 SCM_T_INT64_MIN
> - #define TYPE_MAX                 SCM_T_INT64_MAX
> -@@ -5887,8 +5914,6 @@ scm_i_range_error (SCM bad_val, SCM min, SCM max)
> - #define SCM_FROM_TYPE_PROTO(arg) scm_from_uint64 (arg)
> - #include "libguile/conv-uinteger.i.c"
> -=20
> --#endif
> --
> - void
> - scm_to_mpz (SCM val, mpz_t rop)
> - {
> -diff --git a/libguile/numbers.h b/libguile/numbers.h
> -index 2c2fdcf..35263a4 100644
> ---- a/libguile/numbers.h
> -+++ b/libguile/numbers.h
> -@@ -3,7 +3,7 @@
> - #ifndef SCM_NUMBERS_H
> - #define SCM_NUMBERS_H
> -=20
> --/* Copyright (C) 1995,1996,1998,2000,2001,2002,2003,2004,2005, 2006 Fre=
e Software Foundation, Inc.
> -+/* Copyright (C) 1995,1996,1998,2000,2001,2002,2003,2004,2005, 2006, 20=
10 Free Software Foundation, Inc.
> -  *
> -  * This library is free software; you can redistribute it and/or
> -  * modify it under the terms of the GNU Lesser General Public
> -@@ -321,16 +321,12 @@ SCM_API SCM          scm_from_int32  (scm_t_int32 =
x);
> - SCM_API scm_t_uint32 scm_to_uint32   (SCM x);
> - SCM_API SCM          scm_from_uint32 (scm_t_uint32 x);
> -=20
> --#if SCM_HAVE_T_INT64
> --
> - SCM_API scm_t_int64  scm_to_int64    (SCM x);
> - SCM_API SCM          scm_from_int64  (scm_t_int64 x);
> -=20
> - SCM_API scm_t_uint64 scm_to_uint64   (SCM x);
> - SCM_API SCM          scm_from_uint64 (scm_t_uint64 x);
> -=20
> --#endif
> --
> - SCM_API void scm_to_mpz (SCM x, mpz_t rop);
> - SCM_API SCM  scm_from_mpz (mpz_t rop);
> -=20
> -diff --git a/libguile/random.c b/libguile/random.c
> -index 8d2ff03..693ed4a 100644
> ---- a/libguile/random.c
> -+++ b/libguile/random.c
> -@@ -1,4 +1,4 @@
> --/* Copyright (C) 1999,2000,2001, 2003, 2005, 2006 Free Software Foundat=
ion, Inc.
> -+/* Copyright (C) 1999,2000,2001, 2003, 2005, 2006, 2010 Free Software F=
oundation, Inc.
> -  * This library is free software; you can redistribute it and/or
> -  * modify it under the terms of the GNU Lesser General Public
> -  * License as published by the Free Software Foundation; either
> -@@ -75,8 +75,6 @@ scm_t_rng scm_the_rng;
> - #define M_PI 3.14159265359
> - #endif
> -=20
> --#if SCM_HAVE_T_UINT64
> --
> - unsigned long
> - scm_i_uniform32 (scm_t_i_rstate *state)
> - {
> -@@ -87,38 +85,6 @@ scm_i_uniform32 (scm_t_i_rstate *state)
> -   return w;
> - }
> -=20
> --#else
> --
> --/*     ww  This is a portable version of the same RNG without 64 bit
> -- *   * aa  arithmetic.
> -- *   ----
> -- *     xx  It is only intended to provide identical behaviour on
> -- *    xx   platforms without 8 byte longs or long longs until
> -- *    xx   someone has implemented the routine in assembler code.
> -- *   xxcc
> -- *   ----
> -- *   ccww
> -- */
> --
> --#define L(x) ((x) & 0xffff)
> --#define H(x) ((x) >> 16)
> --
> --unsigned long
> --scm_i_uniform32 (scm_t_i_rstate *state)
> --{
> --  scm_t_uint32 x1 =3D L (A) * L (state->w);
> --  scm_t_uint32 x2 =3D L (A) * H (state->w);
> --  scm_t_uint32 x3 =3D H (A) * L (state->w);
> --  scm_t_uint32 w =3D L (x1) + L (state->c);
> --  scm_t_uint32 m =3D H (x1) + L (x2) + L (x3) + H (state->c) + H (w);
> --  scm_t_uint32 x4 =3D H (A) * H (state->w);
> --  state->w =3D w =3D (L (m) << 16) + L (w);
> --  state->c =3D H (x2) + H (x3) + x4 + H (m);
> --  return w;
> --}
> --
> --#endif
> --
> - void
> - scm_i_init_rstate (scm_t_i_rstate *state, const char *seed, int n)
> - {
> -@@ -212,21 +178,49 @@ scm_c_exp1 (scm_t_rstate *state)
> -=20
> - unsigned char scm_masktab[256];
> -=20
> --unsigned long
> --scm_c_random (scm_t_rstate *state, unsigned long m)
> -+static inline scm_t_uint32
> -+scm_i_mask32 (scm_t_uint32 m)
> - {
> --  unsigned int r, mask;
> --  mask =3D (m < 0x100
> -+  return (m < 0x100
> - 	  ? scm_masktab[m]
> - 	  : (m < 0x10000
> - 	     ? scm_masktab[m >> 8] << 8 | 0xff
> - 	     : (m < 0x1000000
> - 		? scm_masktab[m >> 16] << 16 | 0xffff
> - 		: scm_masktab[m >> 24] << 24 | 0xffffff)));
> -+}
> -+
> -+static scm_t_uint32
> -+scm_c_random32 (scm_t_rstate *state, scm_t_uint32 m)
> -+{
> -+  scm_t_uint32 r, mask =3D scm_i_mask32 (m);
> -   while ((r =3D scm_the_rng.random_bits (state) & mask) >=3D m);
> -   return r;
> - }
> -=20
> -+/* Returns 32 random bits. */
> -+unsigned long
> -+scm_c_random (scm_t_rstate *state, unsigned long m)
> -+{
> -+  return scm_c_random32 (state, (scm_t_uint32)m);
> -+}
> -+
> -+scm_t_uint64
> -+scm_c_random64 (scm_t_rstate *state, scm_t_uint64 m)
> -+{
> -+  scm_t_uint64 r;
> -+  scm_t_uint32 mask;
> -+
> -+  if (m <=3D SCM_T_UINT32_MAX)
> -+    return scm_c_random32 (state, (scm_t_uint32) m);
> -+ =20
> -+  mask =3D scm_i_mask32 (m >> 32);
> -+  while ((r =3D ((scm_t_uint64) (scm_the_rng.random_bits (state) & mask=
) << 32)
> -+          | scm_the_rng.random_bits (state)) >=3D m)
> -+    ;
> -+  return r;
> -+}
> -+
> - /*
> -   SCM scm_c_random_bignum (scm_t_rstate *state, SCM m)
> -=20
> -@@ -247,24 +241,24 @@ scm_c_random_bignum (scm_t_rstate *state, SCM m)
> - {
> -   SCM result =3D scm_i_mkbig ();
> -   const size_t m_bits =3D mpz_sizeinbase (SCM_I_BIG_MPZ (m), 2);
> --  /* how many bits would only partially fill the last unsigned long? */
> --  const size_t end_bits =3D m_bits % (sizeof (unsigned long) * SCM_CHAR=
_BIT);
> --  unsigned long *random_chunks =3D NULL;
> --  const unsigned long num_full_chunks =3D
> --    m_bits / (sizeof (unsigned long) * SCM_CHAR_BIT);
> --  const unsigned long num_chunks =3D num_full_chunks + ((end_bits) ? 1 =
: 0);
> -+  /* how many bits would only partially fill the last u32? */
> -+  const size_t end_bits =3D m_bits % (sizeof (scm_t_uint32) * SCM_CHAR_=
BIT);
> -+  scm_t_uint32 *random_chunks =3D NULL;
> -+  const scm_t_uint32 num_full_chunks =3D
> -+    m_bits / (sizeof (scm_t_uint32) * SCM_CHAR_BIT);
> -+  const scm_t_uint32 num_chunks =3D num_full_chunks + ((end_bits) ? 1 :=
 0);
> -=20
> -   /* we know the result will be this big */
> -   mpz_realloc2 (SCM_I_BIG_MPZ (result), m_bits);
> -=20
> -   random_chunks =3D
> --    (unsigned long *) scm_gc_calloc (num_chunks * sizeof (unsigned long=
),
> -+    (scm_t_uint32 *) scm_gc_calloc (num_chunks * sizeof (scm_t_uint32),
> -                                      "random bignum chunks");
> -=20
> -   do
> -     {
> --      unsigned long *current_chunk =3D random_chunks + (num_chunks - 1);
> --      unsigned long chunks_left =3D num_chunks;
> -+      scm_t_uint32 *current_chunk =3D random_chunks + (num_chunks - 1);
> -+      scm_t_uint32 chunks_left =3D num_chunks;
> -=20
> -       mpz_set_ui (SCM_I_BIG_MPZ (result), 0);
> -      =20
> -@@ -273,23 +267,23 @@ scm_c_random_bignum (scm_t_rstate *state, SCM m)
> -           /* generate a mask with ones in the end_bits position, i.e. if
> -              end_bits is 3, then we'd have a mask of ...0000000111 */
> -           const unsigned long rndbits =3D scm_the_rng.random_bits (stat=
e);
> --          int rshift =3D (sizeof (unsigned long) * SCM_CHAR_BIT) - end_=
bits;
> --          unsigned long mask =3D ((unsigned long) ULONG_MAX) >> rshift;
> --          unsigned long highest_bits =3D rndbits & mask;
> -+          int rshift =3D (sizeof (scm_t_uint32) * SCM_CHAR_BIT) - end_b=
its;
> -+          scm_t_uint32 mask =3D 0xffffffff >> rshift;
> -+          scm_t_uint32 highest_bits =3D ((scm_t_uint32) rndbits) & mask;
> -           *current_chunk-- =3D highest_bits;
> -           chunks_left--;
> -         }
> -      =20
> -       while (chunks_left)
> -         {
> --          /* now fill in the remaining unsigned long sized chunks */
> -+          /* now fill in the remaining scm_t_uint32 sized chunks */
> -           *current_chunk-- =3D scm_the_rng.random_bits (state);
> -           chunks_left--;
> -         }
> -       mpz_import (SCM_I_BIG_MPZ (result),
> -                   num_chunks,
> -                   -1,
> --                  sizeof (unsigned long),
> -+                  sizeof (scm_t_uint32),
> -                   0,
> -                   0,
> -                   random_chunks);
> -@@ -297,7 +291,7 @@ scm_c_random_bignum (scm_t_rstate *state, SCM m)
> - 	 all bits in order not to get a distorted distribution) */
> -     } while (mpz_cmp (SCM_I_BIG_MPZ (result), SCM_I_BIG_MPZ (m)) >=3D 0=
);
> -   scm_gc_free (random_chunks,
> --               num_chunks * sizeof (unsigned long),
> -+               num_chunks * sizeof (scm_t_uint32),
> -                "random bignum chunks");
> -   return scm_i_normbig (result);
> - }
> -@@ -348,9 +342,17 @@ SCM_DEFINE (scm_random, "random", 1, 1, 0,
> -   SCM_VALIDATE_RSTATE (2, state);
> -   if (SCM_I_INUMP (n))
> -     {
> --      unsigned long m =3D SCM_I_INUM (n);
> --      SCM_ASSERT_RANGE (1, n, m > 0);
> --      return scm_from_ulong (scm_c_random (SCM_RSTATE (state), m));
> -+      unsigned long m =3D (unsigned long) SCM_I_INUM (n);
> -+      SCM_ASSERT_RANGE (1, n, SCM_I_INUM (n) > 0);
> -+#if SCM_SIZEOF_UNSIGNED_LONG <=3D 4
> -+      return scm_from_uint32 (scm_c_random (SCM_RSTATE (state),
> -+                                            (scm_t_uint32) m));
> -+#elif SCM_SIZEOF_UNSIGNED_LONG <=3D 8
> -+      return scm_from_uint64 (scm_c_random64 (SCM_RSTATE (state),
> -+                                              (scm_t_uint64) m));
> -+#else
> -+#error "Cannot deal with this platform's unsigned long size"
> -+#endif
> -     }
> -   SCM_VALIDATE_NIM (1, n);
> -   if (SCM_REALP (n))
> -diff --git a/libguile/random.h b/libguile/random.h
> -index 6ec43ff..0690b59 100644
> ---- a/libguile/random.h
> -+++ b/libguile/random.h
> -@@ -3,7 +3,7 @@
> - #ifndef SCM_RANDOM_H
> - #define SCM_RANDOM_H
> -=20
> --/* Copyright (C) 1999,2000,2001, 2006 Free Software Foundation, Inc.
> -+/* Copyright (C) 1999,2000,2001, 2006, 2010 Free Software Foundation, I=
nc.
> -  *
> -  * This library is free software; you can redistribute it and/or
> -  * modify it under the terms of the GNU Lesser General Public
> -@@ -45,6 +45,7 @@ typedef struct scm_t_rstate {
> -=20
> - typedef struct scm_t_rng {
> -   size_t rstate_size;				    /* size of random state */
> -+  /* Though this returns an unsigned long, it's only 32 bits of randomn=
ess. */
> -   unsigned long (*random_bits) (scm_t_rstate *state); /* gives 32 rando=
m bits */
> -   void (*init_rstate) (scm_t_rstate *state, const char *seed, int n);
> -   scm_t_rstate *(*copy_rstate) (scm_t_rstate *state);
> -@@ -62,6 +63,7 @@ typedef struct scm_t_i_rstate {
> -   unsigned long c;
> - } scm_t_i_rstate;
> -=20
> -+/* Though this returns an unsigned long, it's only 32 bits of randomnes=
s. */
> - SCM_API unsigned long scm_i_uniform32 (scm_t_i_rstate *);
> - SCM_API void scm_i_init_rstate (scm_t_i_rstate *, const char *seed, int=
 n);
> - SCM_API scm_t_i_rstate *scm_i_copy_rstate (scm_t_i_rstate *);
> -@@ -76,7 +78,10 @@ SCM_API scm_t_rstate *scm_c_default_rstate (void);
> - SCM_API double scm_c_uniform01 (scm_t_rstate *);
> - SCM_API double scm_c_normal01 (scm_t_rstate *);
> - SCM_API double scm_c_exp1 (scm_t_rstate *);
> -+/* Though this returns an unsigned long, it's only 32 bits of randomnes=
s. */
> - SCM_API unsigned long scm_c_random (scm_t_rstate *, unsigned long m);
> -+/* This one returns 64 bits of randomness. */
> -+SCM_API scm_t_uint64 scm_c_random64 (scm_t_rstate *state, scm_t_uint64 =
m);
> - SCM_API SCM scm_c_random_bignum (scm_t_rstate *, SCM m);
> -=20
> - =0C
> -diff --git a/libguile/socket.c b/libguile/socket.c
> -index f34b6d4..cb954f4 100644
> ---- a/libguile/socket.c
> -+++ b/libguile/socket.c
> -@@ -347,7 +347,7 @@ scm_to_ipv6 (scm_t_uint8 dst[16], SCM src)
> -       scm_remember_upto_here_1 (src);
> -     }
> -   else
> --    scm_wrong_type_arg (NULL, 0, src);
> -+    scm_wrong_type_arg_msg ("scm_to_ipv6", 0, src, "integer");
> - }
> -=20
> - #ifdef HAVE_INET_PTON
> -@@ -397,8 +397,8 @@ SCM_DEFINE (scm_inet_ntop, "inet-ntop", 2, 0, 0,
> - 	    "@var{family} can be @code{AF_INET} or @code{AF_INET6}.  E.g.,\n\n"
> - 	    "@lisp\n"
> - 	    "(inet-ntop AF_INET 2130706433) @result{} \"127.0.0.1\"\n"
> --	    "(inet-ntop AF_INET6 (- (expt 2 128) 1)) @result{}\n"
> --	    "ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff\n"
> -+	    "(inet-ntop AF_INET6 (- (expt 2 128) 1))\n"
> -+	    "  @result{} \"ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff\"\n"
> - 	    "@end lisp")
> - #define FUNC_NAME s_scm_inet_ntop
> - {
> -@@ -1167,7 +1167,8 @@ scm_to_sockaddr (SCM address, size_t *address_size)
> - 	  {
> - 	    struct sockaddr_in6 c_inet6;
> -=20
> --	    scm_to_ipv6 (c_inet6.sin6_addr.s6_addr, address);
> -+	    scm_to_ipv6 (c_inet6.sin6_addr.s6_addr,
> -+			 SCM_SIMPLE_VECTOR_REF (address, 1));
> - 	    c_inet6.sin6_port =3D
> - 	      htons (scm_to_ushort (SCM_SIMPLE_VECTOR_REF (address, 2)));
> - 	    c_inet6.sin6_flowinfo =3D
> -diff --git a/libguile/srfi-4.c b/libguile/srfi-4.c
> -index b0e052a..f2a9d7f 100644
> ---- a/libguile/srfi-4.c
> -+++ b/libguile/srfi-4.c
> -@@ -1,6 +1,6 @@
> - /* srfi-4.c --- Uniform numeric vector datatypes.
> -  *
> -- * 	Copyright (C) 2001, 2004, 2006 Free Software Foundation, Inc.
> -+ * 	Copyright (C) 2001, 2004, 2006, 2010 Free Software Foundation, Inc.
> -  *
> -  * This library is free software; you can redistribute it and/or
> -  * modify it under the terms of the GNU Lesser General Public
> -@@ -84,11 +84,7 @@ static const int uvec_sizes[12] =3D {
> -   1, 1,
> -   2, 2,
> -   4, 4,
> --#if SCM_HAVE_T_INT64
> -   8, 8,
> --#else
> --  sizeof (SCM), sizeof (SCM),
> --#endif
> -   sizeof(float), sizeof(double),
> -   2*sizeof(float), 2*sizeof(double)
> - };
> -@@ -127,10 +123,8 @@ uvec_print (SCM uvec, SCM port, scm_print_state *ps=
tate)
> -     scm_t_int16 *s16;
> -     scm_t_uint32 *u32;
> -     scm_t_int32 *s32;
> --#if SCM_HAVE_T_INT64
> -     scm_t_uint64 *u64;
> -     scm_t_int64 *s64;
> --#endif
> -     float *f32;
> -     double *f64;
> -     SCM *fake_64;
> -@@ -148,13 +142,8 @@ uvec_print (SCM uvec, SCM port, scm_print_state *ps=
tate)
> -     case SCM_UVEC_S16: np.s16 =3D (scm_t_int16 *) uptr; break;
> -     case SCM_UVEC_U32: np.u32 =3D (scm_t_uint32 *) uptr; break;
> -     case SCM_UVEC_S32: np.s32 =3D (scm_t_int32 *) uptr; break;
> --#if SCM_HAVE_T_INT64
> -     case SCM_UVEC_U64: np.u64 =3D (scm_t_uint64 *) uptr; break;
> -     case SCM_UVEC_S64: np.s64 =3D (scm_t_int64 *) uptr; break;
> --#else
> --    case SCM_UVEC_U64:
> --    case SCM_UVEC_S64: np.fake_64 =3D (SCM *) uptr; break;
> --#endif     =20
> -     case SCM_UVEC_F32: np.f32 =3D (float *) uptr; break;
> -     case SCM_UVEC_F64: np.f64 =3D (double *) uptr; break;
> -     case SCM_UVEC_C32: np.f32 =3D (float *) uptr; break;
> -@@ -179,14 +168,8 @@ uvec_print (SCM uvec, SCM port, scm_print_state *ps=
tate)
> - 	case SCM_UVEC_S16: scm_intprint (*np.s16, 10, port); np.s16++; break;
> - 	case SCM_UVEC_U32: scm_uintprint (*np.u32, 10, port); np.u32++; break;
> - 	case SCM_UVEC_S32: scm_intprint (*np.s32, 10, port); np.s32++; break;
> --#if SCM_HAVE_T_INT64
> - 	case SCM_UVEC_U64: scm_uintprint (*np.u64, 10, port); np.u64++; break;
> - 	case SCM_UVEC_S64: scm_intprint (*np.s64, 10, port); np.s64++; break;
> --#else
> --	case SCM_UVEC_U64:
> --	case SCM_UVEC_S64: scm_iprin1 (*np.fake_64, port, pstate);
> --	  np.fake_64++; break;
> --#endif
> - 	case SCM_UVEC_F32: scm_i_print_double (*np.f32, port); np.f32++; break;
> - 	case SCM_UVEC_F64: scm_i_print_double (*np.f64, port); np.f64++; break;
> - 	case SCM_UVEC_C32:
> -@@ -222,20 +205,6 @@ uvec_equalp (SCM a, SCM b)
> -     result =3D SCM_BOOL_F;
> -   else if (SCM_UVEC_LENGTH (a) !=3D SCM_UVEC_LENGTH (b))
> -     result =3D SCM_BOOL_F;
> --#if SCM_HAVE_T_INT64 =3D=3D 0
> --  else if (SCM_UVEC_TYPE (a) =3D=3D SCM_UVEC_U64
> --	   || SCM_UVEC_TYPE (a) =3D=3D SCM_UVEC_S64)
> --    {
> --      SCM *aptr =3D (SCM *)SCM_UVEC_BASE (a), *bptr =3D (SCM *)SCM_UVEC=
_BASE (b);
> --      size_t len =3D SCM_UVEC_LENGTH (a), i;
> --      for (i =3D 0; i < len; i++)
> --	if (scm_is_false (scm_num_eq_p (*aptr++, *bptr++)))
> --	  {
> --	    result =3D SCM_BOOL_F;
> --	    break;
> --	  }
> --    }
> --#endif
> -   else if (memcmp (SCM_UVEC_BASE (a), SCM_UVEC_BASE (b),
> - 		   SCM_UVEC_LENGTH (a) * uvec_sizes[SCM_UVEC_TYPE(a)]) !=3D 0)
> -     result =3D SCM_BOOL_F;
> -@@ -244,24 +213,6 @@ uvec_equalp (SCM a, SCM b)
> -   return result;
> - }
> -=20
> --/* Mark hook.  Only used when U64 and S64 are implemented as SCMs. */
> --
> --#if SCM_HAVE_T_INT64 =3D=3D 0
> --static SCM
> --uvec_mark (SCM uvec)
> --{
> --  if (SCM_UVEC_TYPE (uvec) =3D=3D SCM_UVEC_U64
> --      || SCM_UVEC_TYPE (uvec) =3D=3D SCM_UVEC_S64)
> --    {
> --      SCM *ptr =3D (SCM *)SCM_UVEC_BASE (uvec);
> --      size_t len =3D SCM_UVEC_LENGTH (uvec), i;
> --      for (i =3D 0; i < len; i++)
> --	scm_gc_mark (*ptr++);
> --    }
> --  return SCM_BOOL_F;
> --}
> --#endif
> --
> - /* Smob free hook for uniform numeric vectors. */
> - static size_t
> - uvec_free (SCM uvec)
> -@@ -318,15 +269,6 @@ alloc_uvec (int type, size_t len)
> -   if (len > SCM_I_SIZE_MAX / uvec_sizes[type])
> -     scm_out_of_range (NULL, scm_from_size_t (len));
> -   base =3D scm_gc_malloc (len * uvec_sizes[type], uvec_names[type]);
> --#if SCM_HAVE_T_INT64 =3D=3D 0
> --  if (type =3D=3D SCM_UVEC_U64 || type =3D=3D SCM_UVEC_S64)
> --    {
> --      SCM *ptr =3D (SCM *)base;
> --      size_t i;
> --      for (i =3D 0; i < len; i++)
> --	*ptr++ =3D SCM_UNSPECIFIED;
> --    }
> --#endif
> -   return take_uvec (type, base, len);
> - }
> -=20
> -@@ -349,17 +291,10 @@ uvec_fast_ref (int type, const void *base, size_t =
c_idx)
> -     return scm_from_uint32 (((scm_t_uint32*)base)[c_idx]);
> -   else if (type =3D=3D SCM_UVEC_S32)
> -     return scm_from_int32 (((scm_t_int32*)base)[c_idx]);
> --#if SCM_HAVE_T_INT64
> -   else if (type =3D=3D SCM_UVEC_U64)
> -     return scm_from_uint64 (((scm_t_uint64*)base)[c_idx]);
> -   else if (type =3D=3D SCM_UVEC_S64)
> -     return scm_from_int64 (((scm_t_int64*)base)[c_idx]);
> --#else
> --  else if (type =3D=3D SCM_UVEC_U64)
> --    return ((SCM *)base)[c_idx];
> --  else if (type =3D=3D SCM_UVEC_S64)
> --    return ((SCM *)base)[c_idx];
> --#endif
> -   else if (type =3D=3D SCM_UVEC_F32)
> -     return scm_from_double (((float*)base)[c_idx]);
> -   else if (type =3D=3D SCM_UVEC_F64)
> -@@ -374,22 +309,6 @@ uvec_fast_ref (int type, const void *base, size_t c=
_idx)
> -     return SCM_BOOL_F;
> - }
> -=20
> --#if SCM_HAVE_T_INT64 =3D=3D 0
> --static SCM scm_uint64_min, scm_uint64_max;
> --static SCM scm_int64_min, scm_int64_max;
> --
> --static void
> --assert_exact_integer_range (SCM val, SCM min, SCM max)
> --{
> --  if (!scm_is_integer (val)
> --      || scm_is_false (scm_exact_p (val)))
> --    scm_wrong_type_arg_msg (NULL, 0, val, "exact integer");
> --  if (scm_is_true (scm_less_p (val, min))
> --      || scm_is_true (scm_gr_p (val, max)))
> --    scm_out_of_range (NULL, val);
> --}
> --#endif
> --
> - static SCM_C_INLINE_KEYWORD void
> - uvec_fast_set_x (int type, void *base, size_t c_idx, SCM val)
> - {
> -@@ -405,23 +324,10 @@ uvec_fast_set_x (int type, void *base, size_t c_id=
x, SCM val)
> -     (((scm_t_uint32*)base)[c_idx]) =3D scm_to_uint32 (val);
> -   else if (type =3D=3D SCM_UVEC_S32)
> -     (((scm_t_int32*)base)[c_idx]) =3D scm_to_int32 (val);
> --#if SCM_HAVE_T_INT64
> -   else if (type =3D=3D SCM_UVEC_U64)
> -     (((scm_t_uint64*)base)[c_idx]) =3D scm_to_uint64 (val);
> -   else if (type =3D=3D SCM_UVEC_S64)
> -     (((scm_t_int64*)base)[c_idx]) =3D scm_to_int64 (val);
> --#else
> --  else if (type =3D=3D SCM_UVEC_U64)
> --    {
> --      assert_exact_integer_range (val, scm_uint64_min, scm_uint64_max);
> --      ((SCM *)base)[c_idx] =3D val;
> --    }
> --  else if (type =3D=3D SCM_UVEC_S64)
> --    {
> --      assert_exact_integer_range (val, scm_int64_min, scm_int64_max);
> --      ((SCM *)base)[c_idx] =3D val;
> --    }
> --#endif
> -   else if (type =3D=3D SCM_UVEC_F32)
> -     (((float*)base)[c_idx]) =3D scm_to_double (val);
> -   else if (type =3D=3D SCM_UVEC_F64)
> -@@ -1027,16 +933,12 @@ SCM_DEFINE (scm_uniform_vector_write, "uniform-ve=
ctor-write", 1, 3, 0,
> -=20
> - #define TYPE  SCM_UVEC_U64
> - #define TAG   u64
> --#if SCM_HAVE_T_UINT64
> - #define CTYPE scm_t_uint64
> --#endif
> - #include "libguile/srfi-4.i.c"
> -=20
> - #define TYPE  SCM_UVEC_S64
> - #define TAG   s64
> --#if SCM_HAVE_T_INT64
> - #define CTYPE scm_t_int64
> --#endif
> - #include "libguile/srfi-4.i.c"
> -=20
> - #define TYPE  SCM_UVEC_F32
> -@@ -1094,23 +996,9 @@ scm_init_srfi_4 (void)
> - {
> -   scm_tc16_uvec =3D scm_make_smob_type ("uvec", 0);
> -   scm_set_smob_equalp (scm_tc16_uvec, uvec_equalp);
> --#if SCM_HAVE_T_INT64 =3D=3D 0
> --  scm_set_smob_mark (scm_tc16_uvec, uvec_mark);
> --#endif
> -   scm_set_smob_free (scm_tc16_uvec, uvec_free);
> -   scm_set_smob_print (scm_tc16_uvec, uvec_print);
> -=20
> --#if SCM_HAVE_T_INT64 =3D=3D 0
> --  scm_uint64_min =3D
> --    scm_permanent_object (scm_from_int (0));
> --  scm_uint64_max =3D
> --    scm_permanent_object (scm_c_read_string ("18446744073709551615"));
> --  scm_int64_min =3D
> --    scm_permanent_object (scm_c_read_string ("-9223372036854775808"));
> --  scm_int64_max =3D
> --    scm_permanent_object (scm_c_read_string ("9223372036854775807"));
> --#endif
> --
> - #include "libguile/srfi-4.x"
> -=20
> - }
> -diff --git a/libguile/srfi-4.h b/libguile/srfi-4.h
> -index 7abbac8..2348c5a 100644
> ---- a/libguile/srfi-4.h
> -+++ b/libguile/srfi-4.h
> -@@ -2,7 +2,7 @@
> - #define SCM_SRFI_4_H
> - /* srfi-4.c --- Homogeneous numeric vector datatypes.
> -  *
> -- * 	Copyright (C) 2001, 2004, 2006 Free Software Foundation, Inc.
> -+ * 	Copyright (C) 2001, 2004, 2006, 2010 Free Software Foundation, Inc.
> -  *=20
> -  * This library is free software; you can redistribute it and/or
> -  * modify it under the terms of the GNU Lesser General Public
> -@@ -186,7 +186,6 @@ SCM_API SCM scm_u64vector_to_list (SCM uvec);
> - SCM_API SCM scm_list_to_u64vector (SCM l);
> - SCM_API SCM scm_any_to_u64vector (SCM obj);
> -=20
> --#if SCM_HAVE_T_UINT64
> - SCM_API SCM scm_take_u64vector (scm_t_uint64 *data, size_t n);
> - SCM_API const scm_t_uint64 *scm_array_handle_u64_elements (scm_t_array_=
handle *h);
> - SCM_API scm_t_uint64 *scm_array_handle_u64_writable_elements (scm_t_arr=
ay_handle *h);
> -@@ -198,7 +197,6 @@ SCM_API scm_t_uint64 *scm_u64vector_writable_element=
s (SCM uvec,
> - 						       scm_t_array_handle *h,
> - 						       size_t *lenp,
> - 						       ssize_t *incp);
> --#endif
> -=20
> - SCM_API SCM scm_s64vector_p (SCM obj);
> - SCM_API SCM scm_make_s64vector (SCM n, SCM fill);
> -@@ -210,7 +208,6 @@ SCM_API SCM scm_s64vector_to_list (SCM uvec);
> - SCM_API SCM scm_list_to_s64vector (SCM l);
> - SCM_API SCM scm_any_to_s64vector (SCM obj);
> -=20
> --#if SCM_HAVE_T_INT64
> - SCM_API SCM scm_take_s64vector (scm_t_int64 *data, size_t n);
> - SCM_API const scm_t_int64 *scm_array_handle_s64_elements (scm_t_array_h=
andle *h);
> - SCM_API scm_t_int64 *scm_array_handle_s64_writable_elements (scm_t_arra=
y_handle *h);
> -@@ -221,7 +218,6 @@ SCM_API scm_t_int64 *scm_s64vector_writable_elements=
 (SCM uvec,
> - 						      scm_t_array_handle *h,
> - 						      size_t *lenp,
> - 						      ssize_t *incp);
> --#endif
> -=20
> - SCM_API SCM scm_f32vector_p (SCM obj);
> - SCM_API SCM scm_make_f32vector (SCM n, SCM fill);
> -diff --git a/libguile/threads.c b/libguile/threads.c
> -index 95a905c..f2bb556 100644
> ---- a/libguile/threads.c
> -+++ b/libguile/threads.c
> -@@ -276,7 +276,7 @@ unblock_from_queue (SCM queue)
> -       var 't'
> -       // save registers.
> -       SCM_FLUSH_REGISTER_WINDOWS;      // sparc only
> --      setjmp (t->regs);                // here's most of the magic
> -+      SCM_I_SETJMP (t->regs);          // here's most of the magic
> -=20
> -    ... and returns.
> -=20
> -@@ -330,7 +330,7 @@ unblock_from_queue (SCM queue)
> -       t->top =3D SCM_STACK_PTR (&t);
> -       // save registers.
> -       SCM_FLUSH_REGISTER_WINDOWS;
> --      setjmp (t->regs);
> -+      SCM_I_SETJMP (t->regs);
> -       res =3D func(data);
> -       scm_enter_guile (t);
> -=20
> -@@ -388,7 +388,7 @@ suspend (void)
> -   t->top =3D SCM_STACK_PTR (&t);
> -   /* save registers. */
> -   SCM_FLUSH_REGISTER_WINDOWS;
> --  setjmp (t->regs);
> -+  SCM_I_SETJMP (t->regs);
> -   return t;
> - }
> -=20
> -diff --git a/libguile/threads.h b/libguile/threads.h
> -index 2b0e067..e22d9bd 100644
> ---- a/libguile/threads.h
> -+++ b/libguile/threads.h
> -@@ -107,7 +107,7 @@ typedef struct scm_i_thread {
> -   /* For keeping track of the stack and registers. */
> -   SCM_STACKITEM *base;
> -   SCM_STACKITEM *top;
> --  jmp_buf regs;
> -+  scm_i_jmp_buf regs;
> - #ifdef __ia64__
> -   void *register_backing_store_base;
> -   scm_t_contregs *pending_rbs_continuation;
> -diff --git a/libguile/throw.c b/libguile/throw.c
> -index 92c5a1a..fcfde47 100644
> ---- a/libguile/throw.c
> -+++ b/libguile/throw.c
> -@@ -53,7 +53,7 @@ static scm_t_bits tc16_jmpbuffer;
> - #define DEACTIVATEJB(x) \
> -   (SCM_SET_CELL_WORD_0 ((x), (SCM_CELL_WORD_0 (x) & ~(1L << 16L))))
> -=20
> --#define JBJMPBUF(OBJ)           ((jmp_buf *) SCM_CELL_WORD_1 (OBJ))
> -+#define JBJMPBUF(OBJ)           ((scm_i_jmp_buf *) SCM_CELL_WORD_1 (OBJ=
))
> - #define SETJBJMPBUF(x, v)        (SCM_SET_CELL_WORD_1 ((x), (scm_t_bits=
) (v)))
> - #define SCM_JBDFRAME(x)         ((scm_t_debug_frame *) SCM_CELL_WORD_2 =
(x))
> - #define SCM_SETJBDFRAME(x, v)    (SCM_SET_CELL_WORD_2 ((x), (scm_t_bits=
) (v)))
> -@@ -75,7 +75,7 @@ make_jmpbuf (void)
> - {
> -   SCM answer;
> -   SCM_NEWSMOB2 (answer, tc16_jmpbuffer, 0, 0);
> --  SETJBJMPBUF(answer, (jmp_buf *)0);
> -+  SETJBJMPBUF(answer, (scm_i_jmp_buf *)0);
> -   DEACTIVATEJB(answer);
> -   return answer;
> - }
> -@@ -85,7 +85,7 @@ make_jmpbuf (void)
> -=20
> - struct jmp_buf_and_retval	/* use only on the stack, in scm_catch */
> - {
> --  jmp_buf buf;			/* must be first */
> -+  scm_i_jmp_buf buf;		/* must be first */
> -   SCM throw_tag;
> -   SCM retval;
> - };
> -@@ -179,7 +179,7 @@ scm_c_catch (SCM tag,
> -   pre_unwind.lazy_catch_p =3D 0;
> -   SCM_SETJBPREUNWIND(jmpbuf, &pre_unwind);
> -=20
> --  if (setjmp (jbr.buf))
> -+  if (SCM_I_SETJMP (jbr.buf))
> -     {
> -       SCM throw_tag;
> -       SCM throw_args;
> -@@ -821,7 +821,7 @@ scm_ithrow (SCM key, SCM args, int noreturn SCM_UNUS=
ED)
> -       jbr->throw_tag =3D key;
> -       jbr->retval =3D args;
> -       scm_i_set_last_debug_frame (SCM_JBDFRAME (jmpbuf));
> --      longjmp (*JBJMPBUF (jmpbuf), 1);
> -+      SCM_I_LONGJMP (*JBJMPBUF (jmpbuf), 1);
> -     }
> -=20
> -   /* Otherwise, it's some random piece of junk.  */
> -diff --git a/libguile/vectors.c b/libguile/vectors.c
> -index eeb8569..074655c 100644
> ---- a/libguile/vectors.c
> -+++ b/libguile/vectors.c
> -@@ -1,4 +1,4 @@
> --/* Copyright (C) 1995,1996,1998,1999,2000,2001, 2006, 2008 Free Softwar=
e Foundation, Inc.
> -+/* Copyright (C) 1995,1996,1998,1999,2000,2001, 2006, 2008, 2010 Free S=
oftware Foundation, Inc.
> -  *=20
> -  * This library is free software; you can redistribute it and/or
> -  * modify it under the terms of the GNU Lesser General Public
> -@@ -465,7 +465,9 @@ SCM_DEFINE (scm_vector_move_left_x, "vector-move-lef=
t!", 5, 0, 0,
> -=20
> -   i =3D scm_to_unsigned_integer (start1, 0, len1);
> -   e =3D scm_to_unsigned_integer (end1, i, len1);
> --  j =3D scm_to_unsigned_integer (start2, 0, len2 - (i-e));
> -+  SCM_ASSERT_RANGE (SCM_ARG3, end1, (e-i) < len2);
> -+  j =3D scm_to_unsigned_integer (start2, 0, len2);
> -+  SCM_ASSERT_RANGE (SCM_ARG5, start2, j <=3D len2 - (e - i));
> -  =20
> -   i *=3D inc1;
> -   e *=3D inc1;
> -@@ -503,7 +505,11 @@ SCM_DEFINE (scm_vector_move_right_x, "vector-move-r=
ight!", 5, 0, 0,
> -=20
> -   i =3D scm_to_unsigned_integer (start1, 0, len1);
> -   e =3D scm_to_unsigned_integer (end1, i, len1);
> --  j =3D scm_to_unsigned_integer (start2, 0, len2 - (i-e));
> -+  SCM_ASSERT_RANGE (SCM_ARG3, end1, (e-i) < len2);
> -+  j =3D scm_to_unsigned_integer (start2, 0, len2);
> -+  SCM_ASSERT_RANGE (SCM_ARG5, start2, j <=3D len2 - (e - i));
> -+ =20
> -+  j +=3D (e - i);
> -  =20
> -   i *=3D inc1;
> -   e *=3D inc1;
> -diff --git a/scripts/snarf-check-and-output-texi b/scripts/snarf-check-a=
nd-output-texi
> -index ea33e17..8cd42e8 100755
> ---- a/scripts/snarf-check-and-output-texi
> -+++ b/scripts/snarf-check-and-output-texi
> -@@ -267,6 +267,17 @@ exec ${GUILE-guile} -l $0 -c "(apply $main (cdr (co=
mmand-line)))" "$@"
> -       (set! *file* file)
> -       (set! *line* line))
> -=20
> -+     ;; newer gccs like to throw around more location markers into the
> -+     ;; preprocessed source; these (hash . hash) bits are what they tra=
nslate to
> -+     ;; in snarfy terms.
> -+     (('location ('string . file) ('int . line) ('hash . 'hash))
> -+      (set! *file* file)
> -+      (set! *line* line))
> -+
> -+     (('location ('hash . 'hash) ('string . file) ('int . line) ('hash =
=2E 'hash))
> -+      (set! *file* file)
> -+      (set! *line* line))
> -+
> -      (('arglist rest ...)
> -       (set! *args* (do-arglist rest)))
> -=20
> -diff --git a/srfi/srfi-19.scm b/srfi/srfi-19.scm
> -index ffce990..482ec4e 100644
> ---- a/srfi/srfi-19.scm
> -+++ b/srfi/srfi-19.scm
> -@@ -1,6 +1,6 @@
> - ;;; srfi-19.scm --- Time/Date Library
> -=20
> --;; 	Copyright (C) 2001, 2002, 2003, 2005, 2006, 2007, 2008 Free Softwar=
e Foundation, Inc.
> -+;; 	Copyright (C) 2001, 2002, 2003, 2005, 2006, 2007, 2008, 2009 Free S=
oftware Foundation, Inc.
> - ;;
> - ;; This library is free software; you can redistribute it and/or
> - ;; modify it under the terms of the GNU Lesser General Public
> -@@ -41,7 +41,8 @@
> - (define-module (srfi srfi-19)
> -   :use-module (srfi srfi-6)
> -   :use-module (srfi srfi-8)
> --  :use-module (srfi srfi-9))
> -+  :use-module (srfi srfi-9)
> -+  :autoload   (ice-9 rdelim) (read-line))
> -=20
> - (begin-deprecated
> -  ;; Prevent `export' from re-exporting core bindings.  This behaviour
> -@@ -339,7 +340,7 @@
> -     (set-tm:hour result (date-hour date))
> -     ;; FIXME: SRFI day ranges from 0-31.  (not compatible with set-tm:m=
day).
> -     (set-tm:mday result (date-day date))
> --    (set-tm:month result (- (date-month date) 1))
> -+    (set-tm:mon result (- (date-month date) 1))
> -     ;; FIXME: need to signal error on range violation.
> -     (set-tm:year result (+ 1900 (date-year date)))
> -     (set-tm:isdst result -1)
> -@@ -528,33 +529,38 @@
> - ;; -- these depend on time-monotonic having the same definition as time=
-tai!
> - (define (time-monotonic->time-utc time-in)
> -   (if (not (eq? (time-type time-in) time-monotonic))
> --      (priv:time-error caller 'incompatible-time-types time-in))
> -+      (priv:time-error 'time-monotonic->time-utc
> -+                       'incompatible-time-types time-in))
> -   (let ((ntime (copy-time time-in)))
> -     (set-time-type! ntime time-tai)
> -     (priv:time-tai->time-utc! ntime ntime 'time-monotonic->time-utc)))
> -=20
> - (define (time-monotonic->time-utc! time-in)
> -   (if (not (eq? (time-type time-in) time-monotonic))
> --      (priv:time-error caller 'incompatible-time-types time-in))
> -+      (priv:time-error 'time-monotonic->time-utc!
> -+                       'incompatible-time-types time-in))
> -   (set-time-type! time-in time-tai)
> --  (priv:time-tai->time-utc! ntime ntime 'time-monotonic->time-utc))
> -+  (priv:time-tai->time-utc! time-in time-in 'time-monotonic->time-utc))
> -=20
> - (define (time-monotonic->time-tai time-in)
> -   (if (not (eq? (time-type time-in) time-monotonic))
> --      (priv:time-error caller 'incompatible-time-types time-in))
> -+      (priv:time-error 'time-monotonic->time-tai
> -+                       'incompatible-time-types time-in))
> -   (let ((ntime (copy-time time-in)))
> -     (set-time-type! ntime time-tai)
> -     ntime))
> -=20
> - (define (time-monotonic->time-tai! time-in)
> -   (if (not (eq? (time-type time-in) time-monotonic))
> --      (priv:time-error caller 'incompatible-time-types time-in))
> -+      (priv:time-error 'time-monotonic->time-tai!
> -+                       'incompatible-time-types time-in))
> -   (set-time-type! time-in time-tai)
> -   time-in)
> -=20
> - (define (time-utc->time-monotonic time-in)
> -   (if (not (eq? (time-type time-in) time-utc))
> --      (priv:time-error caller 'incompatible-time-types time-in))
> -+      (priv:time-error 'time-utc->time-monotonic
> -+                       'incompatible-time-types time-in))
> -   (let ((ntime (priv:time-utc->time-tai! time-in (make-time-unnormalize=
d #f #f #f)
> -                                          'time-utc->time-monotonic)))
> -     (set-time-type! ntime time-monotonic)
> -@@ -562,7 +568,8 @@
> -=20
> - (define (time-utc->time-monotonic! time-in)
> -   (if (not (eq? (time-type time-in) time-utc))
> --      (priv:time-error caller 'incompatible-time-types time-in))
> -+      (priv:time-error 'time-utc->time-monotonic!
> -+                       'incompatible-time-types time-in))
> -   (let ((ntime (priv:time-utc->time-tai! time-in time-in
> -                                          'time-utc->time-monotonic!)))
> -     (set-time-type! ntime time-monotonic)
> -@@ -570,14 +577,16 @@
> -=20
> - (define (time-tai->time-monotonic time-in)
> -   (if (not (eq? (time-type time-in) time-tai))
> --      (priv:time-error caller 'incompatible-time-types time-in))
> -+      (priv:time-error 'time-tai->time-monotonic
> -+                       'incompatible-time-types time-in))
> -   (let ((ntime (copy-time time-in)))
> -     (set-time-type! ntime time-monotonic)
> -     ntime))
> -=20
> - (define (time-tai->time-monotonic! time-in)
> -   (if (not (eq? (time-type time-in) time-tai))
> --      (priv:time-error caller 'incompatible-time-types time-in))
> -+      (priv:time-error 'time-tai->time-monotonic!
> -+                       'incompatible-time-types time-in))
> -   (set-time-type! time-in time-monotonic)
> -   time-in)
> -=20
> -@@ -780,7 +789,7 @@
> - (define (priv:year-day day month year)
> -   (let ((days-pr (assoc month priv:month-assoc)))
> -     (if (not days-pr)
> --        (priv:error 'date-year-day 'invalid-month-specification month))
> -+        (priv:time-error 'date-year-day 'invalid-month-specification mo=
nth))
> -     (if (and (priv:leap-year? year) (> month 2))
> -         (+ day (cdr days-pr) 1)
> -         (+ day (cdr days-pr)))))
> -@@ -1263,7 +1272,7 @@
> -    ((#\8) 8)
> -    ((#\9) 9)
> -    (else (priv:time-error 'bad-date-template-string
> --                          (list "Non-integer character" ch i)))))
> -+                          (list "Non-integer character" ch)))))
> -=20
> - ;; read an integer upto n characters long on port; upto -> #f is any le=
ngth
> - (define (priv:integer-reader upto port)
> -diff --git a/srfi/srfi-35.scm b/srfi/srfi-35.scm
> -index 2035466..ee20a10 100644
> ---- a/srfi/srfi-35.scm
> -+++ b/srfi/srfi-35.scm
> -@@ -57,6 +57,19 @@
> - 				    (number->string (object-address ct)
> - 						    16))))))
> -=20
> -+(define (%make-condition-type layout id parent all-fields)
> -+  (let ((struct (make-struct %condition-type-vtable 0
> -+                             (make-struct-layout layout) ;; layout
> -+                             print-condition             ;; printer
> -+                             id parent all-fields)))
> -+
> -+    ;; Hack to associate STRUCT with a name, providing a better name for
> -+    ;; GOOPS classes as returned by `class-of' et al.
> -+    (set-struct-vtable-name! struct (cond ((symbol? id) id)
> -+                                          ((string? id) (string->symbol=
 id))
> -+                                          (else         (string->symbol=
 ""))))
> -+    struct))
> -+
> - (define (condition-type? obj)
> -   "Return true if OBJ is a condition type."
> -   (and (struct? obj)
> -@@ -104,10 +117,8 @@ supertypes."
> - 					       field-names parent-fields)))
> - 		(let* ((all-fields (append parent-fields field-names))
> - 		       (layout     (struct-layout-for-condition all-fields)))
> --		  (make-struct %condition-type-vtable 0
> --			       (make-struct-layout layout) ;; layout
> --			       print-condition             ;; printer
> --			       id parent all-fields))
> -+		  (%make-condition-type layout
> -+                                        id parent all-fields))
> - 		(error "invalid condition type field names"
> - 		       field-names)))
> - 	  (error "parent is not a condition type" parent))
> -@@ -126,13 +137,10 @@ supertypes."
> -          (let* ((all-fields (append-map condition-type-all-fields
> -                                         parents))
> -                 (layout     (struct-layout-for-condition all-fields)))
> --           (make-struct %condition-type-vtable 0
> --                        (make-struct-layout layout) ;; layout
> --                        print-condition             ;; printer
> --                        id
> --                        parents                     ;; list of parents!
> --                        all-fields
> --                        all-fields)))))
> -+           (%make-condition-type layout
> -+                                 id
> -+                                 parents         ;; list of parents!
> -+                                 all-fields)))))
> -=20
> - =0C
> - ;;;
> -diff --git a/test-suite/standalone/Makefile.am b/test-suite/standalone/M=
akefile.am
> -index e7cfd82..058ce93 100644
> ---- a/test-suite/standalone/Makefile.am
> -+++ b/test-suite/standalone/Makefile.am
> -@@ -28,7 +28,9 @@ check_SCRIPTS =3D
> - BUILT_SOURCES =3D
> - EXTRA_DIST =3D
> -=20
> --TESTS_ENVIRONMENT =3D "${top_builddir}/pre-inst-guile-env"
> -+TESTS_ENVIRONMENT =3D 						\
> -+  builddir=3D"$(builddir)"					\
> -+  "${top_builddir}/pre-inst-guile-env"
> -=20
> - test_cflags =3D					\
> -   -I$(top_srcdir)/test-suite/standalone		\
> -diff --git a/test-suite/standalone/test-asmobs b/test-suite/standalone/t=
est-asmobs
> -index 2ea75d9..9689ab9 100755
> ---- a/test-suite/standalone/test-asmobs
> -+++ b/test-suite/standalone/test-asmobs
> -@@ -2,7 +2,8 @@
> - exec guile -q -s "$0" "$@"
> - !#
> -=20
> --(load-extension "libtest-asmobs" "libtest_asmobs_init")
> -+(load-extension (string-append (getenv "builddir") "/libtest-asmobs")
> -+                "libtest_asmobs_init")
> -=20
> - (define (test x v)
> -   (if v
> -diff --git a/test-suite/standalone/test-conversion.c b/test-suite/standa=
lone/test-conversion.c
> -index 41f99d3..caa835d 100644
> ---- a/test-suite/standalone/test-conversion.c
> -+++ b/test-suite/standalone/test-conversion.c
> -@@ -1,4 +1,4 @@
> --/* Copyright (C) 1999,2000,2001,2003,2004, 2006, 2007, 2008, 2009 Free =
Software Foundation, Inc.
> -+/* Copyright (C) 1999,2000,2001,2003,2004, 2006, 2007, 2008, 2009, 2010=
 Free Software Foundation, Inc.
> -  *
> -  * This library is free software; you can redistribute it and/or
> -  * modify it under the terms of the GNU Lesser General Public
> -@@ -702,10 +702,8 @@ DEFSTST (scm_to_int16)
> - DEFUTST (scm_to_uint16)
> - DEFSTST (scm_to_int32)
> - DEFUTST (scm_to_uint32)
> --#ifdef SCM_HAVE_T_INT64
> - DEFSTST (scm_to_int64)
> - DEFUTST (scm_to_uint64)
> --#endif
> -=20
> - #define TEST_8S(v,f,r,re,te) test_8s (v, tst_##f, #f, r, re, te)
> - #define TEST_8U(v,f,r,re,te) test_8u (v, tst_##f, #f, r, re, te)
> -@@ -745,11 +743,9 @@ test_int_sizes ()
> -   TEST_7S (scm_from_int32,  SCM_T_INT32_MAX+1LL, "-2147483648");
> -   TEST_7U (scm_from_uint32, SCM_T_UINT32_MAX,     "4294967295");
> -=20
> --#if SCM_HAVE_T_INT64
> -   TEST_7S (scm_from_int64,  SCM_T_INT64_MIN,  "-9223372036854775808");
> -   TEST_7S (scm_from_int64,  SCM_T_INT64_MAX,   "9223372036854775807");
> -   TEST_7U (scm_from_uint64, SCM_T_UINT64_MAX, "18446744073709551615");
> --#endif
> -=20
> -   TEST_8S ("91",   scm_to_schar,   91, 0, 0);
> -   TEST_8U ("91",   scm_to_uchar,   91, 0, 0);
> -@@ -794,7 +790,6 @@ test_int_sizes ()
> -   TEST_8U ("-1",          scm_to_uint32,                0, 1, 0);
> -   TEST_8U ("#f",          scm_to_uint32,                0, 0, 1);
> -=20
> --#if SCM_HAVE_T_INT64
> -   TEST_8S ("-9223372036854775808", scm_to_int64,   SCM_T_INT64_MIN, 0, =
0);
> -   TEST_8S ("9223372036854775807",  scm_to_int64,   SCM_T_INT64_MAX, 0, =
0);
> -   TEST_8S ("9223372036854775808",  scm_to_int64,                 0, 1, =
0);
> -@@ -803,7 +798,6 @@ test_int_sizes ()
> -   TEST_8U ("18446744073709551616", scm_to_uint64,                0, 1, =
0);
> -   TEST_8U ("-1",                   scm_to_uint64,                0, 1, =
0);
> -   TEST_8U ("#f",                   scm_to_uint64,                0, 0, =
1);
> --#endif
> -=20
> - }
> -=20
> -diff --git a/test-suite/tests/goops.test b/test-suite/tests/goops.test
> -index fa53fd2..fb2535a 100644
> ---- a/test-suite/tests/goops.test
> -+++ b/test-suite/tests/goops.test
> -@@ -140,7 +140,12 @@
> -     (eq? (class-of "foo") <string>))
> -=20
> -   (pass-if "port"
> --    (is-a? (%make-void-port "w") <port>)))
> -+    (is-a? (%make-void-port "w") <port>))
> -+
> -+  (pass-if "struct vtable"
> -+    ;; Previously, `class-of' would fail for nameless structs, i.e., st=
ructs
> -+    ;; for which `struct-vtable-name' is #f.
> -+    (is-a? (class-of (make-vtable-vtable "prprpr" 0)) <class>)))
> -=20
> -=20
> - (with-test-prefix "defining classes"
> -diff --git a/test-suite/tests/socket.test b/test-suite/tests/socket.test
> -index 4bfc415..e73f585 100644
> ---- a/test-suite/tests/socket.test
> -+++ b/test-suite/tests/socket.test
> -@@ -1,6 +1,6 @@
> - ;;;; socket.test --- test socket functions     -*- scheme -*-
> - ;;;;
> --;;;; Copyright (C) 2004, 2005, 2006, 2007, 2008 Free Software Foundatio=
n, Inc.
> -+;;;; Copyright (C) 2004, 2005, 2006, 2007, 2008, 2009 Free Software Fou=
ndation, Inc.
> - ;;;;
> - ;;;; This library is free software; you can redistribute it and/or
> - ;;;; modify it under the terms of the GNU Lesser General Public
> -@@ -174,13 +174,28 @@
> - ;;; AF_UNIX sockets and `make-socket-address'
> - ;;;
> -=20
> -+(define %tmpdir
> -+  ;; Honor `$TMPDIR', which tmpnam(3) doesn't do.
> -+  (or (getenv "TMPDIR") "/tmp"))
> -+
> -+(define %curdir
> -+  ;; Remember the current working directory.
> -+  (getcwd))
> -+
> -+;; Temporarily cd to %TMPDIR.  The goal is to work around path name
> -+;; limitations, which can lead to exceptions like:
> -+;;
> -+;;  (misc-error "scm_to_sockaddr"
> -+;;              "unix address path too long: ~A"
> -+;;              ("/tmp/nix-build-fb7bph4ifh0vr3ihigm702dzffdnapfj-guile=
-coverage-1.9.5.drv-0/guile-test-socket-1258553296-77619")
> -+;;              #f)
> -+(chdir %tmpdir)
> -+
> - (define (temp-file-path)
> --  ;; Return a temporary file path that honors `$TMPDIR', which `tmpnam'
> --  ;; doesn't do.
> --  (let ((dir (or (getenv "TMPDIR") "/tmp")))
> --    (string-append dir "/guile-test-socket-"
> --                   (number->string (current-time)) "-"
> --                   (number->string (random 100000)))))
> -+  ;; Return a temporary file name, assuming the current directory is %T=
MPDIR.
> -+  (string-append "guile-test-socket-"
> -+                 (number->string (current-time)) "-"
> -+                 (number->string (random 100000))))
> -=20
> -=20
> - (if (defined? 'AF_UNIX)
> -@@ -320,3 +335,91 @@
> -=20
> - 	#t)))
> -=20
> -+
> -+(if (defined? 'AF_INET6)
> -+    (with-test-prefix "AF_INET6/SOCK_STREAM"
> -+
> -+      ;; testing `bind', `listen' and `connect' on stream-oriented sock=
ets
> -+
> -+      (let ((server-socket (socket AF_INET6 SOCK_STREAM 0))
> -+	    (server-bound? #f)
> -+	    (server-listening? #f)
> -+	    (server-pid #f)
> -+	    (ipv6-addr 1)		; ::1
> -+	    (server-port 8889)
> -+	    (client-port 9998))
> -+
> -+	(pass-if "bind"
> -+	  (catch 'system-error
> -+	    (lambda ()
> -+	      (bind server-socket AF_INET6 ipv6-addr server-port)
> -+	      (set! server-bound? #t)
> -+	      #t)
> -+	    (lambda args
> -+	      (let ((errno (system-error-errno args)))
> -+		(cond ((=3D errno EADDRINUSE) (throw 'unresolved))
> -+		      (else (apply throw args)))))))
> -+
> -+	(pass-if "bind/sockaddr"
> -+	  (let* ((sock (socket AF_INET6 SOCK_STREAM 0))
> -+		 (sockaddr (make-socket-address AF_INET6 ipv6-addr client-port)))
> -+	    (catch 'system-error
> -+	      (lambda ()
> -+		(bind sock sockaddr)
> -+		#t)
> -+	      (lambda args
> -+		(let ((errno (system-error-errno args)))
> -+		  (cond ((=3D errno EADDRINUSE) (throw 'unresolved))
> -+			(else (apply throw args))))))))
> -+
> -+	(pass-if "listen"
> -+	  (if (not server-bound?)
> -+	      (throw 'unresolved)
> -+	      (begin
> -+		(listen server-socket 123)
> -+		(set! server-listening? #t)
> -+		#t)))
> -+
> -+	(if server-listening?
> -+	    (let ((pid (primitive-fork)))
> -+	      ;; Spawn a server process.
> -+	      (case pid
> -+		((-1) (throw 'unresolved))
> -+		((0)   ;; the kid:  serve two connections and exit
> -+		 (let serve ((conn
> -+			      (false-if-exception (accept server-socket)))
> -+			     (count 1))
> -+		   (if (not conn)
> -+		       (exit 1)
> -+		       (if (> count 0)
> -+			   (serve (false-if-exception (accept server-socket))
> -+				  (- count 1)))))
> -+		 (exit 0))
> -+		(else  ;; the parent
> -+		 (set! server-pid pid)
> -+		 #t))))
> -+
> -+	(pass-if "connect"
> -+	  (if (not server-pid)
> -+	      (throw 'unresolved)
> -+	      (let ((s (socket AF_INET6 SOCK_STREAM 0)))
> -+		(connect s AF_INET6 ipv6-addr server-port)
> -+		#t)))
> -+
> -+	(pass-if "connect/sockaddr"
> -+	  (if (not server-pid)
> -+	      (throw 'unresolved)
> -+	      (let ((s (socket AF_INET6 SOCK_STREAM 0)))
> -+		(connect s (make-socket-address AF_INET6 ipv6-addr server-port))
> -+		#t)))
> -+
> -+	(pass-if "accept"
> -+	  (if (not server-pid)
> -+	      (throw 'unresolved)
> -+	      (let ((status (cdr (waitpid server-pid))))
> -+		(eq? 0 (status:exit-val status)))))
> -+
> -+	#t)))
> -+
> -+;; Switch back to the previous directory.
> -+(false-if-exception (chdir %curdir))
> diff --git a/meta-oe/recipes-support/guile/guile-1.8.7/configure-fix.patc=
h b/meta-oe/recipes-support/guile/guile-1.8.7/configure-fix.patch
> deleted file mode 100644
> index c59798d..0000000
> --- a/meta-oe/recipes-support/guile/guile-1.8.7/configure-fix.patch
> +++ /dev/null
> @@ -1,10 +0,0 @@
> ---- /tmp/configure.in	2008-06-04 12:33:55.451086283 +0200
> -+++ guile-1.8.5/configure.in	2008-06-04 12:34:03.974994278 +0200
> -@@ -38,7 +38,6 @@
> - ]),
> -         [bug-guile@gnu.org])
> - AC_CONFIG_AUX_DIR([build-aux])
> --AC_CONFIG_MACRO_DIR([m4])
> - AC_CONFIG_SRCDIR(GUILE-VERSION)
> -=20
> - AM_INIT_AUTOMAKE([gnu no-define check-news])
> diff --git a/meta-oe/recipes-support/guile/guile-native-1.8.7/cpp-linemar=
kers.patch b/meta-oe/recipes-support/guile/guile-native-1.8.7/cpp-linemarke=
rs.patch
> deleted file mode 100644
> index 3e48932..0000000
> --- a/meta-oe/recipes-support/guile/guile-native-1.8.7/cpp-linemarkers.pa=
tch
> +++ /dev/null
> @@ -1,8 +0,0 @@
> ---- guile.orig/libguile/guile-snarf-docs.in	2009-07-03 18:19:00.00000000=
0 -0400
> -+++ guile/libguile/guile-snarf-docs.in	2009-11-19 12:55:32.487266268 -05=
00
> -@@ -23,4 +23,4 @@
> - ## Let the user override the preprocessor autoconf found.
> - test -n "${CPP+set}" || CPP=3D"@CPP@"
> -
> --${CPP} -DSCM_MAGIC_SNARF_DOCS "$@"
> -+${CPP} -P -DSCM_MAGIC_SNARF_DOCS "$@"
> diff --git a/meta-oe/recipes-support/guile/guile-native-1.8.7/reloc.patch=
 b/meta-oe/recipes-support/guile/guile-native-1.8.7/reloc.patch
> deleted file mode 100644
> index c061743..0000000
> --- a/meta-oe/recipes-support/guile/guile-native-1.8.7/reloc.patch
> +++ /dev/null
> @@ -1,22 +0,0 @@
> ---- guile-1.8.7.orig/guile-tools.in
> -+++ guile-1.8.7/guile-tools.in
> -@@ -42,14 +42,15 @@ Default scripts dir: $default_scriptsdir
> - EOF
> - }
> -
> --prefix=3D"@prefix@"
> --datarootdir=3D"@datarootdir@"
> --pkgdatadir=3D"@datadir@/@PACKAGE@"
> -+bindir=3D`dirname $0`
> -+bindir=3D`cd $bindir && pwd`
> -+prefix=3D`dirname $bindir`
> -+datarootdir=3D${prefix}/share
> -+pkgdatadir=3D${prefix}/share/guile
> - guileversion=3D"@GUILE_EFFECTIVE_VERSION@"
> - default_scriptsdir=3D$pkgdatadir/$guileversion/scripts
> -
> - # pre-install invocation frob
> --mydir=3D`dirname $0`
> - if [ -d "$mydir/scripts" -a -f "$mydir/scripts/Makefile.am" ] ; then
> -     default_scriptsdir=3D`(cd $mydir/scripts ; pwd)`
> - fi
> diff --git a/meta-oe/recipes-support/guile/guile-native.inc b/meta-oe/rec=
ipes-support/guile/guile-native.inc
> deleted file mode 100644
> index dfa126a..0000000
> --- a/meta-oe/recipes-support/guile/guile-native.inc
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -SECTION =3D "unknown"
> -DEPENDS =3D "gettext-native gmp-native"
> -
> -LICENSE =3D "LGPLv2.1"
> -
> -inherit autotools native
> -
> -S=3D"${WORKDIR}/guile-${PV}"
> -
> -do_configure_append() {
> -        find ${S} -name Makefile | xargs sed -i s:'-Werror':'':g
> -}
> -
> diff --git a/meta-oe/recipes-support/guile/guile-native_1.8.7.bb b/meta-o=
e/recipes-support/guile/guile-native_1.8.7.bb
> deleted file mode 100644
> index 2b2707a..0000000
> --- a/meta-oe/recipes-support/guile/guile-native_1.8.7.bb
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -require guile-native.inc
> -
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc9ba0d76ca3ef2a1d15a2ac839ef0=
1fa"
> -
> -PR =3D "r1"
> -SRC_URI =3D "http://ftp.gnu.org/pub/gnu/guile/guile-${PV}.tar.gz \
> -           file://configure-fix.patch \
> -           file://cpp-linemarkers.patch \
> -           file://reloc.patch \
> -          "
> -
> -SRC_URI[md5sum] =3D "991b5b3efcbbc3f7507d05bc42f80a5e"
> -SRC_URI[sha256sum] =3D "bfee6339d91955a637e7f541d96f5b1d53271b42bb4a37b8=
867d186a6c66f0b3"
> diff --git a/meta-oe/recipes-support/guile/guile.inc b/meta-oe/recipes-su=
pport/guile/guile.inc
> deleted file mode 100644
> index 842e8d7..0000000
> --- a/meta-oe/recipes-support/guile/guile.inc
> +++ /dev/null
> @@ -1,47 +0,0 @@
> -DESCRIPTION =3D "Guile is an interpreter for the Scheme programming lang=
uage, \
> -packaged as a library which can be incorporated into your programs."
> -HOMEPAGE =3D "http://www.gnu.org/software/guile/guile.html"
> -SECTION =3D "devel/scheme"
> -DEPENDS =3D "guile-native gmp libtool"
> -PACKAGES =3D+ "${PN}-el"
> -FILES_${PN}-el =3D "${datadir}/emacs"
> -DESCRIPTION_${PN}-el =3D "Emacs lisp files for Guile"
> -
> -LICENSE =3D "LGPLv2.1+"
> -
> -inherit autotools gettext
> -
> -acpaths =3D "-I ${S}/guile-config"
> -
> -EXTRA_OECONF =3D " \
> -		--without-threads \
> -		--without-included-ltdl \
> -               "	=09
> -
> -do_compile() {
> -	for i in $(find ${S} -name "Makefile") ; do
> -		sed -i -e s:-Werror::g $i
> -	done
> -
> -	(cd libguile; oe_runmake CC=3D"${BUILD_CC}" CFLAGS=3D"${BUILD_CFLAGS}" =
LDFLAGS=3D"${BUILD_LDFLAGS}" guile_filter_doc_snarfage)
> -	oe_runmake preinstguile=3D"`which guile`"
> -       =20
> -        sed -i -e s:${STAGING_DIR_TARGET}::g \
> -               -e s:/${TARGET_SYS}::g \
> -               -e s:-L/usr/lib::g \
> -               -e s:-isystem/usr/include::g \
> -               -e s:,/usr/lib:,\$\{libdir\}:g \
> -                  guile-1.8.pc
> -}
> -
> -SYSROOT_PREPROCESS_FUNCS =3D "guile_cross_config"
> -
> -guile_cross_config() {
> -	# Create guile-config returning target values instead of native values
> -	install -d ${SYSROOT_DESTDIR}${STAGING_BINDIR_CROSS}
> -	echo '#!'`which guile`$' \\\n-e main -s\n!#\n(define %guile-build-info =
'\'\( >guile-config.cross
> -	sed -n $'s:-isystem[^ ]* ::;s:-Wl,-rpath-link,[^ ]* ::;s:^[ \t]*{[ \t]*=
":  (:;s:",[ \t]*": . ":;s:" *}, *\\\\:"):;/^  (/p' <libguile/libpath.h >>g=
uile-config.cross
> -	echo '))' >>guile-config.cross
> -	cat guile-config/guile-config >>guile-config.cross
> -	install guile-config.cross ${SYSROOT_DESTDIR}${STAGING_BINDIR_CROSS}/gu=
ile-config
> -}
> diff --git a/meta-oe/recipes-support/guile/guile_1.8.7.bb b/meta-oe/recip=
es-support/guile/guile_1.8.7.bb
> deleted file mode 100644
> index d02fe42..0000000
> --- a/meta-oe/recipes-support/guile/guile_1.8.7.bb
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -require guile.inc
> -
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5711ae313ffd140741e741b88d9d4=
007"
> -
> -PR =3D "r1"
> -
> -SRC_URI =3D "http://ftp.gnu.org/pub/gnu/guile/guile-${PV}.tar.gz \
> -           file://configure-fix.patch \
> -           file://18.diff \
> -          "
> -
> -
> -SRC_URI[md5sum] =3D "991b5b3efcbbc3f7507d05bc42f80a5e"
> -SRC_URI[sha256sum] =3D "bfee6339d91955a637e7f541d96f5b1d53271b42bb4a37b8=
867d186a6c66f0b3"
> --=20
> 1.7.10
>=20
>=20

> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--IiVenqGWf+H9Y6IX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlC9zPQACgkQN1Ujt2V2gBxENACeOFdTgzTW1WwcnjI7Zvs11BGx
7IcAmwQ4S1aZTfmz+CpJrTAgn94+vuyu
=uXga
-----END PGP SIGNATURE-----

--IiVenqGWf+H9Y6IX--
