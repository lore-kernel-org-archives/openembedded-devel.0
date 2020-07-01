Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web12.5358.1593632093797212374
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Jul 2020 12:34:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=OAGT3jGz;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id 07A286028E;
	Wed,  1 Jul 2020 21:34:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1593632092;
	bh=/qR6dU4ie2LZ3q+H3o75ZRTl3NRol8Sr/iBqXBHp5po=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OAGT3jGz0j949RrhrAfz0dcHJblJKRK8g9CRsAW1mcm+DRfDkLfqUNk5HDXcF0rZ3
	 B6YN3afb1GwaRZzUWJF4c4RTNliOSWPr1EIECvKxQyT33NtR3ThvKMB///ijPFGFb3
	 aUAck1UTAEDfV4Gmz8R76Vadek6O9fjqyZsPkYPvJ74YJCVJjP5atcK1QVStBq5W2x
	 +FCS4iMUKJbRIu0X2lZBFCnZouB3+AhghGGtam+BJSqs8scAm8NQX4PM7wQCnMGu7p
	 ziVOLToL5YsCJ4Amuihml2x5kHb+BVuQgtc+9huJI3Xh64mQCbmsu0qDK6hAVyfRZf
	 srv/FlY0wbIjw==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-oe][PATCH 2/2] tslib: upgrade 1.21 -> 1.22
Date: Wed,  1 Jul 2020 21:34:47 +0200
Message-Id: <1593632087-18048-2-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593632087-18048-1-git-send-email-pjtexier@koncepto.io>
References: <1593632087-18048-1-git-send-email-pjtexier@koncepto.io>

See full changelog: https://github.com/libts/tslib/releases/tag/1.22

Also remove patches applied upstream.

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 ...error-with-input_event_sec-for-old-kernel.patch |  30 --
 ...x-build-on-32bit-arches-with-64bit-time_t.patch | 389 ---------------------
 .../tslib/{tslib_1.21.bb => tslib_1.22.bb}         |   7 +-
 3 files changed, 2 insertions(+), 424 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/tslib/tslib/0001-Fix-build-error-with-input_event_sec-for-old-kernel.patch
 delete mode 100644 meta-oe/recipes-graphics/tslib/tslib/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
 rename meta-oe/recipes-graphics/tslib/{tslib_1.21.bb => tslib_1.22.bb} (92%)

diff --git a/meta-oe/recipes-graphics/tslib/tslib/0001-Fix-build-error-with-input_event_sec-for-old-kernel.patch b/meta-oe/recipes-graphics/tslib/tslib/0001-Fix-build-error-with-input_event_sec-for-old-kernel.patch
deleted file mode 100644
index ea8a9e5..0000000
--- a/meta-oe/recipes-graphics/tslib/tslib/0001-Fix-build-error-with-input_event_sec-for-old-kernel.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 050bf24c16e95f63a76e13156346a072035d45b4 Mon Sep 17 00:00:00 2001
-From: Evan Harvey <evanwork1234@gmail.com>
-Date: Thu, 19 Mar 2020 01:32:03 -0700
-Subject: [PATCH] Fix build error with input_event_sec for old kernel
-
-Upstream-Status: Backport [https://github.com/libts/tslib/commit/050bf24c16e95f63a76e13156346a072035d45b4]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- tools/ts_uinput.c | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/tools/ts_uinput.c b/tools/ts_uinput.c
-index 1832a07..9c40bb3 100644
---- a/tools/ts_uinput.c
-+++ b/tools/ts_uinput.c
-@@ -51,6 +51,11 @@
- #include <linux/fb.h>
- #endif
- 
-+#ifndef input_event_sec
-+#define input_event_sec time.tv_sec
-+#define input_event_usec time.tv_usec
-+#endif
-+
- #define RESET   "\033[0m"
- #define RED     "\033[31m"
- #define GREEN   "\033[32m"
--- 
-2.26.2
-
diff --git a/meta-oe/recipes-graphics/tslib/tslib/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch b/meta-oe/recipes-graphics/tslib/tslib/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
deleted file mode 100644
index 59bd97a..0000000
--- a/meta-oe/recipes-graphics/tslib/tslib/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
+++ /dev/null
@@ -1,389 +0,0 @@
-From 5455055660700be18eb8800e56e2423031ed4c76 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 30 Nov 2019 19:59:29 -0800
-Subject: [PATCH] Fix build on 32bit arches with 64bit time_t
-
-time element is deprecated on new input_event structure in kernel's
-input.h [1]
-
-[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=152194fe9c3f
-
-Upstream-Status: Submitted [https://github.com/libts/tslib/pull/162]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- plugins/input-raw.c | 59 +++++++++++++++++++++++++++-------------
- tools/ts_uinput.c   | 66 ++++++++++++++++++++++++++++++---------------
- 2 files changed, 85 insertions(+), 40 deletions(-)
-
-diff --git a/plugins/input-raw.c b/plugins/input-raw.c
-index 64f0156..f030836 100644
---- a/plugins/input-raw.c
-+++ b/plugins/input-raw.c
-@@ -40,6 +40,11 @@
- # include <linux/input.h>
- #endif
- 
-+#ifndef input_event_sec
-+#define input_event_sec time.tv_sec
-+#define input_event_usec time.tv_usec
-+#endif
-+
- #ifndef EV_SYN /* 2.4 kernel headers */
- # define EV_SYN 0x00
- #endif
-@@ -384,7 +389,8 @@ static int ts_input_read(struct tslib_module_info *inf,
- 						samp->y = i->current_y;
- 						samp->pressure = i->current_p;
- 					}
--					samp->tv = ev.time;
-+					samp->tv.tv_sec = ev.input_event_sec;
-+					samp->tv.tv_usec = ev.input_event_usec;
- 			#ifdef DEBUG
- 				fprintf(stderr,
- 					"RAW---------------------> %d %d %d %ld.%ld\n",
-@@ -519,7 +525,8 @@ static int ts_input_read(struct tslib_module_info *inf,
- 					samp->pressure = i->current_p = ev.value;
- 					break;
- 				}
--				samp->tv = ev.time;
-+				samp->tv.tv_sec = ev.input_event_sec;
-+				samp->tv.tv_usec = ev.input_event_usec;
- 	#ifdef DEBUG
- 				fprintf(stderr,
- 					"RAW---------------------------> %d %d %d\n",
-@@ -536,7 +543,8 @@ static int ts_input_read(struct tslib_module_info *inf,
- 						samp->x = 0;
- 						samp->y = 0;
- 						samp->pressure = 0;
--						samp->tv = ev.time;
-+						samp->tv.tv_sec = ev.input_event_sec;
-+						samp->tv.tv_usec = ev.input_event_usec;
- 						samp++;
- 						total++;
- 					}
-@@ -651,7 +659,8 @@ static int ts_input_read_mt(struct tslib_module_info *inf,
- 				switch (i->ev[it].code) {
- 				case BTN_TOUCH:
- 					i->buf[total][i->slot].pen_down = i->ev[it].value;
--					i->buf[total][i->slot].tv = i->ev[it].time;
-+					i->buf[total][i->slot].tv.tv_sec = i->ev[it].input_event_sec;
-+					i->buf[total][i->slot].tv.tv_usec = i->ev[it].input_event_usec;
- 					i->buf[total][i->slot].valid |= TSLIB_MT_VALID;
- 					if (i->ev[it].value == 0)
- 						pen_up = 1;
-@@ -751,7 +760,8 @@ static int ts_input_read_mt(struct tslib_module_info *inf,
- 					// fall through
- 				case ABS_MT_POSITION_X:
- 					i->buf[total][i->slot].x = i->ev[it].value;
--					i->buf[total][i->slot].tv = i->ev[it].time;
-+					i->buf[total][i->slot].tv.tv_sec = i->ev[it].input_event_sec;
-+					i->buf[total][i->slot].tv.tv_usec = i->ev[it].input_event_usec;
- 					i->buf[total][i->slot].valid |= TSLIB_MT_VALID;
- 					break;
- 				case ABS_Y:
-@@ -760,7 +770,8 @@ static int ts_input_read_mt(struct tslib_module_info *inf,
- 					// fall through
- 				case ABS_MT_POSITION_Y:
- 					i->buf[total][i->slot].y = i->ev[it].value;
--					i->buf[total][i->slot].tv = i->ev[it].time;
-+					i->buf[total][i->slot].tv.tv_sec = i->ev[it].input_event_sec;
-+					i->buf[total][i->slot].tv.tv_usec = i->ev[it].input_event_usec;
- 					i->buf[total][i->slot].valid |= TSLIB_MT_VALID;
- 					break;
- 				case ABS_PRESSURE:
-@@ -769,12 +780,14 @@ static int ts_input_read_mt(struct tslib_module_info *inf,
- 					// fall through
- 				case ABS_MT_PRESSURE:
- 					i->buf[total][i->slot].pressure = i->ev[it].value;
--					i->buf[total][i->slot].tv = i->ev[it].time;
-+					i->buf[total][i->slot].tv.tv_sec = i->ev[it].input_event_sec;
-+					i->buf[total][i->slot].tv.tv_usec = i->ev[it].input_event_usec;
- 					i->buf[total][i->slot].valid |= TSLIB_MT_VALID;
- 					break;
- 				case ABS_MT_TOOL_X:
- 					i->buf[total][i->slot].tool_x = i->ev[it].value;
--					i->buf[total][i->slot].tv = i->ev[it].time;
-+					i->buf[total][i->slot].tv.tv_sec = i->ev[it].input_event_sec;
-+					i->buf[total][i->slot].tv.tv_usec = i->ev[it].input_event_usec;
- 					i->buf[total][i->slot].valid |= TSLIB_MT_VALID;
- 					/* for future use
- 					 * i->buf[total][i->slot].valid |= TSLIB_MT_VALID_TOOL;
-@@ -782,7 +795,8 @@ static int ts_input_read_mt(struct tslib_module_info *inf,
- 					break;
- 				case ABS_MT_TOOL_Y:
- 					i->buf[total][i->slot].tool_y = i->ev[it].value;
--					i->buf[total][i->slot].tv = i->ev[it].time;
-+					i->buf[total][i->slot].tv.tv_sec = i->ev[it].input_event_sec;
-+					i->buf[total][i->slot].tv.tv_usec = i->ev[it].input_event_usec;
- 					i->buf[total][i->slot].valid |= TSLIB_MT_VALID;
- 					/* for future use
- 					 * i->buf[total][i->slot].valid |= TSLIB_MT_VALID_TOOL;
-@@ -790,7 +804,8 @@ static int ts_input_read_mt(struct tslib_module_info *inf,
- 					break;
- 				case ABS_MT_TOOL_TYPE:
- 					i->buf[total][i->slot].tool_type = i->ev[it].value;
--					i->buf[total][i->slot].tv = i->ev[it].time;
-+					i->buf[total][i->slot].tv.tv_sec = i->ev[it].input_event_sec;
-+					i->buf[total][i->slot].tv.tv_usec = i->ev[it].input_event_usec;
- 					i->buf[total][i->slot].valid |= TSLIB_MT_VALID;
- 					/* for future use
- 					 * i->buf[total][i->slot].valid |= TSLIB_MT_VALID_TOOL;
-@@ -798,12 +813,14 @@ static int ts_input_read_mt(struct tslib_module_info *inf,
- 					break;
- 				case ABS_MT_ORIENTATION:
- 					i->buf[total][i->slot].orientation = i->ev[it].value;
--					i->buf[total][i->slot].tv = i->ev[it].time;
-+					i->buf[total][i->slot].tv.tv_sec = i->ev[it].input_event_sec;
-+					i->buf[total][i->slot].tv.tv_usec = i->ev[it].input_event_usec;
- 					i->buf[total][i->slot].valid |= TSLIB_MT_VALID;
- 					break;
- 				case ABS_MT_DISTANCE:
- 					i->buf[total][i->slot].distance = i->ev[it].value;
--					i->buf[total][i->slot].tv = i->ev[it].time;
-+					i->buf[total][i->slot].tv.tv_sec = i->ev[it].input_event_sec;
-+					i->buf[total][i->slot].tv.tv_usec = i->ev[it].input_event_usec;
- 					i->buf[total][i->slot].valid |= TSLIB_MT_VALID;
- 
- 					if (i->special_device == EGALAX_VERSION_210) {
-@@ -816,34 +833,40 @@ static int ts_input_read_mt(struct tslib_module_info *inf,
- 					break;
- 				case ABS_MT_BLOB_ID:
- 					i->buf[total][i->slot].blob_id = i->ev[it].value;
--					i->buf[total][i->slot].tv = i->ev[it].time;
-+					i->buf[total][i->slot].tv.tv_sec = i->ev[it].input_event_sec;
-+					i->buf[total][i->slot].tv.tv_usec = i->ev[it].input_event_usec;
- 					i->buf[total][i->slot].valid |= TSLIB_MT_VALID;
- 					break;
- 				case ABS_MT_TOUCH_MAJOR:
- 					i->buf[total][i->slot].touch_major = i->ev[it].value;
--					i->buf[total][i->slot].tv = i->ev[it].time;
-+					i->buf[total][i->slot].tv.tv_sec = i->ev[it].input_event_sec;
-+					i->buf[total][i->slot].tv.tv_usec = i->ev[it].input_event_usec;
- 					i->buf[total][i->slot].valid |= TSLIB_MT_VALID;
- 					if (i->ev[it].value == 0)
- 						i->buf[total][i->slot].pressure = 0;
- 					break;
- 				case ABS_MT_WIDTH_MAJOR:
- 					i->buf[total][i->slot].width_major = i->ev[it].value;
--					i->buf[total][i->slot].tv = i->ev[it].time;
-+					i->buf[total][i->slot].tv.tv_sec = i->ev[it].input_event_sec;
-+					i->buf[total][i->slot].tv.tv_usec = i->ev[it].input_event_usec;
- 					i->buf[total][i->slot].valid |= TSLIB_MT_VALID;
- 					break;
- 				case ABS_MT_TOUCH_MINOR:
- 					i->buf[total][i->slot].touch_minor = i->ev[it].value;
--					i->buf[total][i->slot].tv = i->ev[it].time;
-+					i->buf[total][i->slot].tv.tv_sec = i->ev[it].input_event_sec;
-+					i->buf[total][i->slot].tv.tv_usec = i->ev[it].input_event_usec;
- 					i->buf[total][i->slot].valid |= TSLIB_MT_VALID;
- 					break;
- 				case ABS_MT_WIDTH_MINOR:
- 					i->buf[total][i->slot].width_minor = i->ev[it].value;
--					i->buf[total][i->slot].tv = i->ev[it].time;
-+					i->buf[total][i->slot].tv.tv_sec = i->ev[it].input_event_sec;
-+					i->buf[total][i->slot].tv.tv_usec = i->ev[it].input_event_usec;
- 					i->buf[total][i->slot].valid |= TSLIB_MT_VALID;
- 					break;
- 				case ABS_MT_TRACKING_ID:
- 					i->buf[total][i->slot].tracking_id = i->ev[it].value;
--					i->buf[total][i->slot].tv = i->ev[it].time;
-+					i->buf[total][i->slot].tv.tv_sec = i->ev[it].input_event_sec;
-+					i->buf[total][i->slot].tv.tv_usec = i->ev[it].input_event_usec;
- 					i->buf[total][i->slot].valid |= TSLIB_MT_VALID;
- 					if (i->ev[it].value == -1)
- 						i->buf[total][i->slot].pressure = 0;
-diff --git a/tools/ts_uinput.c b/tools/ts_uinput.c
-index 6ca4c3d..1832a07 100644
---- a/tools/ts_uinput.c
-+++ b/tools/ts_uinput.c
-@@ -170,14 +170,16 @@ static int send_touch_events(struct data_t *data, struct ts_sample_mt **s,
- 				continue;
- 
- 			if (s[j][i].pen_down == 1) {
--				data->ev[c].time = s[j][i].tv;
-+				data->ev[c].input_event_sec = s[j][i].tv.tv_sec;
-+				data->ev[c].input_event_usec = s[j][i].tv.tv_usec;
- 				data->ev[c].type = EV_KEY;
- 				data->ev[c].code = BTN_TOUCH;
- 				data->ev[c].value = s[j][i].pen_down;
- 				c++;
- 			}
- 
--			data->ev[c].time = s[j][i].tv;
-+			data->ev[c].input_event_sec = s[j][i].tv.tv_sec;
-+			data->ev[c].input_event_usec = s[j][i].tv.tv_usec;
- 			data->ev[c].type = EV_ABS;
- 			data->ev[c].code = ABS_MT_SLOT;
- 			data->ev[c].value = s[j][i].slot;
-@@ -190,111 +192,129 @@ static int send_touch_events(struct data_t *data, struct ts_sample_mt **s,
- 			 * we should use slot 1 and so on.
- 			 */
- 			if (i == 0) {
--				data->ev[c].time = s[j][i].tv;
-+				data->ev[c].input_event_sec = s[j][i].tv.tv_sec;
-+				data->ev[c].input_event_usec = s[j][i].tv.tv_usec;
- 				data->ev[c].type = EV_ABS;
- 				data->ev[c].code = ABS_X;
- 				data->ev[c].value = s[j][i].x;
- 				c++;
- 
--				data->ev[c].time = s[j][i].tv;
-+				data->ev[c].input_event_sec = s[j][i].tv.tv_sec;
-+				data->ev[c].input_event_usec = s[j][i].tv.tv_usec;
- 				data->ev[c].type = EV_ABS;
- 				data->ev[c].code = ABS_Y;
- 				data->ev[c].value = s[j][i].y;
- 				c++;
- 
--				data->ev[c].time = s[j][i].tv;
-+				data->ev[c].input_event_sec = s[j][i].tv.tv_sec;
-+				data->ev[c].input_event_usec = s[j][i].tv.tv_usec;
- 				data->ev[c].type = EV_ABS;
- 				data->ev[c].code = ABS_PRESSURE;
- 				data->ev[c].value = s[j][i].pressure;
- 				c++;
- 			}
- 
--			data->ev[c].time = s[j][i].tv;
-+			data->ev[c].input_event_sec = s[j][i].tv.tv_sec;
-+			data->ev[c].input_event_usec = s[j][i].tv.tv_usec;
- 			data->ev[c].type = EV_ABS;
- 			data->ev[c].code = ABS_MT_POSITION_X;
- 			data->ev[c].value = s[j][i].x;
- 			c++;
- 
--			data->ev[c].time = s[j][i].tv;
-+			data->ev[c].input_event_sec = s[j][i].tv.tv_sec;
-+			data->ev[c].input_event_usec = s[j][i].tv.tv_usec;
- 			data->ev[c].type = EV_ABS;
- 			data->ev[c].code = ABS_MT_POSITION_Y;
- 			data->ev[c].value = s[j][i].y;
- 			c++;
- 
--			data->ev[c].time = s[j][i].tv;
-+			data->ev[c].input_event_sec = s[j][i].tv.tv_sec;
-+			data->ev[c].input_event_usec = s[j][i].tv.tv_usec;
- 			data->ev[c].type = EV_ABS;
- 			data->ev[c].code = ABS_MT_PRESSURE;
- 			data->ev[c].value = s[j][i].pressure;
- 			c++;
- 
--			data->ev[c].time = s[j][i].tv;
-+			data->ev[c].input_event_sec = s[j][i].tv.tv_sec;
-+			data->ev[c].input_event_usec = s[j][i].tv.tv_usec;
- 			data->ev[c].type = EV_ABS;
- 			data->ev[c].code = ABS_MT_TOUCH_MAJOR;
- 			data->ev[c].value = s[j][i].touch_major;
- 			c++;
- 
--			data->ev[c].time = s[j][i].tv;
-+			data->ev[c].input_event_sec = s[j][i].tv.tv_sec;
-+			data->ev[c].input_event_usec = s[j][i].tv.tv_usec;
- 			data->ev[c].type = EV_ABS;
- 			data->ev[c].code = ABS_MT_WIDTH_MAJOR;
- 			data->ev[c].value = s[j][i].width_major;
- 			c++;
- 
--			data->ev[c].time = s[j][i].tv;
-+			data->ev[c].input_event_sec = s[j][i].tv.tv_sec;
-+			data->ev[c].input_event_usec = s[j][i].tv.tv_usec;
- 			data->ev[c].type = EV_ABS;
- 			data->ev[c].code = ABS_MT_TOUCH_MINOR;
- 			data->ev[c].value = s[j][i].touch_minor;
- 			c++;
- 
--			data->ev[c].time = s[j][i].tv;
-+			data->ev[c].input_event_sec = s[j][i].tv.tv_sec;
-+			data->ev[c].input_event_usec = s[j][i].tv.tv_usec;
- 			data->ev[c].type = EV_ABS;
- 			data->ev[c].code = ABS_MT_WIDTH_MINOR;
- 			data->ev[c].value = s[j][i].width_minor;
- 			c++;
- 
--			data->ev[c].time = s[j][i].tv;
-+			data->ev[c].input_event_sec = s[j][i].tv.tv_sec;
-+			data->ev[c].input_event_usec = s[j][i].tv.tv_usec;
- 			data->ev[c].type = EV_ABS;
- 			data->ev[c].code = ABS_MT_TOOL_TYPE;
- 			data->ev[c].value = s[j][i].tool_type;
- 			c++;
- 
--			data->ev[c].time = s[j][i].tv;
-+			data->ev[c].input_event_sec = s[j][i].tv.tv_sec;
-+			data->ev[c].input_event_usec = s[j][i].tv.tv_usec;
- 			data->ev[c].type = EV_ABS;
- 			data->ev[c].code = ABS_MT_TOOL_X;
- 			data->ev[c].value = s[j][i].tool_x;
- 			c++;
- 
--			data->ev[c].time = s[j][i].tv;
-+			data->ev[c].input_event_sec = s[j][i].tv.tv_sec;
-+			data->ev[c].input_event_usec = s[j][i].tv.tv_usec;
- 			data->ev[c].type = EV_ABS;
- 			data->ev[c].code = ABS_MT_TOOL_Y;
- 			data->ev[c].value = s[j][i].tool_y;
- 			c++;
- 
--			data->ev[c].time = s[j][i].tv;
-+			data->ev[c].input_event_sec = s[j][i].tv.tv_sec;
-+			data->ev[c].input_event_usec = s[j][i].tv.tv_usec;
- 			data->ev[c].type = EV_ABS;
- 			data->ev[c].code = ABS_MT_ORIENTATION;
- 			data->ev[c].value = s[j][i].orientation;
- 			c++;
- 
--			data->ev[c].time = s[j][i].tv;
-+			data->ev[c].input_event_sec = s[j][i].tv.tv_sec;
-+			data->ev[c].input_event_usec = s[j][i].tv.tv_usec;
- 			data->ev[c].type = EV_ABS;
- 			data->ev[c].code = ABS_MT_DISTANCE;
- 			data->ev[c].value = s[j][i].distance;
- 			c++;
- 
--			data->ev[c].time = s[j][i].tv;
-+			data->ev[c].input_event_sec = s[j][i].tv.tv_sec;
-+			data->ev[c].input_event_usec = s[j][i].tv.tv_usec;
- 			data->ev[c].type = EV_ABS;
- 			data->ev[c].code = ABS_MT_BLOB_ID;
- 			data->ev[c].value = s[j][i].blob_id;
- 			c++;
- 
--			data->ev[c].time = s[j][i].tv;
-+			data->ev[c].input_event_sec = s[j][i].tv.tv_sec;
-+			data->ev[c].input_event_usec = s[j][i].tv.tv_usec;
- 			data->ev[c].type = EV_ABS;
- 			data->ev[c].code = ABS_MT_TRACKING_ID;
- 			data->ev[c].value = s[j][i].tracking_id;
- 			c++;
- 
- 			if (data->mt_type_a == 1) {
--				data->ev[c].time = s[j][i].tv;
-+				data->ev[c].input_event_sec = s[j][i].tv.tv_sec;
-+				data->ev[c].input_event_usec = s[j][i].tv.tv_usec;
- 				data->ev[c].type = EV_SYN;
- 				data->ev[c].code = SYN_MT_REPORT;
- 				data->ev[c].value = 0;
-@@ -302,7 +322,8 @@ static int send_touch_events(struct data_t *data, struct ts_sample_mt **s,
- 			}
- 
- 			if (s[j][i].pen_down == 0) {
--				data->ev[c].time = s[j][i].tv;
-+				data->ev[c].input_event_sec = s[j][i].tv.tv_sec;
-+				data->ev[c].input_event_usec = s[j][i].tv.tv_usec;
- 				data->ev[c].type = EV_KEY;
- 				data->ev[c].code = BTN_TOUCH;
- 				data->ev[c].value = s[j][i].pen_down;
-@@ -312,7 +333,8 @@ static int send_touch_events(struct data_t *data, struct ts_sample_mt **s,
- 		}
- 
- 		if (c > 0) {
--			data->ev[c].time = s[j][i].tv;
-+			data->ev[c].input_event_sec = s[j][i].tv.tv_sec;
-+			data->ev[c].input_event_usec = s[j][i].tv.tv_usec;
- 			data->ev[c].type = EV_SYN;
- 			data->ev[c].code = SYN_REPORT;
- 			data->ev[c].value = 0;
--- 
-2.24.0
-
diff --git a/meta-oe/recipes-graphics/tslib/tslib_1.21.bb b/meta-oe/recipes-graphics/tslib/tslib_1.22.bb
similarity index 92%
rename from meta-oe/recipes-graphics/tslib/tslib_1.21.bb
rename to meta-oe/recipes-graphics/tslib/tslib_1.22.bb
index 76c4231..5d35088 100644
--- a/meta-oe/recipes-graphics/tslib/tslib_1.21.bb
+++ b/meta-oe/recipes-graphics/tslib/tslib_1.22.bb
@@ -14,13 +14,10 @@ LIC_FILES_CHKSUM = "\
 "
 
 SRC_URI = "https://github.com/kergoth/tslib/releases/download/${PV}/tslib-${PV}.tar.xz;downloadfilename=tslib-${PV}.tar.xz \
-           file://0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch \
-           file://0001-Fix-build-error-with-input_event_sec-for-old-kernel.patch \
            file://ts.conf \
            file://tslib.sh \
-"
-SRC_URI[md5sum] = "b2b20d3ed520128513f8d3135b42e142"
-SRC_URI[sha256sum] = "d2a57b823ea59e53a3b130eef05dfed1190b857854f886eec764e1ca1957cf56"
+           "
+SRC_URI[sha256sum] = "aaf0aed410a268d7b51385d07fe4d9d64312038e87c447ec8a24c8db0a15617a"
 
 UPSTREAM_CHECK_URI = "https://github.com/kergoth/tslib/releases"
 
-- 
2.7.4

