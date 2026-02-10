Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E736EA3F0C
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 05:48:22 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13939.1770702485271146845
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Feb 2026 21:48:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eU7vvdR7;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4806dffc64cso44744255e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Feb 2026 21:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770702483; x=1771307283; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZnZE9+VUXwVkvCExG4WGPGNM/rYt3X97Iyud/FK5Eyc=;
        b=eU7vvdR7xveQ9p7fwMAWY4RJH/R2X5C94L+MtTOfDM6+2Rvdy80CbI1susBX6o6k1R
         wcBCN5yf1/fluZqNAdq68n5RVJ4nZX4MAnlA4B4bQ+HAgOSGGMI7Y//YZK8gtXOnRGO9
         +20TOnq8wD13vwiO5v0LA7W/q5sq2dvXSh4dCzmSlvcUGwhLL4f7JgzTtjd0Ih1w2xxE
         i2eXXkuzkrULZPL0yM3BUo3HfJLCiH9yNPCmzM/QNQyUwDw7PH7WWYFe6AulaFHg22zk
         reKDCj7b7cqUwXTgIt65x/aqvaLHvf34tfKRKrZDEsZ0Innwmvif+FVZ5o2hIcYf2K7C
         O9gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770702483; x=1771307283;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZnZE9+VUXwVkvCExG4WGPGNM/rYt3X97Iyud/FK5Eyc=;
        b=Mz1p8W8XXEcOhULbfzfFExQagq58eCuyupj8Y3IwtnlIep+H32tVlcYh/ujljr3e1K
         KjrtHdjtjajdkbrOI8QVn6SQfbSlQqj29/+hXE0zNJBeqY1qgBNG0ollZnvFKflJogP3
         M45ujh4eM40HC9mj5ejJZUIArnkTl6lCLAo0IjpaUQed8jSJMeseM9BZZQ2huUVZg9Cf
         oNUvuiY7lCyr2pe5srG+J4qFZ7sIA2HxNBdFzBlUv5BAv9JDQUWdBOwSg3txYNn233nR
         vQXGsHgMpJGqsbdC4ryst4cLQODI+ISxDQM9xRBgT5d5hL+XbT3gTu+dX0pe9aHe26uf
         sGGg==
X-Gm-Message-State: AOJu0Ywgpzi4lckaQxglUDwdEzGvKM88B3f1msqgT7UluGzbH9DKqWkw
	leO/99pXJ+uAKMSb67TjFEj1BY4wmnv3GZRM3EtQY1xsFMNrCtlBr0Vpf0zZ3A==
X-Gm-Gg: AZuq6aKsEKbqw7zFJxUm5iluqQzZqnL0u6sYE6Cu2HhI9rHwjtHGjg+cR3e9Wo+JTQ2
	2olz86+IIppwOHe+2/y4EeQLvNkOEt909M02JO1Okm3eHcTSE/Z6DcVLP5ZxLGIciRq/7jxZOTi
	K6PKN0Ys1z7rnQ+W4syb7PE+HPWwIsfc9ZnM/8zcQRxpJinnqvTZ8MsYwx2pipecmWGlomP95AX
	7+X6BhBWo0KIrZFIXCS49eKPosLys218+j4f29yXCYNkl7YvXPVPjGR5bCCMdk32MoaA3q42/hx
	JXRQgcYktyJZR2v5WXckaAe0Fo9PrfujVuq0bVpgkEp6xHrpy1IPnRGz2MWcBR5zMEzwVNU8aGe
	nRv2aISO+DMn5c3BzZVkjOv2AAEu5ypKdq7/c/LQBnn1QnQcb1j37HS8fTL+od2rjUf1m1V+AKo
	UG/zA3b6VVZbIO2gE8Pje+
X-Received: by 2002:a05:600c:46cc:b0:480:1c75:407c with SMTP id 5b1f17b1804b1-48320929115mr180295965e9.2.1770702483091;
        Mon, 09 Feb 2026 21:48:03 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d7e74e5sm33821595e9.12.2026.02.09.21.48.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 21:48:02 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] freerdp: patch CVE-2026-22854
Date: Tue, 10 Feb 2026 06:48:00 +0100
Message-ID: <20260210054802.3897106-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Feb 2026 05:48:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124315

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-22854

Backport the patch that is referenced by the relevant Github
advisory[1].

[1]: https://github.com/FreeRDP/FreeRDP/security/advisories/GHSA-47vj-g3c3-3rmf

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../freerdp/freerdp/CVE-2026-22854.patch      | 29 +++++++++++++++++++
 .../recipes-support/freerdp/freerdp_2.11.7.bb |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp/CVE-2026-22854.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp/CVE-2026-22854.patch b/meta-oe/recipes-support/freerdp/freerdp/CVE-2026-22854.patch
new file mode 100644
index 0000000000..791e10ab25
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp/CVE-2026-22854.patch
@@ -0,0 +1,29 @@
+From 94d3791abcdbc1e72827921906d5f9c14a2b0a78 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Mon, 12 Jan 2026 03:44:06 +0100
+Subject: [PATCH] fix constant type
+
+From: akallabeth <akallabeth@posteo.net>
+
+ensure constant is of 64bit integer type
+
+CVE: CVE-2026-22854
+Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/3da319570c8a6be0a79b3306f1ed354c4a943259]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ channels/drive/client/drive_main.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/channels/drive/client/drive_main.c b/channels/drive/client/drive_main.c
+index b6cf2ad32..5df7fbe97 100644
+--- a/channels/drive/client/drive_main.c
++++ b/channels/drive/client/drive_main.c
+@@ -295,7 +295,7 @@ static UINT drive_process_irp_read(DRIVE_DEVICE* drive, IRP* irp)
+ 		Length = 0;
+ 	}
+ 
+-	if (!Stream_EnsureRemainingCapacity(irp->output, Length + 4))
++	if (!Stream_EnsureRemainingCapacity(irp->output, 4ull + Length))
+ 	{
+ 		WLog_ERR(TAG, "Stream_EnsureRemainingCapacity failed!");
+ 		return ERROR_INTERNAL_ERROR;
diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb b/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
index 225f49a94b..0bdf56938b 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
@@ -24,6 +24,7 @@ SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=stable-2.0;protocol=https
            file://0002-Do-not-install-tools-a-CMake-targets.patch \
            file://0001-Fixed-compilation-warnings-in-ainput-channel.patch \
            file://CVE-2024-32661.patch \
+           file://CVE-2026-22854.patch \
            "
 
 

