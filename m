Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 31E9E7F959
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Jan 2020 02:49:40 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id z16so22926915pfk.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jan 2020 18:49:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=+LYS8t9G4Q2oJlGj07wi7PtI980NQL9X4owF9e9Ju38=;
	b=bRtmkNklSEhbA3Gc4bBUec2LP+zW0aC+hVsA+KI5NNgSrquTlNM07P7johTv9rYhtv
	ZDNiyJDA6yMB1hvc+lMnNLxnzQ4VHdO6FDrZs+h/qxyDoiKUnEFWewbRm1p8/NjRzwva
	xZWyqUzmPdXw6fx65dpxUQcha8rzMq9k+pHWpL9u5nUbaSeOSq5LPmNDiYdYTGO3dOEv
	1sLQrc5H+uo3iVawjFGkHVtWDU4BsVgg/HZRmWYSAt7CG+OGUn+P/wAsv9eS7eyLUJIP
	TPhLFCm5aXCL3QaHVD5a4Ki5QazvdHMjJ5HBevvXGUU7fHeRuW3kfVpmFAAuLbdjIqSf
	3meA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=+LYS8t9G4Q2oJlGj07wi7PtI980NQL9X4owF9e9Ju38=;
	b=I/NrHC4b3f55oXjYM4FrHJd8O3Oyva03hL7rhCu3r/VNRIUsOvEDKdfSS34zwYlX7k
	rdyNPYyPqcGH5LGfk5jml61rxzqsdR7q4DCcUh9E/o7tLMUjO49h2vV4VgCDtX1DVmqY
	h4FXtnTolxm8r2WPx7UYk6zXo4Udvyc5SzGEQJjlg39FzS2U5bY9d7HnKY2tBBzElifl
	p0xbUu/8TqaSmKz2bY1Nj44667oF2psSCR7OslA3IN6D+p/rnmGrqleJwR7Tsb8s55lk
	+0zV5t/5xqFkJFpwpJ7ZgdQ5HbOIACEBIShgS6wjYYLianQK1J7eYGcexEi43pIipofk
	I5Gg==
X-Gm-Message-State: APjAAAUiYDOyhIpq9CVkAigl6h5wF2MTq6+OVacD60E6FIMTUXeyCEg9
	5cTlWCFgKBIooFp0c9nDY6L6aB+Sd/c=
X-Google-Smtp-Source: APXvYqxxDA0igS+whYdA+AfeOEkr8AqntCWdLzzDzbwHQxHcr3WiL8fRDKhcjrnYemmXOKnY+UiQHw==
X-Received: by 2002:a63:70e:: with SMTP id 14mr91462958pgh.266.1578019780964; 
	Thu, 02 Jan 2020 18:49:40 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:555:ddff:6770:148b])
	by smtp.gmail.com with ESMTPSA id
	p5sm61306640pga.69.2020.01.02.18.49.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 02 Jan 2020 18:49:40 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Jan 2020 18:49:08 -0800
Message-Id: <d95a06673593eec035f58752bf32b40e07808bb3.1578019547.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578019547.git.akuster808@gmail.com>
References: <cover.1578019547.git.akuster808@gmail.com>
Subject: [zeus 11/17] directfb: Fix build for 32bit arches with 64bit time_t
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
X-List-Received-Date: Fri, 03 Jan 2020 02:49:40 -0000

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 310047ec9f2667ae1a98a55aa14edb87cd1e1e6c)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-graphics/directfb/directfb.inc    |   3 +-
 ...ld-on-32bit-arches-with-64bit-time_t.patch | 139 ++++++++++++++++++
 2 files changed, 141 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-graphics/directfb/directfb/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch

diff --git a/meta-oe/recipes-graphics/directfb/directfb.inc b/meta-oe/recipes-graphics/directfb/directfb.inc
index 96aa31117f2..65fd89e6fef 100644
--- a/meta-oe/recipes-graphics/directfb/directfb.inc
+++ b/meta-oe/recipes-graphics/directfb/directfb.inc
@@ -21,7 +21,8 @@ SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/DirectFB-${PV}.tar.g
            file://use-PTHREAD_MUTEX_RECURSIVE.patch \
            file://fix-client-gfx_state-initialisation.patch \
            file://fix-tslib-version-check.patch \
-          "
+           file://0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch \
+           "
 
 S = "${WORKDIR}/DirectFB-${PV}"
 
diff --git a/meta-oe/recipes-graphics/directfb/directfb/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch b/meta-oe/recipes-graphics/directfb/directfb/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
new file mode 100644
index 00000000000..2f766465e1c
--- /dev/null
+++ b/meta-oe/recipes-graphics/directfb/directfb/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
@@ -0,0 +1,139 @@
+From 0b66557f2e924023b12006b58d8e86149c745aed Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 30 Nov 2019 20:34:33 -0800
+Subject: [PATCH] Fix build on 32bit arches with 64bit time_t
+
+time element is deprecated on new input_event structure in kernel's
+input.h [1]
+
+[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=152194fe9c3f
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ inputdrivers/linux_input/linux_input.c | 36 ++++++++++++++++++--------
+ 1 file changed, 25 insertions(+), 11 deletions(-)
+
+diff --git a/inputdrivers/linux_input/linux_input.c b/inputdrivers/linux_input/linux_input.c
+index 7e9a6ad..03deebc 100644
+--- a/inputdrivers/linux_input/linux_input.c
++++ b/inputdrivers/linux_input/linux_input.c
+@@ -42,6 +42,11 @@ typedef unsigned long kernel_ulong_t;
+ 
+ #include <linux/input.h>
+ 
++#ifndef input_event_sec
++#define input_event_sec time.tv_sec
++#define input_event_usec time.tv_usec
++#endif
++
+ #ifndef KEY_OK
+ /* Linux kernel 2.5.42+ defines additional keys in linux/input.h */
+ #include "input_fake.h"
+@@ -754,7 +759,8 @@ translate_event( const LinuxInputData     *data,
+                  DFBInputEvent            *devt )
+ {
+      devt->flags     = DIEF_TIMESTAMP;
+-     devt->timestamp = levt->time;
++     devt->timestamp.tv_sec = levt->input_event_sec;
++     devt->timestamp.tv_usec = levt->input_event_usec;
+ 
+      switch (levt->type) {
+           case EV_KEY:
+@@ -2139,7 +2145,8 @@ touchpad_translate( struct touchpad_fsm_state *state,
+      int abs, rel;
+ 
+      devt->flags     = DIEF_TIMESTAMP | (dfb_config->linux_input_touch_abs ? DIEF_AXISABS : DIEF_AXISREL);
+-     devt->timestamp = levt->time;
++     devt->timestamp.tv_sec = levt->input_event_sec;
++     devt->timestamp.tv_usec = levt->input_event_usec;
+      devt->type      = DIET_AXISMOTION;
+ 
+      switch (levt->code) {
+@@ -2204,7 +2211,7 @@ touchpad_fsm( struct touchpad_fsm_state *state,
+               DFBInputEvent             *devt )
+ {
+      struct timeval timeout = { 0, 125000 };
+-
++     struct timeval tval;
+      /* select() timeout? */
+      if (!levt) {
+           /* Check if button release is due. */
+@@ -2223,6 +2230,8 @@ touchpad_fsm( struct touchpad_fsm_state *state,
+           return 0;
+      }
+ 
++     tval.tv_sec = levt->input_event_sec;
++     tval.tv_usec = levt->input_event_usec;
+      /* More or less ignore these events for now */
+      if ((levt->type == EV_SYN && levt->code == SYN_REPORT) ||
+          (levt->type == EV_ABS && levt->code == ABS_PRESSURE) ||
+@@ -2233,7 +2242,7 @@ touchpad_fsm( struct touchpad_fsm_state *state,
+ 
+           /* Check if button release is due. */
+           if (state->fsm_state == TOUCHPAD_FSM_DRAG_START &&
+-              timeout_passed( &state->timeout, &levt->time )) {
++              timeout_passed( &state->timeout, &tval )) {
+                devt->flags     = DIEF_TIMESTAMP;
+                devt->timestamp = state->timeout; /* timeout of levt->time? */
+                devt->type      = DIET_BUTTONRELEASE;
+@@ -2255,7 +2264,8 @@ touchpad_fsm( struct touchpad_fsm_state *state,
+      case TOUCHPAD_FSM_START:
+           if (touchpad_finger_landing( levt )) {
+                state->fsm_state = TOUCHPAD_FSM_MAIN;
+-               state->timeout = levt->time;
++               state->timeout.tv_sec = levt->input_event_sec;
++               state->timeout.tv_usec = levt->input_event_usec;
+                timeout_add( &state->timeout, &timeout );
+           }
+           return 0;
+@@ -2268,15 +2278,17 @@ touchpad_fsm( struct touchpad_fsm_state *state,
+                }
+           }
+           else if (touchpad_finger_leaving( levt )) {
+-               if (!timeout_passed( &state->timeout, &levt->time )) {
++               if (!timeout_passed( &state->timeout, &tval )) {
+                     devt->flags     = DIEF_TIMESTAMP;
+-                    devt->timestamp = levt->time;
++                    devt->timestamp.tv_sec = levt->input_event_sec;
++                    devt->timestamp.tv_usec = levt->input_event_usec;
+                     devt->type      = DIET_BUTTONPRESS;
+                     devt->button    = DIBI_FIRST;
+ 
+                     touchpad_fsm_init( state );
+                     state->fsm_state = TOUCHPAD_FSM_DRAG_START;
+-                    state->timeout = levt->time;
++                    state->timeout.tv_sec = levt->input_event_sec;
++                    state->timeout.tv_usec = levt->input_event_usec;
+                     timeout_add( &state->timeout, &timeout );
+                     return 1;
+                }
+@@ -2287,7 +2299,7 @@ touchpad_fsm( struct touchpad_fsm_state *state,
+           return 0;
+ 
+      case TOUCHPAD_FSM_DRAG_START:
+-          if (timeout_passed( &state->timeout, &levt->time )){
++          if (timeout_passed( &state->timeout, &tval )){
+                devt->flags     = DIEF_TIMESTAMP;
+                devt->timestamp = state->timeout; /* timeout of levt->time? */
+                devt->type      = DIET_BUTTONRELEASE;
+@@ -2299,7 +2311,8 @@ touchpad_fsm( struct touchpad_fsm_state *state,
+           else {
+                if (touchpad_finger_landing( levt )) {
+                     state->fsm_state = TOUCHPAD_FSM_DRAG_MAIN;
+-                    state->timeout = levt->time;
++                    state->timeout.tv_sec = levt->input_event_sec;
++                    state->timeout.tv_usec = levt->input_event_usec;
+                     timeout_add( &state->timeout, &timeout );
+                }
+           }
+@@ -2314,7 +2327,8 @@ touchpad_fsm( struct touchpad_fsm_state *state,
+           }
+           else if (touchpad_finger_leaving( levt )) {
+                devt->flags     = DIEF_TIMESTAMP;
+-               devt->timestamp = levt->time;
++               devt->timestamp.tv_sec = levt->input_event_sec;
++               devt->timestamp.tv_usec = levt->input_event_usec;
+                devt->type      = DIET_BUTTONRELEASE;
+                devt->button    = DIBI_FIRST;
+ 
-- 
2.17.1


