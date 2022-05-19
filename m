Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57346C433FE
	for <webhook@archiver.kernel.org>; Thu, 19 May 2022 13:18:39 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web08.7384.1652966315304731094
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 May 2022 06:18:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112
 header.b=V9ElKpWM;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.45,
 mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f45.google.com with SMTP id r30so7118564wra.13
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 May 2022 06:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wM7LrnlQ7QAEMV1QS5UnC0ApNl5alVDbIWmlgid4yVQ=;
        b=V9ElKpWMuoqdzG4RAaBrXAVWZlsTj/O7L4RUWdm3lrEGpg6xv5v8Wr4Lbc6vIIS2P6
         0Z9tkXCMi0SyCvr5uC8dYdPGil9eRcVg12p+6T1u2t7vsqPTnaCfpAP7/gJYgjqZNzqc
         r52YHEqxmqp0kxdoApp1AyVPrBPAj5tKMVuKlzHY9ochlg3v9H6REkdC/XcpReXFhhdX
         KS66dPuNNwKmX4k6osDObcZUzyMvM55ev34F1dTJjwdyG8qtdRKAuzG9Jx6FPz6Vi105
         nTrmaIlyvTclqIU8Qz+Fe24alnrRehs/35WOPcyoBD4+JfLAGedl05UXRh5xq501ltp4
         BtTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wM7LrnlQ7QAEMV1QS5UnC0ApNl5alVDbIWmlgid4yVQ=;
        b=w4ILc77X5kx0yjZ3Qb3aaZX4VUNqpFk1vVgRAsRztyRfsn4C9rDkeGGLjJ5EqqE+0m
         fVKSAyzQD3xWSXb+MKOZk2lZn53mRd8NnRNKD45uuLIL+9bnQ3unPcUW1Z0Hb362b99N
         PRCWkYAzli0YfwYp+WeXzncCGGFW5HYj1vitqL0Up1ytfvPWGPIqzzf609woTTeKT1Ut
         Xta+6RuebxX3d8pEnhUlJs1PuAurFU0l9IcmAVGfj2n4f2spBqZb2P0Q1j66+af/bk97
         FYIyE//Q5z7tpNM6Iinf2/T7gXfAdYdsMivJPBCcuxMyQS/e+AEfT+ZErfL5lwXvxhs0
         fJiQ==
X-Gm-Message-State: AOAM53164gW29UbUTh6MaDVZ4040LhTRdAYks0Od/s+4x02aeyJTcQCi
	MqYfSqiBWRi5TRkGmj2amOSxRg==
X-Google-Smtp-Source: 
 ABdhPJxz+NAjPEu37Wt9cXmZF8W3LAwKtGmhkFqFPun502t6/K5enHp+hjtXIzIpBb22NEfwK+zRPA==
X-Received: by 2002:adf:f7c3:0:b0:20e:2e5f:dabc with SMTP id
 a3-20020adff7c3000000b0020e2e5fdabcmr4223162wrq.657.1652966313691;
        Thu, 19 May 2022 06:18:33 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ca58:bf7f:d73d:ba32])
        by smtp.gmail.com with ESMTPSA id
 m4-20020adfa3c4000000b0020e6c51f070sm1672125wrb.112.2022.05.19.06.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 May 2022 06:18:33 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [meta-oe][PATCH 2/2] speedtest-cli: drop the recipe
Date: Thu, 19 May 2022 15:18:27 +0200
Message-Id: <20220519131827.166725-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220519131827.166725-1-brgl@bgdev.pl>
References: <20220519131827.166725-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 May 2022 13:18:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97196

This is the same project as the one in the python3-speedtest-cli recipe
in meta-python except that the other one is downloaded from pypi. Drop
this recipe.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 .../speedtest-cli/speedtest-cli_2.1.3.bb           | 14 --------------
 1 file changed, 14 deletions(-)
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-benchmark/speedtest-cli/speedtest-cli_2.1.3.bb

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-benchmark/speedtest-cli/speedtest-cli_2.1.3.bb b/meta-oe/dynamic-layers/meta-python/recipes-benchmark/speedtest-cli/speedtest-cli_2.1.3.bb
deleted file mode 100644
index df577b1b7..000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-benchmark/speedtest-cli/speedtest-cli_2.1.3.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-SUMMARY = "Command line interface for testing internet bandwidth using speedtest.net"
-AUTHOR = "Matt Martz"
-
-LICENSE="Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
-
-inherit setuptools3
-
-SRC_URI = "git://github.com/sivel/speedtest-cli.git;branch=master;protocol=https"
-SRCREV = "42e96b13dda2afabbcec2622612d13495a415caa"
-
-S = "${WORKDIR}/git"
-
-RDEPENDS:${PN} = "python3 python3-setuptools-scm"
-- 
2.34.1


