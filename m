Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5272E77197
	for <webhook@archiver.kernel.org>; Sun,  5 Jan 2025 23:24:16 +0000 (UTC)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
 by mx.groups.io with SMTP id smtpd.web11.48497.1736119456162568414
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Jan 2025 15:24:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LK7yA1eJ;
 spf=pass (domain: gmail.com, ip: 209.85.219.174, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e53a91756e5so18364331276.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Jan 2025 15:24:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736119455; x=1736724255; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9kiENJT8D3IKHhpZvpgusSgXPZw4daWM/qggFLGOOY4=;
        b=LK7yA1eJFzEs8AGnIqx9NU0vNTm41/jnZa1OcqG/d1GgxcFmIyeUHshuc/A4Ko9GMI
         GlT7CrkoCxR4FFkzs6fguh5Dx3cXVQfgU7q7ORs+4ZaiPyvvmt2D0gRoNG6UgSY5HRW6
         hGPPrNSqRtcKw2/vt3OZuKteOPzVNLhkLxce7IdmHLYYwiTIf29qGSV9lUPJNAgQiTlM
         d7R7NIgVnnOabO3ZpADTYvb9MKvfwBvUyfBbyoIl/ABRIo8pJ8EN7cS5PaY53dd0IJCW
         KttNRwK50mvv5r/iIDfJFN7Oky1D9Jeoe8Z751f6L/X3VBs0JMLQg4334J+Ff/7VRZnx
         HigQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736119455; x=1736724255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9kiENJT8D3IKHhpZvpgusSgXPZw4daWM/qggFLGOOY4=;
        b=R2VpEB5UpCfP4u6WrjgoFX0sq0jKgP1YEXk+iCQG/nt50yoSSl/M6WnPO6Kvk+u5ol
         n9l5CaV5gDcRQNrNpFxOgIPQGP29jw05FHHt465PLfmjASLQXCYLd3FxzLC0SsPWkcu+
         VzanKfufc6kRsHh1qmf8qL9xAJDRvDjjFWkoAB5NvBO9dBQQD4Tvq2+nGMigxgMfBlxs
         LMF329G9Ea0nSjOYov0YmH7kg4kfvFvIGUlgwNnEmquFHPYHipXd3Ypq6AePsCUpYygK
         MTK5l/PyvwamM5P+D4xRISsNgGGAvCPU8EabXqYf2b7+UfAVFyLWH6iIc5PIIZI2mHIh
         xx1A==
X-Gm-Message-State: AOJu0YxcZg7uzWbnwZbpilI2NxpmqHcJ2XNUKv/B8L7bYQSnnEDKxiw4
	ipRsFt7rKMcN1NISOznX416300v7F0aIhO53phK1F2pCHNlcTE1Sa0pbG8xo
X-Gm-Gg: ASbGncvczt03y7u0WxbfyF2CUQDxdCXZ/dqvcOTxRE+hnyjDh1QRfLB297JgPFSah1A
	ppuKQPaDZA/1Q0JUDkVwq48ngtdT6v5/ep3hTt5yre46U5ka89cp4B7SdaDlvoaJfD9A26A2JJ6
	GOmTk2KLu9OI38DvJVgndSrof76jLwVObO1Fno/WuJOb/Ezr23JVpyGjOsHrDmVZAXdauslxq+/
	XaMNwPif3zu7qSpUqXfAacyOaNsdcReyY/VceOrGt8vQy5tjOWZSCtq2pANhSE7vtyx0w==
X-Google-Smtp-Source: AGHT+IHThHHnPt421+OpNPHUf1ZpFTaTpyP/nZhE7zw8Tn7xUQhwRrrFbjxOWN+LiubFAh/uCcHjEg==
X-Received: by 2002:a25:ae48:0:b0:e53:a95b:98d2 with SMTP id 3f1490d57ef6-e53a95b9b0dmr30204743276.44.1736119455295;
        Sun, 05 Jan 2025 15:24:15 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000:fdb3:610:ea25:f87f])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e537cc1e91dsm9043004276.19.2025.01.05.15.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 15:24:15 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 24/24] wireshark: upgrade 4.2.8 -> 4.2.9
Date: Sun,  5 Jan 2025 18:23:57 -0500
Message-ID: <20250105232358.1502946-24-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250105232358.1502946-1-akuster808@gmail.com>
References: <20250105232358.1502946-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Jan 2025 23:24:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114654

From: Peter Marko <peter.marko@siemens.com>

Solves CVE-2024-9781

Release notes:
https://www.wireshark.org/docs/relnotes/wireshark-4.2.7.html
https://www.wireshark.org/docs/relnotes/wireshark-4.2.8.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 2d3988f7b611f0ccf0ea4dff8fb7bd15b4dc8860)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../wireshark/{wireshark_4.2.7.bb => wireshark_4.2.9.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_4.2.7.bb => wireshark_4.2.9.bb} (97%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_4.2.7.bb b/meta-networking/recipes-support/wireshark/wireshark_4.2.9.bb
similarity index 97%
rename from meta-networking/recipes-support/wireshark/wireshark_4.2.7.bb
rename to meta-networking/recipes-support/wireshark/wireshark_4.2.9.bb
index 9c93fd026c..ffd7bd56c8 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_4.2.7.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_4.2.9.bb
@@ -17,7 +17,7 @@ SRC_URI = "https://1.eu.dl.wireshark.org/src/wireshark-${PV}.tar.xz \
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-SRC_URI[sha256sum] = "2c5de08e19081bd666a2ce3f052c023274d06acaabc5d667a3c3051a9c618f86"
+SRC_URI[sha256sum] = "62c2b6652d7f9a50668867bd57b21609c9a9b6950f26e7f30a24b2de0e72ded3"
 
 PE = "1"
 
-- 
2.43.0


