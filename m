Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC653C5AD49
	for <webhook@archiver.kernel.org>; Mon, 26 May 2025 19:07:23 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.35499.1748286437262013995
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 May 2025 12:07:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gO0a+Jc2;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-44a57d08bbfso19227715e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 May 2025 12:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748286436; x=1748891236; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=esIrp2liqZhd+dFjsYqioF7pCh96+vaasAQFXxKU9TY=;
        b=gO0a+Jc201VygsvqDVzcLe9m1gTFMGeFL2JheZPEFhOxCTXpzeg7RQcokQyzex8nfh
         MKSj4ui6tzEqazuIAunAw6ETYtr6rHjAJ22B45xHHhwzPlHlGdQs8pVrd0nQCfrXU5iN
         qva5eWw7f6vJLIOTg+VjcifahK6vhXbYgGhOcRdahcdZG/IuPVbcMVLBlIPWmzBNc4Kq
         p+jbORKk8T87TSiNaDsGXH04nv8xhQNNnHHi8qbYj1UI8Y8eGgn/pbgOc6kPcc4pckxb
         nC+dXlsgHpJp18g38PmeqgVOyuXtKBasWxxmFl0EkVggNFqs97lj3yfEPkitvrdUO3+q
         m2Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748286436; x=1748891236;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=esIrp2liqZhd+dFjsYqioF7pCh96+vaasAQFXxKU9TY=;
        b=o25XG7+iRXVUZGf7PFZa2wcDkbfRyIF+zqRSRNxFPf+1Ruxe2Bd/QEk5u1CD2m73Or
         EGthEB5KImjiTAu/RiFBL7BkpgL05pMdWrmsCR6KMW/2Ehpdz6r6r3ShXiiPx5eYEK5s
         S2UXNc/aikM6sbploI+fZwIu3RmxhFP+ZEZ8iYCfnK16joksJ/ntflWNF7ERUHx5MuHI
         GzFO+9XSBHbF/2DPc14hTPPAiv+FqCQd4ePpNIPsVH/GAfTUqA3nePpkK0Y3Cph2t/RY
         F7VYmwThicLBv3UbXvv51BOktrYBGqRy213reRZQi3jFYY+JRBA91FtZZZKG53iX+/Mt
         +2vQ==
X-Gm-Message-State: AOJu0YxG7LJYqhpl9wEGRjRPtdkShm0c2fI1pltuG1FUpsEqPXGHod+v
	NV20ey5eUr6txzZQJZ838WF/ygNWqvHTrpaCWuCohW5RxMm+ePudN3ash/KuyQ==
X-Gm-Gg: ASbGncvmnX+1hGd15TIlq9+5aFIncYo8e/rmC0ZMMD5eGVj1z7sJUvwhY0BZqhyt53W
	z4l16lzXI4dZlg9tDWALY4+dboeA/sMs7pvqIpPx4ZbTNyyVUBZQLiXbuEvXLUekRlel8EGPlUQ
	g6e7iXeCN838+lNzuT5RdpPwx0lFig+VK7xExtvQ0Ujyl0ErSjHatAhwM5+e0uusrygNQfo5Dr9
	Su1536DqUlTywuzOtkJ4BszZPQxnsugow7suQb1YxFE2bgeCKOxw2dUQe3CBXW5tuj/DZkQbEs0
	PGxZcT0cq1940HK9VmoNp4ChPIgvtPFPGvevzHJnDRBQrSvIEle1MrHKk+EdPsBYZLI=
X-Google-Smtp-Source: AGHT+IGPpQYhC0L/8gKYElsIfN1+qgZbLeMb4DOHVetQp7lYTVXTxH2xE2Z7DVqsyWV4ue0+/Pq74A==
X-Received: by 2002:a05:600c:3e84:b0:442:dcdc:41c8 with SMTP id 5b1f17b1804b1-44c948455e5mr71620485e9.19.1748286435369;
        Mon, 26 May 2025 12:07:15 -0700 (PDT)
Received: from localhost.localdomain ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f78aeb56sm240693035e9.27.2025.05.26.12.07.13
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 12:07:14 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] aom: update 3.7.0 -> 3.12.1
Date: Mon, 26 May 2025 21:07:13 +0200
Message-ID: <20250526190713.2054153-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 May 2025 19:07:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117631

Changelog:
https://aomedia.googlesource.com/aom/+/refs/heads/main/CHANGELOG

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-multimedia/aom/{aom_3.7.0.bb => aom_3.12.1.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-multimedia/recipes-multimedia/aom/{aom_3.7.0.bb => aom_3.12.1.bb} (92%)

diff --git a/meta-multimedia/recipes-multimedia/aom/aom_3.7.0.bb b/meta-multimedia/recipes-multimedia/aom/aom_3.12.1.bb
similarity index 92%
rename from meta-multimedia/recipes-multimedia/aom/aom_3.7.0.bb
rename to meta-multimedia/recipes-multimedia/aom/aom_3.12.1.bb
index 776dfa8783..681ebb4d3d 100644
--- a/meta-multimedia/recipes-multimedia/aom/aom_3.7.0.bb
+++ b/meta-multimedia/recipes-multimedia/aom/aom_3.12.1.bb
@@ -5,8 +5,8 @@ LICENSE = "BSD-2-Clause & AOM-Patent-License-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6ea91368c1bbdf877159435572b931f5 \
                     file://PATENTS;md5=a111d47497d3bb49e04eef71377eb8ba \
                    "
-SRCREV = "6054fae218eda6e53e1e3b4f7ef0fff4877c7bf1"
-SRC_URI = "git://aomedia.googlesource.com/aom;protocol=https;branch=main \
+SRCREV = "10aece4157eb79315da205f39e19bf6ab3ee30d0"
+SRC_URI = "git://aomedia.googlesource.com/aom;protocol=https;branch=main;tag=v${PV} \
            file://0001-subpel_variance_neon-Provide-prototypes-for-missing-.patch"
 
 S = "${WORKDIR}/git"

