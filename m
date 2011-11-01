Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RL9ox-0008GO-Qy
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Nov 2011 09:35:47 +0100
Received: by mail-fx0-f47.google.com with SMTP id s16so6983168faa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Nov 2011 01:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=+vB1Dcf//IPLVJKJmaiBz/TzibTx6RpgOH0RKsLkLeU=;
	b=adcMhLKX3LYN7RGdosfaOC/++8teOKhGfvSjI7c0SlHTF4PCCvwqymiAN1Ju4shVSX
	D7G4hh5L6EDIj4317DNkaI9fsLvHN9m1CSUqVy5emgRDmh7t59iZYIYBPjreBnHIZOxu
	BiW3CGTTF9/jdG2BJhT1pD8rhyMXy2g5nClrg=
Received: by 10.223.91.68 with SMTP id l4mr35474220fam.16.1320136182816;
	Tue, 01 Nov 2011 01:29:42 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id j5sm43337613faf.14.2011.11.01.01.29.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 Nov 2011 01:29:41 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Nov 2011 09:27:49 +0100
Message-Id: <1deaec7b0abece41f4a2f30f1d24330e3dbbb700.1320135926.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7.1
In-Reply-To: <58fda822fdf64f38e5d75e75c5cf4a196a37e47e.1320135926.git.Martin.Jansa@gmail.com>
References: <58fda822fdf64f38e5d75e75c5cf4a196a37e47e.1320135926.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1320135926.git.Martin.Jansa@gmail.com>
References: <cover.1320135926.git.Martin.Jansa@gmail.com>
Subject: [meta-efl][meta-oe 15/15] gpsd: fix build with python2.7 in sysroot and python2.6 on host
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
X-List-Received-Date: Tue, 01 Nov 2011 08:35:47 -0000

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



