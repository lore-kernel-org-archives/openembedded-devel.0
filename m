Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D0E6EA8539
	for <webhook@archiver.kernel.org>; Sun,  8 Mar 2026 17:26:35 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43511.1772990792562939336
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Mar 2026 10:26:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BmT8CWK2;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-439ce3605ecso2549471f8f.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Mar 2026 10:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772990791; x=1773595591; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=fX+nCzFW1zhJWnMPIKaOrRSd7cDWI2Yxl3AtAhmiWnA=;
        b=BmT8CWK2hnXc45IrGH+xz2vJdLAL66u1rK/jg5CO6sUdHaRXrpVTj+13UQ+K54We7P
         wVvHRdGtHh8MJq4EhQ/r8T6/g/6QuJh54UrY0hw8aIH8gBN8uK/21tiKFHb1OlPL0w+F
         Ypm9O74XKzcOB5XE4No6P7cX4nImu2bo6VysNbWseu88DNRww3lwHFnt/emhblo1b8ji
         stL5DsaF0TldhHK1nCN4mwUXp73FfW/7s8YxvHtDaTInfVYOtvbd2TQWUWSKpNo8G9JX
         UUFhX4SLfh/3cKNPVfcZk8OUy43RvsGR2BGVePrK8kGBoCXrA5F78bzQVk1eqQdPJfFc
         spQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772990791; x=1773595591;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fX+nCzFW1zhJWnMPIKaOrRSd7cDWI2Yxl3AtAhmiWnA=;
        b=mPeV0UlVlYW2fpM63vq6aIbiQKEJmnvv+kEeyuvjQR5Z8LSj1q8X4tx2zOo/D8tsT+
         oTBWkR7G6i6GvVbu/AjcFMh5f+/SLZ4pW4VPbHBOaYAfhp/64BJWfXocJKSrQf9/WNk3
         G7T6RCrY4wJhcr9MGP4ZZWAB6Ba2/e9IN7ArFQ+f+Ew6vz64XmkXTfOkWHj0zyo03IdK
         kg77aYcDAiRwS1mGsZbLJ3vfBsZZpTmR9B8D41eU9+SoTnpYDntpWm+k5zkKFkKTJc4I
         5NqHGYx40hy0UnDwrYFyqm1NTaENAsNN8Z5yRYL7X+9dURWyG9NBAl4n5Xfv6sQTM9ph
         kRGA==
X-Gm-Message-State: AOJu0YzYZ15ebgZ8QLxOxNtuIXpwqARFQCnmrajLWJmGF6lNi2rzdAKF
	mVyjMx8KH2tsh0m809jRSpUUFRB+FDKA3/Dmp5dFuQN0lRToHc1c6ZbGv+n2nA==
X-Gm-Gg: ATEYQzxEAgK/vhjK5bUs4LVKhsai0ar7DEJNRaIW6NK8DHUDyfHGVmVAmBSIP5RyuBs
	LFdSLeynF3PmHjsiLeg3fbR0YUJbeD/tJjIgmLFKHLxMucWwfW01S0Xfs4a6/PJcVz6Nunw0ebG
	Qg6Qh8ihznuZUNkp7uJwjEUmsft6PHcEk6WJk+Rbe6Jjvjz4qWI606TE7cwy7YoEtJYbxD+KUFG
	9MZ7bixhmkDTiELmBj7ZdRYOgEXBNnoMV8j+aNDN9EFIFdBjBq9+Kvkzd+Rl7KQgN6qJZ1eZltD
	rpSj2zuSCyEhqFwED+WhSpn+Pn0Av4VAIphTYVaDUvR7kGN692DQ1vii/e4ZwOLolMtBPlALwd+
	/+yBJUoaSIG3DAqYHVHtethlVKgME514yjCvNdS8R/MirysIvGcNEmCE7IFpRYmN2NjOFQDIp7v
	3lhqRaGzumrQSuWM8yZgWZ
X-Received: by 2002:a05:6000:2207:b0:439:bc31:a05a with SMTP id ffacd0b85a97d-439da8954f0mr14345970f8f.43.1772990790605;
        Sun, 08 Mar 2026 10:26:30 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae3a20fsm19923246f8f.28.2026.03.08.10.26.29
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 10:26:30 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] python3-protobuf: mark CVE-2026-0994 patched
Date: Sun,  8 Mar 2026 18:26:29 +0100
Message-ID: <20260308172629.3559131-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Mar 2026 17:26:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124943

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-0994

It is fixed already in the currently used version, however NVD tracks
it without any version info, so it still shows up in CVE reports.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-protobuf_6.33.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_6.33.5.bb b/meta-python/recipes-devtools/python/python3-protobuf_6.33.5.bb
index af30165f81..af9ff85f20 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_6.33.5.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_6.33.5.bb
@@ -13,6 +13,7 @@ inherit pypi setuptools3
 SRC_URI[sha256sum] = "6ddcac2a081f8b7b9642c09406bc6a4290128fce5f471cddd165960bb9119e5c"
 
 CVE_PRODUCT += "google:protobuf protobuf:protobuf google-protobuf protobuf-python"
+CVE_STATUS[CVE-2026-0994] = "fixed-version: it is fixed in 6.33.5"
 
 # http://errors.yoctoproject.org/Errors/Details/184715/
 # Can't find required file: ../src/google/protobuf/descriptor.proto

