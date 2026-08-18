Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A7DFC5DF70
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 09:20:00 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4726.1787044794399379818
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Aug 2026 02:19:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=KhLQmt+U;
 spf=pass (domain: mvista.com, ip: 209.85.216.48, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38e347638adso5361456a91.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 02:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1787044794; x=1787649594; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/y1xZx8YV2Sr815t2hkINywfrh/I7i5O9zjltAG/HxQ=;
        b=KhLQmt+UBV1jaNEwLOVPvnjo6jZwMFL42DNLcYEkeoaKVP4OhoBmOux0jepHvGeieq
         GRMS+2Vj3uHnkQ6WanblMUJbt5UZd3pzlqetRTe93lgEoDr38zXir4RACQZg38l/8qxE
         MXe65/tDsId02z6FxYKjX6pCto4Swyj3fMRmA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787044794; x=1787649594;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/y1xZx8YV2Sr815t2hkINywfrh/I7i5O9zjltAG/HxQ=;
        b=EAi4a4ZBi5Q+QrqHYdXRaPFswdtS7NfjfxOvry9EDceO10mKIhZUoqyoqDA0IOT4yr
         fVJD4ovY1598IRH7Uj57x/yQ8ONQTSkC+QqLjJLulgshhXc1iF69HWKGR8lSoa9VNysU
         aJBm0/4raz7TaCgLOF3QFnDQY4GQbtOI4PsgoVltVtZVqriYGvuNJ0r2fNvmlLdKVxQm
         nzXw4j7LXmJPpmy+zFVsK6WFTsmz9ccKJEbsBZvJ11JXJdME7NXj4LyC7bsycychlAem
         aTIncOt6F6hAgKZoJ1gYpc4DR9yhwjt3gH0xWInvzrm/vzMNg38eYIFHUSku1NxRfqu6
         py0A==
X-Gm-Message-State: AOJu0YxZkY74ndG69Sv+ZGxS3uKFscbi4S2jfx/lU2ye5aPvCJle3Hwz
	3v3adB8ZXPHlnE0WHvYGG6tmOLtRfFnccaGcsuIPGgHjS3Dr3Si5HMY8fheDR6h08D1OsFdaenZ
	9AHNBmrI=
X-Gm-Gg: AR+sD13pnj+p+wqZ9zigI+is7BUMcWo/ouA/wNwuplxLJwZoK1SEqGhDUgvilKSufcr
	Pf70t7Ks7nMSs6HX0qwl4Ww08RkCtUzG7mhcMD77YD+/yGmt3ZO1SQnC0wPz433tiIP8axBHyme
	lbH+FQkW3D2aq5UAXnTZMciuJWPjPVg/EB+H8GwIUHnvIJ6Rdt67wT6CUDGkWPyxV1C3y+wL8El
	TxjcKOZIW4u3YfP/DnA2DZH+RTL9o9GAqNLKNDrF9L64K6CbzEZ5S0jUXqQLkjF44XwTNvQvbyr
	83QCnnFBNSCrmnZNTDhXBZ9LDnZQfeuXuzqrj5JXsEk8N2p+yJUuKRPQdrSvbYcpJJ4AC9zR1Pm
	ThmF9wpwpyjDmvIxAzUiBy89bzT3JraqyORpFDBP9RAx50EmhBu4DtZIpO94xB3sjkqoWiRqB8+
	JGvOEF2Mxev1qekISOsON2ZDdjdJq/oGi7Obgfyu9RtACoE4RGDT8kYi/j30LtJFaUEesEmhSMI
	mycVsf+JF4cGXA=
X-Received: by 2002:a17:90b:4d08:b0:37f:c22a:c188 with SMTP id 98e67ed59e1d1-3933b6f0622mr32621547a91.4.1787044793660;
        Tue, 18 Aug 2026 02:19:53 -0700 (PDT)
Received: from MVIN00352.mvista.com ([2401:4900:1f29:777d:ea96:6c89:c935:111e])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14152ea340csm14079367c88.0.2026.08.18.02.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 02:19:52 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-oe][master][patch] giflib: Fix CVE-2026-26740
Date: Tue, 18 Aug 2026 14:49:43 +0530
Message-ID: <20260818091943.1172667-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 09:20:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129230

Pick patch according to [2]

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-26740
[2] https://ubuntu.com/security/CVE-2026-26740

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../giflib/giflib/CVE-2026-26740.patch        | 40 +++++++++++++++++++
 .../recipes-devtools/giflib/giflib_6.1.3.bb   |  1 +
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
diff --git a/meta-oe/recipes-devtools/giflib/giflib_6.1.3.bb b/meta-oe/recipes-devtools/giflib/giflib_6.1.3.bb
index 6add9d01ad..69dd46963c 100644
--- a/meta-oe/recipes-devtools/giflib/giflib_6.1.3.bb
+++ b/meta-oe/recipes-devtools/giflib/giflib_6.1.3.bb
@@ -9,6 +9,7 @@ DEPENDS = "xmlto-native"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/giflib/${BP}.tar.gz \
            https://sourceforge.net/p/giflib/code/ci/d54b45b0240d455bbaedee4be5203d2703e59967/tree/doc/giflib-logo.gif?format=raw;subdir=${BP}/doc;name=logo;downloadfilename=giflib-logo.gif \
+           file://CVE-2026-26740.patch \
 "
 
 SRC_URI[logo.sha256sum] = "1a54383986adad1521d00e003b4c482c27e8bc60690be944a1f3319c75abc2c9"
-- 
2.43.0


