Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7AD9C44502
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 13:05:15 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.173946.1783429508915557379
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Jul 2026 06:05:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=gEuc0oQo;
 spf=pass (domain: konsulko.com, ip: 209.85.221.45, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-472326ca506so2789386f8f.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Jul 2026 06:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1783429507; x=1784034307; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FREEToe3AREJYfEWUIiv/++ZMCZGGBhXf8xuBYg+LM0=;
        b=gEuc0oQoJ32U5tQjjT2SWCBeAtaVYZF4JvYZ3BfkYwo6+10rQ899xjg6PLzkil8/+A
         au7PwQu56JMrkLULsWrBFmguaoZ/kTvARrqtuEOGBVkgQRA1yBwhDlxZdRHBficbrNY2
         J+NhXdogieM5+XkuOY3TwjAt93Zcx+CfbNMCk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783429507; x=1784034307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FREEToe3AREJYfEWUIiv/++ZMCZGGBhXf8xuBYg+LM0=;
        b=fhHb5oAEVA0zUETVFQTIFhRXHvdJ6B2r8Ub4V0sBk+B/1uI912foAy+thHq+cCvLLO
         s2UPxir/Zsq8mAsW1TurMP0yBKJo2r0XO2hgVBK1Fu6oVLqaSn/hyYmqbUqq7FS9hkeU
         Ve+N8yQcY9tQmFDny7mKLpR6mXzXnkgmC0Ap0CU9LUHwd7IQI/LuNtstDiV4v83Z9K87
         8lfZcEPoesZQIj6TiMD0SK9im1L4SP6HFP4rVgBE8Nrz4TuWscq21nSi4U5GOQGpamNF
         ftX6YR25fE4hxHCT3IPuN8n8REu578WAI7T9ju6ugQv6xW8J0XAd7SjlZEUFFNJweDkA
         E6zQ==
X-Gm-Message-State: AOJu0YywdwqUFB7YD1YGZhU6VxyF/5QeUS98TOshIDemdE7cSFr3kC6G
	z1eBXI69fFqvsFLQh7OGW2XnAHm4ck8Ql7Erbri8/Rh4B9Ch3L+mMBaWlFycF/JxOZPBalY5awf
	RSS4L
X-Gm-Gg: AfdE7ckNszgkEvpuFJIBHnnXF8P9+GBRDOZcJuFdbABy8ExrOE5tJuR2Y2dwvPjVsLz
	7b2zbi/KEH9Ls/04tNJ8zd3CZTbSeaCiLOJ8JkqhrcTSaAVxahvfzbbcVnPUDD+VHRT67kTFAUY
	z5dPn4YOh1Wsq9S6Ar+5dEhBBDCtgImBgebfPLRTjF43CIlWu2kTpy0iKvTTtlvHE48/mKMoqua
	zZ5NdaZ4Zb8FXDBmhScH7clM8I3AUY8+UB6JLewQJ92uehP/4kmOBx5ew50AM65c203vOdBkV9t
	b3O8g5NKXnL85RYb/zWoMeSIwN2DxVs1ajNFPMegSH72YLOMqb/9YJ9DXMhK28lXwF/49dUyNT0
	wDJlUyiyoScxDuXErMciZYLduVU8u5Q3/dqW67g5p80ObF7Jy8SiZGwtHFD6WEsQu+g/mnR5F+l
	v6Pri+eFcDt+u/Q747nYE24dRNuboWEXKfCr4n28FfR9cTdp/coX3nlAAh4w6CEtuq/zWS/4ntK
	S1mfrEy6ei4KKSafCvMp8nmXaORYNY6QKTmUTSyTw==
X-Received: by 2002:a05:6000:118f:b0:475:f0f0:9ef6 with SMTP id ffacd0b85a97d-47de66c198bmr4193803f8f.59.1783429507059;
        Tue, 07 Jul 2026 06:05:07 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1d8f1sm33986385f8f.3.2026.07.07.06.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 06:05:06 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/4] python3-flaky: Add recipe
Date: Tue,  7 Jul 2026 16:04:59 +0300
Message-ID: <20260707130500.888218-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260707130500.888218-1-leon.anavi@konsulko.com>
References: <20260707130500.888218-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Jul 2026 13:05:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128063

Add a new recipe for flaky, plugin for pytest that automatically
reruns flaky tests. It is required by pycurl tests.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../recipes-devtools/python/python3-flaky_3.8.1.bb  | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-flaky_3.8.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-flaky_3.8.1.bb b/meta-python/recipes-devtools/python/python3-flaky_3.8.1.bb
new file mode 100644
index 0000000000..bfe63607fc
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-flaky_3.8.1.bb
@@ -0,0 +1,13 @@
+DESCRIPTION = "Plugin for pytest that automatically reruns flaky tests."
+HOMEPAGE = "https://github.com/box/flaky"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=55c52d858ecd501c970ad04d2c70ebc6"
+
+SRC_URI[sha256sum] = "47204a81ec905f3d5acfbd61daeabcada8f9d4031616d9bcb0618461729699f5"
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN} += " \
+    python3-pytest \
+"
-- 
2.47.3


