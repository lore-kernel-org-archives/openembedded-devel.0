Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF5B6D2F01C
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 13:01:39 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10173.1769518889716824159
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jan 2026 05:01:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lQIlNjAz;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-432da746749so3106439f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 05:01:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769518888; x=1770123688; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XYSu8cr1esCLecs7TfsIcvug1clTj9kz0Y64eAAC0G4=;
        b=lQIlNjAz09htb+R/eUb1F2hA6+/XC8Hl29UGOkRl55UQensZ2UIU4LVOvLa8ElqiSv
         x+SDFa0+XfUL+luwhOIRBpB/BfyuN+aDluKlnGpe02HYIm8BaAydissgT8+gZmydxxrD
         vaTMNETMkK0KhS9E8hPOfb9CP0HsWaY3wxr3PVsl94JwWpwYosd6BHkG9eJD6+6K2sSl
         SXeevWJkHeJSyAbGmEc20NAm77/xHsOMqoQbq2TUqyRAe8ONTRWpTYI3v58wM8wtAN41
         R8GH8wmr1p13TOsR09k3kMOj/B3Mj3N640xR9y7NgBLGyqbGU+Vm8t+rLQBCrFJKfTcx
         87ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769518888; x=1770123688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XYSu8cr1esCLecs7TfsIcvug1clTj9kz0Y64eAAC0G4=;
        b=DxeglHDFg0UErl3Ma6Xgcu9VGOvi/2OUToS4nAkzMmL7V3sLYd0vMgsPm0iD60EIWg
         7NSA+sx86L9efhIQlVetDK7askrhpZtT4l5WUcuRqeUmCZgFXTAWchUleNdiOyhjQAY0
         sOSyyWtlPKvqC/YQ+gN/X6wZYgrHp9SRcG1bdNXb7EnudgS4hw4FEGgmFjgbNDjis0Rr
         m2KY5b3nJY6gZvOtb0JenspHrfof0dwoLa+2yiCB6iTsmZ9K7VEKKyCptkE9+eYfKMYL
         hvfepqZqzlKs9RRuHJWD0R3XGy4cDuJPoRIQ+p51TD+m+uvMLrApg7NOR2qk+vLNQJWu
         O0Vg==
X-Gm-Message-State: AOJu0YxKVslT/NvPw81+eQmRja98Ip5y4gkHBh05OeyUKgo5yoyWk+Al
	ZML3gK1uJ1fkkgoFcIAhGhfuiBPMp6Sl0QRK+0M45Vw3tQah8VTqbYFzx1S2aA==
X-Gm-Gg: AZuq6aLjEHP/FjQTI4O+QjcRL6ODk5jVn9VVrR75L02F2dr8cRad6u7fn95H/nWozzJ
	desvj+IZTRcDZOoUqSYfNSaztKuYJBJa9/2YvGuShjG9MlFRlqFBA+QHqkbwUTfXKk8RpkMSpAk
	jqP5447f7jdKjvRvpOjl6c/Ou3vVN830ux4BNz45D7rx/1j7JNB/QJg12UYu8efsuK7mg0hypAd
	KlxrOvZpeFpOvM8FJny49ASXTdSZN6G0eYq44trZ6ZlRrz7qaMdNgIDBRODy3HCoTAMg3If8d/w
	wOtMnbsDavK0WU3zsZ4ajyK2klZcBDvkhgqiLW7Pke0lSz9HiegwoISFIOkEMVW6LP7A7PnwWYY
	0ZZWN8/iNIXC+RsSHSsBX95M9TBYLuTTIqzfWoq3e6szznPiN8udy0Y/Ufv+DccjuDZF5dRk/oK
	L//EdJFPwz
X-Received: by 2002:a05:6000:1786:b0:435:975d:33b0 with SMTP id ffacd0b85a97d-435dd0a39dfmr2480419f8f.35.1769518887902;
        Tue, 27 Jan 2026 05:01:27 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c24a8asm37671577f8f.12.2026.01.27.05.01.27
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 05:01:27 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][RFC PATCH 11/14] tigervnc: patch CVE-2025-26598
Date: Tue, 27 Jan 2026 14:01:11 +0100
Message-ID: <20260127130116.1902238-12-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260127130116.1902238-1-skandigraun@gmail.com>
References: <20260127130116.1902238-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 13:01:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123951

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-26598

Pick the patch that explicitly mentions the CVE ID in its commit message.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../tigervnc/files/CVE-2025-26598.patch       | 122 ++++++++++++++++++
 .../tigervnc/tigervnc_1.11.0.bb               |   1 +
 2 files changed, 123 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/tigervnc/files/CVE-2025-26598.patch

diff --git a/meta-oe/recipes-graphics/tigervnc/files/CVE-2025-26598.patch b/meta-oe/recipes-graphics/tigervnc/files/CVE-2025-26598.patch
new file mode 100644
index 0000000000..8ce3606fa5
--- /dev/null
+++ b/meta-oe/recipes-graphics/tigervnc/files/CVE-2025-26598.patch
@@ -0,0 +1,122 @@
+From ad498de18aab5d1095b2005a9555c003860b92bd Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Mon, 16 Dec 2024 11:25:11 +0100
+Subject: [PATCH] Xi: Fix barrier device search
+
+From: Olivier Fourdan <ofourdan@redhat.com>
+
+The function GetBarrierDevice() would search for the pointer device
+based on its device id and return the matching value, or supposedly NULL
+if no match was found.
+
+Unfortunately, as written, it would return the last element of the list
+if no matching device id was found which can lead to out of bounds
+memory access.
+
+Fix the search function to return NULL if not matching device is found,
+and adjust the callers to handle the case where the device cannot be
+found.
+
+CVE-2025-26598, ZDI-CAN-25740
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
+(cherry picked from commit bba9df1a9d57234c76c0b93f88dacb143d01bca2)
+
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/1830>
+(cherry picked from commit 32decb1efb89341881de8266f3dd1c3356981bfd)
+
+CVE: CVE-2025-26598
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/32decb1efb89341881de8266f3dd1c3356981bfd]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ Xi/xibarriers.c | 27 +++++++++++++++++++++++----
+ 1 file changed, 23 insertions(+), 4 deletions(-)
+
+diff --git a/Xi/xibarriers.c b/Xi/xibarriers.c
+index 1926762ad..cb336f22b 100644
+--- a/Xi/xibarriers.c
++++ b/Xi/xibarriers.c
+@@ -129,14 +129,15 @@ static void FreePointerBarrierClient(struct PointerBarrierClient *c)
+ 
+ static struct PointerBarrierDevice *GetBarrierDevice(struct PointerBarrierClient *c, int deviceid)
+ {
+-    struct PointerBarrierDevice *pbd = NULL;
++    struct PointerBarrierDevice *p, *pbd = NULL;
+ 
+-    xorg_list_for_each_entry(pbd, &c->per_device, entry) {
+-        if (pbd->deviceid == deviceid)
++    xorg_list_for_each_entry(p, &c->per_device, entry) {
++        if (p->deviceid == deviceid) {
++            pbd = p;
+             break;
++        }
+     }
+ 
+-    BUG_WARN(!pbd);
+     return pbd;
+ }
+ 
+@@ -337,6 +338,9 @@ barrier_find_nearest(BarrierScreenPtr cs, DeviceIntPtr dev,
+         double distance;
+ 
+         pbd = GetBarrierDevice(c, dev->id);
++        if (!pbd)
++            continue;
++
+         if (pbd->seen)
+             continue;
+ 
+@@ -445,6 +449,9 @@ input_constrain_cursor(DeviceIntPtr dev, ScreenPtr screen,
+         nearest = &c->barrier;
+ 
+         pbd = GetBarrierDevice(c, master->id);
++        if (!pbd)
++            continue;
++
+         new_sequence = !pbd->hit;
+ 
+         pbd->seen = TRUE;
+@@ -485,6 +492,9 @@ input_constrain_cursor(DeviceIntPtr dev, ScreenPtr screen,
+         int flags = 0;
+ 
+         pbd = GetBarrierDevice(c, master->id);
++        if (!pbd)
++            continue;
++
+         pbd->seen = FALSE;
+         if (!pbd->hit)
+             continue;
+@@ -679,6 +689,9 @@ BarrierFreeBarrier(void *data, XID id)
+             continue;
+ 
+         pbd = GetBarrierDevice(c, dev->id);
++        if (!pbd)
++            continue;
++
+         if (!pbd->hit)
+             continue;
+ 
+@@ -738,6 +751,8 @@ static void remove_master_func(void *res, XID id, void *devid)
+     barrier = container_of(b, struct PointerBarrierClient, barrier);
+ 
+     pbd = GetBarrierDevice(barrier, *deviceid);
++    if (!pbd)
++        return;
+ 
+     if (pbd->hit) {
+         BarrierEvent ev = {
+@@ -903,6 +918,10 @@ ProcXIBarrierReleasePointer(ClientPtr client)
+         barrier = container_of(b, struct PointerBarrierClient, barrier);
+ 
+         pbd = GetBarrierDevice(barrier, dev->id);
++        if (!pbd) {
++            client->errorValue = dev->id;
++            return BadDevice;
++        }
+ 
+         if (pbd->barrier_event_id == event_id)
+             pbd->release_event_id = event_id;
diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
index caa44ea0d6..5fbccd970d 100644
--- a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
+++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
@@ -30,6 +30,7 @@ SRC_URI = "git://github.com/TigerVNC/tigervnc.git;branch=1.11-branch;protocol=ht
            file://CVE-2025-26595.patch;patchdir=${XORG_S} \
            file://CVE-2025-26596.patch;patchdir=${XORG_S} \
            file://CVE-2025-26597.patch;patchdir=${XORG_S} \
+           file://CVE-2025-26598.patch;patchdir=${XORG_S} \
 "
 
 # Keep sync with xorg-server in oe-core

