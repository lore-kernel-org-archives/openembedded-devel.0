Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 184986D143
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2013 22:43:54 +0000 (UTC)
Received: by mail-pd0-f181.google.com with SMTP id y13so1584399pdi.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2013 15:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KEUboy/lLWzI5xIXT3Zzt5qDs/gjb1MnhGEn3tlpSe4=;
	b=m9uLF8EXBkYnTw4x0sa0CILEnqEQW1CBfmMKPWm6Bkolkdr/CdUGf1P3QpfMGZRCAR
	WpI9IOU5dvm2Ct+x65qPicTjNo9M2H1nUNCfKIxpnEcSp6kPQqw6R60wP2jYutCTeLAs
	zM17FLNUYbakIChK8LHaHpr1INEf065ZkGwNCBtREEmROSgXu+QyK+u3lZpqLC+2Pmqf
	17IQsWJWFke3i82aN4Y6nElsGUqCrzkpO8MrYc0Y5cPk3HctWqdg3Csdt4Dwghett7q8
	WKM9Q5OJjoSHVlaPVpc4aLSPRpaSwCh+jdtZApewDgeN8NEyIUB8ZCRYMbftnCW6rQY3
	S2Bg==
X-Received: by 10.68.179.98 with SMTP id df2mr43562697pbc.38.1381877036301;
	Tue, 15 Oct 2013 15:43:56 -0700 (PDT)
Received: from haswell.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	ve9sm86900850pbc.19.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 15 Oct 2013 15:43:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Oct 2013 15:43:26 -0700
Message-Id: <1381877008-698-4-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1381877008-698-1-git-send-email-raj.khem@gmail.com>
References: <1381877008-698-1-git-send-email-raj.khem@gmail.com>
Cc: Cliff Brake <cbrake@bec-systems.com>
Subject: [meta-multimedia][PATCH 4/6] libdc1394: add recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Oct 2013 22:43:54 -0000

From: Cliff Brake <cbrake@bec-systems.com>

Initial recipe created by Khem Raj

Signed-off-by: Cliff Brake <cbrake@bec-systems.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libdc1394/files/install_examples.patch           | 14 ++++++++++++++
 .../recipes-multimedia/libdc1394/libdc1394_git.bb    | 20 ++++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100755 meta-multimedia/recipes-multimedia/libdc1394/files/install_examples.patch
 create mode 100755 meta-multimedia/recipes-multimedia/libdc1394/libdc1394_git.bb

diff --git a/meta-multimedia/recipes-multimedia/libdc1394/files/install_examples.patch b/meta-multimedia/recipes-multimedia/libdc1394/files/install_examples.patch
new file mode 100755
index 0000000..89133ad
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/libdc1394/files/install_examples.patch
@@ -0,0 +1,14 @@
+Index: libdc1394/examples/Makefile.am
+===================================================================
+--- libdc1394.orig/examples/Makefile.am	2012-06-30 17:50:46.000000000 -0700
++++ libdc1394/examples/Makefile.am	2012-06-30 19:02:13.822646430 -0700
+@@ -36,8 +36,7 @@
+ AM_LDFLAGS = -framework CoreFoundation -framework Carbon
+ endif
+ 
+-noinst_PROGRAMS = $(A)
+-bin_PROGRAMS = $(B)
++bin_PROGRAMS = $(A) $(B)
+ 
+ LDADD = ../dc1394/libdc1394.la
+ 
diff --git a/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_git.bb b/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_git.bb
new file mode 100755
index 0000000..87a12bd
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_git.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "Capture and control API for IIDC compliant cameras"
+HOMEPAGE = "http://sourceforge.net/projects/libdc1394/"
+SECTION = "libs"
+LICENSE = "LGPL-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c848e78d9a4a5cc69906178e4d6fbd64"
+DEPENDS += "libxv virtual/libsdl virtual/libx11 libusb1 libraw1394"
+
+PV = "2.2.1+gitr${SRCPV}"
+
+SRCREV = "b90342933b4b48634b98b73805f47bd25ed5857e"
+
+SRC_URI = "git://git.code.sf.net/p/libdc1394/code;branch=master;protocol=git \
+           file://install_examples.patch \
+          "
+
+S = "${WORKDIR}/git/${PN}"
+
+inherit autotools pkgconfig sdl
+
+EXTRA_OECONF += "--disable-doxygen-doc"
-- 
1.8.3.2


