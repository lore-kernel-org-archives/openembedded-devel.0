Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8915DC5321C
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 07:45:24 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26370.1785138319033025678
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jul 2026 00:45:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=CHMy7hpz;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cedda2ce6fso19760935ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Jul 2026 00:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785138318; x=1785743118; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A/IhZgsx0aXJ7RhgSejxwsb4b3FydUzdeYNcmYNIG4A=;
        b=CHMy7hpz6qTTOMUwM8ajH6qyRVOUeptlnsZg4KGrpESVC34OiEfPrZGJHbNPcimBxz
         3lPO5ATLABxhn2rsc31TThTjyQBEglYcUh1OEo4KgQiXo8h4VSq5d/VyAXnE2W+j3od/
         vR8OJMBOk+ri7sbAXPW1HmmxIfo7HQadcDO+yaxNBPwSAPshyC/7v21TFsospgEs4ggr
         NEnLJMo2HgMkQaGDxx5QgVKyzzkEz+N9G2LAHzH2OPJvLPMNXLyNvU4dtSkk7JLAgfgk
         VLpemWOa5HUK7b4kIZu85qnN3IR+dHI5n10LP46j+mf14zjueXnVTWjOhzWGp0bVTUXU
         OkkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785138318; x=1785743118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A/IhZgsx0aXJ7RhgSejxwsb4b3FydUzdeYNcmYNIG4A=;
        b=JHxiP6P9pPssZzbaJ3eCpbVucZd17iZxetOS/5TOqIQXI7kURp8Akcvu+J6dhHCJ6t
         3UBLpF3fmg5dvdAaZbEtTQgn4EF1RSZe/+2a9rBRVvfkAPgiK87teY9foSFj6P70Ins0
         KxOesEbQmjeGu01J8G2mey5qowe2Tc6xLG/WAXa2spF946z8yT55Aua0X5mhhL0uGdLv
         cDtrP1DDD4SpHB38BZ9X2V12rHiP+TsWaGv+rgcFYozd7vTIlCcROjomlLWi0Xbj7Es2
         NDLpGQ6gI1DCQeLHfrB2wUAUYpSib68L+2XIANb2m6SZ0qb+l/5+Xjnz+i2Ih9LPl+/4
         Himw==
X-Gm-Message-State: AOJu0YyWj/1KqtsgAc2/4iGWAkbdEdmMSdWcz5u0UQ8RhKzcMt2dS48D
	apCyLiRrpYzOCdOa4lDCP44neC0pS4Ai16HDHgTY6pVTgPG1rVjn/uk5Cg0Mpw==
X-Gm-Gg: AR+sD10xZR9cnRjgImiaYZjuNQiuqpJhunoKvXSP1TqwsjP/kpTgHCL/QwX7NhHBcNe
	yD5ARQz02V4OCWmzdeuyxLMQwMdDHe5DzaUIyw4dndQOFhbB2KtzAVleFAvvum1SWh5zfxHZIDh
	Q7ee8GyIgoo0cLOZcDF1xn1sYTgcOkfhvmP+UcnvjdHqTvJOZFbAGl/R/g4UX+JIVVu6osQ32nf
	90v/6u0yJzUhEx4KS2dJFQS6H54+3p7egNXlMMdTgfCHQghdLxpy7OH6BPt3ZnP05EzYB1na3ap
	sAgUfZ6BCxrS6/Hqjveeer0z10M/EgJEhqzuxDN8UkRQs4J7Fd9VHdSuP239CI0Ex91tI+Vj4lk
	3KM5uzW/478RXrwYKkgIK6GMiEKL8oQ4wmh0KeL3Uw/U2kU3FH4PXV9OuhrKT3wGIqOGPpqLdn6
	+IkkPCg2gHm1GLfR0=
X-Received: by 2002:a17:903:3bac:b0:2cf:9f0b:b562 with SMTP id d9443c01a7336-2cfde8459e1mr71318085ad.22.1785138318345;
        Mon, 27 Jul 2026 00:45:18 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cffa9243fcsm8648945ad.64.2026.07.27.00.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 00:45:18 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 5/6] xrdp: upgrade 0.10.6 -> 0.10.6.1
Date: Mon, 27 Jul 2026 19:45:00 +1200
Message-ID: <20260727074501.3707659-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260727074501.3707659-1-ankur.tyagi85@gmail.com>
References: <20260727074501.3707659-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Jul 2026 07:45:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128459

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Release Note:
https://github.com/neutrinolabs/xrdp/releases/tag/v0.10.6.1

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-support/xrdp/{xrdp_0.10.6.bb => xrdp_0.10.6.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/xrdp/{xrdp_0.10.6.bb => xrdp_0.10.6.1.bb} (98%)

diff --git a/meta-oe/recipes-support/xrdp/xrdp_0.10.6.bb b/meta-oe/recipes-support/xrdp/xrdp_0.10.6.1.bb
similarity index 98%
rename from meta-oe/recipes-support/xrdp/xrdp_0.10.6.bb
rename to meta-oe/recipes-support/xrdp/xrdp_0.10.6.1.bb
index 152b37cb37..396d769d1f 100644
--- a/meta-oe/recipes-support/xrdp/xrdp_0.10.6.bb
+++ b/meta-oe/recipes-support/xrdp/xrdp_0.10.6.1.bb
@@ -17,7 +17,7 @@ SRC_URI = "https://github.com/neutrinolabs/${BPN}/releases/download/v${PV}/${BPN
            file://0001-arch-Define-NO_NEED_ALIGN-on-ppc64.patch \
            file://0001-mark-count-with-unused-attribute.patch \
            "
-SRC_URI[sha256sum] = "dfc21d5d603b642cf583987b36706b685bf05fd3aaaaacefb8f57c5f4a448677"
+SRC_URI[sha256sum] = "2f7beb5a3b2529c8d72dc0df9b8cdca31ab0e0c14d1e3421210f5e6ec0ab3b75"
 
 UPSTREAM_CHECK_URI = "https://github.com/neutrinolabs/xrdp/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"

