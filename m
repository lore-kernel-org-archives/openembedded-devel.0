Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2A5BEB28EC
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 08:21:00 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7170.1770366052169582626
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Feb 2026 00:20:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fGJZLAwL;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4362aadaf09so335314f8f.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 06 Feb 2026 00:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770366050; x=1770970850; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7BPXMlMMJsOdEXfyUStoDZNItN5HeZaymX2C8uwH0BQ=;
        b=fGJZLAwLAIkljkstNJ3LA4HnlkuAlNd86nqTER8Mt8J1s/AbXT9pOCGFS3bjWnHE+p
         mxPjzwXuiRxv08F8KKSJ9BsAjBIjOA0FfXeFqfnR8DYrVA5d/+cSHqA7Je0uYK/bDuEw
         AYAZUgc1cDoICkgMVXyhlkNWY+0Rqig014oSLqZH4/wuOEsvYLVfGtMKwcnGt79Ra2Kc
         EMklGBvfKEpkfQ/Q7CQrz6yWuqjAo57VBDN0jEd0iUDcr7vgxkZZFUPUvVBQ7F99GmVu
         MlUrh+7h8R2h8UajaNGE6j4bYIpDVm1Mb3eMf2gmazj1oFqDS5ifdukqmX45TXbSvqEY
         8XBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770366050; x=1770970850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7BPXMlMMJsOdEXfyUStoDZNItN5HeZaymX2C8uwH0BQ=;
        b=Ikck0++rP4arOAWXcdECpSyUreRo2Saqamq3qoSfi3ClKlt+L7oKVwyLSnbutS9kQq
         l2Y7BcxnwUXU2i1RGoVK5E1x7zjPzBIzgf2SndGSLu0BEBLI12HwGW7KsvpZhORY2sOD
         5q8GVVmLXZ269lKqMkPhXmhs3W0W9BQqBPrd1MXhLlQoku1LMEFpmpM3p9FZ1ssHP73j
         ZXi+moKMo6xgybol1zAIdLc+5WNDbgv/I5XdUAb9tM9MHjuaiQHXtyE3wsipJG6SP1Co
         /DXrIh/brB4O6i9+NRBi3Q0ua8TMXrS3orYPan1jLOez7Cs80O2CAFhDfYu1oc9VqljJ
         0kLw==
X-Gm-Message-State: AOJu0YzkgbxoHun1rBRSto2qjLTJsvScHe3VmV8SyOUC499A+4NhjES+
	RB23eH7Fji87h755UScQFpJX1pc+VAsUNU3q9YMq8/tun2IRMen5rAaEeKvQaA==
X-Gm-Gg: AZuq6aLvEmciM/KpyYz4tGCORPTeG7mkRMnA2YRjpUO+9xr223c63/y8kZCYi4Vj3A0
	tEELw/uY4Dp872mSdFKteAVPhRXB/83hOEL4uIQRI/9fZGcNyX0Gu6aJdkjr8eZAlQbyCBoUIv9
	ubDElCGiZVfcptSrbyXQu4UYJzPaUNq50I6acEZHjQM2Mqd/9PjDsFLNg8xgumpyni5QaS5ACuP
	Q5XzKcHEy7kK6F/SMuyZmRzJwQEeN8wo11gErSc7ZMMEw2tFdlgaTAqjpTBGB/fRWTRbVetzoIZ
	Lil14ht4IC0s/G1HwFVYeGpn3HFI0/joR0gKCd4NFdSKCFBKKqbZxsQZHOyl8fNHQG0APWvq31a
	GfnLNaCvMQ/vC+UEL/21IXXneGmjMCiZJSrzbW0znB/RJbviDYNqMmc7iNLY+zGaY+MdoZM5kWE
	W4WqE2Q0quWSeC2nCvws8=
X-Received: by 2002:a05:6000:4022:b0:430:f68f:ee7d with SMTP id ffacd0b85a97d-4362938c301mr3238294f8f.47.1770366050418;
        Fri, 06 Feb 2026 00:20:50 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4362975ac28sm4332200f8f.42.2026.02.06.00.20.49
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 00:20:50 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 3/8] fontforge: patch CVE-2025-15269
Date: Fri,  6 Feb 2026 09:20:43 +0100
Message-ID: <20260206082048.1442403-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260206082048.1442403-1-skandigraun@gmail.com>
References: <20260206082048.1442403-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Feb 2026 08:21:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124232

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-15269

Pick the patch that refers to this vulnerability ID explicitly.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit 449999f6767668df4378105b4c79c4a5db5125c3)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../fontforge/fontforge/CVE-2025-15269.patch  | 35 +++++++++++++++++++
 .../fontforge/fontforge_20230101.bb           |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15269.patch

diff --git a/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15269.patch b/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15269.patch
new file mode 100644
index 0000000000..af04085016
--- /dev/null
+++ b/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15269.patch
@@ -0,0 +1,35 @@
+From 904971c570f0697a9052c6fa699f1a2c9b2669a2 Mon Sep 17 00:00:00 2001
+From: Ahmet Furkan Kavraz
+ <55850855+ahmetfurkankavraz@users.noreply.github.com>
+Date: Sat, 10 Jan 2026 20:06:53 +0100
+Subject: [PATCH] Fix CVE-2025-15269: Use-after-free in SFD ligature parsing
+ (#5722)
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
+index 4db9feebb..894176254 100644
+--- a/fontforge/sfd.c
++++ b/fontforge/sfd.c
+@@ -4786,6 +4786,7 @@ static PST1 *LigaCreateFromOldStyleMultiple(PST1 *liga) {
+     while ( (pt = strrchr(liga->pst.u.lig.components,';'))!=NULL ) {
+ 	new = chunkalloc(sizeof( PST1 ));
+ 	*new = *liga;
++	new->pst.next = NULL;
+ 	new->pst.u.lig.components = copy(pt+1);
+ 	last->pst.next = (PST *) new;
+ 	last = new;
diff --git a/meta-oe/recipes-graphics/fontforge/fontforge_20230101.bb b/meta-oe/recipes-graphics/fontforge/fontforge_20230101.bb
index 70667e7f65..b1e5ba0b63 100644
--- a/meta-oe/recipes-graphics/fontforge/fontforge_20230101.bb
+++ b/meta-oe/recipes-graphics/fontforge/fontforge_20230101.bb
@@ -24,6 +24,7 @@ SRC_URI = "git://github.com/${BPN}/${BPN}.git;branch=master;protocol=https \
            file://CVE-2025-15279-1.patch \
            file://CVE-2025-15279-2.patch \
            file://CVE-2025-15275.patch \
+           file://CVE-2025-15269.patch \
            "
 
 S = "${WORKDIR}/git"

