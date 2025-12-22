Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58142E6ADF0
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:27:48 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.88184.1766435262878887210
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:27:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I0K7fn4P;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-430f9ffd4e8so2488461f8f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 Dec 2025 12:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766435261; x=1767040061; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t+BQ4bjd0HQwJ6W90o+eHnBvONTabZQkk9bgdKFG92I=;
        b=I0K7fn4P5/c+UYlS8q2jASRrKL1FW8ytR+YSzdH5wAVJKKE1qwJ+WFyKR6vA3qgpoY
         m+W4Q6MwRdOXKmBD46QgIxm8y3hDmXK9uNw9CqvyIgOwRuQTtuDgu3mt+Kssa/VOXSQh
         r1TmAZqTE1LtGDAygCFsWGDYdyOkAx2S6V1PEv0HM1tpp/IoYXJ4gpylGx3TRXy+rp6D
         K1JvSfL90K9wRFYp6Id8jK0pK3BWGJ1GkJFmd5O9coUiSWas51oPdX10M+JSa2ZtWxas
         e/jxJqq3JrKoHWAgBopnMKe+ns3RyYTRm0gN75VM5vHe6sODbTEfA22nmWqA+YAqK4Cf
         ncaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766435261; x=1767040061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t+BQ4bjd0HQwJ6W90o+eHnBvONTabZQkk9bgdKFG92I=;
        b=UAFXQ67wDobY35MgQzNrlhOslGD2W0RxxP2dTn6g0iYighkoHqjS7Ii362N2PuDtEo
         REGHEPsbsJ5C0n8Vs8xd4FXm7LKS3zdb5L4B3s/yU/nwRbE1IK05vR8SBStAdaHhWW8F
         uKhcbxmm8VkE1mS7YnI2WZSwUy9CigDCCEXoEwZHr+BIflJUkIDG7dd+exVtX6JHxJrh
         /nGL7aQr30ILKc8Gf30VBDLZB3DkYXmcf0ZUQsfEBpeLIgsJ4xC4sDvayGQjpfRdGRUO
         Da9Bb1LnmyM+VgJfQl8xIlW1J5tzWZlydqkm6k9mDPWyYvEkZowKAvsbqQtxU9Hmy0KE
         gGMg==
X-Gm-Message-State: AOJu0YzGwQXYjtktn3+WMVolf9Jq5yqBytFEwDeF9SsqrJFwenkT1cI4
	W1rQnLLzEw8+YHKh02Q5V+3m0RKSBdUAJEvyiyAL+Z9Gnk4JbdmozTg1Qd0MgQ==
X-Gm-Gg: AY/fxX4mBvvlZUYNNMnMRKvdmwrekiZ32vat0XcKYBcFcI2ViQGUViVxkzfA8/oB+WV
	2BZR1FIbatmVI6iMbmWCYxVfa7SaDZxkb84qvpkSSa/SFbfa5dRFzvtda1XEXN8RpcJtLeBkCz5
	iOMDQcQp88knEu9lgzuJutDMJeVyH9ofnvSqejH8FkUAfvHpijb/gneYHrqTffwkt4AxdT3hyyz
	9tdSpUoAlhTz48jhdJfFYK6Rjf3gKYmHeVzfilG5UuK74P06rUd453vDv/07CaXTQbx5VNlhz/i
	FiGAbpADTHSKcj4KTY12KhIoIgnrXPoL5AnQ6srQIvDUynE/ld5M0lMvEhCjl2Yg2kIPvn9WwD7
	dalsy57BuntOSdYv/k/bM1G9a5BG1IbciXPSQKfedVSFIrmzdaNlWx+B+35UNPUWkfxGwWOCgFX
	UUksUmzSk7
X-Google-Smtp-Source: AGHT+IHEKkK5EzS5M0KzsYWpceIoFPmwiRNvPDMXjIsiZfgGJq01DWL0qsF70y3l8aN+fxJU62IvdQ==
X-Received: by 2002:a05:6000:1789:b0:431:2ff:128f with SMTP id ffacd0b85a97d-4324e3ebfbbmr15986262f8f.6.1766435261147;
        Mon, 22 Dec 2025 12:27:41 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eab257asm24204522f8f.38.2025.12.22.12.27.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:27:40 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][scarthgap][PATCH 5/5] sngrep: upgrade 1.8.1 -> 1.8.2
Date: Mon, 22 Dec 2025 21:27:32 +0100
Message-ID: <20251222202732.3363914-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251222202732.3363914-1-skandigraun@gmail.com>
References: <20251222202732.3363914-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Dec 2025 20:27:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122811

This update contains fix for CVE-2024-35434, and a small build system change
that adds a fallback in case ncurses library isn't available during build.

Shortlog: https://github.com/irontec/sngrep/compare/v1.8.1...v1.8.2

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-support/sngrep/{sngrep_1.8.1.bb => sngrep_1.8.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/sngrep/{sngrep_1.8.1.bb => sngrep_1.8.2.bb} (95%)

diff --git a/meta-networking/recipes-support/sngrep/sngrep_1.8.1.bb b/meta-networking/recipes-support/sngrep/sngrep_1.8.2.bb
similarity index 95%
rename from meta-networking/recipes-support/sngrep/sngrep_1.8.1.bb
rename to meta-networking/recipes-support/sngrep/sngrep_1.8.2.bb
index 50248078a2..518ca9e277 100644
--- a/meta-networking/recipes-support/sngrep/sngrep_1.8.1.bb
+++ b/meta-networking/recipes-support/sngrep/sngrep_1.8.2.bb
@@ -16,7 +16,7 @@ DEPENDS = "\
 "
 
 SRC_URI = "git://github.com/irontec/sngrep.git;protocol=https;branch=master"
-SRCREV = "373abb90804ba71f980c7120e62f90d3a5c81213"
+SRCREV = "dad1033640f249fa4994f976cf6ee96826c15702"
 
 S = "${WORKDIR}/git"
 

