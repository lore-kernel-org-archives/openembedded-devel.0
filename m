Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 162ABC98319
	for <webhook@archiver.kernel.org>; Sat, 17 Jan 2026 09:46:09 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5748.1768643166764225957
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Jan 2026 01:46:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XRHWoLUv;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2a2ea96930cso17179725ad.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Jan 2026 01:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768643166; x=1769247966; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8HKbgxsrDsoy2x0pwmuJEbahwKUavAw4hAUsbEy7I+Y=;
        b=XRHWoLUvBQZnpRdFXBeZF4iL8nZvAZGmCL5Ndti8XeNp0hSJo8UKrifr/zdtFtLQM7
         p9g0iWYcCGhPpESUMJdjQiOy6Ze5Q7lqxVzJmNJio7BL/xFk5AVYrxknqCWjIgYCWBzZ
         7PTUdBr+bSnTL5/8krRGVziouty8gzpJxKwxLen2yJPAasbdJzQekR3Cdgyv0MILNwmy
         AqEgz1Hhz7WwAYXseFasS/cW/7jUd8z8fMP540U4znmU7dnhPBTfpO++0VcF7Lx1FDiF
         HC9nabmZcPFGX0AGNvUE7/z4wcJb1wEYMBHEtpmXESgIMioY/6qbQ1VDAlgCHZmGN6ZJ
         QNug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768643166; x=1769247966;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8HKbgxsrDsoy2x0pwmuJEbahwKUavAw4hAUsbEy7I+Y=;
        b=aCeB/UYSAaDQLO8J79yP+j+XfmBHhkfQELvk7oyP+bgjeNYa1WYlDjG8Y6sQhzYEra
         w2jRW+nXtCfHz/qxrFcgUc6BFj7/R+0ddRJSVF8fhQ8+FMf/z4U3scsnPhUe0z2YLjo4
         zGHwygMmPNxNAtXRMp4YL7IdWdp8Y4XnxyVXneT3MmXGcwYesTTYQzdt71EbeOn+W5zA
         P7vfdVstNjbJna4KIoWHfmAhN687+rYVgj3AeoBRuqQ6S5hCWxf7JgVxlWO9Ou3W49oj
         YToPf6cyGIW3ZmRA6Anmbv10cjxkjxunoVHJjLKzV7el4+SlNVeOOQGX5T2Mh31XcALl
         e7qw==
X-Gm-Message-State: AOJu0Yx50g7gNMhUvyABSeWUlOstOpCwGdctxpivKBVLYcqfEC3FtMCC
	zpapks1E43wB0ASOOljCwAAWgikAWddin4egCeSCH+cOaNVAsNivlRqtrE54FA1U
X-Gm-Gg: AY/fxX7qbQdenhYnpfrZKYBLAf9VlOBAg9jr2wQ4bulu/+ewBDWCJ7pbSLKo0wCWnGf
	90rrTTxBKI3IwEVtKQfANbCA5P9sDkasdT2kufU0I8yiz22Z+nSlCUxD2eprIprDkMBSKef1dbr
	/WJ3ss0DucKMfdJhbzYwpwQHiP1brgN7cFubOoSUeZ2uqyE6lppu+k1oKYx4Zs/iJkaNRb2Le34
	LOC8p9ShrEfjB3kQb4i5Q7RBV7QsRBhxWUzNqGAzu08T/8dnAcI1A1KP+BQTeACUvdGWcw9BHrD
	yJCwj9OejGjIiFpWBnlkhO4bgCnTDuXdHntkxCtDbthovqian/2ezz5aR8qnUpd/3DDjpcQi7N+
	GLgMY2tJ/zPr538G2KvjfcbZ5Kfv032WcpXbSAI8W4/JtiGulC6lHVMaoGGgKUys2hwRKsvHUNd
	DgYKYjLxNvwQJ/4QFvZKiZHjM=
X-Received: by 2002:a17:903:28d:b0:29f:299a:b6e2 with SMTP id d9443c01a7336-2a7177c7807mr52801765ad.42.1768643165823;
        Sat, 17 Jan 2026 01:46:05 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190c9ee9sm42289845ad.22.2026.01.17.01.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 01:46:05 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 1/6] gpsd: patch CVE-2025-67268
Date: Sat, 17 Jan 2026 22:45:30 +1300
Message-ID: <20260117094535.4191231-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Jan 2026 09:46:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123547

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-67268

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../gpsd/gpsd/CVE-2025-67268.patch            | 214 ++++++++++++++++++
 meta-oe/recipes-navigation/gpsd/gpsd_3.24.bb  |   1 +
 2 files changed, 215 insertions(+)
 create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd/CVE-2025-67268.patch

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd/CVE-2025-67268.patch b/meta-oe/recipes-navigation/gpsd/gpsd/CVE-2025-67268.patch
new file mode 100644
index 0000000000..132ca70a77
--- /dev/null
+++ b/meta-oe/recipes-navigation/gpsd/gpsd/CVE-2025-67268.patch
@@ -0,0 +1,214 @@
+From c0ed640a755884bd62fd09d21b72f18825539353 Mon Sep 17 00:00:00 2001
+From: "Gary E. Miller" <gem@rellim.com>
+Date: Tue, 2 Dec 2025 19:36:04 -0800
+Subject: [PATCH] drivers/driver_nmea2000.c: Fix issue 356, skyview buffer
+ overrun.
+
+CVE: CVE-2025-67268
+Upstream-Status: Backport [https://gitlab.com/gpsd/gpsd/-/commit/dc966aa74c075d0a6535811d98628625cbfbe3f4?view=inline]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ drivers/driver_nmea2000.c | 77 ++++++++++++++++++++++++---------------
+ 1 file changed, 48 insertions(+), 29 deletions(-)
+
+diff --git a/drivers/driver_nmea2000.c b/drivers/driver_nmea2000.c
+index 66959f02d..a3b89a082 100644
+--- a/drivers/driver_nmea2000.c
++++ b/drivers/driver_nmea2000.c
+@@ -12,11 +12,11 @@
+  * Message contents can be had from canboat/analyzer:
+  *     analyzer -explain
+  *
+- * This file is Copyright 2012 by the GPSD project
++ * This file is Copyright by the GPSD project
+  * SPDX-License-Identifier: BSD-2-clause
+  */
+ 
+-#include "../include/gpsd_config.h"  /* must be before all includes */
++#include "../include/gpsd_config.h"  // must be before all includes
+ 
+ #if defined(NMEA2000_ENABLE)
+ 
+@@ -68,7 +68,7 @@ typedef struct PGN
+ 
+ #if LOG_FILE
+ FILE *logFile = NULL;
+-#endif /* of if LOG_FILE */
++#endif  // of if LOG_FILE
+ 
+ extern bool __attribute__ ((weak)) gpsd_add_device(const char *device_name,
+                                                    bool flag_nowait);
+@@ -89,12 +89,12 @@ static int scale_int(int32_t var, const int64_t factor)
+ static void print_data(struct gps_context_t *context,
+                        unsigned char *buffer, int len, PGN *pgn)
+ {
+-    if ((libgps_debuglevel >= LOG_IO) != 0) {
+-        int   l1, l2, ptr;
++    if (LOG_IO <= libgps_debuglevel) {
++        int   l1;
+         char  bu[128];
+ 
+-        ptr = 0;
+-        l2 = sprintf(&bu[ptr], "got data:%6u:%3d: ", pgn->pgn, len);
++        int ptr = 0;
++        int l2 = sprintf(&bu[ptr], "got data:%6u:%3d: ", pgn->pgn, len);
+         ptr += l2;
+         for (l1=0;l1<len;l1++) {
+             if (((l1 % 20) == 0) && (l1 != 0)) {
+@@ -276,7 +276,7 @@ static gps_mask_t hnd_127258(unsigned char *bu, int len, PGN *pgn,
+                              struct gps_device_t *session)
+ {
+     print_data(session->context, bu, len, pgn);
+-    /* FIXME?  Get magnetic variation */
++    // FIXME?  Get magnetic variation
+     GPSD_LOG(LOG_DATA, &session->context->errout,
+              "pgn %6d(%3d):\n", pgn->pgn, session->driver.nmea2000.unit);
+     return(0);
+@@ -358,7 +358,7 @@ static gps_mask_t hnd_126992(unsigned char *bu, int len, PGN *pgn,
+ {
+     // uint8_t        sid;
+     // uint8_t        source;
+-    uint64_t usecs;       /* time in us */
++    uint64_t usecs;       // time in us
+ 
+     print_data(session->context, bu, len, pgn);
+     GPSD_LOG(LOG_DATA, &session->context->errout,
+@@ -434,6 +434,7 @@ static gps_mask_t hnd_129540(unsigned char *bu, int len, PGN *pgn,
+                              struct gps_device_t *session)
+ {
+     int         l1;
++    int         expected_len;
+ 
+     print_data(session->context, bu, len, pgn);
+     GPSD_LOG(LOG_DATA, &session->context->errout,
+@@ -441,24 +442,39 @@ static gps_mask_t hnd_129540(unsigned char *bu, int len, PGN *pgn,
+ 
+     session->driver.nmea2000.sid[2]           = bu[0];
+     session->gpsdata.satellites_visible       = (int)bu[2];
++    if (MAXCHANNELS <= session->gpsdata.satellites_visible) {
++        // Handle a CVE for overrunning skyview[]
++        GPSD_LOG(LOG_WARN, &session->context->errout,
++                 "pgn %6d(%3d): Too many sats %d\n",
++                 pgn->pgn, session->driver.nmea2000.unit,
++                 session->gpsdata.satellites_visible);
++        session->gpsdata.satellites_visible = MAXCHANNELS;
++    }
++    expected_len = 3 + (12 * session->gpsdata.satellites_visible);
++    if (len != expected_len) {
++        GPSD_LOG(LOG_WARN, &session->context->errout,
++                 "pgn %6d(%3d): wrong  length %d s/b %d\n",
++                 pgn->pgn, session->driver.nmea2000.unit,
++                 len, expected_len);
++        return 0;
++    }
+ 
+     memset(session->gpsdata.skyview, '\0', sizeof(session->gpsdata.skyview));
+     for (l1=0;l1<session->gpsdata.satellites_visible;l1++) {
+-        int    svt;
+-        double azi, elev, snr;
+-
+-        elev  = getles16(bu, 3+12*l1+1) * 1e-4 * RAD_2_DEG;
+-        azi   = getleu16(bu, 3+12*l1+3) * 1e-4 * RAD_2_DEG;
+-        snr   = getles16(bu, 3+12*l1+5) * 1e-2;
++        int offset = 3 + (12 * l1);
++        double elev  = getles16(bu, offset + 1) * 1e-4 * RAD_2_DEG;
++        double azi   = getleu16(bu, offset + 3) * 1e-4 * RAD_2_DEG;
++        double snr   = getles16(bu, offset + 5) * 1e-2;
+ 
+-        svt   = (int)(bu[3+12*l1+11] & 0x0f);
++        int svt   = (int)(bu[offset + 11] & 0x0f);
+ 
+-        session->gpsdata.skyview[l1].elevation  = (short) (round(elev));
+-        session->gpsdata.skyview[l1].azimuth    = (short) (round(azi));
++        session->gpsdata.skyview[l1].elevation  = elev;
++        session->gpsdata.skyview[l1].azimuth    = azi;
+         session->gpsdata.skyview[l1].ss         = snr;
+-        session->gpsdata.skyview[l1].PRN        = (short)bu[3+12*l1+0];
++        session->gpsdata.skyview[l1].PRN        = (int16_t)bu[offset];
+         session->gpsdata.skyview[l1].used = false;
+-        if ((svt == 2) || (svt == 5)) {
++        if ((2 == svt) ||
++            (5 == svt)) {
+             session->gpsdata.skyview[l1].used = true;
+         }
+     }
+@@ -588,7 +604,7 @@ static gps_mask_t hnd_129029(unsigned char *bu, int len, PGN *pgn,
+                              struct gps_device_t *session)
+ {
+     gps_mask_t mask;
+-    uint64_t usecs;    /* time in us */
++    uint64_t usecs;    // time in us
+ 
+     print_data(session->context, bu, len, pgn);
+     GPSD_LOG(LOG_DATA, &session->context->errout,
+@@ -675,7 +691,7 @@ static gps_mask_t hnd_129038(unsigned char *bu, int len, PGN *pgn,
+             (unsigned int)ais_direction((unsigned int)getleu16(bu, 21), 1.0);
+         ais->type1.turn = ais_turn_rate((int)getles16(bu, 23));
+         ais->type1.status    = (unsigned int) ((bu[25] >> 0) & 0x0f);
+-        ais->type1.maneuver  = 0; /* Not transmitted ???? */
++        ais->type1.maneuver  = 0;  // Not transmitted ????
+         decode_ais_channel_info(bu, len, 163, session);
+ 
+         return(ONLINE_SET | AIS_SET);
+@@ -730,8 +746,9 @@ static gps_mask_t hnd_129039(unsigned char *bu, int len, PGN *pgn,
+ 
+ /*
+  *   PGN 129040: AIS Class B Extended Position Report
++ *
++ *  No test case for this message at the moment
+  */
+-/* No test case for this message at the moment */
+ static gps_mask_t hnd_129040(unsigned char *bu, int len, PGN *pgn,
+                              struct gps_device_t *session)
+ {
+@@ -978,7 +995,7 @@ static gps_mask_t hnd_129794(unsigned char *bu, int len, PGN *pgn,
+                date2.tm_year+1900,
+                ais->type5.hour,
+                ais->type5.minute);
+-#endif /* of #if NMEA2000_DEBUG_AIS */
++#endif  // end of #if NMEA2000_DEBUG_AIS
+         decode_ais_channel_info(bu, len, 592, session);
+         return(ONLINE_SET | AIS_SET);
+     }
+@@ -988,8 +1005,9 @@ static gps_mask_t hnd_129794(unsigned char *bu, int len, PGN *pgn,
+ 
+ /*
+  *   PGN 129798: AIS SAR Aircraft Position Report
++ *
++ * No test case for this message at the moment
+  */
+-/* No test case for this message at the moment */
+ static gps_mask_t hnd_129798(unsigned char *bu, int len, PGN *pgn,
+                              struct gps_device_t *session)
+ {
+@@ -1016,8 +1034,8 @@ static gps_mask_t hnd_129798(unsigned char *bu, int len, PGN *pgn,
+         ais->type9.alt       = (unsigned int) (getleu64(bu, 21)/1000000);
+         ais->type9.regional  = (unsigned int) ((bu[29] >> 0) & 0xff);
+         ais->type9.dte       = (unsigned int) ((bu[30] >> 0) & 0x01);
+-/*      ais->type9.spare     = (bu[30] >> 1) & 0x7f; */
+-        ais->type9.assigned  = 0; /* Not transmitted ???? */
++//      ais->type9.spare     = (bu[30] >> 1) & 0x7f;
++        ais->type9.assigned  = 0;  // Not transmitted ????
+         decode_ais_channel_info(bu, len, 163, session);
+ 
+         return(ONLINE_SET | AIS_SET);
+@@ -1028,8 +1046,9 @@ static gps_mask_t hnd_129798(unsigned char *bu, int len, PGN *pgn,
+ 
+ /*
+  *   PGN 129802: AIS Safety Related Broadcast Message
++ *
++ * No test case for this message at the moment
+  */
+-/* No test case for this message at the moment */
+ static gps_mask_t hnd_129802(unsigned char *bu, int len, PGN *pgn,
+                              struct gps_device_t *session)
+ {
+@@ -1043,7 +1062,7 @@ static gps_mask_t hnd_129802(unsigned char *bu, int len, PGN *pgn,
+     if (decode_ais_header(session->context, bu, len, ais, 0x3fffffff) != 0) {
+         int                   l;
+ 
+-/*      ais->type14.channel = (bu[ 5] >> 0) & 0x1f; */
++//      ais->type14.channel = (bu[ 5] >> 0) & 0x1f;
+         for (l=0;l<36;l++) {
+             ais->type14.text[l] = (char) bu[6+l];
+         }
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.24.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.24.bb
index a755e39ed4..3833b4179b 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.24.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.24.bb
@@ -7,6 +7,7 @@ PROVIDES = "virtual/gpsd"
 
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/${BPN}/${BP}.tar.gz \
            file://gpsd.init \
+           file://CVE-2025-67268.patch \
            "
 SRC_URI[sha256sum] = "00ee13f615655284874a661be13553abe66128e6deb5cd648af9bc0cb345fe5c"
 

