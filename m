Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C46ED262B2
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 07:04:49 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6787.1768979084652458205
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Jan 2026 23:04:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WktW3Gao;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42fbc305914so4994360f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Jan 2026 23:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768979083; x=1769583883; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZzdoPiqrdPaIRIT+mbvy05zOV0r+rQV15o6F2LUccaU=;
        b=WktW3GaojS0gukwTDnDYHgqnc1oF9yZrrqI6o/qiGrwm+LrKhYfwLxRU0iV5L3elUF
         8rhadYNa9eQL0RzkMuV9j9MKH4WYowU5rZe/kuP1M8tD9zRLZAPI+zyO1qSKU6kY8MRM
         /aG109KIWiRBSg95/2P54xQl356clSkLjHCKNa+IEtmkyINj8G6Blly1SxD0le+wL5Rp
         HZpLiGI7lKIlXYK6DdDFGI9I3X4Enf/6uHX2+SaDE9o60goh/VeDx2RhPn1FgNXkrovF
         ZkzOlMH7C7J5n/zAtvgnsjx0ij/IjxwlatZoJXvq26jVq/EE8P5/PBQq9/QEaesxpla7
         Ys4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768979083; x=1769583883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZzdoPiqrdPaIRIT+mbvy05zOV0r+rQV15o6F2LUccaU=;
        b=Oh9WMEqyJMu02foISFWtuKVl+xe0D73WDxzBt5Z6Iz4KujeKu1DutV02ax2OhWNN4z
         WBqGF6vcTknD8OEVrxUJseh+2/q0D2A/a9L6Pcfm0kJ9ZOkmoroNnQJ+PmcUSDbK9Jaw
         9Wes++poAwFbbqqAqVGNoTBGaLgWI+MPDl61cTbIUyabXGwjX6z4FKHCfirT3UxZOutj
         5ayN9/rB7ukioo1PJMknTbvsgJ9WhyEzJkjiJGIFQcBaDR6sf6HCcVgoRi4JVeLndeou
         aX70/jrrmQCNPJI38hC5sM2REzeDwS5Bq6rpD1pMU57WWJHpd+nnLWnrCi+SrPk2u3XA
         SVvg==
X-Gm-Message-State: AOJu0YxUV+e4bQ/5vq3V9uLHKf5+p3aGW5iAAch0bkPpZIPsd1IAtxvu
	b1XCL/ud8l6zIcHxbDefuW6F0wR9wcyuadOx8iV1ti3LlmRnaAU+Tu5Z4Xbwfg==
X-Gm-Gg: AZuq6aIjQplce1eKpiqUYasJE2FFwpOKq9x7ZbZcF1kJE+xTIspBVAZbvGxiGov/+bn
	pSeLzjnVbQVbNDE1V5dPXf5jUalgKcztAurqbk9ueHgJ/gKMDRF5KrhtRAIGWj4PdnKDKVHfs3a
	UZgeG5mcezqhtPYnri8tKceKKXI3VYU51kqIgx1XNYBrhrf3LDDmrxKZ3QgFCj5udRG02nfzGOg
	OXU7TEFzY1P5DWdsC9sibuQrzGrfqVtj+a9nrPQROrVdtUtGo9D6CE4sKBmeiZGCRM5wiYEGhg5
	5t4T20wgw+YOFG99LEVz+pOSq2KUMwbLmJ6DplJZO1DaCNGrBbB804UUzAL11LGAHhl0djl6f9F
	ICPwPMeRp26AASXj/5LbOBSY/7XHNMPOnhyq2L3dytDgizaKBpZj+9QGDu9SE6JMVaBcbfjR+ew
	/X/k6HL4dc
X-Received: by 2002:a05:6000:4301:b0:430:f5ed:83d3 with SMTP id ffacd0b85a97d-4358fed1464mr6716127f8f.5.1768979082777;
        Tue, 20 Jan 2026 23:04:42 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356996dadbsm34106880f8f.21.2026.01.20.23.04.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 23:04:42 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 5/5] freerdp: patch CVE-2023-40569
Date: Wed, 21 Jan 2026 08:04:39 +0100
Message-ID: <20260121070439.1632875-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260121070439.1632875-1-skandigraun@gmail.com>
References: <20260121070439.1632875-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 07:04:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123688

Details: https://nvd.nist.gov/vuln/detail/CVE-2023-40569

Pick the patch that was identified[1] by Debian as the solution.

[1]: https://security-tracker.debian.org/tracker/CVE-2023-40569

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../freerdp/freerdp/CVE-2023-40569.patch      | 38 +++++++++++++++++++
 .../recipes-support/freerdp/freerdp_2.6.1.bb  |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp/CVE-2023-40569.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp/CVE-2023-40569.patch b/meta-oe/recipes-support/freerdp/freerdp/CVE-2023-40569.patch
new file mode 100644
index 0000000000..792c652307
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp/CVE-2023-40569.patch
@@ -0,0 +1,38 @@
+From acc25a2257a960c82adea14faf48730c9139811d Mon Sep 17 00:00:00 2001
+From: akallabeth <akallabeth@posteo.net>
+Date: Tue, 22 Aug 2023 15:05:20 +0200
+Subject: [PATCH] fix missing destination checks
+
+(cherry picked from commit ef7e0d60c207dae478952d795e74751d1516629d)
+
+CVE: CVE-2023-40569
+Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/23c3daeca1598393f8c93f563f7847a4d67919f1]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ libfreerdp/codec/progressive.c | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/libfreerdp/codec/progressive.c b/libfreerdp/codec/progressive.c
+index 60343b881..a30da6201 100644
+--- a/libfreerdp/codec/progressive.c
++++ b/libfreerdp/codec/progressive.c
+@@ -2425,11 +2425,17 @@ INT32 progressive_decompress_ex(PROGRESSIVE_CONTEXT* progressive, const BYTE* pS
+ 		for (j = 0; j < nbUpdateRects; j++)
+ 		{
+ 			const RECTANGLE_16* rect = &updateRects[j];
+-			const UINT32 nXSrc = rect->left - (nXDst + tile->x);
+-			const UINT32 nYSrc = rect->top - (nYDst + tile->y);
++			if (rect->left < updateRect.left)
++				goto fail;
++			const UINT32 nXSrc = rect->left - updateRect.left;
++			const UINT32 nYSrc = rect->top - updateRect.top;
+ 			const UINT32 width = rect->right - rect->left;
+ 			const UINT32 height = rect->bottom - rect->top;
+ 
++			if (rect->left + width > surface->width)
++				goto fail;
++			if (rect->top + height > surface->height)
++				goto fail;
+ 			if (!freerdp_image_copy(pDstData, DstFormat, nDstStep, rect->left, rect->top, width,
+ 			                        height, tile->data, progressive->format, tile->stride, nXSrc,
+ 			                        nYSrc, NULL, FREERDP_FLIP_NONE))
diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb b/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb
index b909f88310..205f7b0cd7 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb
@@ -26,6 +26,7 @@ SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=stable-2.0;protocol=https
            file://CVE-2023-39352.patch \
            file://CVE-2023-39353.patch \
            file://CVE-2023-40181.patch \
+           file://CVE-2023-40569.patch \
            "
 
 S = "${WORKDIR}/git"

