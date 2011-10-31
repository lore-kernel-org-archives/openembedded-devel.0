Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RKvs8-0001nz-T9
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Oct 2011 18:42:09 +0100
Received: by faas16 with SMTP id s16so6397466faa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Oct 2011 10:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=+vB1Dcf//IPLVJKJmaiBz/TzibTx6RpgOH0RKsLkLeU=;
	b=MSYHH2KSV6Cb43McXgsW6VMs42XmQ5mcdhi+GsoMB9aUUQIdP7CIyIDVzihx+vCvJQ
	WRHkjbvT4airF0IbZ/YHIA1X2cZLRQK37nfnjTbYw9kLgy5G2lvJShW+vPiLmhlrAte8
	w40QfrmgugjNXKA4mtHuD3DdbJK3DxWdndokY=
Received: by 10.223.5.201 with SMTP id 9mr31586198faw.5.1320082562851;
	Mon, 31 Oct 2011 10:36:02 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w11sm39151398fad.7.2011.10.31.10.36.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 31 Oct 2011 10:36:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 Oct 2011 18:35:46 +0100
Message-Id: <1320082546-31376-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7.1
In-Reply-To: <1320082546-31376-1-git-send-email-Martin.Jansa@gmail.com>
References: <1320082546-31376-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 2/2] gpsd: fix build with python2.7 in sysroot and python2.6 on host
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
X-List-Received-Date: Mon, 31 Oct 2011 17:42:09 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../gpsd/gpsd-2.95/fix-build-with-python2.7.patch  |   15 +++++++++++++++
 meta-oe/recipes-navigation/gpsd/gpsd_2.95.bb       |    3 ++-
 2 files changed, 17 insertions(+), 1 deletions(-)
 create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd-2.95/fix-build-with-python2.7.patch

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-2.95/fix-build-with-python2.7.patch b/meta-oe/recipes-navigation/gpsd/gpsd-2.95/fix-build-with-python2.7.patch
new file mode 100644
index 0000000..6bba2b8
--- /dev/null
+++ b/meta-oe/recipes-navigation/gpsd/gpsd-2.95/fix-build-with-python2.7.patch
@@ -0,0 +1,15 @@
+Without this patch python2.6 from host could be preferred over python from native sysroot.
+
+Upstream-Status: Pending
+diff -uNr gpsd-2.95.orig/configure.ac gpsd-2.95/configure.ac
+--- gpsd-2.95.orig/configure.ac	2011-10-31 18:26:08.860719033 +0100
++++ gpsd-2.95/configure.ac	2011-10-31 18:27:47.718716963 +0100
+@@ -31,7 +31,7 @@
+ dnl AM_PATH_PYTHON provided with automake can be too old.  Look
+ dnl for newer python first, and include 2.6 on the list.
+ m4_define([_AM_PYTHON_INTERPRETER_LIST],
+-	    [python2.6 python2.5 python2.4 python])
++	    [python2.7 python2.6 python2.5 python2.4 python])
+ AM_PATH_PYTHON([2.4])
+ ac_python=yes
+ if test "x$PYTHON" = "x"; then
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_2.95.bb b/meta-oe/recipes-navigation/gpsd/gpsd_2.95.bb
index a6bf308..cdcb77c 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_2.95.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_2.95.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d217a23f408e91c94359447735bc1800"
 DEPENDS = "dbus-glib ncurses python libusb1"
 PROVIDES = "virtual/gpsd"
 
-PR = "r1"
+PR = "r2"
 
 EXTRA_OECONF = "--x-includes=${STAGING_INCDIR}/X11 \
                 --x-libraries=${STAGING_LIBDIR} \
@@ -15,6 +15,7 @@ EXTRA_OECONF = "--x-includes=${STAGING_INCDIR}/X11 \
 
 SRC_URI = "http://download.berlios.de/${PN}/${P}.tar.gz;name=gpsd \
            file://libtool.patch \
+           file://fix-build-with-python2.7.patch \
            file://gpsd-default \
            file://gpsd \
            file://60-gpsd.rules"
-- 
1.7.7.1



