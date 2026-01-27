Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40D08D25953
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 06:50:25 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4509.1769496624047070808
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Jan 2026 22:50:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lFA4QQOS;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47ee76e8656so77086395e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 22:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769496622; x=1770101422; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FCYMgcLmV18tG/OXPnfuJkKRgpGKxJBEPTA4nyPPazQ=;
        b=lFA4QQOSs++1dN7x4mQxM2OJ3yfLwGgDYcp6yWKjZKBPR7PECYRtWJ0xb7hooLPxKb
         DosukHsg1hNzT86ltBnanwVL0HmMl8cfQeHj/SCq/jkYoAm9yVW8mdijTsrUo9nrpiAt
         j7hBXt1DkUVTDYWSWgn8uMyIEkrEs2ccMB6ojfmGqyLmXYTG7qgpXsHeWb/JR6bzQ8aM
         UnYCu5fWrhUQjcaO8wr1QjY1SmcOYmAlnBdiTVmQJT2oAo2N1WC+JzJuj/pk4piVkvTg
         XgbxQfj5K+WiTqvW8sgKW/9LSrHwd2vKzKtqRZTR4qOWrEe3YPCt7HvZzXNt/fFUY7AK
         5vkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769496622; x=1770101422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FCYMgcLmV18tG/OXPnfuJkKRgpGKxJBEPTA4nyPPazQ=;
        b=TkAjkYUNIrV5W2bdPbn4i+EFfNuw5gADYFcrFJzpnibSJXP0zMTh4hRegvVIAcIGuU
         E1gGSAV3izuYiDue3lKNOP+i2RaVMyzohm6Ukal0DNwmt1KxQ++5iWfE65XzC39chZ8C
         Fk9rpIksOTOYWLQJTbOThwbgUG1cRFi6QEZRLSx+1bVU5p8snL12sSF3XlYx8Tc9yUOC
         rsY9ZkkqCDdBosXC+VcghSjyEbhqb9QxoYpEQN3nPkM93vSt2jW7vaiNJGFcJUq+HTYl
         MLlqEwCVJAt2Z+aYUkYdZE80HSeF0+VwWCGTgVjY6Xi2mI9h3+r5EFCmTNndg3tjxVbG
         Sx7Q==
X-Gm-Message-State: AOJu0YxYyhZ7kXt6Hcf71FIfNZOu6QfXuGdARa9Toyvf3vCsqEI/0rDE
	/6VSDV0X10Gts3bFKHxYGHJlT7D5F1AnFLiWE+LcfmmAOxE8c5tsFD99mk6QKA==
X-Gm-Gg: AZuq6aLegjpuaHzx4gmWPkwqFeFFCRdVcq04IZruaO1Hlqjql+edr9LVMvbwoostxc8
	YmwKg0KAPpsQX95atVsA0s1Oq9FI4j2LI1yeBh+gAVzvOuD7+gJfBwj/GJQsHq9bHxEzl0MY49u
	/4YYrMXYeh/ybAk//vV2fZpcGXuqDq7IzDryDMmFHtoMe7bu15DjqqBdo1w/mQcXLlTiJdcEux2
	SZrHz+UbhllWxx7QayfXuvjKMz0GkW26XUDxdulZYIJnlJP0bfESPxO08uLztKleI9ixZvz+GG3
	/DM+3drIA5J1KxzYxtCw0yj0b5sSjm2Wvfo5t3IVXgW3sLFzI11RFGJ+aL7uFVIS9pOrIeL8o2I
	bQtFO7D3NKrRW4opm2ahbny3du4ZFZUKFpr1E2js1JqcTkrCKuDjSCqyIT51BUI00U6a5QNbsmB
	8dk9Sf0fB90RoKmz683IU=
X-Received: by 2002:a05:6000:40cb:b0:435:a48a:123f with SMTP id ffacd0b85a97d-435dd1cd8f7mr907793f8f.42.1769496622238;
        Mon, 26 Jan 2026 22:50:22 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c24bf8sm35191925f8f.11.2026.01.26.22.50.21
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 22:50:21 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2 3/4] fontforge: patch CVE-2025-15275
Date: Tue, 27 Jan 2026 07:50:17 +0100
Message-ID: <20260127065019.1324332-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260127065019.1324332-1-skandigraun@gmail.com>
References: <20260127065019.1324332-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 06:50:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123910

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-15275

Pick the patch that mentions this vulnerability ID explicitly.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---

v2: no change
v1: https://lists.openembedded.org/g/openembedded-devel/message/123873

 .../fontforge/fontforge/CVE-2025-15275.patch  | 34 +++++++++++++++++++
 .../fontforge/fontforge_20251009.bb           |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15275.patch

diff --git a/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15275.patch b/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15275.patch
new file mode 100644
index 0000000000..d3d00fd9ac
--- /dev/null
+++ b/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15275.patch
@@ -0,0 +1,34 @@
+From 8aed4d992db246a537d07862f31dd04698c3f7e2 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Fri, 9 Jan 2026 16:58:23 +0100
+Subject: [PATCH] Fix CVE-2025-15275: Heap buffer overflow in SFD image parsing
+ (#5721)
+
+From: Ahmet Furkan Kavraz <55850855+ahmetfurkankavraz@users.noreply.github.com>
+
+Fixes: CVE-2025-15275 | ZDI-25-1189 | ZDI-CAN-28543
+
+Co-authored-by: Ahmet Furkan Kavraz <kavraz@amazon.com>
+
+CVE: CVE-2025-15275
+Upstream-Status: Backport [https://github.com/fontforge/fontforge/commit/7195402701ace7783753ef9424153eff48c9af44]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ fontforge/sfd.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/fontforge/sfd.c b/fontforge/sfd.c
+index 149941148..e19d3a30f 100644
+--- a/fontforge/sfd.c
++++ b/fontforge/sfd.c
+@@ -3585,6 +3585,10 @@ static ImageList *SFDGetImage(FILE *sfd) {
+     getint(sfd,&image_type);
+     getint(sfd,&bpl);
+     getint(sfd,&clutlen);
++    if ( clutlen < 0 || clutlen > 256 ) {
++        LogError(_("Invalid clut length %d in sfd file, must be between 0 and 256"), clutlen);
++        return NULL;
++    }
+     gethex(sfd,&trans);
+     image = GImageCreate(image_type,width,height);
+     base = image->list_len==0?image->u.image:image->u.images[0];
diff --git a/meta-oe/recipes-graphics/fontforge/fontforge_20251009.bb b/meta-oe/recipes-graphics/fontforge/fontforge_20251009.bb
index e6533079d5..4203c1ef58 100644
--- a/meta-oe/recipes-graphics/fontforge/fontforge_20251009.bb
+++ b/meta-oe/recipes-graphics/fontforge/fontforge_20251009.bb
@@ -20,6 +20,7 @@ SRC_URI = "git://github.com/${BPN}/${BPN}.git;branch=master;protocol=https;tag=$
            file://0001-cmake-Use-alternate-way-to-detect-libm.patch \
            file://CVE-2025-15279-1.patch \
            file://CVE-2025-15279-2.patch \
+           file://CVE-2025-15275.patch \
            "
 
 EXTRA_OECMAKE = "-DENABLE_DOCS=OFF"

