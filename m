Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEA3FC3ABB9
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 22:46:40 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.63980.1746485197068258817
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 May 2025 15:46:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XEsUwwbd;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-306b6ae4fb2so3987517a91.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 May 2025 15:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746485196; x=1747089996; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fNSn+pRT/0GM0fpZKUrSeBr1++3nRC9qHsOyVA5Uawo=;
        b=XEsUwwbd2aWwRG13kdCB8QoWnvvmvz6UswztKx0rgh6CyM7nIvKJ7PvDy9eRKYfML/
         iBk+ZmDxj2B+PPH5UdKAktHDdbWe6RuzKmvMXJ9BnCST8ypsxoknBkbPTn9jYVg4I0Vc
         mVfuo2vz4y9VCpT2qtPsZ+BQ/Uwb37LUIvaGvrOyfCk5P1H4oj+YL1HJCSFwGg99r/Rw
         lDXPzuEZYZBTBTLaMzHsDnDZR3n2YA4gbsdcQtgWQ2It5M838izDIiTcX3GGgmguTPLR
         0ng5K4kz/YixA8Bx+LdCNiqLYPVJHaI9qEMcMgNn9hDsr/h0RSdRtabQEhqpz8eB3nBN
         UK9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746485196; x=1747089996;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fNSn+pRT/0GM0fpZKUrSeBr1++3nRC9qHsOyVA5Uawo=;
        b=i/CebQLPAEvfW/z97/Al41QsLcTbJdH1u697CSwvianlXYi6a//O5T9q14T6IOePIg
         xZsc1BBpmXHVAOQS6B2aePJiNl05xvnl2+mtss2QImAFeaSDdpaZtKJ/2sRn8mXq4f2p
         0Do26dBonm7nYB1SHo3xqxbXNmJCpUyvwVhXow55lF41eJODJnwf9xs+OjQ88QyQeuUw
         wnhqTm+skNgUylYDD6uRhUmeXyvsHfxmbsfHUDDxHZwJc6K/kSxzN4NDnwPQrFtszG3n
         1GgUCbkjpAOvMva8bAQMac0y3T7FgSFY15L5CtVKJC1EetmBOBwUwucwYclZQycRA0+J
         nFig==
X-Gm-Message-State: AOJu0YzKmHs+KchHBBYuWeb5TtFo4udpRT8Na64bgtNyXl1QH1orlkbR
	OoNaeB64AimgVLogGmuTlYpnuXNaJDe4hx9fCMBhaJZPcujsyBOo28A+cd3D
X-Gm-Gg: ASbGncviUsZnkSRW8IlYk8WGINQUGss73LjiqHXyXGoKR/QJ5hurc7yYs4Hi+3Fg3Lg
	dAehVet1xMIUjG7l/Sed23RvFxr9l5yOk97Vw5Jwiv/AS5cWr+Yagvmz18dJNs4JBUskTOL68zP
	g284j+aWtiXLVca0YbTb8Hdlyj8jcEtzwVbLzt0JBOGvMlzFTTLnFL9/4qq/ycPxih83/TX7PrJ
	Z+uX75QfE4qZyTIpECK4AGSkHMdqBnBNLD5ywtjpRnqIrbU8BniQakdAxQZAAPFvC6EWkWXe1ZD
	RMDOfeewYFigj1Dv1wFYm3StP/ubO/YO
X-Google-Smtp-Source: AGHT+IEijWlz+t4jmw3nDR9hgYbwbQXLJYvhY3KDwcvwfr/mRUq2QBbY8at5ohRgNcynMeegonEUMg==
X-Received: by 2002:a17:90b:2dc8:b0:309:e195:59d4 with SMTP id 98e67ed59e1d1-30a6197c3f3mr16519808a91.12.1746485195925;
        Mon, 05 May 2025 15:46:35 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a4748e863sm9708830a91.28.2025.05.05.15.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 15:46:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] opengl-es-cts: Workaround gcc-15 segfault on aarch64
Date: Mon,  5 May 2025 15:46:33 -0700
Message-ID: <20250505224633.1581926-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 May 2025 22:46:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117333

We are seeing a compile failure due to g++ sefaulting on one compile unit
It seems a GCC 15 bug [1]

[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=120119

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.12.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.12.0.bb b/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.12.0.bb
index 96a4ca7d49..db4ffbe92a 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.12.0.bb
+++ b/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.12.0.bb
@@ -24,4 +24,6 @@ do_install() {
 }
 
 SECURITY_CFLAGS:riscv64 = "${SECURITY_NOPIE_CFLAGS}"
+# GCC-15 segfaults see - https://gcc.gnu.org/bugzilla/show_bug.cgi?id=120119
+TUNE_CCARGS:remove:aarch64 = "-mcpu=cortex-a57+crc"
 LTO = ""

