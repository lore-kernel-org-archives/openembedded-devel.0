Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QQlYL-0007YZ-Qf
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 May 2011 21:21:33 +0200
Received: by mail-fx0-f47.google.com with SMTP id 19so2510774fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 May 2011 12:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=yZ0jLefvwsZIaKPmwR4x4NzECA2wZC/JOsRYOYcOD3s=;
	b=blxZqL+jHlFg5dlYEGH3W/fqPytfBeJQVK8LY9Wq3ABEFRZVLdECas4ryGF5Xmk+2r
	Z58m5RQzFLGtAejBCzQBmUGvpsqZlsnc3ThwUE6ZXq7afk4QupdknNvyEV4ceVtJmONj
	mMtcRF0VBbSVTgtmwSbPwICwhoQc2UmbcxiX0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=dDarjkGgtj1mxQtvGyKWqY9ycai/XznSP96gWwX31GSKHffLRkyY4S7wJq4SwNdYcy
	J7dpgkbGnjRbAJV8Dk4cVx9J5+tyROcBPGNuUyp572L+L0a5PXdtnsj83Q37uKVEzeZI
	Eq99kmIR4ivQze6sxLhYzeM7+1z0fvzLtrTss=
Received: by 10.223.57.5 with SMTP id a5mr4704631fah.90.1306696707907;
	Sun, 29 May 2011 12:18:27 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id g8sm497704fai.20.2011.05.29.12.18.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 May 2011 12:18:27 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 May 2011 21:17:23 +0200
Message-Id: <324cbd5015c76cd1d6d9ddf508a37c2b7e7d6f03.1306696348.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc3
In-Reply-To: <e6bbc59f3f64c410233cb840174a8972d4ac1664.1306696348.git.Martin.Jansa@gmail.com>
References: <e6bbc59f3f64c410233cb840174a8972d4ac1664.1306696348.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1306696348.git.Martin.Jansa@gmail.com>
References: <cover.1306696348.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 13/16] alsa-oss: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
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
X-List-Received-Date: Sun, 29 May 2011 19:21:46 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../alsa/alsa-oss-1.0.17/libio.patch               |   43 ++++++++++++++++++++
 meta-oe/recipes-multimedia/alsa/alsa-oss_1.0.17.bb |   22 ++++++++++
 2 files changed, 65 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-multimedia/alsa/alsa-oss-1.0.17/libio.patch
 create mode 100644 meta-oe/recipes-multimedia/alsa/alsa-oss_1.0.17.bb

diff --git a/meta-oe/recipes-multimedia/alsa/alsa-oss-1.0.17/libio.patch b/meta-oe/recipes-multimedia/alsa/alsa-oss-1.0.17/libio.patch
new file mode 100644
index 0000000..a053e4c
--- /dev/null
+++ b/meta-oe/recipes-multimedia/alsa/alsa-oss-1.0.17/libio.patch
@@ -0,0 +1,43 @@
+Index: alsa-oss-1.0.15/alsa/stdioemu.c
+===================================================================
+--- alsa-oss-1.0.15.orig/alsa/stdioemu.c	2007-10-15 10:50:40.000000000 +0200
++++ alsa-oss-1.0.15/alsa/stdioemu.c	2008-07-21 22:17:06.303161438 +0200
+@@ -37,7 +37,9 @@
+ #endif
+ 
+ #include <stdio.h>
++#ifdef HAVE_LIBIO_H
+ #include <libio.h>
++#endif
+ 
+ struct fd_cookie {
+ 	int fd;
+@@ -99,7 +101,11 @@
+ 
+ 	if (open_mode && fdc->fd > 0) {
+ 		result = fopencookie (fdc,"w", fns);
++#ifdef HAVE_FILENO
+ 		result->_fileno = fdc->fd;		/* ugly patchy slimy kludgy hack */
++#else
++		result->__filedes = fdc->fd;
++#endif
+ 	}
+ 	return result;
+ }
+Index: alsa-oss-1.0.15/configure.in
+===================================================================
+--- alsa-oss-1.0.15.orig/configure.in	2007-10-15 10:50:40.000000000 +0200
++++ alsa-oss-1.0.15/configure.in	2008-07-21 22:16:11.719837298 +0200
+@@ -33,6 +33,12 @@
+   LIBS="$OLD_LIBS"
+ fi
+ 
++AC_CHECK_HEADERS_ONCE([libio.h])
++
++AC_CHECK_MEMBER([struct _IO_FILE._fileno],
++		[AC_DEFINE([HAVE_FILENO], [1],[Define if _fileno exists.])],
++		[],[])
++
+ AC_OUTPUT(Makefile alsa/Makefile alsa/aoss alsa/aoss.old \
+ 	  oss-redir/Makefile test/Makefile \
+           alsa/testaoss test/testaoss)
diff --git a/meta-oe/recipes-multimedia/alsa/alsa-oss_1.0.17.bb b/meta-oe/recipes-multimedia/alsa/alsa-oss_1.0.17.bb
new file mode 100644
index 0000000..52634c1
--- /dev/null
+++ b/meta-oe/recipes-multimedia/alsa/alsa-oss_1.0.17.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "Alsa OSS Compatibility Package"
+SECTION = "libs/multimedia"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
+DEPENDS = "alsa-lib"
+PR = "r1"
+
+SRC_URI = "ftp://ftp.alsa-project.org/pub/oss-lib/alsa-oss-${PV}.tar.bz2 \
+	   file://libio.patch \
+	  "
+
+inherit autotools
+
+LEAD_SONAME = "libaoss.so.0"
+
+do_configure_prepend () {
+	touch NEWS README AUTHORS ChangeLog
+	sed -i "s/libaoss.so/${LEAD_SONAME}/" ${S}/alsa/aoss.in
+}
+
+SRC_URI[md5sum] = "1b1850c2fc91476a73d50f537cbd402f"
+SRC_URI[sha256sum] = "8d009e23e2cbee1691ec3c95d1838056a804d98440eae7715d6c3aebc710f9ca"
-- 
1.7.5.rc3



