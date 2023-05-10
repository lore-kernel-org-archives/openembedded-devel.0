Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3365C77B7C
	for <webhook@archiver.kernel.org>; Wed, 10 May 2023 15:00:49 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.19893.1683730840633516152
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 May 2023 08:00:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=DEZn64Zg;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1a516fb6523so68949895ad.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 May 2023 08:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683730840; x=1686322840;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WYYzbgElVNWukMZ/8BNxz+Pvb5M9Yrp29u1Pofu15Ek=;
        b=DEZn64ZgjIxqTKDUVloWSl50MeGCTDpAYwXac8Ba/vsuy4vC18RCbMLtTuFReSPGmu
         7RqBC8CTGkkhi48Z/YejJ5ObZYtc9zwEicP5RVTv0NmNgIky8iWgyWgTO/vOnKEYgHl2
         z4oP4lJYG/+e/KEp8O+q8f/jb46A0dhN/22+ENLDSARsFhpefEichP7IGgyF08qBuAgN
         QkFKTnpFpgKwU3EV6gWoSyAwl/D/cfcj04IR0jrMqDEzWJN2/9c4gG2Hz+ZhB5zxcay1
         DEFDJ5dazq8e6tOha9IfJoZ/8kY8OSC88qm3fDstbHNnuDX09Dxysa+pSFuWsZJrr0fk
         XPKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683730840; x=1686322840;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WYYzbgElVNWukMZ/8BNxz+Pvb5M9Yrp29u1Pofu15Ek=;
        b=OKNRBilYR6Z+jpBvlS42hrpLrRnC/oRu7J5JaMKJvSZYv7RR7UV0fTQVbnowtJVQUq
         +ph7yAa+NJLqJY6l96A/onEkXDvPutTzXcScYx++QZDLp0kKl9NIU2bPeodwoD919XKn
         9Ymw6ZmkJFcUyflRLytzHZYjNLz4u6P6tllUMmYw29/PsN8t/oKSmWUZ1wc9pAJ7igQ2
         bQ6SDYYkqAgaAA2iO79BrbzPKe477TOx8zCkvu/bJpQ3d4exwEk0kD8HHixdWyduSgIT
         JAp2IdO+erBV+HnH2Vmz9MIfa2Prpd1MU8dTzpb+bjupUClnrC98mnZo7GUX8oslOyH7
         oo5Q==
X-Gm-Message-State: AC+VfDwoOcNIrD8DheAgXbCEvOdxxcj/vBne5sRPur28F+fYF83K7a6y
	K5o96Y9qTOqrPLyeiPYz3+vJZO1RUsRQ/w==
X-Google-Smtp-Source: ACHHUZ6/DJt0go7knqGiHyszEwDotB0b4+XSBGBVpOiDmOrLvtmi6Psc/rbfj+5xrZ/Yojxl4aYr+A==
X-Received: by 2002:a17:902:cec9:b0:19a:a9d8:e47f with SMTP id d9-20020a170902cec900b0019aa9d8e47fmr25198282plg.36.1683730839634;
        Wed, 10 May 2023 08:00:39 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::298a])
        by smtp.gmail.com with ESMTPSA id y18-20020a17090322d200b001a1a82fc6d3sm3860238plg.268.2023.05.10.08.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 08:00:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] libpaper: Add recipe
Date: Wed, 10 May 2023 08:00:36 -0700
Message-Id: <20230510150037.3036472-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 May 2023 15:00:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102534

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/libpaper/libpaper_2.1.0.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-oe/recipes-support/libpaper/libpaper_2.1.0.bb

diff --git a/meta-oe/recipes-support/libpaper/libpaper_2.1.0.bb b/meta-oe/recipes-support/libpaper/libpaper_2.1.0.bb
new file mode 100644
index 0000000000..26f8fab200
--- /dev/null
+++ b/meta-oe/recipes-support/libpaper/libpaper_2.1.0.bb
@@ -0,0 +1,11 @@
+LICENSE = "LGPL-2.1-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+
+SRC_URI = "https://github.com/rrthomas/libpaper/releases/download/v${PV}/libpaper-${PV}.tar.gz"
+SRC_URI[sha256sum] = "474e9575e1235a0d8e3661f072de0193bab6ea1023363772f698a2cc39d640cf"
+
+inherit perlnative autotools
+
+EXTRA_AUTORECONF += "--install"
+
+BBCLASSEXTEND = "native"
-- 
2.40.1


