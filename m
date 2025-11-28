Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D198D116FA
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 20:19:01 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3266.1764361136697101449
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Nov 2025 12:18:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lHbpWJ6E;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-477a1c28778so25001415e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 Nov 2025 12:18:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764361135; x=1764965935; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z6t33wsB2GdLyDKrVh+WtObHT2P+HWnuP0+mfGiSy18=;
        b=lHbpWJ6Efbdd6AdUDI93I1io1OGHsLprGSM9kL+91L5SvpfORN5zmLd7bCVpGNPMTL
         +3x5pqms5GQSJDPt5cBbkdyMiH61SsKHF+oM0tf/PtP/LFS9fBWgB52rXcqrV86zzPUv
         6FzQ8eTGVP/vU4eqZg/AYzQ855HJ8N/3oFTQt/WRNTCI9tgWQX3z5xkygADAdo5CdzKe
         90kxhcl3px16RLMUuVvQeeNXb9Fz+cy7U5+SUw/9TIATRpjAJQjrnlqVYVGF0ELLGw6t
         YLSlz8n3AMaNfcgFlAnMePgMcIhTdEVmwIpqyDwg4hnPPGywsElMW9mnumklxOADrWsm
         +SPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764361135; x=1764965935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z6t33wsB2GdLyDKrVh+WtObHT2P+HWnuP0+mfGiSy18=;
        b=sPx0eNdYSEfGnMJnmKpqYhiPaYLrjGwdMOqOr6SrceEaolRvVXecYy+QTzj7e5GvKE
         2d7fD+0TZyk0o6yvgimclKd7xEY45eDo/hmdX1o5pYjLEH8+EALj0AJ8bMaO50CNthk3
         J43JzTtqlVhvSVDZBVENtsesRc5Cj8bqUF0QPjzJ13lxcQw22b/q+SPoZQPVHHCR/8U9
         1a98FFiqH0bkjxGumWWiQ4Slq4/on47e4paLBScTv/CzXUH004DkcEjns+N8kDqRN84+
         zsqHBHsbnR6a0eluodt7odOxihfQXubcfEhjkLgSdmkK8/qz/+1VM84Qe7xQlNzuOCpH
         Hx3Q==
X-Gm-Message-State: AOJu0YyUPbj5wgI4tPUXT3qcC0pdbS36Zt39dmq5DYZ4rdSgpA8nG2Mc
	7LBV3rUs1gLAmzM4Llp+tYWWo55FAsD0vn+lRiGq170B0odu00bHuMWUCjoNyw==
X-Gm-Gg: ASbGncu3PPi+DUg+I2njR1+ryViUpb9VV3c8Ow1MaRTn7JpdQLEgTkIfb7t4NWMiKwq
	WUc/P6aLNjBsFj//mr1goKEif87oI6yFMoxFSwSNdmJBeeWQw+O5LWuxm9CUat2wxgEkZM2SHnL
	uaOnMKk8yHWMpv7NzCskHD/86Zgmt1k4pJ57rL4ysOOKo8LOVTD+u/lZs01XlD8RaeFB2ejvukL
	Oai25PE7dbRuNkU1ioXyxXVVFzY3GZ+Qi5hmrQ7vPWLzW/1ZElFD6w4s0Pz1dEcqQTvhv6ls8k/
	zzwdfLz5Rp/WwMw4cG3ZOixsK2h2GEeucXLyg2M1iV5qdySOcYo12uS6fqhyZ5EB3kXVjsIymJf
	rPTdO0nv3rouqcSCMjUbyoPkFY09t8y5Kv3q0FcVLIMkifj5m4O1G2E/GN+1x+c3pB9vIe5SQqV
	OISPvl2+Vo
X-Google-Smtp-Source: AGHT+IERuBsLkprO4LYjrBB5z+bMmrdTyfpwg/7o55OFVJC6+cTyJWsvVsttMxndCUEptAVPMlQ1vA==
X-Received: by 2002:a05:600c:3b1a:b0:45d:d1a3:ba6a with SMTP id 5b1f17b1804b1-47904b29e28mr160211435e9.33.1764361134852;
        Fri, 28 Nov 2025 12:18:54 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5d6064sm11674324f8f.13.2025.11.28.12.18.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 12:18:54 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 14/14] libraw: patch CVE-2025-43964
Date: Fri, 28 Nov 2025 21:18:45 +0100
Message-ID: <20251128201845.2578315-14-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251128201845.2578315-1-skandigraun@gmail.com>
References: <20251128201845.2578315-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Nov 2025 20:19:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122146

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-43964

Pick the patch that is referenced by the nvd report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../libraw/libraw/CVE-2025-43964.patch        | 25 +++++++++++++++++++
 .../recipes-support/libraw/libraw_0.20.2.bb   |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta-oe/recipes-support/libraw/libraw/CVE-2025-43964.patch

diff --git a/meta-oe/recipes-support/libraw/libraw/CVE-2025-43964.patch b/meta-oe/recipes-support/libraw/libraw/CVE-2025-43964.patch
new file mode 100644
index 0000000000..592c2d5ea1
--- /dev/null
+++ b/meta-oe/recipes-support/libraw/libraw/CVE-2025-43964.patch
@@ -0,0 +1,25 @@
+From 0e068c2826ca6a70973ec2a75d05bc95b11e4977 Mon Sep 17 00:00:00 2001
+From: Alex Tutubalin <lexa@lexa.ru>
+Date: Sun, 2 Mar 2025 11:35:43 +0300
+Subject: [PATCH] additional checks in PhaseOne correction tag 0x412 processing
+
+CVE: CVE-2025-43964
+Upstream-Status: Backport [https://github.com/LibRaw/LibRaw/commit/a50dc3f1127d2e37a9b39f57ad9bb2ebb60f18c0]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/decoders/load_mfbacks.cpp | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/decoders/load_mfbacks.cpp b/src/decoders/load_mfbacks.cpp
+index 00a9bc1e..8ba791c6 100644
+--- a/src/decoders/load_mfbacks.cpp
++++ b/src/decoders/load_mfbacks.cpp
+@@ -336,6 +336,8 @@ int LibRaw::phase_one_correct()
+       unsigned w0 = head[1] * head[3], w1 = head[2] * head[4];
+       if (w0 > 10240000 || w1 > 10240000)
+         throw LIBRAW_EXCEPTION_ALLOC;
++      if (w0 < 1 || w1 < 1)
++         throw LIBRAW_EXCEPTION_IO_CORRUPT;
+       yval[0] = (float *)calloc(head[1] * head[3] + head[2] * head[4], 6);
+       merror(yval[0], "phase_one_correct()");
+       yval[1] = (float *)(yval[0] + head[1] * head[3]);
diff --git a/meta-oe/recipes-support/libraw/libraw_0.20.2.bb b/meta-oe/recipes-support/libraw/libraw_0.20.2.bb
index 8d82d3a49c..3ac2d3e795 100644
--- a/meta-oe/recipes-support/libraw/libraw_0.20.2.bb
+++ b/meta-oe/recipes-support/libraw/libraw_0.20.2.bb
@@ -6,6 +6,7 @@ SRC_URI = "git://github.com/LibRaw/LibRaw.git;branch=master;protocol=https \
            file://CVE-2023-1729.patch \
            file://CVE-2025-43961-43962.patch \
            file://CVE-2025-43963.patch \
+           file://CVE-2025-43964.patch \
            "
 SRCREV = "0209b6a2caec189e6d1a9b21c10e9e49f46e5a92"
 S = "${WORKDIR}/git"

