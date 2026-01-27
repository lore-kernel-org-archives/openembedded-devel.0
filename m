Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9412AD2F01B
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 13:01:29 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10487.1769518886160043981
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jan 2026 05:01:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bdcH7pqv;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4359019da8cso4754789f8f.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 05:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769518884; x=1770123684; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JgXfILT9en1oA6jBpED9aNryalCKnlbX2HStLWag43I=;
        b=bdcH7pqvJ1L8D7Uc2VX3d8PwEe0aFfMPjcARTaMMhPPcxGsAydR46cph4fOJ/LMzIe
         ptis1D6sHtstZCBtPq3w8DfS6wXLBshdYeQY2/LNdun/JzkW/T0HxAI+7GHqKyMLj7Rq
         9Ye3l0N8ah+HVj3RlXsFLtNkYsPRUySDvRo+Ie9D5f8dM7sBjeJTZtnB4IIIj3NJ1sSs
         H2OwlRQwp9SSXkTOh93BIpEUR89GhROgddVTpYXk6m5uL5oUbqPeAqMK2jpSsT6vUx08
         6lo0hiEFDGJxl/vS1aoH6j+g29ULdsWV4EJSmEG3TXCUyQ1Rc+3GNQ1RzKZ99dUDq+w8
         fVvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769518884; x=1770123684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JgXfILT9en1oA6jBpED9aNryalCKnlbX2HStLWag43I=;
        b=qAa16VSHTfvaQnSrMFIj04zFTAt/+9wc+hK8tgoGV5W1oxfBUDX6DZ1EZY2oT3VVGc
         ymoOSAWpT8DzceA9uOUS+5wLfD3/p40E4Bv9Gr2VFPFadJiamgGvKjeA28dJgF9DkPaS
         uQgj+Fq0nRGJx1VBlrqJ6UGr0H41NTZI1cpjtjDP7tRyWxQZ3Uk5IwZ7MDZQJ5xLRj+0
         0hJmQGhLyh8FOeBXBWH48KzLV/kH5DUzSH4l1RsqqQBqfAkI4FM3zf6pZKjLBPY6cwsJ
         XMd9HBUHxsoxXirnWxAfAZbRFEO56/PX6SW5YIXOKFce4TiB2f23Lr3mAo86insvvhT/
         Qxdw==
X-Gm-Message-State: AOJu0YzMwER2wPcvDufSWzepnXMSyratBmUIrWb1ZvTryGt2va/4qK6N
	l6hsawh3wPKuVkiBkuMVetU8B4fOCBmxgMd/Lvm1HZ8XfRh4jZfTuoJiXs4uRg==
X-Gm-Gg: AZuq6aLprICDFx9hZvTHxfwrOP37dr8jcVyUEMyXX6f4gkiYvR3wrY4mcPeMu4WhB03
	EIWIHOi8Zzr404JXDX6qzahbxLi0RRXjT9LxnViTqWjr4gYh6QFU7dzZbgl9HN4Z/m5BctAv+uP
	3sjTp9CcWdCFSXfbDRohwSuevGmspvlCAzD/kjW3GiHKNxTOoPvAeDvfV45Q2ZjMJXQ+97n0K38
	X/yy7vIBHRNftNMDwJYEYeVR0uQ3sZk3YY+wSM92EG3bQYKspRdCQUuF7Ny+vSu1WtZtDuikmi+
	VHXC9FznYWrtTASGm+/XXsAfEkh0F+aYnG8x/ukPr0l8NkEJkIjI6n/5Z+7ztHED0tLlxBfWhu1
	VTLtWXLuw9keuenip1Wp6td8U4Trip9W8W1JSGF6KU/vuTuLnYF3TMKq0Z8oUXQs+QC5hK1ncqK
	eB9sjrqlJZ
X-Received: by 2002:a05:6000:268a:b0:435:add0:3d68 with SMTP id ffacd0b85a97d-435dd1cf0aamr2486379f8f.58.1769518884397;
        Tue, 27 Jan 2026 05:01:24 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c24a8asm37671577f8f.12.2026.01.27.05.01.23
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 05:01:23 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][RFC PATCH 07/14] tigervnc: patch CVE-2025-26594
Date: Tue, 27 Jan 2026 14:01:07 +0100
Message-ID: <20260127130116.1902238-8-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260127130116.1902238-1-skandigraun@gmail.com>
References: <20260127130116.1902238-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 13:01:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123946

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-26594

Pick the patch that explicitly references this vulnerability ID in
it message.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../tigervnc/files/CVE-2025-26594-1.patch     | 60 +++++++++++++++++++
 .../tigervnc/files/CVE-2025-26594-2.patch     | 53 ++++++++++++++++
 .../tigervnc/tigervnc_1.11.0.bb               |  2 +
 3 files changed, 115 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/tigervnc/files/CVE-2025-26594-1.patch
 create mode 100644 meta-oe/recipes-graphics/tigervnc/files/CVE-2025-26594-2.patch

diff --git a/meta-oe/recipes-graphics/tigervnc/files/CVE-2025-26594-1.patch b/meta-oe/recipes-graphics/tigervnc/files/CVE-2025-26594-1.patch
new file mode 100644
index 0000000000..e6786f4352
--- /dev/null
+++ b/meta-oe/recipes-graphics/tigervnc/files/CVE-2025-26594-1.patch
@@ -0,0 +1,60 @@
+From c5e22fddb236d0b5e452d9d535c51213d5231286 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Wed, 27 Nov 2024 11:27:05 +0100
+Subject: [PATCH 1/2] Cursor: Refuse to free the root cursor
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+From: Olivier Fourdan <ofourdan@redhat.com>
+
+If a cursor reference count drops to 0, the cursor is freed.
+
+The root cursor however is referenced with a specific global variable,
+and when the root cursor is freed, the global variable may still point
+to freed memory.
+
+Make sure to prevent the rootCursor from being explicitly freed by a
+client.
+
+CVE-2025-26594, ZDI-CAN-25544
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+v2: Explicitly forbid XFreeCursor() on the root cursor (Peter Hutterer
+<peter.hutterer@who-t.net>)
+v3: Return BadCursor instead of BadValue (Michel Dänzer
+<michel@daenzer.net>)
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Suggested-by: Peter Hutterer <peter.hutterer@who-t.net>
+Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
+(cherry picked from commit 01642f263f12becf803b19be4db95a4a83f94acc)
+
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/1830>
+(cherry picked from commit 9e5ac777d0dfa9d4d78dd68558869489117c3f2c)
+
+CVE: CVE-2025-26594
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/9e5ac777d0dfa9d4d78dd68558869489117c3f2c]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ dix/dispatch.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/dix/dispatch.c b/dix/dispatch.c
+index a33bfaa9e..9654c207e 100644
+--- a/dix/dispatch.c
++++ b/dix/dispatch.c
+@@ -3039,6 +3039,10 @@ ProcFreeCursor(ClientPtr client)
+     rc = dixLookupResourceByType((void **) &pCursor, stuff->id, RT_CURSOR,
+                                  client, DixDestroyAccess);
+     if (rc == Success) {
++        if (pCursor == rootCursor) {
++            client->errorValue = stuff->id;
++            return BadCursor;
++        }
+         FreeResource(stuff->id, RT_NONE);
+         return Success;
+     }
diff --git a/meta-oe/recipes-graphics/tigervnc/files/CVE-2025-26594-2.patch b/meta-oe/recipes-graphics/tigervnc/files/CVE-2025-26594-2.patch
new file mode 100644
index 0000000000..7710d8c286
--- /dev/null
+++ b/meta-oe/recipes-graphics/tigervnc/files/CVE-2025-26594-2.patch
@@ -0,0 +1,53 @@
+From d6e2579da9987095b3909d8b2b239e7802cf1c2a Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Wed, 4 Dec 2024 15:49:43 +1000
+Subject: [PATCH 2/2] dix: keep a ref to the rootCursor
+
+From: Peter Hutterer <peter.hutterer@who-t.net>
+
+CreateCursor returns a cursor with refcount 1 - that refcount is used by
+the resource system, any caller needs to call RefCursor to get their own
+reference. That happens correctly for normal cursors but for our
+rootCursor we keep a variable to the cursor despite not having a ref for
+ourselves.
+
+Fix this by reffing/unreffing the rootCursor to ensure our pointer is
+valid.
+
+Related to CVE-2025-26594, ZDI-CAN-25544
+
+Reviewed-by: Olivier Fourdan <ofourdan@redhat.com>
+(cherry picked from commit b0a09ba6020147961acc62d9c73d807b4cccd9f7)
+
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/1830>
+(cherry picked from commit 5f0c4e0bf254c8b4552da276d01b1b80881b4e26)
+
+CVE: CVE-2025-26594
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/5f0c4e0bf254c8b4552da276d01b1b80881b4e26]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ dix/main.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/dix/main.c b/dix/main.c
+index b228d9c28..f2606d3d6 100644
+--- a/dix/main.c
++++ b/dix/main.c
+@@ -235,6 +235,8 @@ dix_main(int argc, char *argv[], char *envp[])
+                        defaultCursorFont);
+         }
+ 
++        rootCursor = RefCursor(rootCursor);
++
+ #ifdef PANORAMIX
+         /*
+          * Consolidate window and colourmap information for each screen
+@@ -275,6 +277,8 @@ dix_main(int argc, char *argv[], char *envp[])
+ 
+         Dispatch();
+ 
++        UnrefCursor(rootCursor);
++
+         UndisplayDevices();
+         DisableAllDevices();
+ 
diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
index a007297012..3e657ea6a8 100644
--- a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
+++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
@@ -25,6 +25,8 @@ SRC_URI = "git://github.com/TigerVNC/tigervnc.git;branch=1.11-branch;protocol=ht
            file://CVE-2023-6478.patch;patchdir=${XORG_S} \
            file://CVE-2024-0408.patch;patchdir=${XORG_S} \
            file://CVE-2024-0409.patch;patchdir=${XORG_S} \
+           file://CVE-2025-26594-1.patch;patchdir=${XORG_S} \
+           file://CVE-2025-26594-2.patch;patchdir=${XORG_S} \
 "
 
 # Keep sync with xorg-server in oe-core

