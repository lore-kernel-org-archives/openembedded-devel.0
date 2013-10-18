Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f50.google.com (mail-pb0-f50.google.com
	[209.85.160.50])
	by mail.openembedded.org (Postfix) with ESMTP id 132EA6CC86
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Oct 2013 00:38:49 +0000 (UTC)
Received: by mail-pb0-f50.google.com with SMTP id uo15so1639159pbc.37
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2013 17:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=7po3p6aHI5AEQpkAd2dNycm3Tzo6MIrBxIoJYSapJho=;
	b=tjUkFHTrZChlKf72TK669Wv4VXD6+BUeHjh8CwHgdIXvWPXSUthEvP7PE12G1Ksm6Y
	3mHrkafGgh53opeMxgOca0WRGE5pZuiqzeoukjwMkXE6cqlBl20B2cRUlVnbcsfUdBVt
	kASlnxr949uKQUGO6I1JRVedp70zPEJLz9qgg3cpwzQxuZQ6seYZUkn9XebJRhU2u+Ml
	uEw7b2fQCriGGzQU/vlL4DbYVepfj0IE0Ewp44Zx6JZ5iiSi+/nqGmJGot75sr+/QEyi
	mH02LZXay4EzA3hpb5cpu+PwO8qsVyDCyMXazIN/8V+aNm4SrpSiNnRR0KMKG8r8Uk03
	OOvg==
X-Received: by 10.66.163.164 with SMTP id yj4mr622448pab.91.1382056731237;
	Thu, 17 Oct 2013 17:38:51 -0700 (PDT)
Received: from haswell.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id rp8sm2944129pbc.25.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 17 Oct 2013 17:38:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Oct 2013 17:38:29 -0700
Message-Id: <1382056709-27735-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Cc: Cliff Brake <cbrake@bec-systems.com>
Subject: [meta-multimedia][PATCH V3] coriander: add recipe
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
X-List-Received-Date: Fri, 18 Oct 2013 00:38:49 -0000

From: Cliff Brake <cbrake@bec-systems.com>

Initial recipe created by Khem Raj

Signed-off-by: Cliff Brake <cbrake@bec-systems.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../coriander/coriander/cross-compile.patch             | 17 +++++++++++++++++
 .../recipes-multimedia/coriander/coriander_2.0.2.bb     | 15 +++++++++++++++
 2 files changed, 32 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/coriander/coriander/cross-compile.patch
 create mode 100755 meta-multimedia/recipes-multimedia/coriander/coriander_2.0.2.bb

diff --git a/meta-multimedia/recipes-multimedia/coriander/coriander/cross-compile.patch b/meta-multimedia/recipes-multimedia/coriander/coriander/cross-compile.patch
new file mode 100644
index 0000000..49350fe
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/coriander/coriander/cross-compile.patch
@@ -0,0 +1,17 @@
+In a cross compile environment adding paths like /usr are not correct.
+With this patch we make it so that its relative to sysroot if the compiler
+defines one.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Index: a/src/Makefile.am
+===================================================================
+--- a/src/Makefile.am	2013-02-08 22:35:08.000000000 -0800
++++ b/src/Makefile.am	2013-10-13 01:31:38.812869080 -0700
+@@ -33,5 +33,5 @@
+ 	video_encode.c video_encode.h \
+ 	subtitles.c subtitles.h 
+ 
+-coriander_LDADD = -L/usr/X11R6/lib/ @PACKAGE_LIBS@ $(INTLLIBS) $(LIBTIFF_LIBS) $(FTPLIB_LIBS) $(SDLLIB_LIBS) $(LIBDC_LIBS) $(LIBRAW_LIBS) $(XV_LIBS) $(COR_LFS_LDFLAGS) -lgthread-2.0 $(FFMPEG_LIBS) $(X11_LIBS)
++coriander_LDADD = -L=/usr/X11R6/lib/ @PACKAGE_LIBS@ $(INTLLIBS) $(LIBTIFF_LIBS) $(FTPLIB_LIBS) $(SDLLIB_LIBS) $(LIBDC_LIBS) $(LIBRAW_LIBS) $(XV_LIBS) $(COR_LFS_LDFLAGS) -lgthread-2.0 $(FFMPEG_LIBS) $(X11_LIBS)
+ 
diff --git a/meta-multimedia/recipes-multimedia/coriander/coriander_2.0.2.bb b/meta-multimedia/recipes-multimedia/coriander/coriander_2.0.2.bb
new file mode 100755
index 0000000..64ccc9b
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/coriander/coriander_2.0.2.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "Control and capture GUI for IIDC compliant cameras"
+HOMEPAGE = "http://damien.douxchamps.net/ieee1394/coriander/"
+SECTION = "applications"
+LICENSE = "GPL-3.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+DEPENDS = "gtk+ libgnomeui libraw1394 libdc1394 libxv"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/${PN}/coriander-2/${PV}/${P}.tar.gz \
+           file://cross-compile.patch \
+          "
+
+SRC_URI[md5sum] = "431d98fb013217681f97ade168201fb8"
+SRC_URI[sha256sum] = "5c7fd31cb58d398e2742352bf1ffbd2ca22e06686c6668ecfd437735c2b79123"
+
+inherit autotools gettext
-- 
1.8.3.2


