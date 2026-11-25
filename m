Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37920.1795594059303599435
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 00:07:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=f8ikKTVT;
 spf=pass (domain: gmail.com, ip: 74.125.82.181, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3866a784546so7289645eec.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 00:07:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594059; x=1796198859; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6Q+Ka/ck9/KrVfkUSL2Hg1llaUhH+EtV7D0bPUdIofk=;
        b=f8ikKTVTTZM/5dCpHX5+joCeBjUuQcDhPsyRzcibUSic3goWBoO13gXLznFPs01hLC
         EW/F+IIxDpTI/RV787lwp3nGgCqQL+BHTXx7gsWdeVF+SwkLF0NXE+BnLUA1AT3t64Ku
         1S+31rho/d4MgCQnY9GB9HJQmwj23WNbSGLkvoT2AuEe1A9syJ6O9/gkJmEDSsDAQNFs
         6FS+LBPRpOPHO9J1f+tHHhLdKELGIJ0hpfsuZTBApgJg54uGBug6jYXgRalUx44K7O0V
         tR+HVqTNs4kePMRqj+60g+AJeHSBnLe5tbvItngiWRzQuPY5WgAdA5S4YrYXFSnu8qCJ
         AsmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594059; x=1796198859;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Q+Ka/ck9/KrVfkUSL2Hg1llaUhH+EtV7D0bPUdIofk=;
        b=bGSZ8C0QuaPLzalkIuchUQCtGWyPKRoFr1J6BtsFM89kH2cnufD2bgv6sIJ+gGkUQT
         aXRVcJ6ECFiPUHENPlQSOGDetTnx5THs0o8fdlF8qQpfKk/kEkjH7kxxalmUHWn1L7Dq
         oHj74C5TFGJvQtSuS95YVQJAMJ/9zZqy+MeAhCvdGzDNH9kascD3z5CDiNS7uazVqx78
         i45ndaFa68fpjm7TF5ig+wSjOg5GZkZpiA1iAEbd7TzLna6TsFhpWNUOzUdA31aGKzd6
         ZrOoH0rq/Sr2Gqnp6Z4CwjSPRcDGAaUS6c6IanlmhP7oCE4xKW09bIfHUOs/xB2N4WS3
         ly2Q==
X-Gm-Message-State: APuU4Z+OmHEwY0Mv8nTBfXxH4I+v4sG66RJqI/V0foQxY04V/EyDySI/
	I6++ToDOL69fHJgWSF4upUR73XvhERe0d/+INR728pvgUoCbJXhKJjRJOdsja7/9
X-Gm-Gg: AZFdTZdJrJqmDU1KfJ7o1QmRlau9KVzvfW6IJ5ansIlCOVqAwyf/pm9CwrfHNENq9bf
	SF8TduNisrWOEWiVLyc4POgsrtlEFf3LHd9laZOvm5mQH+fT7QMsz9EXFZMIvBeA0IjOl+hfyT4
	M4d2Md+eFVbp6BxYEiVh8Lv8JsJFfvvKnO88mRu9yZYk5pKdodK3vHBYaczhcOFfVmVOzT046Gt
	Qolj+nHODrAe8OOPsQdsgXUxSYus+xCglj7xHBydhqpgc5IOr/7mouT7Qghb5e9D3xHMgcR7ZND
	tibh7zkKjhhHzZoij6rIIgZTqDMrUBlUsGIcOOdte9SylFiNNaukYHZSPWsHRq+6AztLhVSXWM6
	ChVGWJRXBT4vPPg4RQh/aDWLwQmnhx2Aj3Sm9Sz/rlv8UfwQL4aUjBRLjvgWBsyWfCReWEP4IXh
	HfdeAzsPGn4up8lL7nHTLYdjCYJ33L/NVFxkTt2TR9VXO5rLhYJhtOgl8//03GdtwzP1lUvVZp5
	qIHTXdU8R0iccI4a3fBcU2mDSk3ru446+4Z37drVGTchTkoWzcXaRz7L4iwWn1QQL8tu9umVbLt
	YbKb50Y9FrW7Yr0pF2xXlTtxRSVHC8ragObgFLFegNN1lYBCZ3m6ZhNFyQmwGgLFOE9LHpQFLEM
	OizDP0K+snZLUl8SghTUUZ1aY/OxIUcsVayOdfRBtrE0pygERDu7hEktVZ6Sjt0onCrMkNFoFg9
	MlIKIfCUaOSBqjNinPzfY6s7njpvt2RraiP6ixqpaV/N1akBZPfBUXYVRKXsoQhMIwQtWgVUEd0
	U+fOByIbUai5CTEmDVK22+n9j6CpyFaB8dANcm9J4oMLxA4LdiCmqkvIiAXM1wlnT56gi2m587/
	3z6N
X-Received: by 2002:a05:693c:60d4:b0:369:fe81:a575 with SMTP id 5a478bee46e88-3857111f203mr21409751eec.35.1795594058459;
        Wed, 25 Nov 2026 00:07:38 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm90997971eec.3.2026.11.25.00.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:07:37 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH] clightd: Port ALS sensor to libiio 1.0
Date: Wed, 25 Nov 2026 00:06:11 -0800
Message-ID: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 08:07:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132998
Content-Type: text/plain; charset="utf-8"

libiio 1.0 replaced the 0.x API used by the ALS iio buffer capture
(iio_create_local_context, iio_device_create_buffer,
iio_buffer_refill, iio_channel_enable without a mask) and moved the
header to <iio/iio.h>, so clightd no longer compiles. Upstream has no
port yet; add a patch that uses the "local:" context, a channels mask
and a one-block iio_stream, and frees everything on error paths.

Add UPSTREAM_CHECK_GITTAGREGEX matching release tags only.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...1-sensors-als-Port-to-libiio-1.0-API.patch | 165 ++++++++++++++++++
 .../recipes-multimedia/clight/clightd_5.9.bb  |   2 +
 2 files changed, 167 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/clight/clightd/0001-sensors-als-Port-to-libiio-1.0-API.patch

diff --git a/meta-multimedia/recipes-multimedia/clight/clightd/0001-sensors-als-Port-to-libiio-1.0-API.patch b/meta-multimedia/recipes-multimedia/clight/clightd/0001-sensors-als-Port-to-libiio-1.0-API.patch
new file mode 100644
index 0000000000..59b1c016bf
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/clight/clightd/0001-sensors-als-Port-to-libiio-1.0-API.patch
@@ -0,0 +1,165 @@
+From 3b4827e17401ec026a2d82e1632d3c456a5191c8 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Sun, 22 Nov 2026 23:35:34 -0800
+Subject: [PATCH] sensors/als: Port to libiio 1.0 API
+
+libiio 1.0 breaks the 0.x API: the header moved to <iio/iio.h>,
+iio_create_local_context() is gone (use iio_create_context() with the
+"local:" URI), channels are enabled in an iio_channels_mask, and
+buffers are read through an iio_stream instead of
+iio_device_create_buffer()/iio_buffer_refill(). Functions returning
+pointers now report errors with pointer-encoded error codes.
+
+Use a stream with a single one-sample block, which waits for a fresh
+sample on every capture like the old refill did, and release the
+context, mask and stream on every exit path.
+
+Upstream-Status: Pending
+AI-Generated: Uses Claude Code
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ src/modules/sensors/als.c | 74 ++++++++++++++++++++++++++-------------
+ 1 file changed, 49 insertions(+), 25 deletions(-)
+
+diff --git a/src/modules/sensors/als.c b/src/modules/sensors/als.c
+index eee98e6..8bb67ee 100644
+--- a/src/modules/sensors/als.c
++++ b/src/modules/sensors/als.c
+@@ -1,6 +1,6 @@
+ #include <sensor.h>
+ #include <udev.h>
+-#include <iio.h>
++#include <iio/iio.h>
+ #include <sys/time.h>
+ #include "als.h"
+ 
+@@ -67,17 +67,21 @@ static double iio_buffer_capture(struct als_device *als, double *pct, const int
+     INFO("[IIO-BUF] Start capture: '%s' sysname.\n", sysname);
+     
+     
++    struct iio_channels_mask *mask = NULL;
++    struct iio_stream *stream = NULL;
++
+     /* Getting local iio device context */
+-    struct iio_context *local_ctx = iio_create_local_context();
+-    if (!local_ctx) {
+-        fprintf(stderr, "Failed to create local iio ctx.\n");
++    struct iio_context *local_ctx = iio_create_context(NULL, "local:");
++    int err = iio_err(local_ctx);
++    if (err) {
++        fprintf(stderr, "Failed to create local iio ctx: %s\n", strerror(-err));
+         return ctr;
+     }
+     
+     const struct iio_device *dev = iio_context_find_device(local_ctx, sysname);
+     if (!dev) {
+-        fprintf(stderr, "Couldn't find device '%s': %m\n", sysname);
+-        return ctr;
++        fprintf(stderr, "Couldn't find device '%s'.\n", sysname);
++        goto out;
+     }
+     
+     INFO("[IIO-BUF] Found device.\n");
+@@ -91,32 +95,45 @@ static double iio_buffer_capture(struct als_device *als, double *pct, const int
+     
+     INFO("[IIO-BUF] Channel name: '%s'.\n", channel_name);
+     
+-    struct iio_channel *ch = iio_device_find_channel(dev, channel_name, false);
++    const struct iio_channel *ch = iio_device_find_channel(dev, channel_name, false);
+     if (!ch) {
+-        fprintf(stderr, "Failed to fetch '%s' channel: %m\n", channel_name);
+-        return ctr;
++        fprintf(stderr, "Failed to fetch '%s' channel.\n", channel_name);
++        goto out;
+     }
+     
+     if (iio_channel_is_output(ch)) {
+         fprintf(stderr, "Wrong output channel selected.\n");
+-        return ctr;
++        goto out;
+     }
+     if (!iio_channel_is_scan_element(ch)) {
+         fprintf(stderr, "Channel is not a scan element.\n");
+-        return ctr;
++        goto out;
+     }
+     
+-    iio_channel_enable(ch);
+-    if (!iio_channel_is_enabled(ch)) {
++    mask = iio_create_channels_mask(iio_device_get_channels_count(dev));
++    if (!mask) {
++        fprintf(stderr, "Failed to create channels mask.\n");
++        goto out;
++    }
++    iio_channel_enable(ch, mask);
++    if (!iio_channel_is_enabled(ch, mask)) {
+         fprintf(stderr, "Failed to enable channel '%s'!\n", channel_name);
+-        return ctr;
++        goto out;
+     }
+     
+     INFO("[IIO-BUF] Creating buffer.\n");
+-    struct iio_buffer *rxbuf = iio_device_create_buffer(dev, 1, false);
++    struct iio_buffer *rxbuf = iio_device_get_buffer(dev, 0);
+     if (!rxbuf) {
+-        fprintf(stderr, "Failed to allocated buffer: %m\n");
+-        return ctr;
++        fprintf(stderr, "Device has no buffer.\n");
++        goto out;
++    }
++    /* A single block of a single sample: each capture waits for a fresh sample */
++    stream = iio_buffer_create_stream(rxbuf, 1, 1, mask);
++    err = iio_err(stream);
++    if (err) {
++        stream = NULL;
++        fprintf(stderr, "Failed to allocated buffer: %s\n", strerror(-err));
++        goto out;
+     }
+     
+     // Load scale
+@@ -124,7 +141,7 @@ static double iio_buffer_capture(struct als_device *als, double *pct, const int
+     const struct iio_data_format *fmt = iio_channel_get_data_format(ch);
+     if (!fmt) {
+         fprintf(stderr, "Failed to fetch channel format.\n");
+-        return ctr;
++        goto out;
+     }
+     if (fmt->with_scale) {
+         scale = fmt->scale;
+@@ -133,14 +150,14 @@ static double iio_buffer_capture(struct als_device *als, double *pct, const int
+     INFO("[IIO-BUF] Data fmt: bits: %d | signed: %d | len: %d | rep: %d | scale: %f | has_scale: %d | shift: %d.\n", 
+            fmt->bits, fmt->is_signed, fmt->length, fmt->repeat, fmt->scale, fmt->with_scale, fmt->shift);
+ 
+-    const size_t read_size = fmt->bits / 8;
+     for (int i = 0; i < num_captures; i++) {
+-        int ret = iio_buffer_refill(rxbuf);
+-        INFO("[IIO-BUF] Refill ret: %d/%ld\n", ret, read_size);
+-        if (ret == read_size) {
++        const struct iio_block *block = iio_stream_get_next_block(stream);
++        err = iio_err(block);
++        INFO("[IIO-BUF] Refill ret: %d\n", err);
++        if (!err) {
+             int64_t val = 0;
+-            if (ret == read_size) {
+-                iio_channel_read(ch, rxbuf, &val, read_size);
++            size_t ret = iio_channel_read(ch, block, &val, sizeof(val), false);
++            if (ret > 0) {
+                 INFO("[IIO-BUF] Read %ld\n", val);
+                 double illuminance = (double)val * scale;
+                 ctr++;
+@@ -150,7 +167,14 @@ static double iio_buffer_capture(struct als_device *als, double *pct, const int
+         }
+         usleep(interval * 1000);
+     }
+-    iio_buffer_destroy(rxbuf);
++
++out:
++    if (stream) {
++        iio_stream_destroy(stream);
++    }
++    if (mask) {
++        iio_channels_mask_destroy(mask);
++    }
+     iio_context_destroy(local_ctx);
+     return ctr;
+ }
diff --git a/meta-multimedia/recipes-multimedia/clight/clightd_5.9.bb b/meta-multimedia/recipes-multimedia/clight/clightd_5.9.bb
index 037b94c3a2..57782ba537 100644
--- a/meta-multimedia/recipes-multimedia/clight/clightd_5.9.bb
+++ b/meta-multimedia/recipes-multimedia/clight/clightd_5.9.bb
@@ -8,7 +8,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SRCREV = "d4e88b1d351d61151c99a399abd526d9b7dda12d"
 SRC_URI = "git://github.com/FedeDP/${BPN};protocol=https;branch=master;tag=${PV} \
+           file://0001-sensors-als-Port-to-libiio-1.0-API.patch \
 "
+UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)$"
 
 inherit cmake pkgconfig systemd features_check
 
