Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAA83CC6B3C
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:43:06 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32796.1792042982834124860
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:43:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=m/RxswDj;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc1bc88a20eso1173871a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 22:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792042982; x=1792647782; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JUoHHEwW3LEC1cG6FFgwzC48aplBg0BACbNR1nAq74c=;
        b=m/RxswDj30HIgZeK2h8LfzXADQs4WX8B18TbAzvbhTVXXo5TULggGqB7x09rDf3ITp
         OHizLNl/9he5sEmdNIHSnBEkUUn9XoOXFpU5gotqVtRlKVTvRF0kDlHgxRY3pMN/zElw
         sYuhGnHpezyHcFY1dyaDVyD34XsmjbaiHe/UwM1IStz0cMLIJvu/Ak8gxN4fsBaYMvNv
         IW90Lox/pprAvM5b4REjDUicaBayek9/IYwHxqV8WnVebeTUNgvEAwm6j69/L9CGUHK3
         TFLR/vOUJ97u8ByO/HsQE4j91azHu64KdeA1Y5G9KR3oAru6h7djpkqUKh6dCwItQn0e
         SCEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792042982; x=1792647782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=JUoHHEwW3LEC1cG6FFgwzC48aplBg0BACbNR1nAq74c=;
        b=PPcWLjHg0IBwjWk8jSO16DKoXEZt9a76KayG53oKgg6zKziz5f3W2m88JjqCskL+Ob
         7tz/zsb1eGyqo6eNS+hM+CW4gEIsNkXkG5GWBkjVyPSdQx2Xbk32oQuPJn05IVTNWAnC
         2YtOzY0Jl4ieIWCHlhPOvaJ/ARWnn6DiDOHRbqZOoqx/OrxcP5hwYi8vlKdAluNdryX4
         VTRE7OksTn7wjCjG+fJv3D1sluAA2dkHhX8xdMosmHdIYcKpq7fFIyujxilDosyCEnb0
         De9HyHMZO0OABMRVJqThtS/TSs7BOCkYzIB9A3QxtC1zTpVT7B2Z1iv6y2O+Pjt72bdW
         qSjw==
X-Gm-Message-State: AFq9FYJ+bwLhWt0mjH32E/QJS0WmpUWoCTw3q8J4WXM3N6onJjo+UgI5
	0gj/oMr0FuiVkBDUoMDeMP7lErfgnVdT7kVn5ZhjChwlJDxp42nhc4zHvtKUqg==
X-Gm-Gg: AYBFou1F3aGHbaWw/4s1lesnEvgEPWRsitJb8FXA2rHL04sMHk8OzOvH3nSmWaIYTY+
	RGKpVNi8OM/LA1D506XW7EHzLOwxRG4yRkddzQDd6epsfxJ/Izq8owwM1kYGM95i9Kao8OGBQJu
	VQcDmulau5B1j7+h6miQQNbuHbLLzAIZwZftiAOCcsIWbBov28SdogdhxiCXjNL8S/axidZU5yS
	4rdcdVN8NlI/Ps0ekFU2rnHgGAn0jUKeXfVdeJdzSEq47WD1FX4WeFB+w2MgRiuiVdo1pQ3rrya
	M6NvjY0iEuETerZvhm+jsw5VIZHm6dc3GE/2dKxtLRfaxYEEsJqOaYfMj1sHX60NNWvlR5WaYZZ
	uT5lkJVLJ5frOCR2xF4iMyp6cBbI7n82I7zBu18IUpjbv8luoSI4kGEYVhtz0D/7fFFh+erS4RF
	h6fNwu7ioLZpVc91kODlBRKa5xh/sHB9MCYRD3Q6iYIe0BM5Vv6JLM9KrB+04LXN9e29RyGWZcX
	h+qFXdGL1Aq59lpGaXJ7V2i77x3/i4X5Q==
X-Received: by 2002:a17:90a:e7d2:b0:3ac:a6a5:5748 with SMTP id 98e67ed59e1d1-3aca6a55a28mr140043a91.13.1792042982101;
        Wed, 14 Oct 2026 22:43:02 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e967875e58sm549125ad.36.2026.10.14.22.43.00
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:43:01 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 07/82] libwebsockets: patch CVE-2026-19773
Date: Thu, 15 Oct 2026 18:40:55 +1300
Message-ID: <a6bf82202ac3cf744402afdd4476727909db4179.1791945956.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791945956.git.ankur.tyagi85@gmail.com>
References: <cover.1791945956.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:43:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130927

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-19773

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(From meta-oe rev: b8399ae07ae1958eced847a3d5e8a4227c2e3aa2)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libwebsockets/CVE-2026-19773.patch        | 31 +++++++++++++++++++
 .../libwebsockets/libwebsockets_4.5.8.bb      |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2026-19773.patch

diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2026-19773.patch b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2026-19773.patch
new file mode 100644
index 0000000000..74908c5437
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2026-19773.patch
@@ -0,0 +1,31 @@
+From 998a9af40aa6c2ddcb91c662d6585ea80ab52f85 Mon Sep 17 00:00:00 2001
+From: Andy Green <andy@warmcat.com>
+Date: Fri, 3 Jul 2026 18:43:25 +0100
+Subject: [PATCH] zdi-can-31036: h2 bounds check on server
+
+This vulnerability was discovered by:
+Maher Azzouzi working with TrendAI Zero Day Initiative
+
+(cherry picked from commit 824151862f37bc72f46d9a3e01d5b9408d313a0b)
+
+CVE: CVE-2026-19773
+Upstream-Status: Backport [https://github.com/warmcat/libwebsockets/commit/824151862f37bc72f46d9a3e01d5b9408d313a0b]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ lib/roles/h2/hpack.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/lib/roles/h2/hpack.c b/lib/roles/h2/hpack.c
+index 1025faa6f..863eb88c9 100644
+--- a/lib/roles/h2/hpack.c
++++ b/lib/roles/h2/hpack.c
+@@ -274,6 +274,9 @@ static int lws_frag_append(struct lws *wsi, unsigned char c)
+ {
+ 	struct allocated_headers *ah = wsi->http.ah;
+ 
++	if ((unsigned int)ah->pos >= wsi->a.context->max_http_header_data)
++		return 1;
++
+ 	ah->data[ah->pos++] = (char)c;
+ 	ah->frags[ah->nfrag].len++;
+ 
diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.5.8.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.5.8.bb
index 005729dcac..11da4b299c 100644
--- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.5.8.bb
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.5.8.bb
@@ -10,6 +10,7 @@ SRCREV = "fbb0baf6af9c4324f0f1591734c78b0089b599d4"
 SRC_URI = " \
     git://github.com/warmcat/libwebsockets.git;protocol=https;branch=v4.5-stable;tag=v${PV} \
     file://CVE-2026-10650.patch \
+    file://CVE-2026-19773.patch \
 "
 
 UPSTREAM_CHECK_URI = "https://github.com/warmcat/${BPN}/releases"

