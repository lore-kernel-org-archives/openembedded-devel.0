Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RkZ9L-0003Jo-Ur
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Jan 2012 11:41:52 +0100
Received: by eekb47 with SMTP id b47so129941eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jan 2012 02:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=C3UEbJ9jEseJLLKR9dhOIRdhncKIefOFIqayN2P/g2k=;
	b=Pv3mAsTS6GnJIQE9WeEt5JWICTSfqFX02JqG+XgpfO6nf8C0qd3FM0K+PcJbmy+O/j
	4cC6Bfn4EzD7+jHJQxHLkSM4RAA+qiiIqq8ujSkHKyBDLtaD4uYp3hgb2XYPqJTd3TOP
	W/rrVm/tLUlR/3ap6U0Zwvh+13EWiHVn7g8c0=
Received: by 10.14.9.228 with SMTP id 76mr7570418eet.30.1326191660403;
	Tue, 10 Jan 2012 02:34:20 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 19sm126632258eew.7.2012.01.10.02.34.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 Jan 2012 02:34:19 -0800 (PST)
Date: Tue, 10 Jan 2012 11:34:17 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120110103417.GB3445@jama.jama.net>
References: <1326152656-6622-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1326152656-6622-1-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH 1/2] gcc-4.6: Fix ICE on x86_64 seen during vectorization
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
X-List-Received-Date: Tue, 10 Jan 2012 10:41:52 -0000
X-Groupsio-MsgNum: 36453
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hQiwHBbRI9kgIhsi"
Content-Disposition: inline

--hQiwHBbRI9kgIhsi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 09, 2012 at 03:44:15PM -0800, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../gcc-4.6/linaro/gcc-4.6-linaro-r106769.patch    |   66 ++++++++++++++=
-----
>  meta-oe/recipes-devtools/gcc/gcc-common-4.6.inc    |    2 +-
>  2 files changed, 49 insertions(+), 19 deletions(-)

Tested together with 2/2 on libav/libvpx/mplayer with
-fno-tree-vectorize removed and it works, no ICE on qemux86-64, thanks!

I'll send patch removing -fno-tree-vectorize from those recipes when
this is in.

Cheers,

> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106769.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106769.patch
> index ff34514..3a14923 100644
> --- a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106769.=
patch
> +++ b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106769.=
patch
> @@ -53,7 +53,7 @@
>  Index: gcc-4_6-branch/gcc/testsuite/gcc.dg/vect/slp-widen-mult-half.c
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  --- /dev/null	1970-01-01 00:00:00.000000000 +0000
> -+++ gcc-4_6-branch/gcc/testsuite/gcc.dg/vect/slp-widen-mult-half.c	2011-=
09-16 20:32:57.279056697 -0700
> ++++ gcc-4_6-branch/gcc/testsuite/gcc.dg/vect/slp-widen-mult-half.c	2012-=
01-09 15:03:29.156918805 -0800
>  @@ -0,0 +1,52 @@
>  +/* { dg-require-effective-target vect_int } */
>  +
> @@ -110,7 +110,7 @@ Index: gcc-4_6-branch/gcc/testsuite/gcc.dg/vect/slp-w=
iden-mult-half.c
>  Index: gcc-4_6-branch/gcc/testsuite/gcc.dg/vect/vect-widen-mult-half-u8.c
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  --- /dev/null	1970-01-01 00:00:00.000000000 +0000
> -+++ gcc-4_6-branch/gcc/testsuite/gcc.dg/vect/vect-widen-mult-half-u8.c	2=
011-09-16 20:32:57.279056697 -0700
> ++++ gcc-4_6-branch/gcc/testsuite/gcc.dg/vect/vect-widen-mult-half-u8.c	2=
012-01-09 15:03:29.156918805 -0800
>  @@ -0,0 +1,59 @@
>  +/* { dg-require-effective-target vect_int } */
>  +
> @@ -174,7 +174,7 @@ Index: gcc-4_6-branch/gcc/testsuite/gcc.dg/vect/vect-=
widen-mult-half-u8.c
>  Index: gcc-4_6-branch/gcc/testsuite/gcc.dg/vect/vect-widen-mult-half.c
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  --- /dev/null	1970-01-01 00:00:00.000000000 +0000
> -+++ gcc-4_6-branch/gcc/testsuite/gcc.dg/vect/vect-widen-mult-half.c	2011=
-09-16 20:32:57.279056697 -0700
> ++++ gcc-4_6-branch/gcc/testsuite/gcc.dg/vect/vect-widen-mult-half.c	2012=
-01-09 15:03:29.160918806 -0800
>  @@ -0,0 +1,49 @@
>  +/* { dg-require-effective-target vect_int } */
>  +
> @@ -227,8 +227,8 @@ Index: gcc-4_6-branch/gcc/testsuite/gcc.dg/vect/vect-=
widen-mult-half.c
>  +
>  Index: gcc-4_6-branch/gcc/tree-vect-loop.c
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4_6-branch.orig/gcc/tree-vect-loop.c	2011-09-16 20:31:52.0000000=
00 -0700
> -+++ gcc-4_6-branch/gcc/tree-vect-loop.c	2011-09-16 20:32:57.289056641 -0=
700
> +--- gcc-4_6-branch.orig/gcc/tree-vect-loop.c	2012-01-09 15:02:15.0000000=
00 -0800
> ++++ gcc-4_6-branch/gcc/tree-vect-loop.c	2012-01-09 15:03:29.160918806 -0=
800
>  @@ -181,6 +181,8 @@
>     stmt_vec_info stmt_info;
>     int i;
> @@ -379,8 +379,8 @@ Index: gcc-4_6-branch/gcc/tree-vect-loop.c
>  =20
>  Index: gcc-4_6-branch/gcc/tree-vect-patterns.c
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4_6-branch.orig/gcc/tree-vect-patterns.c	2011-09-16 20:31:52.000=
000000 -0700
> -+++ gcc-4_6-branch/gcc/tree-vect-patterns.c	2011-09-16 20:32:57.28905664=
1 -0700
> +--- gcc-4_6-branch.orig/gcc/tree-vect-patterns.c	2012-01-09 15:02:15.000=
000000 -0800
> ++++ gcc-4_6-branch/gcc/tree-vect-patterns.c	2012-01-09 15:03:29.16091880=
6 -0800
>  @@ -39,10 +39,13 @@
>   #include "diagnostic-core.h"
>  =20
> @@ -930,8 +930,8 @@ Index: gcc-4_6-branch/gcc/tree-vect-patterns.c
>       fprintf (vect_dump, "=3D=3D=3D vect_pattern_recog =3D=3D=3D");
>  Index: gcc-4_6-branch/gcc/tree-vect-slp.c
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4_6-branch.orig/gcc/tree-vect-slp.c	2011-09-16 20:31:52.00000000=
0 -0700
> -+++ gcc-4_6-branch/gcc/tree-vect-slp.c	2011-09-16 20:32:57.289056641 -07=
00
> +--- gcc-4_6-branch.orig/gcc/tree-vect-slp.c	2012-01-09 15:02:15.00000000=
0 -0800
> ++++ gcc-4_6-branch/gcc/tree-vect-slp.c	2012-01-09 15:03:29.160918806 -08=
00
>  @@ -152,7 +152,9 @@
>         if (loop && def_stmt && gimple_bb (def_stmt)
>             && flow_bb_inside_loop_p (loop, gimple_bb (def_stmt))
> @@ -945,8 +945,8 @@ Index: gcc-4_6-branch/gcc/tree-vect-slp.c
>               *pattern0 =3D true;
>  Index: gcc-4_6-branch/gcc/tree-vect-stmts.c
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4_6-branch.orig/gcc/tree-vect-stmts.c	2011-09-16 20:31:52.000000=
000 -0700
> -+++ gcc-4_6-branch/gcc/tree-vect-stmts.c	2011-09-16 20:32:57.289056641 -=
0700
> +--- gcc-4_6-branch.orig/gcc/tree-vect-stmts.c	2012-01-09 15:02:15.000000=
000 -0800
> ++++ gcc-4_6-branch/gcc/tree-vect-stmts.c	2012-01-09 15:06:23.636927250 -=
0800
>  @@ -126,33 +126,72 @@
>  =20
>   static void
> @@ -1007,6 +1007,8 @@ Index: gcc-4_6-branch/gcc/tree-vect-stmts.c
>  +             pattern that can potentially be vectorized.  Don't mark th=
e stmt
>  +             as relevant/live because it's not going to be vectorized.
>  +             Instead mark the pattern-stmt that replaces it.  */
> ++
> ++          pattern_stmt =3D STMT_VINFO_RELATED_STMT (stmt_info);
>  =20
>  -      /* This is the last stmt in a sequence that was detected as a
>  -         pattern that can potentially be vectorized.  Don't mark the st=
mt
> @@ -1022,8 +1024,6 @@ Index: gcc-4_6-branch/gcc/tree-vect-stmts.c
>  -      save_relevant =3D STMT_VINFO_RELEVANT (stmt_info);
>  -      save_live_p =3D STMT_VINFO_LIVE_P (stmt_info);
>  -      stmt =3D pattern_stmt;
> -+          pattern_stmt =3D STMT_VINFO_RELATED_STMT (stmt_info);
> -+
>  +          if (vect_print_dump_info (REPORT_DETAILS))
>  +            fprintf (vect_dump, "last stmt in pattern. don't mark"
>  +                                " relevant/live.");
> @@ -1181,11 +1181,11 @@ Index: gcc-4_6-branch/gcc/tree-vect-stmts.c
>        In basic blocks we only analyze statements that are a part of some=
 SLP
>  -     instance, therefore, all the statements are relevant.  */
>  +     instance, therefore, all the statements are relevant. =20
> -=20
> ++
>  +     Pattern statement need to be analyzed instead of the original stat=
ement
>  +     if the original statement is not relevant. Otherwise, we analyze b=
oth
>  +     statements.  */
> -+
> +=20
>  +  pattern_stmt =3D STMT_VINFO_RELATED_STMT (stmt_info);
>     if (!STMT_VINFO_RELEVANT_P (stmt_info)
>         && !STMT_VINFO_LIVE_P (stmt_info))
> @@ -1222,7 +1222,37 @@ Index: gcc-4_6-branch/gcc/tree-vect-stmts.c
>  =20
>     switch (STMT_VINFO_DEF_TYPE (stmt_info))
>       {
> -@@ -5605,8 +5687,12 @@
> +@@ -5074,7 +5156,6 @@
> +   bool is_store =3D false;
> +   gimple vec_stmt =3D NULL;
> +   stmt_vec_info stmt_info =3D vinfo_for_stmt (stmt);
> +-  gimple orig_stmt_in_pattern;
> +   bool done;
> +=20
> +   switch (STMT_VINFO_TYPE (stmt_info))
> +@@ -5213,21 +5294,7 @@
> +     }
> +=20
> +   if (vec_stmt)
> +-    {
> +       STMT_VINFO_VEC_STMT (stmt_info) =3D vec_stmt;
> +-      orig_stmt_in_pattern =3D STMT_VINFO_RELATED_STMT (stmt_info);
> +-      if (orig_stmt_in_pattern)
> +-	{
> +-	  stmt_vec_info stmt_vinfo =3D vinfo_for_stmt (orig_stmt_in_pattern);
> +-	  /* STMT was inserted by the vectorizer to replace a computation idio=
m.
> +-	     ORIG_STMT_IN_PATTERN is a stmt in the original sequence that
> +-	     computed this idiom.  We need to record a pointer to VEC_STMT in
> +-	     the stmt_info of ORIG_STMT_IN_PATTERN.  See more details in the
> +-	     documentation of vect_pattern_recog.  */
> +-	  if (STMT_VINFO_IN_PATTERN_P (stmt_vinfo))
> +-	    STMT_VINFO_VEC_STMT (stmt_vinfo) =3D vec_stmt;
> +-	}
> +-    }
> +=20
> +   return is_store;
> + }
> +@@ -5605,8 +5672,12 @@
>         || *dt =3D=3D vect_nested_cycle)
>       {
>         stmt_vec_info stmt_info =3D vinfo_for_stmt (*def_stmt);
> @@ -1238,8 +1268,8 @@ Index: gcc-4_6-branch/gcc/tree-vect-stmts.c
>       }
>  Index: gcc-4_6-branch/gcc/tree-vectorizer.h
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gcc-4_6-branch.orig/gcc/tree-vectorizer.h	2011-09-16 20:31:52.000000=
000 -0700
> -+++ gcc-4_6-branch/gcc/tree-vectorizer.h	2011-09-16 20:32:57.299056515 -=
0700
> +--- gcc-4_6-branch.orig/gcc/tree-vectorizer.h	2012-01-09 15:02:15.000000=
000 -0800
> ++++ gcc-4_6-branch/gcc/tree-vectorizer.h	2012-01-09 15:03:29.164918806 -=
0800
>  @@ -890,7 +890,7 @@
>   /* Pattern recognition functions.
>      Additional pattern recognition functions can (and will) be added
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-common-4.6.inc b/meta-oe/re=
cipes-devtools/gcc/gcc-common-4.6.inc
> index c12913d..6b0151b 100644
> --- a/meta-oe/recipes-devtools/gcc/gcc-common-4.6.inc
> +++ b/meta-oe/recipes-devtools/gcc/gcc-common-4.6.inc
> @@ -1,4 +1,4 @@
>  # this will prepend this layer to FILESPATH
>  FILESEXTRAPATHS :=3D "${THISDIR}/gcc-4.6"
> -PRINC =3D "3"
> +PRINC =3D "4"
>  ARM_INSTRUCTION_SET =3D "arm"
> --=20
> 1.7.5.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--hQiwHBbRI9kgIhsi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk8MFCkACgkQN1Ujt2V2gBz+oQCfQMje2RBcrOJnubgq6upggxfd
eRIAoLJ7VY7pYTW9FBls/ufU4bnr8R8F
=pVX4
-----END PGP SIGNATURE-----

--hQiwHBbRI9kgIhsi--
