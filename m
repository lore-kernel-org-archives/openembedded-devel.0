Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1075.1794332157363949842
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Nov 2026 09:35:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=J5gtYHAd;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso16077815e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 09:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794332156; x=1794936956; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AY8BGsv+drZooPn9Jj3FS28OTUn5Jw0AoqsqxFqdGnE=;
        b=J5gtYHAdxDy/4Sxr3iFUtRnKTn6SY4dYNJmuCLFXeg6pmAgl20Oa88uz+hGeYkHmYC
         7EOmS6TddlY48lPSVMFiFRSy5pMwbSWQJar5oh0nwrrwulDcjo5j8IwOKa75GLgelFf8
         BRcmZA47HTSJ9br6SJs7b51F6yA5ym/gfs/xLvcjT1RUE8P9SnyEM+2chtLJiOnclelo
         7EZM8sRiPc40ywQ/xwgZskTh7SagRz1FJEnljAzyOqOL9fILpRfSJNkA3jnmx1EZBm+R
         Ds/Z9ePDVQNS9JaxChxSBRPO2Muj2sdjamRt+ynHxmu3vtZBh4PaVNz19kTYlRa5LXCE
         UImQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794332156; x=1794936956;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AY8BGsv+drZooPn9Jj3FS28OTUn5Jw0AoqsqxFqdGnE=;
        b=JzwzjqHA3sdmXmtvh3NXYGlP2sn1yGpD7HNkXpgzSh3T+og1gUbrQsGGBs/UPYfHRE
         20cSch0B28RU0Qo03vx3dIUUNSUCxpLmIx3h/wFQ0Y5qMQ4sgmxDociULHjBhftx8pvQ
         Pt9TZcgt6mHUiPyyQZYMixEIHY4o+YmfAhXO/X+Jihu54EfAD/wSmzScg7fgv1RtTSm4
         6H8Kzi3dNRpW0B/4t6Av+ciVKnGzEZUXte5o09TRbixMCJIIWgDeCpL5SIOaPA6UbGSd
         +uHx6S9r08p3R8RSXFvjR62PN9pg162pu2lcl2/U9MrpBcgW7odfVqNqazNOA8zDspqf
         k7tg==
X-Gm-Message-State: APuU4Z/K3cZVP8M2vgh6iWFtQqnpP2Wi4Zwek+YxH+WXglBWSn/OvR+1
	uKLduHnZ6vICwz/IPsQHRgPJWyJ1h/7p89uvunjonrqY60sojifjpJIeH2nsUA==
X-Gm-Gg: AYBFou2xP8hFEon5bD0mO8sSZvrH7a67qsEu665Fhf7HniOgmfzC7lCMYrBEBidO/0i
	YaFuwgoMhB1ieL6qS6VzmNBzgIJdQyleDoj8itzrlpAXyL2DDU/S8CO5Iz2Has00CvlqYElKjH8
	9a61fwyN5FvJSYPtYuQ2s9EeWgsv6NDB2CuAEP+kcXblvmFgA7mMNN8y3u0nG0aA9QsmGeyFjaV
	vDt1MVUiI2I95aVbO1JZEWNgvsYSaJQC4QX7X9mVBkBdvWJb3qUKOkW3Yv/7Y71erDtB5ktL5G1
	YP5VzVSVb71ThaCp58O1IcEWbtS5mEQWHuWvkEpsYQjnGO8gWVHy7qzDpPkZlUQ/TACNP+N9Kkp
	Y2rHNRFtSvz8j3mXrcU9Sw/qYuaHjWPoI4KWJu6P45H6hZhfQkItFrJYFF0Xgal8/e5wxqq5s7S
	9K46W+R94t0EK16yHCbQjVbpi0yojKhATbeTnnJdqIuLfb73V9+a273VsFQaWOIMevzP6gPsMnc
	0HtcfcvZ5uLaWodXQwKgtFGHKGH4xhBb3Zq3V9a1jI6FctFsd2pbY0GWOKRw9lIlXIa4NIk9EVY
	VcO7R/2gP8gujIU4TbPYoqLD3md36ol7MeTl2N6hfWeocfjcW+XaLIDQSO2ajUeGHcEGjOKQSrk
	nNyw=
X-Received: by 2002:a05:600c:4687:b0:4a1:7d9b:d4ae with SMTP id 5b1f17b1804b1-4ba0233e7eamr56577535e9.5.1794332155319;
        Tue, 10 Nov 2026 09:35:55 -0800 (PST)
Return-Path: <alex.kiernan@gmail.com>
Received: from [192.168.5.15] (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fea9eesm122994405e9.11.2026.11.10.09.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 09:35:54 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 10 Nov 2026 17:35:30 +0000
Subject: [PATCH meta-oe 01/10] android-tools: adbd: forward the reboot
 target to RESTART2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-android-tools-adbd-v1-1-cc2176f381c3@gmail.com>
References: <20261110-android-tools-adbd-v1-0-cc2176f381c3@gmail.com>
In-Reply-To: <20261110-android-tools-adbd-v1-0-cc2176f381c3@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
X-Mailer: b4 0.16.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 17:36:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132098

reboot_device() hard-codes the RESTART2 reason to "adb" on non-Android
builds and drops the requested target, so `adb reboot recovery` and
`adb reboot bootloader` are plain reboots on any board whose kernel picks
the boot mode from the reboot reason (reboot-mode, as on Rockchip).

AI-Generated: Claude Opus 5.5 (Claude Code)
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 ...dbd-forward-the-reboot-target-to-RESTART2.patch | 42 ++++++++++++++++++++++
 .../android-tools/android-tools_35.0.2.bb          |  1 +
 2 files changed, 43 insertions(+)

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/0016-adbd-forward-the-reboot-target-to-RESTART2.patch b/meta-oe/recipes-devtools/android-tools/android-tools/0016-adbd-forward-the-reboot-target-to-RESTART2.patch
new file mode 100644
index 000000000000..02b7a44ed802
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/0016-adbd-forward-the-reboot-target-to-RESTART2.patch
@@ -0,0 +1,42 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Alex Kiernan <alex.kiernan@gmail.com>
+Date: Mon, 15 Jun 2026 00:00:00 +0000
+Subject: [PATCH] adbd: forward the reboot target to RESTART2
+
+On non-Android Linux builds reboot_device() hard-codes the RESTART2
+reboot reason to "adb" and throws away the requested target, so
+"adb reboot recovery", "adb reboot bootloader", etc. all collapse to a
+plain reboot.
+
+On Rockchip the reboot reason string is consumed by the kernel
+reboot-mode driver (drivers/power/reset/reboot-mode.c), which strcmp()s
+it against the device-tree "mode-*" entries (mode-recovery,
+mode-bootloader, mode-loader, ...) to pick the boot-mode magic written
+to the PMU syscon register that U-Boot reads on the next boot. With the
+reason fixed to "adb" nothing matches and it falls back to a normal
+boot.
+
+Pass the real target through instead. An empty target (bare
+"adb reboot") becomes "", which the kernel treats as "normal", matching
+the previous behaviour for that case.
+
+Upstream-Status: Pending
+
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+---
+ packages/modules/adb/daemon/services.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/packages/modules/adb/daemon/services.cpp b/packages/modules/adb/daemon/services.cpp
+index 1b2731442a2a..968e9e74ffa4 100644
+--- a/packages/modules/adb/daemon/services.cpp
++++ b/packages/modules/adb/daemon/services.cpp
+@@ -219,7 +219,7 @@ static void remount_service(unique_fd fd) {
+     auto reboot_service = [name](unique_fd fd) {
+         sync();
+         if (syscall(SYS_reboot, LINUX_REBOOT_MAGIC1, LINUX_REBOOT_MAGIC2,
+-                    LINUX_REBOOT_CMD_RESTART2, "adb") != 0) {
++                    LINUX_REBOOT_CMD_RESTART2, name.c_str()) != 0) {
+             WriteFdFmt(fd.get(), "reboot (%s) failed: %s\n", name.c_str(), strerror(errno));
+             return;
+         }
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb b/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb
index e9785ac235de..4961a13963c4 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb
@@ -60,6 +60,7 @@ SRC_URI = "https://deb.debian.org/debian/pool/main/a/android-platform-tools/andr
            file://0013-adb-sysdeps-provide-pread64-pwrite64-lseek64-fallba.patch \
            file://0014-daemon-auth-vendor-a-portable-b64_pton-for-non-glib.patch \
            file://0015-adbd-make-fs-config-opt-in-on-non-android-builds.patch \
+           file://0016-adbd-forward-the-reboot-target-to-RESTART2.patch \
            "
 
 SRC_URI[orig.md5sum] = "352376965cdef7bd7505d8fefdd43d50"

-- 
2.43.0

