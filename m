Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F7B4D1BDED
	for <webhook@archiver.kernel.org>; Wed,  3 Dec 2025 21:30:00 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27239.1764797397990504462
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Dec 2025 13:29:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QXmcQTSE;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42b38693c4dso100926f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Dec 2025 13:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764797396; x=1765402196; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GX5qEgeg7cJspZoltOobNZSb9v0oM3+6WH6GW6bENtI=;
        b=QXmcQTSEUsm4B1d6+ue+ci/b2jMKQx/2jaQEr0upmRcQObwh38ix7O5yIcam6lZyqS
         sWuhZRGG9CnsSbkE2Nzpf8ztjb2e6AYjC12qnorqPSnH9FZ7XxbcKoDroBiCExD9Ja6h
         /5o6CWJeTftAVc6KWmu+pKHCKpYsasEJie+zdHhEoR777643CrIAWV8R2ACWRHEEwORa
         Pt3GXd6+mC3LYqhX4tQFgaSo1XUdq8R6KSa7+ECZa5QT0tiqNMuU9oOVAi9amjZiRklk
         gB9yHlGT1wkYchBd20IyXweYJe6Vz7maAPjO49A3GOhV38qCIOoHmTJq+eVDUGsYgU8B
         /4Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764797396; x=1765402196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GX5qEgeg7cJspZoltOobNZSb9v0oM3+6WH6GW6bENtI=;
        b=KRJElP4fpomYAfXdEN/B1vAg0xlM59/fV3DZGlydyLs2/S5xWW3giPRoe6xQ/Z0RLs
         aqansZdemcoTGfdYD9XdK2uSnw46Rf85ubSMXpS7It3H/gH1K3dhMPI83oNxlEVSkaOq
         Yk1Cxr7+N8Qxahm6CXGSBfYfNGwcPTmfYTka4eyMBPLXRHvYLO3oLQD3yd0DLWmPaY7B
         7LZYUW7ERFBgZwKBQlagtARatFeMyrkliua234QP6vsR7aBQOKoI/emakMQtvqrXZhVj
         L2vFJloA5jBuO/4fSjft2lmsm6e7uACIdP/GrMI2KhEoaTV3qJnGzOX3OeipShvcgHAn
         IYlQ==
X-Gm-Message-State: AOJu0YzadN7UCRrKMlNXP0hcWTK0t5y8U0ugRGM/YFtYvvJt8X5hjEnH
	f7i0sMxEppdQVNPaTigt5hXMY4iGM588qDL+sVtF7sh45VdcRfvbbdsquuXHNw==
X-Gm-Gg: ASbGncuSWqYLOxNX5Cr0uDW/GEhf2i8cPUQbW4+KBKdXas1Bc5NDLK7NzbKPPRmzfPK
	I4Hw1YJKc5dwrl0oSz21XDuCTY0TxV2y58QOhM6L8UEjrcCS8IEkhGSOCrN6JkmagYUsldtz1vt
	zOUH5RZ7lhAuEIEH+Bq6Iw1CcZwdOLTe7Hq0dJppLUgLSYQWBep4GUDeId/VF8NtNVWNoAC7exB
	9DrF6QhNzgKZ9rXoYPBYEARhsDLxY7zt//uT8kqX3xk7K/tDZCTUoXUv5BcZzvKZpqX63u1/378
	RHkHry5zy6X64lbvSfUvIhB1OD2TTpw/DuZEGyVHMGhlKzwEj4RWcMX/mCf6hSbVxe495dDlS18
	MhoF5gsLFCM6aAPCub0gqewWRM+gY+ldAqZoD0JuI1Q==
X-Google-Smtp-Source: AGHT+IHsSLWCD5ocV+BUFeezhZACXyevzhNiBAA5MIkkotgIV2h/VsFKgHa8fXPB/UUtwbVjMym9Dw==
X-Received: by 2002:a05:6000:2485:b0:42b:36f4:cd22 with SMTP id ffacd0b85a97d-42f79853cc7mr368639f8f.38.1764797396285;
        Wed, 03 Dec 2025 13:29:56 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f6ffa18ffsm10722885f8f.5.2025.12.03.13.29.55
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 13:29:55 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 09/12] xrdp: patch CVE-2022-23484
Date: Wed,  3 Dec 2025 22:29:46 +0100
Message-ID: <20251203212949.4046524-9-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251203212949.4046524-1-skandigraun@gmail.com>
References: <20251203212949.4046524-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Dec 2025 21:30:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122287

Details: https://nvd.nist.gov/vuln/detail/CVE-2022-23484

Pick the patch that mentions this vulnerability explicitly.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../xrdp/xrdp/CVE-2022-23484.patch            | 31 +++++++++++++++++++
 meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb   |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23484.patch

diff --git a/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23484.patch b/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23484.patch
new file mode 100644
index 0000000000..af27c50376
--- /dev/null
+++ b/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23484.patch
@@ -0,0 +1,31 @@
+From c2c6efb1d377be6baaa4acbc9d3700490fe92887 Mon Sep 17 00:00:00 2001
+From: matt335672 <30179339+matt335672@users.noreply.github.com>
+Date: Wed, 7 Dec 2022 10:03:24 +0000
+Subject: [PATCH] CVE-2022-23484
+
+Add check for RAIL window text size
+
+CVE: CVE-2022-23484
+Upstream-Status: Backport [https://github.com/neutrinolabs/xrdp/commit/c2c6efb1d377be6baaa4acbc9d3700490fe92887]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ xrdp/xrdp_mm.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/xrdp/xrdp_mm.c b/xrdp/xrdp_mm.c
+index 74b0516afa..4352625874 100644
+--- a/xrdp/xrdp_mm.c
++++ b/xrdp/xrdp_mm.c
+@@ -929,6 +929,12 @@ xrdp_mm_process_rail_update_window_text(struct xrdp_mm *self, struct stream *s)
+ 
+     g_memset(&rwso, 0, sizeof(rwso));
+     in_uint32_le(s, size); /* title size */
++    if (size < 0 || !s_check_rem(s, size))
++    {
++        LOG(LOG_LEVEL_ERROR, "%s : invalid window text size %d",
++            __func__, size);
++        return 1;
++    }
+     rwso.title_info = g_new(char, size + 1);
+     in_uint8a(s, rwso.title_info, size);
+     rwso.title_info[size] = 0;
diff --git a/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb b/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
index f9e2105500..a9107a0e26 100644
--- a/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
+++ b/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
@@ -25,6 +25,7 @@ SRC_URI = "https://github.com/neutrinolabs/${BPN}/releases/download/v${PV}/${BPN
            file://CVE-2022-23481.patch \
            file://CVE-2022-23482.patch \
            file://CVE-2022-23483.patch \
+           file://CVE-2022-23484.patch \
            "
 
 SRC_URI[sha256sum] = "db693401da95b71b4d4e4c99aeb569a546dbdbde343f6d3302b0c47653277abb"

