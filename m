Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QMoud-0003Pr-7R
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 May 2011 00:08:15 +0200
Received: by mail-fx0-f47.google.com with SMTP id 19so1851802fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 May 2011 15:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=YD3/ebCElUfwzy0kmh9Yp+WzW6SWlGxR+1Li0c9OPV4=;
	b=f1MHXFwUEmcSkbapkR4A5TIqt2/9HG8WZ9cFWOPRsuO4LhtXzUJVs/oBEhk2dn15c2
	ONILFkNcsH5A5TQaKfv0U5wB9Nn4ySUKRgub9EU+WRk5whSVKzM6TYtZFniX97yziIpI
	QdO4bQ8XWo8CV8UP7aAtGz3ZoKk1ivNF2FacU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=NRoJWq4zgRxgsmWtQlhsWExl7nF8IJI5RY9u7IdGBc4zHRH3xeZ9Gz89XV+7zw45jC
	dWqhBTVu5ZvZC2B3QwowT+YZkbtQho/kfJ5CFee+yr8mS1rm7DJpMM3BSk6OfSmbxsIW
	/qA3s6yY15eypH0z8Q1x5qZlZytdnYvjGhjVE=
Received: by 10.223.6.198 with SMTP id a6mr2933798faa.126.1305756322404;
	Wed, 18 May 2011 15:05:22 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id a28sm808378faa.28.2011.05.18.15.05.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 May 2011 15:05:21 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 May 2011 00:05:20 +0200
Message-Id: <10d8c7ae116e231ed175e3a021e8e22d70a2141c.1305756266.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc3
In-Reply-To: <cover.1305756266.git.Martin.Jansa@gmail.com>
References: <cover.1305756266.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/2] glib-2.0: append libffi and python-argparse to DEPENDS_virtclass-native, drop gdbus-serialization test
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
X-List-Received-Date: Wed, 18 May 2011 22:08:15 -0000

* DEPENDS_virtclass-native is defined in glib.inc so normal DEPENDS are
  ignored for -native builds
* gdbus-serialization test causes circular dependency dbus-glib, and
  because we cannot add dbus to DEPENDS then we had to drop this test
  so apply dcf425c5472fdee74885c4f21a851e39c84e6642 from oe.dev

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-core/glib-2.0/glib-2.0_git.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-core/glib-2.0/glib-2.0_git.bb b/meta-oe/recipes-core/glib-2.0/glib-2.0_git.bb
index 51b0448..34fcaf6 100644
--- a/meta-oe/recipes-core/glib-2.0/glib-2.0_git.bb
+++ b/meta-oe/recipes-core/glib-2.0/glib-2.0_git.bb
@@ -6,12 +6,13 @@ PR = "r1"
 DEFAULT_PREFERENCE = "-1"
 
 DEPENDS += "libffi python-argparse-native"
+DEPENDS_virtclass-native += "libffi-native python-argparse-native"
 
 SRC_URI = "git://git.gnome.org/glib;protocol=git;branch=master \
            file://configure-libtool.patch \
            file://60_wait-longer-for-threads-to-die.patch \
            file://g_once_init_enter.patch \
-	   file://remove.test.for.qsort_r.patch \
+           file://remove.test.for.qsort_r.patch \
           "
 SRCREV = "d97cbc6731deab137770bc0fe9c69b06f689f5b4"
 PV = "2.29.3+gitr${SRCPV}"
@@ -27,4 +28,5 @@ do_configure_prepend() {
   # missing ${topdir}/gtk-doc.make and --disable-gtk-doc* is not enough, because it calls gtkdocize (not provided by gtk-doc-native)
   sed -i '/^docs/d' ${S}/configure.ac
   sed -i 's/SUBDIRS = . m4macros glib gmodule gthread gobject gio tests po docs/SUBDIRS = . m4macros glib gmodule gthread gobject gio tests po/g' ${S}/Makefile.am
+  sed -i -e "s:TEST_PROGS += gdbus-serialization::g"  ${S}/gio/tests/Makefile.am
 }
-- 
1.7.5.rc3



