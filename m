Return-Path: <wickbergster@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2CB6C4345F
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 11:24:02 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web11.10438.1713353040138606017
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Apr 2024 04:24:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BTwzqXUl;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: wickbergster@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2da01cb187cso97042161fa.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 04:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713353038; x=1713957838; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3goaEY58hpijwxCE91HTj1AEkreV+9EA5HN7PyertiM=;
        b=BTwzqXUlVcJhhPJnKcyPIUfQwaywexTdR3P8hvghqeVehMVK+1Rl0kTGzocSLoSDy2
         L+yG8wGU4aKaei7pzqMQJwfHfrNmFAGWbPhkktRRKSnWUp3uRZlEWnrav5DmuUVHPQsE
         BYMbkVS8LjjZN/hx/66+48jGMoSJLxKUeCOXLmwiNB/5zJhzvSeIInVZ6+u3G7ZAW0OB
         ZmsM8E1hPwK03XKfhn4O2et1zjaD/ZJnnjdRTPemTCVRwme1CWZzLjMWq5UAujGJh3Lu
         pcSwnH3OJwC1MPZmjMJs2BwCm5KCOz6TP8fC7CdsmMZicBW/EJ1fuU0SiSEA2Og2f5d/
         gCvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713353038; x=1713957838;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3goaEY58hpijwxCE91HTj1AEkreV+9EA5HN7PyertiM=;
        b=Qzev94TmZILPrcOrQCQjp6sF6LkStwkpE8GXZKY20h/iu1GfCR1NOlJKxpwOd/O3kx
         hqzMY0RIHz7ZsPK6/Cq6FDM4Q/Hry8e/Mq2kDeUKyVe83sPhBuFmjZBLcbPx05llx1NI
         LpeyW+qPR1J1FMXR2cVvCkU6t9Mrd5m6IZd+cJKkxJ7mAgskKXP/mvDTtzZ9kGdRG9LV
         sc2dW/QAla/BcpQfYPQ7n6AtLAkBR73z+E4iLX8lQnpRmGSYbvF3/Is8jRGVWhfGWJv0
         Qr3Lj0x2X3RJIc6Hh8vi9T8M9NU0c16FiMa1Jiv7btjNjpLVZa15AEzDISfDK8DipiyP
         YT1A==
X-Gm-Message-State: AOJu0Yx12lCs0cbsWW5qHEHWjd5GLwrBxuvlaeAx+wacAUnL+5DfZF73
	P/GaGENx36B0aOCSYHIHdRfzUQ9qxffP1d97W8Q9ISBSiC62o7JGjYN7VA==
X-Google-Smtp-Source: AGHT+IGDtjlvOeVMFN+ypGjKMjo87xmaugqiu0UvbHDdMBfaxJ0UTHXnZ5whsQZbWCUVBdzIhmeMow==
X-Received: by 2002:a2e:7e0a:0:b0:2d8:39cf:5368 with SMTP id z10-20020a2e7e0a000000b002d839cf5368mr13297144ljc.29.1713353037820;
        Wed, 17 Apr 2024 04:23:57 -0700 (PDT)
Received: from localhost.localdomain (dyn-13-cust157.netit.se. [85.89.70.157])
        by smtp.gmail.com with ESMTPSA id d11-20020a2e330b000000b002d68abf446bsm1845169ljc.139.2024.04.17.04.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 04:23:57 -0700 (PDT)
From: Alexander Vickberg <wickbergster@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Vickberg <wickbergster@gmail.com>
Subject: [meta-networking][PATCH 1/2] Revert "nng: upgrade 1.5.2 -> 12"
Date: Wed, 17 Apr 2024 13:22:14 +0200
Message-Id: <20240417112215.2561234-1-wickbergster@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 11:24:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110040

This reverts commit 915b6c02ee43e2dee8c6b3132e7d47836d392168.

Mistake upgrade by AUH

Signed-off-by: Alexander Vickberg <wickbergster@gmail.com>
---
 .../recipes-connectivity/nanomsg/{nng_12.bb => nng_1.5.2.bb}      | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-networking/recipes-connectivity/nanomsg/{nng_12.bb => nng_1.5.2.bb} (100%)

diff --git a/meta-networking/recipes-connectivity/nanomsg/nng_12.bb b/meta-networking/recipes-connectivity/nanomsg/nng_1.5.2.bb
similarity index 100%
rename from meta-networking/recipes-connectivity/nanomsg/nng_12.bb
rename to meta-networking/recipes-connectivity/nanomsg/nng_1.5.2.bb
-- 
2.34.1


