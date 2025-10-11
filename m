Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E76E2CCD18E
	for <webhook@archiver.kernel.org>; Sat, 11 Oct 2025 18:13:54 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.5332.1760206428004794369
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Oct 2025 11:13:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TmjFdhVf;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b4736e043f9so458369966b.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 11 Oct 2025 11:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760206426; x=1760811226; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RSCNqbYNcy5I9GJpvGhix3pre8c7VxMEqLs8f/wFX2c=;
        b=TmjFdhVfZYPqjjZR/CB+8bz8+3h5fX3X+/m6t5nMrIUAzExawQjAdigFmg+Cz2sP8B
         /X9T4n/W8tXTPaCDREC+4ZQVVw/tTUITHOXCNROoz0mxIytr8pJNuzXCuuhHXR0gaz81
         Dl0stkuYAIBiecLLcid6BIoynp5bknWcVtwG2keSwq5GdOKnoxsKyYwEykTbHptloJ4O
         tts2MAUuiMyHkZM4hEIvfWf9YTXKmN2H2ZeZ368N98p6YcmEmGVH2jm9wan/PB2S8sSa
         TNw+3qM/aW4NbMlpSzJ1miMJUq8o1cedsFTbs23NZUs4SZ8o3aMyVRfkx59sdqLdpOr7
         +S2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760206426; x=1760811226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RSCNqbYNcy5I9GJpvGhix3pre8c7VxMEqLs8f/wFX2c=;
        b=mUnLXylRU+5dfKuGE9RuYt/YgEdB2LvUaaKG9mfXqmgzz5Txo678kr1db3i8meH5Ld
         wxfojml2Og0+DCpEOrWqHwhKCD+d9ssYlmX7g1FMX8KGHhuE9wNASuxDNEC1iZn2QO2s
         RCNLz5c2LlPMTamVHmYJzCEX5+yaSo690d/9j1b3T8KPexgMhEUipshwvcle6aOEr9yJ
         jbrqzMm1FP7d77NCAwJihUFvb4w1P+O6NT8JkpHqWr/mB1bUtMEFz9vhrNxcsKw/P3U0
         yKPBCJ+MEpZQqKTCBmvbSre8L21D/KRIBLk7Nk7LELaDduxKpjfwzmEj1O2jA4qqzXRG
         RK/Q==
X-Gm-Message-State: AOJu0YzC0Iz8CvNglPJM9HOq3+QgWIO44rUtsATA5CuDW9xKOKqwp1Wx
	pB9cksmWmxZ4lpbhAKGc1KZ0fy6F8akKv/5zzyEMvgrNsTF2/DJjAJezlF+6KA==
X-Gm-Gg: ASbGnctIOvc1PGhnAtsPI7JWmBMX8HU3QeeHjm3wXvXLsvvylpqC+9Q/62gv1KoZhCA
	dI0qJAh/Hlgog6E5WdFNcmTFNM58WE3LZhmoSFXkij3qV+aTse15k82dhPQTh+onAB2z21+1W0T
	24rJIbYjU9Z7g6FXcWA1UxIt/cdhWLgKkdVZ/8A+x1XfFKaSzwucOdN4h8E+0e9GjHoAk+QtT3d
	oeX0tnkOmB8ipixNYwH+wld4WT2FITkWBYJ+SlrkM7NikumHfYgu4JS2HMSEZY76Pzb9ROL74Ak
	qcuQMQWYHAEe2m9LgayP0Kkfl/Wki+7l6QnZKcbo+thfftme8UlGN3bH4MzG5QV179boYlbBonx
	2SJbHTxu5jVn7ct9BJ5UDC+/Bn2Sot+dGFjqBI3slzvZUvPmW7lKwW9LvTgEU
X-Google-Smtp-Source: AGHT+IE/K3hV+tvsBLftFqV//B6F22FD4fLEVtuwjqUes8Te2D5L1N6cw7N7nvv78Ji35MRhPtraCA==
X-Received: by 2002:a17:906:6a1d:b0:b3e:9868:17b with SMTP id a640c23a62f3a-b50aa9a24efmr1813712266b.19.1760206426287;
        Sat, 11 Oct 2025 11:13:46 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d5cad8adsm547156166b.7.2025.10.11.11.13.45
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 11:13:45 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 10/10] freerdp3: patch CVE-2024-32662
Date: Sat, 11 Oct 2025 20:13:39 +0200
Message-ID: <20251011181339.2127670-10-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251011181339.2127670-1-skandigraun@gmail.com>
References: <20251011181339.2127670-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Oct 2025 18:13:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120509

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-32662

Pick the patch that is mentioned in the above vulnerability report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../freerdp/freerdp3/CVE-2024-32662.patch     | 28 +++++++++++++++++++
 .../recipes-support/freerdp/freerdp3_3.4.0.bb |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2024-32662.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp3/CVE-2024-32662.patch b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2024-32662.patch
new file mode 100644
index 0000000000..adf7d9e175
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2024-32662.patch
@@ -0,0 +1,28 @@
+From 950d2f039021c6fd8d476c08f10269c61bd1701e Mon Sep 17 00:00:00 2001
+From: akallabeth <akallabeth@posteo.net>
+Date: Mon, 22 Apr 2024 09:27:27 +0200
+Subject: [PATCH] fix length of redirection strings
+
+length field is in bytes, when converting from UCS-2 use size in WCHAR
+
+CVE: CVE-2024-32662
+Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/626d10a94a88565d957ddc30768ed08b320049a7]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ libfreerdp/core/redirection.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libfreerdp/core/redirection.c b/libfreerdp/core/redirection.c
+index 8538a9056..5343a071c 100644
+--- a/libfreerdp/core/redirection.c
++++ b/libfreerdp/core/redirection.c
+@@ -243,7 +243,7 @@ static BOOL rdp_redirection_read_base64_wchar(UINT32 flag, wStream* s, UINT32* p
+ 	const WCHAR* wchar = (const WCHAR*)ptr;
+ 
+ 	size_t utf8_len = 0;
+-	char* utf8 = ConvertWCharNToUtf8Alloc(wchar, *pLength, &utf8_len);
++	char* utf8 = ConvertWCharNToUtf8Alloc(wchar, *pLength / sizeof(WCHAR), &utf8_len);
+ 	if (!utf8)
+ 		goto fail;
+ 
diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
index 509bb80956..a272ba0ecb 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
@@ -18,6 +18,7 @@ SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=master;protocol=https \
            file://CVE-2024-32659.patch \
            file://CVE-2024-32660.patch \
            file://CVE-2024-32661.patch \
+           file://CVE-2024-32662.patch \
            "
 
 S = "${WORKDIR}/git"

