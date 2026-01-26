Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CC6CCF65DB
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 11:45:16 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18226.1769427912054771350
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Jan 2026 03:45:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JMj+P42O;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47edd6111b4so50825405e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 03:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769427910; x=1770032710; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XzGck9vF3mDL2D0YprJ4U3baehvpanokD+atfDfKLH4=;
        b=JMj+P42ORDlnDYIynQO96L2AbLTYd4fWf+E23kFoAAwMdyGgBZl6EGACDngtYPe7Md
         q+z8WzgkvWJen0Fkq0FNOZnOe9G21pg/tbuvEL4Rj2Nt2YFPmrbiMnt3B42UETtn2iVn
         Gyr339p/LFzKbC2BQIktcAXMe6wW7XyCJcLgLewioze0PXoRoV/b54cqpXTmx1q/bijS
         wYLiE6ZzHZ8EQ6Zs7NKhvY6I2Ejs8wO4QqJdeeS5PSDQJIfIdWbdbZv+s+76AN3jjM6b
         3PlGTIvpcrmaEXgcN/QJ5IOpf8xp7m+VzC2aGBbNknAkD8MJhXtJzI1yRABcz/B565R7
         upFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769427910; x=1770032710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XzGck9vF3mDL2D0YprJ4U3baehvpanokD+atfDfKLH4=;
        b=vtC0MQnwyBAVdi71+RzSpRrZh9XaocUHSa42sx2NiBl5rPTZaHkAfORu0mSn5XcTVR
         uLNViunE2EFBVUWJRBzpeNXLFE4d3mbFPQO4Evd0r7CQVsUq91WyWXIsMR2/FCneOF8h
         5uqJzT4majKs048LVHQdQFfheU+AttSnV86dYzx+6K+yUhmxsp3rCjIrcH9xRk6SrRCV
         cNhiMC9/l5GcWuwHlkoD8oKAUgnKooTzgId7/EZ2DRnTAzVcK2ti3FOxEpOGAHa/N+qo
         7grkFFrtfSvov79lnTT9GL0yjwndSy4Mr3G0jWDAe/4sbVKgISZUOaCCTFJAxJKQ8KyH
         AQ6w==
X-Gm-Message-State: AOJu0YyzeKhwp2UCKmG9hHicH9vqhQJxCvn3yZrqlIrgxzSYI751Uadu
	O346S4fxzVwn/cLCbWw41vWpRCOcK2YDiQ70aX0pcvZH4xrZ7MlbC9Jnpn5ndw==
X-Gm-Gg: AZuq6aKYSgUVy8hVo3/ZebMXkpj5vg7dV1+9nKn1BA+QydaC1VwThYh0g3p9XC5K8Ks
	oN77/4phiJI1ZmPEKLQV2CtxB0ZcMM1K9nx710OqksIRjdK4Q+aXw/UvWH44S0xv65K2qWP10eU
	Z6lGeuK6jxeGtU5WPMm68GdPmOwjpGjyITzJbXDqAJ2GeHUjlxqpr6imaeLxD1BDFzkA87YEBq1
	ORSKFyyaduEoxNQV4XIzPUgemY6IbaizSBdyYQLRe4MBQ19qeC7CXqxwQH7EjUBoP8WHKGtKSH0
	0P7i37WP/NEbqcG5Nfdz+qlaHImDWE/5eovzI7BC3AjJPSS3M1515sr1HH9yYgO3PXcXMFuza2/
	SRJF0bohSUQNV4SGoUt/FL5kAElbSAqJquOyPwntx/DtxFqBKhyc4T2Z5vh6E42+qVfmK/4cKax
	GATgTsWUZW
X-Received: by 2002:a05:600c:64c4:b0:47d:3690:7490 with SMTP id 5b1f17b1804b1-4805ce3fad6mr71533225e9.9.1769427910291;
        Mon, 26 Jan 2026 03:45:10 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804dbd4630sm98454055e9.17.2026.01.26.03.45.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 03:45:09 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 4/4] fontforge: patch CVE-2025-15269
Date: Mon, 26 Jan 2026 12:45:05 +0100
Message-ID: <20260126114506.3846753-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260126114506.3846753-1-skandigraun@gmail.com>
References: <20260126114506.3846753-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 11:45:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123872

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-15269

Pick the patch that refers to this vulnerability ID explicitly.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../fontforge/fontforge/CVE-2025-15269.patch  | 36 +++++++++++++++++++
 .../fontforge/fontforge_20251009.bb           |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15269.patch

diff --git a/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15269.patch b/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15269.patch
new file mode 100644
index 0000000000..a3e26d407a
--- /dev/null
+++ b/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15269.patch
@@ -0,0 +1,36 @@
+From 6a23476bc5eea880f3f24496710a6133c92a198b Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Sat, 10 Jan 2026 20:06:53 +0100
+Subject: [PATCH] Fix CVE-2025-15269: Use-after-free in SFD ligature parsing
+ (#5722)
+
+From: Ahmet Furkan Kavraz <55850855+ahmetfurkankavraz@users.noreply.github.com>
+
+Prevent circular linked list in LigaCreateFromOldStyleMultiple by clearing
+the next pointer after shallow copy. The shallow copy propagates liga's
+modified next pointer from previous iterations, creating a cycle that
+causes double-free when the list is traversed and freed.
+
+Fixes: CVE-2025-15269 | ZDI-25-1195 | ZDI-CAN-28564
+
+Co-authored-by: Ahmet Furkan Kavraz <kavraz@amazon.com>
+
+CVE: CVE-2025-15269
+Upstream-Status: Backport [https://github.com/fontforge/fontforge/commit/6aea6db5da332d8ac94e3501bb83c1b21f52074d]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ fontforge/sfd.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/fontforge/sfd.c b/fontforge/sfd.c
+index e19d3a30f..be4220515 100644
+--- a/fontforge/sfd.c
++++ b/fontforge/sfd.c
+@@ -4647,6 +4647,7 @@ static PST1 *LigaCreateFromOldStyleMultiple(PST1 *liga) {
+     while ( (pt = strrchr(liga->pst.u.lig.components,';'))!=NULL ) {
+ 	new = chunkalloc(sizeof( PST1 ));
+ 	*new = *liga;
++	new->pst.next = NULL;
+ 	new->pst.u.lig.components = copy(pt+1);
+ 	last->pst.next = (PST *) new;
+ 	last = new;
diff --git a/meta-oe/recipes-graphics/fontforge/fontforge_20251009.bb b/meta-oe/recipes-graphics/fontforge/fontforge_20251009.bb
index fc3d001dbf..eb40b8a4f6 100644
--- a/meta-oe/recipes-graphics/fontforge/fontforge_20251009.bb
+++ b/meta-oe/recipes-graphics/fontforge/fontforge_20251009.bb
@@ -20,6 +20,7 @@ SRC_URI = "git://github.com/${BPN}/${BPN}.git;branch=master;protocol=https;tag=$
            file://CVE-2025-15279-1.patch \
            file://CVE-2025-15279-2.patch \
            file://CVE-2025-15275.patch \
+           file://CVE-2025-15269.patch \
            "
 
 EXTRA_OECMAKE = "-DENABLE_DOCS=OFF"

