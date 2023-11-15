Return-Path: <beniaminsandu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B6BEC54FB9
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 20:46:09 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.24434.1700081160121314361
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Nov 2023 12:46:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fy+Alu6w;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: beniaminsandu@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-32faea0fa1fso42449f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Nov 2023 12:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700081158; x=1700685958; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HFhHOcfZjreq5d7GdZljXFAS8XFEXqRFMAiAXz2NE/o=;
        b=fy+Alu6w5VJT8ngM6mE0zG4lS27XhfuuTNzO6O4nsCxy5HaSEbFe+u/J99/8RKtaLs
         ef3/U2lYIt7SuHn5Y7OEH4YJk7QjrSz4PFxgtRkzCPMipDozcrYzJrYQ9C/KLV/s5LzH
         hMQ1AKDHUK9sjd4bXGRnUJpTa9qmKMk23LykUDN0T3OzsVM9pSnAY1P1inPOBdgAUnAH
         i535NwPmVn3XZMtSIdjckt14NvN+PahkcM8GWx/oa1Rwd8UlBFzKzuLrp8P60Erx/Msv
         fQG58kfISj95iElhXjYdc+Ddglyd0ZnzYir9wUMcoM4jxOnzv3MiwJNPv+5GUYLGqjVd
         kqEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700081158; x=1700685958;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HFhHOcfZjreq5d7GdZljXFAS8XFEXqRFMAiAXz2NE/o=;
        b=dypKAhkyYoVuWR423fkcGYTx2HAxYbiRhIBwrUvKHzk9roklLMBY7VTovA9ehz8208
         mRP9e6bYDdAHpIyxarCocqVVSO6MynZFE/LjKAaE9Ma4wKlxLkXp3FoA3DowEp06FEz+
         54bZRM/IYGcpvno3Pw1zmoUecBHUzOV0I9JixJWECKvwm+nJNEiA0Y/Gb+khze3y3cOX
         kR0DZnZolETGw6fevgSMXcJY1nIvV0RJH0gACrkxWxxOt2Csgr03wOZmuploXrMhWaGY
         skUmLHhva0eJBr7d2lXmFyd/efLfUEyI+H5PCaR3F5fx+X5ZS7qL10JIgadH+I4anksb
         O5sw==
X-Gm-Message-State: AOJu0Yxx6u8HzGq82XDcuPkw3M0rUy3nwH6etntYY2Ra9IwTQHXhezFR
	Wz1gUIv2wGdbIMTEBPsU0hCZjezOSryv3Q==
X-Google-Smtp-Source: AGHT+IEm9j7ScQBCrljRFXtypaXkN+OjKW9IYDuSIw+icl+fhEJuPL1kMUSqLVyWINQvgib1p7HQtw==
X-Received: by 2002:a5d:47ac:0:b0:31d:caae:982d with SMTP id 12-20020a5d47ac000000b0031dcaae982dmr6470443wrb.12.1700081158324;
        Wed, 15 Nov 2023 12:45:58 -0800 (PST)
Received: from localhost.localdomain ([2a01:4b00:8855:a800:454d:44c6:1c66:9322])
        by smtp.gmail.com with ESMTPSA id z12-20020a056000110c00b0032db8cccd3asm11508063wrw.114.2023.11.15.12.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 12:45:57 -0800 (PST)
From: Beniamin Sandu <beniaminsandu@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Beniamin Sandu <beniaminsandu@gmail.com>
Subject: [meta-networking][PATCH] unbound: upgrade 1.18.0 -> 1.19.0
Date: Wed, 15 Nov 2023 20:45:33 +0000
Message-Id: <20231115204533.1670977-1-beniaminsandu@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Nov 2023 20:46:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106772

Full changelog: https://github.com/NLnetLabs/unbound/releases/tag/release-1.19.0

Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
---
 .../unbound/{unbound_1.18.0.bb => unbound_1.19.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/unbound/{unbound_1.18.0.bb => unbound_1.19.0.bb} (96%)

diff --git a/meta-networking/recipes-support/unbound/unbound_1.18.0.bb b/meta-networking/recipes-support/unbound/unbound_1.19.0.bb
similarity index 96%
rename from meta-networking/recipes-support/unbound/unbound_1.18.0.bb
rename to meta-networking/recipes-support/unbound/unbound_1.19.0.bb
index 179af8050..ed8c5bd97 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.18.0.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.19.0.bb
@@ -10,7 +10,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5308494bc0590c0cb036afd781d78f06"
 
 SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;branch=master"
-SRCREV = "3795e374107ac7a5a977c516e144a3cd9b0da998"
+SRCREV = "3352b1090ea1098883f6bf64236fa877e18e458b"
 
 inherit autotools pkgconfig systemd update-rc.d
 
-- 
2.34.1


