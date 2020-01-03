Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id 200837F95C
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Jan 2020 02:49:36 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id q127so22799487pga.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jan 2020 18:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=GjcbhPo2NV21z/XYeAFdf97yjK3dBFx51hh5N9SdLLg=;
	b=qbhzjxmDHZOublzmtwWzDn2uS6QqnVNV86OEEvk/x1RJvV5cwqig0VveIbWs1XdUet
	sUZ+ahbJ4qZKvPtGgrHvAVMO6GozU8t0mlylHawIEcAWSRpE8c1hE832MYzxmh+RxUqV
	3EM6japfPECNsteTrF9MpkN3Tz/wrnKmm6zREOHBVOYsQDgU5Z+4lp+fV2bZOAjhDG/3
	I5iv3pq9nNJIEquhXdMJvdi1211mzsDacBjyiLkeIevnF+WAUrwp9DnlClCqDqHmjCOF
	0PfSz2XU4bfkPkEUkZdrLO/X7HtipNP6FS7pnCxFvMaoaqkGavzg9cW0fD2yi1rXsPHm
	up7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=GjcbhPo2NV21z/XYeAFdf97yjK3dBFx51hh5N9SdLLg=;
	b=KnGS75CBtDKKMCrBs/Rb519MqZ9gjsFwSP5DpOiNT+IekloVHQHDPlOj0YBjX9q8mc
	4HDOoE3gLCT8Za7vF6te/b31bY5KoX3QPZ9AFWDKesWfemxhIkfyQNy6uxbh20X8+ov/
	zHCzOcK1DU/rkjyrUdsMZNZH4NXQBROsyXRbCyRI+fp1616oVBqYdDx9ws5HYmnGqHJY
	jaA4TgYRhB56YesihANS8QmlKGv/pzpUxRWERNqE6grFJnciDgG5Mpl1YU3smbMdaBeG
	bsxGGFfdUkXPXRCtTL+tpmJu0huOm+csr4KuR/XmhG5Rcr2gmzQvR7Z1Y4/Szz/8fCxR
	C8PQ==
X-Gm-Message-State: APjAAAXTM0ZqC9GrifrcJLmNlamLpE6NAhz5rKHV+ihCcbV8QRxq5j9F
	4AEj15Va/FbdZALqNLncuUO6N3cWdFI=
X-Google-Smtp-Source: APXvYqyyvEfb1TwAr5KlDgSzQeWWbY+uZvantwuWmWH5PWGgQ5NfigPqMH3Pb2CCkows9M9Vgx8MYw==
X-Received: by 2002:a63:338e:: with SMTP id z136mr94261458pgz.60.1578019777675;
	Thu, 02 Jan 2020 18:49:37 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:555:ddff:6770:148b])
	by smtp.gmail.com with ESMTPSA id
	p5sm61306640pga.69.2020.01.02.18.49.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 02 Jan 2020 18:49:37 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Jan 2020 18:49:04 -0800
Message-Id: <36fa6edcc7523abe7aa7d0558288d1c969bb077e.1578019547.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578019547.git.akuster808@gmail.com>
References: <cover.1578019547.git.akuster808@gmail.com>
Subject: [zeus 07/17] x11vnc: Fix build for 32bit arches with 64bit time_t
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 03 Jan 2020 02:49:37 -0000

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit aa86b55286e74e5a6d779a14c526561a091cd21e)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...ld-on-32bit-arches-with-64bit-time_t.patch | 111 ++++++++++++++++++
 .../recipes-graphics/x11vnc/x11vnc_0.9.16.bb  |   5 +-
 2 files changed, 114 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/x11vnc/files/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch

diff --git a/meta-oe/recipes-graphics/x11vnc/files/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch b/meta-oe/recipes-graphics/x11vnc/files/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
new file mode 100644
index 00000000000..d44445fa9f5
--- /dev/null
+++ b/meta-oe/recipes-graphics/x11vnc/files/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
@@ -0,0 +1,111 @@
+From 8ab672ccc67b64058cffac2cd19a0d3b75d5aa25 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 30 Nov 2019 11:43:32 -0800
+Subject: [PATCH] Fix build on 32bit arches with 64bit time_t
+
+time element is deprecated on new input_event structure in kernel's
+input.h [1]
+
+[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=152194fe9c3f
+
+Upstream-Status: Submitted [https://github.com/LibVNC/x11vnc/pull/117]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/uinput.c | 28 ++++++++++++++++++++++++----
+ 1 file changed, 24 insertions(+), 4 deletions(-)
+
+diff --git a/src/uinput.c b/src/uinput.c
+index 28fbad3..343b7c5 100644
+--- a/src/uinput.c
++++ b/src/uinput.c
+@@ -54,6 +54,11 @@ so, delete this exception statement from your version.
+ #include <linux/input.h>
+ #include <linux/uinput.h>
+ 
++#ifndef input_event_sec
++#define input_event_sec time.tv_sec
++#define input_event_usec time.tv_usec
++#endif
++
+ #if !defined(EV_SYN) || !defined(SYN_REPORT)
+ #undef UINPUT_OK
+ #endif
+@@ -710,6 +715,7 @@ void parse_uinput_str(char *in) {
+ static void ptr_move(int dx, int dy) {
+ #ifdef UINPUT_OK
+ 	struct input_event ev;
++	struct timeval tval;
+ 	int d = direct_rel_fd < 0 ? fd : direct_rel_fd;
+ 
+ 	if (injectable && strchr(injectable, 'M') == NULL) {
+@@ -720,7 +726,9 @@ static void ptr_move(int dx, int dy) {
+ 
+ 	if (db) fprintf(stderr, "ptr_move(%d, %d) fd=%d\n", dx, dy, d);
+ 
+-	gettimeofday(&ev.time, NULL);
++	gettimeofday(&tval, NULL);
++	ev.input_event_sec = tval.tv_sec;
++	ev.input_event_usec = tval.tv_usec;
+ 	ev.type = EV_REL;
+ 	ev.code = REL_Y;
+ 	ev.value = dy;
+@@ -755,6 +763,7 @@ static void apply_tslib(int *x, int *y) {
+ static void ptr_abs(int x, int y, int p) {
+ #ifdef UINPUT_OK
+ 	struct input_event ev;
++	struct timeval tval;
+ 	int x0, y0;
+ 	int d = direct_abs_fd < 0 ? fd : direct_abs_fd;
+ 
+@@ -773,7 +782,9 @@ static void ptr_abs(int x, int y, int p) {
+ 
+ 	if (db) fprintf(stderr, "ptr_abs(%d, %d => %d %d, p=%d) fd=%d\n", x0, y0, x, y, p, d);
+ 
+-	gettimeofday(&ev.time, NULL);
++	gettimeofday(&tval, NULL);
++	ev.input_event_sec = tval.tv_sec;
++	ev.input_event_usec = tval.tv_usec;
+ 	ev.type = EV_ABS;
+ 	ev.code = ABS_Y;
+ 	ev.value = y;
+@@ -950,6 +961,7 @@ if (0) {usleep(100*1000) ;}
+ static void button_click(int down, int btn) {
+ #ifdef UINPUT_OK
+ 	struct input_event ev;
++	struct timeval tval;
+ 	int d = direct_btn_fd < 0 ? fd : direct_btn_fd;
+ 
+ 	if (injectable && strchr(injectable, 'B') == NULL) {
+@@ -959,7 +971,12 @@ static void button_click(int down, int btn) {
+ 	if (db) fprintf(stderr, "button_click: btn %d %s fd=%d\n", btn, down ? "down" : "up", d);
+ 
+ 	memset(&ev, 0, sizeof(ev));
+-	gettimeofday(&ev.time, NULL);
++	gettimeofday(&tval, NULL);
++	gettimeofday(&tval, NULL);
++	ev.input_event_sec = tval.tv_sec;
++	ev.input_event_usec = tval.tv_usec;
++	ev.input_event_sec = tval.tv_sec;
++	ev.input_event_usec = tval.tv_usec;
+ 	ev.type = EV_KEY;
+ 	ev.value = down;
+ 
+@@ -1230,6 +1247,7 @@ void uinput_pointer_command(int mask, int x, int y, rfbClientPtr client) {
+ void uinput_key_command(int down, int keysym, rfbClientPtr client) {
+ #ifdef UINPUT_OK
+ 	struct input_event ev;
++	struct timeval tval;
+ 	int scancode;
+ 	allowed_input_t input;
+ 	int d = direct_key_fd < 0 ? fd : direct_key_fd;
+@@ -1253,7 +1271,9 @@ void uinput_key_command(int down, int keysym, rfbClientPtr client) {
+ 	if (db) fprintf(stderr, "uinput_key_command: %d -> %d %s fd=%d\n", keysym, scancode, down ? "down" : "up", d);
+ 
+ 	memset(&ev, 0, sizeof(ev));
+-	gettimeofday(&ev.time, NULL);
++	gettimeofday(&tval, NULL);
++	ev.input_event_sec = tval.tv_sec;
++	ev.input_event_usec = tval.tv_usec;
+ 	ev.type = EV_KEY;
+ 	ev.code = (unsigned char) scancode;
+ 	ev.value = down;
diff --git a/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.16.bb b/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.16.bb
index e4a0321357b..af01fb0fd84 100644
--- a/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.16.bb
+++ b/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.16.bb
@@ -10,8 +10,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 SRCREV = "4ca006fed80410bd9b061a1519bd5d9366bb0bc8"
 SRC_URI = "git://github.com/LibVNC/x11vnc \
            file://starting-fix.patch \
-	   file://0001-misc-Makefile.am-don-t-install-Xdummy-when-configure.patch \
-"
+           file://0001-misc-Makefile.am-don-t-install-Xdummy-when-configure.patch \
+           file://0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch \
+           "
 S = "${WORKDIR}/git"
 
 DEPENDS = "\
-- 
2.17.1


