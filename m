Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8090C98309
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 10:41:35 +0000 (UTC)
Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4283.1790160092604044569
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 03:41:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pVUBoHUV;
 spf=pass (domain: gmail.com, ip: 74.125.228.41, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469f204f6so410495b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 03:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790160092; x=1790764892; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+/xEvWCHM8LUQY9AKXFyTgZC0Xfn4h2Z3SX/LiCVg9o=;
        b=pVUBoHUVVy/+slvaVaRvQnwHog/91Sh+WgoOo8DJpLESSOCkk6QrtsW7ZNa+cmKkbh
         Hf+j/gV5bQH/eBufYCWuRC669K8XldP4FOyF0igzYyT2UhxftIYl9/jO+wAvvYWf8IXp
         wcCcWdEXOVz92hMVnUS+TGRp95Sc36ReQY5D8xDiOEvcsaMrua371vl5C6vE4ViWKrKa
         4dZq0BRquQHT7/N7f9sZ/32KRJX6Joo3xq1FNvHhHv2/3xtr0tjv8xVkrsXrNfY93K/E
         TuEvLWK/8rkNMLQp6Dn3pTXopjT55nFUSaSkxG+vWkjrTmHs1GL399wsysyIxnn6QHx7
         +vZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790160092; x=1790764892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+/xEvWCHM8LUQY9AKXFyTgZC0Xfn4h2Z3SX/LiCVg9o=;
        b=uzOxRi6Xvs8hYQ0EcNacDUlDpn5SqjBr3H8QW/l7F4jwqDycHQZANa9ZSlUg+l7XYH
         Qd6szZiOJYCd3w23RSE/woRwaWXmia6Mtbf8qmKOyAspRJqTwEvxB30AMfN/UHSNmWID
         xrsy5+Ao+UDyTseoWgFRVFzBoEkCL87Ubq3gzbu0QLCHR6ut+WKsQYlhKuS+Zccydd7h
         iLLMBIwlZft1DvEKL2Tg8jTIpyHtiL5DR3VWlYgAnvDWJM1mGBdhq1lVBySd0TMRZPrk
         NMI7dYU+fI51TK9D/RG3tLsuqjGfk3G+o6Lsc2GNNwFI+VaGrqPfCxdis0i9fSigYoux
         pKHg==
X-Gm-Message-State: AFuF++lOfRrxYeGFf+y5bFfA5rffoTZY0KZmqr7khln31XaTQWuWeubb
	NMzY8XrF6BDThN5PC9aELU/JJAMIXGllfUHff7Gyt7hGhw2aDuV146z9/rAfVw==
X-Gm-Gg: AYBFou3jZwjRIfNfZL0IMjkkvlqR8mmfEs2GyxzY9t5CcIBaKSIMmoPoCjLgEk5WeWf
	7uSFqw5GuP6eCD/o0C5RE+Gx0k3hbAy2nbrSECwR/Z2CG46DC3FgkSvYda81WDWgV6u//HBKxZB
	KFod+psK8m/zpJWqd29ECzfTG0wm5oA8FjP+NtSHJOc+3rT4XvGXix7lq5f6WwIWfrQq6cRLXNn
	6M5zX17Fy4sxCn291sEYVuZUmEHGIgSQDj2cRDHWQW5EDd0w8LHrWvstKfwUWVucN1jzGP2Ou9e
	WWAttMovRTDi5H9Xq2Sr6x2zssE+2vFGD4nYHtmETdj4KN6fOpO2bWQbk1C1baZSeHF9/5Qq0Iv
	hkzZhu/B4tCeUOKA44FmrorROrK6KLMm/4m4Mz4Ohl9a3+uPLmUbcla4ccKBFhjO5QOQ6iOMfP+
	ozKdU8SRif2gKp09oRSDpfNBge16u7h2YwSijf5wc4r1GGfxsXzYE6MScb+bLHJxannTzQZWa+/
	SawwROTegveusKH5/ABXm3zrmk+jStHPg==
X-Received: by 2002:a05:6a00:4304:b0:870:c2db:da53 with SMTP id d2e1a72fcca58-87d1b2b0a52mr1729534b3a.23.1790160091926;
        Wed, 23 Sep 2026 03:41:31 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1d5c1646sm1035870b3a.30.2026.09.23.03.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:41:31 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 16/42] libwebsockets: patch CVE-2026-19773
Date: Wed, 23 Sep 2026 22:40:30 +1200
Message-ID: <20260923104056.457360-16-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
References: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 10:41:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130203

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-19773

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
index bca2663419..6a3d0b4033 100644
--- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.5.8.bb
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.5.8.bb
@@ -10,6 +10,7 @@ SRCREV = "fbb0baf6af9c4324f0f1591734c78b0089b599d4"
 SRC_URI = " \
     git://github.com/warmcat/libwebsockets.git;protocol=https;branch=v4.5-stable;tag=v${PV} \
     file://CVE-2026-10650.patch \
+    file://CVE-2026-19773.patch \
 "
 
 UPSTREAM_CHECK_URI = "https://github.com/warmcat/${BPN}/releases"

