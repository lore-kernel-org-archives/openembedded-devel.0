Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9FB547F57B
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  1 Dec 2019 18:46:40 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id j12so15221481plt.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 01 Dec 2019 10:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=8M+EWRZegpJRFAZsRz87fEgbHc9sIlJGj4IsRZHrkzg=;
	b=EKKvvKCDgwUroYHrnU9WNtB6jvc4oUdcyysi0tKChBndrI43x3a+gAPQZhkzJihyzw
	kAU8dzNIkfceI//H/uyKU00ePTjJ9tNnk+7bIXljA7cY5SMlKJ0vU/uDrX7ht3XxpATg
	UlL6m/j/ZoPRBQx/fZrvs67VHj/HEJhx5CEQiyArOIwCveqWXjIy1/HzKvdUZTJNnerd
	8aFDdoY1DLbIvvC8El0kPq4saP3pBI5JgjEiS14marZjcIXwP8HJuwIkWaifPW1oE7Zi
	2O4qXXQR/mW4X1T+M7UYTs5ZQQ9a1secMIiqcrmndBz9bmvhkFCAb6CowZwfpHP5LHzA
	riLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=8M+EWRZegpJRFAZsRz87fEgbHc9sIlJGj4IsRZHrkzg=;
	b=HPfHqQYlyVksb8gjtyadJz6az5fAs50LQ4MB5kwTuZRpWUHNm1Pk9R/pVuHUld/1V1
	k+xIaQygpss6WW/a9aU/DNLiUn0LEWx85crl4HE/TbwGCSpEMSaNzBwwZ1s/cLupsRp6
	BMspFaOmdkeXZUXaPBjLiXqFd2l9yJEpMSwa8KTJYBFTTgFU6mFA9v/tZ9KFpta5B1Kw
	jn994duQ3XorCxBzMndmMj2XdSlsGPdSSBpOkPy/QJ9cw00SdF0Hc2GtIgqdRBtZzbHX
	2HeKrqXaebtRLIJanyVW2iYkRqt/1cqAULA+29OqBcMvL0YoikOdb50u/TGnWX6BQzp3
	DzRA==
X-Gm-Message-State: APjAAAVqUzwlnALQnMvgtpN+4ZUIx3wFGu4wrfN6jo4dZVe3S1HIMh3R
	5s2nlaZOyKIje+ooW9kTQ1ibL3qdk4g=
X-Google-Smtp-Source: APXvYqy7rJEEkPkuBnOOr8rvvEQvC8YkDfPhgPev9Sj38RvsquodnjrM4oV4ZAWepkmepM+CKCq/NQ==
X-Received: by 2002:a17:90a:c795:: with SMTP id
	gn21mr2160409pjb.95.1575226001142; 
	Sun, 01 Dec 2019 10:46:41 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8500:1c20:55f2:e19b:8d5e:a884])
	by smtp.gmail.com with ESMTPSA id
	y24sm33916800pfr.116.2019.12.01.10.46.40
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 01 Dec 2019 10:46:40 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  1 Dec 2019 10:46:21 -0800
Message-Id: <20191201184622.889513-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191201184622.889513-1-raj.khem@gmail.com>
References: <20191201184622.889513-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 8/9] directfb: Fix build for 32bit arches with 64bit time_t
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
X-List-Received-Date: Sun, 01 Dec 2019 18:46:40 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-graphics/directfb/directfb.inc    |   3 +-
 ...ld-on-32bit-arches-with-64bit-time_t.patch | 139 ++++++++++++++++++
 2 files changed, 141 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-graphics/directfb/directfb/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch

diff --git a/meta-oe/recipes-graphics/directfb/directfb.inc b/meta-oe/recipes-graphics/directfb/directfb.inc
index 96aa31117f..65fd89e6fe 100644
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
index 0000000000..2f766465e1
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
2.24.0


