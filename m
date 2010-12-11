Received: from mail-iw0-f169.google.com ([209.85.214.169])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PRVWH-0005u1-63
	for openembedded-devel@lists.openembedded.org;
	Sat, 11 Dec 2010 20:54:19 +0100
Received: by iwn40 with SMTP id 40so1213598iwn.28
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Dec 2010 11:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=xi5BdiLn6dSkTsTx0DbY6EwVQ6bx5cO4NtEXZyjD79M=;
	b=ZQwsFV9aPS81ydjlsorSMidt0oq0IsGjbVONAdjbkpXHVSkPCmvblo6dAUWfpQPwZT
	N39LHl0MLSqeZJMi8szBJUJr+H3KztFww5DEMQ6wWHKjlo33uTd33jJ8rRDkS8KC4UQ3
	V88cT9FuwtGRJ2ftFIcLC1lRZnbMrwKchMgqc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=hXl0tlTZmkIE9yS8fLinXN/6DKWMnLYEizgOiAOoCH62Cax97PK2wwUrp/eP1SGb7b
	+nHQAAwJmXO/Wfo7bB3xspEG3Y3xHfqT/xOR0qPpMIEmXc8X66ZkeXIIw+kWq3vj1igq
	pcvu1BQHDh1Is0LecVNxUgQ8eaeDslxGpK7DA=
MIME-Version: 1.0
Received: by 10.231.206.7 with SMTP id fs7mr652050ibb.82.1292097159787; Sat,
	11 Dec 2010 11:52:39 -0800 (PST)
Received: by 10.231.200.140 with HTTP; Sat, 11 Dec 2010 11:52:39 -0800 (PST)
In-Reply-To: <AANLkTiki6n1zf2aZHUGBU2nCv=jPB8frV6+h_27UWYez@mail.gmail.com>
References: <1292074441-2304-1-git-send-email-Martin.Jansa@gmail.com>
	<AANLkTiki6n1zf2aZHUGBU2nCv=jPB8frV6+h_27UWYez@mail.gmail.com>
Date: Sat, 11 Dec 2010 20:52:39 +0100
Message-ID: <AANLkTikz1Cu_H_GpWmPru02drGSTBcso5u+bZVR4XD5C@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.169
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
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
X-List-Received-Date: Sat, 11 Dec 2010 19:54:19 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/12/11 Khem Raj <raj.khem@gmail.com>:
> On Sat, Dec 11, 2010 at 5:34 AM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
>> * disable radeon for all distributions unless x86 is in MACHINE_FEATURES
>>
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>
> Acked-by: Khem Raj <raj.khem@gmail.com>
Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
>
>> ---
>> =A0recipes/dri/libdrm-2.4.21/glamo.patch | 1095 ------------------------=
---------
>> =A0recipes/dri/libdrm-2.4.22/glamo.patch | 1095 ------------------------=
---------
>> =A0recipes/dri/libdrm.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A07 +-
>> =A0recipes/dri/libdrm_2.3.0.bb =A0 =A0 =A0 =A0 =A0 | =A0 =A06 -
>> =A0recipes/dri/libdrm_2.3.1.bb =A0 =A0 =A0 =A0 =A0 | =A0 =A06 -
>> =A0recipes/dri/libdrm_2.4.11.bb =A0 =A0 =A0 =A0 =A0| =A0 10 -
>> =A0recipes/dri/libdrm_2.4.17.bb =A0 =A0 =A0 =A0 =A0| =A0 12 -
>> =A0recipes/dri/libdrm_2.4.18.bb =A0 =A0 =A0 =A0 =A0| =A0 15 -
>> =A0recipes/dri/libdrm_2.4.21.bb =A0 =A0 =A0 =A0 =A0| =A0 19 -
>> =A0recipes/dri/libdrm_2.4.22.bb =A0 =A0 =A0 =A0 =A0| =A0 25 -
>> =A0recipes/dri/libdrm_2.4.23.bb =A0 =A0 =A0 =A0 =A0| =A0 11 -
>> =A011 files changed, 6 insertions(+), 2295 deletions(-)
>> =A0delete mode 100644 recipes/dri/libdrm-2.4.21/glamo.patch
>> =A0delete mode 100644 recipes/dri/libdrm-2.4.22/glamo.patch
>> =A0delete mode 100644 recipes/dri/libdrm_2.3.0.bb
>> =A0delete mode 100644 recipes/dri/libdrm_2.3.1.bb
>> =A0delete mode 100644 recipes/dri/libdrm_2.4.11.bb
>> =A0delete mode 100644 recipes/dri/libdrm_2.4.17.bb
>> =A0delete mode 100644 recipes/dri/libdrm_2.4.18.bb
>> =A0delete mode 100644 recipes/dri/libdrm_2.4.21.bb
>> =A0delete mode 100644 recipes/dri/libdrm_2.4.22.bb
>>
>> diff --git a/recipes/dri/libdrm-2.4.21/glamo.patch b/recipes/dri/libdrm-=
2.4.21/glamo.patch
>> deleted file mode 100644
>> index b397ded..0000000
>> --- a/recipes/dri/libdrm-2.4.21/glamo.patch
>> +++ /dev/null
>> @@ -1,1095 +0,0 @@
>> -diff --git a/Makefile.am b/Makefile.am
>> -index 25d1747..f384228 100644
>> ---- a/Makefile.am
>> -+++ b/Makefile.am
>> -@@ -41,7 +41,11 @@ if HAVE_RADEON
>> - RADEON_SUBDIR =3D radeon
>> - endif
>> -
>> --SUBDIRS =3D . $(LIBKMS_SUBDIR) $(INTEL_SUBDIR) $(NOUVEAU_SUBDIR) $(RAD=
EON_SUBDIR) tests include
>> -+if HAVE_GLAMO
>> -+GLAMO_SUBDIR =3D glamo
>> -+endif
>> -+
>> -+SUBDIRS =3D . $(LIBKMS_SUBDIR) $(INTEL_SUBDIR) $(NOUVEAU_SUBDIR) $(RAD=
EON_SUBDIR) $(GLAMO_SUBDIR) tests include
>> -
>> - libdrm_la_LTLIBRARIES =3D libdrm.la
>> - libdrm_ladir =3D $(libdir)
>> -diff --git a/configure.ac b/configure.ac
>> -index 62db817..0b2a33e 100644
>> ---- a/configure.ac
>> -+++ b/configure.ac
>> -@@ -73,6 +73,11 @@ AC_ARG_ENABLE(nouveau-experimental-api,
>> - =A0 =A0 =A0 =A0 =A0 =A0 [NOUVEAU=3D$enableval], [NOUVEAU=3Dno])
>> -
>> -
>> -+AC_ARG_ENABLE(glamo-experimental-api,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0AS_HELP_STRING([--enable-glamo-experimental-ap=
i],
>> -+ =A0 =A0 =A0 =A0 =A0 =A0[Enable support for Glamo's KMS API (default: =
disabled)]),
>> -+ =A0 =A0 =A0 =A0 =A0 =A0[GLAMO=3D$enableval], [GLAMO=3Dno])
>> -+
>> - dnl =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>> - dnl check compiler flags
>> - AC_DEFUN([LIBDRM_CC_TRY_FLAG], [
>> -@@ -169,6 +174,11 @@ if test "x$NOUVEAU" =3D xyes; then
>> - =A0 =A0 =A0 AC_DEFINE(HAVE_NOUVEAU, 1, [Have nouveau (nvidia) support]=
)
>> - fi
>> -
>> -+AM_CONDITIONAL(HAVE_GLAMO, [test "x$GLAMO" =3D xyes])
>> -+if test "x$GLAMO" =3D xyes; then
>> -+ =A0 =A0 =A0AC_DEFINE(HAVE_GLAMO, 1, [Have glamo support])
>> -+fi
>> -+
>> - PKG_CHECK_MODULES(CAIRO, cairo, [HAVE_CAIRO=3Dyes], [HAVE_CAIRO=3Dno])
>> - if test "x$HAVE_CAIRO" =3D xyes; then
>> - =A0 =A0 =A0 AC_DEFINE(HAVE_CAIRO, 1, [Have cairo support])
>> -@@ -262,6 +272,8 @@ AC_OUTPUT([
>> - =A0 =A0 =A0 radeon/libdrm_radeon.pc
>> - =A0 =A0 =A0 nouveau/Makefile
>> - =A0 =A0 =A0 nouveau/libdrm_nouveau.pc
>> -+ =A0 =A0 =A0glamo/Makefile
>> -+ =A0 =A0 =A0glamo/libdrm_glamo.pc
>> - =A0 =A0 =A0 tests/Makefile
>> - =A0 =A0 =A0 tests/modeprint/Makefile
>> - =A0 =A0 =A0 tests/modetest/Makefile
>> -diff --git a/glamo/Makefile.am b/glamo/Makefile.am
>> -new file mode 100644
>> -index 0000000..1f17aa3
>> ---- /dev/null
>> -+++ b/glamo/Makefile.am
>> -@@ -0,0 +1,52 @@
>> -+# Copyright (c) 2009 Thomas Whtie <taw@bitwiz.org.uk>
>> -+# Based on libdrm-glamo Copyright =A9 2008 J=E9r=F4me Glisse
>> -+#
>> -+# Permission is hereby granted, free of charge, to any person obtainin=
g a
>> -+# copy of this software and associated documentation files (the "Softw=
are"),
>> -+# to deal in the Software without restriction, including without limit=
ation
>> -+# the rights to use, copy, modify, merge, publish, distribute, sublice=
nse,
>> -+# and/or sell copies of the Software, and to permit persons to whom th=
e
>> -+# Software is furnished to do so, subject to the following conditions:
>> -+#
>> -+# The above copyright notice and this permission notice (including the=
 next
>> -+# paragraph) shall be included in all copies or substantial portions o=
f the
>> -+# Software.
>> -+#
>> -+# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPR=
ESS OR
>> -+# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABIL=
ITY,
>> -+# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. =A0IN NO EVENT=
 SHALL
>> -+# THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR=
 OTHER
>> -+# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARIS=
ING
>> -+# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER =
DEALINGS
>> -+# IN THE SOFTWARE.
>> -+#
>> -+# Authors:
>> -+# =A0 =A0J=E9r=F4me Glisse <glisse@freedesktop.org>
>> -+# =A0 =A0Thomas White <taw@bitwiz.org.uk>
>> -+
>> -+AM_CFLAGS =3D \
>> -+ =A0 =A0 =A0$(WARN_CFLAGS) \
>> -+ =A0 =A0 =A0-I$(top_srcdir) \
>> -+ =A0 =A0 =A0-I$(top_srcdir)/glamo \
>> -+ =A0 =A0 =A0$(PTHREADSTUBS_CFLAGS) \
>> -+ =A0 =A0 =A0-I$(top_srcdir)/include/drm
>> -+
>> -+libdrm_glamo_la_LTLIBRARIES =3D libdrm_glamo.la
>> -+libdrm_glamo_ladir =3D $(libdir)
>> -+libdrm_glamo_la_LDFLAGS =3D -version-number 1:0:0 -no-undefined
>> -+libdrm_glamo_la_LIBADD =3D ../libdrm.la @PTHREADSTUBS_LIBS@
>> -+
>> -+libdrm_glamo_la_SOURCES =3D \
>> -+ =A0 =A0 =A0glamo_bo_gem.c \
>> -+ =A0 =A0 =A0glamo_track.c
>> -+
>> -+libdrm_glamoincludedir =3D ${includedir}/libdrm
>> -+libdrm_glamoinclude_HEADERS =3D \
>> -+ =A0 =A0 =A0glamo_bo.h \
>> -+ =A0 =A0 =A0glamo_bo_gem.h \
>> -+ =A0 =A0 =A0glamo_track.h
>> -+
>> -+pkgconfigdir =3D @pkgconfigdir@
>> -+pkgconfig_DATA =3D libdrm_glamo.pc
>> -+
>> -+EXTRA_DIST =3D libdrm_glamo.pc.in
>> -diff --git a/glamo/glamo_bo.h b/glamo/glamo_bo.h
>> -new file mode 100644
>> -index 0000000..8ef2a18
>> ---- /dev/null
>> -+++ b/glamo/glamo_bo.h
>> -@@ -0,0 +1,183 @@
>> -+/*
>> -+ * Copyright (c) 2009 Thomas White
>> -+ *
>> -+ * Heavily based on radeon_bo.h
>> -+ * Copyright =A9 2008 J=E9r=F4me Glisse
>> -+ * All Rights Reserved.
>> -+ *
>> -+ * Permission is hereby granted, free of charge, to any person obtaini=
ng
>> -+ * a copy of this software and associated documentation files (the
>> -+ * "Software"), to deal in the Software without restriction, including
>> -+ * without limitation the rights to use, copy, modify, merge, publish,
>> -+ * distribute, sub license, and/or sell copies of the Software, and to
>> -+ * permit persons to whom the Software is furnished to do so, subject =
to
>> -+ * the following conditions:
>> -+ *
>> -+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
>> -+ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
>> -+ * OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
>> -+ * NON-INFRINGEMENT. IN NO EVENT SHALL THE COPYRIGHT HOLDERS, AUTHORS
>> -+ * AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
>> -+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
>> -+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
>> -+ * USE OR OTHER DEALINGS IN THE SOFTWARE.
>> -+ *
>> -+ * The above copyright notice and this permission notice (including th=
e
>> -+ * next paragraph) shall be included in all copies or substantial port=
ions
>> -+ * of the Software.
>> -+ */
>> -+/*
>> -+ * Authors:
>> -+ * =A0 =A0 =A0J=E9r=F4me Glisse <glisse@freedesktop.org>
>> -+ * =A0 =A0Thomas White <taw@bitwiz.org.uk>
>> -+ */
>> -+#ifndef GLAMO_BO_H
>> -+#define GLAMO_BO_H
>> -+
>> -+#include <stdio.h>
>> -+#include <stdint.h>
>> -+#include "glamo_track.h"
>> -+
>> -+/* bo object */
>> -+#define GLAMO_BO_FLAGS_MACRO_TILE =A01
>> -+#define GLAMO_BO_FLAGS_MICRO_TILE =A02
>> -+
>> -+struct glamo_bo_manager;
>> -+
>> -+struct glamo_bo {
>> -+ =A0 =A0uint32_t =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0alignment;
>> -+ =A0 =A0uint32_t =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0handle;
>> -+ =A0 =A0uint32_t =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0size;
>> -+ =A0 =A0uint32_t =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0domains;
>> -+ =A0 =A0uint32_t =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0flags;
>> -+ =A0 =A0unsigned =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0cref;
>> -+#ifdef GLAMO_BO_TRACK
>> -+ =A0 =A0struct glamo_track =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*track;
>> -+#endif
>> -+ =A0 =A0struct glamo_bo_manager =A0 *bom;
>> -+ =A0 =A0void =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*virtual;
>> -+ =A0 =A0uint32_t =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0space_accounted;
>> -+};
>> -+
>> -+/* bo functions */
>> -+struct glamo_bo_funcs {
>> -+ =A0 =A0struct glamo_bo *(*bo_open)(struct glamo_bo_manager *bom,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uint3=
2_t handle,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uint3=
2_t size,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uint3=
2_t alignment,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uint3=
2_t domains,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uint3=
2_t flags);
>> -+ =A0 =A0void (*bo_ref)(struct glamo_bo *bo);
>> -+ =A0 =A0struct glamo_bo *(*bo_unref)(struct glamo_bo *bo);
>> -+ =A0 =A0int (*bo_map)(struct glamo_bo *bo, int write);
>> -+ =A0 =A0int (*bo_unmap)(struct glamo_bo *bo);
>> -+ =A0 =A0int (*bo_wait)(struct glamo_bo *bo);
>> -+};
>> -+
>> -+struct glamo_bo_manager {
>> -+ =A0 =A0struct glamo_bo_funcs =A0*funcs;
>> -+ =A0 =A0int =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 fd;
>> -+ =A0 =A0struct glamo_tracker =A0 tracker;
>> -+};
>> -+
>> -+static inline void _glamo_bo_debug(struct glamo_bo *bo,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0const char *op,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0const char *file,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0const char *func,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0int line)
>> -+{
>> -+ =A0 =A0fprintf(stderr, "%s %p 0x%08X 0x%08X 0x%08X [%s %s %d]\n",
>> -+ =A0 =A0 =A0 =A0 =A0 =A0op, (void *)bo, bo->handle, bo->size, bo->cref=
, file, func, line);
>> -+}
>> -+
>> -+static inline struct glamo_bo *_glamo_bo_open(struct glamo_bo_manager =
*bom,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0uint32_t handle,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0uint32_t size,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0uint32_t alignment,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0uint32_t domains,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0uint32_t flags,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0const char *file,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0const char *func,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0int line)
>> -+{
>> -+ =A0 =A0struct glamo_bo *bo;
>> -+
>> -+ =A0 =A0bo =3D bom->funcs->bo_open(bom, handle, size, alignment, domai=
ns, flags);
>> -+#ifdef GLAMO_BO_TRACK
>> -+ =A0 =A0if (bo) {
>> -+ =A0 =A0 =A0 =A0bo->track =3D glamo_tracker_add_track(&bom->tracker, b=
o->handle);
>> -+ =A0 =A0 =A0 =A0glamo_track_add_event(bo->track, file, func, "open", l=
ine);
>> -+ =A0 =A0}
>> -+#endif
>> -+ =A0 =A0return bo;
>> -+}
>> -+
>> -+static inline void _glamo_bo_ref(struct glamo_bo *bo,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0co=
nst char *file,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0co=
nst char *func,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0in=
t line)
>> -+{
>> -+ =A0 =A0bo->cref++;
>> -+#ifdef GLAMO_BO_TRACK
>> -+ =A0 =A0glamo_track_add_event(bo->track, file, func, "ref", line);
>> -+#endif
>> -+ =A0 =A0bo->bom->funcs->bo_ref(bo);
>> -+}
>> -+
>> -+static inline struct glamo_bo *_glamo_bo_unref(struct glamo_bo *bo,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 const char *file,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 const char *func,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 int line)
>> -+{
>> -+ =A0 =A0bo->cref--;
>> -+#ifdef GLAMO_BO_TRACK
>> -+ =A0 =A0glamo_track_add_event(bo->track, file, func, "unref", line);
>> -+ =A0 =A0if (bo->cref <=3D 0) {
>> -+ =A0 =A0 =A0 =A0glamo_tracker_remove_track(&bo->bom->tracker, bo->trac=
k);
>> -+ =A0 =A0 =A0 =A0bo->track =3D NULL;
>> -+ =A0 =A0}
>> -+#endif
>> -+ =A0 =A0return bo->bom->funcs->bo_unref(bo);
>> -+}
>> -+
>> -+static inline int _glamo_bo_map(struct glamo_bo *bo,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 int w=
rite,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 const=
 char *file,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 const=
 char *func,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 int l=
ine)
>> -+{
>> -+ =A0 =A0return bo->bom->funcs->bo_map(bo, write);
>> -+}
>> -+
>> -+static inline int _glamo_bo_unmap(struct glamo_bo *bo,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 c=
onst char *file,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 c=
onst char *func,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 i=
nt line)
>> -+{
>> -+ =A0 =A0return bo->bom->funcs->bo_unmap(bo);
>> -+}
>> -+
>> -+static inline int _glamo_bo_wait(struct glamo_bo *bo,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0co=
nst char *file,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0co=
nst char *func,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0in=
t line)
>> -+{
>> -+ =A0 =A0return bo->bom->funcs->bo_wait(bo);
>> -+}
>> -+
>> -+#define glamo_bo_open(bom, h, s, a, d, f)\
>> -+ =A0 =A0_glamo_bo_open(bom, h, s, a, d, f, __FILE__, __FUNCTION__, __L=
INE__)
>> -+#define glamo_bo_ref(bo)\
>> -+ =A0 =A0_glamo_bo_ref(bo, __FILE__, __FUNCTION__, __LINE__)
>> -+#define glamo_bo_unref(bo)\
>> -+ =A0 =A0_glamo_bo_unref(bo, __FILE__, __FUNCTION__, __LINE__)
>> -+#define glamo_bo_map(bo, w)\
>> -+ =A0 =A0_glamo_bo_map(bo, w, __FILE__, __FUNCTION__, __LINE__)
>> -+#define glamo_bo_unmap(bo)\
>> -+ =A0 =A0_glamo_bo_unmap(bo, __FILE__, __FUNCTION__, __LINE__)
>> -+#define glamo_bo_debug(bo, opcode)\
>> -+ =A0 =A0_glamo_bo_debug(bo, opcode, __FILE__, __FUNCTION__, __LINE__)
>> -+#define glamo_bo_wait(bo) \
>> -+ =A0 =A0_glamo_bo_wait(bo, __FILE__, __func__, __LINE__)
>> -+
>> -+#endif
>> -diff --git a/glamo/glamo_bo_gem.c b/glamo/glamo_bo_gem.c
>> -new file mode 100644
>> -index 0000000..38a4436
>> ---- /dev/null
>> -+++ b/glamo/glamo_bo_gem.c
>> -@@ -0,0 +1,336 @@
>> -+/*
>> -+ * Copyright =A9 2009 Thomas White
>> -+ *
>> -+ * Based on radeon_bo_gem.c, to which the following notice applies:
>> -+ *
>> -+ * Copyright =A9 2008 Dave Airlie
>> -+ * Copyright =A9 2008 J=E9r=F4me Glisse
>> -+ * All Rights Reserved.
>> -+ *
>> -+ * Permission is hereby granted, free of charge, to any person obtaini=
ng
>> -+ * a copy of this software and associated documentation files (the
>> -+ * "Software"), to deal in the Software without restriction, including
>> -+ * without limitation the rights to use, copy, modify, merge, publish,
>> -+ * distribute, sub license, and/or sell copies of the Software, and to
>> -+ * permit persons to whom the Software is furnished to do so, subject =
to
>> -+ * the following conditions:
>> -+ *
>> -+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
>> -+ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
>> -+ * OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
>> -+ * NON-INFRINGEMENT. IN NO EVENT SHALL THE COPYRIGHT HOLDERS, AUTHORS
>> -+ * AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
>> -+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
>> -+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
>> -+ * USE OR OTHER DEALINGS IN THE SOFTWARE.
>> -+ *
>> -+ * The above copyright notice and this permission notice (including th=
e
>> -+ * next paragraph) shall be included in all copies or substantial port=
ions
>> -+ * of the Software.
>> -+ */
>> -+/*
>> -+ * Authors:
>> -+ * =A0 =A0 =A0Dave Airlie
>> -+ * =A0 =A0 =A0J=E9r=F4me Glisse <glisse@freedesktop.org>
>> -+ *
>> -+ *
>> -+ * Memory mapping functions are based on intel_bufmgr_gem.c, to which =
the
>> -+ * following notice applies:
>> -+ *
>> -+ * Copyright =A9 2007 Red Hat Inc.
>> -+ * Copyright =A9 2007 Intel Corporation
>> -+ * Copyright 2006 Tungsten Graphics, Inc., Bismarck, ND., USA
>> -+ * All Rights Reserved.
>> -+ *
>> -+ * Permission is hereby granted, free of charge, to any person obtaini=
ng a
>> -+ * copy of this software and associated documentation files (the
>> -+ * "Software"), to deal in the Software without restriction, including
>> -+ * without limitation the rights to use, copy, modify, merge, publish,
>> -+ * distribute, sub license, and/or sell copies of the Software, and to
>> -+ * permit persons to whom the Software is furnished to do so, subject =
to
>> -+ * the following conditions:
>> -+ *
>> -+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXP=
RESS OR
>> -+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABI=
LITY,
>> -+ * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT =
SHALL
>> -+ * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR A=
NY CLAIM,
>> -+ * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT =
OR
>> -+ * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE =
OR THE
>> -+ * USE OR OTHER DEALINGS IN THE SOFTWARE.
>> -+ *
>> -+ * The above copyright notice and this permission notice (including th=
e
>> -+ * next paragraph) shall be included in all copies or substantial port=
ions
>> -+ * of the Software.
>> -+ *
>> -+ *
>> -+ *********************************************************************=
*****/
>> -+/*
>> -+ * Authors: Thomas Hellstr=F6m <thomas-at-tungstengraphics-dot-com>
>> -+ * =A0 =A0 =A0 =A0 =A0Keith Whitwell <keithw-at-tungstengraphics-dot-c=
om>
>> -+ * =A0 =A0 =A0 =A0Eric Anholt <eric@anholt.net>
>> -+ * =A0 =A0 =A0 =A0Dave Airlie <airlied@linux.ie>
>> -+ */
>> -+
>> -+#ifdef HAVE_CONFIG_H
>> -+#include "config.h"
>> -+#endif
>> -+
>> -+#include <stdio.h>
>> -+#include <stdint.h>
>> -+#include <stdlib.h>
>> -+#include <string.h>
>> -+#include <sys/mman.h>
>> -+#include <sys/ioctl.h>
>> -+#include <errno.h>
>> -+
>> -+#include "xf86drm.h"
>> -+#include "drm.h"
>> -+#include "glamo_drm.h"
>> -+#include "glamo_bo.h"
>> -+#include "glamo_bo_gem.h"
>> -+
>> -+struct glamo_bo_gem {
>> -+ =A0 =A0 =A0struct glamo_bo =A0 base;
>> -+ =A0 =A0 =A0uint32_t =A0 =A0 =A0 =A0 =A0name;
>> -+ =A0 =A0 =A0int =A0 =A0 =A0 =A0 =A0 =A0 =A0 map_count;
>> -+};
>> -+
>> -+struct bo_manager_gem {
>> -+ =A0 =A0 =A0struct glamo_bo_manager =A0 =A0base;
>> -+};
>> -+
>> -+static struct glamo_bo *bo_open(struct glamo_bo_manager *bom,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uint3=
2_t handle,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uint3=
2_t size,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uint3=
2_t alignment,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uint3=
2_t domains,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uint3=
2_t flags)
>> -+{
>> -+ =A0 =A0 =A0struct glamo_bo_gem *bo;
>> -+ =A0 =A0 =A0int r;
>> -+
>> -+ =A0 =A0 =A0bo =3D (struct glamo_bo_gem*)calloc(1, sizeof(struct glamo=
_bo_gem));
>> -+ =A0 =A0 =A0if (bo =3D=3D NULL) {
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0return NULL;
>> -+ =A0 =A0 =A0}
>> -+
>> -+ =A0 =A0 =A0bo->base.bom =3D bom;
>> -+ =A0 =A0 =A0bo->base.handle =3D 0;
>> -+ =A0 =A0 =A0bo->base.size =3D size;
>> -+ =A0 =A0 =A0bo->base.alignment =3D alignment;
>> -+ =A0 =A0 =A0bo->base.domains =3D domains;
>> -+ =A0 =A0 =A0bo->base.flags =3D flags;
>> -+ =A0 =A0 =A0bo->base.cref =3D 0;
>> -+ =A0 =A0 =A0bo->map_count =3D 0;
>> -+ =A0 =A0 =A0bo->base.virtual =3D NULL;
>> -+ =A0 =A0 =A0if (handle) {
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0struct drm_gem_open open_arg;
>> -+
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0memset(&open_arg, 0, sizeof(open_arg));
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0open_arg.name =3D handle;
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0r =3D ioctl(bom->fd, DRM_IOCTL_GEM_OPEN, &=
open_arg);
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0if (r !=3D 0) {
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0free(bo);
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return NULL;
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0}
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0bo->base.handle =3D open_arg.handle;
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0bo->base.size =3D open_arg.size;
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0bo->name =3D handle;
>> -+ =A0 =A0 =A0} else {
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0struct drm_glamo_gem_create args;
>> -+
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0args.size =3D size;
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0args.alignment =3D alignment;
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0args.initial_domain =3D bo->base.domains;
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0args.no_backing_store =3D 0;
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0args.handle =3D 0;
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0r =3D drmCommandWriteRead(bom->fd, DRM_GLA=
MO_GEM_CREATE,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0&args, sizeof(args));
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0bo->base.handle =3D args.handle;
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0if (r) {
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0fprintf(stderr, "Failed to=
 allocate :\n");
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0fprintf(stderr, " =A0 size=
 =A0 =A0 =A0: %d bytes\n", size);
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0fprintf(stderr, " =A0 alig=
nment : %d bytes\n", alignment);
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0free(bo);
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return NULL;
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0}
>> -+ =A0 =A0 =A0}
>> -+ =A0 =A0 =A0glamo_bo_ref((struct glamo_bo*)bo);
>> -+ =A0 =A0 =A0return (struct glamo_bo*)bo;
>> -+}
>> -+
>> -+static void bo_ref(struct glamo_bo *bo)
>> -+{
>> -+}
>> -+
>> -+static struct glamo_bo *bo_unref(struct glamo_bo *bo)
>> -+{
>> -+ =A0 =A0 =A0struct glamo_bo_gem *bo_gem =3D (struct glamo_bo_gem*)bo;
>> -+ =A0 =A0 =A0struct drm_gem_close args;
>> -+
>> -+ =A0 =A0 =A0if (bo =3D=3D NULL) {
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0return NULL;
>> -+ =A0 =A0 =A0}
>> -+ =A0 =A0 =A0if (bo->cref) {
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0return bo;
>> -+ =A0 =A0 =A0}
>> -+ =A0 =A0 =A0if (bo_gem->map_count) {
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0munmap(bo->virtual, bo->size);
>> -+ =A0 =A0 =A0}
>> -+
>> -+ =A0 =A0 =A0/* close object */
>> -+ =A0 =A0 =A0args.handle =3D bo->handle;
>> -+ =A0 =A0 =A0ioctl(bo->bom->fd, DRM_IOCTL_GEM_CLOSE, &args);
>> -+ =A0 =A0 =A0memset(bo_gem, 0, sizeof(struct glamo_bo_gem));
>> -+ =A0 =A0 =A0free(bo_gem);
>> -+ =A0 =A0 =A0return NULL;
>> -+}
>> -+
>> -+static int bo_map(struct glamo_bo *bo, int write)
>> -+{
>> -+ =A0 =A0 =A0struct glamo_bo_gem *bo_gem;
>> -+ =A0 =A0 =A0struct glamo_bo_manager *bufmgr;
>> -+ =A0 =A0 =A0int ret;
>> -+
>> -+ =A0 =A0 =A0bo_gem =3D (struct glamo_bo_gem *)bo;
>> -+ =A0 =A0 =A0bufmgr =3D (struct glamo_bo_manager*)bo->bom;
>> -+
>> -+ =A0 =A0 =A0/* Get a mapping of the buffer if we haven't before. */
>> -+ =A0 =A0 =A0if (bo->virtual =3D=3D NULL) {
>> -+
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0struct drm_glamo_gem_mmap mmap_arg;
>> -+
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0memset(&mmap_arg, 0, sizeof(mmap_arg));
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0mmap_arg.handle =3D bo->handle;
>> -+
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0/* Get the fake offset back... */
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0ret =3D ioctl(bufmgr->fd, DRM_IOCTL_GLAMO_=
GEM_MMAP, &mmap_arg);
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0if (ret !=3D 0) {
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0fprintf(stderr,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"%s:%d: Er=
ror preparing BO map %d (%d): %s .\n",
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0__FILE__, =
__LINE__,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0bo->handle=
, bo_gem->name,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0strerror(e=
rrno));
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return ret;
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0}
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0/* and mmap it */
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0bo->virtual =3D mmap(0, bo->size, PROT_REA=
D | PROT_WRITE,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 MAP_SHARED, bufmgr->fd,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 mmap_arg.offset);
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0if (bo->virtual =3D=3D MAP_FAILED) {
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0fprintf(stderr,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"%s:%d: Er=
ror mapping buffer %d (%d): %s .\n",
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0__FILE__, =
__LINE__,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0bo->handle=
, bo_gem->name,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0strerror(e=
rrno));
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return errno;
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0}
>> -+ =A0 =A0 =A0}
>> -+ =A0 =A0 =A0bo_gem->map_count++;
>> -+
>> -+ =A0 =A0 =A0return 0;
>> -+}
>> -+
>> -+static int bo_unmap(struct glamo_bo *bo)
>> -+{
>> -+ =A0 =A0 =A0struct glamo_bo_gem *bo_gem =3D (struct glamo_bo_gem*)bo;
>> -+
>> -+ =A0 =A0 =A0if ( bo_gem->map_count =3D=3D 0 ) {
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0fprintf(stderr, "Not unmapping %p, because=
 its map count"
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0" is alrea=
dy zero.\n", bo_gem);
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0return 0;
>> -+ =A0 =A0 =A0}
>> -+
>> -+ =A0 =A0 =A0if (--bo_gem->map_count > 0) {
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0return 0;
>> -+ =A0 =A0 =A0}
>> -+ =A0 =A0 =A0munmap(bo->virtual, bo->size);
>> -+ =A0 =A0 =A0bo->virtual =3D NULL;
>> -+ =A0 =A0 =A0return 0;
>> -+}
>> -+
>> -+static int bo_wait(struct glamo_bo *bo)
>> -+{
>> -+ =A0 =A0 =A0struct drm_glamo_gem_wait_rendering args;
>> -+ =A0 =A0 =A0int ret;
>> -+
>> -+ =A0 =A0 =A0args.handle =3D bo->handle;
>> -+ =A0 =A0 =A0args.have_handle =3D 1;
>> -+ =A0 =A0 =A0do {
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0ret =3D drmCommandWriteRead(bo->bom->fd,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0DRM_GLAMO_GEM_WAIT_RENDERING,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0&args, sizeof(args));
>> -+ =A0 =A0 =A0} while (ret =3D=3D -EAGAIN);
>> -+ =A0 =A0 =A0return ret;
>> -+}
>> -+
>> -+static struct glamo_bo_funcs bo_gem_funcs =3D {
>> -+ =A0 =A0 =A0bo_open,
>> -+ =A0 =A0 =A0bo_ref,
>> -+ =A0 =A0 =A0bo_unref,
>> -+ =A0 =A0 =A0bo_map,
>> -+ =A0 =A0 =A0bo_unmap,
>> -+ =A0 =A0 =A0bo_wait
>> -+};
>> -+
>> -+struct glamo_bo_manager *glamo_bo_manager_gem_ctor(int fd)
>> -+{
>> -+ =A0 =A0 =A0struct bo_manager_gem *bomg;
>> -+
>> -+ =A0 =A0 =A0bomg =3D (struct bo_manager_gem*)calloc(1, sizeof(struct b=
o_manager_gem));
>> -+ =A0 =A0 =A0if (bomg =3D=3D NULL) return NULL;
>> -+
>> -+ =A0 =A0 =A0bomg->base.funcs =3D &bo_gem_funcs;
>> -+ =A0 =A0 =A0bomg->base.fd =3D fd;
>> -+ =A0 =A0 =A0return (struct glamo_bo_manager*)bomg;
>> -+}
>> -+
>> -+void glamo_bo_manager_gem_dtor(struct glamo_bo_manager *bom)
>> -+{
>> -+ =A0 =A0 =A0struct bo_manager_gem *bomg =3D (struct bo_manager_gem*)bo=
m;
>> -+
>> -+ =A0 =A0 =A0if (bom =3D=3D NULL) return;
>> -+ =A0 =A0 =A0free(bomg);
>> -+}
>> -+
>> -+uint32_t glamo_gem_get_name(struct glamo_bo *bo)
>> -+{
>> -+ =A0 =A0 =A0struct glamo_bo_gem *bo_gem =3D (struct glamo_bo_gem*)bo;
>> -+ =A0 =A0 =A0return bo_gem->name;
>> -+}
>> -+
>> -+int glamo_gem_name_buffer(struct glamo_bo *bo, uint32_t *name)
>> -+{
>> -+ =A0 =A0 =A0struct drm_gem_flink flink;
>> -+ =A0 =A0 =A0int r;
>> -+
>> -+ =A0 =A0 =A0if ( !bo ) {
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0fprintf(stderr, "No buffer object!\n");
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0return -1;
>> -+ =A0 =A0 =A0}
>> -+
>> -+ =A0 =A0 =A0flink.handle =3D bo->handle;
>> -+ =A0 =A0 =A0r =3D ioctl(bo->bom->fd, DRM_IOCTL_GEM_FLINK, &flink);
>> -+ =A0 =A0 =A0if (r) return r;
>> -+
>> -+ =A0 =A0 =A0*name =3D flink.name;
>> -+ =A0 =A0 =A0return 0;
>> -+}
>> -+
>> -+int glamo_bo_subdata(struct glamo_bo *bo, unsigned long offset,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned long size, const voi=
d *data)
>> -+{
>> -+ =A0 =A0 =A0int ret;
>> -+
>> -+ =A0 =A0 =A0if (size =3D=3D 0 || data =3D=3D NULL)
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0return 0;
>> -+
>> -+ =A0 =A0 =A0ret =3D bo_map(bo, 1);
>> -+ =A0 =A0 =A0if ( ret ) return ret;
>> -+
>> -+ =A0 =A0 =A0memcpy((unsigned char *)bo->virtual + offset, data, size);
>> -+
>> -+ =A0 =A0 =A0bo_unmap(bo);
>> -+
>> -+ =A0 =A0 =A0return 0;
>> -+}
>> -diff --git a/glamo/glamo_bo_gem.h b/glamo/glamo_bo_gem.h
>> -new file mode 100644
>> -index 0000000..05b5fb9
>> ---- /dev/null
>> -+++ b/glamo/glamo_bo_gem.h
>> -@@ -0,0 +1,43 @@
>> -+/*
>> -+ * Copyright =A9 2008 Dave Airlie
>> -+ * Copyright =A9 2008 J=E9r=F4me Glisse
>> -+ * All Rights Reserved.
>> -+ *
>> -+ * Permission is hereby granted, free of charge, to any person obtaini=
ng
>> -+ * a copy of this software and associated documentation files (the
>> -+ * "Software"), to deal in the Software without restriction, including
>> -+ * without limitation the rights to use, copy, modify, merge, publish,
>> -+ * distribute, sub license, and/or sell copies of the Software, and to
>> -+ * permit persons to whom the Software is furnished to do so, subject =
to
>> -+ * the following conditions:
>> -+ *
>> -+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
>> -+ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
>> -+ * OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
>> -+ * NON-INFRINGEMENT. IN NO EVENT SHALL THE COPYRIGHT HOLDERS, AUTHORS
>> -+ * AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
>> -+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
>> -+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
>> -+ * USE OR OTHER DEALINGS IN THE SOFTWARE.
>> -+ *
>> -+ * The above copyright notice and this permission notice (including th=
e
>> -+ * next paragraph) shall be included in all copies or substantial port=
ions
>> -+ * of the Software.
>> -+ */
>> -+/*
>> -+ * Authors:
>> -+ * =A0 =A0 =A0Dave Airlie
>> -+ * =A0 =A0 =A0J=E9r=F4me Glisse <glisse@freedesktop.org>
>> -+ */
>> -+#ifndef GLAMO_BO_GEM_H
>> -+#define GLAMO_BO_GEM_H
>> -+
>> -+#include "glamo_bo.h"
>> -+
>> -+struct glamo_bo_manager *glamo_bo_manager_gem_ctor(int fd);
>> -+void glamo_bo_manager_gem_dtor(struct glamo_bo_manager *bom);
>> -+int glamo_gem_name_buffer(struct glamo_bo *bo, uint32_t *name);
>> -+uint32_t glamo_gem_get_name(struct glamo_bo *bo);
>> -+extern int glamo_bo_subdata(struct glamo_bo *bo, unsigned long offset,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unsigned long =
size, const void *data);
>> -+#endif
>> -diff --git a/glamo/glamo_track.c b/glamo/glamo_track.c
>> -new file mode 100644
>> -index 0000000..27ffe41
>> ---- /dev/null
>> -+++ b/glamo/glamo_track.c
>> -@@ -0,0 +1,140 @@
>> -+/*
>> -+ * Copyright =A9 2008 J=E9r=F4me Glisse
>> -+ * All Rights Reserved.
>> -+ *
>> -+ * Permission is hereby granted, free of charge, to any person obtaini=
ng
>> -+ * a copy of this software and associated documentation files (the
>> -+ * "Software"), to deal in the Software without restriction, including
>> -+ * without limitation the rights to use, copy, modify, merge, publish,
>> -+ * distribute, sub license, and/or sell copies of the Software, and to
>> -+ * permit persons to whom the Software is furnished to do so, subject =
to
>> -+ * the following conditions:
>> -+ *
>> -+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
>> -+ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
>> -+ * OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
>> -+ * NON-INFRINGEMENT. IN NO EVENT SHALL THE COPYRIGHT HOLDERS, AUTHORS
>> -+ * AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
>> -+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
>> -+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
>> -+ * USE OR OTHER DEALINGS IN THE SOFTWARE.
>> -+ *
>> -+ * The above copyright notice and this permission notice (including th=
e
>> -+ * next paragraph) shall be included in all copies or substantial port=
ions
>> -+ * of the Software.
>> -+ */
>> -+/*
>> -+ * Authors:
>> -+ * =A0 =A0 =A0J=E9r=F4me Glisse <glisse@freedesktop.org>
>> -+ */
>> -+#include <stdio.h>
>> -+#include <stdlib.h>
>> -+#include <string.h>
>> -+#include "glamo_track.h"
>> -+
>> -+void glamo_track_add_event(struct glamo_track *track,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0const char *fi=
le,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0const char *fu=
nc,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0const char *op=
,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unsigned line)
>> -+{
>> -+ =A0 =A0struct glamo_track_event *event;
>> -+
>> -+ =A0 =A0if (track =3D=3D NULL) {
>> -+ =A0 =A0 =A0 =A0return;
>> -+ =A0 =A0}
>> -+ =A0 =A0event =3D (void*)calloc(1,sizeof(struct glamo_track_event));
>> -+ =A0 =A0if (event =3D=3D NULL) {
>> -+ =A0 =A0 =A0 =A0return;
>> -+ =A0 =A0}
>> -+ =A0 =A0event->line =3D line;
>> -+ =A0 =A0event->file =3D strdup(file);
>> -+ =A0 =A0event->func =3D strdup(func);
>> -+ =A0 =A0event->op =3D strdup(op);
>> -+ =A0 =A0if (event->file =3D=3D NULL || event->func =3D=3D NULL || even=
t->op =3D=3D NULL) {
>> -+ =A0 =A0 =A0 =A0free(event->file);
>> -+ =A0 =A0 =A0 =A0free(event->func);
>> -+ =A0 =A0 =A0 =A0free(event->op);
>> -+ =A0 =A0 =A0 =A0free(event);
>> -+ =A0 =A0 =A0 =A0return;
>> -+ =A0 =A0}
>> -+ =A0 =A0event->next =3D track->events;
>> -+ =A0 =A0track->events =3D event;
>> -+}
>> -+
>> -+struct glamo_track *glamo_tracker_add_track(struct glamo_tracker *trac=
ker,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0unsigned key)
>> -+{
>> -+ =A0 =A0struct glamo_track *track;
>> -+
>> -+ =A0 =A0track =3D (struct glamo_track*)calloc(1, sizeof(struct glamo_t=
rack));
>> -+ =A0 =A0if (track) {
>> -+ =A0 =A0 =A0 =A0track->next =3D tracker->tracks.next;
>> -+ =A0 =A0 =A0 =A0track->prev =3D &tracker->tracks;
>> -+ =A0 =A0 =A0 =A0tracker->tracks.next =3D track;
>> -+ =A0 =A0 =A0 =A0if (track->next) {
>> -+ =A0 =A0 =A0 =A0 =A0 =A0track->next->prev =3D track;
>> -+ =A0 =A0 =A0 =A0}
>> -+ =A0 =A0 =A0 =A0track->key =3D key;
>> -+ =A0 =A0 =A0 =A0track->events =3D NULL;
>> -+ =A0 =A0}
>> -+ =A0 =A0return track;
>> -+}
>> -+
>> -+void glamo_tracker_remove_track(struct glamo_tracker *tracker,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struc=
t glamo_track *track)
>> -+{
>> -+ =A0 =A0struct glamo_track_event *event;
>> -+ =A0 =A0void *tmp;
>> -+
>> -+ =A0 =A0if (track =3D=3D NULL) {
>> -+ =A0 =A0 =A0 =A0return;
>> -+ =A0 =A0}
>> -+ =A0 =A0track->prev->next =3D track->next;
>> -+ =A0 =A0if (track->next) {
>> -+ =A0 =A0 =A0 =A0track->next->prev =3D track->prev;
>> -+ =A0 =A0}
>> -+ =A0 =A0track->next =3D track->prev =3D NULL;
>> -+ =A0 =A0event =3D track->events;
>> -+ =A0 =A0while (event) {
>> -+ =A0 =A0 =A0 =A0tmp =3D event;
>> -+ =A0 =A0 =A0 =A0free(event->file);
>> -+ =A0 =A0 =A0 =A0free(event->func);
>> -+ =A0 =A0 =A0 =A0free(event->op);
>> -+ =A0 =A0 =A0 =A0event =3D event->next;
>> -+ =A0 =A0 =A0 =A0free(tmp);
>> -+ =A0 =A0}
>> -+ =A0 =A0track->events =3D NULL;
>> -+ =A0 =A0free(track);
>> -+}
>> -+
>> -+void glamo_tracker_print(struct glamo_tracker *tracker, FILE *file)
>> -+{
>> -+ =A0 =A0struct glamo_track *track;
>> -+ =A0 =A0struct glamo_track_event *event;
>> -+ =A0 =A0void *tmp;
>> -+
>> -+ =A0 =A0track =3D tracker->tracks.next;
>> -+ =A0 =A0while (track) {
>> -+ =A0 =A0 =A0 =A0event =3D track->events;
>> -+ =A0 =A0 =A0 =A0fprintf(file, "[0x%08X] :\n", track->key);
>> -+ =A0 =A0 =A0 =A0while (event) {
>> -+ =A0 =A0 =A0 =A0 =A0 =A0tmp =3D event;
>> -+ =A0 =A0 =A0 =A0 =A0 =A0fprintf(file, " =A0[0x%08X:%s](%s:%s:%d)\n",
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0track->key, event->op, =A0even=
t->file,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0event->func, event->line);
>> -+ =A0 =A0 =A0 =A0 =A0 =A0free(event->file);
>> -+ =A0 =A0 =A0 =A0 =A0 =A0free(event->func);
>> -+ =A0 =A0 =A0 =A0 =A0 =A0free(event->op);
>> -+ =A0 =A0 =A0 =A0 =A0 =A0event->file =3D NULL;
>> -+ =A0 =A0 =A0 =A0 =A0 =A0event->func =3D NULL;
>> -+ =A0 =A0 =A0 =A0 =A0 =A0event->op =3D NULL;
>> -+ =A0 =A0 =A0 =A0 =A0 =A0event =3D event->next;
>> -+ =A0 =A0 =A0 =A0 =A0 =A0free(tmp);
>> -+ =A0 =A0 =A0 =A0}
>> -+ =A0 =A0 =A0 =A0track->events =3D NULL;
>> -+ =A0 =A0 =A0 =A0tmp =3D track;
>> -+ =A0 =A0 =A0 =A0track =3D track->next;
>> -+ =A0 =A0 =A0 =A0free(tmp);
>> -+ =A0 =A0}
>> -+}
>> -diff --git a/glamo/glamo_track.h b/glamo/glamo_track.h
>> -new file mode 100644
>> -index 0000000..fedead7
>> ---- /dev/null
>> -+++ b/glamo/glamo_track.h
>> -@@ -0,0 +1,64 @@
>> -+/*
>> -+ * Copyright =A9 2008 J=E9r=F4me Glisse
>> -+ * All Rights Reserved.
>> -+ *
>> -+ * Permission is hereby granted, free of charge, to any person obtaini=
ng
>> -+ * a copy of this software and associated documentation files (the
>> -+ * "Software"), to deal in the Software without restriction, including
>> -+ * without limitation the rights to use, copy, modify, merge, publish,
>> -+ * distribute, sub license, and/or sell copies of the Software, and to
>> -+ * permit persons to whom the Software is furnished to do so, subject =
to
>> -+ * the following conditions:
>> -+ *
>> -+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
>> -+ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
>> -+ * OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
>> -+ * NON-INFRINGEMENT. IN NO EVENT SHALL THE COPYRIGHT HOLDERS, AUTHORS
>> -+ * AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
>> -+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
>> -+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
>> -+ * USE OR OTHER DEALINGS IN THE SOFTWARE.
>> -+ *
>> -+ * The above copyright notice and this permission notice (including th=
e
>> -+ * next paragraph) shall be included in all copies or substantial port=
ions
>> -+ * of the Software.
>> -+ */
>> -+/*
>> -+ * Authors:
>> -+ * =A0 =A0 =A0J=E9r=F4me Glisse <glisse@freedesktop.org>
>> -+ */
>> -+#ifndef GLAMO_TRACK_H
>> -+#define GLAMO_TRACK_H
>> -+
>> -+struct glamo_track_event {
>> -+ =A0 =A0struct glamo_track_event =A0 *next;
>> -+ =A0 =A0char =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*file;
>> -+ =A0 =A0char =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*func;
>> -+ =A0 =A0char =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*op;
>> -+ =A0 =A0unsigned =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0line;
>> -+};
>> -+
>> -+struct glamo_track {
>> -+ =A0 =A0struct glamo_track =A0 =A0 =A0 =A0 *next;
>> -+ =A0 =A0struct glamo_track =A0 =A0 =A0 =A0 *prev;
>> -+ =A0 =A0unsigned =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0key;
>> -+ =A0 =A0struct glamo_track_event =A0 *events;
>> -+};
>> -+
>> -+struct glamo_tracker {
>> -+ =A0 =A0struct glamo_track =A0 =A0 =A0 =A0 tracks;
>> -+};
>> -+
>> -+void glamo_track_add_event(struct glamo_track *track,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0const char *fi=
le,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0const char *fu=
nc,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0const char *op=
,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unsigned line)=
;
>> -+struct glamo_track *glamo_tracker_add_track(struct glamo_tracker *trac=
ker,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0unsigned key);
>> -+void glamo_tracker_remove_track(struct glamo_tracker *tracker,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struc=
t glamo_track *track);
>> -+void glamo_tracker_print(struct glamo_tracker *tracker,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0FILE *file);
>> -+
>> -+#endif
>> -diff --git a/glamo/libdrm_glamo.pc.in b/glamo/libdrm_glamo.pc.in
>> -new file mode 100644
>> -index 0000000..d4d8e70
>> ---- /dev/null
>> -+++ b/glamo/libdrm_glamo.pc.in
>> -@@ -0,0 +1,10 @@
>> -+prefix=3D@prefix@
>> -+exec_prefix=3D@exec_prefix@
>> -+libdir=3D@libdir@
>> -+includedir=3D@includedir@
>> -+
>> -+Name: libdrm_glamo
>> -+Description: Userspace interface to kernel DRM services for Glamo
>> -+Version: 1.0.1
>> -+Libs: -L${libdir} -ldrm_glamo
>> -+Cflags: -I${includedir} -I${includedir}/libdrm
>> -diff --git a/include/drm/Makefile.am b/include/drm/Makefile.am
>> -index 43695bd..f3f7edf 100644
>> ---- a/include/drm/Makefile.am
>> -+++ b/include/drm/Makefile.am
>> -@@ -35,6 +35,7 @@ klibdrminclude_HEADERS =3D \
>> - =A0 =A0 =A0 savage_drm.h \
>> - =A0 =A0 =A0 sis_drm.h \
>> - =A0 =A0 =A0 via_drm.h \
>> -+ =A0 =A0 =A0glamo_drm.h \
>> - =A0 =A0 =A0 mach64_drm.h
>> -
>> -
>> -diff --git a/include/drm/glamo_drm.h b/include/drm/glamo_drm.h
>> -new file mode 100644
>> -index 0000000..7629ebc
>> ---- /dev/null
>> -+++ b/include/drm/glamo_drm.h
>> -@@ -0,0 +1,153 @@
>> -+/* glamo_drm.h -- Public header for the Glamo driver
>> -+ *
>> -+ * Copyright 2009 Thomas White
>> -+ * Copyright 2000 Precision Insight, Inc., Cedar Park, Texas.
>> -+ * Copyright 2000 VA Linux Systems, Inc., Fremont, California.
>> -+ * Copyright 2002 Tungsten Graphics, Inc., Cedar Park, Texas.
>> -+ * All rights reserved.
>> -+ *
>> -+ * Permission is hereby granted, free of charge, to any person obtaini=
ng a
>> -+ * copy of this software and associated documentation files (the "Soft=
ware"),
>> -+ * to deal in the Software without restriction, including without limi=
tation
>> -+ * the rights to use, copy, modify, merge, publish, distribute, sublic=
ense,
>> -+ * and/or sell copies of the Software, and to permit persons to whom t=
he
>> -+ * Software is furnished to do so, subject to the following conditions=
:
>> -+ *
>> -+ * The above copyright notice and this permission notice (including th=
e next
>> -+ * paragraph) shall be included in all copies or substantial portions =
of the
>> -+ * Software.
>> -+ *
>> -+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXP=
RESS OR
>> -+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABI=
LITY,
>> -+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. =A0IN NO EVEN=
T SHALL
>> -+ * PRECISION INSIGHT AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAM=
AGES OR
>> -+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWIS=
E,
>> -+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE =
OR OTHER
>> -+ * DEALINGS IN THE SOFTWARE.
>> -+ *
>> -+ * Authors:
>> -+ * =A0 =A0Thomas White <taw@bitwiz.org.uk>
>> -+ * =A0 =A0Kevin E. Martin <martin@valinux.com>
>> -+ * =A0 =A0Gareth Hughes <gareth@valinux.com>
>> -+ * =A0 =A0Keith Whitwell <keith@tungstengraphics.com>
>> -+ */
>> -+
>> -+#ifndef __GLAMO_DRM_H__
>> -+#define __GLAMO_DRM_H__
>> -+
>> -+#include "drm.h"
>> -+
>> -+#define GLAMO_GEM_DOMAIN_VRAM (0x1)
>> -+
>> -+/* Glamo specific ioctls */
>> -+#define DRM_GLAMO_CMDBUF =A0 =A0 0x01
>> -+#define DRM_GLAMO_SWAP =A0 =A0 =A0 0x02
>> -+#define DRM_GLAMO_CMDBURST =A0 0x03
>> -+
>> -+#define DRM_GLAMO_GEM_INFO =A0 =A0 0x1c
>> -+#define DRM_GLAMO_GEM_CREATE =A0 0x1d
>> -+#define DRM_GLAMO_GEM_MMAP =A0 =A0 0x1e
>> -+#define DRM_GLAMO_GEM_PIN =A0 =A0 =A00x1f
>> -+#define DRM_GLAMO_GEM_UNPIN =A0 =A00x20
>> -+#define DRM_GLAMO_GEM_PREAD =A0 =A00x21
>> -+#define DRM_GLAMO_GEM_PWRITE =A0 0x22
>> -+#define DRM_GLAMO_GEM_WAIT_RENDERING 0x24
>> -+
>> -+#define DRM_IOCTL_GLAMO_CMDBUF =A0 =A0 DRM_IOW(DRM_COMMAND_BASE + DRM_=
GLAMO_CMDBUF, drm_glamo_cmd_buffer_t)
>> -+#define DRM_IOCTL_GLAMO_SWAP =A0 =A0 =A0 DRM_IO(DRM_COMMAND_BASE + DRM=
_GLAMO_SWAP)
>> -+#define DRM_IOCTL_GLAMO_CMDBURST =A0 =A0 DRM_IOW(DRM_COMMAND_BASE + DR=
M_GLAMO_CMDBURST, drm_glamo_cmd_burst_t)
>> -+
>> -+#define DRM_IOCTL_GLAMO_GEM_INFO =A0 DRM_IOWR(DRM_COMMAND_BASE + DRM_G=
LAMO_GEM_INFO, struct drm_glamo_gem_info)
>> -+#define DRM_IOCTL_GLAMO_GEM_CREATE DRM_IOWR(DRM_COMMAND_BASE + DRM_GLA=
MO_GEM_CREATE, struct drm_glamo_gem_create)
>> -+#define DRM_IOCTL_GLAMO_GEM_MMAP =A0 DRM_IOWR(DRM_COMMAND_BASE + DRM_G=
LAMO_GEM_MMAP, struct drm_glamo_gem_mmap)
>> -+#define DRM_IOCTL_GLAMO_GEM_PIN =A0 =A0DRM_IOWR(DRM_COMMAND_BASE + DRM=
_GLAMO_GEM_PIN, struct drm_glamo_gem_pin)
>> -+#define DRM_IOCTL_GLAMO_GEM_UNPIN =A0DRM_IOWR(DRM_COMMAND_BASE + DRM_G=
LAMO_GEM_UNPIN, struct drm_glamo_gem_unpin)
>> -+#define DRM_IOCTL_GLAMO_GEM_PREAD =A0DRM_IOWR(DRM_COMMAND_BASE + DRM_G=
LAMO_GEM_PREAD, struct drm_glamo_gem_pread)
>> -+#define DRM_IOCTL_GLAMO_GEM_PWRITE DRM_IOWR(DRM_COMMAND_BASE + DRM_GLA=
MO_GEM_PWRITE, struct drm_glamo_gem_pwrite)
>> -+#define DRM_IOCTL_GLAMO_GEM_WAIT_RENDERING DRM_IOW(DRM_COMMAND_BASE + =
DRM_GLAMO_GEM_WAIT_RENDERING, struct drm_glamo_gem_wait_rendering)
>> -+
>> -+
>> -+/* Simple command submission - a list of 16-bit address-data pairs */
>> -+typedef struct drm_glamo_cmd_buffer {
>> -+ =A0 =A0 =A0unsigned int bufsz; =A0 =A0 /* Size of buffer, in bytes */
>> -+ =A0 =A0 =A0char *buf; =A0 =A0 =A0 =A0 =A0 =A0 =A0/* Buffer of stuff t=
o go onto the ring buffer */
>> -+ =A0 =A0 =A0unsigned int *obj_pos; =A0/* Offsets (in bytes) at which t=
o put objs */
>> -+ =A0 =A0 =A0uint32_t *objs; =A0 =A0 =A0 =A0 /* List of buffer object (=
handles) to use */
>> -+ =A0 =A0 =A0unsigned int nobjs; =A0 =A0 /* Number of objects reference=
d */
>> -+ =A0 =A0 =A0int nbox;
>> -+ =A0 =A0 =A0struct drm_clip_rect *boxes;
>> -+} drm_glamo_cmd_buffer_t;
>> -+
>> -+
>> -+/* Burst command submission - base address and data:
>> -+ * =A0- Data can be 32-bit (more easily)
>> -+ * =A0- Easier for the kernel to validate */
>> -+typedef struct drm_glamo_cmd_burst {
>> -+ =A0 =A0 =A0uint16_t base; =A0 =A0 =A0 =A0 =A0/* Base address (command=
) */
>> -+ =A0 =A0 =A0int bufsz; =A0 =A0 =A0 =A0 =A0 =A0 =A0/* Size of data, in =
bytes */
>> -+ =A0 =A0 =A0uint16_t *data; =A0 =A0 =A0 =A0 /* Pointer to data */
>> -+ =A0 =A0 =A0unsigned int *obj_pos; =A0/* Offsets (in bytes) at which t=
o put objs */
>> -+ =A0 =A0 =A0uint32_t *objs; =A0 =A0 =A0 =A0 /* List of buffer object (=
handles) to use */
>> -+ =A0 =A0 =A0unsigned int nobjs; =A0 =A0 /* Number of objects reference=
d */
>> -+} drm_glamo_cmd_burst_t;
>> -+
>> -+struct drm_glamo_gem_info {
>> -+ =A0 =A0 =A0uint64_t vram_start;
>> -+ =A0 =A0 =A0uint64_t vram_size;
>> -+};
>> -+
>> -+struct drm_glamo_gem_create {
>> -+ =A0 =A0 =A0uint64_t size;
>> -+ =A0 =A0 =A0uint64_t alignment;
>> -+ =A0 =A0 =A0uint32_t handle;
>> -+ =A0 =A0 =A0uint32_t initial_domain; // to allow VRAM to be created
>> -+ =A0 =A0 =A0uint32_t no_backing_store;
>> -+};
>> -+
>> -+struct drm_glamo_gem_mmap {
>> -+ =A0 =A0 =A0uint32_t handle; =A0 =A0 =A0 =A0/* Handle goes in... */
>> -+ =A0 =A0 =A0uint64_t offset; =A0 =A0 =A0 =A0/* ...offset comes out */
>> -+};
>> -+
>> -+struct drm_glamo_gem_wait_rendering {
>> -+ =A0 =A0 =A0uint32_t handle;
>> -+ =A0 =A0 =A0int have_handle;
>> -+};
>> -+
>> -+struct drm_glamo_gem_pin {
>> -+ =A0 =A0 =A0uint32_t handle;
>> -+ =A0 =A0 =A0uint32_t pin_domain;
>> -+ =A0 =A0 =A0uint64_t alignment;
>> -+ =A0 =A0 =A0uint64_t offset;
>> -+};
>> -+
>> -+struct drm_glamo_gem_unpin {
>> -+ =A0 =A0 =A0uint32_t handle;
>> -+ =A0 =A0 =A0uint32_t pad;
>> -+};
>> -+
>> -+struct drm_glamo_gem_pread {
>> -+ =A0 =A0 =A0/** Handle for the object being read. */
>> -+ =A0 =A0 =A0uint32_t handle;
>> -+ =A0 =A0 =A0uint32_t pad;
>> -+ =A0 =A0 =A0/** Offset into the object to read from */
>> -+ =A0 =A0 =A0uint64_t offset;
>> -+ =A0 =A0 =A0/** Length of data to read */
>> -+ =A0 =A0 =A0uint64_t size;
>> -+ =A0 =A0 =A0/** Pointer to write the data into. */
>> -+ =A0 =A0 =A0uint64_t data_ptr; =A0 =A0 =A0/* void *, but pointers are =
not 32/64 compatible */
>> -+};
>> -+
>> -+struct drm_glamo_gem_pwrite {
>> -+ =A0 =A0 =A0/** Handle for the object being written to. */
>> -+ =A0 =A0 =A0uint32_t handle;
>> -+ =A0 =A0 =A0uint32_t pad;
>> -+ =A0 =A0 =A0/** Offset into the object to write to */
>> -+ =A0 =A0 =A0uint64_t offset;
>> -+ =A0 =A0 =A0/** Length of data to write */
>> -+ =A0 =A0 =A0uint64_t size;
>> -+ =A0 =A0 =A0/** Pointer to read the data from. */
>> -+ =A0 =A0 =A0uint64_t data_ptr; =A0 =A0 =A0/* void *, but pointers are =
not 32/64 compatible */
>> -+};
>> -+
>> -+#endif
>> diff --git a/recipes/dri/libdrm-2.4.22/glamo.patch b/recipes/dri/libdrm-=
2.4.22/glamo.patch
>> deleted file mode 100644
>> index b397ded..0000000
>> --- a/recipes/dri/libdrm-2.4.22/glamo.patch
>> +++ /dev/null
>> @@ -1,1095 +0,0 @@
>> -diff --git a/Makefile.am b/Makefile.am
>> -index 25d1747..f384228 100644
>> ---- a/Makefile.am
>> -+++ b/Makefile.am
>> -@@ -41,7 +41,11 @@ if HAVE_RADEON
>> - RADEON_SUBDIR =3D radeon
>> - endif
>> -
>> --SUBDIRS =3D . $(LIBKMS_SUBDIR) $(INTEL_SUBDIR) $(NOUVEAU_SUBDIR) $(RAD=
EON_SUBDIR) tests include
>> -+if HAVE_GLAMO
>> -+GLAMO_SUBDIR =3D glamo
>> -+endif
>> -+
>> -+SUBDIRS =3D . $(LIBKMS_SUBDIR) $(INTEL_SUBDIR) $(NOUVEAU_SUBDIR) $(RAD=
EON_SUBDIR) $(GLAMO_SUBDIR) tests include
>> -
>> - libdrm_la_LTLIBRARIES =3D libdrm.la
>> - libdrm_ladir =3D $(libdir)
>> -diff --git a/configure.ac b/configure.ac
>> -index 62db817..0b2a33e 100644
>> ---- a/configure.ac
>> -+++ b/configure.ac
>> -@@ -73,6 +73,11 @@ AC_ARG_ENABLE(nouveau-experimental-api,
>> - =A0 =A0 =A0 =A0 =A0 =A0 [NOUVEAU=3D$enableval], [NOUVEAU=3Dno])
>> -
>> -
>> -+AC_ARG_ENABLE(glamo-experimental-api,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0AS_HELP_STRING([--enable-glamo-experimental-ap=
i],
>> -+ =A0 =A0 =A0 =A0 =A0 =A0[Enable support for Glamo's KMS API (default: =
disabled)]),
>> -+ =A0 =A0 =A0 =A0 =A0 =A0[GLAMO=3D$enableval], [GLAMO=3Dno])
>> -+
>> - dnl =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>> - dnl check compiler flags
>> - AC_DEFUN([LIBDRM_CC_TRY_FLAG], [
>> -@@ -169,6 +174,11 @@ if test "x$NOUVEAU" =3D xyes; then
>> - =A0 =A0 =A0 AC_DEFINE(HAVE_NOUVEAU, 1, [Have nouveau (nvidia) support]=
)
>> - fi
>> -
>> -+AM_CONDITIONAL(HAVE_GLAMO, [test "x$GLAMO" =3D xyes])
>> -+if test "x$GLAMO" =3D xyes; then
>> -+ =A0 =A0 =A0AC_DEFINE(HAVE_GLAMO, 1, [Have glamo support])
>> -+fi
>> -+
>> - PKG_CHECK_MODULES(CAIRO, cairo, [HAVE_CAIRO=3Dyes], [HAVE_CAIRO=3Dno])
>> - if test "x$HAVE_CAIRO" =3D xyes; then
>> - =A0 =A0 =A0 AC_DEFINE(HAVE_CAIRO, 1, [Have cairo support])
>> -@@ -262,6 +272,8 @@ AC_OUTPUT([
>> - =A0 =A0 =A0 radeon/libdrm_radeon.pc
>> - =A0 =A0 =A0 nouveau/Makefile
>> - =A0 =A0 =A0 nouveau/libdrm_nouveau.pc
>> -+ =A0 =A0 =A0glamo/Makefile
>> -+ =A0 =A0 =A0glamo/libdrm_glamo.pc
>> - =A0 =A0 =A0 tests/Makefile
>> - =A0 =A0 =A0 tests/modeprint/Makefile
>> - =A0 =A0 =A0 tests/modetest/Makefile
>> -diff --git a/glamo/Makefile.am b/glamo/Makefile.am
>> -new file mode 100644
>> -index 0000000..1f17aa3
>> ---- /dev/null
>> -+++ b/glamo/Makefile.am
>> -@@ -0,0 +1,52 @@
>> -+# Copyright (c) 2009 Thomas Whtie <taw@bitwiz.org.uk>
>> -+# Based on libdrm-glamo Copyright =A9 2008 J=E9r=F4me Glisse
>> -+#
>> -+# Permission is hereby granted, free of charge, to any person obtainin=
g a
>> -+# copy of this software and associated documentation files (the "Softw=
are"),
>> -+# to deal in the Software without restriction, including without limit=
ation
>> -+# the rights to use, copy, modify, merge, publish, distribute, sublice=
nse,
>> -+# and/or sell copies of the Software, and to permit persons to whom th=
e
>> -+# Software is furnished to do so, subject to the following conditions:
>> -+#
>> -+# The above copyright notice and this permission notice (including the=
 next
>> -+# paragraph) shall be included in all copies or substantial portions o=
f the
>> -+# Software.
>> -+#
>> -+# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPR=
ESS OR
>> -+# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABIL=
ITY,
>> -+# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. =A0IN NO EVENT=
 SHALL
>> -+# THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR=
 OTHER
>> -+# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARIS=
ING
>> -+# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER =
DEALINGS
>> -+# IN THE SOFTWARE.
>> -+#
>> -+# Authors:
>> -+# =A0 =A0J=E9r=F4me Glisse <glisse@freedesktop.org>
>> -+# =A0 =A0Thomas White <taw@bitwiz.org.uk>
>> -+
>> -+AM_CFLAGS =3D \
>> -+ =A0 =A0 =A0$(WARN_CFLAGS) \
>> -+ =A0 =A0 =A0-I$(top_srcdir) \
>> -+ =A0 =A0 =A0-I$(top_srcdir)/glamo \
>> -+ =A0 =A0 =A0$(PTHREADSTUBS_CFLAGS) \
>> -+ =A0 =A0 =A0-I$(top_srcdir)/include/drm
>> -+
>> -+libdrm_glamo_la_LTLIBRARIES =3D libdrm_glamo.la
>> -+libdrm_glamo_ladir =3D $(libdir)
>> -+libdrm_glamo_la_LDFLAGS =3D -version-number 1:0:0 -no-undefined
>> -+libdrm_glamo_la_LIBADD =3D ../libdrm.la @PTHREADSTUBS_LIBS@
>> -+
>> -+libdrm_glamo_la_SOURCES =3D \
>> -+ =A0 =A0 =A0glamo_bo_gem.c \
>> -+ =A0 =A0 =A0glamo_track.c
>> -+
>> -+libdrm_glamoincludedir =3D ${includedir}/libdrm
>> -+libdrm_glamoinclude_HEADERS =3D \
>> -+ =A0 =A0 =A0glamo_bo.h \
>> -+ =A0 =A0 =A0glamo_bo_gem.h \
>> -+ =A0 =A0 =A0glamo_track.h
>> -+
>> -+pkgconfigdir =3D @pkgconfigdir@
>> -+pkgconfig_DATA =3D libdrm_glamo.pc
>> -+
>> -+EXTRA_DIST =3D libdrm_glamo.pc.in
>> -diff --git a/glamo/glamo_bo.h b/glamo/glamo_bo.h
>> -new file mode 100644
>> -index 0000000..8ef2a18
>> ---- /dev/null
>> -+++ b/glamo/glamo_bo.h
>> -@@ -0,0 +1,183 @@
>> -+/*
>> -+ * Copyright (c) 2009 Thomas White
>> -+ *
>> -+ * Heavily based on radeon_bo.h
>> -+ * Copyright =A9 2008 J=E9r=F4me Glisse
>> -+ * All Rights Reserved.
>> -+ *
>> -+ * Permission is hereby granted, free of charge, to any person obtaini=
ng
>> -+ * a copy of this software and associated documentation files (the
>> -+ * "Software"), to deal in the Software without restriction, including
>> -+ * without limitation the rights to use, copy, modify, merge, publish,
>> -+ * distribute, sub license, and/or sell copies of the Software, and to
>> -+ * permit persons to whom the Software is furnished to do so, subject =
to
>> -+ * the following conditions:
>> -+ *
>> -+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
>> -+ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
>> -+ * OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
>> -+ * NON-INFRINGEMENT. IN NO EVENT SHALL THE COPYRIGHT HOLDERS, AUTHORS
>> -+ * AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
>> -+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
>> -+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
>> -+ * USE OR OTHER DEALINGS IN THE SOFTWARE.
>> -+ *
>> -+ * The above copyright notice and this permission notice (including th=
e
>> -+ * next paragraph) shall be included in all copies or substantial port=
ions
>> -+ * of the Software.
>> -+ */
>> -+/*
>> -+ * Authors:
>> -+ * =A0 =A0 =A0J=E9r=F4me Glisse <glisse@freedesktop.org>
>> -+ * =A0 =A0Thomas White <taw@bitwiz.org.uk>
>> -+ */
>> -+#ifndef GLAMO_BO_H
>> -+#define GLAMO_BO_H
>> -+
>> -+#include <stdio.h>
>> -+#include <stdint.h>
>> -+#include "glamo_track.h"
>> -+
>> -+/* bo object */
>> -+#define GLAMO_BO_FLAGS_MACRO_TILE =A01
>> -+#define GLAMO_BO_FLAGS_MICRO_TILE =A02
>> -+
>> -+struct glamo_bo_manager;
>> -+
>> -+struct glamo_bo {
>> -+ =A0 =A0uint32_t =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0alignment;
>> -+ =A0 =A0uint32_t =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0handle;
>> -+ =A0 =A0uint32_t =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0size;
>> -+ =A0 =A0uint32_t =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0domains;
>> -+ =A0 =A0uint32_t =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0flags;
>> -+ =A0 =A0unsigned =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0cref;
>> -+#ifdef GLAMO_BO_TRACK
>> -+ =A0 =A0struct glamo_track =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*track;
>> -+#endif
>> -+ =A0 =A0struct glamo_bo_manager =A0 *bom;
>> -+ =A0 =A0void =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*virtual;
>> -+ =A0 =A0uint32_t =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0space_accounted;
>> -+};
>> -+
>> -+/* bo functions */
>> -+struct glamo_bo_funcs {
>> -+ =A0 =A0struct glamo_bo *(*bo_open)(struct glamo_bo_manager *bom,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uint3=
2_t handle,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uint3=
2_t size,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uint3=
2_t alignment,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uint3=
2_t domains,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uint3=
2_t flags);
>> -+ =A0 =A0void (*bo_ref)(struct glamo_bo *bo);
>> -+ =A0 =A0struct glamo_bo *(*bo_unref)(struct glamo_bo *bo);
>> -+ =A0 =A0int (*bo_map)(struct glamo_bo *bo, int write);
>> -+ =A0 =A0int (*bo_unmap)(struct glamo_bo *bo);
>> -+ =A0 =A0int (*bo_wait)(struct glamo_bo *bo);
>> -+};
>> -+
>> -+struct glamo_bo_manager {
>> -+ =A0 =A0struct glamo_bo_funcs =A0*funcs;
>> -+ =A0 =A0int =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 fd;
>> -+ =A0 =A0struct glamo_tracker =A0 tracker;
>> -+};
>> -+
>> -+static inline void _glamo_bo_debug(struct glamo_bo *bo,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0const char *op,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0const char *file,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0const char *func,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0int line)
>> -+{
>> -+ =A0 =A0fprintf(stderr, "%s %p 0x%08X 0x%08X 0x%08X [%s %s %d]\n",
>> -+ =A0 =A0 =A0 =A0 =A0 =A0op, (void *)bo, bo->handle, bo->size, bo->cref=
, file, func, line);
>> -+}
>> -+
>> -+static inline struct glamo_bo *_glamo_bo_open(struct glamo_bo_manager =
*bom,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0uint32_t handle,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0uint32_t size,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0uint32_t alignment,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0uint32_t domains,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0uint32_t flags,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0const char *file,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0const char *func,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0int line)
>> -+{
>> -+ =A0 =A0struct glamo_bo *bo;
>> -+
>> -+ =A0 =A0bo =3D bom->funcs->bo_open(bom, handle, size, alignment, domai=
ns, flags);
>> -+#ifdef GLAMO_BO_TRACK
>> -+ =A0 =A0if (bo) {
>> -+ =A0 =A0 =A0 =A0bo->track =3D glamo_tracker_add_track(&bom->tracker, b=
o->handle);
>> -+ =A0 =A0 =A0 =A0glamo_track_add_event(bo->track, file, func, "open", l=
ine);
>> -+ =A0 =A0}
>> -+#endif
>> -+ =A0 =A0return bo;
>> -+}
>> -+
>> -+static inline void _glamo_bo_ref(struct glamo_bo *bo,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0co=
nst char *file,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0co=
nst char *func,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0in=
t line)
>> -+{
>> -+ =A0 =A0bo->cref++;
>> -+#ifdef GLAMO_BO_TRACK
>> -+ =A0 =A0glamo_track_add_event(bo->track, file, func, "ref", line);
>> -+#endif
>> -+ =A0 =A0bo->bom->funcs->bo_ref(bo);
>> -+}
>> -+
>> -+static inline struct glamo_bo *_glamo_bo_unref(struct glamo_bo *bo,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 const char *file,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 const char *func,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 int line)
>> -+{
>> -+ =A0 =A0bo->cref--;
>> -+#ifdef GLAMO_BO_TRACK
>> -+ =A0 =A0glamo_track_add_event(bo->track, file, func, "unref", line);
>> -+ =A0 =A0if (bo->cref <=3D 0) {
>> -+ =A0 =A0 =A0 =A0glamo_tracker_remove_track(&bo->bom->tracker, bo->trac=
k);
>> -+ =A0 =A0 =A0 =A0bo->track =3D NULL;
>> -+ =A0 =A0}
>> -+#endif
>> -+ =A0 =A0return bo->bom->funcs->bo_unref(bo);
>> -+}
>> -+
>> -+static inline int _glamo_bo_map(struct glamo_bo *bo,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 int w=
rite,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 const=
 char *file,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 const=
 char *func,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 int l=
ine)
>> -+{
>> -+ =A0 =A0return bo->bom->funcs->bo_map(bo, write);
>> -+}
>> -+
>> -+static inline int _glamo_bo_unmap(struct glamo_bo *bo,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 c=
onst char *file,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 c=
onst char *func,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 i=
nt line)
>> -+{
>> -+ =A0 =A0return bo->bom->funcs->bo_unmap(bo);
>> -+}
>> -+
>> -+static inline int _glamo_bo_wait(struct glamo_bo *bo,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0co=
nst char *file,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0co=
nst char *func,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0in=
t line)
>> -+{
>> -+ =A0 =A0return bo->bom->funcs->bo_wait(bo);
>> -+}
>> -+
>> -+#define glamo_bo_open(bom, h, s, a, d, f)\
>> -+ =A0 =A0_glamo_bo_open(bom, h, s, a, d, f, __FILE__, __FUNCTION__, __L=
INE__)
>> -+#define glamo_bo_ref(bo)\
>> -+ =A0 =A0_glamo_bo_ref(bo, __FILE__, __FUNCTION__, __LINE__)
>> -+#define glamo_bo_unref(bo)\
>> -+ =A0 =A0_glamo_bo_unref(bo, __FILE__, __FUNCTION__, __LINE__)
>> -+#define glamo_bo_map(bo, w)\
>> -+ =A0 =A0_glamo_bo_map(bo, w, __FILE__, __FUNCTION__, __LINE__)
>> -+#define glamo_bo_unmap(bo)\
>> -+ =A0 =A0_glamo_bo_unmap(bo, __FILE__, __FUNCTION__, __LINE__)
>> -+#define glamo_bo_debug(bo, opcode)\
>> -+ =A0 =A0_glamo_bo_debug(bo, opcode, __FILE__, __FUNCTION__, __LINE__)
>> -+#define glamo_bo_wait(bo) \
>> -+ =A0 =A0_glamo_bo_wait(bo, __FILE__, __func__, __LINE__)
>> -+
>> -+#endif
>> -diff --git a/glamo/glamo_bo_gem.c b/glamo/glamo_bo_gem.c
>> -new file mode 100644
>> -index 0000000..38a4436
>> ---- /dev/null
>> -+++ b/glamo/glamo_bo_gem.c
>> -@@ -0,0 +1,336 @@
>> -+/*
>> -+ * Copyright =A9 2009 Thomas White
>> -+ *
>> -+ * Based on radeon_bo_gem.c, to which the following notice applies:
>> -+ *
>> -+ * Copyright =A9 2008 Dave Airlie
>> -+ * Copyright =A9 2008 J=E9r=F4me Glisse
>> -+ * All Rights Reserved.
>> -+ *
>> -+ * Permission is hereby granted, free of charge, to any person obtaini=
ng
>> -+ * a copy of this software and associated documentation files (the
>> -+ * "Software"), to deal in the Software without restriction, including
>> -+ * without limitation the rights to use, copy, modify, merge, publish,
>> -+ * distribute, sub license, and/or sell copies of the Software, and to
>> -+ * permit persons to whom the Software is furnished to do so, subject =
to
>> -+ * the following conditions:
>> -+ *
>> -+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
>> -+ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
>> -+ * OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
>> -+ * NON-INFRINGEMENT. IN NO EVENT SHALL THE COPYRIGHT HOLDERS, AUTHORS
>> -+ * AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
>> -+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
>> -+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
>> -+ * USE OR OTHER DEALINGS IN THE SOFTWARE.
>> -+ *
>> -+ * The above copyright notice and this permission notice (including th=
e
>> -+ * next paragraph) shall be included in all copies or substantial port=
ions
>> -+ * of the Software.
>> -+ */
>> -+/*
>> -+ * Authors:
>> -+ * =A0 =A0 =A0Dave Airlie
>> -+ * =A0 =A0 =A0J=E9r=F4me Glisse <glisse@freedesktop.org>
>> -+ *
>> -+ *
>> -+ * Memory mapping functions are based on intel_bufmgr_gem.c, to which =
the
>> -+ * following notice applies:
>> -+ *
>> -+ * Copyright =A9 2007 Red Hat Inc.
>> -+ * Copyright =A9 2007 Intel Corporation
>> -+ * Copyright 2006 Tungsten Graphics, Inc., Bismarck, ND., USA
>> -+ * All Rights Reserved.
>> -+ *
>> -+ * Permission is hereby granted, free of charge, to any person obtaini=
ng a
>> -+ * copy of this software and associated documentation files (the
>> -+ * "Software"), to deal in the Software without restriction, including
>> -+ * without limitation the rights to use, copy, modify, merge, publish,
>> -+ * distribute, sub license, and/or sell copies of the Software, and to
>> -+ * permit persons to whom the Software is furnished to do so, subject =
to
>> -+ * the following conditions:
>> -+ *
>> -+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXP=
RESS OR
>> -+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABI=
LITY,
>> -+ * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT =
SHALL
>> -+ * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR A=
NY CLAIM,
>> -+ * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT =
OR
>> -+ * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE =
OR THE
>> -+ * USE OR OTHER DEALINGS IN THE SOFTWARE.
>> -+ *
>> -+ * The above copyright notice and this permission notice (including th=
e
>> -+ * next paragraph) shall be included in all copies or substantial port=
ions
>> -+ * of the Software.
>> -+ *
>> -+ *
>> -+ *********************************************************************=
*****/
>> -+/*
>> -+ * Authors: Thomas Hellstr=F6m <thomas-at-tungstengraphics-dot-com>
>> -+ * =A0 =A0 =A0 =A0 =A0Keith Whitwell <keithw-at-tungstengraphics-dot-c=
om>
>> -+ * =A0 =A0 =A0 =A0Eric Anholt <eric@anholt.net>
>> -+ * =A0 =A0 =A0 =A0Dave Airlie <airlied@linux.ie>
>> -+ */
>> -+
>> -+#ifdef HAVE_CONFIG_H
>> -+#include "config.h"
>> -+#endif
>> -+
>> -+#include <stdio.h>
>> -+#include <stdint.h>
>> -+#include <stdlib.h>
>> -+#include <string.h>
>> -+#include <sys/mman.h>
>> -+#include <sys/ioctl.h>
>> -+#include <errno.h>
>> -+
>> -+#include "xf86drm.h"
>> -+#include "drm.h"
>> -+#include "glamo_drm.h"
>> -+#include "glamo_bo.h"
>> -+#include "glamo_bo_gem.h"
>> -+
>> -+struct glamo_bo_gem {
>> -+ =A0 =A0 =A0struct glamo_bo =A0 base;
>> -+ =A0 =A0 =A0uint32_t =A0 =A0 =A0 =A0 =A0name;
>> -+ =A0 =A0 =A0int =A0 =A0 =A0 =A0 =A0 =A0 =A0 map_count;
>> -+};
>> -+
>> -+struct bo_manager_gem {
>> -+ =A0 =A0 =A0struct glamo_bo_manager =A0 =A0base;
>> -+};
>> -+
>> -+static struct glamo_bo *bo_open(struct glamo_bo_manager *bom,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uint3=
2_t handle,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uint3=
2_t size,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uint3=
2_t alignment,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uint3=
2_t domains,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uint3=
2_t flags)
>> -+{
>> -+ =A0 =A0 =A0struct glamo_bo_gem *bo;
>> -+ =A0 =A0 =A0int r;
>> -+
>> -+ =A0 =A0 =A0bo =3D (struct glamo_bo_gem*)calloc(1, sizeof(struct glamo=
_bo_gem));
>> -+ =A0 =A0 =A0if (bo =3D=3D NULL) {
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0return NULL;
>> -+ =A0 =A0 =A0}
>> -+
>> -+ =A0 =A0 =A0bo->base.bom =3D bom;
>> -+ =A0 =A0 =A0bo->base.handle =3D 0;
>> -+ =A0 =A0 =A0bo->base.size =3D size;
>> -+ =A0 =A0 =A0bo->base.alignment =3D alignment;
>> -+ =A0 =A0 =A0bo->base.domains =3D domains;
>> -+ =A0 =A0 =A0bo->base.flags =3D flags;
>> -+ =A0 =A0 =A0bo->base.cref =3D 0;
>> -+ =A0 =A0 =A0bo->map_count =3D 0;
>> -+ =A0 =A0 =A0bo->base.virtual =3D NULL;
>> -+ =A0 =A0 =A0if (handle) {
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0struct drm_gem_open open_arg;
>> -+
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0memset(&open_arg, 0, sizeof(open_arg));
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0open_arg.name =3D handle;
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0r =3D ioctl(bom->fd, DRM_IOCTL_GEM_OPEN, &=
open_arg);
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0if (r !=3D 0) {
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0free(bo);
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return NULL;
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0}
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0bo->base.handle =3D open_arg.handle;
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0bo->base.size =3D open_arg.size;
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0bo->name =3D handle;
>> -+ =A0 =A0 =A0} else {
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0struct drm_glamo_gem_create args;
>> -+
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0args.size =3D size;
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0args.alignment =3D alignment;
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0args.initial_domain =3D bo->base.domains;
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0args.no_backing_store =3D 0;
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0args.handle =3D 0;
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0r =3D drmCommandWriteRead(bom->fd, DRM_GLA=
MO_GEM_CREATE,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0&args, sizeof(args));
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0bo->base.handle =3D args.handle;
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0if (r) {
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0fprintf(stderr, "Failed to=
 allocate :\n");
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0fprintf(stderr, " =A0 size=
 =A0 =A0 =A0: %d bytes\n", size);
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0fprintf(stderr, " =A0 alig=
nment : %d bytes\n", alignment);
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0free(bo);
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return NULL;
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0}
>> -+ =A0 =A0 =A0}
>> -+ =A0 =A0 =A0glamo_bo_ref((struct glamo_bo*)bo);
>> -+ =A0 =A0 =A0return (struct glamo_bo*)bo;
>> -+}
>> -+
>> -+static void bo_ref(struct glamo_bo *bo)
>> -+{
>> -+}
>> -+
>> -+static struct glamo_bo *bo_unref(struct glamo_bo *bo)
>> -+{
>> -+ =A0 =A0 =A0struct glamo_bo_gem *bo_gem =3D (struct glamo_bo_gem*)bo;
>> -+ =A0 =A0 =A0struct drm_gem_close args;
>> -+
>> -+ =A0 =A0 =A0if (bo =3D=3D NULL) {
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0return NULL;
>> -+ =A0 =A0 =A0}
>> -+ =A0 =A0 =A0if (bo->cref) {
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0return bo;
>> -+ =A0 =A0 =A0}
>> -+ =A0 =A0 =A0if (bo_gem->map_count) {
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0munmap(bo->virtual, bo->size);
>> -+ =A0 =A0 =A0}
>> -+
>> -+ =A0 =A0 =A0/* close object */
>> -+ =A0 =A0 =A0args.handle =3D bo->handle;
>> -+ =A0 =A0 =A0ioctl(bo->bom->fd, DRM_IOCTL_GEM_CLOSE, &args);
>> -+ =A0 =A0 =A0memset(bo_gem, 0, sizeof(struct glamo_bo_gem));
>> -+ =A0 =A0 =A0free(bo_gem);
>> -+ =A0 =A0 =A0return NULL;
>> -+}
>> -+
>> -+static int bo_map(struct glamo_bo *bo, int write)
>> -+{
>> -+ =A0 =A0 =A0struct glamo_bo_gem *bo_gem;
>> -+ =A0 =A0 =A0struct glamo_bo_manager *bufmgr;
>> -+ =A0 =A0 =A0int ret;
>> -+
>> -+ =A0 =A0 =A0bo_gem =3D (struct glamo_bo_gem *)bo;
>> -+ =A0 =A0 =A0bufmgr =3D (struct glamo_bo_manager*)bo->bom;
>> -+
>> -+ =A0 =A0 =A0/* Get a mapping of the buffer if we haven't before. */
>> -+ =A0 =A0 =A0if (bo->virtual =3D=3D NULL) {
>> -+
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0struct drm_glamo_gem_mmap mmap_arg;
>> -+
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0memset(&mmap_arg, 0, sizeof(mmap_arg));
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0mmap_arg.handle =3D bo->handle;
>> -+
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0/* Get the fake offset back... */
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0ret =3D ioctl(bufmgr->fd, DRM_IOCTL_GLAMO_=
GEM_MMAP, &mmap_arg);
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0if (ret !=3D 0) {
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0fprintf(stderr,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"%s:%d: Er=
ror preparing BO map %d (%d): %s .\n",
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0__FILE__, =
__LINE__,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0bo->handle=
, bo_gem->name,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0strerror(e=
rrno));
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return ret;
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0}
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0/* and mmap it */
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0bo->virtual =3D mmap(0, bo->size, PROT_REA=
D | PROT_WRITE,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 MAP_SHARED, bufmgr->fd,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 mmap_arg.offset);
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0if (bo->virtual =3D=3D MAP_FAILED) {
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0fprintf(stderr,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"%s:%d: Er=
ror mapping buffer %d (%d): %s .\n",
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0__FILE__, =
__LINE__,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0bo->handle=
, bo_gem->name,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0strerror(e=
rrno));
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return errno;
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0}
>> -+ =A0 =A0 =A0}
>> -+ =A0 =A0 =A0bo_gem->map_count++;
>> -+
>> -+ =A0 =A0 =A0return 0;
>> -+}
>> -+
>> -+static int bo_unmap(struct glamo_bo *bo)
>> -+{
>> -+ =A0 =A0 =A0struct glamo_bo_gem *bo_gem =3D (struct glamo_bo_gem*)bo;
>> -+
>> -+ =A0 =A0 =A0if ( bo_gem->map_count =3D=3D 0 ) {
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0fprintf(stderr, "Not unmapping %p, because=
 its map count"
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0" is alrea=
dy zero.\n", bo_gem);
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0return 0;
>> -+ =A0 =A0 =A0}
>> -+
>> -+ =A0 =A0 =A0if (--bo_gem->map_count > 0) {
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0return 0;
>> -+ =A0 =A0 =A0}
>> -+ =A0 =A0 =A0munmap(bo->virtual, bo->size);
>> -+ =A0 =A0 =A0bo->virtual =3D NULL;
>> -+ =A0 =A0 =A0return 0;
>> -+}
>> -+
>> -+static int bo_wait(struct glamo_bo *bo)
>> -+{
>> -+ =A0 =A0 =A0struct drm_glamo_gem_wait_rendering args;
>> -+ =A0 =A0 =A0int ret;
>> -+
>> -+ =A0 =A0 =A0args.handle =3D bo->handle;
>> -+ =A0 =A0 =A0args.have_handle =3D 1;
>> -+ =A0 =A0 =A0do {
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0ret =3D drmCommandWriteRead(bo->bom->fd,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0DRM_GLAMO_GEM_WAIT_RENDERING,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0&args, sizeof(args));
>> -+ =A0 =A0 =A0} while (ret =3D=3D -EAGAIN);
>> -+ =A0 =A0 =A0return ret;
>> -+}
>> -+
>> -+static struct glamo_bo_funcs bo_gem_funcs =3D {
>> -+ =A0 =A0 =A0bo_open,
>> -+ =A0 =A0 =A0bo_ref,
>> -+ =A0 =A0 =A0bo_unref,
>> -+ =A0 =A0 =A0bo_map,
>> -+ =A0 =A0 =A0bo_unmap,
>> -+ =A0 =A0 =A0bo_wait
>> -+};
>> -+
>> -+struct glamo_bo_manager *glamo_bo_manager_gem_ctor(int fd)
>> -+{
>> -+ =A0 =A0 =A0struct bo_manager_gem *bomg;
>> -+
>> -+ =A0 =A0 =A0bomg =3D (struct bo_manager_gem*)calloc(1, sizeof(struct b=
o_manager_gem));
>> -+ =A0 =A0 =A0if (bomg =3D=3D NULL) return NULL;
>> -+
>> -+ =A0 =A0 =A0bomg->base.funcs =3D &bo_gem_funcs;
>> -+ =A0 =A0 =A0bomg->base.fd =3D fd;
>> -+ =A0 =A0 =A0return (struct glamo_bo_manager*)bomg;
>> -+}
>> -+
>> -+void glamo_bo_manager_gem_dtor(struct glamo_bo_manager *bom)
>> -+{
>> -+ =A0 =A0 =A0struct bo_manager_gem *bomg =3D (struct bo_manager_gem*)bo=
m;
>> -+
>> -+ =A0 =A0 =A0if (bom =3D=3D NULL) return;
>> -+ =A0 =A0 =A0free(bomg);
>> -+}
>> -+
>> -+uint32_t glamo_gem_get_name(struct glamo_bo *bo)
>> -+{
>> -+ =A0 =A0 =A0struct glamo_bo_gem *bo_gem =3D (struct glamo_bo_gem*)bo;
>> -+ =A0 =A0 =A0return bo_gem->name;
>> -+}
>> -+
>> -+int glamo_gem_name_buffer(struct glamo_bo *bo, uint32_t *name)
>> -+{
>> -+ =A0 =A0 =A0struct drm_gem_flink flink;
>> -+ =A0 =A0 =A0int r;
>> -+
>> -+ =A0 =A0 =A0if ( !bo ) {
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0fprintf(stderr, "No buffer object!\n");
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0return -1;
>> -+ =A0 =A0 =A0}
>> -+
>> -+ =A0 =A0 =A0flink.handle =3D bo->handle;
>> -+ =A0 =A0 =A0r =3D ioctl(bo->bom->fd, DRM_IOCTL_GEM_FLINK, &flink);
>> -+ =A0 =A0 =A0if (r) return r;
>> -+
>> -+ =A0 =A0 =A0*name =3D flink.name;
>> -+ =A0 =A0 =A0return 0;
>> -+}
>> -+
>> -+int glamo_bo_subdata(struct glamo_bo *bo, unsigned long offset,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned long size, const voi=
d *data)
>> -+{
>> -+ =A0 =A0 =A0int ret;
>> -+
>> -+ =A0 =A0 =A0if (size =3D=3D 0 || data =3D=3D NULL)
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0return 0;
>> -+
>> -+ =A0 =A0 =A0ret =3D bo_map(bo, 1);
>> -+ =A0 =A0 =A0if ( ret ) return ret;
>> -+
>> -+ =A0 =A0 =A0memcpy((unsigned char *)bo->virtual + offset, data, size);
>> -+
>> -+ =A0 =A0 =A0bo_unmap(bo);
>> -+
>> -+ =A0 =A0 =A0return 0;
>> -+}
>> -diff --git a/glamo/glamo_bo_gem.h b/glamo/glamo_bo_gem.h
>> -new file mode 100644
>> -index 0000000..05b5fb9
>> ---- /dev/null
>> -+++ b/glamo/glamo_bo_gem.h
>> -@@ -0,0 +1,43 @@
>> -+/*
>> -+ * Copyright =A9 2008 Dave Airlie
>> -+ * Copyright =A9 2008 J=E9r=F4me Glisse
>> -+ * All Rights Reserved.
>> -+ *
>> -+ * Permission is hereby granted, free of charge, to any person obtaini=
ng
>> -+ * a copy of this software and associated documentation files (the
>> -+ * "Software"), to deal in the Software without restriction, including
>> -+ * without limitation the rights to use, copy, modify, merge, publish,
>> -+ * distribute, sub license, and/or sell copies of the Software, and to
>> -+ * permit persons to whom the Software is furnished to do so, subject =
to
>> -+ * the following conditions:
>> -+ *
>> -+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
>> -+ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
>> -+ * OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
>> -+ * NON-INFRINGEMENT. IN NO EVENT SHALL THE COPYRIGHT HOLDERS, AUTHORS
>> -+ * AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
>> -+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
>> -+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
>> -+ * USE OR OTHER DEALINGS IN THE SOFTWARE.
>> -+ *
>> -+ * The above copyright notice and this permission notice (including th=
e
>> -+ * next paragraph) shall be included in all copies or substantial port=
ions
>> -+ * of the Software.
>> -+ */
>> -+/*
>> -+ * Authors:
>> -+ * =A0 =A0 =A0Dave Airlie
>> -+ * =A0 =A0 =A0J=E9r=F4me Glisse <glisse@freedesktop.org>
>> -+ */
>> -+#ifndef GLAMO_BO_GEM_H
>> -+#define GLAMO_BO_GEM_H
>> -+
>> -+#include "glamo_bo.h"
>> -+
>> -+struct glamo_bo_manager *glamo_bo_manager_gem_ctor(int fd);
>> -+void glamo_bo_manager_gem_dtor(struct glamo_bo_manager *bom);
>> -+int glamo_gem_name_buffer(struct glamo_bo *bo, uint32_t *name);
>> -+uint32_t glamo_gem_get_name(struct glamo_bo *bo);
>> -+extern int glamo_bo_subdata(struct glamo_bo *bo, unsigned long offset,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unsigned long =
size, const void *data);
>> -+#endif
>> -diff --git a/glamo/glamo_track.c b/glamo/glamo_track.c
>> -new file mode 100644
>> -index 0000000..27ffe41
>> ---- /dev/null
>> -+++ b/glamo/glamo_track.c
>> -@@ -0,0 +1,140 @@
>> -+/*
>> -+ * Copyright =A9 2008 J=E9r=F4me Glisse
>> -+ * All Rights Reserved.
>> -+ *
>> -+ * Permission is hereby granted, free of charge, to any person obtaini=
ng
>> -+ * a copy of this software and associated documentation files (the
>> -+ * "Software"), to deal in the Software without restriction, including
>> -+ * without limitation the rights to use, copy, modify, merge, publish,
>> -+ * distribute, sub license, and/or sell copies of the Software, and to
>> -+ * permit persons to whom the Software is furnished to do so, subject =
to
>> -+ * the following conditions:
>> -+ *
>> -+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
>> -+ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
>> -+ * OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
>> -+ * NON-INFRINGEMENT. IN NO EVENT SHALL THE COPYRIGHT HOLDERS, AUTHORS
>> -+ * AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
>> -+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
>> -+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
>> -+ * USE OR OTHER DEALINGS IN THE SOFTWARE.
>> -+ *
>> -+ * The above copyright notice and this permission notice (including th=
e
>> -+ * next paragraph) shall be included in all copies or substantial port=
ions
>> -+ * of the Software.
>> -+ */
>> -+/*
>> -+ * Authors:
>> -+ * =A0 =A0 =A0J=E9r=F4me Glisse <glisse@freedesktop.org>
>> -+ */
>> -+#include <stdio.h>
>> -+#include <stdlib.h>
>> -+#include <string.h>
>> -+#include "glamo_track.h"
>> -+
>> -+void glamo_track_add_event(struct glamo_track *track,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0const char *fi=
le,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0const char *fu=
nc,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0const char *op=
,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unsigned line)
>> -+{
>> -+ =A0 =A0struct glamo_track_event *event;
>> -+
>> -+ =A0 =A0if (track =3D=3D NULL) {
>> -+ =A0 =A0 =A0 =A0return;
>> -+ =A0 =A0}
>> -+ =A0 =A0event =3D (void*)calloc(1,sizeof(struct glamo_track_event));
>> -+ =A0 =A0if (event =3D=3D NULL) {
>> -+ =A0 =A0 =A0 =A0return;
>> -+ =A0 =A0}
>> -+ =A0 =A0event->line =3D line;
>> -+ =A0 =A0event->file =3D strdup(file);
>> -+ =A0 =A0event->func =3D strdup(func);
>> -+ =A0 =A0event->op =3D strdup(op);
>> -+ =A0 =A0if (event->file =3D=3D NULL || event->func =3D=3D NULL || even=
t->op =3D=3D NULL) {
>> -+ =A0 =A0 =A0 =A0free(event->file);
>> -+ =A0 =A0 =A0 =A0free(event->func);
>> -+ =A0 =A0 =A0 =A0free(event->op);
>> -+ =A0 =A0 =A0 =A0free(event);
>> -+ =A0 =A0 =A0 =A0return;
>> -+ =A0 =A0}
>> -+ =A0 =A0event->next =3D track->events;
>> -+ =A0 =A0track->events =3D event;
>> -+}
>> -+
>> -+struct glamo_track *glamo_tracker_add_track(struct glamo_tracker *trac=
ker,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0unsigned key)
>> -+{
>> -+ =A0 =A0struct glamo_track *track;
>> -+
>> -+ =A0 =A0track =3D (struct glamo_track*)calloc(1, sizeof(struct glamo_t=
rack));
>> -+ =A0 =A0if (track) {
>> -+ =A0 =A0 =A0 =A0track->next =3D tracker->tracks.next;
>> -+ =A0 =A0 =A0 =A0track->prev =3D &tracker->tracks;
>> -+ =A0 =A0 =A0 =A0tracker->tracks.next =3D track;
>> -+ =A0 =A0 =A0 =A0if (track->next) {
>> -+ =A0 =A0 =A0 =A0 =A0 =A0track->next->prev =3D track;
>> -+ =A0 =A0 =A0 =A0}
>> -+ =A0 =A0 =A0 =A0track->key =3D key;
>> -+ =A0 =A0 =A0 =A0track->events =3D NULL;
>> -+ =A0 =A0}
>> -+ =A0 =A0return track;
>> -+}
>> -+
>> -+void glamo_tracker_remove_track(struct glamo_tracker *tracker,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struc=
t glamo_track *track)
>> -+{
>> -+ =A0 =A0struct glamo_track_event *event;
>> -+ =A0 =A0void *tmp;
>> -+
>> -+ =A0 =A0if (track =3D=3D NULL) {
>> -+ =A0 =A0 =A0 =A0return;
>> -+ =A0 =A0}
>> -+ =A0 =A0track->prev->next =3D track->next;
>> -+ =A0 =A0if (track->next) {
>> -+ =A0 =A0 =A0 =A0track->next->prev =3D track->prev;
>> -+ =A0 =A0}
>> -+ =A0 =A0track->next =3D track->prev =3D NULL;
>> -+ =A0 =A0event =3D track->events;
>> -+ =A0 =A0while (event) {
>> -+ =A0 =A0 =A0 =A0tmp =3D event;
>> -+ =A0 =A0 =A0 =A0free(event->file);
>> -+ =A0 =A0 =A0 =A0free(event->func);
>> -+ =A0 =A0 =A0 =A0free(event->op);
>> -+ =A0 =A0 =A0 =A0event =3D event->next;
>> -+ =A0 =A0 =A0 =A0free(tmp);
>> -+ =A0 =A0}
>> -+ =A0 =A0track->events =3D NULL;
>> -+ =A0 =A0free(track);
>> -+}
>> -+
>> -+void glamo_tracker_print(struct glamo_tracker *tracker, FILE *file)
>> -+{
>> -+ =A0 =A0struct glamo_track *track;
>> -+ =A0 =A0struct glamo_track_event *event;
>> -+ =A0 =A0void *tmp;
>> -+
>> -+ =A0 =A0track =3D tracker->tracks.next;
>> -+ =A0 =A0while (track) {
>> -+ =A0 =A0 =A0 =A0event =3D track->events;
>> -+ =A0 =A0 =A0 =A0fprintf(file, "[0x%08X] :\n", track->key);
>> -+ =A0 =A0 =A0 =A0while (event) {
>> -+ =A0 =A0 =A0 =A0 =A0 =A0tmp =3D event;
>> -+ =A0 =A0 =A0 =A0 =A0 =A0fprintf(file, " =A0[0x%08X:%s](%s:%s:%d)\n",
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0track->key, event->op, =A0even=
t->file,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0event->func, event->line);
>> -+ =A0 =A0 =A0 =A0 =A0 =A0free(event->file);
>> -+ =A0 =A0 =A0 =A0 =A0 =A0free(event->func);
>> -+ =A0 =A0 =A0 =A0 =A0 =A0free(event->op);
>> -+ =A0 =A0 =A0 =A0 =A0 =A0event->file =3D NULL;
>> -+ =A0 =A0 =A0 =A0 =A0 =A0event->func =3D NULL;
>> -+ =A0 =A0 =A0 =A0 =A0 =A0event->op =3D NULL;
>> -+ =A0 =A0 =A0 =A0 =A0 =A0event =3D event->next;
>> -+ =A0 =A0 =A0 =A0 =A0 =A0free(tmp);
>> -+ =A0 =A0 =A0 =A0}
>> -+ =A0 =A0 =A0 =A0track->events =3D NULL;
>> -+ =A0 =A0 =A0 =A0tmp =3D track;
>> -+ =A0 =A0 =A0 =A0track =3D track->next;
>> -+ =A0 =A0 =A0 =A0free(tmp);
>> -+ =A0 =A0}
>> -+}
>> -diff --git a/glamo/glamo_track.h b/glamo/glamo_track.h
>> -new file mode 100644
>> -index 0000000..fedead7
>> ---- /dev/null
>> -+++ b/glamo/glamo_track.h
>> -@@ -0,0 +1,64 @@
>> -+/*
>> -+ * Copyright =A9 2008 J=E9r=F4me Glisse
>> -+ * All Rights Reserved.
>> -+ *
>> -+ * Permission is hereby granted, free of charge, to any person obtaini=
ng
>> -+ * a copy of this software and associated documentation files (the
>> -+ * "Software"), to deal in the Software without restriction, including
>> -+ * without limitation the rights to use, copy, modify, merge, publish,
>> -+ * distribute, sub license, and/or sell copies of the Software, and to
>> -+ * permit persons to whom the Software is furnished to do so, subject =
to
>> -+ * the following conditions:
>> -+ *
>> -+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
>> -+ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
>> -+ * OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
>> -+ * NON-INFRINGEMENT. IN NO EVENT SHALL THE COPYRIGHT HOLDERS, AUTHORS
>> -+ * AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
>> -+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
>> -+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
>> -+ * USE OR OTHER DEALINGS IN THE SOFTWARE.
>> -+ *
>> -+ * The above copyright notice and this permission notice (including th=
e
>> -+ * next paragraph) shall be included in all copies or substantial port=
ions
>> -+ * of the Software.
>> -+ */
>> -+/*
>> -+ * Authors:
>> -+ * =A0 =A0 =A0J=E9r=F4me Glisse <glisse@freedesktop.org>
>> -+ */
>> -+#ifndef GLAMO_TRACK_H
>> -+#define GLAMO_TRACK_H
>> -+
>> -+struct glamo_track_event {
>> -+ =A0 =A0struct glamo_track_event =A0 *next;
>> -+ =A0 =A0char =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*file;
>> -+ =A0 =A0char =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*func;
>> -+ =A0 =A0char =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*op;
>> -+ =A0 =A0unsigned =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0line;
>> -+};
>> -+
>> -+struct glamo_track {
>> -+ =A0 =A0struct glamo_track =A0 =A0 =A0 =A0 *next;
>> -+ =A0 =A0struct glamo_track =A0 =A0 =A0 =A0 *prev;
>> -+ =A0 =A0unsigned =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0key;
>> -+ =A0 =A0struct glamo_track_event =A0 *events;
>> -+};
>> -+
>> -+struct glamo_tracker {
>> -+ =A0 =A0struct glamo_track =A0 =A0 =A0 =A0 tracks;
>> -+};
>> -+
>> -+void glamo_track_add_event(struct glamo_track *track,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0const char *fi=
le,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0const char *fu=
nc,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0const char *op=
,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unsigned line)=
;
>> -+struct glamo_track *glamo_tracker_add_track(struct glamo_tracker *trac=
ker,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0unsigned key);
>> -+void glamo_tracker_remove_track(struct glamo_tracker *tracker,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struc=
t glamo_track *track);
>> -+void glamo_tracker_print(struct glamo_tracker *tracker,
>> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0FILE *file);
>> -+
>> -+#endif
>> -diff --git a/glamo/libdrm_glamo.pc.in b/glamo/libdrm_glamo.pc.in
>> -new file mode 100644
>> -index 0000000..d4d8e70
>> ---- /dev/null
>> -+++ b/glamo/libdrm_glamo.pc.in
>> -@@ -0,0 +1,10 @@
>> -+prefix=3D@prefix@
>> -+exec_prefix=3D@exec_prefix@
>> -+libdir=3D@libdir@
>> -+includedir=3D@includedir@
>> -+
>> -+Name: libdrm_glamo
>> -+Description: Userspace interface to kernel DRM services for Glamo
>> -+Version: 1.0.1
>> -+Libs: -L${libdir} -ldrm_glamo
>> -+Cflags: -I${includedir} -I${includedir}/libdrm
>> -diff --git a/include/drm/Makefile.am b/include/drm/Makefile.am
>> -index 43695bd..f3f7edf 100644
>> ---- a/include/drm/Makefile.am
>> -+++ b/include/drm/Makefile.am
>> -@@ -35,6 +35,7 @@ klibdrminclude_HEADERS =3D \
>> - =A0 =A0 =A0 savage_drm.h \
>> - =A0 =A0 =A0 sis_drm.h \
>> - =A0 =A0 =A0 via_drm.h \
>> -+ =A0 =A0 =A0glamo_drm.h \
>> - =A0 =A0 =A0 mach64_drm.h
>> -
>> -
>> -diff --git a/include/drm/glamo_drm.h b/include/drm/glamo_drm.h
>> -new file mode 100644
>> -index 0000000..7629ebc
>> ---- /dev/null
>> -+++ b/include/drm/glamo_drm.h
>> -@@ -0,0 +1,153 @@
>> -+/* glamo_drm.h -- Public header for the Glamo driver
>> -+ *
>> -+ * Copyright 2009 Thomas White
>> -+ * Copyright 2000 Precision Insight, Inc., Cedar Park, Texas.
>> -+ * Copyright 2000 VA Linux Systems, Inc., Fremont, California.
>> -+ * Copyright 2002 Tungsten Graphics, Inc., Cedar Park, Texas.
>> -+ * All rights reserved.
>> -+ *
>> -+ * Permission is hereby granted, free of charge, to any person obtaini=
ng a
>> -+ * copy of this software and associated documentation files (the "Soft=
ware"),
>> -+ * to deal in the Software without restriction, including without limi=
tation
>> -+ * the rights to use, copy, modify, merge, publish, distribute, sublic=
ense,
>> -+ * and/or sell copies of the Software, and to permit persons to whom t=
he
>> -+ * Software is furnished to do so, subject to the following conditions=
:
>> -+ *
>> -+ * The above copyright notice and this permission notice (including th=
e next
>> -+ * paragraph) shall be included in all copies or substantial portions =
of the
>> -+ * Software.
>> -+ *
>> -+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXP=
RESS OR
>> -+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABI=
LITY,
>> -+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. =A0IN NO EVEN=
T SHALL
>> -+ * PRECISION INSIGHT AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAM=
AGES OR
>> -+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWIS=
E,
>> -+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE =
OR OTHER
>> -+ * DEALINGS IN THE SOFTWARE.
>> -+ *
>> -+ * Authors:
>> -+ * =A0 =A0Thomas White <taw@bitwiz.org.uk>
>> -+ * =A0 =A0Kevin E. Martin <martin@valinux.com>
>> -+ * =A0 =A0Gareth Hughes <gareth@valinux.com>
>> -+ * =A0 =A0Keith Whitwell <keith@tungstengraphics.com>
>> -+ */
>> -+
>> -+#ifndef __GLAMO_DRM_H__
>> -+#define __GLAMO_DRM_H__
>> -+
>> -+#include "drm.h"
>> -+
>> -+#define GLAMO_GEM_DOMAIN_VRAM (0x1)
>> -+
>> -+/* Glamo specific ioctls */
>> -+#define DRM_GLAMO_CMDBUF =A0 =A0 0x01
>> -+#define DRM_GLAMO_SWAP =A0 =A0 =A0 0x02
>> -+#define DRM_GLAMO_CMDBURST =A0 0x03
>> -+
>> -+#define DRM_GLAMO_GEM_INFO =A0 =A0 0x1c
>> -+#define DRM_GLAMO_GEM_CREATE =A0 0x1d
>> -+#define DRM_GLAMO_GEM_MMAP =A0 =A0 0x1e
>> -+#define DRM_GLAMO_GEM_PIN =A0 =A0 =A00x1f
>> -+#define DRM_GLAMO_GEM_UNPIN =A0 =A00x20
>> -+#define DRM_GLAMO_GEM_PREAD =A0 =A00x21
>> -+#define DRM_GLAMO_GEM_PWRITE =A0 0x22
>> -+#define DRM_GLAMO_GEM_WAIT_RENDERING 0x24
>> -+
>> -+#define DRM_IOCTL_GLAMO_CMDBUF =A0 =A0 DRM_IOW(DRM_COMMAND_BASE + DRM_=
GLAMO_CMDBUF, drm_glamo_cmd_buffer_t)
>> -+#define DRM_IOCTL_GLAMO_SWAP =A0 =A0 =A0 DRM_IO(DRM_COMMAND_BASE + DRM=
_GLAMO_SWAP)
>> -+#define DRM_IOCTL_GLAMO_CMDBURST =A0 =A0 DRM_IOW(DRM_COMMAND_BASE + DR=
M_GLAMO_CMDBURST, drm_glamo_cmd_burst_t)
>> -+
>> -+#define DRM_IOCTL_GLAMO_GEM_INFO =A0 DRM_IOWR(DRM_COMMAND_BASE + DRM_G=
LAMO_GEM_INFO, struct drm_glamo_gem_info)
>> -+#define DRM_IOCTL_GLAMO_GEM_CREATE DRM_IOWR(DRM_COMMAND_BASE + DRM_GLA=
MO_GEM_CREATE, struct drm_glamo_gem_create)
>> -+#define DRM_IOCTL_GLAMO_GEM_MMAP =A0 DRM_IOWR(DRM_COMMAND_BASE + DRM_G=
LAMO_GEM_MMAP, struct drm_glamo_gem_mmap)
>> -+#define DRM_IOCTL_GLAMO_GEM_PIN =A0 =A0DRM_IOWR(DRM_COMMAND_BASE + DRM=
_GLAMO_GEM_PIN, struct drm_glamo_gem_pin)
>> -+#define DRM_IOCTL_GLAMO_GEM_UNPIN =A0DRM_IOWR(DRM_COMMAND_BASE + DRM_G=
LAMO_GEM_UNPIN, struct drm_glamo_gem_unpin)
>> -+#define DRM_IOCTL_GLAMO_GEM_PREAD =A0DRM_IOWR(DRM_COMMAND_BASE + DRM_G=
LAMO_GEM_PREAD, struct drm_glamo_gem_pread)
>> -+#define DRM_IOCTL_GLAMO_GEM_PWRITE DRM_IOWR(DRM_COMMAND_BASE + DRM_GLA=
MO_GEM_PWRITE, struct drm_glamo_gem_pwrite)
>> -+#define DRM_IOCTL_GLAMO_GEM_WAIT_RENDERING DRM_IOW(DRM_COMMAND_BASE + =
DRM_GLAMO_GEM_WAIT_RENDERING, struct drm_glamo_gem_wait_rendering)
>> -+
>> -+
>> -+/* Simple command submission - a list of 16-bit address-data pairs */
>> -+typedef struct drm_glamo_cmd_buffer {
>> -+ =A0 =A0 =A0unsigned int bufsz; =A0 =A0 /* Size of buffer, in bytes */
>> -+ =A0 =A0 =A0char *buf; =A0 =A0 =A0 =A0 =A0 =A0 =A0/* Buffer of stuff t=
o go onto the ring buffer */
>> -+ =A0 =A0 =A0unsigned int *obj_pos; =A0/* Offsets (in bytes) at which t=
o put objs */
>> -+ =A0 =A0 =A0uint32_t *objs; =A0 =A0 =A0 =A0 /* List of buffer object (=
handles) to use */
>> -+ =A0 =A0 =A0unsigned int nobjs; =A0 =A0 /* Number of objects reference=
d */
>> -+ =A0 =A0 =A0int nbox;
>> -+ =A0 =A0 =A0struct drm_clip_rect *boxes;
>> -+} drm_glamo_cmd_buffer_t;
>> -+
>> -+
>> -+/* Burst command submission - base address and data:
>> -+ * =A0- Data can be 32-bit (more easily)
>> -+ * =A0- Easier for the kernel to validate */
>> -+typedef struct drm_glamo_cmd_burst {
>> -+ =A0 =A0 =A0uint16_t base; =A0 =A0 =A0 =A0 =A0/* Base address (command=
) */
>> -+ =A0 =A0 =A0int bufsz; =A0 =A0 =A0 =A0 =A0 =A0 =A0/* Size of data, in =
bytes */
>> -+ =A0 =A0 =A0uint16_t *data; =A0 =A0 =A0 =A0 /* Pointer to data */
>> -+ =A0 =A0 =A0unsigned int *obj_pos; =A0/* Offsets (in bytes) at which t=
o put objs */
>> -+ =A0 =A0 =A0uint32_t *objs; =A0 =A0 =A0 =A0 /* List of buffer object (=
handles) to use */
>> -+ =A0 =A0 =A0unsigned int nobjs; =A0 =A0 /* Number of objects reference=
d */
>> -+} drm_glamo_cmd_burst_t;
>> -+
>> -+struct drm_glamo_gem_info {
>> -+ =A0 =A0 =A0uint64_t vram_start;
>> -+ =A0 =A0 =A0uint64_t vram_size;
>> -+};
>> -+
>> -+struct drm_glamo_gem_create {
>> -+ =A0 =A0 =A0uint64_t size;
>> -+ =A0 =A0 =A0uint64_t alignment;
>> -+ =A0 =A0 =A0uint32_t handle;
>> -+ =A0 =A0 =A0uint32_t initial_domain; // to allow VRAM to be created
>> -+ =A0 =A0 =A0uint32_t no_backing_store;
>> -+};
>> -+
>> -+struct drm_glamo_gem_mmap {
>> -+ =A0 =A0 =A0uint32_t handle; =A0 =A0 =A0 =A0/* Handle goes in... */
>> -+ =A0 =A0 =A0uint64_t offset; =A0 =A0 =A0 =A0/* ...offset comes out */
>> -+};
>> -+
>> -+struct drm_glamo_gem_wait_rendering {
>> -+ =A0 =A0 =A0uint32_t handle;
>> -+ =A0 =A0 =A0int have_handle;
>> -+};
>> -+
>> -+struct drm_glamo_gem_pin {
>> -+ =A0 =A0 =A0uint32_t handle;
>> -+ =A0 =A0 =A0uint32_t pin_domain;
>> -+ =A0 =A0 =A0uint64_t alignment;
>> -+ =A0 =A0 =A0uint64_t offset;
>> -+};
>> -+
>> -+struct drm_glamo_gem_unpin {
>> -+ =A0 =A0 =A0uint32_t handle;
>> -+ =A0 =A0 =A0uint32_t pad;
>> -+};
>> -+
>> -+struct drm_glamo_gem_pread {
>> -+ =A0 =A0 =A0/** Handle for the object being read. */
>> -+ =A0 =A0 =A0uint32_t handle;
>> -+ =A0 =A0 =A0uint32_t pad;
>> -+ =A0 =A0 =A0/** Offset into the object to read from */
>> -+ =A0 =A0 =A0uint64_t offset;
>> -+ =A0 =A0 =A0/** Length of data to read */
>> -+ =A0 =A0 =A0uint64_t size;
>> -+ =A0 =A0 =A0/** Pointer to write the data into. */
>> -+ =A0 =A0 =A0uint64_t data_ptr; =A0 =A0 =A0/* void *, but pointers are =
not 32/64 compatible */
>> -+};
>> -+
>> -+struct drm_glamo_gem_pwrite {
>> -+ =A0 =A0 =A0/** Handle for the object being written to. */
>> -+ =A0 =A0 =A0uint32_t handle;
>> -+ =A0 =A0 =A0uint32_t pad;
>> -+ =A0 =A0 =A0/** Offset into the object to write to */
>> -+ =A0 =A0 =A0uint64_t offset;
>> -+ =A0 =A0 =A0/** Length of data to write */
>> -+ =A0 =A0 =A0uint64_t size;
>> -+ =A0 =A0 =A0/** Pointer to read the data from. */
>> -+ =A0 =A0 =A0uint64_t data_ptr; =A0 =A0 =A0/* void *, but pointers are =
not 32/64 compatible */
>> -+};
>> -+
>> -+#endif
>> diff --git a/recipes/dri/libdrm.inc b/recipes/dri/libdrm.inc
>> index 9772e5c..b8015ca 100644
>> --- a/recipes/dri/libdrm.inc
>> +++ b/recipes/dri/libdrm.inc
>> @@ -2,14 +2,19 @@ SECTION =3D "x11/base"
>> =A0LICENSE =3D "MIT"
>> =A0SRC_URI =3D "http://dri.freedesktop.org/libdrm/libdrm-${PV}.tar.bz2"
>> =A0PROVIDES =3D "drm"
>> +DEPENDS =3D "libpthread-stubs"
>>
>> =A0INC_PR =3D "r6"
>> =A0PE =3D "1"
>>
>> =A0inherit autotools pkgconfig
>>
>> -PACKAGES =3D+ "${PN}-drivers ${PN}-kms"
>> +PACKAGES =3D+ "${PN}-drivers ${PN}-kms ${@base_contains('MACHINE_FEATUR=
ES', 'x86', '${PN}-intel', '',d)}"
>> =A0FILES_${PN}-drivers =3D "${libdir}/libdrm_*.so.*"
>> +FILES_${PN}-intel =3D "${libdir}/libdrm_intel.so.*"
>> =A0FILES_${PN}-kms =3D "${libdir}/libkms*.so.*"
>>
>> +EXTRA_OECONF_append =3D " ${@base_contains('MACHINE_FEATURES', 'x86', '=
', '--disable-intel --disable-radeon',d)}"
>> +EXTRA_OECONF_append_shr =3D " --enable-glamo-experimental-api"
>> +
>> =A0LEAD_SONAME =3D "libdrm.so"
>> diff --git a/recipes/dri/libdrm_2.3.0.bb b/recipes/dri/libdrm_2.3.0.bb
>> deleted file mode 100644
>> index 1d7046b..0000000
>> --- a/recipes/dri/libdrm_2.3.0.bb
>> +++ /dev/null
>> @@ -1,6 +0,0 @@
>> -require libdrm.inc
>> -
>> -PR =3D "${INC_PR}.0"
>> -
>> -SRC_URI[md5sum] =3D "01a1e1ee0268a2403db42fa630036ab2"
>> -SRC_URI[sha256sum] =3D "f8c711427fea50845811360c92f6350ff3dacb953374147=
0d54ae5d0a2f6848e"
>> diff --git a/recipes/dri/libdrm_2.3.1.bb b/recipes/dri/libdrm_2.3.1.bb
>> deleted file mode 100644
>> index dc0e91e..0000000
>> --- a/recipes/dri/libdrm_2.3.1.bb
>> +++ /dev/null
>> @@ -1,6 +0,0 @@
>> -require libdrm.inc
>> -
>> -PR =3D "${INC_PR}.0"
>> -
>> -SRC_URI[md5sum] =3D "620fe7dd02c3236c3e9881a3a238173d"
>> -SRC_URI[sha256sum] =3D "ddfd398383729707846e1f1689e9acb3bc672e4f255a632=
c8f0d0c55ddf8718c"
>> diff --git a/recipes/dri/libdrm_2.4.11.bb b/recipes/dri/libdrm_2.4.11.bb
>> deleted file mode 100644
>> index e49d6a2..0000000
>> --- a/recipes/dri/libdrm_2.4.11.bb
>> +++ /dev/null
>> @@ -1,10 +0,0 @@
>> -require libdrm.inc
>> -
>> -PR =3D "${INC_PR}.0"
>> -
>> -PACKAGES =3D+ "${PN}-intel"
>> -
>> -FILES_${PN}-intel =3D "${libdir}/libdrm_intel.so.*"
>> -
>> -SRC_URI[md5sum] =3D "e0e66fae165d0b665b61e9516bf33ade"
>> -SRC_URI[sha256sum] =3D "5e07ec4b644f50160900d4281a74dd1cbf1535cfe4ab24e=
0c28ae5b038836a8c"
>> diff --git a/recipes/dri/libdrm_2.4.17.bb b/recipes/dri/libdrm_2.4.17.bb
>> deleted file mode 100644
>> index 902db02..0000000
>> --- a/recipes/dri/libdrm_2.4.17.bb
>> +++ /dev/null
>> @@ -1,12 +0,0 @@
>> -require libdrm.inc
>> -
>> -PR =3D "${INC_PR}.0"
>> -
>> -EXTRA_OECONF_append =3D " ${@base_contains('MACHINE_FEATURES', 'x86', '=
', '--disable-intel',d)}"
>> -
>> -PACKAGES =3D+ "${@base_contains('MACHINE_FEATURES', 'x86', '${PN}-intel=
', '',d)}"
>> -
>> -FILES_${PN}-intel =3D "${libdir}/libdrm_intel.so.*"
>> -
>> -SRC_URI[md5sum] =3D "667d81f993f7fd8a1b1b1b830a28a748"
>> -SRC_URI[sha256sum] =3D "b8a4e7c610b0e970546d791c06e28882857a49d34698633=
a89292d7ae142316a"
>> diff --git a/recipes/dri/libdrm_2.4.18.bb b/recipes/dri/libdrm_2.4.18.bb
>> deleted file mode 100644
>> index 27c82c2..0000000
>> --- a/recipes/dri/libdrm_2.4.18.bb
>> +++ /dev/null
>> @@ -1,15 +0,0 @@
>> -require libdrm.inc
>> -
>> -DEPENDS =3D "libpthread-stubs"
>> -
>> -PR =3D "${INC_PR}.0"
>> -
>> -SRC_URI[md5sum] =3D "d2b5fbfd37742af7d2169f7d26ce3007"
>> -SRC_URI[sha256sum] =3D "f6c5b44fff5cb602096cc48a1bced426496bc8060463c57=
7a7d86f2e56eeb604"
>> -
>> -
>> -EXTRA_OECONF_append =3D " ${@base_contains('MACHINE_FEATURES', 'x86', '=
', '--disable-intel',d)}"
>> -
>> -PACKAGES =3D+ "${@base_contains('MACHINE_FEATURES', 'x86', '${PN}-intel=
', '',d)}"
>> -
>> -FILES_${PN}-intel =3D "${libdir}/libdrm_intel.so.*"
>> diff --git a/recipes/dri/libdrm_2.4.21.bb b/recipes/dri/libdrm_2.4.21.bb
>> deleted file mode 100644
>> index 5102933..0000000
>> --- a/recipes/dri/libdrm_2.4.21.bb
>> +++ /dev/null
>> @@ -1,19 +0,0 @@
>> -require libdrm.inc
>> -
>> -DEPENDS =3D "libpthread-stubs"
>> -
>> -PR =3D "${INC_PR}.1"
>> -
>> -SRC_URI +=3D "file://glamo.patch"
>> -
>> -SRC_URI[md5sum] =3D "273ed9dad986e3a931649f3d8762ff74"
>> -SRC_URI[sha256sum] =3D "4e1b612ba3b6b1deae4a8c14946099283e7a00e48a5ab00=
2eaf4312f5a8ba14b"
>> -
>> -EXTRA_OECONF_append =3D " ${@base_contains('MACHINE_FEATURES', 'x86', '=
', '--disable-intel',d)}"
>> -EXTRA_OECONF_append_shr =3D " --enable-glamo-experimental-api --disable=
-radeon --disable-intel"
>> -
>> -EXTRA_OECONF_append_angstrom =3D " --disable-radeon "
>> -
>> -PACKAGES =3D+ "${@base_contains('MACHINE_FEATURES', 'x86', '${PN}-intel=
', '',d)}"
>> -
>> -FILES_${PN}-intel =3D "${libdir}/libdrm_intel.so.*"
>> diff --git a/recipes/dri/libdrm_2.4.22.bb b/recipes/dri/libdrm_2.4.22.bb
>> deleted file mode 100644
>> index fb94e4c..0000000
>> --- a/recipes/dri/libdrm_2.4.22.bb
>> +++ /dev/null
>> @@ -1,25 +0,0 @@
>> -require libdrm.inc
>> -
>> -DEPENDS =3D "libpthread-stubs"
>> -
>> -PR =3D "${INC_PR}.0"
>> -
>> -SRC_URI +=3D "file://glamo.patch"
>> -
>> -SRC_URI[md5sum] =3D "3bdfa33f35d1c902e5115cceb5500c83"
>> -SRC_URI[sha256sum] =3D "0bb0e594e4094d9000d80f38e96e8f640b6364f96cfef5b=
970cf4481443c6b3d"
>> -
>> -EXTRA_OECONF_append =3D " ${@base_contains('MACHINE_FEATURES', 'x86', '=
', '--disable-intel',d)}"
>> -EXTRA_OECONF_append_shr =3D " --enable-glamo-experimental-api --disable=
-radeon --disable-intel"
>> -
>> -EXTRA_OECONF_append_angstrom =3D " --disable-radeon "
>> -
>> -PACKAGES =3D+ "${@base_contains('MACHINE_FEATURES', 'x86', '${PN}-intel=
', '',d)}"
>> -
>> -FILES_${PN}-intel =3D "${libdir}/libdrm_intel.so.*"
>> -
>> -do_compile_prepend_libc-uclibc() {
>> - =A0 =A0 =A0 eval "${@base_contains('DISTRO_FEATURES', 'largefile', '',=
 'sed -i -e "/_FILE_OFFSET_BITS/d" ${S}/libkms/intel.c', d)}"
>> - =A0 =A0 =A0 eval "${@base_contains('DISTRO_FEATURES', 'largefile', '',=
 'sed -i -e "/_FILE_OFFSET_BITS/d" ${S}/libkms/vmwgfx.c', d)}"
>> - =A0 =A0 =A0 eval "${@base_contains('DISTRO_FEATURES', 'largefile', '',=
 'sed -i -e "/_FILE_OFFSET_BITS/d" ${S}/libkms/nouveau.c', d)}"
>> -}
>> diff --git a/recipes/dri/libdrm_2.4.23.bb b/recipes/dri/libdrm_2.4.23.bb
>> index 5233256..f4feae5 100644
>> --- a/recipes/dri/libdrm_2.4.23.bb
>> +++ b/recipes/dri/libdrm_2.4.23.bb
>> @@ -1,7 +1,5 @@
>> =A0require libdrm.inc
>>
>> -DEPENDS =3D "libpthread-stubs"
>> -
>> =A0PR =3D "${INC_PR}.0"
>>
>> =A0SRC_URI +=3D "file://glamo.patch"
>> @@ -9,15 +7,6 @@ SRC_URI +=3D "file://glamo.patch"
>> =A0SRC_URI[md5sum] =3D "7577ff36ec364d88fae466d4f7fc5fc6"
>> =A0SRC_URI[sha256sum] =3D "c0f06d68c3edba7a1ad937f5481a8c287efd4cd368cee=
66cd9e678b06a911c18"
>>
>> -EXTRA_OECONF_append =3D " ${@base_contains('MACHINE_FEATURES', 'x86', '=
', '--disable-intel',d)}"
>> -EXTRA_OECONF_append_shr =3D " --enable-glamo-experimental-api --disable=
-radeon --disable-intel"
>> -
>> -EXTRA_OECONF_append_angstrom =3D " --disable-radeon "
>> -
>> -PACKAGES =3D+ "${@base_contains('MACHINE_FEATURES', 'x86', '${PN}-intel=
', '',d)}"
>> -
>> -FILES_${PN}-intel =3D "${libdir}/libdrm_intel.so.*"
>> -
>> =A0do_compile_prepend_libc-uclibc() {
>> =A0 =A0 =A0 =A0eval "${@base_contains('DISTRO_FEATURES', 'largefile', ''=
, 'sed -i -e "/_FILE_OFFSET_BITS/d" ${S}/libkms/intel.c', d)}"
>> =A0 =A0 =A0 =A0eval "${@base_contains('DISTRO_FEATURES', 'largefile', ''=
, 'sed -i -e "/_FILE_OFFSET_BITS/d" ${S}/libkms/vmwgfx.c', d)}"
>> --
>> 1.7.3.3
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


