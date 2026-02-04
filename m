Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A569E9D3F8
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 14:59:38 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22285.1770217175531932986
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Feb 2026 06:59:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=g7SZobEF;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.218.42, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b87d3bdedaaso69950266b.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 06:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1770217174; x=1770821974; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UPRoGAXs963c5dma1OB/MrOdZH9gNOWTv01WPQ/YL9E=;
        b=g7SZobEFHP47mzCLMDePSlr02eYqRm0+u9A6JIqKkUhotpbxt+D2X3hxPon2DtSNya
         5+60GdcuXEB5xL4MOkMhXBrPyRiQpPCT4jrv3lZnJcBXw3TzN3r8cYEjaJskp3nfqm07
         XMYM4oxzUj2yh/A8FRxA6O4RAotvDDXuenw24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770217174; x=1770821974;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UPRoGAXs963c5dma1OB/MrOdZH9gNOWTv01WPQ/YL9E=;
        b=GK0kvbqFKMWyL/c6cK3uZ3sM6bYw3nrsynoQSV2RzicVBmNk02kSDUAKTFgNeaXyeI
         4m7vwHNGJxvgFZm7UKFLfYfzQRcwmW1HjzWjg/aBVWaFHYQwwlrUr1/XPuV9E4teWl+U
         AuvFJFaIyNdSw5S8sqBPndXrOTNKi/X4jBkR98S/tigNNBEo+nag7LaPgylqkjLy1zmY
         TJUB1fWSyVq2J+OYJp+2i358IrBR+VnpRciHvBQawvXXXIMZKlJ8tQwk63AExY3PHin5
         FXwWWUKQvyzscAXNEBzdFRZ5a2U9EDZgGSa5PrrSs6Av25HlMqaVubK6y8cIbp+X1YFA
         B0+w==
X-Gm-Message-State: AOJu0YxPLQaW8ujCxUBeEqK/ir+GYNjSGv9Sbs5nWVBJKrHnlxhEv5nn
	wINf1rJ8hcaBapZYmAuOXve8vV/uuHq84ZV75Ey2EQ+NbyCZBgU9YO4rHkSPUpOEqJYQ2YA8EeE
	Sltkg
X-Gm-Gg: AZuq6aKqMwF/YV9FtfkIN2USzt6H9o+WqiQGje7tzy95X7pC0RKTxrITI4KyVb76rMs
	cA6X/uBcnwCG0qgoSL8nrsk/Qi6Ke6xGrZKE7Ue3N8eQkOdtdhtyn0oZKcwnpNt5vPcnM6lWXl1
	OTZEQTunbhJNFhjCoKXihBHmDMazsyFgpwBz3UdqUm933OG3TFknL9S3YFBou+tHdABZgwnZF24
	j6IWlZx6HxSt2HfCQOcehSfww7ott1kqDmqeeEl1ugVrbJRXYLXegDoWF5CHJEkDcg1mpeYTL2D
	CbFjGfN4xQ7+rXL/U26tqasqF5BtpkWqewGZMt/sjm1B8ODYsXZ4M4bqw89TzxB341JpScUa5IK
	eYDpQ+xXOKmoX/hTp3zJMB0Hl+dOC6Em/iFbIOuVlb57AQN+ApbHAN8D//vUfNW360Vab4xHObO
	ffOFBqQUUwg8aN2Uz1djVI77J33GBXqylMnQNZn3ecRDparbnLm9KnwCjqz2WcQ4W5Y8GrnfMPK
	7aTwSAzv3zLSpJxOSfIH8IpGmjK1FnQRzKIrgjl3zM1WvxiSxma
X-Received: by 2002:a17:907:a44:b0:b87:6c5c:d3d4 with SMTP id a640c23a62f3a-b8e9f14b4ecmr128009966b.2.1770217173883;
        Wed, 04 Feb 2026 06:59:33 -0800 (PST)
Received: from adam.arnhem.chello.nl (2001-1c00-8101-1200-3ddc-5bb8-0efa-16f1.cable.dynamic.v6.ziggo.nl. [2001:1c00:8101:1200:3ddc:5bb8:efa:16f1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8e9fef0ef9sm132109866b.40.2026.02.04.06.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 06:59:33 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v3 1/2] libtsm: upgrade 4.4.0 -> 4.4.2
Date: Wed,  4 Feb 2026 15:59:29 +0100
Message-ID: <20260204145930.2170462-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 14:59:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124134

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 .../libtsm/{libtsm_4.4.0.bb => libtsm_4.4.2.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/libtsm/{libtsm_4.4.0.bb => libtsm_4.4.2.bb} (95%)

diff --git a/meta-oe/recipes-graphics/libtsm/libtsm_4.4.0.bb b/meta-oe/recipes-graphics/libtsm/libtsm_4.4.2.bb
similarity index 95%
rename from meta-oe/recipes-graphics/libtsm/libtsm_4.4.0.bb
rename to meta-oe/recipes-graphics/libtsm/libtsm_4.4.2.bb
index 074302bed7..6f060cd0f5 100644
--- a/meta-oe/recipes-graphics/libtsm/libtsm_4.4.0.bb
+++ b/meta-oe/recipes-graphics/libtsm/libtsm_4.4.2.bb
@@ -22,7 +22,7 @@ LIC_FILES_CHKSUM = "\
 DEPENDS = "xkeyboard-config"
 
 SRC_URI = "git://github.com/kmscon/libtsm;protocol=https;branch=main;tag=v${PV}"
-SRCREV = "0d33498a6de3619628f7802a0c76fc98c8773d5b"
+SRCREV = "b052e48cc776be1cdb940be2dcc1603457c01c96"
 
 inherit meson pkgconfig
 
-- 
2.52.0


