Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QUBtm-0007KK-2V
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Jun 2011 08:05:50 +0200
Received: by mail-bw0-f47.google.com with SMTP id 5so158058bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Jun 2011 23:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=oQ1VHB7JzzxfXYz5OUVyJRxwRBoT7+mvYz4yH71ZaQ0=;
	b=BQQ51Dwk+E0FOj0M+6zzE7iysq2pogw/nAUTbDNohoJQuCFFJbv194Wstb3tp3J3WI
	OIkvRpGj1CjoI7LzCFuv1TLRS+u164FfcTmEdpjgt5/YapNWgL6gZYevX/nbJQJFwdYw
	hGAkC05DcZCAyVcr4ClIDLHRqWiF0p5jWrRo8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=TM96SCAHfDjHUXedlGDYyvsttwsw9jl3Xurkp/WwIB6yw8+zEWexU52t+qG60ZiZc0
	yl/WNiDTRvafEgckV6pYddnj8ctuoU4n0zI5lCkj4egi+Xh34VJ5UrbqErQHl0H4miFz
	+jV9katysX79fX1bWhU5wmCnXqaOok3OXQZkI=
Received: by 10.204.73.222 with SMTP id r30mr189030bkj.104.1307512952164;
	Tue, 07 Jun 2011 23:02:32 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id t23sm201386bkf.16.2011.06.07.23.02.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Jun 2011 23:02:31 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Jun 2011 08:02:15 +0200
Message-Id: <44be71761934c22b7eb42dbd5ce2e3cbed00fb39.1307512818.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.3
In-Reply-To: <0993200e91b132f35bf18124e0366a190cc84722.1307512818.git.Martin.Jansa@gmail.com>
References: <0993200e91b132f35bf18124e0366a190cc84722.1307512818.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1307512818.git.Martin.Jansa@gmail.com>
References: <cover.1307512818.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/2] check: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
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
X-List-Received-Date: Wed, 08 Jun 2011 06:05:50 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/check/check_0.9.5.bb       |   20 ++++++++++++++++++++
 ...graphs-in-macro-names-to-unbreak-autoconf.patch |   18 ++++++++++++++++++
 .../check/files/configure_fix.patch                |   12 ++++++++++++
 3 files changed, 50 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/check/check_0.9.5.bb
 create mode 100644 meta-oe/recipes-support/check/files/check-m4-am-path-check-use-quadrigraphs-in-macro-names-to-unbreak-autoconf.patch
 create mode 100644 meta-oe/recipes-support/check/files/configure_fix.patch

diff --git a/meta-oe/recipes-support/check/check_0.9.5.bb b/meta-oe/recipes-support/check/check_0.9.5.bb
new file mode 100644
index 0000000..132b563
--- /dev/null
+++ b/meta-oe/recipes-support/check/check_0.9.5.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "a unit test framework for C"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=2d5025d4aa3495befef8f17206a5b0a1"
+PRIORITY = "optional"
+SECTION = "devel"
+
+PR = "r2"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/check/check-${PV}.tar.gz \
+           file://configure_fix.patch \
+           file://check-m4-am-path-check-use-quadrigraphs-in-macro-names-to-unbreak-autoconf.patch \
+          "
+S = "${WORKDIR}/check-${PV}"
+
+inherit autotools pkgconfig
+
+EXTRA_OECONF += "--enable-plain-docdir"
+
+SRC_URI[md5sum] = "30143c7974b547a12a7da47809a90951"
+SRC_URI[sha256sum] = "961b3c66869018d02226bbbc394e79362cd898962ce810bce8417b3c497f7ad6"
diff --git a/meta-oe/recipes-support/check/files/check-m4-am-path-check-use-quadrigraphs-in-macro-names-to-unbreak-autoconf.patch b/meta-oe/recipes-support/check/files/check-m4-am-path-check-use-quadrigraphs-in-macro-names-to-unbreak-autoconf.patch
new file mode 100644
index 0000000..61bdf1d
--- /dev/null
+++ b/meta-oe/recipes-support/check/files/check-m4-am-path-check-use-quadrigraphs-in-macro-names-to-unbreak-autoconf.patch
@@ -0,0 +1,18 @@
+Imported from http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=395466
+
+-Khem
+Index: check-0.9.5/check.m4
+===================================================================
+--- check-0.9.5.orig/check.m4
++++ check-0.9.5/check.m4
+@@ -4,8 +4,8 @@ dnl
+ 
+ AC_DEFUN([AM_PATH_CHECK],
+ [
+-  AC_MSG_WARN([[AM_PATH_CHECK() is deprecated]])
+-  AC_MSG_WARN([[use PKG_CHECK_MODULES([CHECK], [check >= 0.9.4]) instead]])
++  AC_MSG_WARN([A@&t@M_PATH_CHECK() is deprecated])
++  AC_MSG_WARN([[use P@&t@KG_CHECK_MODULES([CHECK], [check >= 0.9.4]) instead]])
+   AC_ARG_WITH([check],
+   [  --with-check=PATH       prefix where check is installed [default=auto]])
+  
diff --git a/meta-oe/recipes-support/check/files/configure_fix.patch b/meta-oe/recipes-support/check/files/configure_fix.patch
new file mode 100644
index 0000000..3e79319
--- /dev/null
+++ b/meta-oe/recipes-support/check/files/configure_fix.patch
@@ -0,0 +1,12 @@
+Index: check-0.9.5/configure.ac
+===================================================================
+--- check-0.9.5.orig/configure.ac	2008-10-29 04:09:50.000000000 +0000
++++ check-0.9.5/configure.ac	2008-10-29 04:10:06.000000000 +0000
+@@ -71,6 +71,7 @@
+ AC_PROG_INSTALL
+ AC_PROG_LN_S
+ AC_PROG_LIBTOOL
++AM_PROG_CC_C_O
+ if test -n "$GCC"; then
+   CFLAGS="$CFLAGS -Wall -Wstrict-prototypes -Wmissing-prototypes -Wwrite-strings"
+ fi
-- 
1.7.5.3



