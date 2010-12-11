Received: from mail-gw0-f41.google.com ([74.125.83.41])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PRU7N-00047F-LH
	for openembedded-devel@lists.openembedded.org;
	Sat, 11 Dec 2010 19:24:31 +0100
Received: by gwj22 with SMTP id 22so3205094gwj.28
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Dec 2010 10:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=8Ogvv2Fc97x+twtIyvr5NY8BJJGwCCx6y8lZ9fFtIGw=;
	b=sQS38+njpA2b6oMADD+38u/HNje1nMr2vV1QXg3bAk9bEcLBvF9cPTNQl/YSQHgLwH
	22LfWUoOO4YE9FtZjxrGKOMVw2D4UTAoBszvaWC2K6T5LNtVWdyUvkeVWRCmWIAen8VG
	56+PfGhutOlbwQcAlVNcPc1nqAQI8KF0Nyuis=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=j8O2qqRYLdh40Dh/1OVvOG+99XuMBRD4WAvbR4k+C0ygP6WSqpM8VTnx3jnxVzarkF
	qhbrsBA4W8NPNFQe3pzfZujObCCru9Y5q4a7unkxFSTlAeaTiRPSynOkmLYECMLP5kSh
	GwOV/g9bXwT3xZOOtWjweJkhpB2WiziE+oWMo=
Received: by 10.90.98.11 with SMTP id v11mr2892297agb.58.1292091770312; Sat,
	11 Dec 2010 10:22:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Sat, 11 Dec 2010 10:22:29 -0800 (PST)
In-Reply-To: <1292074441-2304-1-git-send-email-Martin.Jansa@gmail.com>
References: <1292074441-2304-1-git-send-email-Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 11 Dec 2010 10:22:29 -0800
Message-ID: <AANLkTiki6n1zf2aZHUGBU2nCv=jPB8frV6+h_27UWYez@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.41
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] libdrm: remove old not pinned versions, update libdrm.inc
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
X-List-Received-Date: Sat, 11 Dec 2010 18:24:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 11, 2010 at 5:34 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> * disable radeon for all distributions unless x86 is in MACHINE_FEATURES
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> =C2=A0recipes/dri/libdrm-2.4.21/glamo.patch | 1095 ----------------------=
-----------
> =C2=A0recipes/dri/libdrm-2.4.22/glamo.patch | 1095 ----------------------=
-----------
> =C2=A0recipes/dri/libdrm.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| =C2=A0 =C2=A07 +-
> =C2=A0recipes/dri/libdrm_2.3.0.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =
=C2=A0 =C2=A06 -
> =C2=A0recipes/dri/libdrm_2.3.1.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =
=C2=A0 =C2=A06 -
> =C2=A0recipes/dri/libdrm_2.4.11.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
=C2=A0 10 -
> =C2=A0recipes/dri/libdrm_2.4.17.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
=C2=A0 12 -
> =C2=A0recipes/dri/libdrm_2.4.18.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
=C2=A0 15 -
> =C2=A0recipes/dri/libdrm_2.4.21.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
=C2=A0 19 -
> =C2=A0recipes/dri/libdrm_2.4.22.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
=C2=A0 25 -
> =C2=A0recipes/dri/libdrm_2.4.23.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
=C2=A0 11 -
> =C2=A011 files changed, 6 insertions(+), 2295 deletions(-)
> =C2=A0delete mode 100644 recipes/dri/libdrm-2.4.21/glamo.patch
> =C2=A0delete mode 100644 recipes/dri/libdrm-2.4.22/glamo.patch
> =C2=A0delete mode 100644 recipes/dri/libdrm_2.3.0.bb
> =C2=A0delete mode 100644 recipes/dri/libdrm_2.3.1.bb
> =C2=A0delete mode 100644 recipes/dri/libdrm_2.4.11.bb
> =C2=A0delete mode 100644 recipes/dri/libdrm_2.4.17.bb
> =C2=A0delete mode 100644 recipes/dri/libdrm_2.4.18.bb
> =C2=A0delete mode 100644 recipes/dri/libdrm_2.4.21.bb
> =C2=A0delete mode 100644 recipes/dri/libdrm_2.4.22.bb
>
> diff --git a/recipes/dri/libdrm-2.4.21/glamo.patch b/recipes/dri/libdrm-2=
.4.21/glamo.patch
> deleted file mode 100644
> index b397ded..0000000
> --- a/recipes/dri/libdrm-2.4.21/glamo.patch
> +++ /dev/null
> @@ -1,1095 +0,0 @@
> -diff --git a/Makefile.am b/Makefile.am
> -index 25d1747..f384228 100644
> ---- a/Makefile.am
> -+++ b/Makefile.am
> -@@ -41,7 +41,11 @@ if HAVE_RADEON
> - RADEON_SUBDIR =3D radeon
> - endif
> -
> --SUBDIRS =3D . $(LIBKMS_SUBDIR) $(INTEL_SUBDIR) $(NOUVEAU_SUBDIR) $(RADE=
ON_SUBDIR) tests include
> -+if HAVE_GLAMO
> -+GLAMO_SUBDIR =3D glamo
> -+endif
> -+
> -+SUBDIRS =3D . $(LIBKMS_SUBDIR) $(INTEL_SUBDIR) $(NOUVEAU_SUBDIR) $(RADE=
ON_SUBDIR) $(GLAMO_SUBDIR) tests include
> -
> - libdrm_la_LTLIBRARIES =3D libdrm.la
> - libdrm_ladir =3D $(libdir)
> -diff --git a/configure.ac b/configure.ac
> -index 62db817..0b2a33e 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -73,6 +73,11 @@ AC_ARG_ENABLE(nouveau-experimental-api,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [NOUVEAU=3D$enableval], [NOUV=
EAU=3Dno])
> -
> -
> -+AC_ARG_ENABLE(glamo-experimental-api,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AS_HELP_STRING([--enable-glam=
o-experimental-api],
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[Enable support for Glamo's K=
MS API (default: disabled)]),
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[GLAMO=3D$enableval], [GLAMO=
=3Dno])
> -+
> - dnl =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> - dnl check compiler flags
> - AC_DEFUN([LIBDRM_CC_TRY_FLAG], [
> -@@ -169,6 +174,11 @@ if test "x$NOUVEAU" =3D xyes; then
> - =C2=A0 =C2=A0 =C2=A0 AC_DEFINE(HAVE_NOUVEAU, 1, [Have nouveau (nvidia) =
support])
> - fi
> -
> -+AM_CONDITIONAL(HAVE_GLAMO, [test "x$GLAMO" =3D xyes])
> -+if test "x$GLAMO" =3D xyes; then
> -+ =C2=A0 =C2=A0 =C2=A0AC_DEFINE(HAVE_GLAMO, 1, [Have glamo support])
> -+fi
> -+
> - PKG_CHECK_MODULES(CAIRO, cairo, [HAVE_CAIRO=3Dyes], [HAVE_CAIRO=3Dno])
> - if test "x$HAVE_CAIRO" =3D xyes; then
> - =C2=A0 =C2=A0 =C2=A0 AC_DEFINE(HAVE_CAIRO, 1, [Have cairo support])
> -@@ -262,6 +272,8 @@ AC_OUTPUT([
> - =C2=A0 =C2=A0 =C2=A0 radeon/libdrm_radeon.pc
> - =C2=A0 =C2=A0 =C2=A0 nouveau/Makefile
> - =C2=A0 =C2=A0 =C2=A0 nouveau/libdrm_nouveau.pc
> -+ =C2=A0 =C2=A0 =C2=A0glamo/Makefile
> -+ =C2=A0 =C2=A0 =C2=A0glamo/libdrm_glamo.pc
> - =C2=A0 =C2=A0 =C2=A0 tests/Makefile
> - =C2=A0 =C2=A0 =C2=A0 tests/modeprint/Makefile
> - =C2=A0 =C2=A0 =C2=A0 tests/modetest/Makefile
> -diff --git a/glamo/Makefile.am b/glamo/Makefile.am
> -new file mode 100644
> -index 0000000..1f17aa3
> ---- /dev/null
> -+++ b/glamo/Makefile.am
> -@@ -0,0 +1,52 @@
> -+# Copyright (c) 2009 Thomas Whtie <taw@bitwiz.org.uk>
> -+# Based on libdrm-glamo Copyright =C2=A9 2008 J=C3=A9r=C3=B4me Glisse
> -+#
> -+# Permission is hereby granted, free of charge, to any person obtaining=
 a
> -+# copy of this software and associated documentation files (the "Softwa=
re"),
> -+# to deal in the Software without restriction, including without limita=
tion
> -+# the rights to use, copy, modify, merge, publish, distribute, sublicen=
se,
> -+# and/or sell copies of the Software, and to permit persons to whom the
> -+# Software is furnished to do so, subject to the following conditions:
> -+#
> -+# The above copyright notice and this permission notice (including the =
next
> -+# paragraph) shall be included in all copies or substantial portions of=
 the
> -+# Software.
> -+#
> -+# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> -+# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> -+# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. =C2=A0IN NO EVE=
NT SHALL
> -+# THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR =
OTHER
> -+# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISI=
NG
> -+# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER D=
EALINGS
> -+# IN THE SOFTWARE.
> -+#
> -+# Authors:
> -+# =C2=A0 =C2=A0J=C3=A9r=C3=B4me Glisse <glisse@freedesktop.org>
> -+# =C2=A0 =C2=A0Thomas White <taw@bitwiz.org.uk>
> -+
> -+AM_CFLAGS =3D \
> -+ =C2=A0 =C2=A0 =C2=A0$(WARN_CFLAGS) \
> -+ =C2=A0 =C2=A0 =C2=A0-I$(top_srcdir) \
> -+ =C2=A0 =C2=A0 =C2=A0-I$(top_srcdir)/glamo \
> -+ =C2=A0 =C2=A0 =C2=A0$(PTHREADSTUBS_CFLAGS) \
> -+ =C2=A0 =C2=A0 =C2=A0-I$(top_srcdir)/include/drm
> -+
> -+libdrm_glamo_la_LTLIBRARIES =3D libdrm_glamo.la
> -+libdrm_glamo_ladir =3D $(libdir)
> -+libdrm_glamo_la_LDFLAGS =3D -version-number 1:0:0 -no-undefined
> -+libdrm_glamo_la_LIBADD =3D ../libdrm.la @PTHREADSTUBS_LIBS@
> -+
> -+libdrm_glamo_la_SOURCES =3D \
> -+ =C2=A0 =C2=A0 =C2=A0glamo_bo_gem.c \
> -+ =C2=A0 =C2=A0 =C2=A0glamo_track.c
> -+
> -+libdrm_glamoincludedir =3D ${includedir}/libdrm
> -+libdrm_glamoinclude_HEADERS =3D \
> -+ =C2=A0 =C2=A0 =C2=A0glamo_bo.h \
> -+ =C2=A0 =C2=A0 =C2=A0glamo_bo_gem.h \
> -+ =C2=A0 =C2=A0 =C2=A0glamo_track.h
> -+
> -+pkgconfigdir =3D @pkgconfigdir@
> -+pkgconfig_DATA =3D libdrm_glamo.pc
> -+
> -+EXTRA_DIST =3D libdrm_glamo.pc.in
> -diff --git a/glamo/glamo_bo.h b/glamo/glamo_bo.h
> -new file mode 100644
> -index 0000000..8ef2a18
> ---- /dev/null
> -+++ b/glamo/glamo_bo.h
> -@@ -0,0 +1,183 @@
> -+/*
> -+ * Copyright (c) 2009 Thomas White
> -+ *
> -+ * Heavily based on radeon_bo.h
> -+ * Copyright =C2=A9 2008 J=C3=A9r=C3=B4me Glisse
> -+ * All Rights Reserved.
> -+ *
> -+ * Permission is hereby granted, free of charge, to any person obtainin=
g
> -+ * a copy of this software and associated documentation files (the
> -+ * "Software"), to deal in the Software without restriction, including
> -+ * without limitation the rights to use, copy, modify, merge, publish,
> -+ * distribute, sub license, and/or sell copies of the Software, and to
> -+ * permit persons to whom the Software is furnished to do so, subject t=
o
> -+ * the following conditions:
> -+ *
> -+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> -+ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
> -+ * OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> -+ * NON-INFRINGEMENT. IN NO EVENT SHALL THE COPYRIGHT HOLDERS, AUTHORS
> -+ * AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> -+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> -+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
> -+ * USE OR OTHER DEALINGS IN THE SOFTWARE.
> -+ *
> -+ * The above copyright notice and this permission notice (including the
> -+ * next paragraph) shall be included in all copies or substantial porti=
ons
> -+ * of the Software.
> -+ */
> -+/*
> -+ * Authors:
> -+ * =C2=A0 =C2=A0 =C2=A0J=C3=A9r=C3=B4me Glisse <glisse@freedesktop.org>
> -+ * =C2=A0 =C2=A0Thomas White <taw@bitwiz.org.uk>
> -+ */
> -+#ifndef GLAMO_BO_H
> -+#define GLAMO_BO_H
> -+
> -+#include <stdio.h>
> -+#include <stdint.h>
> -+#include "glamo_track.h"
> -+
> -+/* bo object */
> -+#define GLAMO_BO_FLAGS_MACRO_TILE =C2=A01
> -+#define GLAMO_BO_FLAGS_MICRO_TILE =C2=A02
> -+
> -+struct glamo_bo_manager;
> -+
> -+struct glamo_bo {
> -+ =C2=A0 =C2=A0uint32_t =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0alignment;
> -+ =C2=A0 =C2=A0uint32_t =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0handle;
> -+ =C2=A0 =C2=A0uint32_t =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0size;
> -+ =C2=A0 =C2=A0uint32_t =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0domains;
> -+ =C2=A0 =C2=A0uint32_t =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0flags;
> -+ =C2=A0 =C2=A0unsigned =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0cref;
> -+#ifdef GLAMO_BO_TRACK
> -+ =C2=A0 =C2=A0struct glamo_track =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0*track;
> -+#endif
> -+ =C2=A0 =C2=A0struct glamo_bo_manager =C2=A0 *bom;
> -+ =C2=A0 =C2=A0void =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0*virtual;
> -+ =C2=A0 =C2=A0uint32_t =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0space_accounted;
> -+};
> -+
> -+/* bo functions */
> -+struct glamo_bo_funcs {
> -+ =C2=A0 =C2=A0struct glamo_bo *(*bo_open)(struct glamo_bo_manager *bom,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t handle,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t size,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t alignment,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t domains,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t flags);
> -+ =C2=A0 =C2=A0void (*bo_ref)(struct glamo_bo *bo);
> -+ =C2=A0 =C2=A0struct glamo_bo *(*bo_unref)(struct glamo_bo *bo);
> -+ =C2=A0 =C2=A0int (*bo_map)(struct glamo_bo *bo, int write);
> -+ =C2=A0 =C2=A0int (*bo_unmap)(struct glamo_bo *bo);
> -+ =C2=A0 =C2=A0int (*bo_wait)(struct glamo_bo *bo);
> -+};
> -+
> -+struct glamo_bo_manager {
> -+ =C2=A0 =C2=A0struct glamo_bo_funcs =C2=A0*funcs;
> -+ =C2=A0 =C2=A0int =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 fd;
> -+ =C2=A0 =C2=A0struct glamo_tracker =C2=A0 tracker;
> -+};
> -+
> -+static inline void _glamo_bo_debug(struct glamo_bo *bo,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *op,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *file,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *func,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int line)
> -+{
> -+ =C2=A0 =C2=A0fprintf(stderr, "%s %p 0x%08X 0x%08X 0x%08X [%s %s %d]\n"=
,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0op, (void *)bo, bo->handle, b=
o->size, bo->cref, file, func, line);
> -+}
> -+
> -+static inline struct glamo_bo *_glamo_bo_open(struct glamo_bo_manager *=
bom,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0uint32_t handle,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0uint32_t size,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0uint32_t alignment,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0uint32_t domains,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0uint32_t flags,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0const char *file,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0const char *func,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0int line)
> -+{
> -+ =C2=A0 =C2=A0struct glamo_bo *bo;
> -+
> -+ =C2=A0 =C2=A0bo =3D bom->funcs->bo_open(bom, handle, size, alignment, =
domains, flags);
> -+#ifdef GLAMO_BO_TRACK
> -+ =C2=A0 =C2=A0if (bo) {
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0bo->track =3D glamo_tracker_add_track(&bom-=
>tracker, bo->handle);
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0glamo_track_add_event(bo->track, file, func=
, "open", line);
> -+ =C2=A0 =C2=A0}
> -+#endif
> -+ =C2=A0 =C2=A0return bo;
> -+}
> -+
> -+static inline void _glamo_bo_ref(struct glamo_bo *bo,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *file,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *func,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int line)
> -+{
> -+ =C2=A0 =C2=A0bo->cref++;
> -+#ifdef GLAMO_BO_TRACK
> -+ =C2=A0 =C2=A0glamo_track_add_event(bo->track, file, func, "ref", line)=
;
> -+#endif
> -+ =C2=A0 =C2=A0bo->bom->funcs->bo_ref(bo);
> -+}
> -+
> -+static inline struct glamo_bo *_glamo_bo_unref(struct glamo_bo *bo,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 const char *file,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 const char *func,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 int line)
> -+{
> -+ =C2=A0 =C2=A0bo->cref--;
> -+#ifdef GLAMO_BO_TRACK
> -+ =C2=A0 =C2=A0glamo_track_add_event(bo->track, file, func, "unref", lin=
e);
> -+ =C2=A0 =C2=A0if (bo->cref <=3D 0) {
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0glamo_tracker_remove_track(&bo->bom->tracke=
r, bo->track);
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0bo->track =3D NULL;
> -+ =C2=A0 =C2=A0}
> -+#endif
> -+ =C2=A0 =C2=A0return bo->bom->funcs->bo_unref(bo);
> -+}
> -+
> -+static inline int _glamo_bo_map(struct glamo_bo *bo,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int write,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *file,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *func,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int line)
> -+{
> -+ =C2=A0 =C2=A0return bo->bom->funcs->bo_map(bo, write);
> -+}
> -+
> -+static inline int _glamo_bo_unmap(struct glamo_bo *bo,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *file,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *func,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int line)
> -+{
> -+ =C2=A0 =C2=A0return bo->bom->funcs->bo_unmap(bo);
> -+}
> -+
> -+static inline int _glamo_bo_wait(struct glamo_bo *bo,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *file,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *func,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int line)
> -+{
> -+ =C2=A0 =C2=A0return bo->bom->funcs->bo_wait(bo);
> -+}
> -+
> -+#define glamo_bo_open(bom, h, s, a, d, f)\
> -+ =C2=A0 =C2=A0_glamo_bo_open(bom, h, s, a, d, f, __FILE__, __FUNCTION__=
, __LINE__)
> -+#define glamo_bo_ref(bo)\
> -+ =C2=A0 =C2=A0_glamo_bo_ref(bo, __FILE__, __FUNCTION__, __LINE__)
> -+#define glamo_bo_unref(bo)\
> -+ =C2=A0 =C2=A0_glamo_bo_unref(bo, __FILE__, __FUNCTION__, __LINE__)
> -+#define glamo_bo_map(bo, w)\
> -+ =C2=A0 =C2=A0_glamo_bo_map(bo, w, __FILE__, __FUNCTION__, __LINE__)
> -+#define glamo_bo_unmap(bo)\
> -+ =C2=A0 =C2=A0_glamo_bo_unmap(bo, __FILE__, __FUNCTION__, __LINE__)
> -+#define glamo_bo_debug(bo, opcode)\
> -+ =C2=A0 =C2=A0_glamo_bo_debug(bo, opcode, __FILE__, __FUNCTION__, __LIN=
E__)
> -+#define glamo_bo_wait(bo) \
> -+ =C2=A0 =C2=A0_glamo_bo_wait(bo, __FILE__, __func__, __LINE__)
> -+
> -+#endif
> -diff --git a/glamo/glamo_bo_gem.c b/glamo/glamo_bo_gem.c
> -new file mode 100644
> -index 0000000..38a4436
> ---- /dev/null
> -+++ b/glamo/glamo_bo_gem.c
> -@@ -0,0 +1,336 @@
> -+/*
> -+ * Copyright =C2=A9 2009 Thomas White
> -+ *
> -+ * Based on radeon_bo_gem.c, to which the following notice applies:
> -+ *
> -+ * Copyright =C2=A9 2008 Dave Airlie
> -+ * Copyright =C2=A9 2008 J=C3=A9r=C3=B4me Glisse
> -+ * All Rights Reserved.
> -+ *
> -+ * Permission is hereby granted, free of charge, to any person obtainin=
g
> -+ * a copy of this software and associated documentation files (the
> -+ * "Software"), to deal in the Software without restriction, including
> -+ * without limitation the rights to use, copy, modify, merge, publish,
> -+ * distribute, sub license, and/or sell copies of the Software, and to
> -+ * permit persons to whom the Software is furnished to do so, subject t=
o
> -+ * the following conditions:
> -+ *
> -+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> -+ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
> -+ * OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> -+ * NON-INFRINGEMENT. IN NO EVENT SHALL THE COPYRIGHT HOLDERS, AUTHORS
> -+ * AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> -+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> -+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
> -+ * USE OR OTHER DEALINGS IN THE SOFTWARE.
> -+ *
> -+ * The above copyright notice and this permission notice (including the
> -+ * next paragraph) shall be included in all copies or substantial porti=
ons
> -+ * of the Software.
> -+ */
> -+/*
> -+ * Authors:
> -+ * =C2=A0 =C2=A0 =C2=A0Dave Airlie
> -+ * =C2=A0 =C2=A0 =C2=A0J=C3=A9r=C3=B4me Glisse <glisse@freedesktop.org>
> -+ *
> -+ *
> -+ * Memory mapping functions are based on intel_bufmgr_gem.c, to which t=
he
> -+ * following notice applies:
> -+ *
> -+ * Copyright =C2=A9 2007 Red Hat Inc.
> -+ * Copyright =C2=A9 2007 Intel Corporation
> -+ * Copyright 2006 Tungsten Graphics, Inc., Bismarck, ND., USA
> -+ * All Rights Reserved.
> -+ *
> -+ * Permission is hereby granted, free of charge, to any person obtainin=
g a
> -+ * copy of this software and associated documentation files (the
> -+ * "Software"), to deal in the Software without restriction, including
> -+ * without limitation the rights to use, copy, modify, merge, publish,
> -+ * distribute, sub license, and/or sell copies of the Software, and to
> -+ * permit persons to whom the Software is furnished to do so, subject t=
o
> -+ * the following conditions:
> -+ *
> -+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPR=
ESS OR
> -+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABIL=
ITY,
> -+ * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT S=
HALL
> -+ * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR AN=
Y CLAIM,
> -+ * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT O=
R
> -+ * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE O=
R THE
> -+ * USE OR OTHER DEALINGS IN THE SOFTWARE.
> -+ *
> -+ * The above copyright notice and this permission notice (including the
> -+ * next paragraph) shall be included in all copies or substantial porti=
ons
> -+ * of the Software.
> -+ *
> -+ *
> -+ **********************************************************************=
****/
> -+/*
> -+ * Authors: Thomas Hellstr=C3=B6m <thomas-at-tungstengraphics-dot-com>
> -+ * =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Keith Whitwell <keithw-at-tungsten=
graphics-dot-com>
> -+ * =C2=A0 =C2=A0 =C2=A0 =C2=A0Eric Anholt <eric@anholt.net>
> -+ * =C2=A0 =C2=A0 =C2=A0 =C2=A0Dave Airlie <airlied@linux.ie>
> -+ */
> -+
> -+#ifdef HAVE_CONFIG_H
> -+#include "config.h"
> -+#endif
> -+
> -+#include <stdio.h>
> -+#include <stdint.h>
> -+#include <stdlib.h>
> -+#include <string.h>
> -+#include <sys/mman.h>
> -+#include <sys/ioctl.h>
> -+#include <errno.h>
> -+
> -+#include "xf86drm.h"
> -+#include "drm.h"
> -+#include "glamo_drm.h"
> -+#include "glamo_bo.h"
> -+#include "glamo_bo_gem.h"
> -+
> -+struct glamo_bo_gem {
> -+ =C2=A0 =C2=A0 =C2=A0struct glamo_bo =C2=A0 base;
> -+ =C2=A0 =C2=A0 =C2=A0uint32_t =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0name;
> -+ =C2=A0 =C2=A0 =C2=A0int =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 map_count;
> -+};
> -+
> -+struct bo_manager_gem {
> -+ =C2=A0 =C2=A0 =C2=A0struct glamo_bo_manager =C2=A0 =C2=A0base;
> -+};
> -+
> -+static struct glamo_bo *bo_open(struct glamo_bo_manager *bom,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t handle,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t size,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t alignment,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t domains,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t flags)
> -+{
> -+ =C2=A0 =C2=A0 =C2=A0struct glamo_bo_gem *bo;
> -+ =C2=A0 =C2=A0 =C2=A0int r;
> -+
> -+ =C2=A0 =C2=A0 =C2=A0bo =3D (struct glamo_bo_gem*)calloc(1, sizeof(stru=
ct glamo_bo_gem));
> -+ =C2=A0 =C2=A0 =C2=A0if (bo =3D=3D NULL) {
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;
> -+ =C2=A0 =C2=A0 =C2=A0}
> -+
> -+ =C2=A0 =C2=A0 =C2=A0bo->base.bom =3D bom;
> -+ =C2=A0 =C2=A0 =C2=A0bo->base.handle =3D 0;
> -+ =C2=A0 =C2=A0 =C2=A0bo->base.size =3D size;
> -+ =C2=A0 =C2=A0 =C2=A0bo->base.alignment =3D alignment;
> -+ =C2=A0 =C2=A0 =C2=A0bo->base.domains =3D domains;
> -+ =C2=A0 =C2=A0 =C2=A0bo->base.flags =3D flags;
> -+ =C2=A0 =C2=A0 =C2=A0bo->base.cref =3D 0;
> -+ =C2=A0 =C2=A0 =C2=A0bo->map_count =3D 0;
> -+ =C2=A0 =C2=A0 =C2=A0bo->base.virtual =3D NULL;
> -+ =C2=A0 =C2=A0 =C2=A0if (handle) {
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_gem_open op=
en_arg;
> -+
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memset(&open_arg, 0, s=
izeof(open_arg));
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0open_arg.name =3D hand=
le;
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D ioctl(bom->fd, D=
RM_IOCTL_GEM_OPEN, &open_arg);
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r !=3D 0) {
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0free(bo);
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0return NULL;
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bo->base.handle =3D op=
en_arg.handle;
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bo->base.size =3D open=
_arg.size;
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bo->name =3D handle;
> -+ =C2=A0 =C2=A0 =C2=A0} else {
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_glamo_gem_c=
reate args;
> -+
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0args.size =3D size;
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0args.alignment =3D ali=
gnment;
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0args.initial_domain =
=3D bo->base.domains;
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0args.no_backing_store =
=3D 0;
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0args.handle =3D 0;
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D drmCommandWriteR=
ead(bom->fd, DRM_GLAMO_GEM_CREATE,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&args, sizeof=
(args));
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bo->base.handle =3D ar=
gs.handle;
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r) {
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0fprintf(stderr, "Failed to allocate :\n");
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0fprintf(stderr, " =C2=A0 size =C2=A0 =C2=A0 =C2=A0: %d bytes\n", size=
);
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0fprintf(stderr, " =C2=A0 alignment : %d bytes\n", alignment);
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0free(bo);
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0return NULL;
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> -+ =C2=A0 =C2=A0 =C2=A0}
> -+ =C2=A0 =C2=A0 =C2=A0glamo_bo_ref((struct glamo_bo*)bo);
> -+ =C2=A0 =C2=A0 =C2=A0return (struct glamo_bo*)bo;
> -+}
> -+
> -+static void bo_ref(struct glamo_bo *bo)
> -+{
> -+}
> -+
> -+static struct glamo_bo *bo_unref(struct glamo_bo *bo)
> -+{
> -+ =C2=A0 =C2=A0 =C2=A0struct glamo_bo_gem *bo_gem =3D (struct glamo_bo_g=
em*)bo;
> -+ =C2=A0 =C2=A0 =C2=A0struct drm_gem_close args;
> -+
> -+ =C2=A0 =C2=A0 =C2=A0if (bo =3D=3D NULL) {
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;
> -+ =C2=A0 =C2=A0 =C2=A0}
> -+ =C2=A0 =C2=A0 =C2=A0if (bo->cref) {
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return bo;
> -+ =C2=A0 =C2=A0 =C2=A0}
> -+ =C2=A0 =C2=A0 =C2=A0if (bo_gem->map_count) {
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0munmap(bo->virtual, bo=
->size);
> -+ =C2=A0 =C2=A0 =C2=A0}
> -+
> -+ =C2=A0 =C2=A0 =C2=A0/* close object */
> -+ =C2=A0 =C2=A0 =C2=A0args.handle =3D bo->handle;
> -+ =C2=A0 =C2=A0 =C2=A0ioctl(bo->bom->fd, DRM_IOCTL_GEM_CLOSE, &args);
> -+ =C2=A0 =C2=A0 =C2=A0memset(bo_gem, 0, sizeof(struct glamo_bo_gem));
> -+ =C2=A0 =C2=A0 =C2=A0free(bo_gem);
> -+ =C2=A0 =C2=A0 =C2=A0return NULL;
> -+}
> -+
> -+static int bo_map(struct glamo_bo *bo, int write)
> -+{
> -+ =C2=A0 =C2=A0 =C2=A0struct glamo_bo_gem *bo_gem;
> -+ =C2=A0 =C2=A0 =C2=A0struct glamo_bo_manager *bufmgr;
> -+ =C2=A0 =C2=A0 =C2=A0int ret;
> -+
> -+ =C2=A0 =C2=A0 =C2=A0bo_gem =3D (struct glamo_bo_gem *)bo;
> -+ =C2=A0 =C2=A0 =C2=A0bufmgr =3D (struct glamo_bo_manager*)bo->bom;
> -+
> -+ =C2=A0 =C2=A0 =C2=A0/* Get a mapping of the buffer if we haven't befor=
e. */
> -+ =C2=A0 =C2=A0 =C2=A0if (bo->virtual =3D=3D NULL) {
> -+
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_glamo_gem_m=
map mmap_arg;
> -+
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memset(&mmap_arg, 0, s=
izeof(mmap_arg));
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mmap_arg.handle =3D bo=
->handle;
> -+
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Get the fake offset=
 back... */
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D ioctl(bufmgr->=
fd, DRM_IOCTL_GLAMO_GEM_MMAP, &mmap_arg);
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret !=3D 0) {
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0fprintf(stderr,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"%s:%d: Error preparing BO map %d (%d): %=
s .\n",
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__FILE__, __LINE__,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bo->handle, bo_gem->name,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0strerror(errno));
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0return ret;
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* and mmap it */
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bo->virtual =3D mmap(0=
, bo->size, PROT_READ | PROT_WRITE,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MAP_SHARED, bufmgr-=
>fd,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mmap_arg.offset);
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (bo->virtual =3D=3D=
 MAP_FAILED) {
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0fprintf(stderr,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"%s:%d: Error mapping buffer %d (%d): %s =
.\n",
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__FILE__, __LINE__,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bo->handle, bo_gem->name,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0strerror(errno));
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0return errno;
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> -+ =C2=A0 =C2=A0 =C2=A0}
> -+ =C2=A0 =C2=A0 =C2=A0bo_gem->map_count++;
> -+
> -+ =C2=A0 =C2=A0 =C2=A0return 0;
> -+}
> -+
> -+static int bo_unmap(struct glamo_bo *bo)
> -+{
> -+ =C2=A0 =C2=A0 =C2=A0struct glamo_bo_gem *bo_gem =3D (struct glamo_bo_g=
em*)bo;
> -+
> -+ =C2=A0 =C2=A0 =C2=A0if ( bo_gem->map_count =3D=3D 0 ) {
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr, "Not u=
nmapping %p, because its map count"
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0" is already zero.\n", bo_gem);
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
> -+ =C2=A0 =C2=A0 =C2=A0}
> -+
> -+ =C2=A0 =C2=A0 =C2=A0if (--bo_gem->map_count > 0) {
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
> -+ =C2=A0 =C2=A0 =C2=A0}
> -+ =C2=A0 =C2=A0 =C2=A0munmap(bo->virtual, bo->size);
> -+ =C2=A0 =C2=A0 =C2=A0bo->virtual =3D NULL;
> -+ =C2=A0 =C2=A0 =C2=A0return 0;
> -+}
> -+
> -+static int bo_wait(struct glamo_bo *bo)
> -+{
> -+ =C2=A0 =C2=A0 =C2=A0struct drm_glamo_gem_wait_rendering args;
> -+ =C2=A0 =C2=A0 =C2=A0int ret;
> -+
> -+ =C2=A0 =C2=A0 =C2=A0args.handle =3D bo->handle;
> -+ =C2=A0 =C2=A0 =C2=A0args.have_handle =3D 1;
> -+ =C2=A0 =C2=A0 =C2=A0do {
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D drmCommandWrit=
eRead(bo->bom->fd,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_GL=
AMO_GEM_WAIT_RENDERING,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&args,=
 sizeof(args));
> -+ =C2=A0 =C2=A0 =C2=A0} while (ret =3D=3D -EAGAIN);
> -+ =C2=A0 =C2=A0 =C2=A0return ret;
> -+}
> -+
> -+static struct glamo_bo_funcs bo_gem_funcs =3D {
> -+ =C2=A0 =C2=A0 =C2=A0bo_open,
> -+ =C2=A0 =C2=A0 =C2=A0bo_ref,
> -+ =C2=A0 =C2=A0 =C2=A0bo_unref,
> -+ =C2=A0 =C2=A0 =C2=A0bo_map,
> -+ =C2=A0 =C2=A0 =C2=A0bo_unmap,
> -+ =C2=A0 =C2=A0 =C2=A0bo_wait
> -+};
> -+
> -+struct glamo_bo_manager *glamo_bo_manager_gem_ctor(int fd)
> -+{
> -+ =C2=A0 =C2=A0 =C2=A0struct bo_manager_gem *bomg;
> -+
> -+ =C2=A0 =C2=A0 =C2=A0bomg =3D (struct bo_manager_gem*)calloc(1, sizeof(=
struct bo_manager_gem));
> -+ =C2=A0 =C2=A0 =C2=A0if (bomg =3D=3D NULL) return NULL;
> -+
> -+ =C2=A0 =C2=A0 =C2=A0bomg->base.funcs =3D &bo_gem_funcs;
> -+ =C2=A0 =C2=A0 =C2=A0bomg->base.fd =3D fd;
> -+ =C2=A0 =C2=A0 =C2=A0return (struct glamo_bo_manager*)bomg;
> -+}
> -+
> -+void glamo_bo_manager_gem_dtor(struct glamo_bo_manager *bom)
> -+{
> -+ =C2=A0 =C2=A0 =C2=A0struct bo_manager_gem *bomg =3D (struct bo_manager=
_gem*)bom;
> -+
> -+ =C2=A0 =C2=A0 =C2=A0if (bom =3D=3D NULL) return;
> -+ =C2=A0 =C2=A0 =C2=A0free(bomg);
> -+}
> -+
> -+uint32_t glamo_gem_get_name(struct glamo_bo *bo)
> -+{
> -+ =C2=A0 =C2=A0 =C2=A0struct glamo_bo_gem *bo_gem =3D (struct glamo_bo_g=
em*)bo;
> -+ =C2=A0 =C2=A0 =C2=A0return bo_gem->name;
> -+}
> -+
> -+int glamo_gem_name_buffer(struct glamo_bo *bo, uint32_t *name)
> -+{
> -+ =C2=A0 =C2=A0 =C2=A0struct drm_gem_flink flink;
> -+ =C2=A0 =C2=A0 =C2=A0int r;
> -+
> -+ =C2=A0 =C2=A0 =C2=A0if ( !bo ) {
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr, "No bu=
ffer object!\n");
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;
> -+ =C2=A0 =C2=A0 =C2=A0}
> -+
> -+ =C2=A0 =C2=A0 =C2=A0flink.handle =3D bo->handle;
> -+ =C2=A0 =C2=A0 =C2=A0r =3D ioctl(bo->bom->fd, DRM_IOCTL_GEM_FLINK, &fli=
nk);
> -+ =C2=A0 =C2=A0 =C2=A0if (r) return r;
> -+
> -+ =C2=A0 =C2=A0 =C2=A0*name =3D flink.name;
> -+ =C2=A0 =C2=A0 =C2=A0return 0;
> -+}
> -+
> -+int glamo_bo_subdata(struct glamo_bo *bo, unsigned long offset,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
unsigned long size, const void *data)
> -+{
> -+ =C2=A0 =C2=A0 =C2=A0int ret;
> -+
> -+ =C2=A0 =C2=A0 =C2=A0if (size =3D=3D 0 || data =3D=3D NULL)
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
> -+
> -+ =C2=A0 =C2=A0 =C2=A0ret =3D bo_map(bo, 1);
> -+ =C2=A0 =C2=A0 =C2=A0if ( ret ) return ret;
> -+
> -+ =C2=A0 =C2=A0 =C2=A0memcpy((unsigned char *)bo->virtual + offset, data=
, size);
> -+
> -+ =C2=A0 =C2=A0 =C2=A0bo_unmap(bo);
> -+
> -+ =C2=A0 =C2=A0 =C2=A0return 0;
> -+}
> -diff --git a/glamo/glamo_bo_gem.h b/glamo/glamo_bo_gem.h
> -new file mode 100644
> -index 0000000..05b5fb9
> ---- /dev/null
> -+++ b/glamo/glamo_bo_gem.h
> -@@ -0,0 +1,43 @@
> -+/*
> -+ * Copyright =C2=A9 2008 Dave Airlie
> -+ * Copyright =C2=A9 2008 J=C3=A9r=C3=B4me Glisse
> -+ * All Rights Reserved.
> -+ *
> -+ * Permission is hereby granted, free of charge, to any person obtainin=
g
> -+ * a copy of this software and associated documentation files (the
> -+ * "Software"), to deal in the Software without restriction, including
> -+ * without limitation the rights to use, copy, modify, merge, publish,
> -+ * distribute, sub license, and/or sell copies of the Software, and to
> -+ * permit persons to whom the Software is furnished to do so, subject t=
o
> -+ * the following conditions:
> -+ *
> -+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> -+ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
> -+ * OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> -+ * NON-INFRINGEMENT. IN NO EVENT SHALL THE COPYRIGHT HOLDERS, AUTHORS
> -+ * AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> -+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> -+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
> -+ * USE OR OTHER DEALINGS IN THE SOFTWARE.
> -+ *
> -+ * The above copyright notice and this permission notice (including the
> -+ * next paragraph) shall be included in all copies or substantial porti=
ons
> -+ * of the Software.
> -+ */
> -+/*
> -+ * Authors:
> -+ * =C2=A0 =C2=A0 =C2=A0Dave Airlie
> -+ * =C2=A0 =C2=A0 =C2=A0J=C3=A9r=C3=B4me Glisse <glisse@freedesktop.org>
> -+ */
> -+#ifndef GLAMO_BO_GEM_H
> -+#define GLAMO_BO_GEM_H
> -+
> -+#include "glamo_bo.h"
> -+
> -+struct glamo_bo_manager *glamo_bo_manager_gem_ctor(int fd);
> -+void glamo_bo_manager_gem_dtor(struct glamo_bo_manager *bom);
> -+int glamo_gem_name_buffer(struct glamo_bo *bo, uint32_t *name);
> -+uint32_t glamo_gem_get_name(struct glamo_bo *bo);
> -+extern int glamo_bo_subdata(struct glamo_bo *bo, unsigned long offset,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long size, const void *data);
> -+#endif
> -diff --git a/glamo/glamo_track.c b/glamo/glamo_track.c
> -new file mode 100644
> -index 0000000..27ffe41
> ---- /dev/null
> -+++ b/glamo/glamo_track.c
> -@@ -0,0 +1,140 @@
> -+/*
> -+ * Copyright =C2=A9 2008 J=C3=A9r=C3=B4me Glisse
> -+ * All Rights Reserved.
> -+ *
> -+ * Permission is hereby granted, free of charge, to any person obtainin=
g
> -+ * a copy of this software and associated documentation files (the
> -+ * "Software"), to deal in the Software without restriction, including
> -+ * without limitation the rights to use, copy, modify, merge, publish,
> -+ * distribute, sub license, and/or sell copies of the Software, and to
> -+ * permit persons to whom the Software is furnished to do so, subject t=
o
> -+ * the following conditions:
> -+ *
> -+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> -+ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
> -+ * OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> -+ * NON-INFRINGEMENT. IN NO EVENT SHALL THE COPYRIGHT HOLDERS, AUTHORS
> -+ * AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> -+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> -+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
> -+ * USE OR OTHER DEALINGS IN THE SOFTWARE.
> -+ *
> -+ * The above copyright notice and this permission notice (including the
> -+ * next paragraph) shall be included in all copies or substantial porti=
ons
> -+ * of the Software.
> -+ */
> -+/*
> -+ * Authors:
> -+ * =C2=A0 =C2=A0 =C2=A0J=C3=A9r=C3=B4me Glisse <glisse@freedesktop.org>
> -+ */
> -+#include <stdio.h>
> -+#include <stdlib.h>
> -+#include <string.h>
> -+#include "glamo_track.h"
> -+
> -+void glamo_track_add_event(struct glamo_track *track,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *file,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *func,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *op,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned line)
> -+{
> -+ =C2=A0 =C2=A0struct glamo_track_event *event;
> -+
> -+ =C2=A0 =C2=A0if (track =3D=3D NULL) {
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0return;
> -+ =C2=A0 =C2=A0}
> -+ =C2=A0 =C2=A0event =3D (void*)calloc(1,sizeof(struct glamo_track_event=
));
> -+ =C2=A0 =C2=A0if (event =3D=3D NULL) {
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0return;
> -+ =C2=A0 =C2=A0}
> -+ =C2=A0 =C2=A0event->line =3D line;
> -+ =C2=A0 =C2=A0event->file =3D strdup(file);
> -+ =C2=A0 =C2=A0event->func =3D strdup(func);
> -+ =C2=A0 =C2=A0event->op =3D strdup(op);
> -+ =C2=A0 =C2=A0if (event->file =3D=3D NULL || event->func =3D=3D NULL ||=
 event->op =3D=3D NULL) {
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0free(event->file);
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0free(event->func);
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0free(event->op);
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0free(event);
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0return;
> -+ =C2=A0 =C2=A0}
> -+ =C2=A0 =C2=A0event->next =3D track->events;
> -+ =C2=A0 =C2=A0track->events =3D event;
> -+}
> -+
> -+struct glamo_track *glamo_tracker_add_track(struct glamo_tracker *track=
er,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0unsigned key)
> -+{
> -+ =C2=A0 =C2=A0struct glamo_track *track;
> -+
> -+ =C2=A0 =C2=A0track =3D (struct glamo_track*)calloc(1, sizeof(struct gl=
amo_track));
> -+ =C2=A0 =C2=A0if (track) {
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0track->next =3D tracker->tracks.next;
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0track->prev =3D &tracker->tracks;
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0tracker->tracks.next =3D track;
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0if (track->next) {
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0track->next->prev =3D track;
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0track->key =3D key;
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0track->events =3D NULL;
> -+ =C2=A0 =C2=A0}
> -+ =C2=A0 =C2=A0return track;
> -+}
> -+
> -+void glamo_tracker_remove_track(struct glamo_tracker *tracker,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct glamo_track *track)
> -+{
> -+ =C2=A0 =C2=A0struct glamo_track_event *event;
> -+ =C2=A0 =C2=A0void *tmp;
> -+
> -+ =C2=A0 =C2=A0if (track =3D=3D NULL) {
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0return;
> -+ =C2=A0 =C2=A0}
> -+ =C2=A0 =C2=A0track->prev->next =3D track->next;
> -+ =C2=A0 =C2=A0if (track->next) {
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0track->next->prev =3D track->prev;
> -+ =C2=A0 =C2=A0}
> -+ =C2=A0 =C2=A0track->next =3D track->prev =3D NULL;
> -+ =C2=A0 =C2=A0event =3D track->events;
> -+ =C2=A0 =C2=A0while (event) {
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0tmp =3D event;
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0free(event->file);
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0free(event->func);
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0free(event->op);
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0event =3D event->next;
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0free(tmp);
> -+ =C2=A0 =C2=A0}
> -+ =C2=A0 =C2=A0track->events =3D NULL;
> -+ =C2=A0 =C2=A0free(track);
> -+}
> -+
> -+void glamo_tracker_print(struct glamo_tracker *tracker, FILE *file)
> -+{
> -+ =C2=A0 =C2=A0struct glamo_track *track;
> -+ =C2=A0 =C2=A0struct glamo_track_event *event;
> -+ =C2=A0 =C2=A0void *tmp;
> -+
> -+ =C2=A0 =C2=A0track =3D tracker->tracks.next;
> -+ =C2=A0 =C2=A0while (track) {
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0event =3D track->events;
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(file, "[0x%08X] :\n", track->key);
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0while (event) {
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmp =3D event;
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(file, " =C2=A0[0x%08X=
:%s](%s:%s:%d)\n",
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0t=
rack->key, event->op, =C2=A0event->file,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0e=
vent->func, event->line);
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free(event->file);
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free(event->func);
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free(event->op);
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0event->file =3D NULL;
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0event->func =3D NULL;
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0event->op =3D NULL;
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0event =3D event->next;
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free(tmp);
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0track->events =3D NULL;
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0tmp =3D track;
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0track =3D track->next;
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0free(tmp);
> -+ =C2=A0 =C2=A0}
> -+}
> -diff --git a/glamo/glamo_track.h b/glamo/glamo_track.h
> -new file mode 100644
> -index 0000000..fedead7
> ---- /dev/null
> -+++ b/glamo/glamo_track.h
> -@@ -0,0 +1,64 @@
> -+/*
> -+ * Copyright =C2=A9 2008 J=C3=A9r=C3=B4me Glisse
> -+ * All Rights Reserved.
> -+ *
> -+ * Permission is hereby granted, free of charge, to any person obtainin=
g
> -+ * a copy of this software and associated documentation files (the
> -+ * "Software"), to deal in the Software without restriction, including
> -+ * without limitation the rights to use, copy, modify, merge, publish,
> -+ * distribute, sub license, and/or sell copies of the Software, and to
> -+ * permit persons to whom the Software is furnished to do so, subject t=
o
> -+ * the following conditions:
> -+ *
> -+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> -+ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
> -+ * OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> -+ * NON-INFRINGEMENT. IN NO EVENT SHALL THE COPYRIGHT HOLDERS, AUTHORS
> -+ * AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> -+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> -+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
> -+ * USE OR OTHER DEALINGS IN THE SOFTWARE.
> -+ *
> -+ * The above copyright notice and this permission notice (including the
> -+ * next paragraph) shall be included in all copies or substantial porti=
ons
> -+ * of the Software.
> -+ */
> -+/*
> -+ * Authors:
> -+ * =C2=A0 =C2=A0 =C2=A0J=C3=A9r=C3=B4me Glisse <glisse@freedesktop.org>
> -+ */
> -+#ifndef GLAMO_TRACK_H
> -+#define GLAMO_TRACK_H
> -+
> -+struct glamo_track_event {
> -+ =C2=A0 =C2=A0struct glamo_track_event =C2=A0 *next;
> -+ =C2=A0 =C2=A0char =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*file;
> -+ =C2=A0 =C2=A0char =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*func;
> -+ =C2=A0 =C2=A0char =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*op;
> -+ =C2=A0 =C2=A0unsigned =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0line;
> -+};
> -+
> -+struct glamo_track {
> -+ =C2=A0 =C2=A0struct glamo_track =C2=A0 =C2=A0 =C2=A0 =C2=A0 *next;
> -+ =C2=A0 =C2=A0struct glamo_track =C2=A0 =C2=A0 =C2=A0 =C2=A0 *prev;
> -+ =C2=A0 =C2=A0unsigned =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0key;
> -+ =C2=A0 =C2=A0struct glamo_track_event =C2=A0 *events;
> -+};
> -+
> -+struct glamo_tracker {
> -+ =C2=A0 =C2=A0struct glamo_track =C2=A0 =C2=A0 =C2=A0 =C2=A0 tracks;
> -+};
> -+
> -+void glamo_track_add_event(struct glamo_track *track,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *file,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *func,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *op,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned line);
> -+struct glamo_track *glamo_tracker_add_track(struct glamo_tracker *track=
er,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0unsigned key);
> -+void glamo_tracker_remove_track(struct glamo_tracker *tracker,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct glamo_track *track);
> -+void glamo_tracker_print(struct glamo_tracker *tracker,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0FILE *file);
> -+
> -+#endif
> -diff --git a/glamo/libdrm_glamo.pc.in b/glamo/libdrm_glamo.pc.in
> -new file mode 100644
> -index 0000000..d4d8e70
> ---- /dev/null
> -+++ b/glamo/libdrm_glamo.pc.in
> -@@ -0,0 +1,10 @@
> -+prefix=3D@prefix@
> -+exec_prefix=3D@exec_prefix@
> -+libdir=3D@libdir@
> -+includedir=3D@includedir@
> -+
> -+Name: libdrm_glamo
> -+Description: Userspace interface to kernel DRM services for Glamo
> -+Version: 1.0.1
> -+Libs: -L${libdir} -ldrm_glamo
> -+Cflags: -I${includedir} -I${includedir}/libdrm
> -diff --git a/include/drm/Makefile.am b/include/drm/Makefile.am
> -index 43695bd..f3f7edf 100644
> ---- a/include/drm/Makefile.am
> -+++ b/include/drm/Makefile.am
> -@@ -35,6 +35,7 @@ klibdrminclude_HEADERS =3D \
> - =C2=A0 =C2=A0 =C2=A0 savage_drm.h \
> - =C2=A0 =C2=A0 =C2=A0 sis_drm.h \
> - =C2=A0 =C2=A0 =C2=A0 via_drm.h \
> -+ =C2=A0 =C2=A0 =C2=A0glamo_drm.h \
> - =C2=A0 =C2=A0 =C2=A0 mach64_drm.h
> -
> -
> -diff --git a/include/drm/glamo_drm.h b/include/drm/glamo_drm.h
> -new file mode 100644
> -index 0000000..7629ebc
> ---- /dev/null
> -+++ b/include/drm/glamo_drm.h
> -@@ -0,0 +1,153 @@
> -+/* glamo_drm.h -- Public header for the Glamo driver
> -+ *
> -+ * Copyright 2009 Thomas White
> -+ * Copyright 2000 Precision Insight, Inc., Cedar Park, Texas.
> -+ * Copyright 2000 VA Linux Systems, Inc., Fremont, California.
> -+ * Copyright 2002 Tungsten Graphics, Inc., Cedar Park, Texas.
> -+ * All rights reserved.
> -+ *
> -+ * Permission is hereby granted, free of charge, to any person obtainin=
g a
> -+ * copy of this software and associated documentation files (the "Softw=
are"),
> -+ * to deal in the Software without restriction, including without limit=
ation
> -+ * the rights to use, copy, modify, merge, publish, distribute, sublice=
nse,
> -+ * and/or sell copies of the Software, and to permit persons to whom th=
e
> -+ * Software is furnished to do so, subject to the following conditions:
> -+ *
> -+ * The above copyright notice and this permission notice (including the=
 next
> -+ * paragraph) shall be included in all copies or substantial portions o=
f the
> -+ * Software.
> -+ *
> -+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPR=
ESS OR
> -+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABIL=
ITY,
> -+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. =C2=A0IN NO EV=
ENT SHALL
> -+ * PRECISION INSIGHT AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMA=
GES OR
> -+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE=
,
> -+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE O=
R OTHER
> -+ * DEALINGS IN THE SOFTWARE.
> -+ *
> -+ * Authors:
> -+ * =C2=A0 =C2=A0Thomas White <taw@bitwiz.org.uk>
> -+ * =C2=A0 =C2=A0Kevin E. Martin <martin@valinux.com>
> -+ * =C2=A0 =C2=A0Gareth Hughes <gareth@valinux.com>
> -+ * =C2=A0 =C2=A0Keith Whitwell <keith@tungstengraphics.com>
> -+ */
> -+
> -+#ifndef __GLAMO_DRM_H__
> -+#define __GLAMO_DRM_H__
> -+
> -+#include "drm.h"
> -+
> -+#define GLAMO_GEM_DOMAIN_VRAM (0x1)
> -+
> -+/* Glamo specific ioctls */
> -+#define DRM_GLAMO_CMDBUF =C2=A0 =C2=A0 0x01
> -+#define DRM_GLAMO_SWAP =C2=A0 =C2=A0 =C2=A0 0x02
> -+#define DRM_GLAMO_CMDBURST =C2=A0 0x03
> -+
> -+#define DRM_GLAMO_GEM_INFO =C2=A0 =C2=A0 0x1c
> -+#define DRM_GLAMO_GEM_CREATE =C2=A0 0x1d
> -+#define DRM_GLAMO_GEM_MMAP =C2=A0 =C2=A0 0x1e
> -+#define DRM_GLAMO_GEM_PIN =C2=A0 =C2=A0 =C2=A00x1f
> -+#define DRM_GLAMO_GEM_UNPIN =C2=A0 =C2=A00x20
> -+#define DRM_GLAMO_GEM_PREAD =C2=A0 =C2=A00x21
> -+#define DRM_GLAMO_GEM_PWRITE =C2=A0 0x22
> -+#define DRM_GLAMO_GEM_WAIT_RENDERING 0x24
> -+
> -+#define DRM_IOCTL_GLAMO_CMDBUF =C2=A0 =C2=A0 DRM_IOW(DRM_COMMAND_BASE +=
 DRM_GLAMO_CMDBUF, drm_glamo_cmd_buffer_t)
> -+#define DRM_IOCTL_GLAMO_SWAP =C2=A0 =C2=A0 =C2=A0 DRM_IO(DRM_COMMAND_BA=
SE + DRM_GLAMO_SWAP)
> -+#define DRM_IOCTL_GLAMO_CMDBURST =C2=A0 =C2=A0 DRM_IOW(DRM_COMMAND_BASE=
 + DRM_GLAMO_CMDBURST, drm_glamo_cmd_burst_t)
> -+
> -+#define DRM_IOCTL_GLAMO_GEM_INFO =C2=A0 DRM_IOWR(DRM_COMMAND_BASE + DRM=
_GLAMO_GEM_INFO, struct drm_glamo_gem_info)
> -+#define DRM_IOCTL_GLAMO_GEM_CREATE DRM_IOWR(DRM_COMMAND_BASE + DRM_GLAM=
O_GEM_CREATE, struct drm_glamo_gem_create)
> -+#define DRM_IOCTL_GLAMO_GEM_MMAP =C2=A0 DRM_IOWR(DRM_COMMAND_BASE + DRM=
_GLAMO_GEM_MMAP, struct drm_glamo_gem_mmap)
> -+#define DRM_IOCTL_GLAMO_GEM_PIN =C2=A0 =C2=A0DRM_IOWR(DRM_COMMAND_BASE =
+ DRM_GLAMO_GEM_PIN, struct drm_glamo_gem_pin)
> -+#define DRM_IOCTL_GLAMO_GEM_UNPIN =C2=A0DRM_IOWR(DRM_COMMAND_BASE + DRM=
_GLAMO_GEM_UNPIN, struct drm_glamo_gem_unpin)
> -+#define DRM_IOCTL_GLAMO_GEM_PREAD =C2=A0DRM_IOWR(DRM_COMMAND_BASE + DRM=
_GLAMO_GEM_PREAD, struct drm_glamo_gem_pread)
> -+#define DRM_IOCTL_GLAMO_GEM_PWRITE DRM_IOWR(DRM_COMMAND_BASE + DRM_GLAM=
O_GEM_PWRITE, struct drm_glamo_gem_pwrite)
> -+#define DRM_IOCTL_GLAMO_GEM_WAIT_RENDERING DRM_IOW(DRM_COMMAND_BASE + D=
RM_GLAMO_GEM_WAIT_RENDERING, struct drm_glamo_gem_wait_rendering)
> -+
> -+
> -+/* Simple command submission - a list of 16-bit address-data pairs */
> -+typedef struct drm_glamo_cmd_buffer {
> -+ =C2=A0 =C2=A0 =C2=A0unsigned int bufsz; =C2=A0 =C2=A0 /* Size of buffe=
r, in bytes */
> -+ =C2=A0 =C2=A0 =C2=A0char *buf; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/* Buffer of stuff to go onto the ring buffer */
> -+ =C2=A0 =C2=A0 =C2=A0unsigned int *obj_pos; =C2=A0/* Offsets (in bytes)=
 at which to put objs */
> -+ =C2=A0 =C2=A0 =C2=A0uint32_t *objs; =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Lis=
t of buffer object (handles) to use */
> -+ =C2=A0 =C2=A0 =C2=A0unsigned int nobjs; =C2=A0 =C2=A0 /* Number of obj=
ects referenced */
> -+ =C2=A0 =C2=A0 =C2=A0int nbox;
> -+ =C2=A0 =C2=A0 =C2=A0struct drm_clip_rect *boxes;
> -+} drm_glamo_cmd_buffer_t;
> -+
> -+
> -+/* Burst command submission - base address and data:
> -+ * =C2=A0- Data can be 32-bit (more easily)
> -+ * =C2=A0- Easier for the kernel to validate */
> -+typedef struct drm_glamo_cmd_burst {
> -+ =C2=A0 =C2=A0 =C2=A0uint16_t base; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/=
* Base address (command) */
> -+ =C2=A0 =C2=A0 =C2=A0int bufsz; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/* Size of data, in bytes */
> -+ =C2=A0 =C2=A0 =C2=A0uint16_t *data; =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Poi=
nter to data */
> -+ =C2=A0 =C2=A0 =C2=A0unsigned int *obj_pos; =C2=A0/* Offsets (in bytes)=
 at which to put objs */
> -+ =C2=A0 =C2=A0 =C2=A0uint32_t *objs; =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Lis=
t of buffer object (handles) to use */
> -+ =C2=A0 =C2=A0 =C2=A0unsigned int nobjs; =C2=A0 =C2=A0 /* Number of obj=
ects referenced */
> -+} drm_glamo_cmd_burst_t;
> -+
> -+struct drm_glamo_gem_info {
> -+ =C2=A0 =C2=A0 =C2=A0uint64_t vram_start;
> -+ =C2=A0 =C2=A0 =C2=A0uint64_t vram_size;
> -+};
> -+
> -+struct drm_glamo_gem_create {
> -+ =C2=A0 =C2=A0 =C2=A0uint64_t size;
> -+ =C2=A0 =C2=A0 =C2=A0uint64_t alignment;
> -+ =C2=A0 =C2=A0 =C2=A0uint32_t handle;
> -+ =C2=A0 =C2=A0 =C2=A0uint32_t initial_domain; // to allow VRAM to be cr=
eated
> -+ =C2=A0 =C2=A0 =C2=A0uint32_t no_backing_store;
> -+};
> -+
> -+struct drm_glamo_gem_mmap {
> -+ =C2=A0 =C2=A0 =C2=A0uint32_t handle; =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Han=
dle goes in... */
> -+ =C2=A0 =C2=A0 =C2=A0uint64_t offset; =C2=A0 =C2=A0 =C2=A0 =C2=A0/* ...=
offset comes out */
> -+};
> -+
> -+struct drm_glamo_gem_wait_rendering {
> -+ =C2=A0 =C2=A0 =C2=A0uint32_t handle;
> -+ =C2=A0 =C2=A0 =C2=A0int have_handle;
> -+};
> -+
> -+struct drm_glamo_gem_pin {
> -+ =C2=A0 =C2=A0 =C2=A0uint32_t handle;
> -+ =C2=A0 =C2=A0 =C2=A0uint32_t pin_domain;
> -+ =C2=A0 =C2=A0 =C2=A0uint64_t alignment;
> -+ =C2=A0 =C2=A0 =C2=A0uint64_t offset;
> -+};
> -+
> -+struct drm_glamo_gem_unpin {
> -+ =C2=A0 =C2=A0 =C2=A0uint32_t handle;
> -+ =C2=A0 =C2=A0 =C2=A0uint32_t pad;
> -+};
> -+
> -+struct drm_glamo_gem_pread {
> -+ =C2=A0 =C2=A0 =C2=A0/** Handle for the object being read. */
> -+ =C2=A0 =C2=A0 =C2=A0uint32_t handle;
> -+ =C2=A0 =C2=A0 =C2=A0uint32_t pad;
> -+ =C2=A0 =C2=A0 =C2=A0/** Offset into the object to read from */
> -+ =C2=A0 =C2=A0 =C2=A0uint64_t offset;
> -+ =C2=A0 =C2=A0 =C2=A0/** Length of data to read */
> -+ =C2=A0 =C2=A0 =C2=A0uint64_t size;
> -+ =C2=A0 =C2=A0 =C2=A0/** Pointer to write the data into. */
> -+ =C2=A0 =C2=A0 =C2=A0uint64_t data_ptr; =C2=A0 =C2=A0 =C2=A0/* void *, =
but pointers are not 32/64 compatible */
> -+};
> -+
> -+struct drm_glamo_gem_pwrite {
> -+ =C2=A0 =C2=A0 =C2=A0/** Handle for the object being written to. */
> -+ =C2=A0 =C2=A0 =C2=A0uint32_t handle;
> -+ =C2=A0 =C2=A0 =C2=A0uint32_t pad;
> -+ =C2=A0 =C2=A0 =C2=A0/** Offset into the object to write to */
> -+ =C2=A0 =C2=A0 =C2=A0uint64_t offset;
> -+ =C2=A0 =C2=A0 =C2=A0/** Length of data to write */
> -+ =C2=A0 =C2=A0 =C2=A0uint64_t size;
> -+ =C2=A0 =C2=A0 =C2=A0/** Pointer to read the data from. */
> -+ =C2=A0 =C2=A0 =C2=A0uint64_t data_ptr; =C2=A0 =C2=A0 =C2=A0/* void *, =
but pointers are not 32/64 compatible */
> -+};
> -+
> -+#endif
> diff --git a/recipes/dri/libdrm-2.4.22/glamo.patch b/recipes/dri/libdrm-2=
.4.22/glamo.patch
> deleted file mode 100644
> index b397ded..0000000
> --- a/recipes/dri/libdrm-2.4.22/glamo.patch
> +++ /dev/null
> @@ -1,1095 +0,0 @@
> -diff --git a/Makefile.am b/Makefile.am
> -index 25d1747..f384228 100644
> ---- a/Makefile.am
> -+++ b/Makefile.am
> -@@ -41,7 +41,11 @@ if HAVE_RADEON
> - RADEON_SUBDIR =3D radeon
> - endif
> -
> --SUBDIRS =3D . $(LIBKMS_SUBDIR) $(INTEL_SUBDIR) $(NOUVEAU_SUBDIR) $(RADE=
ON_SUBDIR) tests include
> -+if HAVE_GLAMO
> -+GLAMO_SUBDIR =3D glamo
> -+endif
> -+
> -+SUBDIRS =3D . $(LIBKMS_SUBDIR) $(INTEL_SUBDIR) $(NOUVEAU_SUBDIR) $(RADE=
ON_SUBDIR) $(GLAMO_SUBDIR) tests include
> -
> - libdrm_la_LTLIBRARIES =3D libdrm.la
> - libdrm_ladir =3D $(libdir)
> -diff --git a/configure.ac b/configure.ac
> -index 62db817..0b2a33e 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -73,6 +73,11 @@ AC_ARG_ENABLE(nouveau-experimental-api,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [NOUVEAU=3D$enableval], [NOUV=
EAU=3Dno])
> -
> -
> -+AC_ARG_ENABLE(glamo-experimental-api,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AS_HELP_STRING([--enable-glam=
o-experimental-api],
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[Enable support for Glamo's K=
MS API (default: disabled)]),
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[GLAMO=3D$enableval], [GLAMO=
=3Dno])
> -+
> - dnl =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> - dnl check compiler flags
> - AC_DEFUN([LIBDRM_CC_TRY_FLAG], [
> -@@ -169,6 +174,11 @@ if test "x$NOUVEAU" =3D xyes; then
> - =C2=A0 =C2=A0 =C2=A0 AC_DEFINE(HAVE_NOUVEAU, 1, [Have nouveau (nvidia) =
support])
> - fi
> -
> -+AM_CONDITIONAL(HAVE_GLAMO, [test "x$GLAMO" =3D xyes])
> -+if test "x$GLAMO" =3D xyes; then
> -+ =C2=A0 =C2=A0 =C2=A0AC_DEFINE(HAVE_GLAMO, 1, [Have glamo support])
> -+fi
> -+
> - PKG_CHECK_MODULES(CAIRO, cairo, [HAVE_CAIRO=3Dyes], [HAVE_CAIRO=3Dno])
> - if test "x$HAVE_CAIRO" =3D xyes; then
> - =C2=A0 =C2=A0 =C2=A0 AC_DEFINE(HAVE_CAIRO, 1, [Have cairo support])
> -@@ -262,6 +272,8 @@ AC_OUTPUT([
> - =C2=A0 =C2=A0 =C2=A0 radeon/libdrm_radeon.pc
> - =C2=A0 =C2=A0 =C2=A0 nouveau/Makefile
> - =C2=A0 =C2=A0 =C2=A0 nouveau/libdrm_nouveau.pc
> -+ =C2=A0 =C2=A0 =C2=A0glamo/Makefile
> -+ =C2=A0 =C2=A0 =C2=A0glamo/libdrm_glamo.pc
> - =C2=A0 =C2=A0 =C2=A0 tests/Makefile
> - =C2=A0 =C2=A0 =C2=A0 tests/modeprint/Makefile
> - =C2=A0 =C2=A0 =C2=A0 tests/modetest/Makefile
> -diff --git a/glamo/Makefile.am b/glamo/Makefile.am
> -new file mode 100644
> -index 0000000..1f17aa3
> ---- /dev/null
> -+++ b/glamo/Makefile.am
> -@@ -0,0 +1,52 @@
> -+# Copyright (c) 2009 Thomas Whtie <taw@bitwiz.org.uk>
> -+# Based on libdrm-glamo Copyright =C2=A9 2008 J=C3=A9r=C3=B4me Glisse
> -+#
> -+# Permission is hereby granted, free of charge, to any person obtaining=
 a
> -+# copy of this software and associated documentation files (the "Softwa=
re"),
> -+# to deal in the Software without restriction, including without limita=
tion
> -+# the rights to use, copy, modify, merge, publish, distribute, sublicen=
se,
> -+# and/or sell copies of the Software, and to permit persons to whom the
> -+# Software is furnished to do so, subject to the following conditions:
> -+#
> -+# The above copyright notice and this permission notice (including the =
next
> -+# paragraph) shall be included in all copies or substantial portions of=
 the
> -+# Software.
> -+#
> -+# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> -+# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> -+# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. =C2=A0IN NO EVE=
NT SHALL
> -+# THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR =
OTHER
> -+# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISI=
NG
> -+# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER D=
EALINGS
> -+# IN THE SOFTWARE.
> -+#
> -+# Authors:
> -+# =C2=A0 =C2=A0J=C3=A9r=C3=B4me Glisse <glisse@freedesktop.org>
> -+# =C2=A0 =C2=A0Thomas White <taw@bitwiz.org.uk>
> -+
> -+AM_CFLAGS =3D \
> -+ =C2=A0 =C2=A0 =C2=A0$(WARN_CFLAGS) \
> -+ =C2=A0 =C2=A0 =C2=A0-I$(top_srcdir) \
> -+ =C2=A0 =C2=A0 =C2=A0-I$(top_srcdir)/glamo \
> -+ =C2=A0 =C2=A0 =C2=A0$(PTHREADSTUBS_CFLAGS) \
> -+ =C2=A0 =C2=A0 =C2=A0-I$(top_srcdir)/include/drm
> -+
> -+libdrm_glamo_la_LTLIBRARIES =3D libdrm_glamo.la
> -+libdrm_glamo_ladir =3D $(libdir)
> -+libdrm_glamo_la_LDFLAGS =3D -version-number 1:0:0 -no-undefined
> -+libdrm_glamo_la_LIBADD =3D ../libdrm.la @PTHREADSTUBS_LIBS@
> -+
> -+libdrm_glamo_la_SOURCES =3D \
> -+ =C2=A0 =C2=A0 =C2=A0glamo_bo_gem.c \
> -+ =C2=A0 =C2=A0 =C2=A0glamo_track.c
> -+
> -+libdrm_glamoincludedir =3D ${includedir}/libdrm
> -+libdrm_glamoinclude_HEADERS =3D \
> -+ =C2=A0 =C2=A0 =C2=A0glamo_bo.h \
> -+ =C2=A0 =C2=A0 =C2=A0glamo_bo_gem.h \
> -+ =C2=A0 =C2=A0 =C2=A0glamo_track.h
> -+
> -+pkgconfigdir =3D @pkgconfigdir@
> -+pkgconfig_DATA =3D libdrm_glamo.pc
> -+
> -+EXTRA_DIST =3D libdrm_glamo.pc.in
> -diff --git a/glamo/glamo_bo.h b/glamo/glamo_bo.h
> -new file mode 100644
> -index 0000000..8ef2a18
> ---- /dev/null
> -+++ b/glamo/glamo_bo.h
> -@@ -0,0 +1,183 @@
> -+/*
> -+ * Copyright (c) 2009 Thomas White
> -+ *
> -+ * Heavily based on radeon_bo.h
> -+ * Copyright =C2=A9 2008 J=C3=A9r=C3=B4me Glisse
> -+ * All Rights Reserved.
> -+ *
> -+ * Permission is hereby granted, free of charge, to any person obtainin=
g
> -+ * a copy of this software and associated documentation files (the
> -+ * "Software"), to deal in the Software without restriction, including
> -+ * without limitation the rights to use, copy, modify, merge, publish,
> -+ * distribute, sub license, and/or sell copies of the Software, and to
> -+ * permit persons to whom the Software is furnished to do so, subject t=
o
> -+ * the following conditions:
> -+ *
> -+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> -+ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
> -+ * OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> -+ * NON-INFRINGEMENT. IN NO EVENT SHALL THE COPYRIGHT HOLDERS, AUTHORS
> -+ * AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> -+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> -+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
> -+ * USE OR OTHER DEALINGS IN THE SOFTWARE.
> -+ *
> -+ * The above copyright notice and this permission notice (including the
> -+ * next paragraph) shall be included in all copies or substantial porti=
ons
> -+ * of the Software.
> -+ */
> -+/*
> -+ * Authors:
> -+ * =C2=A0 =C2=A0 =C2=A0J=C3=A9r=C3=B4me Glisse <glisse@freedesktop.org>
> -+ * =C2=A0 =C2=A0Thomas White <taw@bitwiz.org.uk>
> -+ */
> -+#ifndef GLAMO_BO_H
> -+#define GLAMO_BO_H
> -+
> -+#include <stdio.h>
> -+#include <stdint.h>
> -+#include "glamo_track.h"
> -+
> -+/* bo object */
> -+#define GLAMO_BO_FLAGS_MACRO_TILE =C2=A01
> -+#define GLAMO_BO_FLAGS_MICRO_TILE =C2=A02
> -+
> -+struct glamo_bo_manager;
> -+
> -+struct glamo_bo {
> -+ =C2=A0 =C2=A0uint32_t =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0alignment;
> -+ =C2=A0 =C2=A0uint32_t =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0handle;
> -+ =C2=A0 =C2=A0uint32_t =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0size;
> -+ =C2=A0 =C2=A0uint32_t =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0domains;
> -+ =C2=A0 =C2=A0uint32_t =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0flags;
> -+ =C2=A0 =C2=A0unsigned =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0cref;
> -+#ifdef GLAMO_BO_TRACK
> -+ =C2=A0 =C2=A0struct glamo_track =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0*track;
> -+#endif
> -+ =C2=A0 =C2=A0struct glamo_bo_manager =C2=A0 *bom;
> -+ =C2=A0 =C2=A0void =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0*virtual;
> -+ =C2=A0 =C2=A0uint32_t =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0space_accounted;
> -+};
> -+
> -+/* bo functions */
> -+struct glamo_bo_funcs {
> -+ =C2=A0 =C2=A0struct glamo_bo *(*bo_open)(struct glamo_bo_manager *bom,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t handle,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t size,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t alignment,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t domains,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t flags);
> -+ =C2=A0 =C2=A0void (*bo_ref)(struct glamo_bo *bo);
> -+ =C2=A0 =C2=A0struct glamo_bo *(*bo_unref)(struct glamo_bo *bo);
> -+ =C2=A0 =C2=A0int (*bo_map)(struct glamo_bo *bo, int write);
> -+ =C2=A0 =C2=A0int (*bo_unmap)(struct glamo_bo *bo);
> -+ =C2=A0 =C2=A0int (*bo_wait)(struct glamo_bo *bo);
> -+};
> -+
> -+struct glamo_bo_manager {
> -+ =C2=A0 =C2=A0struct glamo_bo_funcs =C2=A0*funcs;
> -+ =C2=A0 =C2=A0int =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 fd;
> -+ =C2=A0 =C2=A0struct glamo_tracker =C2=A0 tracker;
> -+};
> -+
> -+static inline void _glamo_bo_debug(struct glamo_bo *bo,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *op,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *file,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *func,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int line)
> -+{
> -+ =C2=A0 =C2=A0fprintf(stderr, "%s %p 0x%08X 0x%08X 0x%08X [%s %s %d]\n"=
,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0op, (void *)bo, bo->handle, b=
o->size, bo->cref, file, func, line);
> -+}
> -+
> -+static inline struct glamo_bo *_glamo_bo_open(struct glamo_bo_manager *=
bom,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0uint32_t handle,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0uint32_t size,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0uint32_t alignment,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0uint32_t domains,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0uint32_t flags,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0const char *file,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0const char *func,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0int line)
> -+{
> -+ =C2=A0 =C2=A0struct glamo_bo *bo;
> -+
> -+ =C2=A0 =C2=A0bo =3D bom->funcs->bo_open(bom, handle, size, alignment, =
domains, flags);
> -+#ifdef GLAMO_BO_TRACK
> -+ =C2=A0 =C2=A0if (bo) {
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0bo->track =3D glamo_tracker_add_track(&bom-=
>tracker, bo->handle);
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0glamo_track_add_event(bo->track, file, func=
, "open", line);
> -+ =C2=A0 =C2=A0}
> -+#endif
> -+ =C2=A0 =C2=A0return bo;
> -+}
> -+
> -+static inline void _glamo_bo_ref(struct glamo_bo *bo,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *file,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *func,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int line)
> -+{
> -+ =C2=A0 =C2=A0bo->cref++;
> -+#ifdef GLAMO_BO_TRACK
> -+ =C2=A0 =C2=A0glamo_track_add_event(bo->track, file, func, "ref", line)=
;
> -+#endif
> -+ =C2=A0 =C2=A0bo->bom->funcs->bo_ref(bo);
> -+}
> -+
> -+static inline struct glamo_bo *_glamo_bo_unref(struct glamo_bo *bo,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 const char *file,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 const char *func,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 int line)
> -+{
> -+ =C2=A0 =C2=A0bo->cref--;
> -+#ifdef GLAMO_BO_TRACK
> -+ =C2=A0 =C2=A0glamo_track_add_event(bo->track, file, func, "unref", lin=
e);
> -+ =C2=A0 =C2=A0if (bo->cref <=3D 0) {
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0glamo_tracker_remove_track(&bo->bom->tracke=
r, bo->track);
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0bo->track =3D NULL;
> -+ =C2=A0 =C2=A0}
> -+#endif
> -+ =C2=A0 =C2=A0return bo->bom->funcs->bo_unref(bo);
> -+}
> -+
> -+static inline int _glamo_bo_map(struct glamo_bo *bo,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int write,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *file,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *func,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int line)
> -+{
> -+ =C2=A0 =C2=A0return bo->bom->funcs->bo_map(bo, write);
> -+}
> -+
> -+static inline int _glamo_bo_unmap(struct glamo_bo *bo,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *file,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *func,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int line)
> -+{
> -+ =C2=A0 =C2=A0return bo->bom->funcs->bo_unmap(bo);
> -+}
> -+
> -+static inline int _glamo_bo_wait(struct glamo_bo *bo,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *file,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *func,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int line)
> -+{
> -+ =C2=A0 =C2=A0return bo->bom->funcs->bo_wait(bo);
> -+}
> -+
> -+#define glamo_bo_open(bom, h, s, a, d, f)\
> -+ =C2=A0 =C2=A0_glamo_bo_open(bom, h, s, a, d, f, __FILE__, __FUNCTION__=
, __LINE__)
> -+#define glamo_bo_ref(bo)\
> -+ =C2=A0 =C2=A0_glamo_bo_ref(bo, __FILE__, __FUNCTION__, __LINE__)
> -+#define glamo_bo_unref(bo)\
> -+ =C2=A0 =C2=A0_glamo_bo_unref(bo, __FILE__, __FUNCTION__, __LINE__)
> -+#define glamo_bo_map(bo, w)\
> -+ =C2=A0 =C2=A0_glamo_bo_map(bo, w, __FILE__, __FUNCTION__, __LINE__)
> -+#define glamo_bo_unmap(bo)\
> -+ =C2=A0 =C2=A0_glamo_bo_unmap(bo, __FILE__, __FUNCTION__, __LINE__)
> -+#define glamo_bo_debug(bo, opcode)\
> -+ =C2=A0 =C2=A0_glamo_bo_debug(bo, opcode, __FILE__, __FUNCTION__, __LIN=
E__)
> -+#define glamo_bo_wait(bo) \
> -+ =C2=A0 =C2=A0_glamo_bo_wait(bo, __FILE__, __func__, __LINE__)
> -+
> -+#endif
> -diff --git a/glamo/glamo_bo_gem.c b/glamo/glamo_bo_gem.c
> -new file mode 100644
> -index 0000000..38a4436
> ---- /dev/null
> -+++ b/glamo/glamo_bo_gem.c
> -@@ -0,0 +1,336 @@
> -+/*
> -+ * Copyright =C2=A9 2009 Thomas White
> -+ *
> -+ * Based on radeon_bo_gem.c, to which the following notice applies:
> -+ *
> -+ * Copyright =C2=A9 2008 Dave Airlie
> -+ * Copyright =C2=A9 2008 J=C3=A9r=C3=B4me Glisse
> -+ * All Rights Reserved.
> -+ *
> -+ * Permission is hereby granted, free of charge, to any person obtainin=
g
> -+ * a copy of this software and associated documentation files (the
> -+ * "Software"), to deal in the Software without restriction, including
> -+ * without limitation the rights to use, copy, modify, merge, publish,
> -+ * distribute, sub license, and/or sell copies of the Software, and to
> -+ * permit persons to whom the Software is furnished to do so, subject t=
o
> -+ * the following conditions:
> -+ *
> -+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> -+ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
> -+ * OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> -+ * NON-INFRINGEMENT. IN NO EVENT SHALL THE COPYRIGHT HOLDERS, AUTHORS
> -+ * AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> -+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> -+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
> -+ * USE OR OTHER DEALINGS IN THE SOFTWARE.
> -+ *
> -+ * The above copyright notice and this permission notice (including the
> -+ * next paragraph) shall be included in all copies or substantial porti=
ons
> -+ * of the Software.
> -+ */
> -+/*
> -+ * Authors:
> -+ * =C2=A0 =C2=A0 =C2=A0Dave Airlie
> -+ * =C2=A0 =C2=A0 =C2=A0J=C3=A9r=C3=B4me Glisse <glisse@freedesktop.org>
> -+ *
> -+ *
> -+ * Memory mapping functions are based on intel_bufmgr_gem.c, to which t=
he
> -+ * following notice applies:
> -+ *
> -+ * Copyright =C2=A9 2007 Red Hat Inc.
> -+ * Copyright =C2=A9 2007 Intel Corporation
> -+ * Copyright 2006 Tungsten Graphics, Inc., Bismarck, ND., USA
> -+ * All Rights Reserved.
> -+ *
> -+ * Permission is hereby granted, free of charge, to any person obtainin=
g a
> -+ * copy of this software and associated documentation files (the
> -+ * "Software"), to deal in the Software without restriction, including
> -+ * without limitation the rights to use, copy, modify, merge, publish,
> -+ * distribute, sub license, and/or sell copies of the Software, and to
> -+ * permit persons to whom the Software is furnished to do so, subject t=
o
> -+ * the following conditions:
> -+ *
> -+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPR=
ESS OR
> -+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABIL=
ITY,
> -+ * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT S=
HALL
> -+ * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR AN=
Y CLAIM,
> -+ * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT O=
R
> -+ * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE O=
R THE
> -+ * USE OR OTHER DEALINGS IN THE SOFTWARE.
> -+ *
> -+ * The above copyright notice and this permission notice (including the
> -+ * next paragraph) shall be included in all copies or substantial porti=
ons
> -+ * of the Software.
> -+ *
> -+ *
> -+ **********************************************************************=
****/
> -+/*
> -+ * Authors: Thomas Hellstr=C3=B6m <thomas-at-tungstengraphics-dot-com>
> -+ * =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Keith Whitwell <keithw-at-tungsten=
graphics-dot-com>
> -+ * =C2=A0 =C2=A0 =C2=A0 =C2=A0Eric Anholt <eric@anholt.net>
> -+ * =C2=A0 =C2=A0 =C2=A0 =C2=A0Dave Airlie <airlied@linux.ie>
> -+ */
> -+
> -+#ifdef HAVE_CONFIG_H
> -+#include "config.h"
> -+#endif
> -+
> -+#include <stdio.h>
> -+#include <stdint.h>
> -+#include <stdlib.h>
> -+#include <string.h>
> -+#include <sys/mman.h>
> -+#include <sys/ioctl.h>
> -+#include <errno.h>
> -+
> -+#include "xf86drm.h"
> -+#include "drm.h"
> -+#include "glamo_drm.h"
> -+#include "glamo_bo.h"
> -+#include "glamo_bo_gem.h"
> -+
> -+struct glamo_bo_gem {
> -+ =C2=A0 =C2=A0 =C2=A0struct glamo_bo =C2=A0 base;
> -+ =C2=A0 =C2=A0 =C2=A0uint32_t =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0name;
> -+ =C2=A0 =C2=A0 =C2=A0int =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 map_count;
> -+};
> -+
> -+struct bo_manager_gem {
> -+ =C2=A0 =C2=A0 =C2=A0struct glamo_bo_manager =C2=A0 =C2=A0base;
> -+};
> -+
> -+static struct glamo_bo *bo_open(struct glamo_bo_manager *bom,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t handle,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t size,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t alignment,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t domains,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t flags)
> -+{
> -+ =C2=A0 =C2=A0 =C2=A0struct glamo_bo_gem *bo;
> -+ =C2=A0 =C2=A0 =C2=A0int r;
> -+
> -+ =C2=A0 =C2=A0 =C2=A0bo =3D (struct glamo_bo_gem*)calloc(1, sizeof(stru=
ct glamo_bo_gem));
> -+ =C2=A0 =C2=A0 =C2=A0if (bo =3D=3D NULL) {
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;
> -+ =C2=A0 =C2=A0 =C2=A0}
> -+
> -+ =C2=A0 =C2=A0 =C2=A0bo->base.bom =3D bom;
> -+ =C2=A0 =C2=A0 =C2=A0bo->base.handle =3D 0;
> -+ =C2=A0 =C2=A0 =C2=A0bo->base.size =3D size;
> -+ =C2=A0 =C2=A0 =C2=A0bo->base.alignment =3D alignment;
> -+ =C2=A0 =C2=A0 =C2=A0bo->base.domains =3D domains;
> -+ =C2=A0 =C2=A0 =C2=A0bo->base.flags =3D flags;
> -+ =C2=A0 =C2=A0 =C2=A0bo->base.cref =3D 0;
> -+ =C2=A0 =C2=A0 =C2=A0bo->map_count =3D 0;
> -+ =C2=A0 =C2=A0 =C2=A0bo->base.virtual =3D NULL;
> -+ =C2=A0 =C2=A0 =C2=A0if (handle) {
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_gem_open op=
en_arg;
> -+
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memset(&open_arg, 0, s=
izeof(open_arg));
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0open_arg.name =3D hand=
le;
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D ioctl(bom->fd, D=
RM_IOCTL_GEM_OPEN, &open_arg);
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r !=3D 0) {
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0free(bo);
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0return NULL;
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bo->base.handle =3D op=
en_arg.handle;
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bo->base.size =3D open=
_arg.size;
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bo->name =3D handle;
> -+ =C2=A0 =C2=A0 =C2=A0} else {
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_glamo_gem_c=
reate args;
> -+
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0args.size =3D size;
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0args.alignment =3D ali=
gnment;
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0args.initial_domain =
=3D bo->base.domains;
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0args.no_backing_store =
=3D 0;
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0args.handle =3D 0;
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D drmCommandWriteR=
ead(bom->fd, DRM_GLAMO_GEM_CREATE,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&args, sizeof=
(args));
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bo->base.handle =3D ar=
gs.handle;
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r) {
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0fprintf(stderr, "Failed to allocate :\n");
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0fprintf(stderr, " =C2=A0 size =C2=A0 =C2=A0 =C2=A0: %d bytes\n", size=
);
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0fprintf(stderr, " =C2=A0 alignment : %d bytes\n", alignment);
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0free(bo);
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0return NULL;
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> -+ =C2=A0 =C2=A0 =C2=A0}
> -+ =C2=A0 =C2=A0 =C2=A0glamo_bo_ref((struct glamo_bo*)bo);
> -+ =C2=A0 =C2=A0 =C2=A0return (struct glamo_bo*)bo;
> -+}
> -+
> -+static void bo_ref(struct glamo_bo *bo)
> -+{
> -+}
> -+
> -+static struct glamo_bo *bo_unref(struct glamo_bo *bo)
> -+{
> -+ =C2=A0 =C2=A0 =C2=A0struct glamo_bo_gem *bo_gem =3D (struct glamo_bo_g=
em*)bo;
> -+ =C2=A0 =C2=A0 =C2=A0struct drm_gem_close args;
> -+
> -+ =C2=A0 =C2=A0 =C2=A0if (bo =3D=3D NULL) {
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;
> -+ =C2=A0 =C2=A0 =C2=A0}
> -+ =C2=A0 =C2=A0 =C2=A0if (bo->cref) {
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return bo;
> -+ =C2=A0 =C2=A0 =C2=A0}
> -+ =C2=A0 =C2=A0 =C2=A0if (bo_gem->map_count) {
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0munmap(bo->virtual, bo=
->size);
> -+ =C2=A0 =C2=A0 =C2=A0}
> -+
> -+ =C2=A0 =C2=A0 =C2=A0/* close object */
> -+ =C2=A0 =C2=A0 =C2=A0args.handle =3D bo->handle;
> -+ =C2=A0 =C2=A0 =C2=A0ioctl(bo->bom->fd, DRM_IOCTL_GEM_CLOSE, &args);
> -+ =C2=A0 =C2=A0 =C2=A0memset(bo_gem, 0, sizeof(struct glamo_bo_gem));
> -+ =C2=A0 =C2=A0 =C2=A0free(bo_gem);
> -+ =C2=A0 =C2=A0 =C2=A0return NULL;
> -+}
> -+
> -+static int bo_map(struct glamo_bo *bo, int write)
> -+{
> -+ =C2=A0 =C2=A0 =C2=A0struct glamo_bo_gem *bo_gem;
> -+ =C2=A0 =C2=A0 =C2=A0struct glamo_bo_manager *bufmgr;
> -+ =C2=A0 =C2=A0 =C2=A0int ret;
> -+
> -+ =C2=A0 =C2=A0 =C2=A0bo_gem =3D (struct glamo_bo_gem *)bo;
> -+ =C2=A0 =C2=A0 =C2=A0bufmgr =3D (struct glamo_bo_manager*)bo->bom;
> -+
> -+ =C2=A0 =C2=A0 =C2=A0/* Get a mapping of the buffer if we haven't befor=
e. */
> -+ =C2=A0 =C2=A0 =C2=A0if (bo->virtual =3D=3D NULL) {
> -+
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_glamo_gem_m=
map mmap_arg;
> -+
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memset(&mmap_arg, 0, s=
izeof(mmap_arg));
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mmap_arg.handle =3D bo=
->handle;
> -+
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Get the fake offset=
 back... */
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D ioctl(bufmgr->=
fd, DRM_IOCTL_GLAMO_GEM_MMAP, &mmap_arg);
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret !=3D 0) {
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0fprintf(stderr,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"%s:%d: Error preparing BO map %d (%d): %=
s .\n",
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__FILE__, __LINE__,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bo->handle, bo_gem->name,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0strerror(errno));
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0return ret;
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* and mmap it */
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bo->virtual =3D mmap(0=
, bo->size, PROT_READ | PROT_WRITE,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MAP_SHARED, bufmgr-=
>fd,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mmap_arg.offset);
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (bo->virtual =3D=3D=
 MAP_FAILED) {
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0fprintf(stderr,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"%s:%d: Error mapping buffer %d (%d): %s =
.\n",
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__FILE__, __LINE__,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bo->handle, bo_gem->name,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0strerror(errno));
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0return errno;
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> -+ =C2=A0 =C2=A0 =C2=A0}
> -+ =C2=A0 =C2=A0 =C2=A0bo_gem->map_count++;
> -+
> -+ =C2=A0 =C2=A0 =C2=A0return 0;
> -+}
> -+
> -+static int bo_unmap(struct glamo_bo *bo)
> -+{
> -+ =C2=A0 =C2=A0 =C2=A0struct glamo_bo_gem *bo_gem =3D (struct glamo_bo_g=
em*)bo;
> -+
> -+ =C2=A0 =C2=A0 =C2=A0if ( bo_gem->map_count =3D=3D 0 ) {
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr, "Not u=
nmapping %p, because its map count"
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0" is already zero.\n", bo_gem);
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
> -+ =C2=A0 =C2=A0 =C2=A0}
> -+
> -+ =C2=A0 =C2=A0 =C2=A0if (--bo_gem->map_count > 0) {
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
> -+ =C2=A0 =C2=A0 =C2=A0}
> -+ =C2=A0 =C2=A0 =C2=A0munmap(bo->virtual, bo->size);
> -+ =C2=A0 =C2=A0 =C2=A0bo->virtual =3D NULL;
> -+ =C2=A0 =C2=A0 =C2=A0return 0;
> -+}
> -+
> -+static int bo_wait(struct glamo_bo *bo)
> -+{
> -+ =C2=A0 =C2=A0 =C2=A0struct drm_glamo_gem_wait_rendering args;
> -+ =C2=A0 =C2=A0 =C2=A0int ret;
> -+
> -+ =C2=A0 =C2=A0 =C2=A0args.handle =3D bo->handle;
> -+ =C2=A0 =C2=A0 =C2=A0args.have_handle =3D 1;
> -+ =C2=A0 =C2=A0 =C2=A0do {
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D drmCommandWrit=
eRead(bo->bom->fd,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_GL=
AMO_GEM_WAIT_RENDERING,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&args,=
 sizeof(args));
> -+ =C2=A0 =C2=A0 =C2=A0} while (ret =3D=3D -EAGAIN);
> -+ =C2=A0 =C2=A0 =C2=A0return ret;
> -+}
> -+
> -+static struct glamo_bo_funcs bo_gem_funcs =3D {
> -+ =C2=A0 =C2=A0 =C2=A0bo_open,
> -+ =C2=A0 =C2=A0 =C2=A0bo_ref,
> -+ =C2=A0 =C2=A0 =C2=A0bo_unref,
> -+ =C2=A0 =C2=A0 =C2=A0bo_map,
> -+ =C2=A0 =C2=A0 =C2=A0bo_unmap,
> -+ =C2=A0 =C2=A0 =C2=A0bo_wait
> -+};
> -+
> -+struct glamo_bo_manager *glamo_bo_manager_gem_ctor(int fd)
> -+{
> -+ =C2=A0 =C2=A0 =C2=A0struct bo_manager_gem *bomg;
> -+
> -+ =C2=A0 =C2=A0 =C2=A0bomg =3D (struct bo_manager_gem*)calloc(1, sizeof(=
struct bo_manager_gem));
> -+ =C2=A0 =C2=A0 =C2=A0if (bomg =3D=3D NULL) return NULL;
> -+
> -+ =C2=A0 =C2=A0 =C2=A0bomg->base.funcs =3D &bo_gem_funcs;
> -+ =C2=A0 =C2=A0 =C2=A0bomg->base.fd =3D fd;
> -+ =C2=A0 =C2=A0 =C2=A0return (struct glamo_bo_manager*)bomg;
> -+}
> -+
> -+void glamo_bo_manager_gem_dtor(struct glamo_bo_manager *bom)
> -+{
> -+ =C2=A0 =C2=A0 =C2=A0struct bo_manager_gem *bomg =3D (struct bo_manager=
_gem*)bom;
> -+
> -+ =C2=A0 =C2=A0 =C2=A0if (bom =3D=3D NULL) return;
> -+ =C2=A0 =C2=A0 =C2=A0free(bomg);
> -+}
> -+
> -+uint32_t glamo_gem_get_name(struct glamo_bo *bo)
> -+{
> -+ =C2=A0 =C2=A0 =C2=A0struct glamo_bo_gem *bo_gem =3D (struct glamo_bo_g=
em*)bo;
> -+ =C2=A0 =C2=A0 =C2=A0return bo_gem->name;
> -+}
> -+
> -+int glamo_gem_name_buffer(struct glamo_bo *bo, uint32_t *name)
> -+{
> -+ =C2=A0 =C2=A0 =C2=A0struct drm_gem_flink flink;
> -+ =C2=A0 =C2=A0 =C2=A0int r;
> -+
> -+ =C2=A0 =C2=A0 =C2=A0if ( !bo ) {
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr, "No bu=
ffer object!\n");
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;
> -+ =C2=A0 =C2=A0 =C2=A0}
> -+
> -+ =C2=A0 =C2=A0 =C2=A0flink.handle =3D bo->handle;
> -+ =C2=A0 =C2=A0 =C2=A0r =3D ioctl(bo->bom->fd, DRM_IOCTL_GEM_FLINK, &fli=
nk);
> -+ =C2=A0 =C2=A0 =C2=A0if (r) return r;
> -+
> -+ =C2=A0 =C2=A0 =C2=A0*name =3D flink.name;
> -+ =C2=A0 =C2=A0 =C2=A0return 0;
> -+}
> -+
> -+int glamo_bo_subdata(struct glamo_bo *bo, unsigned long offset,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
unsigned long size, const void *data)
> -+{
> -+ =C2=A0 =C2=A0 =C2=A0int ret;
> -+
> -+ =C2=A0 =C2=A0 =C2=A0if (size =3D=3D 0 || data =3D=3D NULL)
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
> -+
> -+ =C2=A0 =C2=A0 =C2=A0ret =3D bo_map(bo, 1);
> -+ =C2=A0 =C2=A0 =C2=A0if ( ret ) return ret;
> -+
> -+ =C2=A0 =C2=A0 =C2=A0memcpy((unsigned char *)bo->virtual + offset, data=
, size);
> -+
> -+ =C2=A0 =C2=A0 =C2=A0bo_unmap(bo);
> -+
> -+ =C2=A0 =C2=A0 =C2=A0return 0;
> -+}
> -diff --git a/glamo/glamo_bo_gem.h b/glamo/glamo_bo_gem.h
> -new file mode 100644
> -index 0000000..05b5fb9
> ---- /dev/null
> -+++ b/glamo/glamo_bo_gem.h
> -@@ -0,0 +1,43 @@
> -+/*
> -+ * Copyright =C2=A9 2008 Dave Airlie
> -+ * Copyright =C2=A9 2008 J=C3=A9r=C3=B4me Glisse
> -+ * All Rights Reserved.
> -+ *
> -+ * Permission is hereby granted, free of charge, to any person obtainin=
g
> -+ * a copy of this software and associated documentation files (the
> -+ * "Software"), to deal in the Software without restriction, including
> -+ * without limitation the rights to use, copy, modify, merge, publish,
> -+ * distribute, sub license, and/or sell copies of the Software, and to
> -+ * permit persons to whom the Software is furnished to do so, subject t=
o
> -+ * the following conditions:
> -+ *
> -+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> -+ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
> -+ * OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> -+ * NON-INFRINGEMENT. IN NO EVENT SHALL THE COPYRIGHT HOLDERS, AUTHORS
> -+ * AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> -+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> -+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
> -+ * USE OR OTHER DEALINGS IN THE SOFTWARE.
> -+ *
> -+ * The above copyright notice and this permission notice (including the
> -+ * next paragraph) shall be included in all copies or substantial porti=
ons
> -+ * of the Software.
> -+ */
> -+/*
> -+ * Authors:
> -+ * =C2=A0 =C2=A0 =C2=A0Dave Airlie
> -+ * =C2=A0 =C2=A0 =C2=A0J=C3=A9r=C3=B4me Glisse <glisse@freedesktop.org>
> -+ */
> -+#ifndef GLAMO_BO_GEM_H
> -+#define GLAMO_BO_GEM_H
> -+
> -+#include "glamo_bo.h"
> -+
> -+struct glamo_bo_manager *glamo_bo_manager_gem_ctor(int fd);
> -+void glamo_bo_manager_gem_dtor(struct glamo_bo_manager *bom);
> -+int glamo_gem_name_buffer(struct glamo_bo *bo, uint32_t *name);
> -+uint32_t glamo_gem_get_name(struct glamo_bo *bo);
> -+extern int glamo_bo_subdata(struct glamo_bo *bo, unsigned long offset,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long size, const void *data);
> -+#endif
> -diff --git a/glamo/glamo_track.c b/glamo/glamo_track.c
> -new file mode 100644
> -index 0000000..27ffe41
> ---- /dev/null
> -+++ b/glamo/glamo_track.c
> -@@ -0,0 +1,140 @@
> -+/*
> -+ * Copyright =C2=A9 2008 J=C3=A9r=C3=B4me Glisse
> -+ * All Rights Reserved.
> -+ *
> -+ * Permission is hereby granted, free of charge, to any person obtainin=
g
> -+ * a copy of this software and associated documentation files (the
> -+ * "Software"), to deal in the Software without restriction, including
> -+ * without limitation the rights to use, copy, modify, merge, publish,
> -+ * distribute, sub license, and/or sell copies of the Software, and to
> -+ * permit persons to whom the Software is furnished to do so, subject t=
o
> -+ * the following conditions:
> -+ *
> -+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> -+ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
> -+ * OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> -+ * NON-INFRINGEMENT. IN NO EVENT SHALL THE COPYRIGHT HOLDERS, AUTHORS
> -+ * AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> -+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> -+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
> -+ * USE OR OTHER DEALINGS IN THE SOFTWARE.
> -+ *
> -+ * The above copyright notice and this permission notice (including the
> -+ * next paragraph) shall be included in all copies or substantial porti=
ons
> -+ * of the Software.
> -+ */
> -+/*
> -+ * Authors:
> -+ * =C2=A0 =C2=A0 =C2=A0J=C3=A9r=C3=B4me Glisse <glisse@freedesktop.org>
> -+ */
> -+#include <stdio.h>
> -+#include <stdlib.h>
> -+#include <string.h>
> -+#include "glamo_track.h"
> -+
> -+void glamo_track_add_event(struct glamo_track *track,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *file,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *func,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *op,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned line)
> -+{
> -+ =C2=A0 =C2=A0struct glamo_track_event *event;
> -+
> -+ =C2=A0 =C2=A0if (track =3D=3D NULL) {
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0return;
> -+ =C2=A0 =C2=A0}
> -+ =C2=A0 =C2=A0event =3D (void*)calloc(1,sizeof(struct glamo_track_event=
));
> -+ =C2=A0 =C2=A0if (event =3D=3D NULL) {
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0return;
> -+ =C2=A0 =C2=A0}
> -+ =C2=A0 =C2=A0event->line =3D line;
> -+ =C2=A0 =C2=A0event->file =3D strdup(file);
> -+ =C2=A0 =C2=A0event->func =3D strdup(func);
> -+ =C2=A0 =C2=A0event->op =3D strdup(op);
> -+ =C2=A0 =C2=A0if (event->file =3D=3D NULL || event->func =3D=3D NULL ||=
 event->op =3D=3D NULL) {
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0free(event->file);
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0free(event->func);
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0free(event->op);
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0free(event);
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0return;
> -+ =C2=A0 =C2=A0}
> -+ =C2=A0 =C2=A0event->next =3D track->events;
> -+ =C2=A0 =C2=A0track->events =3D event;
> -+}
> -+
> -+struct glamo_track *glamo_tracker_add_track(struct glamo_tracker *track=
er,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0unsigned key)
> -+{
> -+ =C2=A0 =C2=A0struct glamo_track *track;
> -+
> -+ =C2=A0 =C2=A0track =3D (struct glamo_track*)calloc(1, sizeof(struct gl=
amo_track));
> -+ =C2=A0 =C2=A0if (track) {
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0track->next =3D tracker->tracks.next;
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0track->prev =3D &tracker->tracks;
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0tracker->tracks.next =3D track;
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0if (track->next) {
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0track->next->prev =3D track;
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0track->key =3D key;
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0track->events =3D NULL;
> -+ =C2=A0 =C2=A0}
> -+ =C2=A0 =C2=A0return track;
> -+}
> -+
> -+void glamo_tracker_remove_track(struct glamo_tracker *tracker,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct glamo_track *track)
> -+{
> -+ =C2=A0 =C2=A0struct glamo_track_event *event;
> -+ =C2=A0 =C2=A0void *tmp;
> -+
> -+ =C2=A0 =C2=A0if (track =3D=3D NULL) {
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0return;
> -+ =C2=A0 =C2=A0}
> -+ =C2=A0 =C2=A0track->prev->next =3D track->next;
> -+ =C2=A0 =C2=A0if (track->next) {
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0track->next->prev =3D track->prev;
> -+ =C2=A0 =C2=A0}
> -+ =C2=A0 =C2=A0track->next =3D track->prev =3D NULL;
> -+ =C2=A0 =C2=A0event =3D track->events;
> -+ =C2=A0 =C2=A0while (event) {
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0tmp =3D event;
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0free(event->file);
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0free(event->func);
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0free(event->op);
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0event =3D event->next;
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0free(tmp);
> -+ =C2=A0 =C2=A0}
> -+ =C2=A0 =C2=A0track->events =3D NULL;
> -+ =C2=A0 =C2=A0free(track);
> -+}
> -+
> -+void glamo_tracker_print(struct glamo_tracker *tracker, FILE *file)
> -+{
> -+ =C2=A0 =C2=A0struct glamo_track *track;
> -+ =C2=A0 =C2=A0struct glamo_track_event *event;
> -+ =C2=A0 =C2=A0void *tmp;
> -+
> -+ =C2=A0 =C2=A0track =3D tracker->tracks.next;
> -+ =C2=A0 =C2=A0while (track) {
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0event =3D track->events;
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(file, "[0x%08X] :\n", track->key);
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0while (event) {
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmp =3D event;
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(file, " =C2=A0[0x%08X=
:%s](%s:%s:%d)\n",
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0t=
rack->key, event->op, =C2=A0event->file,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0e=
vent->func, event->line);
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free(event->file);
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free(event->func);
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free(event->op);
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0event->file =3D NULL;
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0event->func =3D NULL;
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0event->op =3D NULL;
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0event =3D event->next;
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free(tmp);
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0track->events =3D NULL;
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0tmp =3D track;
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0track =3D track->next;
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0free(tmp);
> -+ =C2=A0 =C2=A0}
> -+}
> -diff --git a/glamo/glamo_track.h b/glamo/glamo_track.h
> -new file mode 100644
> -index 0000000..fedead7
> ---- /dev/null
> -+++ b/glamo/glamo_track.h
> -@@ -0,0 +1,64 @@
> -+/*
> -+ * Copyright =C2=A9 2008 J=C3=A9r=C3=B4me Glisse
> -+ * All Rights Reserved.
> -+ *
> -+ * Permission is hereby granted, free of charge, to any person obtainin=
g
> -+ * a copy of this software and associated documentation files (the
> -+ * "Software"), to deal in the Software without restriction, including
> -+ * without limitation the rights to use, copy, modify, merge, publish,
> -+ * distribute, sub license, and/or sell copies of the Software, and to
> -+ * permit persons to whom the Software is furnished to do so, subject t=
o
> -+ * the following conditions:
> -+ *
> -+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> -+ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
> -+ * OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> -+ * NON-INFRINGEMENT. IN NO EVENT SHALL THE COPYRIGHT HOLDERS, AUTHORS
> -+ * AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> -+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> -+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
> -+ * USE OR OTHER DEALINGS IN THE SOFTWARE.
> -+ *
> -+ * The above copyright notice and this permission notice (including the
> -+ * next paragraph) shall be included in all copies or substantial porti=
ons
> -+ * of the Software.
> -+ */
> -+/*
> -+ * Authors:
> -+ * =C2=A0 =C2=A0 =C2=A0J=C3=A9r=C3=B4me Glisse <glisse@freedesktop.org>
> -+ */
> -+#ifndef GLAMO_TRACK_H
> -+#define GLAMO_TRACK_H
> -+
> -+struct glamo_track_event {
> -+ =C2=A0 =C2=A0struct glamo_track_event =C2=A0 *next;
> -+ =C2=A0 =C2=A0char =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*file;
> -+ =C2=A0 =C2=A0char =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*func;
> -+ =C2=A0 =C2=A0char =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*op;
> -+ =C2=A0 =C2=A0unsigned =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0line;
> -+};
> -+
> -+struct glamo_track {
> -+ =C2=A0 =C2=A0struct glamo_track =C2=A0 =C2=A0 =C2=A0 =C2=A0 *next;
> -+ =C2=A0 =C2=A0struct glamo_track =C2=A0 =C2=A0 =C2=A0 =C2=A0 *prev;
> -+ =C2=A0 =C2=A0unsigned =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0key;
> -+ =C2=A0 =C2=A0struct glamo_track_event =C2=A0 *events;
> -+};
> -+
> -+struct glamo_tracker {
> -+ =C2=A0 =C2=A0struct glamo_track =C2=A0 =C2=A0 =C2=A0 =C2=A0 tracks;
> -+};
> -+
> -+void glamo_track_add_event(struct glamo_track *track,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *file,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *func,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *op,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned line);
> -+struct glamo_track *glamo_tracker_add_track(struct glamo_tracker *track=
er,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0unsigned key);
> -+void glamo_tracker_remove_track(struct glamo_tracker *tracker,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct glamo_track *track);
> -+void glamo_tracker_print(struct glamo_tracker *tracker,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0FILE *file);
> -+
> -+#endif
> -diff --git a/glamo/libdrm_glamo.pc.in b/glamo/libdrm_glamo.pc.in
> -new file mode 100644
> -index 0000000..d4d8e70
> ---- /dev/null
> -+++ b/glamo/libdrm_glamo.pc.in
> -@@ -0,0 +1,10 @@
> -+prefix=3D@prefix@
> -+exec_prefix=3D@exec_prefix@
> -+libdir=3D@libdir@
> -+includedir=3D@includedir@
> -+
> -+Name: libdrm_glamo
> -+Description: Userspace interface to kernel DRM services for Glamo
> -+Version: 1.0.1
> -+Libs: -L${libdir} -ldrm_glamo
> -+Cflags: -I${includedir} -I${includedir}/libdrm
> -diff --git a/include/drm/Makefile.am b/include/drm/Makefile.am
> -index 43695bd..f3f7edf 100644
> ---- a/include/drm/Makefile.am
> -+++ b/include/drm/Makefile.am
> -@@ -35,6 +35,7 @@ klibdrminclude_HEADERS =3D \
> - =C2=A0 =C2=A0 =C2=A0 savage_drm.h \
> - =C2=A0 =C2=A0 =C2=A0 sis_drm.h \
> - =C2=A0 =C2=A0 =C2=A0 via_drm.h \
> -+ =C2=A0 =C2=A0 =C2=A0glamo_drm.h \
> - =C2=A0 =C2=A0 =C2=A0 mach64_drm.h
> -
> -
> -diff --git a/include/drm/glamo_drm.h b/include/drm/glamo_drm.h
> -new file mode 100644
> -index 0000000..7629ebc
> ---- /dev/null
> -+++ b/include/drm/glamo_drm.h
> -@@ -0,0 +1,153 @@
> -+/* glamo_drm.h -- Public header for the Glamo driver
> -+ *
> -+ * Copyright 2009 Thomas White
> -+ * Copyright 2000 Precision Insight, Inc., Cedar Park, Texas.
> -+ * Copyright 2000 VA Linux Systems, Inc., Fremont, California.
> -+ * Copyright 2002 Tungsten Graphics, Inc., Cedar Park, Texas.
> -+ * All rights reserved.
> -+ *
> -+ * Permission is hereby granted, free of charge, to any person obtainin=
g a
> -+ * copy of this software and associated documentation files (the "Softw=
are"),
> -+ * to deal in the Software without restriction, including without limit=
ation
> -+ * the rights to use, copy, modify, merge, publish, distribute, sublice=
nse,
> -+ * and/or sell copies of the Software, and to permit persons to whom th=
e
> -+ * Software is furnished to do so, subject to the following conditions:
> -+ *
> -+ * The above copyright notice and this permission notice (including the=
 next
> -+ * paragraph) shall be included in all copies or substantial portions o=
f the
> -+ * Software.
> -+ *
> -+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPR=
ESS OR
> -+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABIL=
ITY,
> -+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. =C2=A0IN NO EV=
ENT SHALL
> -+ * PRECISION INSIGHT AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMA=
GES OR
> -+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE=
,
> -+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE O=
R OTHER
> -+ * DEALINGS IN THE SOFTWARE.
> -+ *
> -+ * Authors:
> -+ * =C2=A0 =C2=A0Thomas White <taw@bitwiz.org.uk>
> -+ * =C2=A0 =C2=A0Kevin E. Martin <martin@valinux.com>
> -+ * =C2=A0 =C2=A0Gareth Hughes <gareth@valinux.com>
> -+ * =C2=A0 =C2=A0Keith Whitwell <keith@tungstengraphics.com>
> -+ */
> -+
> -+#ifndef __GLAMO_DRM_H__
> -+#define __GLAMO_DRM_H__
> -+
> -+#include "drm.h"
> -+
> -+#define GLAMO_GEM_DOMAIN_VRAM (0x1)
> -+
> -+/* Glamo specific ioctls */
> -+#define DRM_GLAMO_CMDBUF =C2=A0 =C2=A0 0x01
> -+#define DRM_GLAMO_SWAP =C2=A0 =C2=A0 =C2=A0 0x02
> -+#define DRM_GLAMO_CMDBURST =C2=A0 0x03
> -+
> -+#define DRM_GLAMO_GEM_INFO =C2=A0 =C2=A0 0x1c
> -+#define DRM_GLAMO_GEM_CREATE =C2=A0 0x1d
> -+#define DRM_GLAMO_GEM_MMAP =C2=A0 =C2=A0 0x1e
> -+#define DRM_GLAMO_GEM_PIN =C2=A0 =C2=A0 =C2=A00x1f
> -+#define DRM_GLAMO_GEM_UNPIN =C2=A0 =C2=A00x20
> -+#define DRM_GLAMO_GEM_PREAD =C2=A0 =C2=A00x21
> -+#define DRM_GLAMO_GEM_PWRITE =C2=A0 0x22
> -+#define DRM_GLAMO_GEM_WAIT_RENDERING 0x24
> -+
> -+#define DRM_IOCTL_GLAMO_CMDBUF =C2=A0 =C2=A0 DRM_IOW(DRM_COMMAND_BASE +=
 DRM_GLAMO_CMDBUF, drm_glamo_cmd_buffer_t)
> -+#define DRM_IOCTL_GLAMO_SWAP =C2=A0 =C2=A0 =C2=A0 DRM_IO(DRM_COMMAND_BA=
SE + DRM_GLAMO_SWAP)
> -+#define DRM_IOCTL_GLAMO_CMDBURST =C2=A0 =C2=A0 DRM_IOW(DRM_COMMAND_BASE=
 + DRM_GLAMO_CMDBURST, drm_glamo_cmd_burst_t)
> -+
> -+#define DRM_IOCTL_GLAMO_GEM_INFO =C2=A0 DRM_IOWR(DRM_COMMAND_BASE + DRM=
_GLAMO_GEM_INFO, struct drm_glamo_gem_info)
> -+#define DRM_IOCTL_GLAMO_GEM_CREATE DRM_IOWR(DRM_COMMAND_BASE + DRM_GLAM=
O_GEM_CREATE, struct drm_glamo_gem_create)
> -+#define DRM_IOCTL_GLAMO_GEM_MMAP =C2=A0 DRM_IOWR(DRM_COMMAND_BASE + DRM=
_GLAMO_GEM_MMAP, struct drm_glamo_gem_mmap)
> -+#define DRM_IOCTL_GLAMO_GEM_PIN =C2=A0 =C2=A0DRM_IOWR(DRM_COMMAND_BASE =
+ DRM_GLAMO_GEM_PIN, struct drm_glamo_gem_pin)
> -+#define DRM_IOCTL_GLAMO_GEM_UNPIN =C2=A0DRM_IOWR(DRM_COMMAND_BASE + DRM=
_GLAMO_GEM_UNPIN, struct drm_glamo_gem_unpin)
> -+#define DRM_IOCTL_GLAMO_GEM_PREAD =C2=A0DRM_IOWR(DRM_COMMAND_BASE + DRM=
_GLAMO_GEM_PREAD, struct drm_glamo_gem_pread)
> -+#define DRM_IOCTL_GLAMO_GEM_PWRITE DRM_IOWR(DRM_COMMAND_BASE + DRM_GLAM=
O_GEM_PWRITE, struct drm_glamo_gem_pwrite)
> -+#define DRM_IOCTL_GLAMO_GEM_WAIT_RENDERING DRM_IOW(DRM_COMMAND_BASE + D=
RM_GLAMO_GEM_WAIT_RENDERING, struct drm_glamo_gem_wait_rendering)
> -+
> -+
> -+/* Simple command submission - a list of 16-bit address-data pairs */
> -+typedef struct drm_glamo_cmd_buffer {
> -+ =C2=A0 =C2=A0 =C2=A0unsigned int bufsz; =C2=A0 =C2=A0 /* Size of buffe=
r, in bytes */
> -+ =C2=A0 =C2=A0 =C2=A0char *buf; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/* Buffer of stuff to go onto the ring buffer */
> -+ =C2=A0 =C2=A0 =C2=A0unsigned int *obj_pos; =C2=A0/* Offsets (in bytes)=
 at which to put objs */
> -+ =C2=A0 =C2=A0 =C2=A0uint32_t *objs; =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Lis=
t of buffer object (handles) to use */
> -+ =C2=A0 =C2=A0 =C2=A0unsigned int nobjs; =C2=A0 =C2=A0 /* Number of obj=
ects referenced */
> -+ =C2=A0 =C2=A0 =C2=A0int nbox;
> -+ =C2=A0 =C2=A0 =C2=A0struct drm_clip_rect *boxes;
> -+} drm_glamo_cmd_buffer_t;
> -+
> -+
> -+/* Burst command submission - base address and data:
> -+ * =C2=A0- Data can be 32-bit (more easily)
> -+ * =C2=A0- Easier for the kernel to validate */
> -+typedef struct drm_glamo_cmd_burst {
> -+ =C2=A0 =C2=A0 =C2=A0uint16_t base; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/=
* Base address (command) */
> -+ =C2=A0 =C2=A0 =C2=A0int bufsz; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/* Size of data, in bytes */
> -+ =C2=A0 =C2=A0 =C2=A0uint16_t *data; =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Poi=
nter to data */
> -+ =C2=A0 =C2=A0 =C2=A0unsigned int *obj_pos; =C2=A0/* Offsets (in bytes)=
 at which to put objs */
> -+ =C2=A0 =C2=A0 =C2=A0uint32_t *objs; =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Lis=
t of buffer object (handles) to use */
> -+ =C2=A0 =C2=A0 =C2=A0unsigned int nobjs; =C2=A0 =C2=A0 /* Number of obj=
ects referenced */
> -+} drm_glamo_cmd_burst_t;
> -+
> -+struct drm_glamo_gem_info {
> -+ =C2=A0 =C2=A0 =C2=A0uint64_t vram_start;
> -+ =C2=A0 =C2=A0 =C2=A0uint64_t vram_size;
> -+};
> -+
> -+struct drm_glamo_gem_create {
> -+ =C2=A0 =C2=A0 =C2=A0uint64_t size;
> -+ =C2=A0 =C2=A0 =C2=A0uint64_t alignment;
> -+ =C2=A0 =C2=A0 =C2=A0uint32_t handle;
> -+ =C2=A0 =C2=A0 =C2=A0uint32_t initial_domain; // to allow VRAM to be cr=
eated
> -+ =C2=A0 =C2=A0 =C2=A0uint32_t no_backing_store;
> -+};
> -+
> -+struct drm_glamo_gem_mmap {
> -+ =C2=A0 =C2=A0 =C2=A0uint32_t handle; =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Han=
dle goes in... */
> -+ =C2=A0 =C2=A0 =C2=A0uint64_t offset; =C2=A0 =C2=A0 =C2=A0 =C2=A0/* ...=
offset comes out */
> -+};
> -+
> -+struct drm_glamo_gem_wait_rendering {
> -+ =C2=A0 =C2=A0 =C2=A0uint32_t handle;
> -+ =C2=A0 =C2=A0 =C2=A0int have_handle;
> -+};
> -+
> -+struct drm_glamo_gem_pin {
> -+ =C2=A0 =C2=A0 =C2=A0uint32_t handle;
> -+ =C2=A0 =C2=A0 =C2=A0uint32_t pin_domain;
> -+ =C2=A0 =C2=A0 =C2=A0uint64_t alignment;
> -+ =C2=A0 =C2=A0 =C2=A0uint64_t offset;
> -+};
> -+
> -+struct drm_glamo_gem_unpin {
> -+ =C2=A0 =C2=A0 =C2=A0uint32_t handle;
> -+ =C2=A0 =C2=A0 =C2=A0uint32_t pad;
> -+};
> -+
> -+struct drm_glamo_gem_pread {
> -+ =C2=A0 =C2=A0 =C2=A0/** Handle for the object being read. */
> -+ =C2=A0 =C2=A0 =C2=A0uint32_t handle;
> -+ =C2=A0 =C2=A0 =C2=A0uint32_t pad;
> -+ =C2=A0 =C2=A0 =C2=A0/** Offset into the object to read from */
> -+ =C2=A0 =C2=A0 =C2=A0uint64_t offset;
> -+ =C2=A0 =C2=A0 =C2=A0/** Length of data to read */
> -+ =C2=A0 =C2=A0 =C2=A0uint64_t size;
> -+ =C2=A0 =C2=A0 =C2=A0/** Pointer to write the data into. */
> -+ =C2=A0 =C2=A0 =C2=A0uint64_t data_ptr; =C2=A0 =C2=A0 =C2=A0/* void *, =
but pointers are not 32/64 compatible */
> -+};
> -+
> -+struct drm_glamo_gem_pwrite {
> -+ =C2=A0 =C2=A0 =C2=A0/** Handle for the object being written to. */
> -+ =C2=A0 =C2=A0 =C2=A0uint32_t handle;
> -+ =C2=A0 =C2=A0 =C2=A0uint32_t pad;
> -+ =C2=A0 =C2=A0 =C2=A0/** Offset into the object to write to */
> -+ =C2=A0 =C2=A0 =C2=A0uint64_t offset;
> -+ =C2=A0 =C2=A0 =C2=A0/** Length of data to write */
> -+ =C2=A0 =C2=A0 =C2=A0uint64_t size;
> -+ =C2=A0 =C2=A0 =C2=A0/** Pointer to read the data from. */
> -+ =C2=A0 =C2=A0 =C2=A0uint64_t data_ptr; =C2=A0 =C2=A0 =C2=A0/* void *, =
but pointers are not 32/64 compatible */
> -+};
> -+
> -+#endif
> diff --git a/recipes/dri/libdrm.inc b/recipes/dri/libdrm.inc
> index 9772e5c..b8015ca 100644
> --- a/recipes/dri/libdrm.inc
> +++ b/recipes/dri/libdrm.inc
> @@ -2,14 +2,19 @@ SECTION =3D "x11/base"
> =C2=A0LICENSE =3D "MIT"
> =C2=A0SRC_URI =3D "http://dri.freedesktop.org/libdrm/libdrm-${PV}.tar.bz2=
"
> =C2=A0PROVIDES =3D "drm"
> +DEPENDS =3D "libpthread-stubs"
>
> =C2=A0INC_PR =3D "r6"
> =C2=A0PE =3D "1"
>
> =C2=A0inherit autotools pkgconfig
>
> -PACKAGES =3D+ "${PN}-drivers ${PN}-kms"
> +PACKAGES =3D+ "${PN}-drivers ${PN}-kms ${@base_contains('MACHINE_FEATURE=
S', 'x86', '${PN}-intel', '',d)}"
> =C2=A0FILES_${PN}-drivers =3D "${libdir}/libdrm_*.so.*"
> +FILES_${PN}-intel =3D "${libdir}/libdrm_intel.so.*"
> =C2=A0FILES_${PN}-kms =3D "${libdir}/libkms*.so.*"
>
> +EXTRA_OECONF_append =3D " ${@base_contains('MACHINE_FEATURES', 'x86', ''=
, '--disable-intel --disable-radeon',d)}"
> +EXTRA_OECONF_append_shr =3D " --enable-glamo-experimental-api"
> +
> =C2=A0LEAD_SONAME =3D "libdrm.so"
> diff --git a/recipes/dri/libdrm_2.3.0.bb b/recipes/dri/libdrm_2.3.0.bb
> deleted file mode 100644
> index 1d7046b..0000000
> --- a/recipes/dri/libdrm_2.3.0.bb
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -require libdrm.inc
> -
> -PR =3D "${INC_PR}.0"
> -
> -SRC_URI[md5sum] =3D "01a1e1ee0268a2403db42fa630036ab2"
> -SRC_URI[sha256sum] =3D "f8c711427fea50845811360c92f6350ff3dacb9533741470=
d54ae5d0a2f6848e"
> diff --git a/recipes/dri/libdrm_2.3.1.bb b/recipes/dri/libdrm_2.3.1.bb
> deleted file mode 100644
> index dc0e91e..0000000
> --- a/recipes/dri/libdrm_2.3.1.bb
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -require libdrm.inc
> -
> -PR =3D "${INC_PR}.0"
> -
> -SRC_URI[md5sum] =3D "620fe7dd02c3236c3e9881a3a238173d"
> -SRC_URI[sha256sum] =3D "ddfd398383729707846e1f1689e9acb3bc672e4f255a632c=
8f0d0c55ddf8718c"
> diff --git a/recipes/dri/libdrm_2.4.11.bb b/recipes/dri/libdrm_2.4.11.bb
> deleted file mode 100644
> index e49d6a2..0000000
> --- a/recipes/dri/libdrm_2.4.11.bb
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -require libdrm.inc
> -
> -PR =3D "${INC_PR}.0"
> -
> -PACKAGES =3D+ "${PN}-intel"
> -
> -FILES_${PN}-intel =3D "${libdir}/libdrm_intel.so.*"
> -
> -SRC_URI[md5sum] =3D "e0e66fae165d0b665b61e9516bf33ade"
> -SRC_URI[sha256sum] =3D "5e07ec4b644f50160900d4281a74dd1cbf1535cfe4ab24e0=
c28ae5b038836a8c"
> diff --git a/recipes/dri/libdrm_2.4.17.bb b/recipes/dri/libdrm_2.4.17.bb
> deleted file mode 100644
> index 902db02..0000000
> --- a/recipes/dri/libdrm_2.4.17.bb
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -require libdrm.inc
> -
> -PR =3D "${INC_PR}.0"
> -
> -EXTRA_OECONF_append =3D " ${@base_contains('MACHINE_FEATURES', 'x86', ''=
, '--disable-intel',d)}"
> -
> -PACKAGES =3D+ "${@base_contains('MACHINE_FEATURES', 'x86', '${PN}-intel'=
, '',d)}"
> -
> -FILES_${PN}-intel =3D "${libdir}/libdrm_intel.so.*"
> -
> -SRC_URI[md5sum] =3D "667d81f993f7fd8a1b1b1b830a28a748"
> -SRC_URI[sha256sum] =3D "b8a4e7c610b0e970546d791c06e28882857a49d34698633a=
89292d7ae142316a"
> diff --git a/recipes/dri/libdrm_2.4.18.bb b/recipes/dri/libdrm_2.4.18.bb
> deleted file mode 100644
> index 27c82c2..0000000
> --- a/recipes/dri/libdrm_2.4.18.bb
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -require libdrm.inc
> -
> -DEPENDS =3D "libpthread-stubs"
> -
> -PR =3D "${INC_PR}.0"
> -
> -SRC_URI[md5sum] =3D "d2b5fbfd37742af7d2169f7d26ce3007"
> -SRC_URI[sha256sum] =3D "f6c5b44fff5cb602096cc48a1bced426496bc8060463c577=
a7d86f2e56eeb604"
> -
> -
> -EXTRA_OECONF_append =3D " ${@base_contains('MACHINE_FEATURES', 'x86', ''=
, '--disable-intel',d)}"
> -
> -PACKAGES =3D+ "${@base_contains('MACHINE_FEATURES', 'x86', '${PN}-intel'=
, '',d)}"
> -
> -FILES_${PN}-intel =3D "${libdir}/libdrm_intel.so.*"
> diff --git a/recipes/dri/libdrm_2.4.21.bb b/recipes/dri/libdrm_2.4.21.bb
> deleted file mode 100644
> index 5102933..0000000
> --- a/recipes/dri/libdrm_2.4.21.bb
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -require libdrm.inc
> -
> -DEPENDS =3D "libpthread-stubs"
> -
> -PR =3D "${INC_PR}.1"
> -
> -SRC_URI +=3D "file://glamo.patch"
> -
> -SRC_URI[md5sum] =3D "273ed9dad986e3a931649f3d8762ff74"
> -SRC_URI[sha256sum] =3D "4e1b612ba3b6b1deae4a8c14946099283e7a00e48a5ab002=
eaf4312f5a8ba14b"
> -
> -EXTRA_OECONF_append =3D " ${@base_contains('MACHINE_FEATURES', 'x86', ''=
, '--disable-intel',d)}"
> -EXTRA_OECONF_append_shr =3D " --enable-glamo-experimental-api --disable-=
radeon --disable-intel"
> -
> -EXTRA_OECONF_append_angstrom =3D " --disable-radeon "
> -
> -PACKAGES =3D+ "${@base_contains('MACHINE_FEATURES', 'x86', '${PN}-intel'=
, '',d)}"
> -
> -FILES_${PN}-intel =3D "${libdir}/libdrm_intel.so.*"
> diff --git a/recipes/dri/libdrm_2.4.22.bb b/recipes/dri/libdrm_2.4.22.bb
> deleted file mode 100644
> index fb94e4c..0000000
> --- a/recipes/dri/libdrm_2.4.22.bb
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -require libdrm.inc
> -
> -DEPENDS =3D "libpthread-stubs"
> -
> -PR =3D "${INC_PR}.0"
> -
> -SRC_URI +=3D "file://glamo.patch"
> -
> -SRC_URI[md5sum] =3D "3bdfa33f35d1c902e5115cceb5500c83"
> -SRC_URI[sha256sum] =3D "0bb0e594e4094d9000d80f38e96e8f640b6364f96cfef5b9=
70cf4481443c6b3d"
> -
> -EXTRA_OECONF_append =3D " ${@base_contains('MACHINE_FEATURES', 'x86', ''=
, '--disable-intel',d)}"
> -EXTRA_OECONF_append_shr =3D " --enable-glamo-experimental-api --disable-=
radeon --disable-intel"
> -
> -EXTRA_OECONF_append_angstrom =3D " --disable-radeon "
> -
> -PACKAGES =3D+ "${@base_contains('MACHINE_FEATURES', 'x86', '${PN}-intel'=
, '',d)}"
> -
> -FILES_${PN}-intel =3D "${libdir}/libdrm_intel.so.*"
> -
> -do_compile_prepend_libc-uclibc() {
> - =C2=A0 =C2=A0 =C2=A0 eval "${@base_contains('DISTRO_FEATURES', 'largefi=
le', '', 'sed -i -e "/_FILE_OFFSET_BITS/d" ${S}/libkms/intel.c', d)}"
> - =C2=A0 =C2=A0 =C2=A0 eval "${@base_contains('DISTRO_FEATURES', 'largefi=
le', '', 'sed -i -e "/_FILE_OFFSET_BITS/d" ${S}/libkms/vmwgfx.c', d)}"
> - =C2=A0 =C2=A0 =C2=A0 eval "${@base_contains('DISTRO_FEATURES', 'largefi=
le', '', 'sed -i -e "/_FILE_OFFSET_BITS/d" ${S}/libkms/nouveau.c', d)}"
> -}
> diff --git a/recipes/dri/libdrm_2.4.23.bb b/recipes/dri/libdrm_2.4.23.bb
> index 5233256..f4feae5 100644
> --- a/recipes/dri/libdrm_2.4.23.bb
> +++ b/recipes/dri/libdrm_2.4.23.bb
> @@ -1,7 +1,5 @@
> =C2=A0require libdrm.inc
>
> -DEPENDS =3D "libpthread-stubs"
> -
> =C2=A0PR =3D "${INC_PR}.0"
>
> =C2=A0SRC_URI +=3D "file://glamo.patch"
> @@ -9,15 +7,6 @@ SRC_URI +=3D "file://glamo.patch"
> =C2=A0SRC_URI[md5sum] =3D "7577ff36ec364d88fae466d4f7fc5fc6"
> =C2=A0SRC_URI[sha256sum] =3D "c0f06d68c3edba7a1ad937f5481a8c287efd4cd368c=
ee66cd9e678b06a911c18"
>
> -EXTRA_OECONF_append =3D " ${@base_contains('MACHINE_FEATURES', 'x86', ''=
, '--disable-intel',d)}"
> -EXTRA_OECONF_append_shr =3D " --enable-glamo-experimental-api --disable-=
radeon --disable-intel"
> -
> -EXTRA_OECONF_append_angstrom =3D " --disable-radeon "
> -
> -PACKAGES =3D+ "${@base_contains('MACHINE_FEATURES', 'x86', '${PN}-intel'=
, '',d)}"
> -
> -FILES_${PN}-intel =3D "${libdir}/libdrm_intel.so.*"
> -
> =C2=A0do_compile_prepend_libc-uclibc() {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0eval "${@base_contains('DISTRO_FEATURES', 'lar=
gefile', '', 'sed -i -e "/_FILE_OFFSET_BITS/d" ${S}/libkms/intel.c', d)}"
> =C2=A0 =C2=A0 =C2=A0 =C2=A0eval "${@base_contains('DISTRO_FEATURES', 'lar=
gefile', '', 'sed -i -e "/_FILE_OFFSET_BITS/d" ${S}/libkms/vmwgfx.c', d)}"
> --
> 1.7.3.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


