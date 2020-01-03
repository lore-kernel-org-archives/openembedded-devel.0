Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3CE087F8D0
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Jan 2020 02:49:39 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id w62so22906442pfw.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jan 2020 18:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=FG2loYH810ihu3+fLdFtxSuDG7sE9B0UmecDD3t+p9Q=;
	b=WiMqI0F1FFOEvmrhdq/9ktyXaAw6vLwr/MLUAQLSzwqlEiFjibQ47nO6GH7ZDTMmWM
	UtH8muNGA8wmO1qxMPGgVA0bbtalv2tka4gwrNPqkgV7kM+sV0qhaQuve9LmTnpHnaMk
	5pa2cAEZrdoKaUW21g5WQi1xLhvU0Tlfb5YT0qzlaKHC9G24AqSLan4tJLIUHayHZmA1
	X+/Ij/y0nPR/kKh2KmTcHrZmzY2zOzuC0aPFG7xBoq1RIin0lKoSmhl5Izpct9GHUaTa
	kkCuQIXP3/dIYmtleAiRLLai221TvMV7DHTstXA6RFmTDUX7vckryo2gwjebf2vFqtbH
	i2HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=FG2loYH810ihu3+fLdFtxSuDG7sE9B0UmecDD3t+p9Q=;
	b=t8za7YBByqEqo8mV1l4MrcWNAEwhN15bL2VnwrIi2JDZ4W7nU981TvQx8GSD4y2Wa/
	CZ5zA88H0WCPXoVSDgajaotbNo9CtG+K3evQDouzPsWJjWbEVW5wEUDq63QAzNyYvBpZ
	Mi8MDEouLSqWST+bsMwMb6H5HeONLmsVT59NvxY0sodm5B++dQrpYfsi/6ZqTkSgQWbR
	OwGR+tFhRxtVJ5JKToGUjW/Dg6+93jTGuIJM43o2zsEKx4lUwGt3b5jSr6HZ1tCDTJ6F
	pRwglM9f5NJFSixeanIf25oHUiAsVtz6kzsVebwyxoouKuDfFSAejrPpqsfMbu62RPvZ
	lQIg==
X-Gm-Message-State: APjAAAWRV2DKFtZ8+TlsZakTs2dHkuJ+l70mph3QeKBuQ+RbiZmcTa7u
	cDeFAZhXgOztoSGy5Te6qnJn0+K+Pcc=
X-Google-Smtp-Source: APXvYqxpwPIw41JH3dHcNvKrehRZeyZiGRfYvi6GzGzISunhYAF0aP7CA1/fIHdMOePI8rDgiPALjA==
X-Received: by 2002:a63:3409:: with SMTP id b9mr93557112pga.320.1578019780070; 
	Thu, 02 Jan 2020 18:49:40 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:555:ddff:6770:148b])
	by smtp.gmail.com with ESMTPSA id
	p5sm61306640pga.69.2020.01.02.18.49.39
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 02 Jan 2020 18:49:39 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Jan 2020 18:49:07 -0800
Message-Id: <40b5dfaa62bdc28f0ebda184cc546ae5ec6e2d15.1578019547.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578019547.git.akuster808@gmail.com>
References: <cover.1578019547.git.akuster808@gmail.com>
Subject: [zeus 10/17] utouch-evemu, utouch-frame: Fix build for 32bit arches with 64bit time_t
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
X-List-Received-Date: Fri, 03 Jan 2020 02:49:39 -0000

From: Khem Raj <raj.khem@gmail.com>

Move patches from files/ directory into PN folders to avoid conflicts

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 91f8512c8e97068876f9a4053775c7881e8b32d4)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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
index 00000000000..71bf5726994
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
index 1dd5a86d505..41d1cbfd978 100644
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
index 00000000000..d405d43f140
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
index 39d46af8e94..1ebebfa9f5e 100644
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
2.17.1


