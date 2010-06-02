Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OJuj5-00030l-1N
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Jun 2010 22:39:55 +0200
Received: by mail-pv0-f175.google.com with SMTP id 30so2440067pvc.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Jun 2010 13:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=y0z8C+mD2ZjLUusOEXm22rX6UP54boUEnXnpIpYkRTw=;
	b=sLS80UDLrd9mBcptj+DYmYBgUa9iJqSQUAPtiL8+txjsIrrYgi4zKqL1GnHnZcV56M
	WKi42Bb2tv2kx91vsrNh9i7XJZqQKaCCKW0wqA8jDP4X11kXz+w/Qgk9EHAN4gV+UGxP
	dTBzsiJalIpDeI5cnjAt04juWp3qM9D4OCODk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=Oa49NLKOWYvh3SI8Inf/jde1DMQWEqHjcU0A7SOI3Jt2RkXh4y+TtOdOh9cN4Q4Rcp
	nHKpQwUP6HGIB5BfJJXHAR/PugHYpjdKhfzcJlrXnmBMlAExd+V2z4g8K+4E6Wwi7FHW
	tWOOg4TEe14NWi3Af6FSR5S5y2gs1jzsoxRnQ=
Received: by 10.141.22.12 with SMTP id z12mr7122301rvi.72.1275510933850;
	Wed, 02 Jun 2010 13:35:33 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id 20sm5942447pzk.7.2010.06.02.13.35.32
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 02 Jun 2010 13:35:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 Jun 2010 13:34:47 -0700
Message-Id: <1275510896-30845-8-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1275510896-30845-1-git-send-email-raj.khem@gmail.com>
References: <1275510896-30845-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 07/16] grep-2.6.3: Add recipe.
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
X-List-Received-Date: Wed, 02 Jun 2010 20:39:58 -0000

* Fix build for uclibc as well.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/grep/grep-2.6.3/uclibc-fix.patch |   50 ++++++++++++++++++++++++++++++
 recipes/grep/grep_2.6.3.bb               |   47 ++++++++++++++++++++++++++++
 2 files changed, 97 insertions(+), 0 deletions(-)
 create mode 100644 recipes/grep/grep-2.6.3/uclibc-fix.patch
 create mode 100644 recipes/grep/grep_2.6.3.bb

diff --git a/recipes/grep/grep-2.6.3/uclibc-fix.patch b/recipes/grep/grep-2.6.3/uclibc-fix.patch
new file mode 100644
index 0000000..2e1c584
--- /dev/null
+++ b/recipes/grep/grep-2.6.3/uclibc-fix.patch
@@ -0,0 +1,50 @@
+Fix to use mempcpy instead of __mempcpy. This is needed for uclibc which
+doesn't define __mempcpy only mempcpy. Since both uclibc and glibc have
+mempcpy we'll just use that instead.
+
+Index: grep-2.6.3/lib/getopt.c
+===================================================================
+--- grep-2.6.3.orig/lib/getopt.c	2010-03-21 00:34:02.000000000 -0700
++++ grep-2.6.3/lib/getopt.c	2010-05-22 21:37:11.352740539 -0700
+@@ -41,6 +41,10 @@
+ # include <wchar.h>
+ #endif
+ 
++#ifdef __UCLIBC__
++#define __mempcpy mempcpy
++#endif
++
+ /* This version of `getopt' appears to the caller like standard Unix `getopt'
+    but it behaves differently for the user, since it allows the user
+    to intersperse the options with the other arguments.
+Index: grep-2.6.3/gnulib-tests/setenv.c
+===================================================================
+--- grep-2.6.3.orig/gnulib-tests/setenv.c	2010-05-22 21:37:53.655168151 -0700
++++ grep-2.6.3/gnulib-tests/setenv.c	2010-05-22 21:38:42.792745476 -0700
+@@ -68,6 +68,10 @@ __libc_lock_define_initialized (static, 
+ # define tsearch __tsearch
+ #endif
+ 
++#ifdef __UCLIBC__
++#define __mempcpy mempcpy
++#endif
++
+ /* In the GNU C library implementation we try to be more clever and
+    allow arbitrarily many changes of the environment given that the used
+    values are from a small set.  Outside glibc this will eat up all
+Index: grep-2.6.3/lib/regexec.c
+===================================================================
+--- grep-2.6.3.orig/lib/regexec.c	2010-05-22 21:36:02.655154671 -0700
++++ grep-2.6.3/lib/regexec.c	2010-05-22 21:37:26.212743273 -0700
+@@ -22,6 +22,11 @@
+ 
+ #include "verify.h"
+ #include "intprops.h"
++
++#ifdef __UCLIBC__
++#define __mempcpy mempcpy
++#endif
++
+ static reg_errcode_t match_ctx_init (re_match_context_t *cache, int eflags,
+ 				     Idx n) internal_function;
+ static void match_ctx_clean (re_match_context_t *mctx) internal_function;
diff --git a/recipes/grep/grep_2.6.3.bb b/recipes/grep/grep_2.6.3.bb
new file mode 100644
index 0000000..c887ca0
--- /dev/null
+++ b/recipes/grep/grep_2.6.3.bb
@@ -0,0 +1,47 @@
+LICENSE = "GPL"
+SECTION = "console/utils"
+DESCRIPTION = "grep GNU utility"
+PR = "r0"
+
+SRC_URI = "${GNU_MIRROR}/grep/grep-${PV}.tar.xz \
+           file://uclibc-fix.patch"
+
+inherit autotools
+
+EXTRA_OECONF = "--disable-perl-regexp --disable-ncurses"
+EXTRA_OECONF_virtclass-native = "--with-included-regex --disable-ncurses"
+
+do_configure () {
+	rm -f ${S}/m4/init.m4
+	autotools_do_configure
+}
+
+do_install () {
+	autotools_do_install
+	install -d ${D}${base_bindir}
+	mv ${D}${bindir}/grep ${D}${base_bindir}/grep.${PN}
+	mv ${D}${bindir}/egrep ${D}${base_bindir}/egrep.${PN}
+	mv ${D}${bindir}/fgrep ${D}${base_bindir}/fgrep.${PN}
+}
+
+do_install_virtclass-native () {
+	autotools_do_install
+}
+
+pkg_postinst_${PN} () {
+	update-alternatives --install ${base_bindir}/grep grep grep.${PN} 100
+	update-alternatives --install ${base_bindir}/egrep egrep egrep.${PN} 100
+	update-alternatives --install ${base_bindir}/fgrep fgrep fgrep.${PN} 100
+}
+
+pkg_prerm_${PN} () {
+	update-alternatives --remove grep grep.${PN}
+	update-alternatives --remove egrep egrep.${PN}
+	update-alternatives --remove fgrep fgrep.${PN}
+}
+
+BBCLASSEXTEND = "native"
+
+SRC_URI[md5sum] = "69a3bf508a3f14d12369e0e1c7a92763"
+SRC_URI[sha256sum] = "ba745e2ff297ab225bf870740d35593d402a1d92999cf0d7e56840f10218db7c"
+
-- 
1.7.0.4



