Return-Path: <kelefa.sane@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9245DC369AB
	for <webhook@archiver.kernel.org>; Fri, 18 Apr 2025 15:18:31 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.14087.1744989510018060968
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Apr 2025 08:18:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=rei0b9xw;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: kelefa.sane@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so14514815e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Apr 2025 08:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1744989508; x=1745594308; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ox2oF8SWIt6OylawNipJf+g02GpNhF/k3SLifA4W9qo=;
        b=rei0b9xwWy0knJScOEJqprLKTyxXm9Ge/s0JtsUDpxixe8V13SHAz5IfmQC5zyYQtu
         CrKwDkEF/BtkfwTk5WGv7MuUP01slAlnBo7gBwF6JsgZMf4BqEVryysBk8sX91sTNBjr
         wnWAdVgUFhNtLV42UcaG6ir2pC2xjgVnf7K9E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744989508; x=1745594308;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ox2oF8SWIt6OylawNipJf+g02GpNhF/k3SLifA4W9qo=;
        b=q8ixfvnSKen4wXfX5mA7k54UcNKDdGOkU68/K/SrcZOSL71l5R6r/UVwddM2iclnN6
         RoDZn4NZtPcOVLBP164/s3sJrtYtB9w0garmQMArtCVbPvPcUJ7kPDu+9ljxoVSpD03X
         itIAhWwncT9PEeprjeiUWijQUP9DpzG/PZMlmqZvmiZEqvWg2Fg/hAjSriWTvZLJd09G
         wictRmFkbeuOJ7ij387Jbx9dcE3pUvU/bP03dS+A1M/vVhdFyyyHdTPay4H3wLMTRIIW
         6TwtTGw56yvhZo0GIoue3L6jyVu8cvRMYeRx6YmxpvsFbVAcJHRl7KgAchW/hkOpYIFi
         h7RQ==
X-Gm-Message-State: AOJu0YwGyyYm3rUknAeKltDuyM28ZgfrWX+2h6FjTOoiQYiVIgKWhYzy
	1xQbwLZ+OsF79utu+3l/WRGGivUqLsR1DPFLlCsjD4zwogygZQUORFF4zZm/01QydPhNycQKP1O
	I
X-Gm-Gg: ASbGncsduuC6OMrci+xmrr2NqXteFNolGqCBkxmCWY0PSMP5Xg/UH/2mt1qb69iYs/P
	cU14ASmHRhZ2P5aMS7L7cwx9p6+qwo1itCpLkhCiF5rCRMo36Ycfx8OhBTkgWSmimTrN5RBtKkS
	qEnQBclabku+zpFnKHQU5nCZqzpzUtw8/23seRrWd+yBEAw6IYzV9UfBMxmIceeV+6SZbw35M6z
	P2/V0VNjbXYcMdtEDxZ8T2VxqMVVCiPjY6A77rxVQcLXvPYKXD4JQHC8qktfzegt1X2JxMNpL73
	kVW6VkYG/O0oyYt2Y9RrR71IpjB5DuCQl4yLDzB2Nal6XD5urr3YTIOa22rBkcXENwiIgrOe7Pp
	xVBEoCdEsKFGCmnAcZ5pbVOmRR0BT339XDAj56MApUUI=
X-Google-Smtp-Source: AGHT+IGNTVxAazgH2/AwDdDIYxVhbljXLiTy5WiDopdk8aVuzX/d+Q7zDt017BdlAvoRJSmAbzJ/pg==
X-Received: by 2002:a05:600c:46c6:b0:43d:b3:f95 with SMTP id 5b1f17b1804b1-4406ac0fb4amr17432375e9.28.1744989508279;
        Fri, 18 Apr 2025 08:18:28 -0700 (PDT)
Received: from FRSMI24-OUB.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d6e034csm25431085e9.39.2025.04.18.08.18.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 08:18:28 -0700 (PDT)
From: kelefa.sane@smile.fr
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?K=C3=A9l=C3=A9fa=20San=C3=A9?= <kelefa.sane@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-oe][PATCH] Reproducilibility: Remove boinc-client-dev package from non reproducible list
Date: Fri, 18 Apr 2025 17:18:16 +0200
Message-ID: <20250418151816.2742749-1-kelefa.sane@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Apr 2025 15:18:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116970

From: Kéléfa Sané <kelefa.sane@smile.fr>

Last modification on boinc-client recipe (see commit "boinc-client: Fix
contains reference to TMPDIR [buildpaths] warning"
3e38af7e8b0e5e22ab4159c2146ce95e0fa41a3f) fix the repoducibility issue,
with a do_install:append task which remove the build path present in the
header source file svn_version.h.

Signed-off-by: Kéléfa Sané <kelefa.sane@smile.fr>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-oe/conf/include/non-repro-meta-oe.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/conf/include/non-repro-meta-oe.inc b/meta-oe/conf/include/non-repro-meta-oe.inc
index c8c628eea..b8b5adf45 100755
--- a/meta-oe/conf/include/non-repro-meta-oe.inc
+++ b/meta-oe/conf/include/non-repro-meta-oe.inc
@@ -4,7 +4,6 @@ KNOWN_NON_REPRO_META_OE = " \
     asio-dbg \
     asio-ptest \
     asio-src \
-    boinc-client-dev \
     cjson-ptest \
     cpuid-doc \
     crash \

