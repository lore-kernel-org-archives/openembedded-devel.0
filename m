Return-Path: <geoffhp@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 756EDC48297
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 20:00:05 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.2908.1707249603029662407
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Feb 2024 12:00:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j0g/p2Tz;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: geoffhp@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6e03af57c97so1619854b3a.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Feb 2024 12:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707249602; x=1707854402; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fp+dhL3ROik+4lFWYaKa55AgJAIQL+M59w+hRvL6N9I=;
        b=j0g/p2TzgPaVXTBW77Mbl5nCSnCG41SFEgnjjIy+KlZPFyLhccw7YPh6kvgWcgozOa
         Tgg29piHnb4ww/ma0Ltdz5V0V+5IkMpRwpuXujCsniBik/3Snhl5pcB5BTRrmCgqDDqE
         0wQyHo5GX9Fggdzjm9H2Tf8XC2KWKgy5vmI3JtZDTrNBN6vbsSxYdUBUaRx/oVYKA2KH
         M+hebbTQZHKn+c3QiJPgUhgESV0ivBsWGaNEqVO+siAWhGN2i56Mh9NjQ8sVAi9y8Q3e
         l9S4uDPXhActSE+BiTEy3uz/4cWL1svcptEqMatExwmrEmhnSBEGnDVMkP87o8N3IFkW
         bndQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707249602; x=1707854402;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fp+dhL3ROik+4lFWYaKa55AgJAIQL+M59w+hRvL6N9I=;
        b=OkWfnuP0+X8VCFQeAg7z//t920z4Z0sBEclJ7wOUS0rEp+jtX0IkFO1nF5a7SC6R1j
         rTDjGfv0CHycY60oJjXLUYz9FfNbERPXMXK1hhp8g6rDNs4qpBnpYZy4A4uRo0YW/q/r
         mVbyeqKOf8L8zxY717v7kWSBsN5ik8QygJuBWeAJp67uPFDaI8Kbu7jGam5Ob8sFNCyX
         HOO4cU7V4kq8zOdSS6Le+PEjDj1iHBTBg+spfq+zXYxn++1MWhoVdanuwxQuXA8vuG4o
         9o7AgnZQIX8sN7KIHUvPa2DjGuIiDfc8c2rtWVdtrufsr3bdz867igWR9o86IHr7GS/B
         K1Kw==
X-Gm-Message-State: AOJu0YyKtK6snuUzw5D3+p4JzUC/Xo5cv+v6DNeYVlKVSTUWoEAEg3df
	mEId0jXRDcPsOP88FhCCPbdAPv1xCFFYdudG1QkmC+r6/BXAW41z0NRFVmK+cRo=
X-Google-Smtp-Source: AGHT+IEVPk53helJG02QyWhg0ns9ciX8cS7nI/xYTfkmUxIsh+/p2itIeDSOJ3K3f/Bsybea6qsFEw==
X-Received: by 2002:a05:6a00:18a9:b0:6e0:41f0:f6ac with SMTP id x41-20020a056a0018a900b006e041f0f6acmr804711pfh.10.1707249602120;
        Tue, 06 Feb 2024 12:00:02 -0800 (PST)
Received: from spock.lan (107-185-048-203.res.spectrum.com. [107.185.48.203])
        by smtp.gmail.com with ESMTPSA id n10-20020a056a000d4a00b006dd8985e7c6sm2394040pfv.1.2024.02.06.12.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 12:00:01 -0800 (PST)
From: geoffhp@gmail.com
X-Google-Original-From: geoffrey.parker@arthrex.com
To: openembedded-devel@lists.openembedded.org
Cc: Geoff Parker <geoffrey.parker@arthrex.com>
Subject: [meta-python][PATCH] python3-aiohappyeyeballs: Add native & nativesdk support
Date: Tue,  6 Feb 2024 11:53:25 -0800
Message-Id: <20240206195325.737976-1-geoffrey.parker@arthrex.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Feb 2024 20:00:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108639

From: Geoff Parker <geoffrey.parker@arthrex.com>

Signed-off-by: Geoff Parker <geoffrey.parker@arthrex.com>
---
 .../recipes-devtools/python/python3-aiohappyeyeballs_2.3.2.bb  | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-aiohappyeyeballs_2.3.2.bb b/meta-python/recipes-devtools/python/python3-aiohappyeyeballs_2.3.2.bb
index 58c1eb00e2..0ca4834773 100644
--- a/meta-python/recipes-devtools/python/python3-aiohappyeyeballs_2.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohappyeyeballs_2.3.2.bb
@@ -7,3 +7,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=fcf6b249c2641540219a727f35d8d2c2"
 SRC_URI[sha256sum] = "77e15a733090547a1f5369a1287ddfc944bd30df0eb8993f585259c34b405f4e"
 
 inherit pypi python_poetry_core
+
+BBCLASSSEXTEND = "native nativesdk"
+
-- 
2.30.2


