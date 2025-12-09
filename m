Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 368F3D1CDC6
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 12:30:32 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6591.1765283422355847476
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 04:30:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=RUznrZGc;
 spf=pass (domain: mvista.com, ip: 209.85.210.178, mailfrom: hprajapati@mvista.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7df022360aeso3159597b3a.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 04:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1765283421; x=1765888221; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ozA9tlFI53eZIzlnDp0xTxpsjsngpsQMTuBaXsQCc5s=;
        b=RUznrZGcPzRrET97zUfnT6UZ1XxH75I3Twiiadnpb4PZjLwiNdFjZxrT8FUCApFkrG
         oT2pHrLdYyrzUTPCUuw6Ux9P6gqbj72m2NQS/kwjBjSQLZFRvb+aUrFC5lMwCkea4/ng
         o1g1e9v4LdoKpItmMwTzw4XJfh9ukACdqV98g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765283421; x=1765888221;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ozA9tlFI53eZIzlnDp0xTxpsjsngpsQMTuBaXsQCc5s=;
        b=HhYKONhpCedVghu92bUxJFIi7wW5qC4ZbDIsfOHmlGJphG1BIuF/fughye4dfs8SGD
         gwQBOQJcEWEq5yvH7SMw/Wp7ADhXr1yNTw7viPhQ81qIjwREvNCREclLyMUINxTNeLET
         sRqzFGuw5wyCv5gxHi6xicn+w+XC79xEDGwOvyBeOev5mI9Sqq4Kt6MI0xSI2vCizNYD
         V52TUZ1mAIoNGVOPf5TXWa7Bd+Z1VaY3b0mqSqi4yLXe7wt/Ycyt1uiPliUeVvI8o79A
         Wd8sUgTYvcZWtXiFpO7KzNrW/goxB17J9iRGRmu1w9SUuX9EH3q0HTW7fgeZQVylyvxh
         X5Gw==
X-Gm-Message-State: AOJu0Yy5gOflPJ5WZFURDFfh5gMbj50Nw5i+TRmLw1cznoR7u3rJGgcc
	/b7GGsc9BkW9lKb5Fv9QA7jNQH0aVsZDpXiEZxC3oEa5Tmud809BnBmt24H1PQdEWa49wAKCHbq
	4Na3dGk4=
X-Gm-Gg: ASbGncu4vFomJT6Ep2qvi0g0p4Lmd+XeAoFRF7N9/EQiH6On3iCXLfcUM3QGUgLZoeF
	epl5uQgA3cMi2kR5YOvXxVFEMXIKFu6JTz8l0jR9hTiH/rtpGMwmddMOp97oy0V04Lb+fdI9rI7
	OXUBkyCCGfXyF7TY/anusNtPnmO9+jP0C7oV53UovdlBOsk9tCBmn9xFFwGVExPq2e6i2U26jfI
	1RpAY01ldAU+5eF0SRDM8Wye9ve0XGFoE4n9pDSYqIdfMtPtUKkArbrMA0Vi2IecprX4Zs2eSv5
	D25tdKWfSz1vyEcQoL5lsrVxsEBX0B5tqFeRlg5ZQ/Z+8VchtVGGbDm5E+IJsUxXosQUQ78lJ7A
	aDdQeXG1nt6E+waOE8ZhaxqTtz0KopeNsu2Jj7jYDI2e/aA+uEZZ/lGbb6tEyB4F9faiAXw/++X
	cDd4D3YFo1JoeHw0AGqRUpxMY=
X-Google-Smtp-Source: AGHT+IGfYkFXucBk+/3xpvNURzrEEMNU1xmC8OJYymVK0uP8UgqQ0L2uNbtY5DUM8EVWxai4GqdNvg==
X-Received: by 2002:a05:6a20:72a8:b0:35e:521b:f4a1 with SMTP id adf61e73a8af0-36655058e72mr1479888637.30.1765283421456;
        Tue, 09 Dec 2025 04:30:21 -0800 (PST)
Received: from MVIN00013.mvista.com ([43.249.234.150])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bf748c6bcacsm14576671a12.0.2025.12.09.04.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 04:30:21 -0800 (PST)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-networking][scarthgap][PATCH] wireshark: fix CVE-2025-13499
Date: Tue,  9 Dec 2025 18:00:05 +0530
Message-ID: <20251209123005.144509-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 12:30:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122445

Upstream-Status: Backport from https://gitlab.com/wireshark/wireshark/-/commit/e180152d3dae668249f78c72a55a4ba436b57af7

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../wireshark/files/CVE-2025-13499.patch      | 45 +++++++++++++++++++
 .../wireshark/wireshark_4.2.14.bb             |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta-networking/recipes-support/wireshark/files/CVE-2025-13499.patch

diff --git a/meta-networking/recipes-support/wireshark/files/CVE-2025-13499.patch b/meta-networking/recipes-support/wireshark/files/CVE-2025-13499.patch
new file mode 100644
index 0000000000..b713cea8c4
--- /dev/null
+++ b/meta-networking/recipes-support/wireshark/files/CVE-2025-13499.patch
@@ -0,0 +1,45 @@
+From e180152d3dae668249f78c72a55a4ba436b57af7 Mon Sep 17 00:00:00 2001
+From: Darius Davis <darius-wireshark@free-range.com.au>
+Date: Sat, 25 Oct 2025 15:01:34 +1000
+Subject: [PATCH] Kafka: Fix decompress_snappy with no xerial chunks.
+
+Instead of returning true without setting outputs, report a failure to
+decompress and return false to the caller.
+
+Fix #20823
+
+(cherry picked from commit 49137f8ce93c9f7ac55b69c8e089ba6a422f633e)
+
+CVE-2025-13499
+Upstream-Status: Backport [https://gitlab.com/wireshark/wireshark/-/commit/e180152d3dae668249f78c72a55a4ba436b57af7]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ epan/dissectors/packet-kafka.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/epan/dissectors/packet-kafka.c b/epan/dissectors/packet-kafka.c
+index 482a670..e537013 100644
+--- a/epan/dissectors/packet-kafka.c
++++ b/epan/dissectors/packet-kafka.c
+@@ -1788,6 +1788,7 @@ decompress_snappy(tvbuff_t *tvb, packet_info *pinfo, int offset, guint32 length,
+             count++;
+             DISSECTOR_ASSERT_HINT(count < MAX_LOOP_ITERATIONS, "MAX_LOOP_ITERATIONS exceeded");
+         }
++        ret = composite_tvb != NULL;
+ 
+     } else {
+ 
+@@ -1810,9 +1811,8 @@ decompress_snappy(tvbuff_t *tvb, packet_info *pinfo, int offset, guint32 length,
+ 
+         *decompressed_tvb = tvb_new_child_real_data(tvb, decompressed_buffer, (guint)out_size, (gint)out_size);
+         *decompressed_offset = 0;
+-
++	ret = TRUE;
+     }
+-    ret = TRUE;
+ end:
+     if (composite_tvb) {
+         tvb_composite_finalize(composite_tvb);
+-- 
+2.50.1
+
diff --git a/meta-networking/recipes-support/wireshark/wireshark_4.2.14.bb b/meta-networking/recipes-support/wireshark/wireshark_4.2.14.bb
index 63610642ac..c313075ea4 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_4.2.14.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_4.2.14.bb
@@ -14,6 +14,7 @@ SRC_URI = "https://1.eu.dl.wireshark.org/src/all-versions/wireshark-${PV}.tar.xz
            file://0004-lemon-Remove-line-directives.patch \
            file://0001-UseLemon.cmake-do-not-use-lemon-data-from-the-host.patch \
            file://CVE-2025-9817.patch \
+           file://CVE-2025-13499.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src/all-versions"
-- 
2.50.1


