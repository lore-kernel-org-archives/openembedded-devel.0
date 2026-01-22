Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F078C44536
	for <webhook@archiver.kernel.org>; Thu, 22 Jan 2026 05:44:07 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31389.1769060643173768148
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Jan 2026 21:44:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JZ1o2RwN;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47d63594f7eso4655955e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 21:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769060641; x=1769665441; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QLAKl7finsTvNaXFlKbODvvGz6Ld35ZWA0V7fvXM4rc=;
        b=JZ1o2RwN1Bri9Uuv3Elk05hp0lF7WZvpSsDFraiUvytZQTE3e1ZI/aBA2lrDJP7FB0
         2gQD1RyLpQTbnV9UoWdPuY/51EWZVzHo40NekTJvLnp7hL73V5xneyGJBNGyCtTUz/Be
         C69aLApbDPie8Q4b2rywYdJSig97Y2D8yBiUMwTZ6WXxdyiD1TqIqxY2iWh+m8HEvBxP
         vyzcwbrF10F2OgAZ9C3vH+qhwBYkotvishSijY8MYBbrLohDuWHpdMW+nDtVmDeyEpx+
         IAeii+jnB8cxtqyiTCuxe5ASIysagPbBRk8sWyXM37Hg0MKfmnB0plcRddgsCDznx9xy
         IDOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769060641; x=1769665441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QLAKl7finsTvNaXFlKbODvvGz6Ld35ZWA0V7fvXM4rc=;
        b=PrIZJTkqvd27WtFs8tS8HbQHhZXGHfZx5HQ++SM/tTEOoaCk0e3XhAXyTDaQWmWxO0
         A9856qy8mikPEggfyDm/MFa3iEze0h7ZzYYC23Mr7+JRwCOI2df7PgY5M0Tr3mD70W2C
         SMS4mp8bm3m/XcG65zIUi5K5G6k1WuHsr/NrrxQGSktXWoDYrOIlx08S6ysCAYKJCiJ0
         +awZVsxOuJdFviYKO08DVthVOzPNZRrFseBw8tumuIUlS8OHmoeE9Jl15Oh7EIHkUgNw
         to6FHsPK/bJ4TQEhbe8Nvqi3vnz3Y3OEHxwG3UKFx/mX8LyvmKR5TKr8sSnXfE2JOg56
         o0XA==
X-Gm-Message-State: AOJu0YwjeZpo6gCT13s0pOW4iJKClYc+daS3EuX92emj2uFIwaQbXWuj
	9X72wRTUOV0dFTDd4swvlvCL8LiVOGK6bz+lZ19c8vmfKPIbrF6lqkfYptj6LQ==
X-Gm-Gg: AZuq6aIjsreqVNRreZjnxm41S0jhiG6ZJQ1fCqTG3AS15e2lmlDwf3YyOGFjowJp05C
	gljcETtknIybCIw7OEYjhBeyH4dqMh2o5Bs3PIFwVhT8vhlNpoSYCxk/qn/5OA7k155W0r3YbXB
	SAFKQ3LAjvh1hgDCMPy80bUSYkaaJx9mO0CSvJwaf6foNk395IzYVPoqx/HDcNEDSm3OMpcDpTA
	fXOiH2WSg+W7XhYYubP9IrRCHtoBgODeqfesWHAGgf6poG1nfRXh0BCzX/pjS1SGJoOA74Owyq/
	bgYXorwhcxAV3CVer1XlGDU/pknlviBZ/BaAWdJP51otY7p+zVZLdxKU1vAOBdty0CDGn9Qgx5l
	29t6Kf5wD4skGGnGlWfl2+raapc/2XKwiXXSxmA1m3dMBDOAAiEFLJeG3gJXaTFwOySqVndRfWo
	Ni1gW/9fy5lZs/kjQ9YhQ=
X-Received: by 2002:a05:600c:34c9:b0:480:25ae:9993 with SMTP id 5b1f17b1804b1-4802ce16557mr214976135e9.20.1769060641452;
        Wed, 21 Jan 2026 21:44:01 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-480424aa344sm43912035e9.3.2026.01.21.21.43.59
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 21:44:01 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 3/5] freerdp: patch CVE-2024-22211
Date: Thu, 22 Jan 2026 06:43:54 +0100
Message-ID: <20260122054356.3570391-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260122054356.3570391-1-skandigraun@gmail.com>
References: <20260122054356.3570391-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Jan 2026 05:44:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123727

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-22211

Pick the patch that is referenced by the NVD report as the solution.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../freerdp/freerdp/CVE-2024-22211.patch      | 36 +++++++++++++++++++
 .../recipes-support/freerdp/freerdp_2.6.1.bb  |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp/CVE-2024-22211.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp/CVE-2024-22211.patch b/meta-oe/recipes-support/freerdp/freerdp/CVE-2024-22211.patch
new file mode 100644
index 0000000000..394094be16
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp/CVE-2024-22211.patch
@@ -0,0 +1,36 @@
+From 4d3dcfcf537a32ffbebbdba11a7b0748baec4e31 Mon Sep 17 00:00:00 2001
+From: Armin Novak <anovak@thincast.com>
+Date: Sat, 13 Jan 2024 21:01:55 +0100
+Subject: [PATCH] check resolution for overflow
+
+If the codec resolution is too large return an error as the internal
+buffers would otherwise overflow.
+
+(cherry picked from commit 44edab1deae4f8c901c00a00683f888cef36d853)
+
+CVE: CVE-2024-22211
+Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/aeac3040cc99eeaff1e1171a822114c857b9dca9]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ libfreerdp/codec/planar.c | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/libfreerdp/codec/planar.c b/libfreerdp/codec/planar.c
+index 12b9f6daf..58d4e4bae 100644
+--- a/libfreerdp/codec/planar.c
++++ b/libfreerdp/codec/planar.c
+@@ -1486,7 +1486,13 @@ BOOL freerdp_bitmap_planar_context_reset(BITMAP_PLANAR_CONTEXT* context, UINT32
+ 	context->bgr = FALSE;
+ 	context->maxWidth = ALIGN(width, 4);
+ 	context->maxHeight = ALIGN(height, 4);
+-	context->maxPlaneSize = context->maxWidth * context->maxHeight;
++	const UINT64 tmp = (UINT64)context->maxWidth * context->maxHeight;
++	if (tmp > UINT32_MAX)
++	    return FALSE;
++	context->maxPlaneSize = tmp;
++
++	if (context->maxWidth > UINT32_MAX /4)
++	    return FALSE;
+ 	context->nTempStep = context->maxWidth * 4;
+ 	free(context->planesBuffer);
+ 	free(context->pTempData);
diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb b/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb
index e422d46a81..9ad95e1700 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb
@@ -31,6 +31,7 @@ SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=stable-2.0;protocol=https
            file://CVE-2023-40181.patch \
            file://CVE-2023-40569.patch \
            file://CVE-2023-40589.patch \
+           file://CVE-2024-22211.patch \
            "
 
 S = "${WORKDIR}/git"

