Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1095.1794332161495632676
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Nov 2026 09:36:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=SUIi6bQr;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso24196415e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 09:36:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794332160; x=1794936960; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=szmYQk25uFUbtHR3HGlqjxsaiM0NvigwkqiZtn3o2V8=;
        b=SUIi6bQrm3enef4LeWaLGfRJYmG+b2IDlDMo7YWhPd1uK25ilhgR9v5v9cpas+QkON
         AytcD2O4KH9DSaEvd0JGCHoge05OgI1Byaib+N4YY5PXMytNwj8YcjaZgA8kKP/NLNMg
         5Knw6zD7PIBXwlSf+6s/+kfuiIPhnNQoCg3CtqVZmNDuW/shIHRPdP2dvwXUbo5N5MjC
         /MiFV7btntMTJWU36MMU07ewvyC2ZEGtPfxC8ECoqL42DnwGecd7PM5Sa2lWqcAu6GrP
         hMWv3HfqhVCHzZ+Ya7lop4H7gTYYKH6E6KfxSLYxO8PW43SSwm9LrXAKAMFRPyRuDE3X
         ILxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794332160; x=1794936960;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=szmYQk25uFUbtHR3HGlqjxsaiM0NvigwkqiZtn3o2V8=;
        b=OzoPO1shoZtRoYGPKyR/rJZL+vBU7domBTx1Ww7YO5zUMo1qrNtLEJtRO6uKR5zTxy
         3Z3pLb0qhXalQkHhW15TawDoNdOPj1Zj6qwZv81MgSMsjayz07JXv2ELm2P97Ii/mkaY
         SaIqWhhXgq/r652wujZd6Bv8aOKJdIHkQaqwRqwH6+yZNuYp4O5HubfvnjPlHJtUWzSQ
         UsI3lP/Cv2E+1Ys6TmQnT6mGIh3w3FYok6f4Dob+ARu/pvP8vVgjwqibqA+I/zd4h0+T
         zKMytbo0QtrBdjwkBmjh1y9Tx3s7Y1G/1nbYHoMc399ycYZKNK8i4y3eyRs6orHD5gIs
         fN5w==
X-Gm-Message-State: APuU4Z+ZB4ufIpaW79OD6Lhtyffp/XgwB7fdyYt4E8to1OWP1svj+7PZ
	C8ZR7mNIBBHZ5JM/w8XbMOIKtEVdmprcDlRnAqixLassbhqGGfcW4Hlc+zC9JA==
X-Gm-Gg: AYBFou1FLQo/79KGenNhN4AIFebQoaXdrptKIYxNmd/M8MtajIp2kgKgcLwzekxDzRc
	8N+62qY+Dz/iGTAxSheASxPD3g5OsrpSQ/8fZ1i+j0Hic3a7iTybn3DAMmSTcA6gzm+lmynfwvZ
	k2xIheJBIpR4k1FTRQSLsPJl/3g0t+vQYLjVj3W+r+NCW5NaGMZ7NY/Wi6XR9wBeNi3uKkBmT9B
	D/gU1g+Vx30Xic/3Lu9VxDlLslvb8dHJWJTXO8ciLLAPfHlcNgXP8VI5zWcpTYGa/qx3WJtQWWh
	RtjM09rOeivPieNfCVdnbwJsdumhhhza/6V5l2zIHwayiWZygYJusH/KUhLuF8q+YU/Y9jA3GPr
	5WGZyTzUaKqynp9kjn2J2g4F+ws28lPkm9y8fHXlYHcY+EvZp29CHwqp3tke6uqLX3rtWuXfvgZ
	tINIwYTZ5h0eFWy/QubjQrItI6Irl5BFHbwh4lkBUHL6KIjCoYEQrViMx+wPkuTt2sld5b8rB4d
	vvYWNR7L6+GDtzex3zWADFwApT3ReEjQ5nmpPFwmN10S7rIURUYE+aowQRG2Ces8A/O1eufErOb
	6idEmvEb+MXb+9mHuBQNy6YQu3VJZDocsJbH9p4Rmy9Vr8DRibwDIgTYMxtTjJJST1OzccpQ/e0
	olo8t
X-Received: by 2002:a05:600c:348d:b0:4a0:1b14:e283 with SMTP id 5b1f17b1804b1-4ba0230531emr57519765e9.1.1794332159328;
        Tue, 10 Nov 2026 09:35:59 -0800 (PST)
Return-Path: <alex.kiernan@gmail.com>
Received: from [192.168.5.15] (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fea9eesm122994405e9.11.2026.11.10.09.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 09:35:58 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 10 Nov 2026 17:35:34 +0000
Subject: [PATCH meta-oe 05/10] android-tools: adbd: signal readiness once
 functionfs is serviced
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-android-tools-adbd-v1-5-cc2176f381c3@gmail.com>
References: <20261110-android-tools-adbd-v1-0-cc2176f381c3@gmail.com>
In-Reply-To: <20261110-android-tools-adbd-v1-0-cc2176f381c3@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
X-Mailer: b4 0.16.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 17:36:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132102

adbd sent sd_notify(READY=1) from adbd_main(), but usb_init() has only
started the USB thread by then, so READY=1 raced open_functionfs().
10-adbd-configfs.conf binds the UDC from ExecStartPost with no delay on
the strength of READY=1, so a bind that won the race was dropped and the
host never reached CONFIGURED. Signal readiness from the USB thread once
functionfs is serviced, which is what that drop-in assumes.

Built without systemd, the same point writes a byte to the FIFO named in
$ADBD_READY_FIFO instead, if set, for other init systems. It opens the
FIFO non-blocking, so adbd never waits on a reader that has given up.

AI-Generated: Claude Opus 5.5 (Claude Code)
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 ...nal-readiness-once-functionfs-is-serviced.patch | 117 +++++++++++++++++++++
 .../android-tools/android-tools_35.0.2.bb          |   1 +
 2 files changed, 118 insertions(+)

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/0020-adbd-signal-readiness-once-functionfs-is-serviced.patch b/meta-oe/recipes-devtools/android-tools/android-tools/0020-adbd-signal-readiness-once-functionfs-is-serviced.patch
new file mode 100644
index 000000000000..77527437a4e6
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/0020-adbd-signal-readiness-once-functionfs-is-serviced.patch
@@ -0,0 +1,117 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Alex Kiernan <alex.kiernan@gmail.com>
+Date: Fri, 6 Nov 2026 10:03:09 +0000
+Subject: [PATCH] adbd: signal readiness once functionfs is serviced
+
+The gadget's UDC must not be bound until adbd is servicing functionfs:
+bind earlier and the bind is silently dropped, and the host never
+reaches CONFIGURED. adbd_main() sends sd_notify(READY=1) after
+usb_init(), but usb_init() only starts usb_ffs_open_thread, detached, so
+READY=1 races open_functionfs() - and a unit that binds the UDC on
+READY=1 (ExecStartPost with no delay) loses the race.
+
+Signal readiness from the USB thread instead, once the descriptors are
+written and the transport is registered. Built without systemd, the
+same point writes a byte to the FIFO named in $ADBD_READY_FIFO instead,
+if set, for other init systems. The FIFO is opened non-blocking, so
+adbd never waits on a reader that has given up. Readiness is signalled
+once; an adbd that is not on USB still signals it from adbd_main().
+
+Upstream-Status: Pending
+
+AI-Generated: Claude Opus 5.5 (Claude Code)
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+---
+ packages/modules/adb/adb.h           |  6 ++++++
+ packages/modules/adb/daemon/main.cpp | 31 +++++++++++++++++++++++++---
+ packages/modules/adb/daemon/usb.cpp  |  7 +++++++
+ 3 files changed, 41 insertions(+), 3 deletions(-)
+
+diff --git a/packages/modules/adb/adb.h b/packages/modules/adb/adb.h
+index b43bb42ec736..20c002051937 100644
+--- a/packages/modules/adb/adb.h
++++ b/packages/modules/adb/adb.h
+@@ -263,3 +263,9 @@ void adb_set_reject_kill_server(bool reject);
+ #endif
+ 
+ void usb_init();
++#if !ADB_HOST
++// Tell whoever started adbd that it is ready: sd_notify(READY=1) with systemd,
++// otherwise a byte to the FIFO named in $ADBD_READY_FIFO if set. Only the first
++// call does anything.
++void adbd_notify_ready();
++#endif
+diff --git a/packages/modules/adb/daemon/main.cpp b/packages/modules/adb/daemon/main.cpp
+index ac37461f21dc..a5b1d6b3e0eb 100644
+--- a/packages/modules/adb/daemon/main.cpp
++++ b/packages/modules/adb/daemon/main.cpp
+@@ -53,6 +53,8 @@
+ #include <systemd/sd-daemon.h>
+ #endif
+ 
++#include <mutex>
++
+ #include "adb.h"
+ #include "adb_auth.h"
+ #include "adb_listeners.h"
+@@ -244,6 +246,27 @@ static void drop_privileges(int) {
+ }
+ #endif
+ 
++void adbd_notify_ready() {
++    static std::once_flag once;
++    std::call_once(once, [] {
++#if defined(HAVE_SYSTEMD)
++        sd_notify(1, "READY=1");
++#else
++        const char* ready_fifo = getenv("ADBD_READY_FIFO");
++        if (ready_fifo != nullptr && *ready_fifo != '\0') {
++            // O_NONBLOCK: with no reader, open() fails with ENXIO rather than
++            // blocking this thread for ever; the reader has given up and
++            // gone ahead without the signal.
++            int fd = adb_open(ready_fifo, O_WRONLY | O_NONBLOCK | O_CLOEXEC);
++            if (fd >= 0) {
++                TEMP_FAILURE_RETRY(adb_write(fd, "1\n", 2));
++                adb_close(fd);
++            }
++        }
++#endif
++    });
++}
++
+ static void setup_adb(const std::vector<std::string>& addrs) {
+ #if defined(__ANDROID__)
+     // Get the first valid port from addrs and setup mDNS.
+@@ -368,9 +391,11 @@ int adbd_main(int server_port) {
+     init_jdwp();
+     D("adbd_main(): post init_jdwp()");
+ 
+-#if defined(HAVE_SYSTEMD)
+-    sd_notify(1, "READY=1");
+-#endif
++    // On USB, readiness is signalled from the USB thread once functionfs is
++    // serviced; usb_init() has only started that thread.
++    if (!is_usb) {
++        adbd_notify_ready();
++    }
+ 
+     D("Event loop starting");
+     fdevent_loop();
+diff --git a/packages/modules/adb/daemon/usb.cpp b/packages/modules/adb/daemon/usb.cpp
+index e44c7b788587..a970c4e1fd28 100644
+--- a/packages/modules/adb/daemon/usb.cpp
++++ b/packages/modules/adb/daemon/usb.cpp
+@@ -805,6 +805,13 @@ static void usb_ffs_open_thread() {
+                 std::move(control), std::move(bulk_out), std::move(bulk_in),
+                 std::move(destruction_notifier)));
+         register_transport(transport);
++
++        // functionfs descriptors are written and ep0 is being serviced, so the
++        // gadget will now handle FUNCTIONFS_BIND: this is the moment the UDC
++        // may be bound. Binding earlier races this setup, and the bind is
++        // silently dropped.
++        adbd_notify_ready();
++
+         future.wait();
+     }
+ }
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb b/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb
index e247cbbafa60..f5ab21262ce5 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb
@@ -64,6 +64,7 @@ SRC_URI = "https://deb.debian.org/debian/pool/main/a/android-platform-tools/andr
            file://0017-adbd-shell-start-in-HOME-and-drop-the-Android-only-T.patch \
            file://0018-adbd-do-not-use-pthread_kill-as-a-thread-liveness-pr.patch \
            file://0019-adb-daemon-exit-after-adb-root-unroot-so-an-init-sup.patch \
+           file://0020-adbd-signal-readiness-once-functionfs-is-serviced.patch \
            "
 
 SRC_URI[orig.md5sum] = "352376965cdef7bd7505d8fefdd43d50"

-- 
2.43.0

