Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 010A3CCD18F
	for <webhook@archiver.kernel.org>; Sat, 11 Oct 2025 18:13:55 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.5329.1760206426108712448
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Oct 2025 11:13:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OCFaTzzS;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b457d93c155so488349966b.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 11 Oct 2025 11:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760206424; x=1760811224; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ebpW82crAAE3v6v4cuuQyMX6flG29X6wYy9u14mckW8=;
        b=OCFaTzzS69+sXVFMXrSisz7HfcCwAexyLyuch0Ln8el/1XTvRcsbQ6BBDWR0zdkzHh
         wfV6Tj+h2fF2KYexw0qMvh6Mf/XAxEUt0zc051oqqAfpNU1bSWiw05tQs0axj/U0J8GN
         XyrnK2d+EOgN6jiIGx8/ax+0Wc2JVtWA30BJ8a506wLB97y4kHJfHilD28wpky0yja5R
         A0wQrdur4TKGgH6+OksZ5wvIfC0UiXQOOpP+vsEQQCUpRtW2fi3JE+FB7zo6w5UrllxE
         0HJLGsLE3g1q08S+O+I/JXdzkmQMc/fir8IqGaP9rSmR3O+WySeHO31C3IMktIJ6OGzx
         1dcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760206424; x=1760811224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ebpW82crAAE3v6v4cuuQyMX6flG29X6wYy9u14mckW8=;
        b=BhcyR4acomZCrIWa6EP6nGe8MNvsgV2gVVEO+WynveqlAOb7Eqk7nYRL8bjrnFnrQ0
         2oIa4LIJGb70whDZym7y2KPLZSIdadVzGkPCLtJ+nrpD7z2KXtxi0SJKzpiyXxALK05n
         PDulduY6G+Bi8v/8B2X/Xw+AK7KmmqC08o7CWa4qYefcA4QaSOdcSPYoEqQKvrabmCZv
         Kxkw7T8o9IaD9lfCiJQjNDlX4Nkx/KRzeyDCilX9WpRAAjXwbWMtzXAAJE4y8CnXWZJl
         4qE+Wr+zHoAl6FSOAG7gk/zgGNKNmiEYlWshoW+O7n0As4Anbx89z1tp3cpHE6oVlY00
         o+QA==
X-Gm-Message-State: AOJu0YxYo/PiGKCVtw/eGIhdfaJVCNjJtrWyNSnySgunmPEHZ7rXDchH
	4qNMpTLdvXn2aOi7tPUwTN1ipOD3cFEPH14+UAuUlXu264KgiLePG4v13Pqttg==
X-Gm-Gg: ASbGncuafycYEMtROQgJRP7KHL8qQ+k/BNqNsrINTtjSSznH4kgDqS0e40k13W658Y5
	2YSGdYL3hSXA+JJffOkbiw5G/DmZxVpG6kbQXav/o2eso9YYVuhN9ksg90n6zdLIOegUTS5PU25
	24lsjSGoQfR9w51W6Cs3M/BwaMOtE7wu/7CN5KkgA5CMxVNgK5w/ERLu9BgARQMAq7n8lVVMd3v
	9lYpQx2+7tRlJYqwzzbtTezJ1WH8xYJQJckxgR/3TMUyyPDmMEKglWlacqthAncPyV4TKKnkmA4
	fAqms01A7KNoIHC1WRJr0LLr8klm74KV1b979FUVcZIu5Ya88AfyyZqRZn1e8AnlILGJJDQHvm8
	DFAfAnkPx62OORKpG3PkJYpgLSGmkDcj0HjXqlBW0WVaYGlyxxw==
X-Google-Smtp-Source: AGHT+IFejdL3A6csGUr91QLQejVG4VOU5MHX14MtNqn7mR3PL9BOrg9lMMnYupwIFqhoO2b5W6oG/Q==
X-Received: by 2002:a17:906:c113:b0:b29:e717:f0b0 with SMTP id a640c23a62f3a-b50ac4d3497mr1688860266b.59.1760206424414;
        Sat, 11 Oct 2025 11:13:44 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d5cad8adsm547156166b.7.2025.10.11.11.13.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 11:13:44 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 07/10] freerdp3: patch CVE-2025-32659
Date: Sat, 11 Oct 2025 20:13:36 +0200
Message-ID: <20251011181339.2127670-7-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251011181339.2127670-1-skandigraun@gmail.com>
References: <20251011181339.2127670-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Oct 2025 18:13:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120506

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-32659

Pick the commit that mentioned in the above CVE report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../freerdp/freerdp3/CVE-2024-32659.patch     | 27 +++++++++++++++++++
 .../recipes-support/freerdp/freerdp3_3.4.0.bb |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2024-32659.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp3/CVE-2024-32659.patch b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2024-32659.patch
new file mode 100644
index 0000000000..25d2613cda
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2024-32659.patch
@@ -0,0 +1,27 @@
+From 47d18566159cefd714187e9b143a6ecbd1b13781 Mon Sep 17 00:00:00 2001
+From: akallabeth <akallabeth@posteo.net>
+Date: Sun, 21 Apr 2024 10:18:43 +0200
+Subject: [PATCH] fix out of bound read
+
+CVE: CVE-2024-32659
+Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/6430945ce003a5e24d454d8566f54aae1b6b617b]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ libfreerdp/codec/color.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/libfreerdp/codec/color.c b/libfreerdp/codec/color.c
+index 186d477c8..9aba6df65 100644
+--- a/libfreerdp/codec/color.c
++++ b/libfreerdp/codec/color.c
+@@ -847,6 +847,9 @@ BOOL freerdp_image_copy(BYTE* pDstData, DWORD DstFormat, UINT32 nDstStep, UINT32
+ 	if (!pDstData || !pSrcData)
+ 		return FALSE;
+ 
++	if ((nWidth == 0) || (nHeight == 0))
++		return TRUE;
++
+ 	if (nDstStep == 0)
+ 		nDstStep = nWidth * FreeRDPGetBytesPerPixel(DstFormat);
+ 
diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
index f71cc06ebd..8649e28ecb 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
@@ -15,6 +15,7 @@ SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=master;protocol=https \
            file://CVE-2024-32459.patch \
            file://CVE-2024-32460.patch \
            file://CVE-2024-32658.patch \
+           file://CVE-2024-32659.patch \
            "
 
 S = "${WORKDIR}/git"

