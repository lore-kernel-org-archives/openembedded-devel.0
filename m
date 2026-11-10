Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1090.1794332159437590724
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Nov 2026 09:35:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=0zmVA+hM;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so28629255e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 09:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794332157; x=1794936957; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o6TmDhIQfQMyKfUbNRc764ERoyhuscUbIGTQEB12gk0=;
        b=0zmVA+hM+bSz3RN6XbSEOGdh+iG/PgmL6qHrNh3Mibl6qAw70fLKdpS/Uw6FwxG5iS
         SuDVmGbOPKdOX/UIHmwQpx3P/+ApE1/8RnEqb5YYMN6LJgOB0uMBvKNzUlpXdMuo5otr
         SFNiZ9lHggb79h+Ww3vSla3+Ufk9MbzATs8LsloVASsLyw3jM1qWnKw9HhCplELiw6ZR
         SPSeyJ8tzWZ3XIvS3jhQrgNRjNFjmtLAxmowMbxwefsE3PNNIgL/dooVuYvfUUihAMLK
         S8agAFAyZjC3oDfBPHRXGIV/X0/oUOk//vz8k8W2kMSRJBamQinOt1wuuwKQ5DP6BBS1
         WaKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794332157; x=1794936957;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o6TmDhIQfQMyKfUbNRc764ERoyhuscUbIGTQEB12gk0=;
        b=CjVifhkruYpDOv7EtI9PJKk6W4lVwQ1EZzFLKBQ/dz4YEV97c7K8+we0Yhsaqo5Rf1
         0eVT1q4AQxijJvsBm8NhSG0bkJ2dAGOkrEagh+KhV/aiMfUVWhHiByH6elY5oskoxFCg
         Bv2ujfJLqDhnOyN9G56t50mdscpzia4tS122cRY8r+drF3gYaK0PjtHFYOT8WIWebENg
         RylUoF7ATjMDS+23vGH2mxb3uqm1+PBrXUY2m0+qDOCoocENU9LV9pv/nAOTBPCXCdyc
         v/hSRHC0qHG5wz+0ll1qyccInV63S1qrZk5/xtTjRTBbTxria+WwWDJ2Cj5DzUcStnxH
         hI0Q==
X-Gm-Message-State: APuU4Z+5TJM8halBDajFGPfu8e47KWKYALIhD91duDb3+34NzXsSDZ+V
	KHdXtXBfLQIklm5teyf9t5KQkWaHMnsg67lpcnJepzrGVBmjqLxDKGRRXvFf6Q==
X-Gm-Gg: AYBFou2Jfmg8wdH0373SHlHXqXBiehbjg4zNBjvoyh7hj9U8R0Aq5qGfBKyDTkZ5mHs
	ERXtCDoWNKdy+pRX6FMvImm21WVtapPjHkJmPBnb/8QsXHTu3tVPbNtqpTHJzIXLvERqbYdI2Nj
	BqOvWVwegiZAE7Bzg8yTM1n1YH9LFLyMp9wKyDaVaKvdAAEyfE1ZASjV/H50g2HeH4z91FV//MA
	LbtlE/SEydDDN24brrUeRPStCrVnu1Zd34B3WQwpXTdenwrxQEVVngxAdWDdTtiOrkjAc/aXj5F
	EL3lRRvS3t1nB65XOVZgjfVbV+mN5y6ra7QVTsVKkYsYpSUvsjhuvZvsL2//7aUpiwQ6sbUV1a2
	AbrT94zRIN4zMASibEDluGi4+92dLH82s+HPa/lcgT46EMdzinvgNp3ZRbppswU6vzxjJ8Ys/Fi
	GdKLIE+NWlzLPgIE4yXp0ZNX5frwjQy2a3GiJCYEJJ7iMIQRV8nyE+43/xzIznl9TKmC73QyO0f
	GafhS2jjsmPsbSMb2Eiq6J5pUok/B/zv+NWrrKjfJ8JUdgztD7b/DFZ9zGK1euJaFK92+uuKMDq
	a+5RCl295W6+lDQx9FmA3Fv2vUsuZYomxFKoC4zRmOHLYNIzHTeEKO4Pnx0A4j5bVUWwBI/YF3y
	dLQI=
X-Received: by 2002:a05:600c:c83:b0:4a2:18c4:61a5 with SMTP id 5b1f17b1804b1-4ba08dc2f77mr1484205e9.6.1794332157281;
        Tue, 10 Nov 2026 09:35:57 -0800 (PST)
Return-Path: <alex.kiernan@gmail.com>
Received: from [192.168.5.15] (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fea9eesm122994405e9.11.2026.11.10.09.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 09:35:56 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 10 Nov 2026 17:35:32 +0000
Subject: [PATCH meta-oe 03/10] android-tools: adbd: fix the USB worker
 hanging on glibc after a cable pull
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-android-tools-adbd-v1-3-cc2176f381c3@gmail.com>
References: <20261110-android-tools-adbd-v1-0-cc2176f381c3@gmail.com>
In-Reply-To: <20261110-android-tools-adbd-v1-0-cc2176f381c3@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
X-Mailer: b4 0.16.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 17:36:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132100

UsbFfsConnection::StopWorker() waits for the worker with
pthread_kill(handle, 0) == ESRCH, which holds on bionic but not glibc, where
an exited, unjoined thread still answers 0. A cable pull ends the worker
on its own, StopWorker() then spins for ever, ep0 is never reopened and the
host sees the device as offline until adbd is restarted.

AI-Generated: Claude Opus 5.5 (Claude Code)
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 ...-use-pthread_kill-as-a-thread-liveness-pr.patch | 118 +++++++++++++++++++++
 .../android-tools/android-tools_35.0.2.bb          |   1 +
 2 files changed, 119 insertions(+)

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/0018-adbd-do-not-use-pthread_kill-as-a-thread-liveness-pr.patch b/meta-oe/recipes-devtools/android-tools/android-tools/0018-adbd-do-not-use-pthread_kill-as-a-thread-liveness-pr.patch
new file mode 100644
index 000000000000..0ebe7aba69b5
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/0018-adbd-do-not-use-pthread_kill-as-a-thread-liveness-pr.patch
@@ -0,0 +1,118 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Alex Kiernan <alex.kiernan@gmail.com>
+Date: Sun, 13 Sep 2026 08:31:56 +0100
+Subject: [PATCH] adbd: do not use pthread_kill as a thread-liveness probe
+
+UsbFfsConnection::StopWorker() polled `pthread_kill(handle, 0) == ESRCH` to ask
+whether the worker had exited. That reads as portable and is not: it relies on
+bionic clearing the thread id on exit, so a signal to a dead thread lands on
+nothing. glibc keeps the thread descriptor valid until join(), so for an
+exited-but-unjoined thread pthread_kill returns 0, the probe answers "still
+running" for ever, and the loop never terminates.
+
+It is not a race on glibc, it is a hang, and the path that reaches it is the
+ordinary one: a cable pull kills the worker on its own with "Cannot send after
+transport endpoint shutdown", so StopWorker is entered with a corpse.
+~UsbFfsConnection then never returns, usb_ffs_open_thread never reopens ep0,
+and the kernel gadget re-enumerates perfectly while the host claims the
+interface and never receives a CNXN. The device shows as `offline` until
+something restarts adbd. On a unit whose only route in is adb, nothing can.
+
+The worker now reports its own exit through an atomic, which is true on both
+libcs. It is set from a scope guard rather than as the lambda's last statement
+because the SubmitRead failure path returns early, and that is precisely a case
+StopWorker must not wait for ever on. The signal is still sent on every pass,
+since interrupting a worker blocked in io_getevents is what the loop is for.
+
+Diagnosed on two RK3308 units, both wedged the first time either had its cable
+pulled since boot: main thread in futex_wait joining the monitor, monitor
+thread in hrtimer_nanosleep at the 100ms spin, the open thread waiting on a
+connection reset that never comes, and no worker thread at all. strace of the
+monitor shows both pthread_kill calls returning success with no tgkill issued.
+
+Upstream-Status: Pending
+
+AI-Generated: Claude Opus 5 (Claude Code)
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+---
+ packages/modules/adb/daemon/usb.cpp | 38 +++++++++++++++++++++--------
+ 1 file changed, 28 insertions(+), 10 deletions(-)
+
+diff --git a/packages/modules/adb/daemon/usb.cpp b/packages/modules/adb/daemon/usb.cpp
+index 1fe2d3aa3215..e44c7b788587 100644
+--- a/packages/modules/adb/daemon/usb.cpp
++++ b/packages/modules/adb/daemon/usb.cpp
+@@ -146,6 +146,7 @@ struct UsbFfsConnection : public Connection {
+     UsbFfsConnection(unique_fd control, unique_fd read, unique_fd write,
+                      std::promise<void> destruction_notifier)
+         : worker_started_(false),
++          worker_exited_(false),
+           stopped_(false),
+           destruction_notifier_(std::move(destruction_notifier)),
+           control_fd_(std::move(control)),
+@@ -406,6 +407,14 @@ struct UsbFfsConnection : public Connection {
+             adb_thread_setname("UsbFfs-worker");
+             LOG(INFO) << "UsbFfs-worker thread spawned";
+ 
++            // On EVERY exit path, not as a final statement: the SubmitRead
++            // failure below returns early, and that is precisely a case
++            // StopWorker() must not wait forever on.
++            struct ExitReporter {
++                std::atomic<bool>* flag;
++                ~ExitReporter() { flag->store(true, std::memory_order_release); }
++            } exit_reporter{&worker_exited_};
++
+             for (size_t i = 0; i < kUsbReadQueueDepth; ++i) {
+                 read_requests_[i] = CreateReadBlock(next_read_id_++);
+                 if (!SubmitRead(&read_requests_[i])) {
+@@ -435,8 +444,23 @@ struct UsbFfsConnection : public Connection {
+             return;
+         }
+ 
++        // NOT pthread_kill(handle, 0) == ESRCH as a liveness probe. That reads
++        // as portable and is not: it relies on bionic clearing the thread id
++        // when a thread exits, so the signal lands on nothing. glibc keeps the
++        // descriptor valid until join(), so for an exited-but-unjoined thread
++        // pthread_kill returns 0 and the probe says "still running" for ever.
++        //
++        // The loop is reached with a dead worker in the one case that matters:
++        // a cable pull kills the worker on its own (transport endpoint
++        // shutdown), and then ~UsbFfsConnection never returns, the ffs
++        // endpoints are never reopened, and the host sees a device that
++        // enumerates but never sends CNXN - offline until adbd is restarted.
++        // On a unit whose only way in IS adb, that is unrecoverable.
++        //
++        // The signal is still sent on every pass, because that is what the loop
++        // is for: interrupting a worker blocked in io_getevents.
+         pthread_t worker_thread_handle = worker_thread_.native_handle();
+-        while (true) {
++        while (!worker_exited_.load(std::memory_order_acquire)) {
+             int rc = pthread_kill(worker_thread_handle, kInterruptionSignal);
+             if (rc != 0) {
+                 LOG(ERROR) << "failed to send interruption signal to worker: " << strerror(rc);
+@@ -444,15 +468,6 @@ struct UsbFfsConnection : public Connection {
+             }
+ 
+             std::this_thread::sleep_for(100ms);
+-
+-            rc = pthread_kill(worker_thread_handle, 0);
+-            if (rc == 0) {
+-                continue;
+-            } else if (rc == ESRCH) {
+-                break;
+-            } else {
+-                LOG(ERROR) << "failed to send interruption signal to worker: " << strerror(rc);
+-            }
+         }
+ 
+         worker_thread_.join();
+@@ -709,6 +724,9 @@ struct UsbFfsConnection : public Connection {
+ 
+     bool worker_started_;
+     std::thread worker_thread_;
++    // Set by the worker itself on the way out. StopWorker() waits on this
++    // rather than probing the thread handle - see the comment there.
++    std::atomic<bool> worker_exited_;
+ 
+     std::atomic<bool> stopped_;
+     std::promise<void> destruction_notifier_;
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb b/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb
index b1e66198f88c..9a0bae98dd19 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb
@@ -62,6 +62,7 @@ SRC_URI = "https://deb.debian.org/debian/pool/main/a/android-platform-tools/andr
            file://0015-adbd-make-fs-config-opt-in-on-non-android-builds.patch \
            file://0016-adbd-forward-the-reboot-target-to-RESTART2.patch \
            file://0017-adbd-shell-start-in-HOME-and-drop-the-Android-only-T.patch \
+           file://0018-adbd-do-not-use-pthread_kill-as-a-thread-liveness-pr.patch \
            "
 
 SRC_URI[orig.md5sum] = "352376965cdef7bd7505d8fefdd43d50"

-- 
2.43.0

