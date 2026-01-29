Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05385D358CA
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 06:31:35 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9526.1769668293308249596
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Jan 2026 22:31:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YnEvlo7t;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-480706554beso5896885e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 28 Jan 2026 22:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769668292; x=1770273092; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DVvZC7+HSyJwMp/FulJbNUeitObRYUW8f1dU/6bbh6g=;
        b=YnEvlo7tvGHZNZE1MpszQkF5e9sO7lGa0RLR4H021fwxL6Qsmch3ItXXB22CtG4bif
         7vdWhmSr31ool0TpAcI4bBvknjs5ZTLQQJ8AvmAVtlzfvH+TBKiHO6+t/Rvh4oKArR9t
         e9enu2HqJHsJAyd58xJF2vWCkrF8DqEaiCEIuq4Rv93OuiEcDG11MzRvbvddl88sicNe
         tjww8xcvP2KLsnqo2tsuRqrg9eUKdpRYWjpuIOk7l+cOXMLxem27UK630zwI4xZVq5cI
         vMa/qZdvU0vIubsIgZWNGMIeWnYgqyubPfFHPwXfYFl+qhIWuzrFKaUeFW/FyBSB//c/
         i8WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769668292; x=1770273092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DVvZC7+HSyJwMp/FulJbNUeitObRYUW8f1dU/6bbh6g=;
        b=LejZGGIgRAqjEjls2Or1+CpLePk7i56hdYiQs60LBIbiRcQh8uVYzQm0g8VlDvJwXj
         agFcTGaR5Kl5LdtKXyBKEh/EgkT8DbwVtwh5hWb+dSAxVEZI7AA5fDmqx4cCSUAdQcIL
         RfjngPLHiHU3/0zjkGs8elskm1hP21tewZOhC4ewPB7sSgylTyBF+4LRUK9TiekW6DOM
         9vOikaDaRsEEbF0L6lQSBVqXABLq/DJjdRW1hepVRZkLVL1tKVvG7NQuFfZMr5rqcIQa
         Yl28FP81OShTm1v9w6Nj4IXrhZ6c9b6iAAYEPYtll3owxb76J3rJp0pJvb4w1tYDy9gH
         uSGw==
X-Gm-Message-State: AOJu0YwNWoCnp8ZC7FRnzkDfuyNQVachOXx4QFEC7bNvX7hP0iZVXIzE
	uzK3QqbyFJS8wJNO0Y/OaI8P7H47yxyx7GuKueCz7uOOqcLJ8XlPRXIVPomWTg==
X-Gm-Gg: AZuq6aLe0mRqLyISQ6Zw7EO7js9/+Q6sZnr0e8RevZx67+NvPvKGmHsiVddTpBdGodn
	LRiR+pCsgFM9Slve397hF1wTXLLGst3mHau0GKv6u1EJfXZ5r+QrLSncWP8bO/J2Llnh4i/K06x
	mPFcLo3ha0RLllA/wGnUT57d1YCXaeHm1S6XMAk0SybbXwPJlwhgVTRUX6jtVzFuwhUc5UyhQh1
	IqkdoSc+ajw8/xje64xzv/kZaY0iaZkKm31vReue8jSs1RntROf5k8IGti+YrbVmP/B1O1b4KYB
	BGgKRShONyzMi8LHzik7ZoNT9Getd+6XuVG7iKLB7htJCianyz3sGCT1q7MVKLKlicXxrr2A2Ya
	3lXcUzYD8PifrPcA3QZyVdwlT4WIq2w702HF7rAFwzU2JKVnOXHLS5Aipat/KQCHJvHr+n2itM/
	Sm6mhVHvKLeH7tk8/kri8=
X-Received: by 2002:a05:600c:3f0b:b0:47e:e20e:bbb2 with SMTP id 5b1f17b1804b1-48069c0e198mr100870735e9.7.1769668291501;
        Wed, 28 Jan 2026 22:31:31 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806ce4c3d1sm110750835e9.9.2026.01.28.22.31.30
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 22:31:31 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 2/5] gpsd: patch CVE-2025-67268
Date: Thu, 29 Jan 2026 07:31:26 +0100
Message-ID: <20260129063129.223926-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260129063129.223926-1-skandigraun@gmail.com>
References: <20260129063129.223926-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 29 Jan 2026 06:31:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123979

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-67268

Pick the patch that is referenced by the NVD advisory.

The original commit also contains a lot of commenting style
changes (// vs /* */) and whitespace changes which were removed from
the backport.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../gpsd/gpsd/CVE-2025-67268.patch            | 97 +++++++++++++++++++
 .../recipes-navigation/gpsd/gpsd_3.23.1.bb    |  1 +
 2 files changed, 98 insertions(+)
 create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd/CVE-2025-67268.patch

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd/CVE-2025-67268.patch b/meta-oe/recipes-navigation/gpsd/gpsd/CVE-2025-67268.patch
new file mode 100644
index 0000000000..50dabf89d3
--- /dev/null
+++ b/meta-oe/recipes-navigation/gpsd/gpsd/CVE-2025-67268.patch
@@ -0,0 +1,97 @@
+From b3abe9d49d8fcc3f824d74a5c2cdcc30838f5904 Mon Sep 17 00:00:00 2001
+From: "Gary E. Miller" <gem@rellim.com>
+Date: Tue, 2 Dec 2025 19:36:04 -0800
+Subject: [PATCH] drivers/driver_nmea2000.c: Fix issue 356, skyview buffer
+ overrun.
+
+CVE: CVE-2025-67268
+Upstream-Status: Backport [https://github.com/ntpsec/gpsd/commit/dc966aa74c075d0a6535811d98628625cbfbe3f4]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ drivers/driver_nmea2000.c | 123 ++++++++++++++++++++++----------------
+ 1 file changed, 71 insertions(+), 52 deletions(-)
+
+diff --git a/drivers/driver_nmea2000.c b/drivers/driver_nmea2000.c
+index 66959f0..70462b3 100644
+--- a/drivers/driver_nmea2000.c
++++ b/drivers/driver_nmea2000.c
+@@ -89,14 +89,14 @@ static int scale_int(int32_t var, const int64_t factor)
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
+-        for (l1=0;l1<len;l1++) {
++        for (l1 = 0; l1 < len; l1++) {
+             if (((l1 % 20) == 0) && (l1 != 0)) {
+                 GPSD_LOG(LOG_IO, &context->errout, "%s\n", bu);
+                 ptr = 0;
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
+-    for (l1=0;l1<session->gpsdata.satellites_visible;l1++) {
+-        int    svt;
+-        double azi, elev, snr;
+-
+-        elev  = getles16(bu, 3+12*l1+1) * 1e-4 * RAD_2_DEG;
+-        azi   = getleu16(bu, 3+12*l1+3) * 1e-4 * RAD_2_DEG;
+-        snr   = getles16(bu, 3+12*l1+5) * 1e-2;
++    for (l1 = 0; l1 < session->gpsdata.satellites_visible; l1++) {
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
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.23.1.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.23.1.bb
index 410db92bd0..87c70d3683 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.23.1.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.23.1.bb
@@ -7,6 +7,7 @@ PROVIDES = "virtual/gpsd"
 
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/${BPN}/${BP}.tar.gz \
            file://gpsd.init \
+           file://CVE-2025-67268.patch \
            "
 SRC_URI[sha256sum] = "0b991ce9a46538c4ea450f7a8ee428ff44fb4f8d665fddf2ffe40fe0ae9a6c09"
 

