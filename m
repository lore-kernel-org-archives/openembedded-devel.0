Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
	[209.85.214.172])
	by mail.openembedded.org (Postfix) with ESMTP id 543E37F666
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Nov 2019 20:57:53 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id bb5so39070plb.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Nov 2019 12:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=DpH1BWP/R6BunubbFUgRwW/zcMHbrV+2OyR1JpR2uD4=;
	b=uckxd32cDoj50rGnFK8jDZA9eZKIwQjKxTMBN7PEH3lzEBH8eXB0VzwZPr94rv0C4o
	/vQM67qLubzxA0bMuhCUOLdliHuw8dUe11d6Zsn2RuivacRgpeyJGL7He0tow3XQEHUp
	crlhnLqBswPAT/q7UmNWbn+XlGG8IjG4WhzHdkxMDXN3xKZvIEkvLEyKucROya9B18op
	FbflpnwIYHavfJMJ5InEVDUMuglrMcF70JytyX+LHD/fchOCcnP0RpkkPAnAIu658qb4
	3I2ZNn9IbLo5lcFN7VPuTsqIEOaOcb9fNGrgbO+TLc4X+smy92ojStuNmqav1Ai7ov4J
	ZCAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=DpH1BWP/R6BunubbFUgRwW/zcMHbrV+2OyR1JpR2uD4=;
	b=Ka0uhall1tt8JzJg3dfKGP4+bVdz9vEDLf8ATjgAkJ15DvozprMQqXp2t1WHe3T/S5
	RHiPRIl6ggDBTSUEprpeZWS5fFz2nI05UdtBXnE35o06obK1r3nDI4OpIaT0e17gNBvf
	vNwD54USr5xcvWnH7stEFKSVCc+659wkpIC+Q61io/YvSRNLf/KJnCcXwJXxY6n6PdPP
	vClzQ5dznENxiikKREPAifZ3st3s+zB8gh3vrPcByFqZ0ZoBDwQFv2HP11Et5R5nn7u0
	3Ucbe0OA9jPgll0/kQ5KRMVqenh5mSoW/imEyuIiv1C74n6W2xKHokAXC1E0n+qrJxQg
	CMaA==
X-Gm-Message-State: APjAAAX1cQuGclbjcM07WEGsiT3znsByHrKU347lTsXYUzq0wfPNefhx
	EvT3+bwTg/QVnUkn/jTCuimjX4H+qqU=
X-Google-Smtp-Source: APXvYqxYBSfIxEhxMUtlC+RisJlqAsPiVR02q+WIFAKJ1d7G+J3jYSvuzeSz3z49MY27SXkI+/hrrQ==
X-Received: by 2002:a17:902:d891:: with SMTP id
	b17mr21484913plz.256.1573592273784; 
	Tue, 12 Nov 2019 12:57:53 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::30e8])
	by smtp.gmail.com with ESMTPSA id
	c9sm12471676pfn.65.2019.11.12.12.57.53
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 12 Nov 2019 12:57:53 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Nov 2019 12:57:37 -0800
Message-Id: <20191112205738.725884-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191112205738.725884-1-raj.khem@gmail.com>
References: <20191112205738.725884-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-multimedia][PATCH 2/3] tvheadend: Fix build with 64bit time_t
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
X-List-Received-Date: Tue, 12 Nov 2019 20:57:54 -0000
Content-Transfer-Encoding: 8bit

use intmax_t to print time_t, makes it portable across musl/glibc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-adjust-for-64bit-time_t.patch        | 107 ++++++++++++++++++
 .../recipes-dvb/tvheadend/tvheadend_git.bb    |   4 +-
 2 files changed, 110 insertions(+), 1 deletion(-)
 create mode 100644 meta-multimedia/recipes-dvb/tvheadend/tvheadend/0001-adjust-for-64bit-time_t.patch

diff --git a/meta-multimedia/recipes-dvb/tvheadend/tvheadend/0001-adjust-for-64bit-time_t.patch b/meta-multimedia/recipes-dvb/tvheadend/tvheadend/0001-adjust-for-64bit-time_t.patch
new file mode 100644
index 0000000000..9c7294aefb
--- /dev/null
+++ b/meta-multimedia/recipes-dvb/tvheadend/tvheadend/0001-adjust-for-64bit-time_t.patch
@@ -0,0 +1,107 @@
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
+diff --git a/src/cron.c b/src/cron.c
+index b2484070f..4f7f54ba3 100644
+--- a/src/cron.c
++++ b/src/cron.c
+@@ -329,9 +329,9 @@ cron_next ( cron_t *c, const time_t now, time_t *ret )
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
+diff --git a/src/epggrab/module/psip.c b/src/epggrab/module/psip.c
+index d979ba12c..4f8e41642 100644
+--- a/src/epggrab/module/psip.c
++++ b/src/epggrab/module/psip.c
+@@ -390,7 +390,7 @@ _psip_eit_callback_channel
+ 
+     ebc = epg_broadcast_find_by_time(ch, mod, start, stop, 1, &save2, &changes2);
+     tvhtrace(LS_PSIP, "  eid=%5d, start=%"PRItime_t", stop=%"PRItime_t", ebc=%p",
+-             eventid, start, stop, ebc);
++             eventid, (intmax_t)start, (intmax_t)stop, ebc);
+     if (!ebc) goto next;
+ 
+     save2 |= epg_broadcast_set_dvb_eid(ebc, eventid, &changes2);
+diff --git a/src/epggrab/otamux.c b/src/epggrab/otamux.c
+index 495354390..cdabb0cd7 100644
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
+diff --git a/src/parsers/parser_teletext.c b/src/parsers/parser_teletext.c
+index ff39eb6ac..5a07299c4 100644
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
+diff --git a/src/tvheadend.h b/src/tvheadend.h
+index 072391d3e..504c42253 100644
+--- a/src/tvheadend.h
++++ b/src/tvheadend.h
+@@ -332,11 +332,7 @@ void tvh_qsort_r(void *base, size_t nmemb, size_t size, int (*compar)(const void
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
+diff --git a/src/webui/webui.c b/src/webui/webui.c
+index 3e63aeacc..fb429acd3 100644
+--- a/src/webui/webui.c
++++ b/src/webui/webui.c
+@@ -944,9 +944,9 @@ http_dvr_playlist(http_connection_t *hc, int pltype, int urlauth, dvr_entry_t *d
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


