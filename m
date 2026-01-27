Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B29F7D2F021
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 13:01:29 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10170.1769518887016116780
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jan 2026 05:01:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=juc3owpy;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42fb5810d39so3653302f8f.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 05:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769518885; x=1770123685; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MYsU2ihroZVRnzukuO5CmsLolbe0AKTcpgf90auFZx0=;
        b=juc3owpyVAdbJSdz6ithxxpXx/EzO8ZF4rO78U4QGy4TT1AUGHiWhfR4D6rCJO7fJt
         DQeZcRKqnC9q2QyIzRgaE3mLAOI9m7lvJ56QJUMcwZHnibbutaZl2/ztDUd+OieCxqwE
         Uxnn2HkQ3OgFj3/SayKyVz0NiLykymlyhZ4jTv0/0tmeByRcYn11E6R2a0mVDFAyTzF3
         4xE4ZVeQd+hcIFw+5/Kp2pSOHvjkgJbgG1ANKrgfKpOR5ovx5NPmDeus7mv3g3IlLkyK
         nAgFirX1xqGtYNFGXXYmUXHoG00/8I5giWddNHv9pYfsrT726a9fx1TyZXY3H4+thkrz
         YSzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769518885; x=1770123685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MYsU2ihroZVRnzukuO5CmsLolbe0AKTcpgf90auFZx0=;
        b=FiqRD7Y3r9zQozNHhtOv4P1sZr1d98DzXvNzlE+yuXwsrRGWQrl/HLBIMc1Fqu6pWn
         zoNSgAjRJNXa6SaWLri3kik7L+Yw+be3oNcFZOklnyHN5jv1X/X1AhbRNafxnxySaIM8
         avZwP626Iin2iulcEKhf3hCxc2wNl/bVdrHrRZPzPfALiPjOu53WMw3wkyfbvQ2msx81
         4bf1v3KPQdADGjJkBs8ADHsopaDfVFd7/Ya9rA/L9ufi+/JBIB0t+8i9/yTvm3SiiNdr
         AVx6lA7zOLTR99403cKhWIoLyq5I43un0H9/2h1XDAcCNRE6EBGkEveQTMzLGrNIUkc7
         0Z4A==
X-Gm-Message-State: AOJu0YyFqV1AxNqP+yWTgZa1AoABbqb/K0rH/C4WPYyJoyOxK1hnOJ5y
	qG5j7+vkHnCPp4lOV5dINe4xAcMtLFletKe/icDtoqKDlCqttDqnUPQBE1k6+A==
X-Gm-Gg: AZuq6aJMi6nfyVuoZ/Z3SW24eqtLSJW9pRjY9zwQZcvOAd+x1xwAomLMxBnGTRI2q0C
	s97V7rUMYO8ui80UC9r2G3mG0hyMLNIT4qPAVXQ8jq76ROFITQQrNTnN5UELTbuDBeMZdO+LRwg
	d0Gy9IedFNQG4WS/nr63hV4qYMzn415Yo277VYSQXLSijAsXdzCWt/BfuR9TO/8O1PzPUito00V
	heL55X9z1fECJ5rmqsoFGiyJHO/TvJe9nRVRXO9jmYSYK8dMoTtntaLizEzXv6oFZYGpVd78J9+
	+LDeAX/nt3VJfETjEvZ6DR1hu1jMlHpFC0PG6TmzNbFb7ZQcvOf6CwpYMYeGL9hTJes3Nt9/lyz
	Ns+gjhaRvt17ojB4oK4RDtWwYeGwrQjPho0lKQcM3KMRTv7Tt92Jp6tPgXdDNwD/ikUorpIuFcl
	5R91mI+ONG
X-Received: by 2002:a05:6000:26c6:b0:432:5bf9:cf15 with SMTP id ffacd0b85a97d-435dd051223mr2966691f8f.5.1769518885201;
        Tue, 27 Jan 2026 05:01:25 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c24a8asm37671577f8f.12.2026.01.27.05.01.24
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 05:01:24 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][RFC PATCH 08/14] tigervnc: patch CVE-2025-26595
Date: Tue, 27 Jan 2026 14:01:08 +0100
Message-ID: <20260127130116.1902238-9-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260127130116.1902238-1-skandigraun@gmail.com>
References: <20260127130116.1902238-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 13:01:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123947

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-26595

Pick the patch that explicitly references the CVE ID in its
commit message.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../tigervnc/files/CVE-2025-26595.patch       | 67 +++++++++++++++++++
 .../tigervnc/tigervnc_1.11.0.bb               |  1 +
 2 files changed, 68 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/tigervnc/files/CVE-2025-26595.patch

diff --git a/meta-oe/recipes-graphics/tigervnc/files/CVE-2025-26595.patch b/meta-oe/recipes-graphics/tigervnc/files/CVE-2025-26595.patch
new file mode 100644
index 0000000000..b21689ff3c
--- /dev/null
+++ b/meta-oe/recipes-graphics/tigervnc/files/CVE-2025-26595.patch
@@ -0,0 +1,67 @@
+From e50f21138e458bde06469502d196780eb07fc689 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Wed, 27 Nov 2024 14:41:45 +0100
+Subject: [PATCH] xkb: Fix buffer overflow in XkbVModMaskText()
+
+From: Olivier Fourdan <ofourdan@redhat.com>
+
+The code in XkbVModMaskText() allocates a fixed sized buffer on the
+stack and copies the virtual mod name.
+
+There's actually two issues in the code that can lead to a buffer
+overflow.
+
+First, the bound check mixes pointers and integers using misplaced
+parenthesis, defeating the bound check.
+
+But even though, if the check fails, the data is still copied, so the
+stack overflow will occur regardless.
+
+Change the logic to skip the copy entirely if the bound check fails.
+
+CVE-2025-26595, ZDI-CAN-25545
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
+(cherry picked from commit 11fcda8753e994e15eb915d28cf487660ec8e722)
+
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/1830>
+(cherry picked from commit ea526ccb20d222196494b2adf9da52dab68a8997)
+
+CVE: CVE-2025-26595
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/ea526ccb20d222196494b2adf9da52dab68a8997]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ xkb/xkbtext.c | 16 ++++++++--------
+ 1 file changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/xkb/xkbtext.c b/xkb/xkbtext.c
+index d2a2567fc..002626450 100644
+--- a/xkb/xkbtext.c
++++ b/xkb/xkbtext.c
+@@ -175,14 +175,14 @@ XkbVModMaskText(XkbDescPtr xkb,
+                 len = strlen(tmp) + 1 + (str == buf ? 0 : 1);
+                 if (format == XkbCFile)
+                     len += 4;
+-                if ((str - (buf + len)) <= VMOD_BUFFER_SIZE) {
+-                    if (str != buf) {
+-                        if (format == XkbCFile)
+-                            *str++ = '|';
+-                        else
+-                            *str++ = '+';
+-                        len--;
+-                    }
++                if ((str - buf) + len > VMOD_BUFFER_SIZE)
++                    continue; /* Skip */
++                if (str != buf) {
++                    if (format == XkbCFile)
++                        *str++ = '|';
++                    else
++                        *str++ = '+';
++                    len--;
+                 }
+                 if (format == XkbCFile)
+                     sprintf(str, "%sMask", tmp);
diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
index 3e657ea6a8..1b6b965fc7 100644
--- a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
+++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
@@ -27,6 +27,7 @@ SRC_URI = "git://github.com/TigerVNC/tigervnc.git;branch=1.11-branch;protocol=ht
            file://CVE-2024-0409.patch;patchdir=${XORG_S} \
            file://CVE-2025-26594-1.patch;patchdir=${XORG_S} \
            file://CVE-2025-26594-2.patch;patchdir=${XORG_S} \
+           file://CVE-2025-26595.patch;patchdir=${XORG_S} \
 "
 
 # Keep sync with xorg-server in oe-core

