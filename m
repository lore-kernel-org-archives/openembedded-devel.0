Received: from mail-bw0-f226.google.com ([209.85.218.226])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1NneZM-0001jM-8B
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Mar 2010 21:56:31 +0100
Received: by bwz26 with SMTP id 26so533955bwz.27
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Mar 2010 12:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:cc
	:subject:message-id:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=eUftSKk5bnUhB1E7VjnEiSiR7ZEQMKJzkLfsTRXrPp0=;
	b=TZuJJ2zJLyHiMDSOl2donHE6LGP+CWoFL4aNd2uN4aCvlM4GfGFuBmhjM3Kf//3VQt
	vthIQlHWVRZO52HfVmbas7Fh8Sh7RcVePfAu8DgGmMhzHF9TRt4ufL7pXU5h25dmcL4d
	4GC/Hy7oPvHJRlIK0N6lgnA0b7gZP5HlmE2/Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=w4RFx0y9jiNxWjmADaD01j06jZ6Kc6XqMyIcCpWwQ8nI8GrAQGNmefvV8SHnbM5xu7
	zbulJjQOgdS4imE/4D74KYLJuuhNNit9iOFJsUSdetnlmN8oFVpKZfmnMFaJZ5I3ltkN
	M57aqUWAOK7atNU+wt4fe7yBr7A5LVeDHfTik=
Received: by 10.204.141.78 with SMTP id l14mr608773bku.50.1267822408835;
	Fri, 05 Mar 2010 12:53:28 -0800 (PST)
Received: from s42.loc ([84.119.103.202])
	by mx.google.com with ESMTPS id 13sm1524165bwz.3.2010.03.05.12.53.27
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 05 Mar 2010 12:53:27 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1Nnedz-0006Yj-P9; Fri, 05 Mar 2010 22:01:11 +0100
Date: Fri, 5 Mar 2010 22:01:11 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>, Khem Raj <raj.khem@gmail.com>
Message-ID: <20100305210111.GF7868@mx.loc>
References: <1266766390-28915-1-git-send-email-rep.dot.nop@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1266766390-28915-1-git-send-email-rep.dot.nop@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.218.226
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] bison: split inttypes*.m4 into separate patch
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
X-List-Received-Date: Fri, 05 Mar 2010 20:56:31 -0000
X-Groupsio-MsgNum: 17364
Content-Type: multipart/mixed; boundary="Nq2Wo0NMKNjxTN9z"
Content-Disposition: inline

--Nq2Wo0NMKNjxTN9z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Feb 21, 2010 at 04:33:10PM +0100, Bernhard Reutner-Fischer wrote:
>..to avoid conflicts with bison-2.4.1

ping? Should i send the respective 2.4.1 bump too?
Attaching them, S-O-B is the same and i don't claim anything, please consider..
TIA,
>Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
>---
> recipes/bison/bison_2.0.bb         |    4 ++-
> recipes/bison/bison_2.3.bb         |    4 ++-
> recipes/bison/files/inttypes.patch |   70 ++++++++++++++++++++++++++++++++++++
> recipes/bison/files/m4.patch       |   65 ---------------------------------
> 4 files changed, 76 insertions(+), 67 deletions(-)
> create mode 100644 recipes/bison/files/inttypes.patch
>
>diff --git a/recipes/bison/bison_2.0.bb b/recipes/bison/bison_2.0.bb
>index edf549f..db3db31 100644
>--- a/recipes/bison/bison_2.0.bb
>+++ b/recipes/bison/bison_2.0.bb
>@@ -5,6 +5,8 @@ SECTION = "devel"
> PRIORITY = "optional"
> 
> SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.gz \
>-	   file://m4.patch;patch=1"
>+	   file://m4.patch;patch=1 \
>+	   file://inttypes.patch;patch=1 \
>+	  "
> 
> inherit autotools
>diff --git a/recipes/bison/bison_2.3.bb b/recipes/bison/bison_2.3.bb
>index 729756b..66e5d58 100644
>--- a/recipes/bison/bison_2.3.bb
>+++ b/recipes/bison/bison_2.3.bb
>@@ -7,7 +7,9 @@ PRIORITY = "optional"
> PR = "r1"
> 
> SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.gz \
>-	   file://m4.patch;patch=1"
>+	   file://m4.patch;patch=1 \
>+	   file://inttypes.patch;patch=1 \
>+	  "
> 
> inherit autotools
> 
>diff --git a/recipes/bison/files/inttypes.patch b/recipes/bison/files/inttypes.patch
>new file mode 100644
>index 0000000..e583241
>--- /dev/null
>+++ b/recipes/bison/files/inttypes.patch
>@@ -0,0 +1,70 @@
>+
>+#
>+# Patch managed by http://www.mn-logistik.de/unsupported/pxa250/patcher
>+#
>+
>+--- /dev/null
>++++ bison-1.875/m4/inttypes-pri.m4
>+@@ -0,0 +1,32 @@
>++# inttypes-pri.m4 serial 1 (gettext-0.11.4)
>++dnl Copyright (C) 1997-2002 Free Software Foundation, Inc.
>++dnl This file is free software, distributed under the terms of the GNU
>++dnl General Public License.  As a special exception to the GNU General
>++dnl Public License, this file may be distributed as part of a program
>++dnl that contains a configuration script generated by Autoconf, under
>++dnl the same distribution terms as the rest of that program.
>++
>++dnl From Bruno Haible.
>++
>++# Define PRI_MACROS_BROKEN if <inttypes.h> exists and defines the PRI*
>++# macros to non-string values.  This is the case on AIX 4.3.3.
>++
>++AC_DEFUN([gt_INTTYPES_PRI],
>++[
>++  AC_REQUIRE([gt_HEADER_INTTYPES_H])
>++  if test $gt_cv_header_inttypes_h = yes; then
>++    AC_CACHE_CHECK([whether the inttypes.h PRIxNN macros are broken],
>++      gt_cv_inttypes_pri_broken,
>++      [
>++        AC_TRY_COMPILE([#include <inttypes.h>
>++#ifdef PRId32
>++char *p = PRId32;
>++#endif
>++], [], gt_cv_inttypes_pri_broken=no, gt_cv_inttypes_pri_broken=yes)
>++      ])
>++  fi
>++  if test "$gt_cv_inttypes_pri_broken" = yes; then
>++    AC_DEFINE_UNQUOTED(PRI_MACROS_BROKEN, 1,
>++      [Define if <inttypes.h> exists and defines unusable PRI* macros.])
>++  fi
>++])
>+--- /dev/null
>++++ bison-1.875/m4/inttypes.m4
>+@@ -0,0 +1,27 @@
>++# inttypes.m4 serial 1 (gettext-0.11.4)
>++dnl Copyright (C) 1997-2002 Free Software Foundation, Inc.
>++dnl This file is free software, distributed under the terms of the GNU
>++dnl General Public License.  As a special exception to the GNU General
>++dnl Public License, this file may be distributed as part of a program
>++dnl that contains a configuration script generated by Autoconf, under
>++dnl the same distribution terms as the rest of that program.
>++
>++dnl From Paul Eggert.
>++
>++# Define HAVE_INTTYPES_H if <inttypes.h> exists and doesn't clash with
>++# <sys/types.h>.
>++
>++AC_DEFUN([gt_HEADER_INTTYPES_H],
>++[
>++  AC_CACHE_CHECK([for inttypes.h], gt_cv_header_inttypes_h,
>++  [
>++    AC_TRY_COMPILE(
>++      [#include <sys/types.h>
>++#include <inttypes.h>],
>++      [], gt_cv_header_inttypes_h=yes, gt_cv_header_inttypes_h=no)
>++  ])
>++  if test $gt_cv_header_inttypes_h = yes; then
>++    AC_DEFINE_UNQUOTED(HAVE_INTTYPES_H, 1,
>++      [Define if <inttypes.h> exists and doesn't clash with <sys/types.h>.])
>++  fi
>++])
>diff --git a/recipes/bison/files/m4.patch b/recipes/bison/files/m4.patch
>index b62fe89..b060532 100644
>--- a/recipes/bison/files/m4.patch
>+++ b/recipes/bison/files/m4.patch
>@@ -4,41 +4,6 @@
> #
> 
> --- /dev/null
>-+++ bison-1.875/m4/inttypes-pri.m4
>-@@ -0,0 +1,32 @@
>-+# inttypes-pri.m4 serial 1 (gettext-0.11.4)
>-+dnl Copyright (C) 1997-2002 Free Software Foundation, Inc.
>-+dnl This file is free software, distributed under the terms of the GNU
>-+dnl General Public License.  As a special exception to the GNU General
>-+dnl Public License, this file may be distributed as part of a program
>-+dnl that contains a configuration script generated by Autoconf, under
>-+dnl the same distribution terms as the rest of that program.
>-+
>-+dnl From Bruno Haible.
>-+
>-+# Define PRI_MACROS_BROKEN if <inttypes.h> exists and defines the PRI*
>-+# macros to non-string values.  This is the case on AIX 4.3.3.
>-+
>-+AC_DEFUN([gt_INTTYPES_PRI],
>-+[
>-+  AC_REQUIRE([gt_HEADER_INTTYPES_H])
>-+  if test $gt_cv_header_inttypes_h = yes; then
>-+    AC_CACHE_CHECK([whether the inttypes.h PRIxNN macros are broken],
>-+      gt_cv_inttypes_pri_broken,
>-+      [
>-+        AC_TRY_COMPILE([#include <inttypes.h>
>-+#ifdef PRId32
>-+char *p = PRId32;
>-+#endif
>-+], [], gt_cv_inttypes_pri_broken=no, gt_cv_inttypes_pri_broken=yes)
>-+      ])
>-+  fi
>-+  if test "$gt_cv_inttypes_pri_broken" = yes; then
>-+    AC_DEFINE_UNQUOTED(PRI_MACROS_BROKEN, 1,
>-+      [Define if <inttypes.h> exists and defines unusable PRI* macros.])
>-+  fi
>-+])
>---- /dev/null
> +++ bison-1.875/m4/lcmessage.m4
> @@ -0,0 +1,32 @@
> +# lcmessage.m4 serial 3 (gettext-0.11.3)
>@@ -529,36 +494,6 @@
> +  rm -f conf.glibtest
> +])
> --- /dev/null
>-+++ bison-1.875/m4/inttypes.m4
>-@@ -0,0 +1,27 @@
>-+# inttypes.m4 serial 1 (gettext-0.11.4)
>-+dnl Copyright (C) 1997-2002 Free Software Foundation, Inc.
>-+dnl This file is free software, distributed under the terms of the GNU
>-+dnl General Public License.  As a special exception to the GNU General
>-+dnl Public License, this file may be distributed as part of a program
>-+dnl that contains a configuration script generated by Autoconf, under
>-+dnl the same distribution terms as the rest of that program.
>-+
>-+dnl From Paul Eggert.
>-+
>-+# Define HAVE_INTTYPES_H if <inttypes.h> exists and doesn't clash with
>-+# <sys/types.h>.
>-+
>-+AC_DEFUN([gt_HEADER_INTTYPES_H],
>-+[
>-+  AC_CACHE_CHECK([for inttypes.h], gt_cv_header_inttypes_h,
>-+  [
>-+    AC_TRY_COMPILE(
>-+      [#include <sys/types.h>
>-+#include <inttypes.h>],
>-+      [], gt_cv_header_inttypes_h=yes, gt_cv_header_inttypes_h=no)
>-+  ])
>-+  if test $gt_cv_header_inttypes_h = yes; then
>-+    AC_DEFINE_UNQUOTED(HAVE_INTTYPES_H, 1,
>-+      [Define if <inttypes.h> exists and doesn't clash with <sys/types.h>.])
>-+  fi
>-+])
>---- /dev/null
> +++ bison-1.875/m4/isc-posix.m4
> @@ -0,0 +1,26 @@
> +# isc-posix.m4 serial 2 (gettext-0.11.2)
>-- 
>1.6.6
>

--Nq2Wo0NMKNjxTN9z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="bison_2.4.1.bb"

DESCRIPTION = "GNU Project parser generator (yacc replacement)."
HOMEPAGE = "http://www.gnu.org/software/bison/"
LICENSE = "GPL"
SECTION = "devel"
PRIORITY = "optional"
DEFAULT_PREFERENCE = "-666"

SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.bz2;name=bison \
	   file://m4.patch;patch=1 \
	  "
SRC_URI[bison.md5sum] = "84e80a2a192c1a4c02d43fbf2bcc4ca4"
SRC_URI[bison.sha256sum] = "2354469782149e36c644ae7c3e5105895424ed21cda5c05b591cb3dc17068e6b"

inherit autotools

--Nq2Wo0NMKNjxTN9z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="bison-native_2.4.1.bb"

require bison_${PV}.bb
SECTION = "devel"
FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/bison-${PV}"
S = "${WORKDIR}/bison-${PV}"
PR="r0"
DEFAULT_PREFERENCE = "-666"

inherit native autotools

do_stage() {
	rm -f ${STAGING_BINDIR}/yacc
	rm -f ${STAGING_BINDIR}/bison
	install -m 0755 src/bison ${STAGING_BINDIR}/
	cat >${STAGING_BINDIR}/yacc <<EOF
#!/bin/sh
exec ${STAGING_BINDIR}/bison -y "\$@"
EOF
	chmod a+rx ${STAGING_BINDIR}/yacc
	install -d ${STAGING_DATADIR}/bison/m4sugar
	install -m 0755 data/c.m4 data/c++.m4 data/glr.c data/glr.cc data/lalr1.cc data/location.cc data/yacc.c ${STAGING_DATADIR}/bison/

	install -m 0755 data/m4sugar/m4sugar.m4 ${STAGING_DATADIR}/bison/m4sugar/
}

--Nq2Wo0NMKNjxTN9z--
