Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0E6AC5DF7D
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 10:15:10 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5592.1787048093119467832
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Aug 2026 03:14:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=KK5imeWn;
 spf=pass (domain: mvista.com, ip: 209.85.216.48, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3811f512167so6186071a91.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 03:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1787048092; x=1787652892; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=07XOPx54l7s5Zlbw7c6mFsCK4qlvfbIGfMYowZ1qxuo=;
        b=KK5imeWnNhjwCY6bcwMl4mcVvYbeAgAhhUBS18lJ0v+rgjOyWLTy3jj2r3VZZgoNpe
         F+JdiAPoJWPuQHdA778YnzssndhXKh6FEYXkaC1j7DkRazHUpiwFkootMGeC/VM2+1IO
         CN+6ODPEjF+Wah47CC75LF4jGTJu19dIoX0eQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787048092; x=1787652892;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=07XOPx54l7s5Zlbw7c6mFsCK4qlvfbIGfMYowZ1qxuo=;
        b=NYx/QMi+ZDbHV4KW2TcjM/euERDPETcmKJ5kTHm1hh9RszEf4h5DFINqel93bWx9W+
         RK1iuVFh2boVzra/GEUylWkfS5m+mIpnE6TVYYrAKjrYl4NyHnS8ODz5ety/drfTfBmr
         5i9Qmr5zqY3mpqtQTLnW7qK9uiNlumoibelqD3zj8hdsUQYfdz4Q3J7nhPuWQJ/vB65u
         /AqvnoAU2scQuIsdvOcOwLGXvWvTKGUBTLtd6UvhqNvV1h/KPFubFfJtFm14KwIceFJl
         HwpPEB0daw72s+TeOjPzG+6sOAXy/tnbFNy6OBtJ3zRmYMX0gHWLQEznN+2FOZxkmAgQ
         m53Q==
X-Gm-Message-State: AOJu0Ywq5dgK/dV6M+NuEvmvzTtptMfuyyesrh60BmfRVux7pLcA6vvs
	Ms7jI2rWceyKyS5hNsxmpg/5PXki/RAzK3ZqmsUvwlT1s9zTyL0F6SSnQley9mz6GspdL/FWeug
	OFmh1AEM=
X-Gm-Gg: AR+sD10d3eCMFKJew78Shcx9lYQ4ze/aG15nnOdv9WaA/cXoPPSJSD3whUu6PlJy+Si
	pmdUYJZvFyqMBvLUaWyiltpratp8tGEiamjhciu7564jx1a+DH2emlGsfuR4OLbbER84nkJe/0M
	ksHU/Fm2SDhBcB4oA+vGmy7OpP2yxQ9zMCAaIPz7IGgdUCPV3R9XKn2HL19xpUE5oP1rtB+mA28
	NpCZz/uNt+arCaYxzWGKgQtPpUvSKy1tYrRCY2N+0zX+Ia0Ma79ReiWXISTxmr4ad2x7QpJIsML
	XVka/IqrOc53x7HaTv13ukaZp76HT/9ef+UFBRmo0guZW7KkJyppOkz8oetumEh4fUAdz2bXkTl
	JXoAmLTm457QBES/zTI4LkuS/lgEhk+0Iwtzapia5uKg244p/O7dyaptgtsHvY7uZRCR3jFNxgd
	Ck/nypQgXh2v2XxL7uvbRrdl8AxGDcFugAgF/k6omslAGTGERHu13MR1kT5ATLevtQ6M0glTFqo
	enb
X-Received: by 2002:a17:90b:4fc2:b0:38e:2524:724f with SMTP id 98e67ed59e1d1-3955a7b4d0emr8961785a91.12.1787048092476;
        Tue, 18 Aug 2026 03:14:52 -0700 (PDT)
Received: from MVIN00352.mvista.com ([2401:4900:1f29:777d:ea96:6c89:c935:111e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-326793c43b7sm15369074eec.7.2026.08.18.03.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 03:14:51 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-oe][wrynose][patch] giflib: Fix CVE-2026-26740
Date: Tue, 18 Aug 2026 15:44:41 +0530
Message-ID: <20260818101442.1354019-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 10:15:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129231

Pick patch according to [2]

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-26740
[2] https://ubuntu.com/security/CVE-2026-26740

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../giflib/giflib/CVE-2026-26740.patch        | 40 +++++++++++++++++++
 .../recipes-devtools/giflib/giflib_6.1.2.bb   |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/giflib/giflib/CVE-2026-26740.patch

diff --git a/meta-oe/recipes-devtools/giflib/giflib/CVE-2026-26740.patch b/meta-oe/recipes-devtools/giflib/giflib/CVE-2026-26740.patch
new file mode 100644
index 0000000000..14ae97d23f
--- /dev/null
+++ b/meta-oe/recipes-devtools/giflib/giflib/CVE-2026-26740.patch
@@ -0,0 +1,40 @@
+From 061605081115bbfd7019bafc119a13b6f17fcf25 Mon Sep 17 00:00:00 2001
+From: Anthony Hurtado <amhurtado@protonmail.com>
+Date: Mon, 1 Jun 2026 15:40:48 -0500
+Subject: [PATCH] Fix CVE-2026-26740: heap OOB write in EGifGCBToSavedExtension
+
+EGifGCBToSavedExtension calls EGifGCBToExtension which unconditionally
+writes 4 bytes into ep->Bytes without checking ep->ByteCount. If the
+extension block was allocated with fewer than 4 bytes, this results in
+a heap buffer overflow.
+
+The read-side counterpart DGifExtensionToGCB already validates that
+GifExtensionLength == 4 before reading. Add the symmetric check on
+the write side: return GIF_ERROR when ep->ByteCount < 4.
+
+Signed-off-by: Anthony Hurtado <amhurtado@pm.me>
+
+Upstream-Status: Backport [https://sourceforge.net/p/giflib/code/ci/061605081115bbfd7019bafc119a13b6f17fcf25]
+CVE: CVE-2026-26740
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ egif_lib.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/egif_lib.c b/egif_lib.c
+index f1141a2..d74e8df 100644
+--- a/egif_lib.c
++++ b/egif_lib.c
+@@ -690,6 +690,9 @@ int EGifGCBToSavedExtension(const GraphicsControlBlock *GCB,
+ 		ExtensionBlock *ep =
+ 		    &GifFile->SavedImages[ImageIndex].ExtensionBlocks[i];
+ 		if (ep->Function == GRAPHICS_EXT_FUNC_CODE) {
++			if (ep->ByteCount < 4) {
++				return GIF_ERROR;
++			}
+ 			EGifGCBToExtension(GCB, ep->Bytes);
+ 			return GIF_OK;
+ 		}
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-devtools/giflib/giflib_6.1.2.bb b/meta-oe/recipes-devtools/giflib/giflib_6.1.2.bb
index 9cb2a51879..11f375ef27 100644
--- a/meta-oe/recipes-devtools/giflib/giflib_6.1.2.bb
+++ b/meta-oe/recipes-devtools/giflib/giflib_6.1.2.bb
@@ -9,6 +9,7 @@ DEPENDS = "xmlto-native"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/giflib/${BP}.tar.gz \
            https://sourceforge.net/p/giflib/code/ci/d54b45b0240d455bbaedee4be5203d2703e59967/tree/doc/giflib-logo.gif?format=raw;subdir=${BP}/doc;name=logo;downloadfilename=giflib-logo.gif \
+           file://CVE-2026-26740.patch \
 "
 
 SRC_URI[logo.sha256sum] = "1a54383986adad1521d00e003b4c482c27e8bc60690be944a1f3319c75abc2c9"
-- 
2.43.0


