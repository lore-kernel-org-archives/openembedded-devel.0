Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86B27D2F017
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 13:01:29 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10168.1769518884498794642
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jan 2026 05:01:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EsmFhCEv;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-432d2c7a8b9so5474061f8f.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 05:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769518883; x=1770123683; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=afEPEazk4OPl7JOCVW4iMaOQxyZlABQ+qgN+RExz8dI=;
        b=EsmFhCEvTKwrXJF22GYf5KU+LRPxLm+yjaY38uhay4lwJSJ3DzwjMuTdQbgwMypOv/
         4d1GgB2asH0oLNmQIuQx4acDxjrsJbTSuAPVXIw0EW4cO1KUbw3hYw5y/8PLWy7f3amK
         1s9VA0sqThGm7FTf2sJJ535r/seL89zUn8x9EjdIolob8FR1J2QB0EXHBCqO2I8Z7SbR
         TlWkMWvU/9P9q+cKvPbRrHH4mMNrl1mQISZDUveqcEx5CK9iY3GQRygYYWgQTGjsVLE4
         BcOLwPnm8IDkmEiLSK+swMZGfG2HvdwYHa7/ugVF9u/nXp1fh8x8ZdR/N55cFdUCbXY3
         qbig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769518883; x=1770123683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=afEPEazk4OPl7JOCVW4iMaOQxyZlABQ+qgN+RExz8dI=;
        b=iUyEuEitehiPcYtERrlLKjywDmTZDq9j9T5h0/tHmRiWS22EQ2uAG5vFL7VnNRbUn7
         xyuD+loau6D6rowhhTNUwjkJ/G6oq5QQZsU3GnHLJZoPqRWNNZaUB/v5pPkGgxbFt1HR
         PVozo+5NsvldIwWRGIXkNTMOBA85Nx+QaGe6auh0sMG+UNA2dhPIdm7RejpcpZaQKPwq
         XsSH6uFPGKtZgjH1Hk0x4ZnankQ75v5T3HbezqZxHGjVfkVJFWOwc7mb4EZJk1mnKLp7
         ukLCfopibJPcwUKse1YGDdE2EPaV66ruLq2emeK/zQx2NL8Pp9TXkTBHS3/LSTFOZIP3
         Pv3A==
X-Gm-Message-State: AOJu0Yza18jRXgSaohFb3FlOUSfnb8xK2kWt6PhHhomHoU+2TZQHUzyL
	yyf9JH2DoF5sxZdnyGasqIfDtnltHMeKW9K9egRvgn1XSs8prtdQrHSRYCpyPA==
X-Gm-Gg: AZuq6aKQ5z59IolkthquY+W2pAvUSaqt20wp8ju6q/zFFdpl3U0b5Ylbl59rnavOuqY
	h0FFhbfZ0PWvSCjndP9TjhHFwEbY0sTD+FsO61YlT+8bl1DiqSxKSKthkg/Av7YDEksDsLHbnBu
	8rpd9UYg5tYATkxjfC7FMe8qwhBHOIcXQ0XbWM37aMZwYO6g6iQllwnNwlVy3wvoF/JHB+F6HQq
	yxNP8+QfFp3xWe+bZWczd6mTcH0M304FWoGKBWbVU1h9NA1LC78m4TtKeMS3m7xDzQU/MB/S+rz
	IAmFm2qqUrRbdPhYdOCSwk8I3g+tHGPjnJJSF8fmn5XHwvrl/mO4xlapkwq9NlqppgY8uX75DMe
	Lenu+4TzYRyf57wQ7v1JyOqy3jcroFhqNfjQ8B2KmyjW2MLhw2dxO7nQHxT57UFzchScio7sA3A
	9/ZCx95CQO
X-Received: by 2002:a05:6000:2081:b0:435:953e:589c with SMTP id ffacd0b85a97d-435dd0b2a29mr2410034f8f.34.1769518882610;
        Tue, 27 Jan 2026 05:01:22 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c24a8asm37671577f8f.12.2026.01.27.05.01.21
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 05:01:22 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][RFC PATCH 05/14] tigervnc: patch CVE-2024-0408
Date: Tue, 27 Jan 2026 14:01:05 +0100
Message-ID: <20260127130116.1902238-6-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260127130116.1902238-1-skandigraun@gmail.com>
References: <20260127130116.1902238-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 13:01:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123945

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-0408

Pick the patch that explicitly mentions this vulnerability ID
in it's commit message.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../tigervnc/files/CVE-2024-0408.patch        | 65 +++++++++++++++++++
 .../tigervnc/tigervnc_1.11.0.bb               |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/tigervnc/files/CVE-2024-0408.patch

diff --git a/meta-oe/recipes-graphics/tigervnc/files/CVE-2024-0408.patch b/meta-oe/recipes-graphics/tigervnc/files/CVE-2024-0408.patch
new file mode 100644
index 0000000000..ffbc7448c3
--- /dev/null
+++ b/meta-oe/recipes-graphics/tigervnc/files/CVE-2024-0408.patch
@@ -0,0 +1,65 @@
+From b4ef18cf118aa92266665009fa3edf9c03253d8a Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Wed, 6 Dec 2023 12:09:41 +0100
+Subject: [PATCH] glx: Call XACE hooks on the GLX buffer
+
+From: Olivier Fourdan <ofourdan@redhat.com>
+
+The XSELINUX code will label resources at creation by checking the
+access mode. When the access mode is DixCreateAccess, it will call the
+function to label the new resource SELinuxLabelResource().
+
+However, GLX buffers do not go through the XACE hooks when created,
+hence leaving the resource actually unlabeled.
+
+When, later, the client tries to create another resource using that
+drawable (like a GC for example), the XSELINUX code would try to use
+the security ID of that object which has never been labeled, get a NULL
+pointer and crash when checking whether the requested permissions are
+granted for subject security ID.
+
+To avoid the issue, make sure to call the XACE hooks when creating the
+GLX buffers.
+
+Credit goes to Donn Seeley <donn@xmission.com> for providing the patch.
+
+CVE-2024-0408
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Acked-by: Peter Hutterer <peter.hutterer@who-t.net>
+(cherry picked from commit e5e8586a12a3ec915673edffa10dc8fe5e15dac3)
+(cherry picked from commit 8d825f72da71d6c38cbb02cf2ee2dd9e0e0f50f2)
+
+CVE: CVE-2024-0408
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/8d825f72da71d6c38cbb02cf2ee2dd9e0e0f50f2]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ glx/glxcmds.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/glx/glxcmds.c b/glx/glxcmds.c
+index c82ce2c78..f493252cb 100644
+--- a/glx/glxcmds.c
++++ b/glx/glxcmds.c
+@@ -48,6 +48,7 @@
+ #include "indirect_util.h"
+ #include "protocol-versions.h"
+ #include "glxvndabi.h"
++#include "xace.h"
+ 
+ static char GLXServerVendorName[] = "SGI";
+ 
+@@ -1379,6 +1380,13 @@ DoCreatePbuffer(ClientPtr client, int screenNum, XID fbconfigId,
+     if (!pPixmap)
+         return BadAlloc;
+ 
++    err = XaceHook(XACE_RESOURCE_ACCESS, client, glxDrawableId, RT_PIXMAP,
++                   pPixmap, RT_NONE, NULL, DixCreateAccess);
++    if (err != Success) {
++        (*pGlxScreen->pScreen->DestroyPixmap) (pPixmap);
++        return err;
++    }
++
+     /* Assign the pixmap the same id as the pbuffer and add it as a
+      * resource so it and the DRI2 drawable will be reclaimed when the
+      * pbuffer is destroyed. */
diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
index a8eb397ba8..4613d34833 100644
--- a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
+++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
@@ -23,6 +23,7 @@ SRC_URI = "git://github.com/TigerVNC/tigervnc.git;branch=1.11-branch;protocol=ht
            file://0004-tigervnc-add-fPIC-option-to-COMPILE_FLAGS.patch \
            file://CVE-2023-6377.patch;patchdir=${XORG_S} \
            file://CVE-2023-6478.patch;patchdir=${XORG_S} \
+           file://CVE-2024-0408.patch;patchdir=${XORG_S} \
 "
 
 # Keep sync with xorg-server in oe-core

