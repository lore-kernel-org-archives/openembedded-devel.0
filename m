Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7AEDC433F5
	for <webhook@archiver.kernel.org>; Mon,  2 May 2022 14:33:49 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web08.11428.1651502029042986027
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 May 2022 07:33:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dQ6tTbCN;
 spf=pass (domain: gmail.com, ip: 209.85.215.182,
 mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id r83so11843603pgr.2
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 May 2022 07:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4e7KU2SL0wMXQyXib3zr0XKx+4oh/E5Kou1gemAEUU8=;
        b=dQ6tTbCNNe2qRbtcUnPzT1KzGBJcI8U6taK0t2Llb1/ABMx+s6ka8WH/BBYINS+sCr
         ysYTzYJE1BXRnkIY4VhFZuma1ruJ94oo3zsFmawt26QMYVSy2spJ3zjoSLCGsJUFmztz
         nw7Sv7HtEWOWtK78RaXe2YBXtguuIshxuMHcF+nvZyNIXRILyk3OTcwPjs1Tn1wn+H3s
         PkwKJuftTQuRt8BjYVahujSiUrGa1cXLq03j/BqOjTELineOP55w4xowV+Obtxx4dzBL
         UiHq1qedU1UWQSs8PczxVzuIsZdq9wj3zkuWXbMbxU5Mn5cq8KIK+m7wkibHmdpAwH2h
         kJgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4e7KU2SL0wMXQyXib3zr0XKx+4oh/E5Kou1gemAEUU8=;
        b=MAH7Nxz9L/4RDLqu3/in+Fu2N0aURbnND6DzbhCOjqQj+eM+VY+/f3Jg6d8H8sY4HN
         eksojVQnIF6ijihFddUCeWUQjmFmtbmd59JmrWMvwPQKZvRp/iWCldHvfWfTPEghx60F
         KazOMFFw6yt38/M81JQXpyq8icnHxYSy6JHLBeJPLUdgkpmXgqqApCp7kz/rl753/yp6
         BHDhV8vF6DtUV7q83K4leXt25w24Z5PBpHoVIbFs9v0EzPiQwOsZM/ktTs+U6Oj5o8DB
         ACIS/ZqNestSa4mxEsgkpHAZc4m63t2lHm6jheD8s+tezUN9H5NhfQQlt8gY776Lrutz
         tqKg==
X-Gm-Message-State: AOAM5333eWULDhGkXYtgDbhiMSRV8uZEkyqX0qVM+2BlGG303J/P1buI
	mDzr1PFp23PleSR9bZo8ZNyStYkOJhUWHw==
X-Google-Smtp-Source: 
 ABdhPJzX228T6fGrYkkw72sa1kbVcJfR2iL+ehbXCmX/RD5vF/jS+FIrsEnmSYryNHM9E6X2WBYfvA==
X-Received: by 2002:a63:de12:0:b0:3ab:7c33:2894 with SMTP id
 f18-20020a63de12000000b003ab7c332894mr9971467pgg.187.1651502028038;
        Mon, 02 May 2022 07:33:48 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:33c6:b9d3:2a7b:1418])
        by smtp.gmail.com with ESMTPSA id
 i14-20020a17090332ce00b0015e8d4eb1f0sm4785518plr.58.2022.05.02.07.33.46
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 07:33:46 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][v2][PATCH 01/10] crda: move to a dynamic-layer for python
Date: Mon,  2 May 2022 07:33:36 -0700
Message-Id: <20220502143345.1500852-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 May 2022 14:33:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96930

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../crda/crda/0001-Make-alpha2-to-be-3-characters-long.patch      | 0
 .../crda/crda/0001-Makefile-respect-LDFLAGS-for-libreg.patch      | 0
 .../recipes-connectivity/crda/crda/crda-4.14-python-3.patch       | 0
 .../crda/crda/do-not-run-ldconfig-if-destdir-is-set.patch         | 0
 .../crda/crda/fix-gcc-6-unused-variables.patch                    | 0
 .../crda/crda/fix-issues-when-USE_OPENSSL-1.patch                 | 0
 .../crda/crda/fix-linking-of-libraries-used-by-reglib.patch       | 0
 .../meta-python}/recipes-connectivity/crda/crda/make.patch        | 0
 .../crda/crda/use-target-word-size-instead-of-host-s.patch        | 0
 .../meta-python}/recipes-connectivity/crda/crda_3.18.bb           | 0
 10 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-networking/{ => dynamic-layers/meta-python}/recipes-connectivity/crda/crda/0001-Make-alpha2-to-be-3-characters-long.patch (100%)
 rename meta-networking/{ => dynamic-layers/meta-python}/recipes-connectivity/crda/crda/0001-Makefile-respect-LDFLAGS-for-libreg.patch (100%)
 rename meta-networking/{ => dynamic-layers/meta-python}/recipes-connectivity/crda/crda/crda-4.14-python-3.patch (100%)
 rename meta-networking/{ => dynamic-layers/meta-python}/recipes-connectivity/crda/crda/do-not-run-ldconfig-if-destdir-is-set.patch (100%)
 rename meta-networking/{ => dynamic-layers/meta-python}/recipes-connectivity/crda/crda/fix-gcc-6-unused-variables.patch (100%)
 rename meta-networking/{ => dynamic-layers/meta-python}/recipes-connectivity/crda/crda/fix-issues-when-USE_OPENSSL-1.patch (100%)
 rename meta-networking/{ => dynamic-layers/meta-python}/recipes-connectivity/crda/crda/fix-linking-of-libraries-used-by-reglib.patch (100%)
 rename meta-networking/{ => dynamic-layers/meta-python}/recipes-connectivity/crda/crda/make.patch (100%)
 rename meta-networking/{ => dynamic-layers/meta-python}/recipes-connectivity/crda/crda/use-target-word-size-instead-of-host-s.patch (100%)
 rename meta-networking/{ => dynamic-layers/meta-python}/recipes-connectivity/crda/crda_3.18.bb (100%)

diff --git a/meta-networking/recipes-connectivity/crda/crda/0001-Make-alpha2-to-be-3-characters-long.patch b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/0001-Make-alpha2-to-be-3-characters-long.patch
similarity index 100%
rename from meta-networking/recipes-connectivity/crda/crda/0001-Make-alpha2-to-be-3-characters-long.patch
rename to meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/0001-Make-alpha2-to-be-3-characters-long.patch
diff --git a/meta-networking/recipes-connectivity/crda/crda/0001-Makefile-respect-LDFLAGS-for-libreg.patch b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/0001-Makefile-respect-LDFLAGS-for-libreg.patch
similarity index 100%
rename from meta-networking/recipes-connectivity/crda/crda/0001-Makefile-respect-LDFLAGS-for-libreg.patch
rename to meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/0001-Makefile-respect-LDFLAGS-for-libreg.patch
diff --git a/meta-networking/recipes-connectivity/crda/crda/crda-4.14-python-3.patch b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/crda-4.14-python-3.patch
similarity index 100%
rename from meta-networking/recipes-connectivity/crda/crda/crda-4.14-python-3.patch
rename to meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/crda-4.14-python-3.patch
diff --git a/meta-networking/recipes-connectivity/crda/crda/do-not-run-ldconfig-if-destdir-is-set.patch b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/do-not-run-ldconfig-if-destdir-is-set.patch
similarity index 100%
rename from meta-networking/recipes-connectivity/crda/crda/do-not-run-ldconfig-if-destdir-is-set.patch
rename to meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/do-not-run-ldconfig-if-destdir-is-set.patch
diff --git a/meta-networking/recipes-connectivity/crda/crda/fix-gcc-6-unused-variables.patch b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/fix-gcc-6-unused-variables.patch
similarity index 100%
rename from meta-networking/recipes-connectivity/crda/crda/fix-gcc-6-unused-variables.patch
rename to meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/fix-gcc-6-unused-variables.patch
diff --git a/meta-networking/recipes-connectivity/crda/crda/fix-issues-when-USE_OPENSSL-1.patch b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/fix-issues-when-USE_OPENSSL-1.patch
similarity index 100%
rename from meta-networking/recipes-connectivity/crda/crda/fix-issues-when-USE_OPENSSL-1.patch
rename to meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/fix-issues-when-USE_OPENSSL-1.patch
diff --git a/meta-networking/recipes-connectivity/crda/crda/fix-linking-of-libraries-used-by-reglib.patch b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/fix-linking-of-libraries-used-by-reglib.patch
similarity index 100%
rename from meta-networking/recipes-connectivity/crda/crda/fix-linking-of-libraries-used-by-reglib.patch
rename to meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/fix-linking-of-libraries-used-by-reglib.patch
diff --git a/meta-networking/recipes-connectivity/crda/crda/make.patch b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/make.patch
similarity index 100%
rename from meta-networking/recipes-connectivity/crda/crda/make.patch
rename to meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/make.patch
diff --git a/meta-networking/recipes-connectivity/crda/crda/use-target-word-size-instead-of-host-s.patch b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/use-target-word-size-instead-of-host-s.patch
similarity index 100%
rename from meta-networking/recipes-connectivity/crda/crda/use-target-word-size-instead-of-host-s.patch
rename to meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/use-target-word-size-instead-of-host-s.patch
diff --git a/meta-networking/recipes-connectivity/crda/crda_3.18.bb b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda_3.18.bb
similarity index 100%
rename from meta-networking/recipes-connectivity/crda/crda_3.18.bb
rename to meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda_3.18.bb
-- 
2.25.1


