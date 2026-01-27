Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C908ED2F024
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 13:01:39 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10490.1769518890795740965
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jan 2026 05:01:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Zvhqo8Lv;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47ee9817a35so44093955e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 05:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769518889; x=1770123689; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zrsRI0+D3PurFZUVztZD93XG6TfRp0W2ehIEZjKD6pU=;
        b=Zvhqo8Lv+/rriMiN66kWSkOuFZ032Gqfte9IKlqAJH7GDhOvHfManR0FzhyhNETC/H
         T5JQmlkr9oSAUps1qLGUxmN8BU1xSqkUlmWS5pEy5BiPktEuANjNToQeLBzwivT2hD21
         CDlm2VK+A/8u7N/eKZNhMU9b29mcMk5+usxgI4VGrL1k6j1+F/NKtjqh7g0UV44fGmd+
         OQCXS7cnOz6SOc/SbBj/SNWHw0aeUjcrjmWPagAFbYCodaucd2TvcADv3sWPYC+R3Ikd
         C6e9ACavHqt6Lq0LtYUoL9fJn5S4kjBoCIC0QrNyM4H4psVu7btXvptbmOLCKaJnoPlV
         Q5aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769518889; x=1770123689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zrsRI0+D3PurFZUVztZD93XG6TfRp0W2ehIEZjKD6pU=;
        b=t7mKRO2sJZAaslz4Ax1nkNfKXyw4b4++pqhNfcsBOv3M5c+Ab1gYwjbTZdTLkMtTkg
         Ar4kV+JeORTWGk3AGJzOvWpezrMizq6mgRZokZLtyUTRfA6ez+p4vmzIgXSY6zr/gMG3
         5cKLDNjE768H+0V0exdRGOWVQj24nPieXRFipOqyTeZL9aEihN6wdvDSB4yUtAgEqsvn
         7Xo/JarBG72XoacdwLlJrXd/2CP9B7LZUgpn1gmPmxCj6bUIivBH+gM7ojHaOCcWWsdN
         1BPADiUdhXDVX9vswpc4AWHKqgPgCSNqtvsdZjAwSBv4Zum6yJSl2/CeEVP6ExfAAJbu
         sBDA==
X-Gm-Message-State: AOJu0YxgITtLCAggtbK3W8ydBUcQHBc7H8LoTMWrBZHLLbfCdCNZ5d/h
	h5OK1LyfSHTdKmwUEvqyyOaTmSjgEBZEhwdyusAwLmtDXeZSi9p+Xpadsg9a3g==
X-Gm-Gg: AZuq6aJWJa/vq3x2TM9r+LbX/5HkNR2xhlpb5pGbZ7mIPo2RdOH2hyFfnezBdZdvMFX
	rBFY/6xPd2UxXTPsT8asVN35klycvi/JhDnZky8FBgqXFpFXzQIr7fpSM78ZZ3NnTi59ajTTgzH
	vClnl3DkkWLk+spYIhCuTDJJoRvhfU4l9HgbUoXd4QHqQiFQ/nVoZnFK6XIsLX5OzhNDPfHGNcc
	xaE+/c9PnGzIlLLW4V5AL3L0TNfHxAlJ6RwFYqjYlIsgD4gcUt4rXfo5uttQux1NauVhxtXIMYf
	lTFT3dMp7VIDIb3FmjMRFUxZWEw7Qyg3uBuoMJLqfdXZ32FDRi1e8JkmLQ8bsfLmu1i7nTgO6u1
	U+k38skmNiMrvUWLpZWLtWl9UZ6TDojEEbn9eci/69CCrCeOG51w3zIsr0uusdcfI7BPitRsuqH
	CeeVaxly0K
X-Received: by 2002:a05:600c:1381:b0:47e:e076:c7a5 with SMTP id 5b1f17b1804b1-48069c25b95mr23844185e9.11.1769518888733;
        Tue, 27 Jan 2026 05:01:28 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c24a8asm37671577f8f.12.2026.01.27.05.01.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 05:01:28 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][RFC PATCH 12/14] tigervnc: patch CVE-2025-26599
Date: Tue, 27 Jan 2026 14:01:12 +0100
Message-ID: <20260127130116.1902238-13-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260127130116.1902238-1-skandigraun@gmail.com>
References: <20260127130116.1902238-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 13:01:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123952

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-26599

Pick the patches that explicitly mention this CVE ID in their
commit message.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../tigervnc/files/CVE-2025-26599-1.patch     |  69 +++++++++
 .../tigervnc/files/CVE-2025-26599-2.patch     | 131 ++++++++++++++++++
 .../tigervnc/tigervnc_1.11.0.bb               |   2 +
 3 files changed, 202 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/tigervnc/files/CVE-2025-26599-1.patch
 create mode 100644 meta-oe/recipes-graphics/tigervnc/files/CVE-2025-26599-2.patch

diff --git a/meta-oe/recipes-graphics/tigervnc/files/CVE-2025-26599-1.patch b/meta-oe/recipes-graphics/tigervnc/files/CVE-2025-26599-1.patch
new file mode 100644
index 0000000000..a56b824557
--- /dev/null
+++ b/meta-oe/recipes-graphics/tigervnc/files/CVE-2025-26599-1.patch
@@ -0,0 +1,69 @@
+From fe2822b8cf7fa104187838380419c6b2c300b24a Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Tue, 17 Dec 2024 15:19:45 +0100
+Subject: [PATCH 1/2] composite: Handle failure to redirect in
+ compRedirectWindow()
+
+From: Olivier Fourdan <ofourdan@redhat.com>
+
+The function compCheckRedirect() may fail if it cannot allocate the
+backing pixmap.
+
+In that case, compRedirectWindow() will return a BadAlloc error.
+
+However that failure code path will shortcut the validation of the
+window tree marked just before, which leaves the validate data partly
+initialized.
+
+That causes a use of uninitialized pointer later.
+
+The fix is to not shortcut the call to compHandleMarkedWindows() even in
+the case of compCheckRedirect() returning an error.
+
+CVE-2025-26599, ZDI-CAN-25851
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Acked-by: Peter Hutterer <peter.hutterer@who-t.net>
+(cherry picked from commit c1ff84bef2569b4ba4be59323cf575d1798ba9be)
+
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/1830>
+(cherry picked from commit 7169628a1715f8203665f9805c714ed111907914)
+
+CVE: CVE-2025-26599
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/7169628a1715f8203665f9805c714ed111907914]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ composite/compalloc.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/composite/compalloc.c b/composite/compalloc.c
+index 3e2f14fb0..55a1b725a 100644
+--- a/composite/compalloc.c
++++ b/composite/compalloc.c
+@@ -138,6 +138,7 @@ compRedirectWindow(ClientPtr pClient, WindowPtr pWin, int update)
+     CompScreenPtr cs = GetCompScreen(pWin->drawable.pScreen);
+     WindowPtr pLayerWin;
+     Bool anyMarked = FALSE;
++    int status = Success;
+ 
+     if (pWin == cs->pOverlayWin) {
+         return Success;
+@@ -216,13 +217,13 @@ compRedirectWindow(ClientPtr pClient, WindowPtr pWin, int update)
+ 
+     if (!compCheckRedirect(pWin)) {
+         FreeResource(ccw->id, RT_NONE);
+-        return BadAlloc;
++        status = BadAlloc;
+     }
+ 
+     if (anyMarked)
+         compHandleMarkedWindows(pWin, pLayerWin);
+ 
+-    return Success;
++    return status;
+ }
+ 
+ void
diff --git a/meta-oe/recipes-graphics/tigervnc/files/CVE-2025-26599-2.patch b/meta-oe/recipes-graphics/tigervnc/files/CVE-2025-26599-2.patch
new file mode 100644
index 0000000000..f8d34ab796
--- /dev/null
+++ b/meta-oe/recipes-graphics/tigervnc/files/CVE-2025-26599-2.patch
@@ -0,0 +1,131 @@
+From 179c3cccc8cebf5e1d365d14ef9717664937eb5c Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Mon, 13 Jan 2025 16:09:43 +0100
+Subject: [PATCH 2/2] composite: initialize border clip even when pixmap alloc
+ fails
+
+From: Olivier Fourdan <ofourdan@redhat.com>
+
+If it fails to allocate the pixmap, the function compAllocPixmap() would
+return early and leave the borderClip region uninitialized, which may
+lead to the use of uninitialized value as reported by valgrind:
+
+ Conditional jump or move depends on uninitialised value(s)
+    at 0x4F9B33: compClipNotify (compwindow.c:317)
+    by 0x484FC9: miComputeClips (mivaltree.c:476)
+    by 0x48559A: miValidateTree (mivaltree.c:679)
+    by 0x4F0685: MapWindow (window.c:2693)
+    by 0x4A344A: ProcMapWindow (dispatch.c:922)
+    by 0x4A25B5: Dispatch (dispatch.c:560)
+    by 0x4B082A: dix_main (main.c:282)
+    by 0x429233: main (stubmain.c:34)
+  Uninitialised value was created by a heap allocation
+    at 0x4841866: malloc (vg_replace_malloc.c:446)
+    by 0x4F47BC: compRedirectWindow (compalloc.c:171)
+    by 0x4FA8AD: compCreateWindow (compwindow.c:592)
+    by 0x4EBB89: CreateWindow (window.c:925)
+    by 0x4A2E6E: ProcCreateWindow (dispatch.c:768)
+    by 0x4A25B5: Dispatch (dispatch.c:560)
+    by 0x4B082A: dix_main (main.c:282)
+    by 0x429233: main (stubmain.c:34)
+
+ Conditional jump or move depends on uninitialised value(s)
+    at 0x48EEDBC: pixman_region_translate (pixman-region.c:2233)
+    by 0x4F9255: RegionTranslate (regionstr.h:312)
+    by 0x4F9B7E: compClipNotify (compwindow.c:319)
+    by 0x484FC9: miComputeClips (mivaltree.c:476)
+    by 0x48559A: miValidateTree (mivaltree.c:679)
+    by 0x4F0685: MapWindow (window.c:2693)
+    by 0x4A344A: ProcMapWindow (dispatch.c:922)
+    by 0x4A25B5: Dispatch (dispatch.c:560)
+    by 0x4B082A: dix_main (main.c:282)
+    by 0x429233: main (stubmain.c:34)
+  Uninitialised value was created by a heap allocation
+    at 0x4841866: malloc (vg_replace_malloc.c:446)
+    by 0x4F47BC: compRedirectWindow (compalloc.c:171)
+    by 0x4FA8AD: compCreateWindow (compwindow.c:592)
+    by 0x4EBB89: CreateWindow (window.c:925)
+    by 0x4A2E6E: ProcCreateWindow (dispatch.c:768)
+    by 0x4A25B5: Dispatch (dispatch.c:560)
+    by 0x4B082A: dix_main (main.c:282)
+    by 0x429233: main (stubmain.c:34)
+
+ Conditional jump or move depends on uninitialised value(s)
+    at 0x48EEE33: UnknownInlinedFun (pixman-region.c:2241)
+    by 0x48EEE33: pixman_region_translate (pixman-region.c:2225)
+    by 0x4F9255: RegionTranslate (regionstr.h:312)
+    by 0x4F9B7E: compClipNotify (compwindow.c:319)
+    by 0x484FC9: miComputeClips (mivaltree.c:476)
+    by 0x48559A: miValidateTree (mivaltree.c:679)
+    by 0x4F0685: MapWindow (window.c:2693)
+    by 0x4A344A: ProcMapWindow (dispatch.c:922)
+    by 0x4A25B5: Dispatch (dispatch.c:560)
+    by 0x4B082A: dix_main (main.c:282)
+    by 0x429233: main (stubmain.c:34)
+  Uninitialised value was created by a heap allocation
+    at 0x4841866: malloc (vg_replace_malloc.c:446)
+    by 0x4F47BC: compRedirectWindow (compalloc.c:171)
+    by 0x4FA8AD: compCreateWindow (compwindow.c:592)
+    by 0x4EBB89: CreateWindow (window.c:925)
+    by 0x4A2E6E: ProcCreateWindow (dispatch.c:768)
+    by 0x4A25B5: Dispatch (dispatch.c:560)
+    by 0x4B082A: dix_main (main.c:282)
+    by 0x429233: main (stubmain.c:34)
+
+Fix compAllocPixmap() to initialize the border clip even if the creation
+of the backing pixmap has failed, to avoid depending later on
+uninitialized border clip values.
+
+Related to CVE-2025-26599, ZDI-CAN-25851
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Acked-by: Peter Hutterer <peter.hutterer@who-t.net>
+(cherry picked from commit b07192a8bedb90b039dc0f70ae69daf047ff9598)
+
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/1830>
+(cherry picked from commit d09125fbb3b997ed77b7f008f8bd30328ba69fbb)
+
+CVE: CVE-2025-26599
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/d09125fbb3b997ed77b7f008f8bd30328ba69fbb]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ composite/compalloc.c | 11 ++++++++---
+ 1 file changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/composite/compalloc.c b/composite/compalloc.c
+index 55a1b725a..d1c205ca0 100644
+--- a/composite/compalloc.c
++++ b/composite/compalloc.c
+@@ -604,9 +604,12 @@ compAllocPixmap(WindowPtr pWin)
+     int h = pWin->drawable.height + (bw << 1);
+     PixmapPtr pPixmap = compNewPixmap(pWin, x, y, w, h);
+     CompWindowPtr cw = GetCompWindow(pWin);
++    Bool status;
+ 
+-    if (!pPixmap)
+-        return FALSE;
++    if (!pPixmap) {
++        status = FALSE;
++        goto out;
++    }
+     if (cw->update == CompositeRedirectAutomatic)
+         pWin->redirectDraw = RedirectDrawAutomatic;
+     else
+@@ -620,14 +623,16 @@ compAllocPixmap(WindowPtr pWin)
+         DamageRegister(&pWin->drawable, cw->damage);
+         cw->damageRegistered = TRUE;
+     }
++    status = TRUE;
+ 
++out:
+     /* Make sure our borderClip is up to date */
+     RegionUninit(&cw->borderClip);
+     RegionCopy(&cw->borderClip, &pWin->borderClip);
+     cw->borderClipX = pWin->drawable.x;
+     cw->borderClipY = pWin->drawable.y;
+ 
+-    return TRUE;
++    return status;
+ }
+ 
+ void
diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
index 5fbccd970d..1a2b4df7af 100644
--- a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
+++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
@@ -31,6 +31,8 @@ SRC_URI = "git://github.com/TigerVNC/tigervnc.git;branch=1.11-branch;protocol=ht
            file://CVE-2025-26596.patch;patchdir=${XORG_S} \
            file://CVE-2025-26597.patch;patchdir=${XORG_S} \
            file://CVE-2025-26598.patch;patchdir=${XORG_S} \
+           file://CVE-2025-26599-1.patch;patchdir=${XORG_S} \
+           file://CVE-2025-26599-2.patch;patchdir=${XORG_S} \
 "
 
 # Keep sync with xorg-server in oe-core

