Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE462C021A1
	for <webhook@archiver.kernel.org>; Sat, 14 Sep 2024 15:01:08 +0000 (UTC)
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com [209.85.167.67])
 by mx.groups.io with SMTP id smtpd.web10.96901.1726326061608713805
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Sep 2024 08:01:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=X3sOcpPz;
 spf=pass (domain: smile.fr, ip: 209.85.167.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-lf1-f67.google.com with SMTP id 2adb3069b0e04-53660856a21so1694173e87.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Sep 2024 08:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1726326059; x=1726930859; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=btb4o06xrE92L995maIjYRwI2fa6QdIF8rK4h66nOXw=;
        b=X3sOcpPzkmI3GZ8Q7ngBmpTB1QeMB+JY9NAoKaVX86ZDmR3/RFiiMKDqsrjq2VWINh
         nspX9wsm4iakB+QmuvW4rREuXaQMtQaMNDsubpmI+N8Zk436rWAcS158JOW2g2jGU+aa
         veh6IPZ8fpwo1HrTA+/QhpW1a/FH5l+8EaDmw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726326059; x=1726930859;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=btb4o06xrE92L995maIjYRwI2fa6QdIF8rK4h66nOXw=;
        b=B5XYtOctD+wdSrNB8zliyj6326+lfp2PV3WJBePdpGmbzqaSnyiONDzlkQ2dSotdR7
         EoJAjcYf3iyBIjYIfDNel+wutoQ9q6Um6ODQNDFuBC32YPuQ6JawkfABWzZX72+WunSN
         OSyZLzEXvkVOdf1XIa2r4qjuHpu5nY7J9E1KFrB80BDRwaoKxyhu1ov2tIjPArFUEZSq
         n2bFr/gETlfqm/CAFzNbWIiBQf72DhETYGD2wG4GtdOoNFRT3ADz8g2LS+OZe9+iN9es
         Vji1ZqmQijMw62Y81zlREAFC6S0lgyL/n3AzeNcUWdTYotUt/itViaqUGrjhlgajHi+M
         o8Vw==
X-Gm-Message-State: AOJu0YyHE+6Qr/tH0R096OV0X1V6IoGiMFBXHbXnYOUE6mMZgwu4EGYz
	5N8Fs/lcUxP/EBEEWHKnndqI8ziUXf+qgYSMA2cGBerApz7KUnzBCXtFyKqC7BJBo9eavQfkOUl
	XZdsuCw==
X-Google-Smtp-Source: AGHT+IHYfewMKRl4nE14rXNOzcOHWZaunYU29msps0v6eqIIHIJGaW/Ek0ZFDnrsjSZeN7qIHVz9Xg==
X-Received: by 2002:a05:6512:4006:b0:52e:7542:f471 with SMTP id 2adb3069b0e04-5367fee5b90mr3598193e87.29.1726326058417;
        Sat, 14 Sep 2024 08:00:58 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.local (53.1.159.89.rev.sfr.net. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5368704c23asm279075e87.73.2024.09.14.08.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Sep 2024 08:00:56 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Dmitry Baryshkov <dbaryshkov@gmail.com>
Subject: [meta-oe][PATCH] README.md: Hint at "git request-pull"
Date: Sat, 14 Sep 2024 17:00:48 +0200
Message-Id: <20240914150048.2213828-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 14 Sep 2024 15:01:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112288

From: Yoann Congal <yoann.congal@smile.fr>

Github pull requests are not recommended. When a Github contributor
wants to send patches from its repo, hint at "git request-pull"
generated emails to guide them on the right way.

Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-oe/README.md | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/README.md b/meta-oe/README.md
index 0e9d43c10f..c7c14a4507 100644
--- a/meta-oe/README.md
+++ b/meta-oe/README.md
@@ -26,7 +26,8 @@ to share your patches, this is preferred for patch sets consisting of more than
 
 Note, it is discouraged to send patches via GitHub pull request system. Such
 patches get less attention from developers and can be mishandled or not
-reviewed properly. Please use emails instead.
+reviewed properly. Please use emails instead. For exemple, you can use
+'git request-pull' to generate an email referencing your git repository.
 
 Other services like GitLab, repo.or.cz or self-hosted setups are of course accepted as well,
 'git fetch <remote>' works the same on all of them. We recommend GitHub because it is free, easy

