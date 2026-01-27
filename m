Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAA5FD2F01F
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 13:01:39 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10174.1769518893714823051
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jan 2026 05:01:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Sb+UGt7F;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48069a48629so6088385e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 05:01:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769518892; x=1770123692; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=80MAugW1iisbs/8zr/sXuxh1n2iP5nHMxve2fw9gWnM=;
        b=Sb+UGt7Fbhtegchynsxsm6u9ZWe2MKFxvHrtNU7O7ItPimHn2KBWfjwWUfObjpwjbb
         7P3ASP7Z6eo2tFVxyWL2jkm9sw2IYv5HiCFKk8Kkg/3J5hBUXHldtFQGjoin/aqRdLRU
         k4KDHBtSn/dTrc/bEDCcMXMgVaHoVLd5mkqlPpQ4xaw/p2+YNPEC9+oHfQG9I4lDx9pc
         Gd33BeyCxa4V8de9x6BYJK5aedXRR/j4YBbctpsd9yuvGaG9hzRbIHeRtPdGqW0xPHF/
         aLHu4d5nE2sAbAtaPGopxoWE87X5S7O6T8sqRss+T6v4/pgzHWx57h4vvxA9P54lASMX
         f75g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769518892; x=1770123692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=80MAugW1iisbs/8zr/sXuxh1n2iP5nHMxve2fw9gWnM=;
        b=s0i4JzArgIktsRRoOgMCm3Hxj2e6Hwp2YpsCWUeAguPIFwHBhSEJcnVDRfWK2lSaHZ
         A1lbgs52jJwlfKZUNiO+vFhz/4BzZDGsRO+KWTb2SHiDpG/tfCA0RE2fpDdaWVA9E3xN
         oZkprBVmUssVICPXua5k9PdwfdAMwMJzVQqrKBnVv84AR/m+24qulntiGfU14PM4n6kK
         lC64qfqMN6GZQ4klM4TMeSrX098eocGOqdmVvG3MBpK6o84i/byNN/bFtuXGuC19u+pW
         l3rVJOV/j0SBT/MouvXdPTTyeOxZY0bBuCEbsp3vJYqyhQ3XtEFQPI5j5i5wNWjk5x9M
         VTjQ==
X-Gm-Message-State: AOJu0Yz24gDV44daRQI7l3AIn4RKDnNUxP0tDP6GB+BXrb8bJc77kqTn
	d6VSLZVGWPXfUVhSu/k85rHdoAue24ybO/M+LxUsbrya3nnFlaIsx7UT4ERw5w==
X-Gm-Gg: AZuq6aIjIBPUvcpjkisfxjMGGTrok213lFlhGaLOzWkZtnX09Vrya9BEA8X3t1/Q2Gr
	8gv3vgqMQUNpXJJxJ0lJPEnBA3Z6oM8/aBwc26eVvMh+p3JzCGnDahhnORb9JkQkEwcuHn9Qt6l
	zB50gmqu7ajW63K8kEgkoEVe9Z0/o2siPJQCzD3adqOjpPZGmuuY7v9RnHizXGa7QfZJd7T/rAD
	1Mk+fXcDyFTnxs9tn54Mqx0Qpu8uxZx+F/Smt2qqtnyTuwU7WxJrozlThWFzlNHXDnOqtIQ0U+c
	HkBVJgK79noIbqe5+NTC1mW5C0gbfcr+pHzfbalNR665oQ5AwARB6BdUVg7cwdll1zmmlVDkrhb
	TjpeUg1vauPaViophl+KaIiuUfh/Nmjr1NZeycOtFQF1ZhBmcTrvdVynHouMR3+buyxMS8b3oO9
	JXwlMq3cWp
X-Received: by 2002:a05:600c:83ca:b0:480:4b59:932e with SMTP id 5b1f17b1804b1-48069c1c2e2mr22153095e9.11.1769518889617;
        Tue, 27 Jan 2026 05:01:29 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c24a8asm37671577f8f.12.2026.01.27.05.01.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 05:01:29 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][RFC PATCH 13/14] tigervnc: patch CVE-2025-26600
Date: Tue, 27 Jan 2026 14:01:13 +0100
Message-ID: <20260127130116.1902238-14-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260127130116.1902238-1-skandigraun@gmail.com>
References: <20260127130116.1902238-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 13:01:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123954

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-26600

Pick the patch that explicitly mentions this CVE ID in its commit message.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../tigervnc/files/CVE-2025-26600.patch       | 70 +++++++++++++++++++
 .../tigervnc/tigervnc_1.11.0.bb               |  1 +
 2 files changed, 71 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/tigervnc/files/CVE-2025-26600.patch

diff --git a/meta-oe/recipes-graphics/tigervnc/files/CVE-2025-26600.patch b/meta-oe/recipes-graphics/tigervnc/files/CVE-2025-26600.patch
new file mode 100644
index 0000000000..39b297c705
--- /dev/null
+++ b/meta-oe/recipes-graphics/tigervnc/files/CVE-2025-26600.patch
@@ -0,0 +1,70 @@
+From 4776fc7f70250df69cd1000196d08ba2c5e57894 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Mon, 16 Dec 2024 16:18:04 +0100
+Subject: [PATCH] dix: Dequeue pending events on frozen device on removal
+
+From: Olivier Fourdan <ofourdan@redhat.com>
+
+When a device is removed while still frozen, the events queued for that
+device remain while the device itself is freed.
+
+As a result, replaying the events will cause a use after free.
+
+To avoid the issue, make sure to dequeue and free any pending events on
+a frozen device when removed.
+
+CVE-2025-26600, ZDI-CAN-25871
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
+(cherry picked from commit 6e0f332ba4c8b8c9a9945dc9d7989bfe06f80e14)
+
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/1830>
+(cherry picked from commit 826cef825fe49a275deb28e85b8c714b697f5efa)
+
+CVE: CVE-2025-26600
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/826cef825fe49a275deb28e85b8c714b697f5efa]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ dix/devices.c | 18 ++++++++++++++++++
+ 1 file changed, 18 insertions(+)
+
+diff --git a/dix/devices.c b/dix/devices.c
+index 7776498f8..deac30908 100644
+--- a/dix/devices.c
++++ b/dix/devices.c
+@@ -949,6 +949,23 @@ FreeAllDeviceClasses(ClassesPtr classes)
+ 
+ }
+ 
++static void
++FreePendingFrozenDeviceEvents(DeviceIntPtr dev)
++{
++    QdEventPtr qe, tmp;
++
++    if (!dev->deviceGrab.sync.frozen)
++        return;
++
++    /* Dequeue any frozen pending events */
++    xorg_list_for_each_entry_safe(qe, tmp, &syncEvents.pending, next) {
++        if (qe->device == dev) {
++            xorg_list_del(&qe->next);
++            free(qe);
++        }
++    }
++}
++
+ /**
+  * Close down a device and free all resources.
+  * Once closed down, the driver will probably not expect you that you'll ever
+@@ -1013,6 +1030,7 @@ CloseDevice(DeviceIntPtr dev)
+         free(dev->last.touches[j].valuators);
+     free(dev->last.touches);
+     dev->config_info = NULL;
++    FreePendingFrozenDeviceEvents(dev);
+     dixFreePrivates(dev->devPrivates, PRIVATE_DEVICE);
+     free(dev);
+ }
diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
index 1a2b4df7af..f8f53c4c91 100644
--- a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
+++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
@@ -33,6 +33,7 @@ SRC_URI = "git://github.com/TigerVNC/tigervnc.git;branch=1.11-branch;protocol=ht
            file://CVE-2025-26598.patch;patchdir=${XORG_S} \
            file://CVE-2025-26599-1.patch;patchdir=${XORG_S} \
            file://CVE-2025-26599-2.patch;patchdir=${XORG_S} \
+           file://CVE-2025-26600.patch;patchdir=${XORG_S} \
 "
 
 # Keep sync with xorg-server in oe-core

