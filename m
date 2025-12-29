Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45E3AE9272C
	for <webhook@archiver.kernel.org>; Mon, 29 Dec 2025 14:52:13 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44450.1767019925770741083
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Dec 2025 06:52:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PN7VlROu;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47a95efd2ceso83304365e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Dec 2025 06:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767019924; x=1767624724; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vGbGuyRnv+N9vvVvX734ikIdFxrUDGszpQCnMIr8oZI=;
        b=PN7VlROu6z5y/98AI1C5CqfcF5uwxc6VetavcSsNDnItVk/XV5FqseVRMDm4ubz2vs
         alChydQweqqH06Kneiy67sP42x3uv+vBc98mIwQWtOlXMT5UKY1a7n/C7GawyfP3zbOl
         pAqld7+ZrTGekqj5MAJHD2FnS3SAzaCDXIkOocB2l63SUHv6Loz8jCUMQoSMLgQicLjk
         N1V0x7Ij8aNlQMwAOybsipzfZ56vTtEGWIUtBqv58RqmBYOP/x0hmkRNIhYMY4COYwnI
         aswEF8+Cx45RrRAO4PDb17lcXa+DFnI1FvUo1mq8GdzXt9WkAUpEykY7PdAABNRky+lk
         HMRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767019924; x=1767624724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vGbGuyRnv+N9vvVvX734ikIdFxrUDGszpQCnMIr8oZI=;
        b=RnFHfVcnrKWBjwuAiM9zuzM4UGIMO7Iz4z7zw8AXedB7qjGjq+pIBWbHMubgT8slAk
         3k/LZE7DNSMpiO2h02Km1Lq9vO3K1dzNRJOyl32k7Tn8Z5isJg7MBoCnLJzTiB8pznwg
         nF2+gaSuC1dlZGiQllAj+8SIAt4VN955jq8QhpENJlopvRHEo9oeaO7tT5FwqUGSTW0m
         HEeFyLxNeWYAvT+Q6jfVR3pMcxI03SmE4pb9kKK+jNhSYndaq+d1X/9fgDmHOpude8DG
         AdrrNu1LfDav2E7f4PFiEJOoEN8KWi+3KaSXE390zmFu79Wa2m3Cye3/PjaXRCb4cr45
         /s9A==
X-Gm-Message-State: AOJu0Yyh4zlnocPJJHRcK+HIJvApro0HuhnRfSvnIEIerYcks0ateoyq
	Rw22sm2kb/d/5kVy9VyxhSAhCwfQbi3lFix1p14uIofS80u1r5awXki72thZ+A==
X-Gm-Gg: AY/fxX67m4bDhPI6ZY0xczfaERBz4aR9wiSYvWIJTjY/N+Ur98os9kR841d7FCvZ2SV
	nV/tHhL9uOqwT8z++lwLU9sDdTw5uAmyPYE9KPGfzhtP6zI8qXY9CbzofI0lJFvB9QssUhISlcI
	LIBfHJIs6s73GQTaqIWUW0V0C0Jk7FiNn81oHeuomVnY8qdr0GElnyXZdNY7bYE6plVlFVsijPz
	9SrmePhqkXL7QnwlIP4uHlalOKDIdY/Z0wyWzHewZg4kE8GxKR3L4jKKfZUTJzzZRKV1s/8GMtD
	o3cojV35gqYbnv/xG5CMZQb7b4hqAhdnA6SRDR6pEaqrfV6Ox8Ou4Wpr/pFUFqgVILOiehw4ysL
	+LEKsyQrWWW2vcFPe6XmuzSg/d/BhPEXMJ4RJ76TZLhlfqfdkcy0ttLNyOJWgoZ5Y+7AcglIT+q
	u4Zn2vSOO4
X-Google-Smtp-Source: AGHT+IGy/b1o6ybWiMfPbywgAEg5n14Vov+H/Jx1VAdhEtcbSjwXAQgKgfWCk324PkuGXdk5musixQ==
X-Received: by 2002:a05:600c:4fc6:b0:477:755b:5587 with SMTP id 5b1f17b1804b1-47d1955b35fmr308231025e9.8.1767019919169;
        Mon, 29 Dec 2025 06:51:59 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1af20sm59449884f8f.2.2025.12.29.06.51.58
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 06:51:58 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 10/11] tigervnc: ignore CVE-2023-6478
Date: Mon, 29 Dec 2025 15:51:51 +0100
Message-ID: <20251229145152.489068-10-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229145152.489068-1-skandigraun@gmail.com>
References: <20251229145152.489068-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Dec 2025 14:52:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122990

Details: https://nvd.nist.gov/vuln/detail/CVE-2023-6478

TigerVNC compiles its own xserver, this is why this CVE is associated
with it - despite the vulnerability being in xserver.

The vulnerability was fixed by [1] (from the nvd report), which has been
backported[2] to the xserver version used by the recipe - so ignore the
CVE, since it's patched already.

[1]: https://gitlab.freedesktop.org/xorg/xserver/-/commit/14f480010a93ff962fef66a16412fafff81ad632
[2]: https://gitlab.freedesktop.org/xorg/xserver/-/commit/58e83c683950ac9e253ab05dd7a13a8368b70a3c

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 62a78f8ba7c8bd229cc82cf81bcc6a6d8116ebca)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb
index 4455050631..89704f421d 100644
--- a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb
+++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb
@@ -88,3 +88,4 @@ SYSTEMD_SERVICE:${PN} = "vncserver@.service"
 
 CVE_STATUS[CVE-2014-8241] = "fixed-version: The vulnerable code is not present in the used version (1.15.0)"
 CVE_STATUS[CVE-2023-6377] = "fixed-version: The vulnerable code is not present in the used xserver version (21.1.18)"
+CVE_STATUS[CVE-2023-6478] = "fixed-version: The vulnerable code is not present in the used xserver version (21.1.18)"

