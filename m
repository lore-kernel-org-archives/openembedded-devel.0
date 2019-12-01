Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 728107F523
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  1 Dec 2019 18:46:39 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id b19so17349437pfd.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 01 Dec 2019 10:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=s1wGg1ABmVHYUJYOMvx7z7SgxEsWstciWRaAOmdlEgE=;
	b=oB33C037H2Q+pGBrST6zf2/L4zFHx/3z7NEy9Il7tdy3wb3kN2dzUBLnu/WavXLaJf
	e77x6/0nw+38VDHLjFcE7WUJCDx7CtoGZU82R9J5PnFJSeS0tHYW83EUd81SyQbWfOLc
	J2X8pM92KxyDwSFWT92wB5eEa6lqdfFAw4uYqmLXMflJqMDw/B5tvAc/u3JP2oxjgAkL
	deqBiLdAvR6gxoDkO6r83y/BpYuzOO4fETzFYzrtVWk/uBPVaPPWpmBi4aj3EJfWB3kx
	mY15a1Qn3cAgOMqPboD92phnZ+jfi5UzmTWmng9Nh7XSfJVq1ISK2kPuN+UTeVbdOPlp
	i2mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=s1wGg1ABmVHYUJYOMvx7z7SgxEsWstciWRaAOmdlEgE=;
	b=mL9BfgACB9tiYMFe/n2dV7uz1RkskMhxAYumVS0McfQyodfh5aTNra5l8osKpGJG3x
	TC4essjMYIwgN8cl5n+C/F6RLS+/pwfntDj+pyv38Y4fgFXxaAk8iiZykv2V1fntAre2
	TwaTPJEIFnfUKPl5vH2AnUxqO/0kPA5TezboRI7Qh7Q94AbnG3dDsZKE65GlEwUFO8/U
	6dDx8WO1+YAl5aKAqAOp+9+cvGRuq08TKUE1O2/CRrWAwDEw6+b3lBUXHWw48aj1faL7
	lY+2BDfSYFxxZGjvRr4e/0X7CD4v9/8qQpp+LjQofjA0J+ME0GvRaXuYdhut2AuLvZcB
	CV/g==
X-Gm-Message-State: APjAAAUUWEDAhx67PC6rHMrCytGrJ+rknpKHAthc392oRK9MFGWFGubl
	yzEKgi9j+M7RBHQPjAS/IK6gPmXD8ig=
X-Google-Smtp-Source: APXvYqyCEu97Ln23ZZAfX7eJIU0B2HrIRqz9i1re2fHxmZ2tLidvofdbkCc7zIjmnR1l0fiA1WyxfA==
X-Received: by 2002:a63:d406:: with SMTP id a6mr7607365pgh.264.1575226000010; 
	Sun, 01 Dec 2019 10:46:40 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8500:1c20:55f2:e19b:8d5e:a884])
	by smtp.gmail.com with ESMTPSA id
	y24sm33916800pfr.116.2019.12.01.10.46.39
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 01 Dec 2019 10:46:39 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  1 Dec 2019 10:46:20 -0800
Message-Id: <20191201184622.889513-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191201184622.889513-1-raj.khem@gmail.com>
References: <20191201184622.889513-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 7/9] utouch-evemu, utouch-frame: Fix build for 32bit arches with 64bit time_t
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
X-List-Received-Date: Sun, 01 Dec 2019 18:46:39 -0000
Content-Transfer-Encoding: 8bit

Move patches from files/ directory into PN folders to avoid conflicts

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ld-on-32bit-arches-with-64bit-time_t.patch | 76 +++++++++++++++++++
 .../utouch/utouch-evemu_git.bb                |  4 +-
 ...ld-on-32bit-arches-with-64bit-time_t.patch | 41 ++++++++++
 ...tat.h-for-fixing-build-issue-on-musl.patch |  0
 .../remove-man-page-creation.patch            |  0
 .../utouch/utouch-frame_git.bb                |  1 +
 6 files changed, 121 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/utouch/utouch-evemu/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
 create mode 100644 meta-oe/recipes-support/utouch/utouch-frame/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
 rename meta-oe/recipes-support/utouch/{files => utouch-frame}/0001-include-sys-stat.h-for-fixing-build-issue-on-musl.patch (100%)
 rename meta-oe/recipes-support/utouch/{files => utouch-frame}/remove-man-page-creation.patch (100%)

diff --git a/meta-oe/recipes-support/utouch/utouch-evemu/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch b/meta-oe/recipes-support/utouch/utouch-evemu/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
new file mode 100644
index 0000000000..71bf572699
--- /dev/null
+++ b/meta-oe/recipes-support/utouch/utouch-evemu/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
@@ -0,0 +1,76 @@
+From 60987a1df8eb8c9196222375574dcd7bc0ad2daa Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 30 Nov 2019 20:23:27 -0800
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
+ src/evemu-impl.h |  5 +++++
+ src/evemu.c      | 16 +++++++++-------
+ 2 files changed, 14 insertions(+), 7 deletions(-)
+
+diff --git a/src/evemu-impl.h b/src/evemu-impl.h
+index acf2976..c08d861 100644
+--- a/src/evemu-impl.h
++++ b/src/evemu-impl.h
+@@ -21,6 +21,11 @@
+ #include <evemu.h>
+ #include <linux/uinput.h>
+ 
++#ifndef input_event_sec
++#define input_event_sec time.tv_sec
++#define input_event_usec time.tv_usec
++#endif
++
+ #define EVPLAY_NBITS	KEY_CNT
+ #define EVPLAY_NBYTES	((EVPLAY_NBITS + 7) / 8)
+ 
+diff --git a/src/evemu.c b/src/evemu.c
+index 21187af..160c915 100644
+--- a/src/evemu.c
++++ b/src/evemu.c
+@@ -363,7 +363,7 @@ int evemu_read(struct evemu_device *dev, FILE *fp)
+ int evemu_write_event(FILE *fp, const struct input_event *ev)
+ {
+ 	return fprintf(fp, "E: %lu.%06u %04x %04x %d\n",
+-		       ev->time.tv_sec, (unsigned)ev->time.tv_usec,
++		       ev->input_event_sec, (unsigned)ev->input_event_usec,
+ 		       ev->type, ev->code, ev->value);
+ }
+ 
+@@ -391,8 +391,8 @@ int evemu_read_event(FILE *fp, struct input_event *ev)
+ 	int value;
+ 	int ret = fscanf(fp, "E: %lu.%06u %04x %04x %d\n",
+ 			 &sec, &usec, &type, &code, &value);
+-	ev->time.tv_sec = sec;
+-	ev->time.tv_usec = usec;
++	ev->input_event_sec = sec;
++	ev->input_event_usec = usec;
+ 	ev->type = type;
+ 	ev->code = code;
+ 	ev->value = value;
+@@ -411,12 +411,14 @@ int evemu_read_event_realtime(FILE *fp, struct input_event *ev,
+ 
+ 	if (evtime) {
+ 		if (!evtime->tv_sec)
+-			*evtime = ev->time;
+-		usec = 1000000L * (ev->time.tv_sec - evtime->tv_sec);
+-		usec += ev->time.tv_usec - evtime->tv_usec;
++			evtime->tv_sec = ev->input_event_sec;
++			evtime->tv_usec = ev->input_event_usec;
++		usec = 1000000L * (ev->input_event_sec - evtime->tv_sec);
++		usec += ev->input_event_usec - evtime->tv_usec;
+ 		if (usec > 500) {
+ 			usleep(usec);
+-			*evtime = ev->time;
++			evtime->tv_sec = ev->input_event_sec;
++			evtime->tv_usec = ev->input_event_usec;
+ 		}
+ 	}
+ 
diff --git a/meta-oe/recipes-support/utouch/utouch-evemu_git.bb b/meta-oe/recipes-support/utouch/utouch-evemu_git.bb
index 1dd5a86d50..41d1cbfd97 100644
--- a/meta-oe/recipes-support/utouch/utouch-evemu_git.bb
+++ b/meta-oe/recipes-support/utouch/utouch-evemu_git.bb
@@ -7,7 +7,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
 
 inherit autotools
 
-SRC_URI = "git://bitmath.org/git/evemu.git;protocol=http"
+SRC_URI = "git://bitmath.org/git/evemu.git;protocol=http \
+           file://0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch \
+           "
 SRCREV = "9752b50e922572e4cd214ac45ed95e4ee410fe24"
 
 PV = "1.0.5+git${SRCPV}"
diff --git a/meta-oe/recipes-support/utouch/utouch-frame/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch b/meta-oe/recipes-support/utouch/utouch-frame/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
new file mode 100644
index 0000000000..d405d43f14
--- /dev/null
+++ b/meta-oe/recipes-support/utouch/utouch-frame/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
@@ -0,0 +1,41 @@
+From 895b6996e232700fb2a428838feaef418cc64b70 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 30 Nov 2019 22:52:13 -0800
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
+ src/frame-mtdev.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/src/frame-mtdev.c b/src/frame-mtdev.c
+index c0f15d8..42ad380 100644
+--- a/src/frame-mtdev.c
++++ b/src/frame-mtdev.c
+@@ -25,6 +25,11 @@
+ #include <errno.h>
+ #include <math.h>
+ 
++#ifndef input_event_sec
++#define input_event_sec time.tv_sec
++#define input_event_usec time.tv_usec
++#endif
++
+ static int is_pointer(const struct evemu_device *dev)
+ {
+ 	return evemu_has_event(dev, EV_REL, REL_X) ||
+@@ -200,7 +205,7 @@ static int handle_abs_event(utouch_frame_handle fh,
+ static utouch_frame_time_t get_evtime_ms(const struct input_event *syn)
+ {
+ 	static const utouch_frame_time_t ms = 1000;
+-	return syn->time.tv_usec / ms + syn->time.tv_sec * ms;
++	return syn->input_event_usec / ms + syn->input_event_sec * ms;
+ }
+ 
+ const struct utouch_frame *
diff --git a/meta-oe/recipes-support/utouch/files/0001-include-sys-stat.h-for-fixing-build-issue-on-musl.patch b/meta-oe/recipes-support/utouch/utouch-frame/0001-include-sys-stat.h-for-fixing-build-issue-on-musl.patch
similarity index 100%
rename from meta-oe/recipes-support/utouch/files/0001-include-sys-stat.h-for-fixing-build-issue-on-musl.patch
rename to meta-oe/recipes-support/utouch/utouch-frame/0001-include-sys-stat.h-for-fixing-build-issue-on-musl.patch
diff --git a/meta-oe/recipes-support/utouch/files/remove-man-page-creation.patch b/meta-oe/recipes-support/utouch/utouch-frame/remove-man-page-creation.patch
similarity index 100%
rename from meta-oe/recipes-support/utouch/files/remove-man-page-creation.patch
rename to meta-oe/recipes-support/utouch/utouch-frame/remove-man-page-creation.patch
diff --git a/meta-oe/recipes-support/utouch/utouch-frame_git.bb b/meta-oe/recipes-support/utouch/utouch-frame_git.bb
index 39d46af8e9..1ebebfa9f5 100644
--- a/meta-oe/recipes-support/utouch/utouch-frame_git.bb
+++ b/meta-oe/recipes-support/utouch/utouch-frame_git.bb
@@ -12,6 +12,7 @@ inherit autotools pkgconfig
 SRC_URI = "git://bitmath.org/git/frame.git;protocol=http \
            file://remove-man-page-creation.patch \
            file://0001-include-sys-stat.h-for-fixing-build-issue-on-musl.patch \
+           file://0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch \
            "
 SRCREV = "95363d5a1f7394d71144bf3b408ef4e6db4350fc"
 
-- 
2.24.0


