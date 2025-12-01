Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46759D116F1
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 12:57:30 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20712.1764593844755396976
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Dec 2025 04:57:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=agEhPo2W;
 spf=pass (domain: konsulko.com, ip: 209.85.128.45, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso45802025e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Dec 2025 04:57:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1764593843; x=1765198643; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R2oHcQ3qUiHgwn253E3yOtRV4YCuRtYuk9Z7srlBUxQ=;
        b=agEhPo2WVx/1rICTE4ZZKFakKIPK1gXhrfpI9Hw8xXLcOSrHIMfps70WVLj1midu/n
         JtmkuG9GWlJ2vFX1TL+NWP5DPJ3usEnYXUVP9pbfRDmb36zSfcIZS5pVVqIy1ZtWyt/X
         H1ZoQ5JDt8/8aBDvZmL2xJ/HQBJ/OqCJVuA/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764593843; x=1765198643;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R2oHcQ3qUiHgwn253E3yOtRV4YCuRtYuk9Z7srlBUxQ=;
        b=tNEOYFerIyATxm3knwoP724XR2cRer8p8FlWnbbRPn5j5MlLcSF6i3YRs7BLcRi95t
         mq95FrMJcFGUiCBOQVi4k8FZpszF8/C7nOJ+hjm/7HOXFKPFhQQl/KodHsdi7Huq88u3
         UsV5nBdEaTs63okHJfg8ZSbTG2xP9qmV5VNs34Mbv3OSzPbadm9eLB0MFnWRxBoiYv+0
         F4WvPy/JMQOkdAAIWO4yVanlU2oQsBbf4s4afvVhIw7IB2FYDj/FGA0K2SGeir/fzOKj
         th1ZGFLXdI0lJTpDF+SEMBYkOvqqnJI/ef0FrOd+s+6veEG7/JL6jM5eoylHTWf/T/rA
         nNmg==
X-Gm-Message-State: AOJu0YytQkpD3JWzyX7aIFaVdAXuodvWSMG/rNfeDfHY6Fq9nPZRe1fA
	1AeQcMBzOXHhwNYNIEoUXteNa41poz3ccwMOXEqFFvUQfAVWYpgDWQghZPCLND5pgfT/hGwoEMg
	CMeo5
X-Gm-Gg: ASbGncuJuPUbPD9xKqvuXdSxS3DhJac3a/jA2LGnkzYo5in/LDr6whgmDPVaY6XjELO
	pL3D/wmAQ24qJi4lqIUpeUCKybU7EL9cIH4+GAClUHV3IeL3NcgnS53LbwSjO6wfq92eaYn+Ha+
	7IJh00sLhninz5Y3o23H9u8mXRf1B5RsMeRAQV1ok9Cy/XbnkbMweN9ZnQhvzw0IclkEHDVguEk
	eAheqtkbMAAg/SasUPYrG/x3+lz2SFuHGARkK3JbXbv2RmjAS0MXnxh4T4ym58P9HmZfm8AzfYu
	nMJmR52k0/xAVD4YJKxfna9EyIKYGaCDU7ttWx+pJfTEsSlI2pPyrlLAR86YLeB6r7mzeKEWaZZ
	DuyS7+BbjHNVIoFtkknOyChyn91L2Edms6M2Ooej/Ak5hzsrSf6/fUMQN0CGxeuG+LSr436+cuB
	8UGdu+l0YDNPiqc+eU5B+mIfbP
X-Google-Smtp-Source: AGHT+IFmOR08nAVhZaZ/MO21SzBK+pQorHNkpi+xLJEZ/PnGlAgs0wZw0CJSw8x+IAOJhgGui2E22Q==
X-Received: by 2002:a05:600c:1f0f:b0:46e:37fe:f0e6 with SMTP id 5b1f17b1804b1-477c1131db6mr366808445e9.30.1764593842635;
        Mon, 01 Dec 2025 04:57:22 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790b0cc1d6sm296780915e9.12.2025.12.01.04.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 04:57:22 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCHv2] colortail: Add recipe
Date: Mon,  1 Dec 2025 14:57:19 +0200
Message-ID: <20251201125719.393654-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Dec 2025 12:57:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122205

Colortails is like the tail command line utility but with colors.
Add recipe for the latest release 0.3.5:

- Print error messages to stderr
- Fix memory leaks and Valgrind warnings
- Improve detection of file truncation due to log rotation
- Fix ./autogen.sh on macOS
- Avoid emitting excessive color sequences
- Output ansi reset code when the program is interrupted

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 meta-oe/recipes-extended/colortail/colortail_0.3.5.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta-oe/recipes-extended/colortail/colortail_0.3.5.bb

diff --git a/meta-oe/recipes-extended/colortail/colortail_0.3.5.bb b/meta-oe/recipes-extended/colortail/colortail_0.3.5.bb
new file mode 100644
index 0000000000..936cdf10eb
--- /dev/null
+++ b/meta-oe/recipes-extended/colortail/colortail_0.3.5.bb
@@ -0,0 +1,10 @@
+SUMMARY = "Like the tail command line utility but with colors"
+DESCRIPTION = "Colortail - like tail but with color highlighting configured via patterns"
+HOMEPAGE = "https://github.com/joakim666/colortail"
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+SRC_URI = "git://github.com/joakim666/colortail.git;branch=master;tag=${PV};protocol=https"
+SRCREV = "653bbbe3292759f5fb5ae9f769f131c1a320965d"
+
+inherit autotools pkgconfig
-- 
2.47.3


