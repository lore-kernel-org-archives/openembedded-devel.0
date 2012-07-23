Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fahad.usman@gmail.com>) id 1StFW9-0007Rk-DN
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Jul 2012 12:05:34 +0200
Received: by yhjj56 with SMTP id j56so4832759yhj.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jul 2012 02:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=ecJ4hZjfdbbFC1qKOtCcdLaSy+p7CEUSujICt86zdeY=;
	b=C7lEbEcbUX8zuH4ombpqFEifv9uKzKs6i5dAuWEf3KxYK8BRMZmWMjbtp32Wqm4yAP
	t/Iy2Hr8LGSQaBiXD2b2ONUQFRdrDGRljF+/50o3a9l6mCi3W1r5X7NUOUnIbrRdetjq
	9OVxXeM34YdULcbIREpiYOZjTlGA2d6ndO+oyybLm4Z7+sCEViHO8FfGRj0YArFDeu/3
	dk/jWwg92fLd9XA8NgOoK41muzg30vFssx+s+AUy4LKHcv6SoI4kGNASF576NqknwraQ
	OmsS0L4ecuopCUBWI3DPrVSz2KtF0rPiAIr0k4BPKfLv1w7YyBOm3JBgqSkcn4dY8GME
	gs1A==
Received: by 10.66.75.225 with SMTP id f1mr29433980paw.35.1343037245823;
	Mon, 23 Jul 2012 02:54:05 -0700 (PDT)
Received: from localhost.localdomain ([110.93.212.98])
	by mx.google.com with ESMTPS id tj4sm9664262pbc.33.2012.07.23.02.54.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 23 Jul 2012 02:54:04 -0700 (PDT)
From: fahad.usman@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Jul 2012 14:51:18 +0500
Message-Id: <1343037078-9760-1-git-send-email-fahad.usman@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <fahad.usman@gmail.com>
References: <fahad.usman@gmail.com>
Cc: Fahad Usman <fahad_usman@mentor.com>
Subject: [OE-core] [PATCH] readline: add missing macros in acinclude.m4
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
X-List-Received-Date: Mon, 23 Jul 2012 10:05:34 -0000

From: Fahad Usman <fahad_usman@mentor.com>

some bash macros are missing from acinclude.m4 which are added up-stream. This
wasn't actually breaking anything but but it was causing the configure script
to not run all the tests it's intended to run. (by Christopher Larson)

Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
---
 meta/recipes-core/readline/files/acinclude.m4 |   56 +++++++++++++++++++++++++
 1 files changed, 56 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-core/readline/files/acinclude.m4 b/meta/recipes-core/readline/files/acinclude.m4
index 8a45f99..c30a7d3 100644
--- a/meta/recipes-core/readline/files/acinclude.m4
+++ b/meta/recipes-core/readline/files/acinclude.m4
@@ -1813,3 +1813,59 @@ AC_MSG_RESULT($ac_cv_rl_version)
 
 fi
 ])
+
+AC_DEFUN(BASH_FUNC_CTYPE_NONASCII,
+[
+AC_MSG_CHECKING(whether the ctype macros accept non-ascii characters)
+AC_CACHE_VAL(bash_cv_func_ctype_nonascii,
+[AC_TRY_RUN([
+#ifdef HAVE_LOCALE_H
+#include <locale.h>
+#endif
+#include <stdio.h>
+#include <ctype.h>
+
+main(c, v)
+int	c;
+char	*v[];
+{
+	char	*deflocale;
+	unsigned char x;
+	int	r1, r2;
+
+#ifdef HAVE_SETLOCALE
+	/* We take a shot here.  If that locale is not known, try the
+	   system default.  We try this one because '\342' (226) is
+	   known to be a printable character in that locale. */
+	deflocale = setlocale(LC_ALL, "en_US.ISO8859-1");
+	if (deflocale == 0)
+		deflocale = setlocale(LC_ALL, "");
+#endif
+
+	x = '\342';
+	r1 = isprint(x);
+	x -= 128;
+	r2 = isprint(x);
+	exit (r1 == 0 || r2 == 0);
+}
+], bash_cv_func_ctype_nonascii=yes, bash_cv_func_ctype_nonascii=no,
+   [AC_MSG_WARN(cannot check ctype macros if cross compiling -- defaulting to no)
+    bash_cv_func_ctype_nonascii=no]
+)])
+AC_MSG_RESULT($bash_cv_func_ctype_nonascii)
+if test $bash_cv_func_ctype_nonascii = yes; then
+AC_DEFINE(CTYPE_NON_ASCII)
+fi
+])
+
+AC_DEFUN(BASH_TYPE_SIG_ATOMIC_T,
+[AC_CACHE_CHECK([for sig_atomic_t in signal.h], ac_cv_have_sig_atomic_t,
+[AC_TRY_LINK([
+#include <signal.h>
+],[ sig_atomic_t x; ],
+ac_cv_have_sig_atomic_t=yes, ac_cv_have_sig_atomic_t=no)])
+if test "$ac_cv_have_sig_atomic_t" = "no"
+then
+    AC_CHECK_TYPE(sig_atomic_t,int)
+fi
+])
-- 
1.7.1



