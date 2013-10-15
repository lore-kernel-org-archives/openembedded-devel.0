Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f41.google.com (mail-pb0-f41.google.com
	[209.85.160.41])
	by mail.openembedded.org (Postfix) with ESMTP id 74E2C6D1BB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2013 22:43:55 +0000 (UTC)
Received: by mail-pb0-f41.google.com with SMTP id rp16so100979pbb.14
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2013 15:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TemGViNNfk4S267Uqfel8bpuYHmTU43VBAzDkejgVkc=;
	b=znD6fXArol5szdp75AD60gi/BaWuU21209KR9bHdr37qzpd0An0t2rR4TiELRezA70
	fUy98vc6XeuxmYsXSGcFghgjnZcfAHSwhUM6E6De8Wy/cp1Z2bNh4YxU0NGMAuf0Yu4M
	NilV73U3wUZHP4K/RGoneV2qkb0fW9MdjMvmHy/RaotoPmSz7Y44r3sa6Q+3ig4rqAXY
	v+ycMYqANQ42kiW6h4l8/UVZhc+IfB8A8uOzB80X2mvwgiXjcUCDhmyO3+qWEH/MMWCw
	tRII+EWk+Pg8cGTZndXU6hSavo44dGcrvCQxq+79QNmXC/SbIenlLcMngaURiSa0Tg/R
	ajWg==
X-Received: by 10.68.240.2 with SMTP id vw2mr44221720pbc.80.1381877037495;
	Tue, 15 Oct 2013 15:43:57 -0700 (PDT)
Received: from haswell.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	ve9sm86900850pbc.19.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 15 Oct 2013 15:43:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Oct 2013 15:43:27 -0700
Message-Id: <1381877008-698-5-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1381877008-698-1-git-send-email-raj.khem@gmail.com>
References: <1381877008-698-1-git-send-email-raj.khem@gmail.com>
Cc: Cliff Brake <cbrake@bec-systems.com>
Subject: [meta-multimedia][PATCH 5/6] coriander: add recipe
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
X-List-Received-Date: Tue, 15 Oct 2013 22:43:55 -0000

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
index 0000000..587055d
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
+inherit autotools gettext sdl
-- 
1.8.3.2


