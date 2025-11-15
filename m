Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8983CCEB2D0
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 12:38:48 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7747.1763210326556755640
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Nov 2025 04:38:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aWbhHyfE;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4779a4fc95aso1898955e9.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 15 Nov 2025 04:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763210325; x=1763815125; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=fRoJhrYJvHPc33u+XCGsF7+PtCkTwN4T6nCg0XN/B4E=;
        b=aWbhHyfEusN5mF6m0VBk0Hnq8vI7OR2wdbY6JFKrxAOScSGsgXACliygxq3TImorbM
         8hsORN56aEg/Q7aZ5CL3mQcOQNynawQEVj4mKv0ihziu7DwZ5TJHJmncLogSZB5qpEeW
         CUDinZGnoMvQexpOGXonTKvuQm1rgyp5RFySCGJDc/jIHJIow99SNY+zacZbkwmZzDNq
         IhqQjxRXMid0qdlJEfxJB8s1KT6BMbHureY0Q8jOg8PnaUGrleBYjAdMzddcQn43tAfs
         a8WHX5AeVqLuJAjxJqJzg+pI51hY2QmfFO/n+Kb8DSz/u+eUoeB3G9SlH2u2qBCJzct5
         CFGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763210325; x=1763815125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fRoJhrYJvHPc33u+XCGsF7+PtCkTwN4T6nCg0XN/B4E=;
        b=RJl4O2iB17k5rgIJzUMo6lVTOeKwW2/dYPiRwkQzyLkr4VzDh/zdJWKrfum9ei8TLk
         wLTg/OYcqt+PcAfiHyCTGpZGO9PSJjKH86mYDCJJ3ZWDQA4MWiSR19+G1qCqnyIP0x4l
         V/HpgFdVng8n3+MyFlPcektpQeUWzlcqmMcn85IVo0Da9CZzzaoSopjVPig+sPHE5VDw
         IqvMyu2yfm47bZ2TmGpP0Fs+O4KApPQGg6Dn2K5NZaNVmBdYIGnbXqWD5CsvGl4w7eYE
         L5eP//OPnsx5vHc9z/rvvkFDRHfny7Q8f/JokJjZVFwSWupUUSjuQoS84q2rthKuLtT6
         9JNA==
X-Gm-Message-State: AOJu0YwUhUD+9Mt+9w8ABWE7ppWjiNOwsyqTy439lqL/W30YWrZlIC2B
	oHSk+YRpcoq+OQCHbn1Ge6gyZWX5pGUkh3G4xH2YtnyF1N/AoGk5Vz33jiYTIEEv
X-Gm-Gg: ASbGncsZRZXKZmMV7XnlB428+mjtzLV5cspaUN1j4O1WSfNfPwD58Le0cHN2ypbmqly
	xWJ/nn7Dj07AS5ICEaR8oDLqj+FDTXfOsvj/2ezlr3p8zF1euo+DvYgD9r8C+YCG1Av7+1mmvyE
	qYckdnv1zLsp1F5ajM8GnycdjjNxGT9uuwWhIBEg4lcITKCn/v9q/rQqSv9rrDbxpS4WiUzOemZ
	KgZesONLEMCZgLCLvPdkt+BXoGxRtlPeERAFxCoop0t8bfqGKH8nrvGNg6cdMpnQey5HCkMAh/q
	8Q8YhBCt4nGUJQV+f9zSMaxZFTNeOmjZI6zH6mcjqPysV3luqjwDF+ztTpHqOg/zZ86T1uYr3Zv
	PH6Ni6NLKCxxKmtA7hV7MI0EHLxQobm3wKMBuG7cDOc6cyKUCRXue5gNvyky7/ZQ6dhWcuEdZFQ
	==
X-Google-Smtp-Source: AGHT+IHXfTKTme4RDAE4er2TG1qADw97gtvSWhPMuPtn88PHrh9kDkP6gEGAMxGk1E4ib4K/GqnKdA==
X-Received: by 2002:a05:6000:200c:b0:42b:3108:5671 with SMTP id ffacd0b85a97d-42b528452c9mr10007577f8f.29.1763210324559;
        Sat, 15 Nov 2025 04:38:44 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f17cbfsm15673572f8f.35.2025.11.15.04.38.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 04:38:44 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/4] yasm: add alternative CVE_PRODUCT
Date: Sat, 15 Nov 2025 13:38:40 +0100
Message-ID: <20251115123843.708911-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Nov 2025 12:38:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121722

There are multiple vendors for yasm:

$ sqlite3 ./nvdcve_2-2.db "select distinct vendor, product from products where product = 'yasm';"
tortall|yasm
yasm_project|yasm

Both products refer to the same application

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-devtools/yasm/yasm_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/yasm/yasm_git.bb b/meta-oe/recipes-devtools/yasm/yasm_git.bb
index 68895a1697..abaeef4db3 100644
--- a/meta-oe/recipes-devtools/yasm/yasm_git.bb
+++ b/meta-oe/recipes-devtools/yasm/yasm_git.bb
@@ -33,3 +33,5 @@ do_configure:prepend() {
 CVE_STATUS_GROUPS += "CVE_STATUS_HASH_UPDATE"
 CVE_STATUS_HASH_UPDATE = "CVE-2021-33454 CVE-2023-31975 CVE-2023-37732"
 CVE_STATUS_HASH_UPDATE[status] = "fixed-version: patched in current git hash"
+
+CVE_PRODUCT += "tortall:yasm yasm_project:yasm"

