Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DE55FCE09A
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 14:46:31 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.71625.1772117190475130751
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Feb 2026 06:46:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ajBdCNbI;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4398913af88so869057f8f.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Feb 2026 06:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772117189; x=1772721989; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YQOrG9cZeNgSzjZaF0sO2rv3Hq5+53oo6KZ+UhmC7nQ=;
        b=ajBdCNbIS0iWuLQM489qx3qZ+sDOX9fQrPFYvSEMu7NPfukMNMtU3yBSHZlvgtPDia
         /Q7ClaO5eK0Zyrc2nH1DuOfpruHH9Xw9nmPV8AOr0lC18S+uYvyjcaPy8fTVPtGs+whG
         zEbzDJzwraNotwlrJYRvwwWR1eq3drfB0KY4dt+1XQYFDSoDPsPv2ATVIzT11w2siy2l
         AH06hEEfDv+yTMFRrBPksgH0iy1Ddyl3pHZPwwitNNF5jKLZyz9dEm1DZr59ewvIvYCH
         YjsZxf05Wn96IAn9gbYju/OPI3ByCcgr34bil/V+3YQlkMjjuadfF8f4WLeQrfiEFxSB
         jLnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772117189; x=1772721989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YQOrG9cZeNgSzjZaF0sO2rv3Hq5+53oo6KZ+UhmC7nQ=;
        b=JE7CUiWxifZGTtpWIPPNHf9cGA0y2TIkqcJ4L0Xaaklf1ebSaxKqCM/BUZAW4aCbBz
         wf6ExudiuSQJhyD1/o+lyudaBaJVqQTZudSRzgcHovSqomZw/ght7JkcNdy1lcgZuZ8g
         zRDFadwuyBEv8mTH6AtswSWQlsQ+VfdDwJa4BXha1fGwHzvRoBLizTXPp/N4CJlbkXgR
         xR/V261Twonlcrrg0MC+t6n2ODjctQSu8SZyDobbiEhwWw5PiJEnj5zP66EgWVTOqyhx
         qfZTk3a6LRa8ifKcL8KwTyWn/HIYsKHH772uVWjqbewTF42fIDZ0mseEIjwDNFL/LpKt
         lXVA==
X-Gm-Message-State: AOJu0YxOBHmS/Mf4vXeRzSohdWlm8eoDJkBnuivmbITY5iniDets8d6v
	xpx5x4SXbUUjQdQJaPuqp6zWutmTTBIRNyINlByW5KYLp8cezFMYz5cLwEoMvg==
X-Gm-Gg: ATEYQzzo2ujdhfhrBImMv2HuzarTYo5mYMfl2s3FAxDG3VT6CGzsUwTwf4P3Gp32OCi
	NyvYloZoEbpwVwUPYdcHZ3TciKNAvQ2tR4RbrpimnFBtXIalqaZ1JelUly1yoaPcLA8RZlRJy+v
	0BnRNcXlgjYCXnVuGavy+T6qPxMmiHwQD73hZPvOk57hZTzlNpSVV/7LnWOD9sLWCPlQO87ltnY
	QFRb56GqXYF/XsrIYcacmEYmmkaUT3vJEREWSMJY+cRKjIJUguhl0BZiN37NmcedovqakjO5FXp
	OHC7MkgJWrFDKhhqCey93yIh7t/3pJsiuHe4WZk2/3hJr44eoLaoOC0atNUzYkdajIzVK/i6GgN
	vAvjTISEkvW/9LLmJNj5cak+Ce6pwAK4fVWVmX7KtDEs6xxCY/hqBRMeFQ5KgcE02Owz6KoFjoc
	yMccxfMvhlUpAJd63Uiwee
X-Received: by 2002:a05:600c:3151:b0:477:54f9:6ac2 with SMTP id 5b1f17b1804b1-483c2123ab3mr82581505e9.0.1772117188529;
        Thu, 26 Feb 2026 06:46:28 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfcbd781sm75913745e9.8.2026.02.26.06.46.26
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 06:46:28 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 4/7] fontforge: patch CVE-2025-15269
Date: Thu, 26 Feb 2026 15:46:21 +0100
Message-ID: <20260226144624.3743168-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260226144624.3743168-1-skandigraun@gmail.com>
References: <20260226144624.3743168-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Feb 2026 14:46:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124681

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-15269

Pick the patch that refers to this vulnerability ID explicitly.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../fontforge/fontforge/CVE-2025-15269.patch  | 35 +++++++++++++++++++
 .../fontforge/fontforge_20190801.bb           |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15269.patch

diff --git a/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15269.patch b/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15269.patch
new file mode 100644
index 0000000000..7fa16480ef
--- /dev/null
+++ b/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15269.patch
@@ -0,0 +1,35 @@
+From bcc5fc655ddd0401595c3f012969de95538e402f Mon Sep 17 00:00:00 2001
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
+index 132f9fa0c..940627a3b 100644
+--- a/fontforge/sfd.c
++++ b/fontforge/sfd.c
+@@ -4780,6 +4780,7 @@ static PST1 *LigaCreateFromOldStyleMultiple(PST1 *liga) {
+     while ( (pt = strrchr(liga->pst.u.lig.components,';'))!=NULL ) {
+ 	new = chunkalloc(sizeof( PST1 ));
+ 	*new = *liga;
++	new->pst.next = NULL;
+ 	new->pst.u.lig.components = copy(pt+1);
+ 	last->pst.next = (PST *) new;
+ 	last = new;
diff --git a/meta-oe/recipes-graphics/fontforge/fontforge_20190801.bb b/meta-oe/recipes-graphics/fontforge/fontforge_20190801.bb
index cfb20ab2bd..41d43114bf 100644
--- a/meta-oe/recipes-graphics/fontforge/fontforge_20190801.bb
+++ b/meta-oe/recipes-graphics/fontforge/fontforge_20190801.bb
@@ -20,6 +20,7 @@ SRC_URI = "git://github.com/${BPN}/${BPN}.git;branch=master;protocol=https \
            file://CVE-2020-25690-1.patch \
            file://CVE-2020-25690-2.patch \
            file://CVE-2024-25081-25082.patch \
+           file://CVE-2025-15269.patch \
            "
 S = "${WORKDIR}/git"
 

