Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 556B8C433EF
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 06:25:56 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web09.3823.1639117554554610316
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Dec 2021 22:25:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=jRVk8ATx;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.46, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f46.google.com with SMTP id u3so16279178lfl.2
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Dec 2021 22:25:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xgAHi0IzCiCXcXbG7gNNdT0sHLZeohZ22Gw05xrGk10=;
        b=jRVk8ATxSZE5zdYoJoysEugohMrF1MAaBLtfnuuTWld63FTnQ7XyCLJt428EjTUKXJ
         Cs0UqLt/SnX/ZPjeTkn8opaB9x11+vA/daF0hCKtRUmW4pgvSfFHdW61g5VFK3joWM/T
         yVKmcB3hAj+/NvxkoKN4Tt6pARdlIs6sz3s5RQa/jkfsX5k4S/NTNDZNgU101rQkl1cv
         hEcigzNYhjC3mNJDuakhCYjWqz+6aPwG3eu226zTuI3L+I/u9q47qxDacuI66yql1NKr
         K8bN4SVNjHhl+R9ouGX6w+fm8ZISdhKnlo+s/lNk25gGmvixExR7U7RTN+qVf+Yto1mQ
         i9jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xgAHi0IzCiCXcXbG7gNNdT0sHLZeohZ22Gw05xrGk10=;
        b=uUyuVOdVlg8gPUfBQujzIooepXVqVLDTDE+IHeYKEy5AxJkMyefguqfcOiZQuavX1B
         +g/UFeILk8ym8GihIAArwnsDuBONTUO89CLGWrPiWEaywYWkzAb7y7gkTXPeZh3Zh8WD
         2D9NhWGdtX9TZJw0nm5uxlXSfuvAhzBbz8xBuAKOiHFfsGwOtVEmgMgWwdq7aa0bmQu8
         tdyA9S/GtGyVW1Xl7YgRf5XwjfhdfOcC+ALtyeE5TcMj7To0zgR4J97WYmKguL4Wh3wr
         wjUPoMIsCVJRjK5oden0JVbCzVVtHBYXLTinualRKH47Xyu+pzTZgAGWdHcVJ47qzGFN
         awtA==
X-Gm-Message-State: AOAM533E3WXV0G+lrrsuJM19VkxpkPXp1hErMp9zsu+M6Mwxc9gVeYNd
	R02R1R/8G292dKp4wbmIg8ef59HrmSdGf8B1
X-Google-Smtp-Source: 
 ABdhPJzNZHjRAMSQ4ykMH2XGQXSV7o6S1NcImoKaI9R3KwXW/diVvPlH1TABhclvFSu0eNm1hg0Qqg==
X-Received: by 2002:ac2:5966:: with SMTP id h6mr6878244lfp.358.1639117551699;
        Thu, 09 Dec 2021 22:25:51 -0800 (PST)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id
 p17sm211469ljm.138.2021.12.09.22.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 22:25:51 -0800 (PST)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: patrick.areny@notiloplus.com,
	Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-networking][PATCH] bmon: fix PV
Date: Fri, 10 Dec 2021 07:25:45 +0100
Message-Id: <20211210062545.1397481-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Dec 2021 06:25:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94269

The commit hash is pointing out to the tag v4.0, not 2.1.0.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../recipes-support/bmon/{bmon_2.1.0.bb => bmon_4.0.bb}           | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-networking/recipes-support/bmon/{bmon_2.1.0.bb => bmon_4.0.bb} (100%)

diff --git a/meta-networking/recipes-support/bmon/bmon_2.1.0.bb b/meta-networking/recipes-support/bmon/bmon_4.0.bb
similarity index 100%
rename from meta-networking/recipes-support/bmon/bmon_2.1.0.bb
rename to meta-networking/recipes-support/bmon/bmon_4.0.bb
-- 
2.25.1


