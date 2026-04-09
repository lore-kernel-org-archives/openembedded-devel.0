Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39451E9DE5A
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 07:10:23 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.127055.1775718615192663666
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 00:10:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Ul764VqQ;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-827270d50d4so593942b3a.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 00:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775718614; x=1776323414; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=whGxB6MrxGPygqsQ4rAxxO+QCRbTvMtNupKhrxJrPyY=;
        b=Ul764VqQRw3dy8MQeIri3cg1uUHe0IUyklMP/yaOpW2ZuAvFoPBzm88Q/bVGSYGrFg
         ZhBRvWaMJvm5QZcUBcHIxLsFaAWU7x26nEmyoECLGT8uGyZHPZKHM+/FNfR0MSyYBaC8
         egA0j5QSmFhYbbzR95oAe7kuLX/VxR4na86MeE1F4SEA/Xw9oEn0AumHkeMf5OpN+cYJ
         IJkaTrzLN0XGEH0oxOJTYjukPoE8UF2/SAob/IfXtoomMP9GskcmM5lpT3r6OFhMP8WT
         KSpUbe+9WTQGfm9XgmascSP8AalKl9Wfn82KutYHjjxyvfFThBRkTAlZd8zKLrSFsHGz
         px1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775718614; x=1776323414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=whGxB6MrxGPygqsQ4rAxxO+QCRbTvMtNupKhrxJrPyY=;
        b=o88aH3L1PN0PE+edwSNCsTw7uGANI9IEtj1qC+TMxMreWXi/Od2nCLXIulzZRq+ipA
         h49fmOAeYJBRgi6GuZaU9d0qyeshRPSc09cWKY7JD0wyCd+LizuY6pde3V7xbEyntMeU
         ogKkEkFmtaXbWLWI370O3o2hJJXTPLtIi88LfP5QzDBOy0vZO/NG/GjgWhmq+91tfnhM
         boDYazczatDxOaIG/xmHxOXtMRUyQ+UbckBPMtD9RSCoW8bqIWaiUJZBYt9MBWZtV0nK
         7ldfEEdqJ4kombffH0/UexRNkLjwLMgDxnQv3Qi7qvAgA0HQe6cLa+Au6ruLK79xnWvk
         jx2w==
X-Gm-Message-State: AOJu0YxFNOm/UsGJ56I5OScDVyze7JDYwJmJpaoe2Gij3bERbT5JkJq5
	/zuHlR7NgNBRrxlep0NEVnIgdXiMcgWWzJX2HXqGIduYAQfSL3E03upkuPJxTQ==
X-Gm-Gg: AeBDiet2QDH2oqHF1u52A1Jlk96ITH1TDOkkvgKyhGpQ2m+S4X6uvuveCveXYC1zaiV
	OtFQn057tfe+LDgADmgxwQmd1y8R1Mi5J9RJKRxLQusqD+8to526qBb9wUfQyuZTwixXKIt/+Mm
	IJwYm1+16i7nYpKrvk5Ygok6Ig2XG5sQNpLm+lVhYLIGNKUt6hrFvGxqSSkDiRHlcXsjM4qCrTI
	0l4S0YttDJYLU2Zy9o/bz9On/+DoHEuXCvlaYG5vGMA5VtQOBwS7FOGDVkhqfWFXP0bsqOa9S7b
	aO7daia7z4WR4fbbYsDXl87iHWmb3qShWzX7zjGwWcbVJXGs/ykdr2jJEFY8IKTSBLb3qtddIGV
	eeSUlKtnx4XeUj740fCQIjkM36dhdi9SC2XyUiI0Xqz277/wQYfqIjpdF9YBVKn05kFkiwCIf1X
	ui9FQ23zXYDp/sobKVYid6eZykuB+7BPf3LeY=
X-Received: by 2002:a05:6a00:800a:b0:82a:6d9d:3f85 with SMTP id d2e1a72fcca58-82d0dbbca07mr24799350b3a.48.1775718614371;
        Thu, 09 Apr 2026 00:10:14 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.51])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b21c92sm24764936b3a.11.2026.04.09.00.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 00:10:14 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 19/22] freerdp3: fix CVE-2026-33984
Date: Thu,  9 Apr 2026 19:09:16 +1200
Message-ID: <20260409070919.3968586-19-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409070919.3968586-1-ankur.tyagi85@gmail.com>
References: <20260409070919.3968586-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 07:10:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126141

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Detaisl: https://nvd.nist.gov/vuln/detail/CVE-2026-33984

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../freerdp/freerdp3/CVE-2026-33984.patch     | 34 +++++++++++++++++++
 .../recipes-support/freerdp/freerdp3_3.4.0.bb |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-33984.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-33984.patch b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-33984.patch
new file mode 100644
index 0000000000..0aa5aeba63
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-33984.patch
@@ -0,0 +1,34 @@
+From d714759fc45ccf9ff179b912dd1714d0b4f2c5bc Mon Sep 17 00:00:00 2001
+From: Armin Novak <armin.novak@thincast.com>
+Date: Wed, 25 Mar 2026 09:48:54 +0100
+Subject: [PATCH] [codec,clear] update CLEAR_VBAR_ENTRY::size after alloc
+
+(cherry picked from commit dc7fdb165095139be779a4000199bc1706b06ad5)
+
+CVE: CVE-2026-33984
+Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/dc7fdb165095139be779a4000199bc1706b06ad5]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ libfreerdp/codec/clear.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libfreerdp/codec/clear.c b/libfreerdp/codec/clear.c
+index 512aeae20..d94536986 100644
+--- a/libfreerdp/codec/clear.c
++++ b/libfreerdp/codec/clear.c
+@@ -553,7 +553,6 @@ static BOOL resize_vbar_entry(CLEAR_CONTEXT* clear, CLEAR_VBAR_ENTRY* vBarEntry)
+ 		const UINT32 oldPos = vBarEntry->size * bpp;
+ 		const UINT32 diffSize = (vBarEntry->count - vBarEntry->size) * bpp;
+ 
+-		vBarEntry->size = vBarEntry->count;
+ 		BYTE* tmp =
+ 		    (BYTE*)winpr_aligned_recalloc(vBarEntry->pixels, vBarEntry->count, 1ull * bpp, 32);
+ 
+@@ -566,6 +565,7 @@ static BOOL resize_vbar_entry(CLEAR_CONTEXT* clear, CLEAR_VBAR_ENTRY* vBarEntry)
+ 
+ 		memset(&tmp[oldPos], 0, diffSize);
+ 		vBarEntry->pixels = tmp;
++		vBarEntry->size = vBarEntry->count;
+ 	}
+ 
+ 	if (!vBarEntry->pixels && vBarEntry->size)
diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
index a45490e8f5..de752b4376 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
@@ -36,6 +36,7 @@ SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=master;protocol=https \
            file://CVE-2026-29776.patch \
            file://CVE-2026-31806.patch \
            file://CVE-2026-31897.patch \
+           file://CVE-2026-33984.patch \
            "
 
 S = "${WORKDIR}/git"

