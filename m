Received: from mail-ea0-f172.google.com ([209.85.215.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1U4yob-0001ok-Lv
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Feb 2013 20:13:51 +0100
Received: by mail-ea0-f172.google.com with SMTP id f13so2934735eaa.31
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Feb 2013 10:57:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=CgMF6v8vY5dwSSvHSVe6Fo58V+AkEPn+C9caA22xN3M=;
	b=ksSsw4KtzALQrQqaB7FahERzhHjV/OVQ3aaqCymR+roWkyZLMMr/Cy0JBpNHzMaMIS
	RQEEO0GGiGVO4WE2B24KH6wShCsmFDuqUI52H2WlqscVa4PKMuHANMqJowHghGbI7KLO
	1HCInKoabl1ekG0sz5OZ0o2QbbryQA73Ea4beEr73gKDO4AwiUl+cfYnIShEyUL5S2g9
	EojaUxGY45UkZasbdx6hsPZucfv8YrTcR/rA4zunxgAPIjZWtpNtn7WdW8Kk2NENHrrt
	iMgfU18Y5OGbQj9bMgpSfBmYiug+Az2dkcojCMlsJcVinSQRUg8hlJ65u8OS9imVevJA
	IFOw==
X-Received: by 10.14.213.131 with SMTP id a3mr53388562eep.24.1360609043295;
	Mon, 11 Feb 2013 10:57:23 -0800 (PST)
Received: from localhost.localdomain (5-13-217-124.residential.rdsnet.ro.
	[5.13.217.124])
	by mx.google.com with ESMTPS id q5sm64034955eep.11.2013.02.11.10.57.21
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 11 Feb 2013 10:57:22 -0800 (PST)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 Feb 2013 20:57:08 +0200
Message-Id: <1360609028-8921-4-git-send-email-andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1360609028-8921-1-git-send-email-andrei@gherzan.ro>
References: <1360609028-8921-1-git-send-email-andrei@gherzan.ro>
X-Gm-Message-State: ALoCoQl7GYo9T2J1JG+5Io5q+WSaBztzOBWQSz1TIWJlx3twRQVeOJV4a2H7f20MLdTA00pD8HUH
Subject: [meta-oe][PATCH 4/4] minidlna: Integrated version 1.0.25
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
X-List-Received-Date: Mon, 11 Feb 2013 19:13:53 -0000

Add two patches to fix build.

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 .../minidlna/minidlna/fix-makefile.patch           |   41 +++++++++++++++++
 .../search-for-headers-in-staging-dir.patch        |   48 ++++++++++++++++++++
 .../recipes-multimedia/minidlna/minidlna_1.0.25.bb |   19 ++++++++
 3 files changed, 108 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/minidlna/minidlna/fix-makefile.patch
 create mode 100644 meta-oe/recipes-multimedia/minidlna/minidlna/search-for-headers-in-staging-dir.patch
 create mode 100644 meta-oe/recipes-multimedia/minidlna/minidlna_1.0.25.bb

diff --git a/meta-oe/recipes-multimedia/minidlna/minidlna/fix-makefile.patch b/meta-oe/recipes-multimedia/minidlna/minidlna/fix-makefile.patch
new file mode 100644
index 0000000..96429fd
--- /dev/null
+++ b/meta-oe/recipes-multimedia/minidlna/minidlna/fix-makefile.patch
@@ -0,0 +1,41 @@
+Fix Makefile:
+* don't overwrite CFLAGS but append to it
+* use gcc as CC only if CC is not already defined
+* use -I= to include paths
+* fix compile of minidlna binary by removing ${LIBS} dependency
+
+Upstream-status: Pending
+Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
+
+Index: minidlna-1.0.25/Makefile
+===================================================================
+--- minidlna-1.0.25.orig/Makefile	2012-01-18 00:49:01.000000000 +0200
++++ minidlna-1.0.25/Makefile	2013-02-10 17:46:49.000000000 +0200
+@@ -12,13 +12,13 @@
+ #
+ #CFLAGS = -Wall -O -D_GNU_SOURCE -g -DDEBUG
+ #CFLAGS = -Wall -g -Os -D_GNU_SOURCE
+-CFLAGS = -Wall -g -O3 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 \
+-	 -I/usr/include/ffmpeg \
+-	 -I/usr/include/libavutil -I/usr/include/libavcodec -I/usr/include/libavformat \
+-	 -I/usr/include/ffmpeg/libavutil -I/usr/include/ffmpeg/libavcodec -I/usr/include/ffmpeg/libavformat
++CFLAGS += -Wall -g -O3 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 \
++	 -I=/usr/include/ffmpeg \
++	 -I=/usr/include/libavutil -I=/usr/include/libavcodec -I=/usr/include/libavformat \
++	 -I=/usr/include/ffmpeg/libavutil -I=/usr/include/ffmpeg/libavcodec -I=/usr/include/ffmpeg/libavformat
+ #STATIC_LINKING: CFLAGS += -DSTATIC
+ #STATIC_LINKING: LDFLAGS = -static
+-CC = gcc
++CC ?= gcc
+ RM = rm -f
+ INSTALL = install
+
+@@ -64,7 +64,7 @@
+ 	$(INSTALL) -d $(ETCINSTALLDIR)
+ 	$(INSTALL) --mode=0644 minidlna.conf $(ETCINSTALLDIR)
+
+-minidlna:	$(BASEOBJS) $(LNXOBJS) $(LIBS)
++minidlna:	$(BASEOBJS) $(LNXOBJS)
+ 	@echo Linking $@
+ 	@$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $(BASEOBJS) $(LNXOBJS) $(LIBS)
+
diff --git a/meta-oe/recipes-multimedia/minidlna/minidlna/search-for-headers-in-staging-dir.patch b/meta-oe/recipes-multimedia/minidlna/minidlna/search-for-headers-in-staging-dir.patch
new file mode 100644
index 0000000..573d88c
--- /dev/null
+++ b/meta-oe/recipes-multimedia/minidlna/minidlna/search-for-headers-in-staging-dir.patch
@@ -0,0 +1,48 @@
+Search for headers in STAGING_DIR_GOST.
+
+Upstream-status: Pending
+Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
+
+Index: minidlna-1.0.25/genconfig.sh
+===================================================================
+--- minidlna-1.0.25.orig/genconfig.sh	2012-01-21 02:34:13.000000000 +0200
++++ minidlna-1.0.25/genconfig.sh	2013-02-10 17:12:06.000000000 +0200
+@@ -40,22 +40,22 @@
+
+ # Detect if there are missing headers
+ # NOTE: This check only works with a normal distro
+-[ ! -e "/usr/include/sqlite3.h" ] && MISSING="libsqlite3 $MISSING"
+-[ ! -e "/usr/include/jpeglib.h" ] && MISSING="libjpeg $MISSING"
+-[ ! -e "/usr/include/libexif/exif-loader.h" ] && MISSING="libexif $MISSING"
+-[ ! -e "/usr/include/id3tag.h" ] && MISSING="libid3tag $MISSING"
+-[ ! -e "/usr/include/ogg/ogg.h" ] && MISSING="libogg $MISSING"
+-[ ! -e "/usr/include/vorbis/codec.h" ] && MISSING="libvorbis $MISSING"
+-[ ! -e "/usr/include/FLAC/metadata.h" ] && MISSING="libflac $MISSING"
+-[ ! -e "/usr/include/ffmpeg/avutil.h" -a \
+-  ! -e "/usr/include/libavutil/avutil.h" -a \
+-  ! -e "/usr/include/ffmpeg/libavutil/avutil.h" ] && MISSING="libavutil $MISSING"
+-[ ! -e "/usr/include/ffmpeg/avformat.h" -a \
+-  ! -e "/usr/include/libavformat/avformat.h" -a \
+-  ! -e "/usr/include/ffmpeg/libavformat/avformat.h" ] && MISSING="libavformat $MISSING"
+-[ ! -e "/usr/include/ffmpeg/avcodec.h" -a \
+-  ! -e "/usr/include/libavcodec/avcodec.h" -a \
+-  ! -e "/usr/include/ffmpeg/libavcodec/avcodec.h" ] && MISSING="libavcodec $MISSING"
++[ ! -e "$STAGING_DIR_HOST/usr/include/sqlite3.h" ] && MISSING="libsqlite3 $MISSING"
++[ ! -e "$STAGING_DIR_HOST/usr/include/jpeglib.h" ] && MISSING="libjpeg $MISSING"
++[ ! -e "$STAGING_DIR_HOST/usr/include/libexif/exif-loader.h" ] && MISSING="libexif $MISSING"
++[ ! -e "$STAGING_DIR_HOST/usr/include/id3tag.h" ] && MISSING="libid3tag $MISSING"
++[ ! -e "$STAGING_DIR_HOST/usr/include/ogg/ogg.h" ] && MISSING="libogg $MISSING"
++[ ! -e "$STAGING_DIR_HOST/usr/include/vorbis/codec.h" ] && MISSING="libvorbis $MISSING"
++[ ! -e "$STAGING_DIR_HOST/usr/include/FLAC/metadata.h" ] && MISSING="libflac $MISSING"
++[ ! -e "$STAGING_DIR_HOST/usr/include/ffmpeg/avutil.h" -a \
++  ! -e "$STAGING_DIR_HOST/usr/include/libavutil/avutil.h" -a \
++  ! -e "$STAGING_DIR_HOST/usr/include/ffmpeg/libavutil/avutil.h" ] && MISSING="libavutil $MISSING"
++[ ! -e "$STAGING_DIR_HOST/usr/include/ffmpeg/avformat.h" -a \
++  ! -e "$STAGING_DIR_HOST/usr/include/libavformat/avformat.h" -a \
++  ! -e "$STAGING_DIR_HOST/usr/include/ffmpeg/libavformat/avformat.h" ] && MISSING="libavformat $MISSING"
++[ ! -e "$STAGING_DIR_HOST/usr/include/ffmpeg/avcodec.h" -a \
++  ! -e "$STAGING_DIR_HOST/usr/include/libavcodec/avcodec.h" -a \
++  ! -e "$STAGING_DIR_HOST/usr/include/ffmpeg/libavcodec/avcodec.h" ] && MISSING="libavcodec $MISSING"
+ if [ -n "$MISSING" ]; then
+ 	echo -e "\nERROR!  Cannot continue."
+ 	echo -e "The following required libraries are either missing, or are missing development headers:\n"
diff --git a/meta-oe/recipes-multimedia/minidlna/minidlna_1.0.25.bb b/meta-oe/recipes-multimedia/minidlna/minidlna_1.0.25.bb
new file mode 100644
index 0000000..4c17737
--- /dev/null
+++ b/meta-oe/recipes-multimedia/minidlna/minidlna_1.0.25.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "MiniDLNA (aka ReadyDLNA) is server software with the aim of \
+being fully compliant with DLNA/UPnP-AV clients."
+LICENSE = "GPL-2.0"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=b1a795ac1a06805cf8fd74920bc46b5c"
+
+DEPENDS = "flac libav jpeg sqlite3 libexif libogg libid3tag"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/${PN}/${PN}_${PV}_src.tar.gz \
+    file://search-for-headers-in-staging-dir.patch \
+    file://fix-makefile.patch \
+    "
+
+SRC_URI[md5sum] = "d966256baf2f9b068b9de871ab5dade5"
+SRC_URI[sha256sum] = "170560fbe042c2bbcba78c5f15b54f4fac321ff770490b23b55789be463f2851"
+
+export STAGING_DIR_HOST
+
+inherit autotools
+
-- 
1.7.9.5



