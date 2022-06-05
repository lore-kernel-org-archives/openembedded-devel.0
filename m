Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F2AFC43334
	for <webhook@archiver.kernel.org>; Sun,  5 Jun 2022 09:35:36 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web12.19046.1654421730589191893
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Jun 2022 02:35:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=m218wY00;
 spf=pass (domain: gmail.com, ip: 209.85.167.51,
 mailfrom: liu.ming50@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id u26so18351719lfd.8
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Jun 2022 02:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=augf61dd5rJlGUOsZNa7t06Kqm4ViwASRR6qpIlJ1NA=;
        b=m218wY00fuFVTC8EK8gpRS8IsJrCCVPNg145uZEwwL14UcOcM/sbU2kxL60AG7O/vB
         OsnvGaJVGdW1lT/49ASGT05qPkuUAe5lyCOcsgnEvb6H0Ru6/RWr+TWloJcNqsrgCUh8
         yMHxancAtS0+5jyGKhuk31d+hO8WdrqQM1ar3LHAzjdhY9quymc6wEoErwFzu9GiOJgz
         aaZepfEXbmLXWqCgIoFNS9yq+gU9SvQT9kOLVEfvjXHh+GO6ZShXy3UjAC9yZ9Fx6O6J
         opVJiOgqeKSAMlC8mLPGnwvM+gNGksf5SI8DZz/GxKHnbWkVTP4BHeqE/JaUgcgQp4kO
         RFKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=augf61dd5rJlGUOsZNa7t06Kqm4ViwASRR6qpIlJ1NA=;
        b=6uRCbG6Bgb+jJfurRjLD30akCE2KDjPLDW/f2tMPX+HdGHvaSewXggq+lPuu+h94lf
         WJpO8cRyO5lEMJKtjKQ17W9Ci2d/OZBAka6TWy1FuDbsYHIFv3MKwtB0y3gQw1mM7oxA
         UDWBPbtUwb/UyqAVJ7qtWohzqj48QQTHjeXK4QnAM8rsAMIVWfmFnh3Evjz6w8WYjoU0
         iRw2rC9XSHdxJQGTXrtzAaYUz8lq+hVpM3umAmXT4NWtCN2TxoFnRfoyiWVTGi+tpwq1
         Sh+6TxanKlWQmr18WAGChUvJ+dE08GoGfSldfouWGlCzthov+7LGidRHswiP03rah/gJ
         ChrA==
X-Gm-Message-State: AOAM531BJI06IGVCvfJ3tr3vBbfy6lC/niFFINNLerzAsE9m6MoAe0GR
	TrRKmMCYfMhEcUZeKMG7IQd1BamnSCI=
X-Google-Smtp-Source: 
 ABdhPJyhoV+P+hlTOYpD0JKsyTcQupDdkPuZAsGxwFPh4alQR2pBTW0s+LP7wSdYhM0Xppi0UzKo/A==
X-Received: by 2002:a05:6512:1047:b0:479:2308:ac0b with SMTP id
 c7-20020a056512104700b004792308ac0bmr4726265lfb.167.1654421727942;
        Sun, 05 Jun 2022 02:35:27 -0700 (PDT)
Received: from peterliu-Precision-7530.emea.group.atlascopco.com
 ([2a00:801:230:9439:c99c:5ab4:c8e9:1c0a])
        by smtp.gmail.com with ESMTPSA id
 g28-20020a2eb5dc000000b00253dfbe2522sm2015349ljn.100.2022.06.05.02.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 02:35:27 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [meta-multimedia] [PATCH V1 0/1] bluealsa: uprev to 4.0.0
Date: Sun,  5 Jun 2022 11:35:21 +0200
Message-Id: <20220605093522.30964-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Jun 2022 09:35:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97412

From: Ming Liu <liu.ming50@gmail.com>

Changes in V1:

1 Fix a license file checksum issue

Ming Liu (1):
  bluealsa: uprev to 4.0.0

 .../bluealsa/bluealsa_git.bb                  | 69 +++++++++++++------
 1 file changed, 48 insertions(+), 21 deletions(-)

-- 
2.25.1


