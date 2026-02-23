Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B898AEC1123
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 19:19:03 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2754.1771874334165865465
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Feb 2026 11:18:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M/nDp68w;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43638a33157so4394621f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Feb 2026 11:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771874332; x=1772479132; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=vscse/4JetqiAolj10CCXyJJT3UL8VNvDJ6MThYsCrk=;
        b=M/nDp68wCfZPY+ndcy9S3rbFgUhhqn+LkOkAPjdKbm+LMDfk0jr5NKs4NAens2oWbX
         U6T8WyISbYPJWRg+ELHmont3q8XcFCmFPRnLDXYtGyrQtFj0IyixuAL0ESE4plvGZ53L
         Oyy5JRkzA6juyV45smlaKhnSVP4muloVAv2GsXMu/plVjmlD9znOSNKgw3Q7pGWn+Lm2
         nyQ9DygqnaViKzXxQioBtkqCHmLwzcKIBBncB4nbfxn5HyEMIxrsee0iWHdj4hC5ipbu
         6J1NL8S8iV5eyapwg6duJtSi/xQRY4ux5PTiN8SBgQYporylfVe14cpefKmA/UhYieoW
         6m0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771874332; x=1772479132;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vscse/4JetqiAolj10CCXyJJT3UL8VNvDJ6MThYsCrk=;
        b=D00kR2YAb582lZZM898ehti3M6kXq9nykq/Uc2uN2OEUqN+h1hoyMrxSsuYM/QJSUZ
         BOeDHWm2lsMLLjIFCVdQzBi1sPDjcZ43oPKH1XxhFNA5849fQ3kSEZ4/cX/Mvr3prVTX
         oWBLLaoDLuMzyDMgdj7Ec+D2nD3HTN1qTRldbvDQlMFtj9DEqu2/nlnz6j52Os4jTS2L
         37EWnQ+2cnqeSeTc+xtTmT4+2XDp7lvXOhF/XN9tJNcHVabDZ2qXesYAF6d7OTtKhrMv
         hRxeed1ys/s+4gW0+h5cCxu/oZlv+bViXWC6Z4UzaI0nlNWUN8EdWooJksA8KZy7as2C
         ehOQ==
X-Gm-Message-State: AOJu0YzUVKYhpgF1bcILv+w1/xhQtdi5F2OPs+ddqGBxQb12SRHZ8W7A
	7tRUsdFjN9EAqXgvXlHRoIx1U/1nTF5pN8zrrGcUZX+CpfnPU/n8Hdj0lgx6KA==
X-Gm-Gg: ATEYQzyMZ1Qtn2GvjECLDmosawv3Ef2Ucz9ULZ3isuSn1b0XBtdLKeXunoJanSAJ0jd
	LbmY/bVUIxuFnWdZb4NAXsSTR0BfZiNGo7rc+UOhKP7yYUrc3Q0HCvgpJ0E2otVyWRAv5B9bh47
	l3yM+iv7ZYix32+/rWe1uYxF2VnekrJsbUGqmpxbUo5kD5fKZzKHAGKZA74RQD4BawOU1GlR+0l
	TMA3WXAtLpV93szrsVuWKUL9RQtVm8kFCytr5FX7yZoMCRwF4kDTf6kjSstYQC8bx5y8VCuT2Xf
	p2XYZKA1QyN9PAHdbTRtv049fs0iRAgWjRudu4J+fybWwaHhwe9KORDqwLq/3VC5LsbrDVH/wx7
	pKiBU9cdestR9fstadfvSqtSITSRWTeWvTNih+PQ+9sda1C/7lt/OKryedpL8byTjKW+NEQ5zb2
	jL8gTPWk7uVKglejwUjCh3
X-Received: by 2002:a05:6000:22c1:b0:437:719d:a74a with SMTP id ffacd0b85a97d-4396f1822eemr16953779f8f.58.1771874332081;
        Mon, 23 Feb 2026 11:18:52 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d54760sm21308781f8f.35.2026.02.23.11.18.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 11:18:51 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 01/13] freerdp: patch CVE-2026-22852
Date: Mon, 23 Feb 2026 20:18:38 +0100
Message-ID: <20260223191850.1049304-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Feb 2026 19:19:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124555

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-22852

The related github advisory[1] comes with an analysis of the
vulnerability, including pointing to the vulnerable code
snippet. Backported the commit that touched the mentioned
code part in the fixed version, and is in line with the
description of the issue.

Ptests passed successfully.

[1]: https://github.com/FreeRDP/FreeRDP/security/advisories/GHSA-9chc-g79v-4qq4

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../freerdp/freerdp/CVE-2026-22852.patch      | 27 +++++++++++++++++++
 .../recipes-support/freerdp/freerdp_2.11.7.bb |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp/CVE-2026-22852.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp/CVE-2026-22852.patch b/meta-oe/recipes-support/freerdp/freerdp/CVE-2026-22852.patch
new file mode 100644
index 0000000000..aa6952fb7d
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp/CVE-2026-22852.patch
@@ -0,0 +1,27 @@
+From e3391e8d160f4b1b43d53b4a7d462a3601c45408 Mon Sep 17 00:00:00 2001
+From: akallabeth <akallabeth@posteo.net>
+Date: Sat, 10 Jan 2026 08:36:38 +0100
+Subject: [PATCH] free up old audio formats
+
+CVE: CVE-2026-22852
+Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/cd1ffa112cfbe1b40a9fd57e299a8ea12e23df0d]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ channels/audin/client/audin_main.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/channels/audin/client/audin_main.c b/channels/audin/client/audin_main.c
+index 23561b153..5ffe09127 100644
+--- a/channels/audin/client/audin_main.c
++++ b/channels/audin/client/audin_main.c
+@@ -219,6 +219,10 @@ static UINT audin_process_formats(AUDIN_PLUGIN* audin, AUDIN_CHANNEL_CALLBACK* c
+ 	}
+ 
+ 	Stream_Seek_UINT32(s); /* cbSizeFormatsPacket */
++
++	audio_formats_free(callback->formats, callback->formats_count);
++	callback->formats_count = 0;
++
+ 	callback->formats = audio_formats_new(NumFormats);
+ 
+ 	if (!callback->formats)
diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb b/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
index 3ee4f99c1a..70198a1e21 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
@@ -26,6 +26,7 @@ SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=stable-2.0;protocol=https
            file://CVE-2024-32661.patch \
            file://CVE-2026-22854.patch \
            file://CVE-2026-22855.patch \
+           file://CVE-2026-22852.patch \
            "
 
 

