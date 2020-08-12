Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.291.1597264895799017211
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Aug 2020 13:41:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=V3ofSuM8;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id c6so1711250pje.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Aug 2020 13:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5jiY0Z84cUh5Pw3imqI+xc9BaTKWoELEeccP+/jybro=;
        b=V3ofSuM8NEv/L7A4Rt/Dlb08e9aGziLC0XnP5H9fCeLMal9mTxrMc7GSWtMfMp+YZI
         wdxvVw7Cp19qD60GGFYUy9+FvE4NkpmopC8pQrUE9j7hsPOV3rT6ud7/avX68PLfH1LV
         DxCzY9zBZMhqTtaOoClXVXltMcquGUB1Af1P2T4bA0nHHsF6D2i/AlqOxO1oFHCh7JSM
         BBU8hyyVL1CH39OqhwR+7P3vMlje5IOO96ONCj9Ls76JLMdBGn0ihfjbr0Q26mNA7M/z
         mA4Hj1/LJ7iIN0thH6jvYzTxAWjykV/DFD53Avnnx1FY4pqA1cuz40vdHGeo2pJfD7gW
         FMTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5jiY0Z84cUh5Pw3imqI+xc9BaTKWoELEeccP+/jybro=;
        b=syEVyHyIlVPtp9L1O77PM+ceLl37gudmID+lZAdRWJf4QSjlogzSQPFwIqYO1wtyev
         EyQOvKHl4AL4xAYDrMgDP4VX/QaGe7nm8Tj/As9DUn3sjF1B6kgQmI4wfOBKxDr+2eky
         VSTXEHT1SHbytiKsNEY6ejzOc19i6qNDLy67fzE00Wkwm/K15f+HA/KEequDUz5tbobu
         NTCFcARC81nslQp90hv6ZFd1j/vfd0gN2FHdgyBZYM74gs1B3prN6/YnRQcZpjhiLvvi
         JuFETo5TijwMpMw7VqW3Mc6fvKDz7lp4tDcU1GsrvZsfl3YYdxZsfTLnFBpITXUQVJFD
         0xlg==
X-Gm-Message-State: AOAM530nxszkrsiVlwUZJdlBexeWgYvxToXf4Te5ZOzMomWt8w0aq54X
	lNUe9S/1tTZFo1FZL8Xk9qDpQQkbu3I=
X-Google-Smtp-Source: ABdhPJzZw/oWi1oO+Bpb0F8G2MX83RTwcv53YamWmCD2OVGZae9Z2Vh45h+ouxF15Q8ZeH/HCZgvsw==
X-Received: by 2002:a17:90a:ca87:: with SMTP id y7mr1769816pjt.102.1597264894634;
        Wed, 12 Aug 2020 13:41:34 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id l22sm2984287pjy.31.2020.08.12.13.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 13:41:33 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][ 03/18] x11vnc: Update to latest on master
Date: Wed, 12 Aug 2020 13:41:15 -0700
Message-Id: <20200812204130.1012160-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200812204130.1012160-1-raj.khem@gmail.com>
References: <20200812204130.1012160-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop already upstreamed patches
Drop unused remove-redundant-RPATH.patch patch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ld-on-32bit-arches-with-64bit-time_t.patch | 111 ------------------
 ...-don-t-install-Xdummy-when-configure.patch |  37 ------
 .../x11vnc/files/remove-redundant-RPATH.patch |  86 --------------
 ...sor-fix-xfc-NULL-pointer-dereference.patch |  30 -----
 .../recipes-graphics/x11vnc/x11vnc_0.9.16.bb  |   7 +-
 5 files changed, 3 insertions(+), 268 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/x11vnc/files/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
 delete mode 100644 meta-oe/recipes-graphics/x11vnc/files/0001-misc-Makefile.am-don-t-install-Xdummy-when-configure.patch
 delete mode 100644 meta-oe/recipes-graphics/x11vnc/files/remove-redundant-RPATH.patch
 delete mode 100644 meta-oe/recipes-graphics/x11vnc/files/src-cursor-fix-xfc-NULL-pointer-dereference.patch

diff --git a/meta-oe/recipes-graphics/x11vnc/files/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch b/meta-oe/recipes-graphics/x11vnc/files/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
deleted file mode 100644
index d44445fa9f..0000000000
--- a/meta-oe/recipes-graphics/x11vnc/files/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
+++ /dev/null
@@ -1,111 +0,0 @@
-From 8ab672ccc67b64058cffac2cd19a0d3b75d5aa25 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 30 Nov 2019 11:43:32 -0800
-Subject: [PATCH] Fix build on 32bit arches with 64bit time_t
-
-time element is deprecated on new input_event structure in kernel's
-input.h [1]
-
-[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=152194fe9c3f
-
-Upstream-Status: Submitted [https://github.com/LibVNC/x11vnc/pull/117]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/uinput.c | 28 ++++++++++++++++++++++++----
- 1 file changed, 24 insertions(+), 4 deletions(-)
-
-diff --git a/src/uinput.c b/src/uinput.c
-index 28fbad3..343b7c5 100644
---- a/src/uinput.c
-+++ b/src/uinput.c
-@@ -54,6 +54,11 @@ so, delete this exception statement from your version.
- #include <linux/input.h>
- #include <linux/uinput.h>
- 
-+#ifndef input_event_sec
-+#define input_event_sec time.tv_sec
-+#define input_event_usec time.tv_usec
-+#endif
-+
- #if !defined(EV_SYN) || !defined(SYN_REPORT)
- #undef UINPUT_OK
- #endif
-@@ -710,6 +715,7 @@ void parse_uinput_str(char *in) {
- static void ptr_move(int dx, int dy) {
- #ifdef UINPUT_OK
- 	struct input_event ev;
-+	struct timeval tval;
- 	int d = direct_rel_fd < 0 ? fd : direct_rel_fd;
- 
- 	if (injectable && strchr(injectable, 'M') == NULL) {
-@@ -720,7 +726,9 @@ static void ptr_move(int dx, int dy) {
- 
- 	if (db) fprintf(stderr, "ptr_move(%d, %d) fd=%d\n", dx, dy, d);
- 
--	gettimeofday(&ev.time, NULL);
-+	gettimeofday(&tval, NULL);
-+	ev.input_event_sec = tval.tv_sec;
-+	ev.input_event_usec = tval.tv_usec;
- 	ev.type = EV_REL;
- 	ev.code = REL_Y;
- 	ev.value = dy;
-@@ -755,6 +763,7 @@ static void apply_tslib(int *x, int *y) {
- static void ptr_abs(int x, int y, int p) {
- #ifdef UINPUT_OK
- 	struct input_event ev;
-+	struct timeval tval;
- 	int x0, y0;
- 	int d = direct_abs_fd < 0 ? fd : direct_abs_fd;
- 
-@@ -773,7 +782,9 @@ static void ptr_abs(int x, int y, int p) {
- 
- 	if (db) fprintf(stderr, "ptr_abs(%d, %d => %d %d, p=%d) fd=%d\n", x0, y0, x, y, p, d);
- 
--	gettimeofday(&ev.time, NULL);
-+	gettimeofday(&tval, NULL);
-+	ev.input_event_sec = tval.tv_sec;
-+	ev.input_event_usec = tval.tv_usec;
- 	ev.type = EV_ABS;
- 	ev.code = ABS_Y;
- 	ev.value = y;
-@@ -950,6 +961,7 @@ if (0) {usleep(100*1000) ;}
- static void button_click(int down, int btn) {
- #ifdef UINPUT_OK
- 	struct input_event ev;
-+	struct timeval tval;
- 	int d = direct_btn_fd < 0 ? fd : direct_btn_fd;
- 
- 	if (injectable && strchr(injectable, 'B') == NULL) {
-@@ -959,7 +971,12 @@ static void button_click(int down, int btn) {
- 	if (db) fprintf(stderr, "button_click: btn %d %s fd=%d\n", btn, down ? "down" : "up", d);
- 
- 	memset(&ev, 0, sizeof(ev));
--	gettimeofday(&ev.time, NULL);
-+	gettimeofday(&tval, NULL);
-+	gettimeofday(&tval, NULL);
-+	ev.input_event_sec = tval.tv_sec;
-+	ev.input_event_usec = tval.tv_usec;
-+	ev.input_event_sec = tval.tv_sec;
-+	ev.input_event_usec = tval.tv_usec;
- 	ev.type = EV_KEY;
- 	ev.value = down;
- 
-@@ -1230,6 +1247,7 @@ void uinput_pointer_command(int mask, int x, int y, rfbClientPtr client) {
- void uinput_key_command(int down, int keysym, rfbClientPtr client) {
- #ifdef UINPUT_OK
- 	struct input_event ev;
-+	struct timeval tval;
- 	int scancode;
- 	allowed_input_t input;
- 	int d = direct_key_fd < 0 ? fd : direct_key_fd;
-@@ -1253,7 +1271,9 @@ void uinput_key_command(int down, int keysym, rfbClientPtr client) {
- 	if (db) fprintf(stderr, "uinput_key_command: %d -> %d %s fd=%d\n", keysym, scancode, down ? "down" : "up", d);
- 
- 	memset(&ev, 0, sizeof(ev));
--	gettimeofday(&ev.time, NULL);
-+	gettimeofday(&tval, NULL);
-+	ev.input_event_sec = tval.tv_sec;
-+	ev.input_event_usec = tval.tv_usec;
- 	ev.type = EV_KEY;
- 	ev.code = (unsigned char) scancode;
- 	ev.value = down;
diff --git a/meta-oe/recipes-graphics/x11vnc/files/0001-misc-Makefile.am-don-t-install-Xdummy-when-configure.patch b/meta-oe/recipes-graphics/x11vnc/files/0001-misc-Makefile.am-don-t-install-Xdummy-when-configure.patch
deleted file mode 100644
index a15f3fe5bd..0000000000
--- a/meta-oe/recipes-graphics/x11vnc/files/0001-misc-Makefile.am-don-t-install-Xdummy-when-configure.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 686491573827b98ba031adaa5da373366079d3d8 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Jean-Fran=C3=A7ois=20Dagenais?= <jeff.dagenais@gmail.com>
-Date: Mon, 11 Feb 2019 11:42:59 -0500
-Subject: [PATCH] misc/Makefile.am: don't install Xdummy when configured
- --without-x
-
-Upstream-status: submitted https://github.com/jeff-dagenais/x11vnc/pull/1
-
-Signed-off-by: Jean-Francois Dagenais <jeff.dagenais@gmail.com>
----
- misc/Makefile.am | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/misc/Makefile.am b/misc/Makefile.am
-index c0b98c8..e4a22c1 100644
---- a/misc/Makefile.am
-+++ b/misc/Makefile.am
-@@ -18,7 +18,10 @@ EXTRA_DIST = \
- 	uinput.pl \
- 	ultravnc_repeater.pl \
- 	vcinject.pl \
--	x11vnc_loop \
-+	x11vnc_loop
-+
-+if HAVE_X11
-+EXTRA_DIST += \
- 	Xdummy.c \
- 	Xdummy.in
- 
-@@ -32,3 +35,4 @@ do_dummy_c_subst = $(SED) \
- Xdummy: $(srcdir)/Xdummy.in $(srcdir)/Xdummy.c
- 	$(do_dummy_c_subst) < $< > $@.tmp
- 	mv -f $@.tmp $@
-+endif
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-graphics/x11vnc/files/remove-redundant-RPATH.patch b/meta-oe/recipes-graphics/x11vnc/files/remove-redundant-RPATH.patch
deleted file mode 100644
index 8e894bd8e7..0000000000
--- a/meta-oe/recipes-graphics/x11vnc/files/remove-redundant-RPATH.patch
+++ /dev/null
@@ -1,86 +0,0 @@
-From 7be055c13c7d0d640941830a3291af3b404928c1 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Mon, 27 Jun 2016 04:44:14 -0400
-Subject: [PATCH] configure.ac: remove redundant RPATH
-
-It caused oe QA issue:
-...
-|ERROR: QA Issue: x11vnc: work/i586-poky-linux/x11vnc/0.9.13-r0/packages-split/
-x11vnc/usr/bin/x11vnc contains probably-redundant RPATH /usr/lib [useless-rpaths]
-...
-
-Upstream-Status: Inappropriate [oe specific]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- configure.ac | 21 +++++----------------
- 1 file changed, 5 insertions(+), 16 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 6f664d0..f986686 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -330,10 +330,8 @@ if test "x$with_crypto" != "xno" -a "x$with_ssl" != "xno"; then
- 		saved_LDFLAGS="$LDFLAGS"
- 		CPPFLAGS="$CPPFLAGS -I$with_ssl/include"
- 		LDFLAGS="$LDFLAGS -L$with_ssl/lib"
--		if test "x$ld_minus_R" = "xno"; then
-+		if test "x$ld_minus_R" = "xno" -o "x$GCC" = "xyes"; then
- 			:
--		elif test "x$GCC" = "xyes"; then
--			LDFLAGS="$LDFLAGS -Xlinker -R$with_ssl/lib"
- 		else
- 			LDFLAGS="$LDFLAGS -R$with_ssl/lib"
- 		fi
-@@ -447,10 +445,8 @@ if test ! -z "$with_system_libvncserver" -a "x$with_system_libvncserver" != "xno
- 	fi
- 	if test "x$with_system_libvncserver" != "xyes"; then
- 		rflag=""
--		if test "x$ld_minus_R" = "xno"; then
-+		if test "x$ld_minus_R" = "xno" -o "x$GCC" = "xyes"; then
- 			:
--		elif test "x$GCC" = "xyes"; then
--			rflag="-Xlinker -R$with_system_libvncserver/lib"
- 		else
- 			rflag="-R$with_system_libvncserver/lib"
- 		fi
-@@ -484,10 +480,8 @@ new enough.
- 	elif libvncserver-config --version 1>/dev/null 2>&1; then
- 		rflag=""
- 		rprefix=`libvncserver-config --prefix`
--		if test "x$ld_minus_R" = "xno"; then
-+		if test "x$ld_minus_R" = "xno" -o "x$GCC" = "xyes"; then
- 			:
--		elif test "x$GCC" = "xyes"; then
--			rflag=" -Xlinker -R$rprefix/lib "
- 		else
- 			rflag=" -R$rprefix/lib "
- 		fi
-@@ -541,11 +535,8 @@ if test "x$with_jpeg" != "xno"; then
- 		saved_LDFLAGS="$LDFLAGS"
- 		CPPFLAGS="$CPPFLAGS -I$with_jpeg/include"
- 		LDFLAGS="$LDFLAGS -L$with_jpeg/lib"
--		if test "x$ld_minus_R" = "xno"; then
-+		if test "x$ld_minus_R" = "xno" -o "x$GCC" = "xyes"; then
- 			:
--		elif test "x$GCC" = "xyes"; then
--			# this is not complete... in general a rat's nest.
--			LDFLAGS="$LDFLAGS -Xlinker -R$with_jpeg/lib"
- 		else
- 			LDFLAGS="$LDFLAGS -R$with_jpeg/lib"
- 		fi
-@@ -590,10 +581,8 @@ if test "x$with_zlib" != "xno" -a "x$with_libz" != "xno"; then
- 		saved_LDFLAGS="$LDFLAGS"
- 		CPPFLAGS="$CPPFLAGS -I$with_zlib/include"
- 		LDFLAGS="$LDFLAGS -L$with_zlib/lib"
--		if test "x$ld_minus_R" = "xno"; then
-+		if test "x$ld_minus_R" = "xno" -o "x$GCC" = "xyes"; then
- 			:
--		elif test "x$GCC" = "xyes"; then
--			LDFLAGS="$LDFLAGS -Xlinker -R$with_zlib/lib"
- 		else
- 			LDFLAGS="$LDFLAGS -R$with_zlib/lib"
- 		fi
--- 
-2.8.1
-
diff --git a/meta-oe/recipes-graphics/x11vnc/files/src-cursor-fix-xfc-NULL-pointer-dereference.patch b/meta-oe/recipes-graphics/x11vnc/files/src-cursor-fix-xfc-NULL-pointer-dereference.patch
deleted file mode 100644
index a571ba2838..0000000000
--- a/meta-oe/recipes-graphics/x11vnc/files/src-cursor-fix-xfc-NULL-pointer-dereference.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 95a10ab64c2dbbec2c8dad91a5ffb73a0d68474b Mon Sep 17 00:00:00 2001
-From: Jonathan Liu <net147@gmail.com>
-Date: Mon, 16 Mar 2020 20:04:06 +1100
-Subject: [PATCH] src/cursor: fix xfc NULL pointer dereference
-
-xfc->width and xfc->height for the XFixes cursor image returned from
-XFixesGetCursorImage(dpy) are accessed without first checking that xfc
-is not NULL. This can result in the server sometimes crashing when
-moving a Google Chrome window.
-
-Fixes: 37c946191a0f ("Broken cursor bugfix for 64 bit systems (#49)")
-Upstream-Status: Accepted
-Signed-off-by: Jonathan Liu <net147@gmail.com>
----
- src/cursor.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/cursor.c b/src/cursor.c
-index 39e73a6..74a08c6 100644
---- a/src/cursor.c
-+++ b/src/cursor.c
-@@ -1311,7 +1311,7 @@ static int get_exact_cursor(int init) {
- 
- 		/* retrieve the cursor info + pixels from server: */
- 		xfc = XFixesGetCursorImage(dpy);
--		{
-+		if (xfc) {
- 			/* 2017-07-09, Stephan Fuhrmann: This fixes an implementation flaw for 64 bit systems.
- 			 * The XFixesCursorImage structure says xfc->pixels is (unsigned long*) in the structure, but
- 			 * the protocol spec says it's 32 bit per pixel
diff --git a/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.16.bb b/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.16.bb
index e3a1914fef..50ce9a59e0 100644
--- a/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.16.bb
+++ b/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.16.bb
@@ -7,12 +7,11 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://src/x11vnc.h;endline=31;md5=e871a2ad004776794b616822dcab6314"
 
-SRCREV = "4ca006fed80410bd9b061a1519bd5d9366bb0bc8"
+SRCREV = "87cd0530f438372dda3c70bb491a6fd19f09acc2"
+PV .= "+git${SRCPV}"
+
 SRC_URI = "git://github.com/LibVNC/x11vnc \
            file://starting-fix.patch \
-           file://0001-misc-Makefile.am-don-t-install-Xdummy-when-configure.patch \
-           file://0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch \
-           file://src-cursor-fix-xfc-NULL-pointer-dereference.patch \
            "
 S = "${WORKDIR}/git"
 
-- 
2.28.0

