Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3144.1794685064255471887
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 11:37:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=I47+Dv5N;
 spf=pass (domain: gmail.com, ip: 74.125.82.175, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so2792478eec.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 11:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794685064; x=1795289864; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rujivCV4r0wvviXKT0aG9gEPwcJRyRuTT+GYdwbLT1k=;
        b=I47+Dv5N3d3hfYs5BTerWSpXlHq9jo+0tDmkDxPDmIYjImQcYF4yncewtzI9fAsAjk
         xizSrnqeUmTfq8W8o7c6CHVt2n0oDjGxh/iTnd0/upSFwnP3/vn+U+gbaoNTc1JZvamj
         WWZ/NUCouhKYHBLiY94z1H9Fe4RiM/NwPyBPUNLZ6mIz6eGgOwQzvrYTl2yb1MzqpGaM
         JwXfK+NpWe7YWMgETT6EE9EwqROO5XMvNnaa15I8qciTgYCfAIR5eKIc7y1vddth27Lk
         gYhFgmZoDQch0ZTFdpfVemyeSCFeU8dBDkI23I+uCzMpI3zWagUtXQRgebYrC6m0H6Lo
         KBig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794685064; x=1795289864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rujivCV4r0wvviXKT0aG9gEPwcJRyRuTT+GYdwbLT1k=;
        b=EVPentB/fHt+5Adg16LRlFbQIoi+K3ESoE1vqUg8n7ozfr7Xu0rVnnnLlojz9ZItco
         WuJQCb8F0EmTtk4Y5Yt/2P7Qaw4VxSzm027WTQwVElcwaNFrdkyx4V5TBK/Y80SMYANr
         6ePJ9EbQz2hFmfsZksNWANuLmD2hllgZztGnNq6sLJxBSLlXfpB1nZ3/ksqhS1fdSFQD
         FsxMRlK9WK8MOsxA/v0WSpBI08ed3CbOhCy0t+yyg7fry34YNrJSNUVToOEOHnSGw0Gs
         /BWBwWNnALGJ3FOWXaaI5gNcsFVslJ06alI4Mnp8akvIKcWXksgzAT7b0zHHJaxkA8mv
         HK1g==
X-Gm-Message-State: APuU4Z9e01ObAfDAu27xs46Y11NoBurET+L42p076F+4CHR/BWRBHHRP
	f+lke7XSSPsQHZVpahx1BeexNsrxPsH8iip/5uxoQQJupvfzkQ4Ygxp63zyh3tjJ
X-Gm-Gg: AYBFou0msEO9QlVjiJLDE7gspnqO4RtApTvlGsJSeH5lp8UCB7FaLYsxdLdXRS23cXY
	pNqHY3Jy9a15gjjUpQ34f0nYoannwCf5nF7P4BTm8KmsNSBDZ+9kJVUj5iTeFQFqponbgeBYrth
	nbGHBi7Q/yzbevjXaGuf0nkMKcnNOZsPnz39/Ib9KSVxB+/S9Ie5HHaZs5S3iNVTI0EAOgF+pL/
	ElNm/rcdcJDkKIFVi7NF81LhUBVAolaZ0jktOrdhUonZdIQGN/qSIMY1aJh2NJ8m3/j2xzLb8Z0
	jejcDKae9nT3EEHSuORg2igBGnkgEIRIwb56Lt/vrf5F0qj8J6GNLDiC9TvBtTPG+AVp4haJ+WV
	nY6OKB88go8upHzPFL3ECuE4qcrzFmMl8yEPFQfVw8nU6Zc+J/nK2AREDdoDLCNh6rETaKd02US
	NNS2FZDzN6d/tu6GuwMHosuYCLSA9f/mPVlu43fllZ9+tYPX8BsKINJJMNPAI6vbqexKdrihgaj
	b+pJTxsyBlTAPQIWj3WCK41GMzI+jwCPFkiBg62ZiY+E/fPPz1/EBX0BnkVqQtBhahogvyLs/lD
	SMDKMoYHy8QV+q/tixQpG4Ebqr5O2B15OUjKbq1o8WSwwGS9noSm/VkonOoArjcitSIRR4p5TMP
	h3o7kv4WlxH8QGtEfD7mckWu3g7GeXOCyoHIvpBD3BOe48sSVA7wJfZkOrjlluekaGKGmlor0NI
	3nTvLcUGCQcvf5V6HjixgqI4XMEYV61XaN+7QjVbQuyWl3MJ4u6fstnT/EFvqQGIZyEHhrlIapw
	pbcsC3nahxh9XkNX7TdM082JxrH0+ZaPXNZEeUsIAWNAYB3DHhwrMZqKpS2fxkQgaCx7EynqMdr
	Bbwc
X-Received: by 2002:a05:7300:fd05:b0:35d:4e41:d2c2 with SMTP id 5a478bee46e88-37968b848d9mr8575819eec.33.1794685063341;
        Sat, 14 Nov 2026 11:37:43 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332a77sm16855164eec.4.2026.11.14.11.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 11:37:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 06/13] libdc1394: Fix build with clang
Date: Sat, 14 Nov 2026 11:37:26 -0800
Message-ID: <20261114193733.1743149-6-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114193733.1743149-1-khem.raj@oss.qualcomm.com>
References: <20261114193733.1743149-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 19:37:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132263
Content-Type: text/plain; charset="utf-8"

The juju backend uses variable length arrays in structs, a GCC
extension which clang does not support:

  error: fields must have a constant size: 'variable length array in structure' extension will never be supported

Allocate the buffers with alloca() and use the flexible array members
of the kernel event structs instead.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...se-variable-length-arrays-in-structs.patch | 233 ++++++++++++++++++
 .../libdc1394/libdc1394_2.2.7.bb              |   3 +-
 2 files changed, 235 insertions(+), 1 deletion(-)
 create mode 100644 meta-multimedia/recipes-multimedia/libdc1394/files/0001-juju-Do-not-use-variable-length-arrays-in-structs.patch

diff --git a/meta-multimedia/recipes-multimedia/libdc1394/files/0001-juju-Do-not-use-variable-length-arrays-in-structs.patch b/meta-multimedia/recipes-multimedia/libdc1394/files/0001-juju-Do-not-use-variable-length-arrays-in-structs.patch
new file mode 100644
index 0000000000..b246af85e4
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/libdc1394/files/0001-juju-Do-not-use-variable-length-arrays-in-structs.patch
@@ -0,0 +1,233 @@
+From a78265d465723a7c7b6354c04756d8cbf3045e72 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Mon, 9 Nov 2026 08:37:30 -0800
+Subject: [PATCH] juju: Do not use variable length arrays in structs
+
+Variable length arrays in structs are a GCC extension which clang does
+not support:
+
+  error: fields must have a constant size: 'variable length array in structure' extension will never be supported
+
+The kernel event structs already end with a flexible array member for
+the payload, so allocate the same amount of stack with alloca() and use
+the payload member instead.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ dc1394/juju/capture.c | 19 ++++++-----
+ dc1394/juju/control.c | 76 +++++++++++++++++++++++--------------------
+ 2 files changed, 51 insertions(+), 44 deletions(-)
+
+diff --git a/dc1394/juju/capture.c b/dc1394/juju/capture.c
+index e9da6e3..36e6031 100644
+--- a/dc1394/juju/capture.c
++++ b/dc1394/juju/capture.c
+@@ -22,6 +22,7 @@
+
+ #include <stdio.h>
+ #include <stdlib.h>
++#include <alloca.h>
+ #include <string.h>
+ #include <sys/types.h>
+ #include <netinet/in.h>
+@@ -319,10 +320,10 @@ dc1394_juju_capture_dequeue (platform_camera_t * craw,
+ 		return DC1394_CAPTURE_IS_NOT_SET;
+ 	}
+
+-    struct {
+-        struct fw_cdev_event_iso_interrupt i;
+-		__u32 headers[craw->packets_per_frame*2 + 16]; // HPK 20161209
+-    } iso;
++    /* the iso headers follow struct fw_cdev_event_iso_interrupt */
++    size_t iso_size = sizeof (struct fw_cdev_event_iso_interrupt) +
++        (craw->packets_per_frame*2 + 16) * sizeof (__u32); // HPK 20161209
++    struct fw_cdev_event_iso_interrupt *iso = alloca (iso_size);
+
+     if ( (policy<DC1394_CAPTURE_POLICY_MIN) || (policy>DC1394_CAPTURE_POLICY_MAX) )
+         return DC1394_INVALID_CAPTURE_POLICY;
+@@ -344,13 +345,13 @@ dc1394_juju_capture_dequeue (platform_camera_t * craw,
+             return DC1394_SUCCESS;
+         }
+
+-        len = read (craw->iso_fd, &iso, sizeof iso);
++        len = read (craw->iso_fd, iso, iso_size);
+         if (len < 0) {
+             dc1394_log_error("Juju: dequeue failed to read a response: %m");
+             return DC1394_FAILURE;
+         }
+
+-        if (iso.i.type == FW_CDEV_EVENT_ISO_INTERRUPT)
++        if (iso->type == FW_CDEV_EVENT_ISO_INTERRUPT)
+             break;
+     }
+
+@@ -358,7 +359,7 @@ dc1394_juju_capture_dequeue (platform_camera_t * craw,
+     f = craw->frames + craw->current;
+
+     dc1394_log_debug("Juju: got iso event, cycle 0x%04x, header_len %d",
+-            iso.i.cycle, iso.i.header_length);
++            iso->cycle, iso->header_length);
+
+     f->frame.frames_behind = 0;
+     f->frame.timestamp = 0;
+@@ -368,14 +369,14 @@ dc1394_juju_capture_dequeue (platform_camera_t * craw,
+         /* Current bus time in usec as retrieved by the ioctl */
+         uint32_t bus_time = bus_time_to_usec(tm.cycle_timer);
+         /* Bus time of the interrupt packet (end of frame) */
+-        uint32_t dma_time = iso.i.cycle;
++        uint32_t dma_time = iso->cycle;
+         /* Estimated usec between start of frame and end of frame */
+         uint32_t diff =
+             (craw->frames[0].frame.packets_per_frame - 1) * 125;
+
+         /* If per-packet timestamps are available in the headers use them */
+         if (craw->header_size >= 8) {
+-            uint8_t * b = (uint8_t *)(iso.i.header + 1);
++            uint8_t * b = (uint8_t *)(iso->header + 1);
+             /* Bus time of the first frame in the packet */
+             dma_time = (b[2] << 8) | b[3];
+             dc1394_log_debug("Juju: using cycle 0x%04x (diff was %d)",
+diff --git a/dc1394/juju/control.c b/dc1394/juju/control.c
+index 4a4acbb..26ed292 100644
+--- a/dc1394/juju/control.c
++++ b/dc1394/juju/control.c
+@@ -22,6 +22,7 @@
+
+ #include <stdio.h>
+ #include <stdlib.h>
++#include <alloca.h>
+ #include <errno.h>
+ #include <unistd.h>
+ #include <string.h>
+@@ -280,41 +281,46 @@ typedef struct _juju_response_info {
+ static int
+ juju_handle_event (platform_camera_t * cam)
+ {
+-    union {
+-        struct {
+-            struct fw_cdev_event_response r;
+-            __u32 buffer[cam->max_response_quads];
+-        } response;
++    union juju_event {
++        struct fw_cdev_event_response response;
+         struct fw_cdev_event_bus_reset reset;
+         struct fw_cdev_event_iso_resource resource;
+-    } u;
++    } *u;
++    size_t size;
+     int len, i;
+     juju_response_info *resp_info;
+     juju_iso_info *iso_info;
+
+-    len = read (cam->fd, &u, sizeof u);
++    /* the response data follows struct fw_cdev_event_response */
++    size = sizeof (struct fw_cdev_event_response) +
++           cam->max_response_quads * sizeof (__u32);
++    if (size < sizeof *u)
++        size = sizeof *u;
++    u = alloca (size);
++
++    len = read (cam->fd, u, size);
+     if (len < 0) {
+         dc1394_log_error("juju: Read failed: %m");
+         return -1;
+     }
+
+-    switch (u.reset.type) {
++    switch (u->reset.type) {
+     case FW_CDEV_EVENT_BUS_RESET:
+-        cam->generation = u.reset.generation;
+-        cam->node_id = u.reset.node_id;
++        cam->generation = u->reset.generation;
++        cam->node_id = u->reset.node_id;
+         dc1394_log_debug ("juju: Bus reset, gen %d, node 0x%x",
+                 cam->generation, cam->node_id);
+         break;
+
+     case FW_CDEV_EVENT_RESPONSE:
+-        if (!u.response.r.closure) {
++        if (!u->response.closure) {
+             dc1394_log_warning ("juju: Unsolicited response, rcode %x len %d",
+-                    u.response.r.rcode, u.response.r.length);
++                    u->response.rcode, u->response.length);
+             break;
+         }
+-        resp_info = u64_to_ptr(u.response.r.closure);
+-        resp_info->rcode = u.response.r.rcode;
+-        resp_info->actual_num_quads = u.response.r.length/4;
++        resp_info = u64_to_ptr(u->response.closure);
++        resp_info->rcode = u->response.rcode;
++        resp_info->actual_num_quads = u->response.length/4;
+         resp_info->got_response = 1;
+         if (resp_info->rcode || !resp_info->data)
+             break;
+@@ -326,48 +332,48 @@ juju_handle_event (platform_camera_t * cam)
+
+         len = MIN(resp_info->actual_num_quads, resp_info->num_quads);
+         for (i = 0; i < len; i++)
+-            resp_info->data[i] = ntohl (u.response.r.data[i]);
++            resp_info->data[i] = ntohl (u->response.data[i]);
+         break;
+
+     case FW_CDEV_EVENT_ISO_RESOURCE_ALLOCATED:
+-        if (!u.resource.closure) {
++        if (!u->resource.closure) {
+             dc1394_log_warning ("juju: Spurious ISO allocation event: "
+-                    "handle %d, chan %d, bw %d", u.resource.handle,
+-                    u.resource.channel, u.resource.bandwidth);
++                    "handle %d, chan %d, bw %d", u->resource.handle,
++                    u->resource.channel, u->resource.bandwidth);
+             break;
+         }
+-        iso_info = u64_to_ptr(u.resource.closure);
+-        if (iso_info->handle != u.resource.handle)
++        iso_info = u64_to_ptr(u->resource.closure);
++        if (iso_info->handle != u->resource.handle)
+             dc1394_log_warning ("juju: ISO alloc handle was %d, expected %d",
+-                    u.resource.handle, iso_info->handle);
++                    u->resource.handle, iso_info->handle);
+         dc1394_log_debug ("juju: Allocated handle %d: chan %d bw %d",
+-                u.resource.handle, u.resource.channel, u.resource.bandwidth);
++                u->resource.handle, u->resource.channel, u->resource.bandwidth);
+         iso_info->got_alloc = 1;
+-        iso_info->channel = u.resource.channel;
+-        iso_info->bandwidth = u.resource.bandwidth;
++        iso_info->channel = u->resource.channel;
++        iso_info->bandwidth = u->resource.bandwidth;
+         break;
+
+     case FW_CDEV_EVENT_ISO_RESOURCE_DEALLOCATED:
+-        if (!u.resource.closure) {
++        if (!u->resource.closure) {
+             dc1394_log_warning ("juju: Spurious ISO deallocation event: "
+-                    "handle %d, chan %d, bw %d", u.resource.handle,
+-                    u.resource.channel, u.resource.bandwidth);
++                    "handle %d, chan %d, bw %d", u->resource.handle,
++                    u->resource.channel, u->resource.bandwidth);
+             break;
+         }
+-        iso_info = u64_to_ptr(u.resource.closure);
+-        if (iso_info->handle != u.resource.handle)
++        iso_info = u64_to_ptr(u->resource.closure);
++        if (iso_info->handle != u->resource.handle)
+             dc1394_log_warning ("juju: ISO dealloc handle was %d, expected %d",
+-                    u.resource.handle, iso_info->handle);
++                    u->resource.handle, iso_info->handle);
+         dc1394_log_debug ("juju: Deallocated handle %d: chan %d bw %d",
+-                u.resource.handle, u.resource.channel, u.resource.bandwidth);
++                u->resource.handle, u->resource.channel, u->resource.bandwidth);
+         iso_info->got_dealloc = 1;
+-        iso_info->channel = u.resource.channel;
+-        iso_info->bandwidth = u.resource.bandwidth;
++        iso_info->channel = u->resource.channel;
++        iso_info->bandwidth = u->resource.bandwidth;
+         break;
+
+     default:
+         dc1394_log_warning ("juju: Unhandled event type %d",
+-                u.reset.type);
++                u->reset.type);
+         break;
+     }
+
diff --git a/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_2.2.7.bb b/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_2.2.7.bb
index 8cac780d64..e1f3b0f2fb 100755
--- a/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_2.2.7.bb
+++ b/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_2.2.7.bb
@@ -13,7 +13,8 @@ DEPENDS += "libusb1 libraw1394 libsdl \

 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz \
            file://install_examples.patch \
-          "
+           file://0001-juju-Do-not-use-variable-length-arrays-in-structs.patch \
+           "
 SRC_URI[sha256sum] = "537ceb78dd3cef271a183f4a176191d1cecf85f025520e6bd3758b0e19e6609f"
 inherit autotools pkgconfig

