Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09371E7FDD0
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 21:14:10 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1566.1770066848821200716
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Feb 2026 13:14:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jpm55B9T;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-435a11957f6so3877831f8f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Feb 2026 13:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770066847; x=1770671647; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=stzEBFp1fg99O8uaThGeNgmM4LNtbrI2U83i23v23fs=;
        b=jpm55B9TypMccod12J4vYlKLzgtTQEFgGP3IiWdj9flqPBMqc6T3uDsYVFFwfPfGVP
         bogs17WHhLtLVfCuf27tleN5FHXb0JJnK5mIa7SFNBhJtPdxVo19V/2d8d5WfRxE2LgD
         dkZ6E/apl3ZStBFXNLBeVIVPYCvgwLv4OG+IHXsvNcK5LmbxcgFl7jMVJFBNYb+VGqg0
         sjcY9K4/+DWjqRSjbLKXsKEJu67v7ytnG/i8wPveEBttQPZHcyBIC289Z741LjgueFOg
         /hDTYNIIOUhs7IwoTL6NHK1Rr1K3XMp/RFyTv5+9zSY/416EdgZDnEMmtibX5Dx6DyV8
         U2WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770066847; x=1770671647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=stzEBFp1fg99O8uaThGeNgmM4LNtbrI2U83i23v23fs=;
        b=O+oGuDStlCcvxOvjD1B3Bv0qV238lswXK++PC7r6xAJVYPXc6xm5a4PPKFRkAHebCD
         TIweyyjv73o6EAmJvimrMkD73HPiQfKQDGtPrLrRZlFC0GrXOG6y5K6pngXhvLqwdL9K
         ukKoUrkLDuAQmjlM5CVBuD5lokaLOl9vBEZ6BYUMorSsCvSfvDsgnGnSW98pfDt7JyEQ
         EW7btfVibz+8DPmjxBf8fR9Ujr9QfwgzZUB1iTRnEw3Zwpum9LOJYBoYSVdpCjona9W0
         h5qR4eVhMMcSZjbZZFts5Urov/Gs0kLQ8lN1Yupe4SPCcm7nmWC+dFguCiM7G5Er/QEC
         1dLw==
X-Gm-Message-State: AOJu0YzLDGA9fkbXE9mnOn1qXAJR8C2EwdTysOQYlipHMmg6CNYa1eLt
	Lxkj33VJ13S/Lza6qAF6vJU4jVK2tKnawZb5nb40YrlXACVcPu5qQjqzvNfNsw==
X-Gm-Gg: AZuq6aLbKjOlOe19EMJEC3AvuXs7SiFviHkDIFuHWtF88Oxc0/CJ4MIviUuaj9O+vSU
	N172UhL/Y1srrr1tnMKnfWDhDyyUCkpEiP/bSwTwz9B0P86eFUxtoLu36CH1ZhcGqj5vWhl9ZUd
	VEVJYBIBzmZS8FIa8/3y5lTpUV0o3AoQTlVEm7YDmY9UvVhAmqs32YCGY/H1LzSOSTZdV6rgGcK
	0iWPo5/wBsP6adHxAGpfRGzN6Qvjh23zIhppjRc5RBwPYeKezZ8XFg7Sc3lpzST1bKMuJX+yUKz
	Ul5CF9WVw1K98dIH8xqSWaolyTY4ALWs+QtH5zpaqpiCC0hiPlp/TgjhGhUsSPH+cuF8cUSVBnK
	//r0j9KaVe9dIIx5nZ6AH7o+bhbKkPiucMrezbedIvxBQNclGZSU5D4i+bmlg6qTAq4UcTXA7/s
	op2lYvd0KPt5AkokgdhAg=
X-Received: by 2002:a05:6000:184f:b0:435:ad52:31e0 with SMTP id ffacd0b85a97d-435f3a7b7e6mr18905358f8f.16.1770066847041;
        Mon, 02 Feb 2026 13:14:07 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131ce64sm48756747f8f.26.2026.02.02.13.14.06
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 13:14:06 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 07/15] gpsd: patch CVE-2025-67268
Date: Mon,  2 Feb 2026 22:13:53 +0100
Message-ID: <20260202211401.1287664-7-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260202211401.1287664-1-skandigraun@gmail.com>
References: <20260202211401.1287664-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Feb 2026 21:14:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124080

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-67268

Pick the patch that is referenced by the NVD advisory.

The original commit also contains a lot of commenting style
changes (// vs /* */) and whitespace changes which were removed from
the backport.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../gpsd/gpsd/CVE-2025-67268.patch            | 97 +++++++++++++++++++
 .../recipes-navigation/gpsd/gpsd_3.26.1.bb    |  1 +
 2 files changed, 98 insertions(+)
 create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd/CVE-2025-67268.patch

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd/CVE-2025-67268.patch b/meta-oe/recipes-navigation/gpsd/gpsd/CVE-2025-67268.patch
new file mode 100644
index 0000000000..d32e5095e2
--- /dev/null
+++ b/meta-oe/recipes-navigation/gpsd/gpsd/CVE-2025-67268.patch
@@ -0,0 +1,97 @@
+From 6045f465f3ab253e1075b5b3666fd95ede4fb848 Mon Sep 17 00:00:00 2001
+From: "Gary E. Miller" <gem@rellim.com>
+Date: Tue, 2 Dec 2025 19:36:04 -0800
+Subject: [PATCH] drivers/driver_nmea2000.c: Fix issue 356, skyview buffer
+ overrun.
+
+CVE: CVE-2025-67268
+Upstream-Status: Backport [https://github.com/ntpsec/gpsd/commit/dc966aa74c075d0a6535811d98628625cbfbe3f4]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ drivers/driver_nmea2000.c | 50 ++++++++++++++++++++++++++-------------
+ 1 file changed, 33 insertions(+), 17 deletions(-)
+
+diff --git a/drivers/driver_nmea2000.c b/drivers/driver_nmea2000.c
+index 71e04e1..6854b2d 100644
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
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.26.1.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.26.1.bb
index e4a571daa6..6462d7b6f2 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.26.1.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.26.1.bb
@@ -9,6 +9,7 @@ HOMEPAGE = "https://gpsd.io/"
 
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/${BPN}/${BP}.tar.gz \
            file://gpsd.init \
+           file://CVE-2025-67268.patch \
            "
 SRC_URI[sha256sum] = "dc7e465968c1540e61bc57c7586d6a57a0047212a014efdad348f907bc2e0990"
 

