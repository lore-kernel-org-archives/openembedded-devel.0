Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Pcv3m-0005HP-Sj
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Jan 2011 08:23:58 +0100
Received: by fxm17 with SMTP id 17so260345fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jan 2011 23:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=ZGNd8kSqON5/YmN9hernfPUG2XV24hXeIgReManFJFY=;
	b=vUyzx1xtLoml1Rb73yvzPoob+Kos7Ihs2tBb1ZVJozH4G3u3cHevo1mOYcJO/6yQ1F
	Gxi2mH7wLkG+lK1qhm0FKUMvdXd9rWrxdNsk2MPKFlBh10DTwSUkJ5nQomKORBTwpsBB
	ie+mosERwX+0+nky3odflFdVt4f/Q8PHYD3WU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=ptVUzR9kgr/A2PbuWSbR6FWUdKjhc5ci1AoFzt8WQjVqOfgUYMX0OHjM8NxBcqyqWQ
	NK2TayPnFf9Zo/l3sbYCGOja8qB2zm4h3ZaewhXv1/SGHS3vyTGJtPkW5nfzoDlRnHcW
	2hEoI3uGtLpiQASJFe6Tz+suxj7YEuIyddpbQ=
Received: by 10.223.96.198 with SMTP id i6mr643499fan.10.1294817007676;
	Tue, 11 Jan 2011 23:23:27 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id a2sm67968faw.46.2011.01.11.23.23.26
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 11 Jan 2011 23:23:27 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Jan 2011 08:23:35 +0100
Message-Id: <1294817015-16540-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.rc1
In-Reply-To: <1294817015-16540-1-git-send-email-Martin.Jansa@gmail.com>
References: <1294817015-16540-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 2/2] mesa: add new 7.10 version, with D_P -1 and without glamo.patch for now
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
X-List-Received-Date: Wed, 12 Jan 2011 07:23:59 -0000

* someone please test uclibc build if old uclibc.patch is enough
* Tartarus reported issues with 7.9.1 (probably missing -ldl), I'll try
  to reproduce it here, but someone with populated ppc build is welcome
  to confirm it in 7.10 sooner
* I'll rebase glamo.patch and add it later

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/mesa/mesa-7.10.inc          |   18 ++++++++++++++++++
 recipes/mesa/mesa-7.10/uclibc.patch |   26 ++++++++++++++++++++++++++
 recipes/mesa/mesa-dri_7.10.bb       |    4 ++++
 recipes/mesa/mesa-xlib_7.10.bb      |    4 ++++
 recipes/mesa/mesa_7.10.bb           |    6 ++++++
 5 files changed, 58 insertions(+), 0 deletions(-)
 create mode 100644 recipes/mesa/mesa-7.10.inc
 create mode 100644 recipes/mesa/mesa-7.10/uclibc.patch
 create mode 100644 recipes/mesa/mesa-dri_7.10.bb
 create mode 100644 recipes/mesa/mesa-xlib_7.10.bb
 create mode 100644 recipes/mesa/mesa_7.10.bb

diff --git a/recipes/mesa/mesa-7.10.inc b/recipes/mesa/mesa-7.10.inc
new file mode 100644
index 0000000..5b26943
--- /dev/null
+++ b/recipes/mesa/mesa-7.10.inc
@@ -0,0 +1,18 @@
+SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2;name=archive \
+           file://uclibc.patch \
+          "
+
+DEPENDS += "talloc"
+
+SRC_URI[archive.md5sum] = "33fb94eccc02cbb4d8d1365615e38e46"
+SRC_URI[archive.sha256sum] = "bcf28f43f39c28da271c0f5857fb32898d4ade3e035e80a0ceece1c2df6e0aca"
+
+EXTRA_OECONF += " --disable-gallium"
+
+#needs more testing and updated glamo.patch before making default
+DEFAULT_PREFERENCE = "-2"
+
+do_configure_prepend() {
+  #check for python not python2, because python-native does not stage python2 binary/link
+  sed -i 's/AC_CHECK_PROGS(\[PYTHON2\], \[python2 python\])/AC_CHECK_PROGS(\[PYTHON2\], \[python python\])/g' ${S}/configure.ac
+}
diff --git a/recipes/mesa/mesa-7.10/uclibc.patch b/recipes/mesa/mesa-7.10/uclibc.patch
new file mode 100644
index 0000000..0508112
--- /dev/null
+++ b/recipes/mesa/mesa-7.10/uclibc.patch
@@ -0,0 +1,26 @@
+Index: Mesa-7.9.1/src/mesa/main/imports.c
+===================================================================
+--- Mesa-7.9.1.orig/src/mesa/main/imports.c	2010-12-15 13:50:00.000000000 -0800
++++ Mesa-7.9.1/src/mesa/main/imports.c	2011-01-10 12:23:48.848656001 -0800
+@@ -757,7 +757,7 @@
+ float
+ _mesa_strtof( const char *s, char **end )
+ {
+-#if defined(_GNU_SOURCE) && !defined(__CYGWIN__) && !defined(__FreeBSD__)
++#if defined(_GNU_SOURCE) && !defined(__CYGWIN__) && !defined(__FreeBSD__) && !defined(__UCLIBC__)
+    static locale_t loc = NULL;
+    if (!loc) {
+       loc = newlocale(LC_CTYPE_MASK, "C", NULL);
+Index: Mesa-7.9.1/src/glsl/strtod.c
+===================================================================
+--- Mesa-7.9.1.orig/src/glsl/strtod.c	2011-01-10 20:08:01.568656001 -0800
++++ Mesa-7.9.1/src/glsl/strtod.c	2011-01-10 20:08:39.898656001 -0800
+@@ -44,7 +44,7 @@
+ double
+ glsl_strtod(const char *s, char **end)
+ {
+-#if defined(_GNU_SOURCE) && !defined(__CYGWIN__) && !defined(__FreeBSD__)
++#if defined(_GNU_SOURCE) && !defined(__CYGWIN__) && !defined(__FreeBSD__) && !defined(__UCLIBC__)
+    static locale_t loc = NULL;
+    if (!loc) {
+       loc = newlocale(LC_CTYPE_MASK, "C", NULL);
diff --git a/recipes/mesa/mesa-dri_7.10.bb b/recipes/mesa/mesa-dri_7.10.bb
new file mode 100644
index 0000000..bd62c98
--- /dev/null
+++ b/recipes/mesa/mesa-dri_7.10.bb
@@ -0,0 +1,4 @@
+require mesa-common.inc
+require mesa-${PV}.inc
+require mesa-dri.inc
+PR = "${INC_PR}.1"
diff --git a/recipes/mesa/mesa-xlib_7.10.bb b/recipes/mesa/mesa-xlib_7.10.bb
new file mode 100644
index 0000000..93bb8cd
--- /dev/null
+++ b/recipes/mesa/mesa-xlib_7.10.bb
@@ -0,0 +1,4 @@
+require mesa-common.inc
+require mesa-${PV}.inc
+require mesa-xlib.inc
+PR = "${INC_PR}.0"
diff --git a/recipes/mesa/mesa_7.10.bb b/recipes/mesa/mesa_7.10.bb
new file mode 100644
index 0000000..f5c9a17
--- /dev/null
+++ b/recipes/mesa/mesa_7.10.bb
@@ -0,0 +1,6 @@
+# This is a dummy package so OE can use the poky mesa files
+require mesa-dri_${PV}.bb
+
+PR = "${INC_PR}.1"
+
+EXTRA_OECONF += "--disable-egl"
-- 
1.7.4.rc1



