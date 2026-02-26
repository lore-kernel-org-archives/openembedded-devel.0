Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4540DFC5902
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 14:46:41 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.71421.1772117191595997169
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Feb 2026 06:46:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M5M+G/2I;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48374014a77so10645745e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Feb 2026 06:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772117190; x=1772721990; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lqJlEs0BfchtHbU6S7xflQebLi81bgznNId7TASFtNc=;
        b=M5M+G/2Ia6c82lJ1dPv23IxPJ4vQ6lZ4I4ChSqtnVjsOX2oJ9gej6Xj0gvKeFVMdVr
         dG85nxgNnzYXqSP5acCociFA7xdBqIk3VDRatcxc8JHh9brG+HkkIFzi4hOveU/ekqtJ
         rghrfMuMXyKB1eXQIP7+80iBVs7U/svju0N4Y9CX3UwUH7SoL3sg24dobM9cuiAfnTCR
         H1LZDEUBztHUwXOnVdsa7UxijVYAXFL8SA5BFQdEpFzAgLvmEjKMWLTjm8hxeaNve4cr
         wzjZh3XbM8pnW/7SS4JBXidTzFLggdPIoWqJvnbKnkHTyNKDeu+OJEAoC+qpNvIklxIY
         CGcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772117190; x=1772721990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lqJlEs0BfchtHbU6S7xflQebLi81bgznNId7TASFtNc=;
        b=QELSSYXQlzH69QEjGGr6FK3iirmcqfCxgV5roFi7UZcllYc80/Pvrqw/qee/w2oPl1
         9/rwu0Ek77ApNU2+Z7K5wSB39ynXu2Q5A9kduhb/6IOYK12Wxcwvdz/MeGS9/x3SweO5
         3yGaEonl/UM/3IcBylDdOhtH072hkPHgGaMCVZHmSjqbAxmlt/bFAmsK7BodL4ivT05y
         nBR7tpA7QAo42pIoj5HFWunhKdahJEmQJApCTxNWmZDZDnr+TjRD8AmXAqi3msH583l1
         EcNvVdkMVnYHOCIOhfuMaIYgu3Jw+S3vOqE5Ba53uQTqi4TEQGd0kKPaGfBcKEwjp1Q3
         qhJA==
X-Gm-Message-State: AOJu0YyUjaV6UwdvQ4KbRdOMb7wRXgB7wQdfW5o642XkQFbnw92J/NTI
	WkXXIioyyslu57+DF7tia4XEW1iOD+NkjW4GUe+Xr7xEw3RV3GXB4xIIOklgfw==
X-Gm-Gg: ATEYQzzdHCW82tIGOMBOmkP4U3mFWRbKMnX013xFVmpHuvAM0JdKFsg5KfCLvcqlZrE
	ukfnp+ATHEzNH/raXBCfj0fU12QKt8JTqVCj8f3Em3FXs/wxQiIOpt1GxD0p8AUtkZeGwi1GFUY
	E4f7PRhV57oAsdRpgOS9OOInnQVi0HBAn1wN4DFT9VjZNu4hmf3OJ9oGhtEpDqwIJZaSATIQomu
	OemHMzZ5q8Fyd2Idow7Y6/p6LbCvH/HGQ5dX+au+azd38AeQNpm2ZUzA0eWI7fMMO2IDdTVPry7
	S9ECK7rqf6kmcUdYk9zfGF7RjSkVUUytXM8i8VXwoZ1SVdJ2UsB0rRfcovtpk+J3CUM6qm0/VCO
	T8yMzGIXLhrbz17Knyl/2x3rZYiV/mgPdjB6eYBHuLodnxcGHZdPAv7m91kyFthUsmBnM7WbVkl
	r+EIB8rJH5NA+3htOyE3/H1c/H5zN3WZk=
X-Received: by 2002:a05:600c:3e05:b0:483:6fc6:1e20 with SMTP id 5b1f17b1804b1-483a95b5410mr331977685e9.9.1772117189801;
        Thu, 26 Feb 2026 06:46:29 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfcbd781sm75913745e9.8.2026.02.26.06.46.29
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 06:46:29 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 6/7] fontforge: patch CVE-2025-15275
Date: Thu, 26 Feb 2026 15:46:23 +0100
Message-ID: <20260226144624.3743168-6-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260226144624.3743168-1-skandigraun@gmail.com>
References: <20260226144624.3743168-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Feb 2026 14:46:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124683

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-15275

Pick the patch that mentions this vulnerability ID explicitly.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../fontforge/fontforge/CVE-2025-15275.patch  | 33 +++++++++++++++++++
 .../fontforge/fontforge_20190801.bb           |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15275.patch

diff --git a/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15275.patch b/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15275.patch
new file mode 100644
index 0000000000..23a99338d9
--- /dev/null
+++ b/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15275.patch
@@ -0,0 +1,33 @@
+From dcaa8397934419e3f1fffd8a4bdd68de87484d9d Mon Sep 17 00:00:00 2001
+From: Ahmet Furkan Kavraz
+ <55850855+ahmetfurkankavraz@users.noreply.github.com>
+Date: Fri, 9 Jan 2026 16:58:23 +0100
+Subject: [PATCH] Fix CVE-2025-15275: Heap buffer overflow in SFD image parsing
+ (#5721)
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
+index 99d92b051..25a81c0b4 100644
+--- a/fontforge/sfd.c
++++ b/fontforge/sfd.c
+@@ -3714,6 +3714,10 @@ static ImageList *SFDGetImage(FILE *sfd) {
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
diff --git a/meta-oe/recipes-graphics/fontforge/fontforge_20190801.bb b/meta-oe/recipes-graphics/fontforge/fontforge_20190801.bb
index 39f434bfd4..b41a7dd8de 100644
--- a/meta-oe/recipes-graphics/fontforge/fontforge_20190801.bb
+++ b/meta-oe/recipes-graphics/fontforge/fontforge_20190801.bb
@@ -22,6 +22,7 @@ SRC_URI = "git://github.com/${BPN}/${BPN}.git;branch=master;protocol=https \
            file://CVE-2024-25081-25082.patch \
            file://CVE-2025-15269.patch \
            file://CVE-2025-15270.patch \
+           file://CVE-2025-15275.patch \
            "
 S = "${WORKDIR}/git"
 

