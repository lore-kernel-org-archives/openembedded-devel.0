Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id 74CCB6BE2A
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  1 Dec 2019 18:46:35 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id 6so12661655pgk.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 01 Dec 2019 10:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=eS71B/eLULfANsx6DNtn2Y/ZZByTzvHcKQrc+8v4yNc=;
	b=edqzRMX6by3geqw3qDWM6YwuW1JAXgRfVz6CwYAelRRdoI3USbGXRouJoDWNTAXFN4
	mlUYFzhJx5kjsY+wiU8z3AF333UHz1FYM98+5T/fK/gBAxdWb4S56t24a5JIwkwHk1mR
	TlUzRew3U+oGZhjKtonYlsvlvJXakE/TWTqrKz+Yo7zukjS2Bxkr6Mg2BvCC/NNMlfx8
	dXFeC07m2W02V3YjiSbP043DeLTnP+DVgH4oL+zrgJ3iTu8HU1MuPl6YYaqMuGGb8h8c
	jSSDrouszjCSjiWdoZcRp2P/TAYUrkJ1kAaEeAcmAalnJz0Z6gyKdCjAg6SeQmzVhu7P
	LW5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=eS71B/eLULfANsx6DNtn2Y/ZZByTzvHcKQrc+8v4yNc=;
	b=ChONMol1R0/UWAc8C09pNpAsReJL//bv/bHBwObIwn40+qL9U6fcL90+U5UWCJbZIg
	J2UMCYzDJKoJ0L/9YHVmSt+f7qtrDYl45bAXFwvOf3XKNxBBTT+poypGoX5f3fI25xtr
	nbGlOZYLdJcIEyYl4WssPQpfvlSKb4zID0cbQIQD/PQ9AYBGWnly4Z6zn4JlmH+M0Twd
	6D5YyFWVD+7bbBIummXSdVkhWMXBH/U+vC6PXOpEeCQ+Rmu/BntvZFaAOqCan/a791gW
	vmk3HVC2sPhWLHEPbFKJZtxg0JqXtmr6TLg/sMqmpIwO7mdj+nDtwyrUfZCaqpO0XW+o
	jMGg==
X-Gm-Message-State: APjAAAVTQSqqvuc1Z8b0x2L4L5BVSnKNt3Hwdhy0LjH7j8rEiUrzsEzX
	0CA0DmCTXocyeKOtqDjCiVGFCrZGf1E=
X-Google-Smtp-Source: APXvYqwWrx8WJQVExCxmKls1TU9An+XcW0cQHqhJoXxBNaNVhquXB5z3k+pArcjbZz1B+xzPumrlrQ==
X-Received: by 2002:a63:25c7:: with SMTP id
	l190mr28071650pgl.429.1575225995602; 
	Sun, 01 Dec 2019 10:46:35 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8500:1c20:55f2:e19b:8d5e:a884])
	by smtp.gmail.com with ESMTPSA id
	y24sm33916800pfr.116.2019.12.01.10.46.34
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 01 Dec 2019 10:46:35 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  1 Dec 2019 10:46:15 -0800
Message-Id: <20191201184622.889513-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191201184622.889513-1-raj.khem@gmail.com>
References: <20191201184622.889513-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/9] x11vnc: Fix build for 32bit arches with 64bit time_t
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
X-List-Received-Date: Sun, 01 Dec 2019 18:46:35 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ld-on-32bit-arches-with-64bit-time_t.patch | 111 ++++++++++++++++++
 .../recipes-graphics/x11vnc/x11vnc_0.9.16.bb  |   5 +-
 2 files changed, 114 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/x11vnc/files/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch

diff --git a/meta-oe/recipes-graphics/x11vnc/files/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch b/meta-oe/recipes-graphics/x11vnc/files/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
new file mode 100644
index 0000000000..d44445fa9f
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
index d0c9f774fe..0d84c420a1 100644
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
2.24.0


