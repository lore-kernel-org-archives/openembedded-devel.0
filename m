Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7276AD2ECF7
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 06:48:12 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1311.1768891687297671372
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jan 2026 22:48:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nDT/E2iL;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47ee937ecf2so35608595e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 22:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768891686; x=1769496486; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wbc3Cmh+J5DTokoRdv7KmNm39Q0ZIs6FEim2iJqp8TM=;
        b=nDT/E2iLl4Q92SsP/kAaqqGHlnkvLjFuclJiFsUBRAyoLj8GVa5FsYnJJgbHP+7qmQ
         uUGTcGW8ue+FrpHr5H2XFfgJRX9byqyzbWe2xhA9oRilEhv1MDUZ2f5nsrMB7U6ZyEdP
         7tu7Gw8IHA/lMsx4rOQMLlfzrrwtwnCp1MOV851WNE4zFOTaX/3bP1/FHnJFxyAfrK5H
         RAVsn1nLEf0Onpg4PaXLEzSclher9jt9aBTk2RePZZvi0ec9AT8m0iy7M1vzzrC3Z4rb
         JmL0L0YtCPnD1m1OJOuVk3ZXohKyRpoQCyvmFinuDBPsCBRHAUm+PI5wypmOyqMXl8q8
         iKJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768891686; x=1769496486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Wbc3Cmh+J5DTokoRdv7KmNm39Q0ZIs6FEim2iJqp8TM=;
        b=xQNyl/XH956HabvE3hvSgBkZh9aaHRG3/PePJALdmWBb3CKFbT6d8/n6q8zXdi4OPE
         GowEY8NsA4v//241Z7h50ntIGTCb6J6gHaFv4k8W43xTPyWDWVTF/DrOicPLfygNlPsJ
         TA6RpAA0HDdI2TE2kBa1xFNY+iHhoD5n5TdJF5vv+xGhlNTMUFSL/MLcxeFCcNNUt+Om
         +Hlp0EwIx0vi2S9FjLAV17rDE1PN8duMQfonRMC6XqkfvbFpTQNINlJCJ9bjZglOs6Yf
         xrfBlQlgyzUA0KTV07PBF2X6MWNPBr0JJbJtDPNzPqFnY2STfJ8mx6NtC07diQTovlcx
         +lmQ==
X-Gm-Message-State: AOJu0Yxeh8D2A9PSEOY2h8jtZVI6nrTJ5XPdhw+TqEvRwk4mjIcMwTaB
	SFyOnUPgaOaluyEd1lTLs9K6WrfeUxTKTu4pHRb8TKUehN5N1JA5r97ziCi4pQ==
X-Gm-Gg: AY/fxX7L5P+O1NlF8G+CEWExKJSxcMhxn1ih1VDEoh+Q6y/KSnyL/xI7qzmVqS0kiWf
	BTULvJ1F8ZPBS8wL7Bhsu1ONzuNOUmEiE0BwEGtCqF06nJ1avziGLAzpgsoI3ZJalkSyzg//Gzl
	lbvIn9W60q8WFEgbDgzkCtAFx9j8A+46R17kYs+Xu9lfDMv7yutx++ZeckvFPdb2XuLnjJniyfC
	5JEsqYaGMoukYl2PGuPviJJAXNBSNy49izlOrp0CFmzrRd3K5qj8VCrrHXb5k1Pt/b6wc/XccCQ
	X68q5//OBfsxNkn+bB0lNzovWcwXBYQUT73ovjFwV/zlf3HpaP48uCV1xFG2Qv25KyLjG+9pSZ+
	bf6xNDiUjxadFi8pHGWfV+RbXooGgqInf2ICpOtbN3FuKjntXrzNwiUib+w1N5c+g+XyFBui7Jq
	V/F9aaSjTR
X-Received: by 2002:a05:600c:1c24:b0:47e:e2b8:66e6 with SMTP id 5b1f17b1804b1-4802590e305mr169604525e9.14.1768891685561;
        Mon, 19 Jan 2026 22:48:05 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569997f41sm26469633f8f.38.2026.01.19.22.48.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 22:48:05 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 2/5] freerdp: patch CVE-2022-39282
Date: Tue, 20 Jan 2026 07:48:00 +0100
Message-ID: <20260120064803.831507-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260120064803.831507-1-skandigraun@gmail.com>
References: <20260120064803.831507-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Jan 2026 06:48:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123655

Details: https://nvd.nist.gov/vuln/detail/CVE-2022-39282

Pick the patch that's description matches the CVE description.
(Debian also considers the same patch[1] the fix)

[1]: https://security-tracker.debian.org/tracker/CVE-2022-39282

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../freerdp/freerdp/CVE-2022-39282.patch      | 38 +++++++++++++++++++
 .../recipes-support/freerdp/freerdp_2.6.1.bb  |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp/CVE-2022-39282.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp/CVE-2022-39282.patch b/meta-oe/recipes-support/freerdp/freerdp/CVE-2022-39282.patch
new file mode 100644
index 0000000000..b83e64c173
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp/CVE-2022-39282.patch
@@ -0,0 +1,38 @@
+From 2dc894cc293a2c4b64176ea0d47587444f9ce9e0 Mon Sep 17 00:00:00 2001
+From: akallabeth <akallabeth@posteo.net>
+Date: Thu, 6 Oct 2022 09:12:40 +0200
+Subject: [PATCH] Fix length checks in parallel driver
+
+The length requested was not checked against the length read from
+the port.
+
+(cherry picked from commit 094cc5a4596c299595b732effd59ee149181fd61)
+
+CVE: CVE-2022-39282
+Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/60aac2abf0740dd36b62712fba91498fd6e055fe]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ channels/parallel/client/parallel_main.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/channels/parallel/client/parallel_main.c b/channels/parallel/client/parallel_main.c
+index af3e82703..993605a65 100644
+--- a/channels/parallel/client/parallel_main.c
++++ b/channels/parallel/client/parallel_main.c
+@@ -159,7 +159,7 @@ static UINT parallel_process_irp_read(PARALLEL_DEVICE* parallel, IRP* irp)
+ 		return ERROR_INVALID_DATA;
+ 	Stream_Read_UINT32(irp->input, Length);
+ 	Stream_Read_UINT64(irp->input, Offset);
+-	buffer = (BYTE*)malloc(Length);
++	buffer = (BYTE*)calloc(Length, sizeof(BYTE));
+ 
+ 	if (!buffer)
+ 	{
+@@ -178,6 +178,7 @@ static UINT parallel_process_irp_read(PARALLEL_DEVICE* parallel, IRP* irp)
+ 	}
+ 	else
+ 	{
++		Length = status;
+ 	}
+ 
+ 	Stream_Write_UINT32(irp->output, Length);
diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb b/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb
index 2271be3c6c..9489684e01 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb
@@ -19,6 +19,7 @@ SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=stable-2.0;protocol=https
            file://CVE-2022-39316.patch \
            file://CVE-2022-39318-39319.patch \
            file://CVE-2022-24883.patch \
+           file://CVE-2022-39282.patch \
            "
 
 S = "${WORKDIR}/git"

