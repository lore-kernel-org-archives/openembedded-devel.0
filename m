Return-Path: <frederikbraendstrup@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9192D74EF3
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 15:49:19 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1206.1769183353633815121
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jan 2026 07:49:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j+7xSjMP;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: frederikbraendstrup@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-64b7318f1b0so3242165a12.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 07:49:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769183352; x=1769788152; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mZnW0Vmb0zl6yKp86dYFL9hKP+V95TgIsLv0oNuokHg=;
        b=j+7xSjMPYaN6PS/Ix1LhFm82y6gQyHNgURr+6CrZKw5G21K7dOPL0r2kYUlx7aDkas
         r0XOVam3Kw5lNyuBIeOG/WzN6bkoRffbmrV9DjOct0AP1CZ6Z3VNZ6lzgLynVUHwfd8P
         IMObH3cdotJGClY9XjwmTyxcFHSPmO7tDRjSP3jwSqBRkUiWB0f9c/WiosUcXtLP8ApY
         nZjzY+99M/+poLREfF+yx4P/bPhPK7J2wCkkIY7HsCeh/JAPhRMSj62/1cJBEFXyIJ+D
         h02Vx2iBCLNrwSIbKoxQl4xptzZm/EsT+nDP+v03i9m4e/BR6XlHfjsZDv+ivy90RrLh
         Uz1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769183352; x=1769788152;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mZnW0Vmb0zl6yKp86dYFL9hKP+V95TgIsLv0oNuokHg=;
        b=VyxtdypkS8hoZG/jkYnX34eCGVcxAUBlbtpPsrMJKMQ8bzJg/mfzCNDscrmTZhliSg
         wXrVb/6iNMHOLsp6cfs16D3xqk0YOLk8bl7cQAKjw8AcGacL0DuWg7oyfbR6CFF18fNy
         uZknHw8YTBZnD0aoSrAkiCqTz3LRvT/+XxEceuIdIV2jxhnXbUeghwevUZ0IGhjKMLNu
         0XFe8s5y1ve8mbO0lEpikXw4co6bjLICnK28jNO/PXTOdp1x1CthkRVdYMxvTfIitii7
         dnKASdo55y+WYzde2tVb+uDTikyqkWORWPQUkuqEtcVQE9TJkzOScp2D3OD35a8Pbu7f
         DLtg==
X-Gm-Message-State: AOJu0YyY+F1tk/upECPUuOGwx9KmofEejfw+nf4mLbkm+mCDf8M7kmR7
	w/sSNKYp1YJIJsXzN6lzSO5XgzaugHUzro36wbtav8hpDz/9yR6FHH5cgEObxQ==
X-Gm-Gg: AZuq6aLc7HErD110NuJDL4qrQ0vBOi0LBYXfozf1E5c0g006UNyy5wzCbsxY21PGcn8
	1jZ+29xvicVmpYEc8hunxnfzrZCYNBm7MQkHst6PtgbGT2Eeo5gVI7S0qEz/ik3Y72m2c/GkXhh
	nJvsgKNEzAIJLmDtyrbQTNlO9BOzbOsX7Yc1oKQiOngWZ1yd1OBe1LGqMrugvzvgReLWJwM97e9
	mTFvqHw/JuEuJDuHJBNCMlAJLTJegzsf4atfN0tsw3DHUgSYT1BVY00Wz7Y5vkeKPV2sUT7QSRC
	WHcWUr3siuaOtRAWgZOAQPjbj8IChR74ZJHsm2FjwE5g3o5o/9vgjW6lL8HIZeqQ8O3U6P5oYtA
	oulqsNTtfNc53Car16aNtzJnSOzfUEt68vBL+0MQ4J4+u8AG+M1/GT+lSRTx1dUIV3ywcTGrvgp
	o/1HetFV8z0axwcpwHCptVkzuszGLoSv3KKMJdgcqebMZ3QmKn953blb/UZApANzLanJkfi9xXt
	sQ=
X-Received: by 2002:a05:6402:3496:b0:658:788:def4 with SMTP id 4fb4d7f45d1cf-658487a1889mr2405096a12.19.1769183351700;
        Fri, 23 Jan 2026 07:49:11 -0800 (PST)
Received: from ws.taila4487.ts.net (77.241.136.110.bredband.3.dk. [77.241.136.110])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6584b96d6besm1077080a12.30.2026.01.23.07.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 07:49:11 -0800 (PST)
From: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
Subject: [meta-oe][PATCH v1 0/2] Add liboauth2
Date: Fri, 23 Jan 2026 16:48:41 +0100
Message-ID: <20260123154842.1635662-2-frederikbraendstrup@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 15:49:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123783

These patches add liboauth2 and its dependency cjose from OpenIDC

Frede Hoey Braendstrup (2):
  cjose: Add recipe at 0.6.2.4
  liboauth2: Add recipe at 2.2.0

 .../recipes-support/cjose/cjose_0.6.2.4.bb    | 14 +++++++++++++
 .../liboauth2/liboauth2_2.2.0.bb              | 20 +++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 meta-oe/recipes-support/cjose/cjose_0.6.2.4.bb
 create mode 100644 meta-oe/recipes-support/liboauth2/liboauth2_2.2.0.bb

-- 
2.52.0


