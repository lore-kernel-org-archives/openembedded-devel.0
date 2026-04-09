Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64DE1E9DE44
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 07:09:52 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.126700.1775718585406570254
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 00:09:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PQ6yfw7v;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-82cd70febc7so448370b3a.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 00:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775718585; x=1776323385; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ymGO2t5KEXfW8hWW19MLi3c8Hw2JGEHjkvwQBc2HMu8=;
        b=PQ6yfw7v/NW9hEAEtTbWY3DSHD72qIa4H90m/Sh22g4TSTeT+v57U8XG70MhRbiB44
         YFF4SFteThBgjFWnbUpULsESD+IAlUq0jNAOdiJe5P0KduC1S+8BWexlQN0Nd4bsESAu
         r3Ku3fpwOJvWSfBcmurVLokkZLVCxX7iT+NYwRUHdkm5O7jsqsRD4hl7L6gVBD2Vs82s
         cYzijEIeqgNjpPMhO5/S15dFF1pQ0wMHUkTFzQ0jCbrtEy+a4+lfTZmZ4k/cJnlEVafk
         0ClpC4RuSm/+V5gTdnSKqP+OtX1FUtYP7QDLJvgW2tuivH9V80FwXJ5HhYGe+dT9Vpyl
         Momg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775718585; x=1776323385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ymGO2t5KEXfW8hWW19MLi3c8Hw2JGEHjkvwQBc2HMu8=;
        b=P/cF0JmuRohrdF+vkh9GJ88ife+uFJvaCfzSoiPxRzC75TNsJf/VN0OsKbYz1QJiUB
         Pd5pX3sJiWTxk2t739yz0rcwZHyWDb97Lp2dj2SwbcAiIC4mCC+QsyzAOeKfoQM/Wao6
         ByYc8U3h3ezkIgsJdca/L5Cut7cz3VZ0TpqNguLmdBD57gPVLIZbbW3wbqEVtrS5xnNh
         I2T1bszD9iMNcYxPiavmNx/PaQZVGFEn6UD3sTEWWTldl741c8of/oQxDKk8mHuuApNN
         EZG7///Dvri4Yvla6HVy/M6p8FExh2zF/jjutUQSLi9k0irns9HfQqK30r+2nQqbrrLc
         YrEg==
X-Gm-Message-State: AOJu0YwPqWT6CReUQsWAKnQ5dFMFtfxnhNGWOw68mHGzCWwht5cYVdao
	tIqkVBJX3Uj2iH6vIB7n4nQ9QpDCOh1phAN6Ef/1gvXi8Uwf48bkHA7nIVulJA==
X-Gm-Gg: AeBDiets1wDtzsPDsKUTbt7Pa+KL7pCDfViZbAfI+DIEbdemo1q243/mMJVDtd1//mq
	6knBUEkYi5EOT+I6znFbt7KpY3TDvzq2DbsgY7b0ig18oHL7UvhW7qax9dHjIdTdlv9PHY5AQK5
	HZSykU2Kp3zIiPvaJwAfdsORtVYxBiIe/S7fGzZCJfZ4VPbGWWbzaxTrIDcidYEBuM9TblIKwR2
	XFqGLt0wNAKjmKS917CHFDDKp0KYU/yBQhO48gBiSDtEpWvSZDKqb8sxNz5t8rZNk2W74mLBM2G
	zze7eBmbBJ2kRhSfAbE0Ijv0cohrx9KP3Gg0Jk4aCpZwoIbp/ERl3k7d7+XSheegrLi4+/uEhE0
	T35Ba1eAHlyotkCN0xb/uX44QlsFyFG243ZPjR5s6ZYn9g/K1cw0jANsMG/SgBpA29jX9YXZ8n+
	1oy0BuvxS5eYutE403NcZDpzj1rb7YWVyTM5w=
X-Received: by 2002:aa7:9dde:0:b0:82d:5da9:adc9 with SMTP id d2e1a72fcca58-82d5da9b551mr5590299b3a.12.1775718584552;
        Thu, 09 Apr 2026 00:09:44 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.51])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b21c92sm24764936b3a.11.2026.04.09.00.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 00:09:44 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 7/22] freerdp3: fix CVE-2026-24676
Date: Thu,  9 Apr 2026 19:09:04 +1200
Message-ID: <20260409070919.3968586-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409070919.3968586-1-ankur.tyagi85@gmail.com>
References: <20260409070919.3968586-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 07:09:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126129

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-24676

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../freerdp/freerdp3/CVE-2026-24676.patch     | 34 +++++++++++++++++++
 .../recipes-support/freerdp/freerdp3_3.4.0.bb |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-24676.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-24676.patch b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-24676.patch
new file mode 100644
index 0000000000..30ca1c8a6c
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-24676.patch
@@ -0,0 +1,34 @@
+From 0a2248a4adbee77122270062bebe00143d3ee96a Mon Sep 17 00:00:00 2001
+From: akallabeth <akallabeth@posteo.net>
+Date: Mon, 26 Jan 2026 10:20:23 +0100
+Subject: [PATCH] [channels,audin] reset audin->format
+
+Whenever the underlying structure changes reset the pointer to NULL
+
+CVE: CVE-2026-24676
+Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/026b81ae5831ac1598d8f7371e0d0996fac7db00]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ channels/audin/client/audin_main.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/channels/audin/client/audin_main.c b/channels/audin/client/audin_main.c
+index 1578d26ac..2c91d9f60 100644
+--- a/channels/audin/client/audin_main.c
++++ b/channels/audin/client/audin_main.c
+@@ -206,6 +206,7 @@ static UINT audin_process_formats(AUDIN_PLUGIN* audin, AUDIN_CHANNEL_CALLBACK* c
+ 	}
+ 
+ 	Stream_Seek_UINT32(s); /* cbSizeFormatsPacket */
++	audin->format = NULL;
+ 	callback->formats = audio_formats_new(NumFormats);
+ 
+ 	if (!callback->formats)
+@@ -280,6 +281,7 @@ out:
+ 
+ 	if (error != CHANNEL_RC_OK)
+ 	{
++		audin->format = NULL;
+ 		audio_formats_free(callback->formats, NumFormats);
+ 		callback->formats = NULL;
+ 	}
diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
index c83d82b357..5f0a2536ae 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
@@ -25,6 +25,7 @@ SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=master;protocol=https \
            file://CVE-2026-23948.patch \
            file://CVE-2026-24491.patch \
            file://CVE-2026-24675.patch \
+           file://CVE-2026-24676.patch \
            "
 
 S = "${WORKDIR}/git"

