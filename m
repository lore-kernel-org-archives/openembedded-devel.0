Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 949BF738E0
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Mar 2015 15:49:48 +0000 (UTC)
Received: by wggz12 with SMTP id z12so17142944wgg.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Mar 2015 07:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=iOOcLWMYm2KMjd0LgezwSgYoSxVphnBCvDm6/jksWcI=;
	b=j13strszaDsGzZViI+w/azqHiXMQ+y/mOAjPaWoG4CICWAW7CLfL+PsHypThSWeCCc
	oH1cYB1bBi1YLB3d1SLEuyxy0fBCNTVLQjAUuVN4O/xkNJ+8JNDjdvSOPos8ui8rvBBv
	xq5xc4WFkyRoPEra+NbM1Fgu3r16pQwHcCkiqZD+XY3jBWPJamfWTWpkrMt3FawtjXxo
	EBRb7YwXdImODa9eub1GtXyK9NWYdJN7AV03THiKZpCNneJLtcB67th2cQPs37xNq4tT
	j/ftBXaFuBnZF+PpUYpJsHHjndkfNfmz/Ym1sKxRV/pyqU8pnceFoOmOFgDxiJ8/xjAJ
	Pyfg==
X-Received: by 10.194.110.233 with SMTP id id9mr19975310wjb.136.1425570589920; 
	Thu, 05 Mar 2015 07:49:49 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	l4sm30270376wiw.9.2015.03.05.07.49.48
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Mar 2015 07:49:48 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Mar 2015 16:49:48 +0100
Message-Id: <1425570588-20920-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.1
In-Reply-To: <1425570588-20920-1-git-send-email-Martin.Jansa@gmail.com>
References: <1425570588-20920-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 3/3] minidlna: Fix package and bump to version 1.1.4
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
X-List-Received-Date: Thu, 05 Mar 2015 15:49:50 -0000

From: Baptiste DURAND <baptiste.durand@gmail.com>

Signed-off-by: Baptiste DURAND <baptiste.durand@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-multimedia/minidlna/minidlna.inc   | 39 ++++++++++++++++
 .../minidlna/minidlna/minidlna-daemon.init.d       | 54 ++++++++++++++++++++++
 .../minidlna/minidlna/minidlna.service             | 10 ++++
 .../recipes-multimedia/minidlna/minidlna_1.1.4.bb  |  6 +++
 .../minidlna/minidlna/fix-makefile.patch           | 41 ----------------
 .../search-for-headers-in-staging-dir.patch        | 48 -------------------
 .../nonworking/minidlna/minidlna_1.0.25.bb         | 19 --------
 7 files changed, 109 insertions(+), 108 deletions(-)
 create mode 100644 meta-oe/recipes-multimedia/minidlna/minidlna.inc
 create mode 100644 meta-oe/recipes-multimedia/minidlna/minidlna/minidlna-daemon.init.d
 create mode 100644 meta-oe/recipes-multimedia/minidlna/minidlna/minidlna.service
 create mode 100644 meta-oe/recipes-multimedia/minidlna/minidlna_1.1.4.bb
 delete mode 100644 meta-oe/recipes-multimedia/nonworking/minidlna/minidlna/fix-makefile.patch
 delete mode 100644 meta-oe/recipes-multimedia/nonworking/minidlna/minidlna/search-for-headers-in-staging-dir.patch
 delete mode 100644 meta-oe/recipes-multimedia/nonworking/minidlna/minidlna_1.0.25.bb

diff --git a/meta-oe/recipes-multimedia/minidlna/minidlna.inc b/meta-oe/recipes-multimedia/minidlna/minidlna.inc
new file mode 100644
index 0000000..ebca755
--- /dev/null
+++ b/meta-oe/recipes-multimedia/minidlna/minidlna.inc
@@ -0,0 +1,39 @@
+DESCRIPTION = "MiniDLNA (aka ReadyDLNA) is server software with the aim of \
+being fully compliant with DLNA/UPnP-AV clients."
+LICENSE = "GPL-2.0|BSD"
+DEPENDS = "ffmpeg flac libav jpeg sqlite3 libexif libogg libid3tag libvorbis"
+
+# because it depends on libav which has commercial flag
+LICENSE_FLAGS = "commercial"
+
+inherit gettext autotools-brokensep update-rc.d systemd
+
+SRC_URI = "git://git.code.sf.net/p/minidlna/git;branch=master;module=git \
+           file://minidlna-daemon.init.d \
+           file://minidlna.service "
+
+S = "${WORKDIR}/git"
+
+# This remove "--exclude=autopoint" option from autoreconf argument to avoid
+# configure.ac:30: error: required file './ABOUT-NLS' not found
+EXTRA_AUTORECONF = ""
+
+do_install_append(){
+	install -d ${D}${sysconfdir}
+	install -m 0755 minidlna.conf ${D}${sysconfdir}
+
+# Systemd script
+	install -d ${D}${nonarch_base_libdir}/systemd/system
+	install -m 0755 ${WORKDIR}/minidlna.service ${D}${nonarch_base_libdir}/systemd/system
+
+# Sysvinit script
+	install -d ${D}${sysconfdir}/init.d
+	install -m 0755 ${WORKDIR}/minidlna-daemon.init.d ${D}${sysconfdir}/init.d/minidlna
+
+}
+
+SYSTEMD_SERVICE_${PN} = "minidlna.service"
+
+INITSCRIPT_NAME = "minidlna"
+INITSCRIPT_PARAMS = "defaults 90"
+
diff --git a/meta-oe/recipes-multimedia/minidlna/minidlna/minidlna-daemon.init.d b/meta-oe/recipes-multimedia/minidlna/minidlna/minidlna-daemon.init.d
new file mode 100644
index 0000000..9e64a20
--- /dev/null
+++ b/meta-oe/recipes-multimedia/minidlna/minidlna/minidlna-daemon.init.d
@@ -0,0 +1,54 @@
+#!/bin/sh
+
+NAME="minidlna"
+DAEMON=/usr/sbin/minidlnad
+SCRIPTNAME=/etc/init.d/$NAME
+PIDFILE=/var/run/$NAME.pid
+CONF=/etc/$NAME.conf
+ARGS="-f $CONF"
+
+# Exit if the package is not installed
+[ -x "$DAEMON" ] || exit 0
+
+start_function() {
+
+    export PATH=$PWD:$PATH
+
+    if [ -f ${PIDFILE} ]; then
+        echo "$SCRIPTNAME already running with PID #`cat $PIDFILE` ( according to ${PIDFILE} )";
+        exit 0
+    fi
+    
+    $DAEMON $ARGS
+ 
+    pid=$!
+
+    if [ "$pid" != "" ]; then
+        echo -n "$pid" > ${PIDFILE}
+    fi
+}
+
+stop_function() {
+
+    export PATH=$PWD:$PATH
+
+    if [ ! -e "${PIDFILE}" ]; then
+        echo "${SCRIPTNAME} not running ( according to ${PIDFILE} )";
+        exit 1;
+    fi
+    PID=`cat ${PIDFILE}`
+    kill -INT ${PID}
+    rm -f ${PIDFILE}
+}
+
+case $1 in
+    "start")
+        start_function
+        ;;
+    "stop")
+        stop_function
+        ;;
+    *)
+    echo "Usage: $0 {start | stop}"
+
+esac
diff --git a/meta-oe/recipes-multimedia/minidlna/minidlna/minidlna.service b/meta-oe/recipes-multimedia/minidlna/minidlna/minidlna.service
new file mode 100644
index 0000000..656100b
--- /dev/null
+++ b/meta-oe/recipes-multimedia/minidlna/minidlna/minidlna.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=Minidlna Daemon
+After=network.target
+
+[Service]
+Type=notify
+ExecStart=/usr/sbin/minidlnad -f /etc/minidlna.conf
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-oe/recipes-multimedia/minidlna/minidlna_1.1.4.bb b/meta-oe/recipes-multimedia/minidlna/minidlna_1.1.4.bb
new file mode 100644
index 0000000..0531e69
--- /dev/null
+++ b/meta-oe/recipes-multimedia/minidlna/minidlna_1.1.4.bb
@@ -0,0 +1,6 @@
+require ${BPN}.inc
+
+SRCREV = "v1_1_4"
+LIC_FILES_CHKSUM = "file://LICENCE.miniupnpd;md5=b0dabf9d8e0f871554e309d62ead8d2b"
+SRC_URI[md5sum] = "d966256baf2f9b068b9de871ab5dade5"
+SRC_URI[sha256sum] = "170560fbe042c2bbcba78c5f15b54f4fac321ff770490b23b55789be463f2851"
diff --git a/meta-oe/recipes-multimedia/nonworking/minidlna/minidlna/fix-makefile.patch b/meta-oe/recipes-multimedia/nonworking/minidlna/minidlna/fix-makefile.patch
deleted file mode 100644
index 96429fd..0000000
--- a/meta-oe/recipes-multimedia/nonworking/minidlna/minidlna/fix-makefile.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-Fix Makefile:
-* don't overwrite CFLAGS but append to it
-* use gcc as CC only if CC is not already defined
-* use -I= to include paths
-* fix compile of minidlna binary by removing ${LIBS} dependency
-
-Upstream-status: Pending
-Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
-
-Index: minidlna-1.0.25/Makefile
-===================================================================
---- minidlna-1.0.25.orig/Makefile	2012-01-18 00:49:01.000000000 +0200
-+++ minidlna-1.0.25/Makefile	2013-02-10 17:46:49.000000000 +0200
-@@ -12,13 +12,13 @@
- #
- #CFLAGS = -Wall -O -D_GNU_SOURCE -g -DDEBUG
- #CFLAGS = -Wall -g -Os -D_GNU_SOURCE
--CFLAGS = -Wall -g -O3 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 \
--	 -I/usr/include/ffmpeg \
--	 -I/usr/include/libavutil -I/usr/include/libavcodec -I/usr/include/libavformat \
--	 -I/usr/include/ffmpeg/libavutil -I/usr/include/ffmpeg/libavcodec -I/usr/include/ffmpeg/libavformat
-+CFLAGS += -Wall -g -O3 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 \
-+	 -I=/usr/include/ffmpeg \
-+	 -I=/usr/include/libavutil -I=/usr/include/libavcodec -I=/usr/include/libavformat \
-+	 -I=/usr/include/ffmpeg/libavutil -I=/usr/include/ffmpeg/libavcodec -I=/usr/include/ffmpeg/libavformat
- #STATIC_LINKING: CFLAGS += -DSTATIC
- #STATIC_LINKING: LDFLAGS = -static
--CC = gcc
-+CC ?= gcc
- RM = rm -f
- INSTALL = install
-
-@@ -64,7 +64,7 @@
- 	$(INSTALL) -d $(ETCINSTALLDIR)
- 	$(INSTALL) --mode=0644 minidlna.conf $(ETCINSTALLDIR)
-
--minidlna:	$(BASEOBJS) $(LNXOBJS) $(LIBS)
-+minidlna:	$(BASEOBJS) $(LNXOBJS)
- 	@echo Linking $@
- 	@$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $(BASEOBJS) $(LNXOBJS) $(LIBS)
-
diff --git a/meta-oe/recipes-multimedia/nonworking/minidlna/minidlna/search-for-headers-in-staging-dir.patch b/meta-oe/recipes-multimedia/nonworking/minidlna/minidlna/search-for-headers-in-staging-dir.patch
deleted file mode 100644
index 573d88c..0000000
--- a/meta-oe/recipes-multimedia/nonworking/minidlna/minidlna/search-for-headers-in-staging-dir.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-Search for headers in STAGING_DIR_GOST.
-
-Upstream-status: Pending
-Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
-
-Index: minidlna-1.0.25/genconfig.sh
-===================================================================
---- minidlna-1.0.25.orig/genconfig.sh	2012-01-21 02:34:13.000000000 +0200
-+++ minidlna-1.0.25/genconfig.sh	2013-02-10 17:12:06.000000000 +0200
-@@ -40,22 +40,22 @@
-
- # Detect if there are missing headers
- # NOTE: This check only works with a normal distro
--[ ! -e "/usr/include/sqlite3.h" ] && MISSING="libsqlite3 $MISSING"
--[ ! -e "/usr/include/jpeglib.h" ] && MISSING="libjpeg $MISSING"
--[ ! -e "/usr/include/libexif/exif-loader.h" ] && MISSING="libexif $MISSING"
--[ ! -e "/usr/include/id3tag.h" ] && MISSING="libid3tag $MISSING"
--[ ! -e "/usr/include/ogg/ogg.h" ] && MISSING="libogg $MISSING"
--[ ! -e "/usr/include/vorbis/codec.h" ] && MISSING="libvorbis $MISSING"
--[ ! -e "/usr/include/FLAC/metadata.h" ] && MISSING="libflac $MISSING"
--[ ! -e "/usr/include/ffmpeg/avutil.h" -a \
--  ! -e "/usr/include/libavutil/avutil.h" -a \
--  ! -e "/usr/include/ffmpeg/libavutil/avutil.h" ] && MISSING="libavutil $MISSING"
--[ ! -e "/usr/include/ffmpeg/avformat.h" -a \
--  ! -e "/usr/include/libavformat/avformat.h" -a \
--  ! -e "/usr/include/ffmpeg/libavformat/avformat.h" ] && MISSING="libavformat $MISSING"
--[ ! -e "/usr/include/ffmpeg/avcodec.h" -a \
--  ! -e "/usr/include/libavcodec/avcodec.h" -a \
--  ! -e "/usr/include/ffmpeg/libavcodec/avcodec.h" ] && MISSING="libavcodec $MISSING"
-+[ ! -e "$STAGING_DIR_HOST/usr/include/sqlite3.h" ] && MISSING="libsqlite3 $MISSING"
-+[ ! -e "$STAGING_DIR_HOST/usr/include/jpeglib.h" ] && MISSING="libjpeg $MISSING"
-+[ ! -e "$STAGING_DIR_HOST/usr/include/libexif/exif-loader.h" ] && MISSING="libexif $MISSING"
-+[ ! -e "$STAGING_DIR_HOST/usr/include/id3tag.h" ] && MISSING="libid3tag $MISSING"
-+[ ! -e "$STAGING_DIR_HOST/usr/include/ogg/ogg.h" ] && MISSING="libogg $MISSING"
-+[ ! -e "$STAGING_DIR_HOST/usr/include/vorbis/codec.h" ] && MISSING="libvorbis $MISSING"
-+[ ! -e "$STAGING_DIR_HOST/usr/include/FLAC/metadata.h" ] && MISSING="libflac $MISSING"
-+[ ! -e "$STAGING_DIR_HOST/usr/include/ffmpeg/avutil.h" -a \
-+  ! -e "$STAGING_DIR_HOST/usr/include/libavutil/avutil.h" -a \
-+  ! -e "$STAGING_DIR_HOST/usr/include/ffmpeg/libavutil/avutil.h" ] && MISSING="libavutil $MISSING"
-+[ ! -e "$STAGING_DIR_HOST/usr/include/ffmpeg/avformat.h" -a \
-+  ! -e "$STAGING_DIR_HOST/usr/include/libavformat/avformat.h" -a \
-+  ! -e "$STAGING_DIR_HOST/usr/include/ffmpeg/libavformat/avformat.h" ] && MISSING="libavformat $MISSING"
-+[ ! -e "$STAGING_DIR_HOST/usr/include/ffmpeg/avcodec.h" -a \
-+  ! -e "$STAGING_DIR_HOST/usr/include/libavcodec/avcodec.h" -a \
-+  ! -e "$STAGING_DIR_HOST/usr/include/ffmpeg/libavcodec/avcodec.h" ] && MISSING="libavcodec $MISSING"
- if [ -n "$MISSING" ]; then
- 	echo -e "\nERROR!  Cannot continue."
- 	echo -e "The following required libraries are either missing, or are missing development headers:\n"
diff --git a/meta-oe/recipes-multimedia/nonworking/minidlna/minidlna_1.0.25.bb b/meta-oe/recipes-multimedia/nonworking/minidlna/minidlna_1.0.25.bb
deleted file mode 100644
index 9264bc2..0000000
--- a/meta-oe/recipes-multimedia/nonworking/minidlna/minidlna_1.0.25.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-DESCRIPTION = "MiniDLNA (aka ReadyDLNA) is server software with the aim of \
-being fully compliant with DLNA/UPnP-AV clients."
-LICENSE = "GPL-2.0"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=b1a795ac1a06805cf8fd74920bc46b5c"
-
-DEPENDS = "flac libav jpeg sqlite3 libexif libogg libid3tag"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}_${PV}_src.tar.gz \
-    file://search-for-headers-in-staging-dir.patch \
-    file://fix-makefile.patch \
-"
-
-SRC_URI[md5sum] = "d966256baf2f9b068b9de871ab5dade5"
-SRC_URI[sha256sum] = "170560fbe042c2bbcba78c5f15b54f4fac321ff770490b23b55789be463f2851"
-
-export STAGING_DIR_HOST
-
-inherit autotools
-
-- 
2.3.1


