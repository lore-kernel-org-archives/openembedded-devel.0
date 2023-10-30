Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D737C4332F
	for <webhook@archiver.kernel.org>; Mon, 30 Oct 2023 22:24:56 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.172759.1698704691847746812
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Oct 2023 15:24:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GGv7Br/f;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6bb4abb8100so4549023b3a.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Oct 2023 15:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698704691; x=1699309491; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8afFZyFApKzkGarMxVVq1OXTM0wlMY94Gh0mDDe31+U=;
        b=GGv7Br/fNwuV3kLLKIS96GhOrOpDI8pBvlSH+9b3DK0BEqDXc0+XtywDzncjNfQIdX
         WsMoVfwwHoccokZN8NEmxCy/Cf+SbaioTbG41sw65Z9WLOd7QMNDabdFigw3B2cvHNGp
         qYVWsYHcVK9xTivHq/hTg25kVq34/LVqEWpIKOlIKQrHw2wvCv+npWflHoqF17irkVNc
         QEy8YgnsNQq0T4RFBUjaJ22ZQjaywYprc1IyEN28/Kh0950MDXdhI9c9gAvkYqcGaWZe
         hQTwDGdTezlWVlplA/xzaG/wFgEbUSgU0TPpIcBFx2Ldmyr/h67sU2Gqp22pjS5eTZHu
         AvJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698704691; x=1699309491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8afFZyFApKzkGarMxVVq1OXTM0wlMY94Gh0mDDe31+U=;
        b=oeoDtAhonoklHwB3yQ/klynu+b3S1h/FfWNJ1WpHUixBfLKMbKFO6Yyr1TF73+463V
         M6asahyB2gz9l29dS8chCxDNfhKs2rKrEtV6tgV1aVUjPTFUJ2MIRb91nA33tEi48Ct9
         f+Ymi/8MJxvSkvjdWbC7u0M33RThM2XRojWfjPynpsAe3UWYbo1o6IA+VEf1BoQkDJYh
         ypStJe7wxDtuw6zRxqYR1Y3cqyrOOQnRYjgacPNaM5gw9kARfxujp1nORwZltk4oTvHJ
         FBxlNte5QiSCFYeKL8IZhbFCjnFLRfnnrPmDi9aJ8bnaQGO1f0wcDRJjQbgaHwGZQtTF
         5QUQ==
X-Gm-Message-State: AOJu0Ywv3yljvCnR6aARtY6hL8iYxT59wyBZQI76eApG8GmILiJ8zo+o
	ZnbFN4FB4zJ8583IM3Z3xgrkT80Aj6s=
X-Google-Smtp-Source: AGHT+IGX4F80VGDhK2zmAo4T1eG5F9FyHxgO1EvyJPwF6llNOL/2g3posxp4/mODBwwSa70Fid3I2w==
X-Received: by 2002:a05:6a00:1894:b0:6b5:608d:64e1 with SMTP id x20-20020a056a00189400b006b5608d64e1mr9716232pfh.33.1698704690969;
        Mon, 30 Oct 2023 15:24:50 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::46eb])
        by smtp.gmail.com with ESMTPSA id s9-20020a056a00194900b006bd9422b279sm23843pfk.54.2023.10.30.15.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 15:24:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] emlog: Add PV
Date: Mon, 30 Oct 2023 15:24:48 -0700
Message-ID: <20231030222448.1474551-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Oct 2023 22:24:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105799

This is 0.70 release with few more commits on top.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/emlog/emlog.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/emlog/emlog.inc b/meta-oe/recipes-core/emlog/emlog.inc
index 0972aff32c..160a5a9f87 100644
--- a/meta-oe/recipes-core/emlog/emlog.inc
+++ b/meta-oe/recipes-core/emlog/emlog.inc
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 SRC_URI = "git://github.com/nicupavel/emlog.git;protocol=https;branch=master"
 SRCREV = "a9bbf324fde131ff4cf064e32674086c4ced4dca"
-
+PV = "0.70+git${SRCPV}"
 S = "${WORKDIR}/git"
 
 EXTRA_OEMAKE += " \
-- 
2.42.0


