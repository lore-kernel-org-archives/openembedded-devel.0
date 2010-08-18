Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jkridner@beagleboard.org>) id 1OlbRx-0003QT-AF
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Aug 2010 07:44:50 +0200
Received: by qwi2 with SMTP id 2so122856qwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Aug 2010 22:44:13 -0700 (PDT)
Received: by 10.229.1.161 with SMTP id 33mr251065qcf.279.1282110253102;
	Tue, 17 Aug 2010 22:44:13 -0700 (PDT)
Received: from localhost.localdomain
	(ec2-75-101-156-174.compute-1.amazonaws.com [75.101.156.174])
	by mx.google.com with ESMTPS id l8sm9806673qck.18.2010.08.17.22.44.11
	(version=SSLv3 cipher=RC4-MD5); Tue, 17 Aug 2010 22:44:12 -0700 (PDT)
From: Jason Kridner <jkridner@beagleboard.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Aug 2010 00:44:09 -0500
Message-Id: <1282110249-30230-1-git-send-email-jkridner@beagleboard.org>
X-Mailer: git-send-email 1.5.6.4
X-SA-Exim-Connect-IP: 209.85.216.47
X-SA-Exim-Mail-From: jkridner@beagleboard.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] x11vnc: replace definition of pointer
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
X-List-Received-Date: Wed, 18 Aug 2010 05:44:51 -0000

Avoids conflict with Xdefs.h definition of 'pointer'.

Signed-off-by: Jason Kridner <jkridner@beagleboard.org>
---
 ...0001-replaced-pointer-with-x11vnc_pointer.patch |  237 ++++++++++++++++++++
 recipes/vnc/x11vnc_0.9.11.bb                       |    6 +-
 2 files changed, 242 insertions(+), 1 deletions(-)
 create mode 100644 recipes/vnc/files/0001-replaced-pointer-with-x11vnc_pointer.patch

diff --git a/recipes/vnc/files/0001-replaced-pointer-with-x11vnc_pointer.patch b/recipes/vnc/files/0001-replaced-pointer-with-x11vnc_pointer.patch
new file mode 100644
index 0000000..1212299
--- /dev/null
+++ b/recipes/vnc/files/0001-replaced-pointer-with-x11vnc_pointer.patch
@@ -0,0 +1,237 @@
+From e1b41de977fef61a957ab871ed1f23c05cc2fd75 Mon Sep 17 00:00:00 2001
+From: Jason Kridner <jkridner@beagleboard.org>
+Date: Wed, 18 Aug 2010 00:15:24 -0500
+Subject: [PATCH] replaced pointer() with x11vnc_pointer()
+
+Avoids conflict with pointer definition in /usr/include/X11/Xdefs.h.
+
+Signed-off-by: Jason Kridner <jkridner@beagleboard.org>
+---
+ x11vnc/connections.c |    2 +-
+ x11vnc/keyboard.c    |    4 ++--
+ x11vnc/pointer.c     |   16 ++++++++--------
+ x11vnc/pointer.h     |    2 +-
+ x11vnc/remote.c      |    6 +++---
+ x11vnc/scan.c        |    4 ++--
+ x11vnc/screen.c      |    2 +-
+ x11vnc/userinput.c   |    8 ++++----
+ 8 files changed, 22 insertions(+), 22 deletions(-)
+
+diff --git a/x11vnc/connections.c b/x11vnc/connections.c
+index 7c549ec..71a2bd1 100644
+--- a/x11vnc/connections.c
++++ b/x11vnc/connections.c
+@@ -3145,7 +3145,7 @@ static void pmove(int x, int y) {
+ 		return;
+ 	}
+ 	rfbLog("pmove: x y: %d %d\n", x, y);
+-	pointer(0, x, y, NULL);
++	x11vnc_pointer(0, x, y, NULL);
+ 	X_LOCK;
+ 	XFlush_wr(dpy);
+ 	X_UNLOCK;
+diff --git a/x11vnc/keyboard.c b/x11vnc/keyboard.c
+index 58e866d..613b8ab 100644
+--- a/x11vnc/keyboard.c
++++ b/x11vnc/keyboard.c
+@@ -2898,9 +2898,9 @@ static void pipe_keyboard(rfbBool down, rfbKeySym keysym, rfbClientPtr client) {
+ 			t[1] = '\0';
+ 			if (sscanf(t, "%d", &butt) == 1) {
+ 				mask = 1<<(butt-1);
+-				pointer(mask, x, y, client);
++				x11vnc_pointer(mask, x, y, client);
+ 				mask = 0;
+-				pointer(mask, x, y, client);
++				x11vnc_pointer(mask, x, y, client);
+ 			}
+ 			b++;
+ 		}
+diff --git a/x11vnc/pointer.c b/x11vnc/pointer.c
+index 5e11ed4..45cf47e 100644
+--- a/x11vnc/pointer.c
++++ b/x11vnc/pointer.c
+@@ -54,7 +54,7 @@ int pointer_queued_sent = 0;
+ 
+ void initialize_pointer_map(char *pointer_remap);
+ void do_button_mask_change(int mask, int button);
+-void pointer(int mask, int x, int y, rfbClientPtr client);
++void x11vnc_pointer(int mask, int x, int y, rfbClientPtr client);
+ void initialize_pipeinput(void);
+ int check_pipeinput(void);
+ void update_x11_pointer_position(int x, int y);
+@@ -408,7 +408,7 @@ void do_button_mask_change(int mask, int button) {
+ 				continue;
+ 			}
+ 			if (debug_pointer) {
+-				rfbLog("pointer(): sending button %d"
++				rfbLog("x11vnc_pointer(): sending button %d"
+ 				    " %s (event %d)\n", mb, bmask
+ 				    ? "down" : "up", k+1);
+ 			}
+@@ -427,7 +427,7 @@ void do_button_mask_change(int mask, int button) {
+ 			if (debug_pointer && dpy) {
+ 				char *str = XKeysymToString(XKeycodeToKeysym(
+                                     dpy, key, 0));
+-				rfbLog("pointer(): sending button %d "
++				rfbLog("x11vnc_pointer(): sending button %d "
+ 				    "down as keycode 0x%x (event %d)\n",
+ 				    i+1, key, k+1);
+ 				rfbLog("           down=%d up=%d keysym: "
+@@ -560,7 +560,7 @@ if (debug_scroll > 1) fprintf(stderr, "internal scrollbar: %dx%d\n", w, h);
+ 	for (i=0; i < MAX_BUTTONS; i++) {
+ 	    if ( (button_mask & (1<<i)) != (mask & (1<<i)) ) {
+ 		if (debug_pointer) {
+-			rfbLog("pointer(): mask change: mask: 0x%x -> "
++			rfbLog("x11vnc_pointer(): mask change: mask: 0x%x -> "
+ 			    "0x%x button: %d\n", button_mask, mask,i+1);
+ 		}
+ 		do_button_mask_change(mask, i+1);	/* button # is i+1 */
+@@ -659,7 +659,7 @@ static void pipe_pointer(int mask, int x, int y, rfbClientPtr client) {
+  * This may queue pointer events rather than sending them immediately
+  * to the X server. (see update_x11_pointer*())
+  */
+-void pointer(int mask, int x, int y, rfbClientPtr client) {
++void x11vnc_pointer(int mask, int x, int y, rfbClientPtr client) {
+ 	allowed_input_t input;
+ 	int sent = 0, buffer_it = 0;
+ 	double now;
+@@ -780,7 +780,7 @@ void pointer(int mask, int x, int y, rfbClientPtr client) {
+ 			}
+ 			if (! ok) {
+ 				if (debug_pointer) {
+-				    rfbLog("pointer(): blackout_ptr skipping "
++				    rfbLog("x11vnc_pointer(): blackout_ptr skipping "
+ 					"x=%d y=%d in rectangle %d,%d %d,%d\n", x, y,
+ 					blackr[b].x1, blackr[b].y1,
+ 					blackr[b].x2, blackr[b].y2);
+@@ -911,7 +911,7 @@ void pointer(int mask, int x, int y, rfbClientPtr client) {
+ 	}
+ 	if (mask < 0) {		/* -1 just means flush the event queue */
+ 		if (debug_pointer) {
+-			rfbLog("pointer(): flush only.  %.4f\n",
++			rfbLog("x11vnc_pointer(): flush only.  %.4f\n",
+ 			    dnowx());
+ 		}
+ 		INPUT_UNLOCK;
+@@ -944,7 +944,7 @@ void pointer(int mask, int x, int y, rfbClientPtr client) {
+ 		X_UNLOCK;
+ 	} else if (buffer_it) {
+ 		if (debug_pointer) {
+-			rfbLog("pointer(): calling XFlush+"
++			rfbLog("x11vnc_pointer(): calling XFlush+"
+ 			    "%.4f\n", dnowx());
+ 		}
+ 		X_LOCK;
+diff --git a/x11vnc/pointer.h b/x11vnc/pointer.h
+index 558f381..061af49 100644
+--- a/x11vnc/pointer.h
++++ b/x11vnc/pointer.h
+@@ -39,7 +39,7 @@ extern int pointer_queued_sent;
+ 
+ extern void initialize_pointer_map(char *pointer_remap);
+ extern void do_button_mask_change(int mask, int button);
+-extern void pointer(int mask, int x, int y, rfbClientPtr client);
++extern void x11vnc_pointer(int mask, int x, int y, rfbClientPtr client);
+ extern int check_pipeinput(void);
+ extern void initialize_pipeinput(void);
+ extern void update_x11_pointer_position(int x, int y);
+diff --git a/x11vnc/remote.c b/x11vnc/remote.c
+index cad70f5..61706ae 100644
+--- a/x11vnc/remote.c
++++ b/x11vnc/remote.c
+@@ -4444,9 +4444,9 @@ char *process_remote_cmd(char *cmd, int stringonly) {
+ 		p += strlen("ptr:");
+ 		rfbLog("remote_cmd: insert pointer event: %s\n", p);
+ 		if (sscanf(p, "%d,%d,%d", &x, &y, &m) == 3) {
+-			pointer(m, x, y, NULL);
++			x11vnc_pointer(m, x, y, NULL);
+ 		} else if (sscanf(p, "%d,%d", &x, &y) == 2) {
+-			pointer(m, x, y, NULL);
++			x11vnc_pointer(m, x, y, NULL);
+ 		} else {
+ 			rfbLog("remote_cmd: bad ptr:x,y,mask\n");
+ 		}
+@@ -4611,7 +4611,7 @@ char *process_remote_cmd(char *cmd, int stringonly) {
+ 		} else if (strstr(res, "GRAB_FAIL") && try < max_tries) {
+ 			rfbLog("bcx_xattach: failed grab check for '%s': %s.  Retrying[%d]...\n", p, res, try);
+ 			free(res);
+-			pointer(0, dpy_x/2 + try, dpy_y/2 + try, NULL);
++			x11vnc_pointer(0, dpy_x/2 + try, dpy_y/2 + try, NULL);
+ #if !NO_X11
+ 			X_LOCK;
+ 			XFlush_wr(dpy);
+diff --git a/x11vnc/scan.c b/x11vnc/scan.c
+index 7ef931c..d7722eb 100644
+--- a/x11vnc/scan.c
++++ b/x11vnc/scan.c
+@@ -3550,7 +3550,7 @@ int scan_for_updates(int count_only) {
+ 			fb_copy_in_progress = 0;
+ 			SCAN_FATAL(cs);
+ 			if (use_threads && pointer_mode != 1) {
+-				pointer(-1, 0, 0, NULL);
++				x11vnc_pointer(-1, 0, 0, NULL);
+ 			}
+ 			nap_check(tile_count);
+ 			return tile_count;
+@@ -3637,7 +3637,7 @@ if (tile_count) fprintf(stderr, "XX copytile: %.4f  tile_count: %d\n", dnow() -
+ 		 * tell the pointer handler it can process any queued
+ 		 * pointer events:
+ 		 */
+-		pointer(-1, 0, 0, NULL);
++		x11vnc_pointer(-1, 0, 0, NULL);
+ 	}
+ 
+ 	if (blackouts) {
+diff --git a/x11vnc/screen.c b/x11vnc/screen.c
+index 3389da1..0627f5a 100644
+--- a/x11vnc/screen.c
++++ b/x11vnc/screen.c
+@@ -3616,7 +3616,7 @@ void initialize_screen(int *argc, char **argv, XImage *fb) {
+ 	/* event callbacks: */
+ 	screen->newClientHook = new_client;
+ 	screen->kbdAddEvent = keyboard;
+-	screen->ptrAddEvent = pointer;
++	screen->ptrAddEvent = x11vnc_pointer;
+ 	screen->setXCutText = xcut_receive;
+ 	screen->setTranslateFunction = set_xlate_wrapper;
+ 
+diff --git a/x11vnc/userinput.c b/x11vnc/userinput.c
+index 8c83080..76909da 100644
+--- a/x11vnc/userinput.c
++++ b/x11vnc/userinput.c
+@@ -3008,12 +3008,12 @@ if (db) fprintf(stderr, "check_xrecord: BUTTON-UP-KEEP-GOING:  %.3f/%.3f %d/%d %
+ 	pointer_queued_sent = 0;
+ 	last_x = cursor_x;
+ 	last_y = cursor_y;
+-	pointer(-1, 0, 0, NULL);
++	x11vnc_pointer(-1, 0, 0, NULL);
+ 	pointer_flush_delay = 0.0;
+ 
+ 	if (xrecording && pointer_queued_sent && button_mask_save &&
+ 	    (last_x != cursor_x || last_y != cursor_y) ) {
+-if (db) fprintf(stderr, "  pointer() push yields events on: ret=%d\n", ret);
++if (db) fprintf(stderr, "  x11vnc_pointer() push yields events on: ret=%d\n", ret);
+ 		if (ret == 2) {
+ if (db) fprintf(stderr, "  we decide to send ret=3\n");
+ 			want_back_in = 1;
+@@ -4509,7 +4509,7 @@ if (db) fprintf(stderr, "INTERIOR\n");
+ 	}
+ 
+ 	/*
+-	 * pointer() should have snapped the stacking list for us, if
++	 * x11vnc_pointer() should have snapped the stacking list for us, if
+ 	 * not, do it now (if the XFakeButtonEvent has been flushed by
+ 	 * now the stacking order may be incorrect).
+ 	 */
+@@ -4565,7 +4565,7 @@ if (db) fprintf(stderr, "INTERIOR\n");
+ 	/* -threads support for check_wireframe() is rough... crash? */
+ 	if (use_threads) {
+ 		/* purge any stored up pointer events: */
+-		pointer(-1, 0, 0, NULL);
++		x11vnc_pointer(-1, 0, 0, NULL);
+ 	}
+ 
+ 	if (cursor_noshape_updates_clients(screen)) {
+-- 
+1.5.6.4
+
diff --git a/recipes/vnc/x11vnc_0.9.11.bb b/recipes/vnc/x11vnc_0.9.11.bb
index c81c494..a899e1c 100644
--- a/recipes/vnc/x11vnc_0.9.11.bb
+++ b/recipes/vnc/x11vnc_0.9.11.bb
@@ -5,7 +5,11 @@ SECTION = "x11/utils"
 LICENSE = "GPL"
 DEPENDS = "libxinerama openssl virtual/libx11 libxtst libxext avahi jpeg zlib"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/libvncserver/x11vnc-${PV}.tar.gz"
+PR = "r1"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/libvncserver/x11vnc-${PV}.tar.gz \
+ file://0001-replaced-pointer-with-x11vnc_pointer.patch \
+"
 SRC_URI[md5sum] = "db89b693065f7ff4ec7d6f41e0a0b8ed"
 SRC_URI[sha256sum] = "fbc7a9e6d38afcfbb832d48ea4084823fa6bb9c0e37a925898229ca73639e7f5"
 
-- 
1.5.6.4



