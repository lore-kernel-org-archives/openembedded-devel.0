Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
	[209.85.210.170])
	by mail.openembedded.org (Postfix) with ESMTP id A95B57F687
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Nov 2019 22:05:46 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id r4so58460pfl.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Nov 2019 14:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=EpuGBd8LWmmFT3XtX4CF60PgpJCwYjO86E5q4X4tUzQ=;
	b=oRGZEyob7RpIdXF28YGtvZjk/6U+UJr7d5iIe2k67bqhtOV5jmqyy8/O2s9r2KrLZr
	4hsZDIc3bUzffpNgFjHTRF5J0dNdU8oKrFo+2NbIGKVUcB/HoawdNC5zLCLigEeWRbT9
	d/upW3hj9PSw77628nz/VfCv5OPAxE0YhvW56qMrJxK6uqghkubdpTOVtM6F4yz2E+RA
	C+AaipP1Uz5q15AZRTTrnkakoMNAb60eGQ8h/CXkj7Eh91L8Z/lgHHsZlY7I2NPe2IeT
	k0icr923kFNjAODj1LjnwMojzKBw9k0AATQ0cfczdiZP7CdCBVNekcj/9vbYNuiwSkRM
	GemQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=EpuGBd8LWmmFT3XtX4CF60PgpJCwYjO86E5q4X4tUzQ=;
	b=ES7VokGDLXLaamKgGXCR7i0W/aQQ4nOaYBW0LEV/LQ46rxeSYfwcP3R9V7BrOfLG1P
	GgM+Pv1Q7swsxLW83sEjH17sJ48J10aQSrEkQtHOINEwWQkzb2gn14OXb9cnMa7cUgkB
	xFdsiInr2QuiSQ9HIJBPz0PYKNSKnyzx3g5nIILOoVoNxdG7onnB+JR/1LNbL+fWfsjU
	agoNUAUTTydkWLX1nCfMDnRu2/VXw6Ea9m4JW3PoE8RQZfdAuPVR6Ah3BWWhE7zvU1yB
	qygbtqZDmSaitRNdGzXP/BMDCIT4KY1Br5e0xaX9AimSnC1Doz1hLPdqPVlMw/31jrCP
	z5ig==
X-Gm-Message-State: APjAAAWLub891XcokTPO5Wc+EBwO7tApcwntcytXgsNKrXG1gftK0X/V
	KBkRiVuVBpwCoI6++8GWgJnvbbEt+BA=
X-Google-Smtp-Source: APXvYqymfWUUrp+FJafT4u6gsbHJdSA92y9mWNmXybX/FLDVf7W2QxtaHSAUjduFS3dLGnaDcpefOQ==
X-Received: by 2002:a17:90a:cf08:: with SMTP id h8mr59120pju.77.1573596346997; 
	Tue, 12 Nov 2019 14:05:46 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::30e8])
	by smtp.gmail.com with ESMTPSA id
	i123sm29919902pfe.145.2019.11.12.14.05.46
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 12 Nov 2019 14:05:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Nov 2019 14:05:28 -0800
Message-Id: <20191112220529.2433890-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [meta-multimedia][PATCH V2 1/2] tvheadend: Fix build with 64bit time_t
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
X-List-Received-Date: Tue, 12 Nov 2019 22:05:46 -0000
Content-Transfer-Encoding: 8bit

use intmax_t to print time_t, makes it portable across musl/glibc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Fix build regression on glibc

 .../0001-adjust-for-64bit-time_t.patch        | 176 ++++++++++++++++++
 .../recipes-dvb/tvheadend/tvheadend_git.bb    |   4 +-
 2 files changed, 179 insertions(+), 1 deletion(-)
 create mode 100644 meta-multimedia/recipes-dvb/tvheadend/tvheadend/0001-adjust-for-64bit-time_t.patch

diff --git a/meta-multimedia/recipes-dvb/tvheadend/tvheadend/0001-adjust-for-64bit-time_t.patch b/meta-multimedia/recipes-dvb/tvheadend/tvheadend/0001-adjust-for-64bit-time_t.patch
new file mode 100644
index 0000000000..59bd4ef08f
--- /dev/null
+++ b/meta-multimedia/recipes-dvb/tvheadend/tvheadend/0001-adjust-for-64bit-time_t.patch
@@ -0,0 +1,176 @@
+From 81f29b028473a3d8ac0aaeb126fc0336a98bb077 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 12 Nov 2019 11:03:16 -0800
+Subject: [PATCH] adjust for 64bit time_t
+
+Break assumption about time_t being of certain size, and use intmax_t to
+print it where needed
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/cron.c                    | 4 ++--
+ src/epggrab/module/psip.c     | 2 +-
+ src/epggrab/otamux.c          | 2 +-
+ src/parsers/parser_teletext.c | 2 +-
+ src/tvheadend.h               | 6 +-----
+ src/webui/webui.c             | 4 ++--
+ 6 files changed, 8 insertions(+), 12 deletions(-)
+
+--- a/src/cron.c
++++ b/src/cron.c
+@@ -329,9 +329,9 @@ cron_next ( cron_t *c, const time_t now,
+     *ret = mktime(&tmp);
+   if (*ret <= now) {
+ #ifndef CRON_TEST
+-    tvherror(LS_CRON, "invalid time, now %"PRItime_t", result %"PRItime_t, now, *ret);
++    tvherror(LS_CRON, "invalid time, now %"PRItime_t", result %"PRItime_t, (intmax_t)now, (intmax_t)*ret);
+ #else
+-    printf("ERROR: invalid time, now %"PRItime_t", result %"PRItime_t"\n", now, *ret);
++    printf("ERROR: invalid time, now %"PRItime_t", result %"PRItime_t"\n", (intmax_t)now, (intmax_t)*ret);
+ #endif
+     *ret = now + 600;
+   }
+--- a/src/epggrab/module/psip.c
++++ b/src/epggrab/module/psip.c
+@@ -383,14 +383,14 @@ _psip_eit_callback_channel
+ 
+     tvhtrace(LS_PSIP, "  %03d: [%s] eventid 0x%04x at %"PRItime_t", duration %d, title: '%s' (%d bytes)",
+              i, ch ? channel_get_name(ch, channel_blank_name) : "(null)",
+-             eventid, start, length,
++             eventid, (intmax_t)start, length,
+              lang_str_get(title, NULL), titlelen);
+ 
+     save2 = changes2 = 0;
+ 
+     ebc = epg_broadcast_find_by_time(ch, mod, start, stop, 1, &save2, &changes2);
+     tvhtrace(LS_PSIP, "  eid=%5d, start=%"PRItime_t", stop=%"PRItime_t", ebc=%p",
+-             eventid, start, stop, ebc);
++             eventid, (intmax_t)start, (intmax_t)stop, ebc);
+     if (!ebc) goto next;
+ 
+     save2 |= epg_broadcast_set_dvb_eid(ebc, eventid, &changes2);
+--- a/src/epggrab/otamux.c
++++ b/src/epggrab/otamux.c
+@@ -719,7 +719,7 @@ epggrab_ota_start_cb ( void *p );
+ static void
+ epggrab_ota_next_arm( time_t next )
+ {
+-  tvhtrace(LS_EPGGRAB, "next ota start event in %li seconds", next - time(NULL));
++  tvhtrace(LS_EPGGRAB, "next ota start event in %jd seconds", (intmax_t)(next - time(NULL)));
+   gtimer_arm_absn(&epggrab_ota_start_timer, epggrab_ota_start_cb, NULL, next);
+   dbus_emit_signal_s64("/epggrab/ota", "next", next);
+ }
+--- a/src/parsers/parser_teletext.c
++++ b/src/parsers/parser_teletext.c
+@@ -625,7 +625,7 @@ tt_construct_unix_time(uint8_t *buf)
+   r[2] = mktime(&tm);
+ 
+   for(i = 0; i < 3; i++)
+-    v[i] = labs(r[i] - t);
++    v[i] = (time_t)llabs((long long)(r[i] - t));
+   
+   if(v[0] < v[1] && v[0] < v[2])
+     return r[0];
+--- a/src/tvheadend.h
++++ b/src/tvheadend.h
+@@ -332,11 +332,7 @@ void tvh_qsort_r(void *base, size_t nmem
+ # endif /* ULONG_MAX */
+ #endif /* __WORDSIZE */
+ 
+-#if __WORDSIZE == 32 && defined(PLATFORM_FREEBSD)
+-#define PRItime_t       "d"
+-#else
+-#define PRItime_t       "ld"
+-#endif
++#define PRItime_t       "jd"
+ 
+ /* transcoding */
+ #define TVH_NAME_LEN 32
+--- a/src/webui/webui.c
++++ b/src/webui/webui.c
+@@ -886,9 +886,9 @@ http_dvr_list_playlist(http_connection_t
+     bandwidth = ((8*fsize) / (durration*1024.0));
+     strftime(buf, sizeof(buf), "%FT%T%z", localtime_r(&(de->de_start), &tm));
+ 
+-    htsbuf_qprintf(hq, "#EXTINF:%"PRItime_t",%s\n", durration, lang_str_get(de->de_title, NULL));
++    htsbuf_qprintf(hq, "#EXTINF:%"PRItime_t",%s\n", (intmax_t)durration, lang_str_get(de->de_title, NULL));
+     
+-    htsbuf_qprintf(hq, "#EXT-X-TARGETDURATION:%"PRItime_t"\n", durration);
++    htsbuf_qprintf(hq, "#EXT-X-TARGETDURATION:%"PRItime_t"\n", (intmax_t)durration);
+     uuid = idnode_uuid_as_str(&de->de_id, ubuf);
+     htsbuf_qprintf(hq, "#EXT-X-STREAM-INF:PROGRAM-ID=%s,BANDWIDTH=%d\n", uuid, bandwidth);
+     htsbuf_qprintf(hq, "#EXT-X-PROGRAM-DATE-TIME:%s\n", buf);
+@@ -944,9 +944,9 @@ http_dvr_playlist(http_connection_t *hc,
+     strftime(buf, sizeof(buf), "%FT%T%z", localtime_r(&(de->de_start), &tm));
+ 
+     htsbuf_append_str(hq, "#EXTM3U\n");
+-    htsbuf_qprintf(hq, "#EXTINF:%"PRItime_t",%s\n", durration, lang_str_get(de->de_title, NULL));
++    htsbuf_qprintf(hq, "#EXTINF:%"PRItime_t",%s\n", (intmax_t)durration, lang_str_get(de->de_title, NULL));
+     
+-    htsbuf_qprintf(hq, "#EXT-X-TARGETDURATION:%"PRItime_t"\n", durration);
++    htsbuf_qprintf(hq, "#EXT-X-TARGETDURATION:%"PRItime_t"\n", (intmax_t)durration);
+     uuid = idnode_uuid_as_str(&de->de_id, ubuf);
+     htsbuf_qprintf(hq, "#EXT-X-STREAM-INF:PROGRAM-ID=%s,BANDWIDTH=%d\n", uuid, bandwidth);
+     htsbuf_qprintf(hq, "#EXT-X-PROGRAM-DATE-TIME:%s\n", buf);
+--- a/src/dvr/dvr_rec.c
++++ b/src/dvr/dvr_rec.c
+@@ -723,7 +723,7 @@ static const char *
+ dvr_sub_start(const char *id, const char *fmt, const void *aux, char *tmp, size_t tmplen)
+ {
+   char buf[16];
+-  snprintf(buf, sizeof(buf), "%"PRItime_t, (time_t)dvr_entry_get_start_time((dvr_entry_t *)aux, 0));
++  snprintf(buf, sizeof(buf), "%"PRItime_t, (intmax_t)dvr_entry_get_start_time((dvr_entry_t *)aux, 0));
+   return dvr_do_prefix(id, fmt, buf, tmp, tmplen);
+ }
+ 
+@@ -747,7 +747,7 @@ static const char *
+ dvr_sub_stop(const char *id, const char *fmt, const void *aux, char *tmp, size_t tmplen)
+ {
+   char buf[16];
+-  snprintf(buf, sizeof(buf), "%"PRItime_t, (time_t)dvr_entry_get_stop_time((dvr_entry_t *)aux));
++  snprintf(buf, sizeof(buf), "%"PRItime_t, (intmax_t)dvr_entry_get_stop_time((dvr_entry_t *)aux));
+   return dvr_do_prefix(id, fmt, buf, tmp, tmplen);
+ }
+ 
+--- a/src/epggrab/module.c
++++ b/src/epggrab/module.c
+@@ -582,7 +582,7 @@ static void _epggrab_socket_handler ( ep
+ 
+   /* Process */
+   if ( data ) {
+-    tvhinfo(mod->subsys, "%s: grab took %"PRItime_t" seconds", mod->id, tm2 - tm1);
++    tvhinfo(mod->subsys, "%s: grab took %"PRItime_t" seconds", mod->id, (intmax_t)(tm2 - tm1));
+     epggrab_module_parse(mod, data);
+ 
+   /* Failed */
+--- a/src/epggrab/module/opentv.c
++++ b/src/epggrab/module/opentv.c
+@@ -486,7 +486,7 @@ opentv_parse_event_section_one
+                                        1, &save, &changes);
+       tvhdebug(LS_OPENTV, "find by time start %"PRItime_t " stop "
+                "%"PRItime_t " eid %d = %p",
+-               ev.start, ev.stop, ev.eid, ebc);
++               (intmax_t)ev.start, (intmax_t)ev.stop, ev.eid, ebc);
+       save |= epg_broadcast_set_dvb_eid(ebc, ev.eid, &changes);
+     } else {
+       ebc = epg_broadcast_find_by_eid(ch, ev.eid);
+--- a/src/webui/simpleui.c
++++ b/src/webui/simpleui.c
+@@ -556,12 +556,12 @@ page_status(http_connection_t *hc,
+ 		     "<title>%s</title>\n",
+ 		     a.tm_year + 1900, a.tm_mon + 1, a.tm_mday,
+ 		     a.tm_hour, a.tm_min, 
+-		     de->de_start, 
+-		     (time_t)dvr_entry_get_extra_time_pre(de),
++		     (intmax_t)de->de_start,
++		     (intmax_t)dvr_entry_get_extra_time_pre(de),
+ 		     b.tm_year+1900, b.tm_mon + 1, b.tm_mday,
+ 		     b.tm_hour, b.tm_min, 
+-		     de->de_stop, 
+-		     (time_t)dvr_entry_get_extra_time_post(de),
++		     (intmax_t)de->de_stop,
++		     (intmax_t)dvr_entry_get_extra_time_post(de),
+          buf);
+ 
+       rstatus = val2str(de->de_sched_state, recstatustxt);
diff --git a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
index 5b3c469793..d7f749b647 100644
--- a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
+++ b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
@@ -8,7 +8,9 @@ DEPENDS = "avahi cmake-native dvb-apps libdvbcsa libpcre2 openssl uriparser zlib
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=9cae5acac2e9ee2fc3aec01ac88ce5db"
 
-SRC_URI = "git://github.com/tvheadend/tvheadend.git"
+SRC_URI = "git://github.com/tvheadend/tvheadend.git \
+           file://0001-adjust-for-64bit-time_t.patch \
+           "
 
 SRCREV = "fda89e85e0b6ae796d8a09e178d3937aa7869270"
 PV = "4.3+git${SRCPV}"
-- 
2.24.0


